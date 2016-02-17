 //AIEvac.sqf
// Horbin
// 1/25/15
// Inputs : unit
// Monitors AI for a call to evacuate
private ["_unit"];
_unit = _this select 0;
while {alive _unit} do
{
    private ["_xfillStatus","_status"];
    sleep 5;
    // [themeIndex, side, "status", vehicle, evacLoc]
    _xfillStatus = _unit getVariable "FuMS_XFILL";
    if (!isNil "_xfillStatus") then // otherwise script just timed out for a removed unit!
    {
        _status = _xfillStatus select 2;        
       // diag_log format ["##AIEvac: %1 XFILL=%2",_unit,_xfillStatus];   
        if (_status == "EVAC") then
        {
            private ["_themeIndex","_side","_veh","_evacLoc","_driver"];
            _themeIndex = _xfillStatus select 0;
            _side = _xfillStatus select 1;
            _veh = _xfillStatus select 3;
            _evacLoc = _xfillStatus select 4;            
            _driver = driver _veh;       
            _unit forceSpeed 13;  // make the unit run.
            if (!isNil "_driver") then // if driver is nil, then immediatly proceed on foot!
            {
                private ["_lastpos","_lastPosTime"];
                _unit assignAsCargo _veh;
                [_unit] orderGetIn true;
                //_unit setCombatMode "WHITE"; // hold fire, engage at will
                _unit setBehaviour "AWARE"; // mostly roads, occasional cover, upright most of the time
               // diag_log format ["####AIEvac: %1 moving to %2 for extraction to %3", _unit, _veh, _evacLoc];
                // while drivr is alive and vehicle mobile, move to the vehicle and get in.
                _lastpos = getPos _unit;
                _lastPosTime = time;
                while { alive _driver and canMove _veh and alive _unit and vehicle _unit != _veh} do
                {
                    // perform stuck check.
                    if (    (( getPos _unit) distance _lastPos < 1) and time > _lastPosTime+30) then //unit been in same spot for 10seconds
                    {
                        private ["_list"];
                        if(isNull(_unit findNearestEnemy _unit))then // and unit not in combat.
                        {
                            _list = _unit nearRoads 10; //unit stuck, teleport him back to the road
                            diag_log format ["##AIEVAC : AI Stuck! Teleporting %1 to vehicle:%2",_unit, _veh];
                            _unit moveinCargo _veh;
                        };
                    };       
                    sleep 2;
                };
                //Unit now in vehicle!
                // while drivr is alive and vehicle mobile, watch for destination
                while { (alive _driver) and (canMove _veh) and (alive _unit) and (_unit distance _evacLoc > 75)   } do
                {sleep 3;};
                // if driver dead or vehicle broken, AND unit is alive, get out of the vehicle!
                if ( (!alive _driver or !canMove _veh) and alive _unit) then
                {
                    [_unit] orderGetIn false;
                    unassignVehicle _unit;
                };    
            };
            // now on foot, make sure we are at the destination
          //  diag_log format ["####AIEvac : %1 is now on foot %2 meters to go!",_unit, _unit distance _evacLoc];
            _unit setCombatMode "GREEN"; // defend only
            _unit setBehaviour "CARELESS"; // upright, stay on roads, no cover
            _unit doMove _evacLoc;
            while { _unit distance _evacLoc > 75 and alive _unit} do { sleep 2;};
            if (alive _unit) then  // unit has evacuated! so reset his status
            {
                //diag_log format ["####AIEvac: %1 has evacuated to %2",_unit, _evacLoc];
                _unit setVariable ["FuMS_XFILL",[_themeIndex, _side, "TRUE"],false];
                _unit forceSpeed -1;  // return to previous movement speed.
            };
            // unit will now resume normal waypoint behaviour, as it has reached its evac point
            // for now, just delete the unit!
            if (alive _unit) then {deleteVehicle _unit;};
        };
    };
};
