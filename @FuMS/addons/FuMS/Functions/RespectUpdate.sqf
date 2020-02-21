// RespectUpdate.sqf
// Horbin
// 10/12/15
// This code HEAVILY sourced from Face's A3XAI to provide commonality in messaging on servers with both mods in operation.
private ["_killer", "_victim", "_killerRespectPoints", "_fragAttributes", "_killerPlayerUID", "_lastKillAt", "_vehicleKiller", "_killStack", 
"_distance", "_distanceBonus", "_overallRespectChange", "_newKillerScore", "_killMessage", "_newKillerFrags"];
FuMS_enableRespectRewards = true;
FuMS_enableDeathMessages = true;

_killer 	= _this select 0;
_victim 	= _this select 1;
_player     = _this select 2;
_amount		= _this select 3;

diag_log format ["<FuMS> RespectUpdate : Killer:%1 Victim:%2 Player:%3 Amount:%4",_killer, _victim, _player, _amount];

_fragAttributes = [];
_killerPlayerUID = getPlayerUID _killer;
_vehicleKiller = (vehicle _killer);
_usingExile = true;				   

{
	if ((getPlayerUID _x) isEqualTo _killerPlayerUID) exitWith {
		_killer = _x;
	};
} forEach (crew _vehicleKiller);

if (FuMS_enableRespectRewards) then
{
	_killerRespectPoints = [];
	// If this IS the killer, give him credit.
	if (_vehicleKiller isEqualTo _player) then
	{
		diag_log format ["<FuMS> RespectUpdate : %1 is the Killer",_player];
		
		if (currentWeapon _killer isEqualTo "Exile_Melee_Axe") then
		{
			if (_amount > 0) then {
				_fragAttributes pushBack "Humiliation";
				_killerRespectPoints pushBack ["HUMILIATION", 5*_amount];
				_newKillerFrags = _player getVariable ["ExileKills", 0];
				_player setVariable ["ExileKills", _newKillerFrags + 1];

				if (_usingExile) then
				{
					format["addAccountKill:%1", _killerPlayerUID] call ExileServer_system_database_query_fireAndForget;
				};
			};
		} else 
		{
			if (_amount > 0) then 
			{				
				_fragAttributes pushBack "ENEMY AI FRAGGED";				
				_killerRespectPoints pushBack ["ENEMY AI FRAGGED", _amount];
				_newKillerFrags = _player getVariable ["ExileKills", 0];
				_player setVariable ["ExileKills", _newKillerFrags + 1];

				if (_usingExile) then
				{
					format["addAccountKill:%1", _killerPlayerUID] call ExileServer_system_database_query_fireAndForget;
				};
				
				_lastKillAt = _player getVariable ["FuMS_LastKillAt", 0];
				_killStack = _player getVariable ["FuMS_KillStack", 0];
				if (isNil "_lastKillAt") then {_lastKillAt = 10000;};
				if (isNil "_killStack") then {_killStack = 0;};
	
				if ((diag_tickTime - _lastKillAt) < (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "killStreakTimeout"))) then 
				{
					if (_amount > 0) then
					{
						_killStack = _killStack + 1;
						_fragAttributes pushBack (format ["%1x Kill Streak", _killStack]);
						_killerRespectPoints pushBack [(format ["%1x KILL STREAK", _killStack]), _killStack * _amount / 10];
					};
				} 
				else 
				{
					_killStack = 1;
				};
				_player setVariable ["FuMS_KillStack", _killStack];
				_player setVariable ["FuMS_LastKillAt", diag_tickTime];
	
				_distance = floor (_victim distance _player);
				_fragAttributes pushBack (format ["%1m Distance", _distance]);
				_distanceBonus = ((floor (_distance / 100)) * _amount /10 );
				if (_distanceBonus > 0) then 
				{
					_killerRespectPoints pushBack [(format ["%1m RANGE BONUS", _distance]), _distanceBonus];
				};					
			}
			else
			{
				if (_amount < 0) then
				{
					_fragAttributes pushBack "FRIENDLY MURDERED";
					_killerRespectPoints pushBack ["FRIENDLY MURDERED", _amount];
				};
			}
		};
		if (FuMS_enableDeathMessages) then 
		{
			_killMessage = format ["%1 was killed by %2", name _victim , (name _killer)];
			if !(_fragAttributes isEqualTo []) then 
			{
				_killMessage = _killMessage + " (";
				{
					if (_forEachIndex > 0) then 
					{
						_killMessage = _killMessage + ", ";
					};
					_killMessage = _killMessage + _x;
				} forEach _fragAttributes;
				_killMessage = _killMessage + ")";
			};
	
			{
				if (isPlayer _x) then 
				{

					if (_usingExile) then
					{
						[_x, "systemChatRequest", [_killMessage]] call FuMS_sendExileMessage;
					};
					//["system","::",_killMessage] call FrSB_fnc_announce;
				};
			} count (units (group _killer));
		};
	}
	else 
	{
	// Else it is NOT the killer, but should get some group credit!	
		diag_log format ["<FuMS> RespectUpdate : %1 is NOT the Killer. %2 is the killer",_player, _killer];
		_fragAttributes pushBack "Group Respect";				
		_killerRespectPoints pushBack ["Group Respect", _amount / 10];	
		if (_amount > 0) then 
		{
			_player setVariable ["FuMS_LastKillAt", diag_tickTime];
		};				
	};
	
	
	diag_log format ["<FuMS> RespectUpdate : _killerRespectPoints = %1",_killerRespectPoints];
	_overallRespectChange = 0;
	{
		_overallRespectChange = _overallRespectChange + (_x select 1);
	} forEach _killerRespectPoints;

	if (_overallRespectChange != 0) then 
	{
		_player addRating _amount;
		diag_log format ["<FuMS> RespectUpdate : New ArmA Rating:%1",rating _player];

		
		

		if (_usingExile) then
		{
			_newKillerScore = _player getVariable ["ExileScore", 0];
			_newKillerScore = _newKillerScore + _overallRespectChange;
			_player setVariable ["ExileScore", _newKillerScore];
			
			format["setAccountScore:%1:%2", _newKillerScore,GetPlayerUID _player] call ExileServer_system_database_query_fireAndForget;
			[_player, "showFragRequest", [_killerRespectPoints]] call FuMS_sendExileMessage;
		};
	};
			
	//EXILE

	if (_usingExile) then
	{
		player call ExileServer_object_player_sendStatsUpdate;
	};
};
true
