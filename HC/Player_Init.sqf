//HC_Player_Init.sqf
// Horbin
// 12/23/14
// Init file run by all players, HC's, and the server.
diag_log format ["FuMS initializing for player:%1",player];

// Player watch routine.
[] spawn
{	
	while {true} do
	{
		if (!isNil "FuMS_PlayerWatch_CheckTime") then
		{
			uisleep FuMS_PlayerWatch_CheckTime;
			if (floor (random 100) < FuMS_PlayerWatch_CheckChance) then
			{
                if (FuMS_PlayerWatch_NotifyPlayer) then
                {
                    systemchat format ["You hear abnormal radio noise."];
                   // player sideChat "We have visitors";
                   // playsound "radioAmbient6";
                  
                  //  playsound "radioAmbient8";
                  
                   // playsound "radio_track_01";
                   // playsound "faction_independent_x05_i_nonsense_EXI_0";
                
                    // NEED TO FIND A GOOD SHORT SOUND HERE!
                    
                    //"\ryanzombies\sounds\ryanzombiesscream1.ogg"                    
                };
				FuMS_StartPlayerEncounter = player;
				publicVariableServer "FuMS_StartPlayerEncounter";
			};
		}else
		{
			uisleep 5; // HC has not initialized and passed the global var, so rest for 5 seconds and check again.
		};
	};
};



// Part of Ryan's Zombie and Demons support
"FuMS_ThrowIt" addPublicVariableEventHandler
{
		_data = _this select 1;
		_object = _data select 0;
		_airpos = _data select 1;
		_vel = _data select 2;
  
	_object setpos _airpos;
	_object setvelocity _vel;
	_object setVectorUp [0,0,-1];
};

"FuMS_PayPlayer" addPublicVariableEventHandler
{
    _data =    _this select 1;
	_factionPairs = _data select 0;
	_player = _data select 1;
	{
    _amount = _x select 1;
    _typepayment = _x select 0;
   // _player = _data select 2;
	
    switch (_typepayment) do
    {
        case "KRYPTO":
        {
           // EPOCH_playerCrypto = EPOCH_playerCrypto + _amount;
		   // amount actually added SERVER Side!
			systemchat format ["TEST: Awarded ZERO Respect and ZERO tabs"];
        };       
        default {};
    };
	}foreach _factionPairs;
};

FuMS_fnc_DirectCaptive =
{
	private ["_unit","_player","_actionID","_directive"];
	_unit = _this select 0;
	_player = _this select 1;
	_actionID = _this select 2;
	_directive = _this select 3;
	
	FuMS_CaptiveAction = [_unit, _player, _directive select 0];
	publicVariableServer "FuMS_CaptiveAction";
	diag_log format ["<FuMS> Player_Init: _unit:%1 _player:%2 action:%3",_unit, _player, _directive select 0];
	systemchat format ["Following your command to %1", _directive select 0];
};

FuMS_fnc_AddCaptiveMenu =
{
	private ["_unit","_options"];
	_unit = _this select 0;	
	_options = _this select 1;
	{
		//_unit addAction [format ["%1",_x],{call FuMS_fnc_DirectCaptive}, [_x],6,true,true,"","(_target distance _this < 10)"];
		_id =  _unit addAction [format ["%1",_x],{call FuMS_fnc_DirectCaptive}, [_x],6,true,true,"","( (_target distance _this) < 10)"];
		diag_log format ["<FuMS> Player_init: AddCaptiveMenu added %1 to %2",_x,_unit];		
	}foreach _options;
};

// FuMS_PlayerCaptiveMenu
[] spawn
{
	while {true} do
	{				
		{
			private ["_var"];			
			_var = _x getVariable "FuMS_CaptiveMenu";
			if (!isNil "_var") then
			{
				if (_var) then
				{
					[_x, ["FOLLOW","STAY","FLEE","BOARD","EVAC POINTS"]] call FuMS_fnc_AddCaptiveMenu;
					diag_log format ["<FuMS> Player_init : AddCaptiveMenu added to %1",_x];
					_x setVariable ["FuMS_CaptiveMenu", false];											
				};				
			}else
			{
				// check if object has 'crew', then check crew if they are captives!		
				// crew will return the AI as the crew of itself, so exclude that case.
				// so if the object is not a kind of MAN, look for crew.
				if (!(_x iskindof "MAN")) then 
				{
				{					
					_var = _x getVariable "FuMS_CaptiveMenu";
					if (!isNil "_var") exitWith
					{
					// _x is a captive in a vehicle and only need to add action once to vehicle for all captives.	
						// check that vehicle has no driver or driver is a player.
						_veh = vehicle _x;
						_driver = driver _veh;
						if (isNull _driver or isPlayer _driver) then
						{											
							diag_log format ["<FuMS> Player_init : Found captive:%2 in a vehicle:%1",_veh, _x];
							_hasoption = _veh getVariable "FuMS_CaptiveMenu_AllOut";
							if (isNil "_hasoption") then
							{
								[_veh, ["Everyone Out!"]] call FuMS_fnc_AddCaptiveMenu; 
								_veh setVariable ["FuMS_CaptiveMenu_AllOut",true];
								diag_log format ["<FuMS> Player_init: Added action ""Everyone Out!"" to %1",_veh];
							};		
						};						
					};
				}foreach (crew _x);	
				};
			};
		}foreach ( nearestobjects [player, [], 30]);
		uisleep 10;
	};
};

"FuMS_Message" addPublicVariableEventHandler
{
	_data = _this select 1;
    _type = _data select 0; // type String
    _sender = _data select 1; // type Obj
    _receiver = _data select 2; // type Array
    _msg = _data select 3; // type Array
	
	switch (_type) do
	{
		case "CAPTIVE":
		{
			systemChat format ["%1",_msg select 0];
		};
		default
		{
			_errMsg = format ["<FuMS> Player_Init: FuMS_Message: Unidentified message : %1", _data]; 
			diag_log _errMsg;
			systemChat _errMsg;
		};
	};
};

"FuMS_GlobalHint" addPublicVariableEventHandler
{
    private ["_GHint"];
    _GHint = _this select 1;
    hint parseText format["%1", _GHint];
};

"FuMS_GlobalSound" addPublicVariableEventHandler
{
	private ["_sound"];
	_sound = _this select 1;
	playsound _sound;
};

"FuMS_TEMPVEHICLE" addPublicVariableEventHandler
{
    //    diag_log format ["#####%1 entered a tempary vehicle!",player];
    systemChat "FuMS:Warning! This vehicle will disappear on server restart!";
};

"FuMS_AIONLYVEHICLE" addPublicVariableEventHandler
{
    systemChat "FuMS: Some odd technical incompatibility prevents you from interfacing with this vehicle!";
};

"FuMS_ZupaCapture" addPublicVariableEventHandler
{
	_timeRemaining = _this select 1;
	systemChat format ["Capture point has %1 minutes remaining",_timeRemaining];
};

FuMS_RadioMsgQue = [];

"FuMS_RADIOCHATTER" addPublicVariableEventHandler
{
	/*
    _rscLayer = "radioChatterBar" call BIS_fnc_rscLayer;
    _msg = format ["%1",_this select 1];
    FuMS_RadioMsgQue = FuMS_RadioMsgQue + [_msg];
    if (count FuMS_RadioMsgQue == 11) then
    {
        FuMS_RadioMsgQue = FuMS_RadioMsgQue - [FuMS_RadioMsgQue select 0];
    };     
    _rscLayer cutRsc["radioChatterBar","PLAIN",1,false];
    _data = "";
    for [{_i=0},{_i<count FuMS_RadioMsgQue},{_i=_i+1}] do
    {
        _line = format ["%1\n",FuMS_RadioMsgQue select _i];
        _data = format ["%1%2",_data,_line];
    };
    ((uiNamespace getVariable "radioChatterBar")displayCtrl 1010) ctrlSetText _data;
    _rscLayer cutFadeOut 20;
*/	
};  

//Admin Controls Menu! 
waitUntil {!isNil "FuMS_AdminControlsEnabled"};
if (FuMS_AdminControlsEnabled) then
{  
//	waitUntil{!isNull (uiNameSpace getVariable ["EPOCH_loadingScreen", displayNull])};
//	waitUntil{isNull (uiNameSpace getVariable "EPOCH_loadingScreen")};
	sleep 10; // something odd with Khalili or no player name, but valid 'player' function return. Pause to allow final initialization.
	while { isNil "FuMS_PlayerAuthenticated"} do
	{
		FuMS_GetPlayerIndex = player;
	publicVariableServer "FuMS_GetPlayerIndex";
		diag_log format ["<FuMS:%2> PlayerInit: %1 waiting for authentication.", FuMS_GetPlayerIndex, FuMS_Version];
		sleep 3;
	};	
	if (!isNil "FuMS_fnc_Menu_StartMenu") then {[player] spawn compile FuMS_fnc_Menu_StartMenu;};
	diag_log format ["<FuMS:%2> PlayerInit: FuMS Admin Menu = %1",(!isNil "FuMS_fnc_Menu_StartMenu"),FuMS_Version];
};
// Push controls for Zombie sounds to the player.
//waitUntil {!isNil "FuMS_str_HC_Zombies_INF_fnc_nextSound"};
//diag_log format ["<FuMS:%1> StartMenu: Initializing Zombie Sounds for %2",FuMS_Version,player];
//FuMS_INF_nextSound = compile FuMS_str_HC_Zombies_INF_fnc_nextSound;
//[] call FuMS_INF_nextSound;