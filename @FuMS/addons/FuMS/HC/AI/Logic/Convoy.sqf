//Convoy.sqf
// Horbin
// 1/6/15
//INPUTS: Group, destination, Flag_returntobase
// [_group, [x,y], speed, FlagRTB, FlagroadsOnly]
//OUTPUTS convoy destination waypoint, or 1st waypoint of the Follow-on pattern.
//HC_AddWaypoint = compile preprocessFileLineNumbers "HC\Functions\HC_AddWaypoint.sqf";

private ["_group","_destination","_returnToBase","_wp","_speed","_roadsOnly","_despawn","_patternOptions","_xfill","_convoyType"];
_group = _this select 0;
_destination = _this select 1;
_patternOptions = _this select 2;
_speed = _patternOptions select 0;
_returnToBase = _patternOptions select 1;
_roadsOnly = _patternOptions select 2;
_despawn = _patternOptions select 3;
_convoyType = _patternOptions select 4;
_xfill = false;
_debug = false;

if (isNil "_convoyType") then {_convoyType = "Insert";};
switch (_convoyType) do
{
    case "XFILL" : {_xfill = true;};
};
if (_debug) then
{
	diag_log format ["AI_LOGIC:: Convoy : Traveling to %1",_destination];
	diag_log format ["AI_LOGIC:: Convoy : _patternOptions %1",_patternOptions];
};

_wp = [_group, _destination, 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
_wp setWaypointSpeed _speed;
_wp setWaypointFormation "COLUMN";
//_wp setWaypointCombatMode "BLUE";
if (_roadsOnly) then
{
    _wp setWaypointBehaviour "SAFE";
}else
{
    _wp setWaypointBehaviour "COMBAT";
};
if (_xfill) then
{ 
    private ["_wp2"];
    _wp setWaypointType "LOAD"; 
    //_wp setWaypointCompletionRadius 100;
    // simple convoy, return point is the spawn point!
    _wp2 = [_group, getPos (leader _group) , 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
    _wp2 setWaypointType "MOVE";
    _wp2 setWaypointSpeed "FULL";
    _wp2 setWaypointCompletionRadius 50; 
    // add XFill Logic.
    {
        // for each driver in this group!
        if (driver (vehicle _x) == _x) then{[_x, _wp, _wp2] spawn FuMS_fnc_HC_AI_Logic_DriverXFill;};      
    }foreach units _group;
    _wp = _wp2;  //last waypoint is _wp for all other options. routine returns 'last waypoint'
}
else
{
    _wp setWaypointType "TR UNLOAD";
    _wp setWaypointCompletionRadius 100;
    if (_returnToBase) then
    {
        // Sets waypoint to current position of the group leader! (should be their spawn location)
		if (_debug) then
		{
			diag_log format ["Convoy: Setting Return to Base: %1",getPos (leader _group)];
		};
        _wp = [_group, getPos (leader _group) , 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
        _wp setWaypointType "MOVE";
        _wp setWaypointSpeed "NORMAL";
        _wp setWaypointCompletionRadius 50;
    }else
    {
        // add boxpatrol waypoints.
        //INPUTS: Group, centroid, radius (meters), rotation, closeout
       [_group, _destination, 150, 0, true] call FuMS_fnc_HC_AI_Logic_BoxPatrol;         
    };
};
// set up special behaviour for all drivers in this group!
{           
    if (_despawn and (driver vehicle _x == _x) ) then
    {            
        //*********Delete upon returning home SPAWN CODE ******************
        [_x] spawn
        { 
            // this code assumes the vehicle will travel at least 100m before trying to return to its home location.
            private ["_unit","_hasLeftHome","_homePos","_curPos"]; 
            _unit=  _this select 0;
            _homePos = getPos _unit;
            _hasLeftHome = 0;
            _homePos set [2,0];
			_debug = false;
            while {alive _unit} do
            {   
                sleep 15;
                _curPos = getPos _unit;
                _curPos set [2,0];
				if (_debug) then
				{
					diag_log format ["##Convoy : %1 status: _curPos:%2 | _hasLeftHome:%3 | _homePos:%4 | distance:%5 | time:%6",_unit,_curPos,_hasLeftHome,_homePos, (_curPos distance _homePos), time];
                };
				if (_hasLeftHome > 0 ) then
                {
					if (_debug) then
					{
						diag_log format ["##Convoy : %1 status: Has left",_unit];
                    };
					if (_curPos distance _homePos < 100) then 
                    {
						if (_debug) then
						{
							diag_log format ["##Convoy : %1 status: Distance Close",_unit];
                        };
						// driver is close to home!
                        if ( time > (_hasLeftHome +120)  )then // and had been away for atleast 2 minutes
                        {         
                            private ["_veh"];
                            _veh = vehicle _unit;

							if (_debug) then
							{
								diag_log format ["##Convoy : %1 has returned home. Deleting them!",_unit];
								diag_log format ["##Convoy: Deleting %1",units _veh];
                            };
							
                            {
                                deleteVehicle _x;
                            }foreach assignedCargo _veh;
                            {
                                deleteVehicle _x;
                            }foreach units _veh;
                            deleteVehicle _veh;        
                        };
                    };
                }
                else
                {
                    if ((_curPos distance _homePos ) > 25) then{ _hasLeftHome = time;};
                };  
            };            
        };    
        //******END spawn code******
    };    
}foreach units _group;
_wp
// _wp's added:
// 1:TR UNLOAD or LOAD.
// 2: RTB locaiton.
