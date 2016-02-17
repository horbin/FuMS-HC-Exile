//Captured.sqf
// Horbin
// 7/7/2015

FuMS_fnc_PlayerStance =
{
	private ["_player","_animState","_animStateChars","_animP","_result"];
	_player = _this select 0;
	_result = "UP";
    if (isNil "_player") exitWith {_result};
	_animState = animationState _player;
	_animStateChars = toArray _animState;
    if (count _animStateChars < 8) exitWith {_result};
	_animP = toString [_animStateChars select 5, _animStateChars select 6, _animStateChars select 7];
	if (_animP == "pne") then {_result = "DOWN";};
	if (_animP == "knl") then {_result = "MIDDLE";};
	if (_animP == "erc") then {_result = "UP";};
//	if (isNil "_result") then {_result = "UP";};
    //diag_log format ["<FuMS> Captured: PlayerStance: %1",_result];
	_result	
};

private ["_group","_actionLoc","_params","_eCenter","_params","_rescueLocs","_setRescLocs","_newparams"];
_group = _this select 0;
_actionLoc = _this select 1;
_eCenter = _this select 2;
_params = _this select 3;

// convert all rescue locs to actual 3d coords.
_rescueLocs = _params select 1;
_setRescLocs = [];

{
    private ["_var"];
    _var = [_eCenter, _x] call FuMS_fnc_HC_MsnCtrl_Util_XPos;
	_setRescLocs = _setRescLocs + [ _var];
}foreach _rescueLocs;

_newparams =+ _params;
_newparams set [1, _setRescLocs];

//diag_log format ["<FuMS> Captured: _params: %1",_newparams];
//diag_log format ["<FuMS> Captured: Center:%2 ActionLoc:%3 Pre-formatted: %1",_rescueLocs, _eCenter, _actionLoc];
//diag_log format ["<FuMS> Captured: formatted: %1",_setRescLocs];
// Speeds
// Sprinting 7.0 m/s
// Running  5.0 m/s
// Walking  1.7 m/s
// Behaviour: "Careless" - weapons safe, walk slow, not fire on enemy
//    "Safe" same as careless but will switch to "aware" upon detecting enemy
//    "Aware" default: move at moderate speed
uisleep 20;
// sleeping 20 seconds here to permit mission to fully init, then can check 'groups' variable.
{
	[_x, _actionLoc, _newparams] spawn 
	{
        private ["_unit","_actionLoc","_params","_behaviorOption","_rescueLocs","_msnTag","_moveTo","_mimicLeader","_boardingVehicle"];
        _unit = _this select 0;
        _actionLoc = _this select 1;
        _params = _this select 2;
        _msnTag = _unit getVariable "FuMS_Lineage";
        _behaviorOption = _params select 0;
        _rescueLocs = _params select 1;
        _unit setVariable ["FuMS_CaptiveMenu",true,true];
        _unit setVariable ["FuMS_CaptiveAction",["STAY", _unit]];
        _unit setCaptive true;
     //   _unit setCombatMode "BLUE";       
       _unit setBehaviour "CARELESS";
        _unit switchMove "ActsPercMstpSnonWnonDnon_ArrestingManLoop";
       // _unit disableAI "MOVE";
       // _unit disableAI "FSM";
        _unit disableAI "AUTOTARGET";
      //  _unit disableAI "TARGET";
        
        _unit domove _actionLoc;
        if (_behaviorOption > -1) then
        {
            private ["_groups","_leader"];
            _groups = missionNameSpace getVariable (format ["%1_Groups",_msnTag]);
            _leader = leader (_groups select _behaviorOption);
            _unit setVariable ["FumS_CaptiveAction",["FOLLOW", _leader ]];   
        //    diag_log format ["<FuMS> Captured: %1 set to follow %2 from Grp#%3",_unit, _leader, _behaviorOption];
        }; 
        _moveTo = getPos _unit;
        _mimicLeader = false;
        while {alive _unit} do
        {
            private ["_action","_stance"];			
            _action = _unit getVariable "FuMS_CaptiveAction";
        //     diag_log format ["<FuMS> Captured: CaptiveAction = Unit:%2 Action:%1",_action, _unit];
            // 0 = action, 1 = player                                  
            private ["_order"];
            _order = toupper (_action select 0);                        
            switch (_order) do
            {
                case "FLEE":
                {
                    _unit setCaptive false;
                    _unit switchMove "";
                    _moveTo = [];
                    {
                        if (_x distance _unit < 200) exitWith {_moveTo = _x;};
                    }foreach _rescueLocs;
                    if (count _moveTo != 3) then
                    { 
                        _moveTo = _rescueLocs call Bis_fnc_SelectRandom;
                    };
                    _unit setUnitPos "UP";
                    // _unit setBehaviour "Aware";
                    _unit forceSpeed 8;
                    _mimicLeader = false;
                    //        diag_log format ["<FuMS> Captured: %1: %2 formated.Locs:%5 Fleeing to: %4 Stance=%3",_unit,_action select 0, Unitpos _unit, _moveTo, _rescueLocs];   
                };
                case "STAY":
                {
                    _moveTo = getPos _unit;
                    _mimicLeader = false;
                    _stance = [_action select 1] call FuMS_fnc_PlayerStance;
                    //  _unit setUnitPos (format ["%1",_stance]);
                    //     _unit setCombatMode "BLUE";
                    _unit setUnitPos _stance;
                    //  _unit setUnitPos "DOWN";
                    //   _unit setBehaviour "AWARE";
                    _unit forceSpeed 0;
                    //          diag_log format ["<FuMS> Captured: %1: %2 formated. Stance=%3",_unit,_action select 0, Unitpos _unit];   
                };
                case "FOLLOW":
                {
                    _unit switchMove "";
                    _moveTo = getPos (_action select 1);
                    _mimicLeader = true;
                    _stance = [_action select 1] call FuMS_fnc_PlayerStance;
                    //_unit setUnitPos (format ["%1",_stance]);
                    //   _unit setCombatMode "BLUE";
                    _unit setUnitPos _stance;
                    // _unit setBehaviour "AWARE";
                    _unit forceSpeed 6;                         
                    //          diag_log format ["<FuMS> Captured: %1: %2 formated. Stance=%3",_unit,_action select 0, Unitpos _unit];   
                };
                case "BOARD":
                {
                    private ["_vehList","_previousVeh"];     
                    _unit switchMove "";
                    _stance = [_action select 1] call FuMS_fnc_PlayerStance;
                    _unit setUnitPos _stance;
                    // look for all vehicles within 200m
                    _vehList = _unit nearobjects ["ALLVEHICLES",200];         
                    //         diag_log format ["<FuMS> Captured : Veh List : %1",_vehList];
                    _previousVeh = objNull;
                    {
                        // is it closer to the Captive than previous veh.
                        if (_unit distance _x <= _unit distance _previousVeh) then
                        {
                            //               diag_log format ["<FuMS> Captured : Veh %1 is closer than %2",_x, _previousVeh];           
                            // is the vehicle of type "AIR", "SHIP" or "LANDVEHICLE"
                            if (_x isKindOf "SHIP" or _x isKindOf "AIR" or _x isKindOF "LANDVEHICLE"  ) then
                            // and !(_x isKindOf "MAN")) 
                            {
                                //                diag_log format ["<FuMS> Captured : Veh %1 is %2 (a Ship, Air, or Land)",_x, typeof _x];           
                                // is the vehicle functional.
                                if (canmove _x) then
                                {
                                    private ["_driver"];
                                    //                  diag_log format ["<FuMS> Captured : Veh %1 can move with driver %2",_x, driver _x];           
                                    // is the vehicle unoccupied or player controlled
                                    _driver = driver _x;
                                    if (isNull _driver) then
                                    {
                                        _previousVeh = _x;
                                    }else
                                    {
                                        if (isplayer _driver) then
                                        {
                                            _previousVeh = _x;
                                        };
                                    };
                                };
                            };
                        };                          
                    } foreach _vehList;                    
                    if (!isNull _previousVeh) then
                    {                       
                        _boardingVehicle = _previousVeh;
                        _mimicLeader = false;
                        _moveTo = getPos _boardingVehicle;
                        // move to vehicle, enter as cargo controlled below.                        
                        _unit forceSpeed 6;    
                        //    diag_log format ["<FuMS> Captured: %1: %2 formated. Vehicle found: %4 Stance=%3",_unit,_action select 0, Unitpos _unit, _boardingVehicle]; 
                    }else
                    {
                        //   diag_log format ["<FuMS> Captured: %1: Found no good vehicle within 200m",_unit];
                        _action set [0,"STAY"];
                        _unit setVariable ["FuMS_CaptureAction",_action];
                         _rcvr = _action select 1;
                        _msg = format ["%1: Unable to find a friendly operational vehicle to board!",_unit];
                        diag_log format ["<FuMS> Captured: SendingMsg CAPTIVE:%1:%2:%3:%4",player, _rcvr, _msg];
                        FuMS_Message = ["CAPTIVE", player, [_rcvr], [_msg]]; 
                        publicVariableServer "FuMS_Message";   
                        
                    };
                    
                };
                case "EVAC POINTS":
                {
                    {
                        [_x] spawn
                        {
                            private ["_loc","_mkr","_evac"];
                            _loc = _this select 0;
                            // create the map marker.
                            _mkr = format ["FuMS_Evac_%1",_loc];
                            _evac = createMarker [_mkr, _loc];
                            _evac setMarkerType "mil_pickup";       
                            _evac setMarkerColor "ColorWHITE";
                            _evac setMarkerText "Evac Point";
                            uisleep 30;
                            // remove the map marker.
                            deleteMarker _evac;                                
                        };
                    } foreach _rescueLocs;
                    _action set [0,"SIT AND WAIT"];
                    _unit setVariable ["FuMS_CaptureAction",_action];
                      diag_log format ["<FuMS> Captured: %1: %2 formated. Stance=%3 RescueLocs:%4",_unit,_action select 0, Unitpos _unit, _rescueLocs];      
                };
                case "EVERYONE OUT!":
                {                        
                    unassignVehicle _unit;
                    _moveTo = getPos (_action select 1);
                    _mimicLeader = false;
                    _stance = [_action select 1] call FuMS_fnc_PlayerStance;                   
                    _unit setUnitPos _stance;                  
                    _unit forceSpeed 6;
                    _action set [0, "FOLLOW"];
                    _unit setVariable ["FuMS_CaptureAction",_action];   
                    diag_log format ["<FuMS> Captured: %1: %2 formated. Stance=%3",_unit,_action select 0, Unitpos _unit];  
                };
                case "SIT AND WAIT":
                {
                    // do nothing state for captive AI that have boarded vehicles.  
                };
                default
                {
                    diag_log format ["<FuMS> Captured: Error: Invalid command received by %1",_unit];
                };
            };         
            // AI is on foot so it can move!
            if (_unit == vehicle _unit) then
            {
                _unit doMove _moveTo;
                //   diag_log format ["<FuMS> Captured: %1:%4 is moving to %2 Stance=%3",_unit, _moveTo, Unitpos _unit,getpos _unit ];
                
                waitUntil
                {
                    private ["_var"];
                    // diag_log format ["<FuMS> Captured: %1 at %4 is %2  to position %3",_unit, _action select 0, _moveTo, getPos _unit];
                    _var = _unit getVariable "FuMS_CaptiveAction";     
                    if (!alive _unit) exitwith {};
                    (unitReady _unit or (_var select 0 != _action select 0) or (_var select 1 != _action select 1)  or (_moveTo distance _unit < 10)  )
                    // wait for unit to be dead or done moving
                    //  OR its action or 'commander' changes
                    // OR it gets within 10m of its moveto position.
                    // any of these true, then recycle for new orders.
                };
                if (!alive _unit) exitwith {};
                //    diag_log format ["<FuMS> Captured: %1 is 'ready'",_unit];
                
                if (_mimicLeader) then
                {
                    _stance = [_action select 1] call FuMS_fnc_PlayerStance;
                    //_unit setUnitPos (format ["%1",_stance]);
                    //    _unit setCombatMode "BLUE";
                    _unit setUnitPos _stance;
                };
                if ((_action select 0) == "FOLLOW") then
                {
                    
                    if (_unit distance (_action select 1) > 250) then
                    { 
                        diag_log format ["<FuMS> Captured: %1 has become lost and reverting to STAY. Stance=%2",_unit, Unitpos _unit];
                        _action set [0,"STAY"];
                        _action set [1, _unit];
                        _unit setVariable ["FuMS_CaptiveAction", _action];
                    }else
                    {                
                        _moveTo = getPos (_action select 1);
                    };
                };          
                if ((_action select 0 ) == "BOARD") then
                {
                    if (_unit distance _boardingVehicle < 10) then
                    {
                        _action set [0,"STAY"];                       
                        _unit setVariable ["FuMS_CaptiveAction", _action];
                        _unit moveincargo _boardingVehicle;
                        diag_log format ["<FuMS> Captured: %1 has boarded %3 Stance=%2",_unit, Unitpos _unit, _boardingVehicle];
                    };
                };
            };
            // Check if the Unit's position is within 25m of its rescue position.
            // If so increment the 'rescue' trigger.
            {
                if (_unit distance _x < 25 and _unit == vehicle _unit) then
                {               
                    diag_log format ["<FuMS> Captured: %1 has escaped!",_unit];                       
                    _rcvr = _action select 1;
                    _msg = format ["%1: I have escaped!",_unit];
                    diag_log format ["<FuMS> Captured: SendingMsg CAPTIVE:%1:%2:%3:%4",player, _rcvr, _msg];
                    FuMS_Message = ["CAPTIVE", player, [_rcvr], [_msg]]; 
                    publicVariableServer "FuMS_Message";                
                    [_unit] call FuMS_fnc_HC_MsnCtrl_LogicBomb_CheckforBodyCount;      
                    
                    //Add reward
                    _data = _unit getVariable "FuMS_Krypto";
                    if (!isNil "_data") then
                    {
                        [_data, _rcvr, _rcvr] call FuMS_fnc_HC_AI_PayPlayer;
                    };
                    deleteVehicle _unit;
                };
            }foreach _rescueLocs;           
            uisleep 1;                        
        };	
    };
    //End of Spawn
}foreach (units _group);
