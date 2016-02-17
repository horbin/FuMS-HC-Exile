//StaticGunner.sqf
//Horbin
// 5/2/15
//
// Inputs
// _group 
// Sets up
private ["_group","_options","_facing"];
_group = _this select 0;
_options = _this select 1;
_facing = _options select 0;

{
     [_x, _facing] spawn
        {
            private ["_unit","_xfillStatus","_veh","_facing"];
            _unit = _this select 0;  
            _facing = _this select 1;
            //_unit disableAI "MOVE";
            _unit forceSpeed 0;         
            
            while {alive _unit} do
            { 
                _xfillStatus = _unit getVariable "FuMS_XFILL";
                if (!isNil "_xfillStatus") then
                {
                    // if this is set, AI will be provided logic to navigate to the vehicle calling for the XFILL, so exit this logic.
                    if (_xfillStatus select 2 == "EVAC") exitWith {_unit forceSpeed 13;};                  
                };
               // _unit doMove _rooftopPos;                
                sleep 2;
            };
            diag_log format ["<FuMS> StaticGunner: Logic terminated for %1.",_unit];
        };	
}foreach units _group;

