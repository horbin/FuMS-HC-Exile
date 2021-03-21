#include "\A3XAI\globaldefines.hpp"

private ["_unitGroup", "_unitLevel", "_unitType", "_unitTypeRef", "_vehicle", "_stuckCheckTime", "_groupLeadMarker", "_groupWPMarker", "_fncArray", "_fnc_execEveryLoop", "_fnc_checkUnits", 
"_fnc_generateLoot", "_fnc_vehicleAmmoFuelCheck", "_fnc_antistuck", "_currentTime", "_managerStartTime", "_updateServerLoot", "_pullRate", "_markname", "_mark", "_markername", "_unitPos", 
"_unitMarker", "_lootPool", "_result", "_debugStartTime"];

_unitGroup = _this select 0;
_unitLevel = _this select 1;

if (_unitGroup getVariable ["isManaged",false]) exitWith {};
_unitGroup setVariable ["isManaged",true];

_unitType = (_unitGroup getVariable ["unitType",""]);
_unitTypeRef = _unitType;
_vehicle = if (_unitType in ["air","land","aircustom","landcustom","air_reinforce","uav","ugv"]) then {_unitGroup getVariable ["assignedVehicle",(assignedVehicle (leader _unitGroup))]} else {objNull};

_unitGroup setVariable ["antistuckPos",(getWPPos [_unitGroup,(currentWaypoint _unitGroup)])];
if (isNil {_unitGroup getVariable "GroupSize"}) then {_unitGroup setVariable ["GroupSize",(count (units _unitGroup))]};
_stuckCheckTime = _unitType call A3XAI_getAntistuckTime;

//set up debug variables
_groupLeadMarker = "";
_groupWPMarker = "";

//Set up local functions
_fncArray = [_unitGroup,_unitType] call A3XAI_getLocalFunctions;
_fnc_execEveryLoop = _fncArray select 0;
_fnc_checkUnits = _fncArray select 1;
_fnc_generateLoot = _fncArray select 2;
_fnc_vehicleAmmoFuelCheck = _fncArray select 3;
_fnc_antistuck = _fncArray select 4;

//Set up timer variables
_currentTime = diag_tickTime;
_managerStartTime = _currentTime;
_unitGroup setVariable ["lastRearmTime",_currentTime];
_unitGroup setVariable ["antistuckTime",_currentTime];
_unitGroup setVariable ["lootGenTime",_currentTime];

//Setup loot variables
_updateServerLoot = (A3XAI_enableHC && {!isDedicated});
_pullRate = 30;

if (isDedicated) then {
	[_unitGroup,_unitType,_unitLevel] call A3XAI_setLoadoutVariables;
	
	if (A3XAI_enableDebugMarkers) then {
		_groupLeadMarker = format ["%1_Lead",_unitGroup];
		if (_groupLeadMarker in allMapMarkers) then {deleteMarker _groupLeadMarker; uiSleep 0.5};	//Delete the previous marker if it wasn't deleted for some reason.
		_groupLeadMarker = createMarker [_groupLeadMarker,getPosATL (leader _unitGroup)];
		_groupLeadMarker setMarkerType "mil_warning";
		_groupLeadMarker setMarkerBrush "Solid";

		if (isNull _vehicle) then {
			_groupLeadMarker setMarkerText format ["%1 (AI L%2)",_unitGroup,_unitLevel];
		} else {
			_groupLeadMarker setMarkerText format ["%1 (AI L%2 %3)",_unitGroup,_unitLevel,(typeOf (vehicle (leader _unitGroup)))];
		};
		
		_groupWPMarker = (format ["%1_WP",_unitGroup]);
		if (_groupWPMarker in allMapMarkers) then {deleteMarker _groupWPMarker; uiSleep 0.5;};	//Delete the previous marker if it wasn't deleted for some reason.
		_groupWPMarker = createMarker [_groupWPMarker,(getWPPos [_unitGroup,(currentWaypoint _unitGroup)])];
		_groupWPMarker setMarkerText format ["%1 Waypoint",_unitGroup];
		_groupWPMarker setMarkerType "Waypoint";
		_groupWPMarker setMarkerColor "ColorBlue";
		_groupWPMarker setMarkerBrush "Solid";
		
		[_unitGroup] spawn {
			_unitGroup = _this select 0;
			{
				_markname = str(_x);
				if (_markname in allMapMarkers) then {deleteMarker _markname; uiSleep 0.5};
				_mark = createMarker [_markname,getPosATL _x];
				_mark setMarkerShape "ELLIPSE";
				_mark setMarkerType "Dot";
				_mark setMarkerColor "ColorRed";
				_mark setMarkerBrush "SolidBorder";
				_nul = _x spawn {
					_markername = str (_this);
					_unitGroup = group _this;
					while {alive _this} do {
						if (local _this) then {
							_unitPos = getPosATL _this;
							if ((leader _unitGroup) isEqualTo _this) then {
								(format ["%1_Lead",_unitGroup]) setMarkerPos _unitPos;
								_color = call {
									_combatMode = (combatMode _unitGroup);
									if (_combatMode isEqualTo "YELLOW") exitWith {"ColorBlack"};
									if (_combatMode isEqualTo "RED") exitWith {"ColorRed"};
									if (_combatMode isEqualTo "BLUE") exitWith {"ColorBlue"};
									"ColorBlack"
								};
								(format ["%1_Lead",_unitGroup]) setMarkerColor _color; 
								(format ["%1_WP",_unitGroup]) setMarkerPos (getWPPos [_unitGroup,(currentWaypoint _unitGroup)]);
							};
							_markername setMarkerPos _unitPos;
						};
						uiSleep 10;
					};
					deleteMarker _markername;
				};
			} forEach (units _unitGroup);
		};
	};
	
} else {
	waitUntil {uiSleep 0.25; (local _unitGroup)};
	[_unitGroup,_unitType,_unitLevel] call A3XAI_setLoadoutVariables_HC;
	
	if (A3XAI_enableDebugMarkers) then {
		{
			_nul = _x spawn {
				waitUntil {sleep 5; ((local _this) or {!(alive _this)})};
				_unitMarker = str (_this);
				_unitGroup = group _this;
				while {alive _this} do {
					if (local _this) then {
						_unitPos = getPosATL _this;
						if ((leader _unitGroup) isEqualTo _this) then {
							(format ["%1_Lead",_unitGroup]) setMarkerPos _unitPos;
							_color = call {
								_combatMode = (combatMode _unitGroup);
								if (_combatMode isEqualTo "YELLOW") exitWith {"ColorBlack"};
								if (_combatMode isEqualTo "RED") exitWith {"ColorRed"};
								if (_combatMode isEqualTo "BLUE") exitWith {"ColorBlue"};
								"ColorBlack"
							};
							(format ["%1_Lead",_unitGroup]) setMarkerColor _color; 
							(format ["%1_WP",_unitGroup]) setMarkerPos (getWPPos [_unitGroup,(currentWaypoint _unitGroup)]);
						};
						_unitMarker setMarkerPos _unitPos;
					};
					uiSleep 10;
				};
			};
		} forEach (units _unitGroup);
	};

	if (A3XAI_debugLevel > 1) then {
		_lootPool = _unitGroup getVariable ["LootPool",[]];
		//diag_log format ["Debug: Found loot pool for group %1 from server: %2",_unitGroup,_lootPool];
	};
};

//Main loop
while {(!isNull _unitGroup) && {(_unitGroup getVariable ["GroupSize",-1]) > 0}} do {
	_unitType = (_unitGroup getVariable ["unitType",""]);
	if !(_unitType isEqualTo _unitTypeRef) then {
		_fncArray = [_unitGroup,_unitType] call A3XAI_getLocalFunctions;
		_fnc_execEveryLoop = _fncArray select 0;
		_fnc_checkUnits = _fncArray select 1;
		_fnc_generateLoot = _fncArray select 2;
		_fnc_vehicleAmmoFuelCheck = _fncArray select 3;
		_fnc_antistuck = _fncArray select 4;
		_stuckCheckTime = _unitType call A3XAI_getAntistuckTime;
		
		if (A3XAI_debugLevel > 1) then {diag_log format ["A3XAI Debug: Reassigned group %1 type from %2 to %3.",_unitGroup,_unitTypeRef,_unitType];};
		
		_unitTypeRef = _unitType;
	};

	[_unitGroup,_vehicle] call _fnc_execEveryLoop;
	
	[_unitGroup] call _fnc_checkUnits;

	//Generate loot
	if ((diag_tickTime - (_unitGroup getVariable ["lootGenTime",diag_tickTime])) > _pullRate) then {
		[_unitGroup,_unitLevel] call _fnc_generateLoot;
	};
	
	//Vehicle ammo/fuel check
	if ((alive _vehicle) && {(diag_tickTime - (_unitGroup getVariable ["lastRearmTime",0])) > 180}) then {	//If _vehicle is objNull (if no vehicle was assigned to the group) then nothing in this bracket should be executed
		[_unitGroup,_vehicle] call _fnc_vehicleAmmoFuelCheck;
	};
	
	//Antistuck 
	if ((diag_tickTime - (_unitGroup getVariable ["antistuckTime",diag_tickTime])) > _stuckCheckTime) then {
		[_unitGroup,_vehicle,_stuckCheckTime] call _fnc_antistuck;
	};

	if (A3XAI_HCIsConnected && {_unitGroup getVariable ["HC_Ready",false]} && {(diag_tickTime - _managerStartTime) > 30}) then {
		private ["_result"];
		_result = _unitGroup call A3XAI_transferGroupToHC;
		if (_result) then {
			waitUntil {sleep 1.5; (!(local _unitGroup) or {isNull _unitGroup})};
			if (A3XAI_debugLevel > 0) then {diag_log format ["A3XAI Debug: Transferred ownership of %1 group %2 to HC %3.",_unitType,_unitGroup,A3XAI_HCObjectOwnerID];};
			waitUntil {sleep 15; ((local _unitGroup) or {isNull _unitGroup})};
			if ((_unitGroup getVariable ["GroupSize",-1]) > 0) then {
				_currentTime = diag_tickTime;
				_unitGroup call A3XAI_initNoAggroStatus;
				_unitGroup setVariable ["lastRearmTime",_currentTime];
				_unitGroup setVariable ["antistuckTime",_currentTime];
				_unitGroup setVariable ["lootGenTime",_currentTime];
			};
			if (A3XAI_debugLevel > 1) then {diag_log format ["A3XAI Debug: %1 group %2 ownership was returned to server.",(_unitGroup getVariable ["unitType",_unitType]),_unitGroup];};
		} else {
			if (A3XAI_debugLevel > 1) then {diag_log format ["A3XAI Debug: Waiting to transfer %1 group %2 ownership to headless client (ID: %3).",_unitType,_unitGroup,A3XAI_HCObjectOwnerID];};
		};
	};
	
	if (isDedicated) then {
		if !((groupOwner _unitGroup) in [2,A3XAI_HCObjectOwnerID]) then {
			_unitGroup setGroupOwner 2;
			diag_log format ["[A3XAI] Returned improperly transferred group %1 to server.",_unitGroup];
		};
	};

	//diag_log format ["DEBUG: Group Manager cycle time for group %1: %2 seconds.",_unitGroup,(diag_tickTime - _debugStartTime)];
	if ((_unitGroup getVariable ["GroupSize",0]) > 0) then {uiSleep 15};
};

if (A3XAI_enableDebugMarkers) then {
	deleteMarker _groupLeadMarker;
	deleteMarker _groupWPMarker;
};

if !(isNull _unitGroup) then {
	_unitGroup setVariable ["isManaged",false]; //allow group manager to run again on group respawn.

	if !(isDedicated) exitWith {
		A3XAI_transferGroup_PVS = _unitGroup;
		publicVariableServer "A3XAI_transferGroup_PVS";	//Return ownership to server.
		A3XAI_HCGroupsCount = A3XAI_HCGroupsCount - 1;
		if (A3XAI_debugLevel > 0) then {diag_log format ["A3XAI Debug: Returned ownership of AI %1 group %2 to server.",_unitType,_unitGroup];};
	};

	while {(_unitGroup getVariable ["GroupSize",-1]) isEqualTo 0} do {	//Wait until group is either respawned or marked for deletion. A dummy unit should be created to preserve group.
		uiSleep 5;
	};

	if ((_unitGroup getVariable ["GroupSize",-1]) isEqualTo -1) then {	//GroupSize value of -1 marks group for deletion
		if (!isNull _unitGroup) then {
			if (A3XAI_debugLevel > 0) then {diag_log format ["A3XAI Debug: Deleting %2 group %1.",_unitGroup,(_unitGroup getVariable ["unitType","unknown"])]};
			_unitGroup call A3XAI_deleteGroup;
		};
	};
} else {
	diag_log "A3XAI Error: An A3XAI-managed group was deleted unexpectedly!";
};

if ((local _vehicle) && {isEngineOn _vehicle}) then {
	_vehicle engineOn false;
};
