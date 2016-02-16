//VehStuck.sqf
// Horbin
// 1/25/15
// Inputs: Unit
// Spawns a process that watches the position of the unit. If the unit is a driver, then 
// the vehicle will get moved if it is stuck. All ai in the vehicle will be left to do whatever logic/waypoints they 
// were assigned too.
// VehStuck = true if it remains within same 2m area for 150 seconds.
//****Spawn Stuck Vehicle Code for driver ******
private ["_unit","_lastPos","_stationary","_dist2leader_old","_veh"];
_unit = _this select 0;
_stationary = 0;
_dist2leader_old = 25;
if (!isNil "_unit") then
{
    
    sleep 10; // wait 10 seconds before starting to check to allow for init/placement.
    while {alive _unit } do
    {
        _veh = vehicle _unit; // AI's vehicle status checked every 60 seconds, or upon no longer being a driver of its previous vehicle
        if (_veh isKindOf "StaticWeapon") exitWith 
        {
            //diag_log format ["<FuMS> VehStuck: Gunner logic found, exiting VehStuck logic."];    
        };
        
        if ( _veh == _unit or (assignedDriver _veh != _unit) ) then
        { 
            // if veh can't move then exit it!
            if (! (canMove _veh) ) then
            {
                unassignVehicle _unit;
            };
            sleep 60;
        }// AI is on foot or NOT the driver, so check again in 60 seconds
        else
        {            
            _lastPos = getPos _unit;
            //  diag_log format ["##VehStuck: Initialized for %1", _unit];               
            while {alive _unit and (assignedDriver _veh == _unit)} do // unit is alive and still the driver 
            {
                _veh setFuel .25;
                //diag_log format ["<FuMS> VehStuck: Fuel Set to 25% on %1's %2",_unit,_veh];
                if (_veh isKindOf "Air") then { sleep 60;}
                else
                {
                    private ["_unitPos","_leader","_leaderPos","_checkIfStuck","_dist2leader"];      
                    sleep 15;  // only need to run this every 15sec or so, not performance based.
                    _checkIfStuck = false;
                    _leader = leader (group _unit);
                    _leaderPos = getPos _leader;        
                    _unitPos = getPos _unit;
                    _unitPos set [2,0]; // 2d distance checking!
                    _leaderPos set [2,0];
                    if (_leader == _unit) then {_checkIfStuck = true;}
                    else
                    {
                        _dist2leader = _leaderPos distance _unitPos;
                        // if this distance greater than the old distance, then leader is leaving 'this' unit behind, need to check if it is stuck!
                        if (_dist2leader > _dist2leader_old) then {_checkIfStuck=true;};
                        _dist2leader_old = _dist2leader;
                    };
                    if (_checkIfStuck) then
                    {            
                        if( _unit distance _lastPos< 3) then // veh has been in same proximity for at least 15 seconds!
                        {
                            private ["_var"];
                            _var = _unit getVariable "FuMS_XFILL";
                            if (!isNil "_var") then
                            {
                                if (_var select 2 != "HOLD") then // not doing an evacuation, so must be stuck!
                                {
                                    _stationary =_stationary +1;
                                    //diag_log format ["##VehStuck: %2: %1 is stuck! Getting ready to delete!", vehicle _unit, _stationary];
                                };
                            };
                        }
                        else 
                        {
                            _stationary =0;
                            _lastPos = getPos _unit;
                            _lastPos set [2,0]; // 2d distance check
                        };
                        if (_stationary > 4) then
                        { 
                            private ["_newPos"];
                            if (_veh isKindOf "Water") then
                            {
                                diag_log format ["<FuMS> VehStuck: %1 being teleported to open water.",vehicle _unit];
                                _newPos = [getPos _veh] call FuMS_fnc_HC_Util_FindNearestWater;
                            }else
                            {
                                private ["_oldPos"];
                                diag_log format ["<FuMS> VehStuck: %1 being teleported to nearest road segment because it was stuck!",vehicle _unit];
                                _newPos = [getPos _veh] call FuMS_fnc_HC_Util_FindNearestRoad;
                                _oldPos = _veh getVariable "FuMS_VehStuck";
                                if (!isNil "_oldPos") then
                                {
                                      // veh was stuck before! check that the old position is not near the newpos.
                                    // if so, this implies bad road segment selection.
                                    if (_newPos distance _oldPos < 20) then
                                    {
                                        private ["_xx"];
                                        diag_log format ["<FuMS> VehStuck: Unable to find a usable road segment. Making course teleport of %1:%2",_veh, _oldpos];
                                        _xx = _oldpos select 0;
                                        _xx = _xx + 100;
                                        _oldpos set [0, _xx];
                                        _newpos = _oldpos;
                                    };
                                };
                                _veh setVariable ["FuMS_VehStuck",_newPos];
                            };
                            _veh moveto _newPos;
                            _stationary = 0;
                                
                            //deleteVehicle (vehicle _unit);
                        }else
                        {
                            if (! canMove (vehicle _unit)) then
                            {
                                // order all units in the vehicle to leave.
                                // Can possibly add code here for a random AI to get out and 'repair' vehicle..later option.
                                {
                                    unassignVehicle _x;
                                }foreach assignedCargo (vehicle _unit);
                                {
                                    unassignVehicle _x
                                }foreach units (vehicle _unit);              
                            };
                        };
                    };
                }; 
            };
        };
    };
} else {diag_log format ["<FuMS> VehStuck : ERROR attempt to initialize with no driver defined!"];};
