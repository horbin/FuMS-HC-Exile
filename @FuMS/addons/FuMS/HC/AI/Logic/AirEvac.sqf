//AirEvac.sqf
// TheOneWhoKnocks
// 9/1/19
//Inputs: group, pickuploc, array of options [speed, height, FlagRTB, smokes]
// _dropData = [_x,  HC_CreateGroup data,  _testingpos, 300, "undefined"];
// executed by 'pilot' of an airborne asset.
//HC_AddWaypoint = compile preprocessFileLineNumbers "HC\Functions\HC_AddWaypoint.sqf";

private ["_pickupLoc","_fih","_data","_group","_flagRTB","_flagSmoke","_spawnLoc","_leaderData","_speed","_wp"];
_group = _this select 0;
_pickupLoc = _this select 1;
_data = _this select 2;
_speed = _data select 0;
_fih = _data select 1;  // Fly In Height
_flagRTB = _data select 2;
_flagSmoke = _data select 3;
_leaderData = (leader _group) getVariable "FuMS_AILOGIC";
_spawnLoc = _leaderData select 2;
_pickupLoc set [2,500];

_debug = true;

if (_debug) then
{
	diag_log format ["##AirEvac: _spawnLoc:%1 | _pickupLoc:%2", _spawnLoc,_pickupLoc]; 
};
//HCDEBUG = "WP";
_wp = [_group, _pickupLoc, 200] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
_wp setWaypointType "MOVE";
_wp setWaypointSpeed _speed;
_wp setWaypointCompletionRadius 250;
if (_debug) then
{
	diag_log format ["##AirEvac: WP1:%1 ", _wp]; 
};

_wp2 = [_group, _pickupLoc, 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
_wp2 setWaypointType "LAND";
//_wp2 setWaypointSpeed _speed;
//_wp setWaypointCompletionRadius 250;
if (_debug) then
{
	diag_log format ["##AirEvac: WP2:%1 ", _wp2]; 
};

_wp3 = [_group, _pickupLoc, 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;    
_wp3 setWaypointType "LOAD"; 
//_wp3 setWaypointSpeed _speed;
//_wp3 setWaypointLoiterRadius 300; 
if (_debug) then
{
	diag_log format ["##AirEvac: WP3:%1 ", _wp3]; 
};

//_wp4 = [_group, _spawnLoc, 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
_wp4 = [_group, [0,0,500], 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
_wp4 setWaypointType "MOVE";
_wp4 setWaypointSpeed _speed;
if (_debug) then
{
	diag_log format ["##AirEvac: WP4:%1 ", _wp4]; 
};

// add XFill Logic.
{
	// for each driver in this group!
	if (driver (vehicle _x) == _x) then{[_x, _wp3, _wp4] spawn FuMS_fnc_HC_AI_Logic_DriverXFill;};      
}foreach units _group;

// add despawn logic
{           
    if (driver vehicle _x == _x) then
    {            
        //*********Delete upon returning home SPAWN CODE ******************
        [_x] spawn
        { 
            // this code assumes the vehicle will travel at least 100m before trying to return to its home location.
            private ["_unit","_hasLeftHome","_homePos","_curPos"]; 
            _unit=  _this select 0;
            _homePos = getPos _unit;
            _hasLeftHome = 0;
            _homePos set [2,500];
			_debug = false;
			
//			if (_debug) then
//			{
				_chopper1 = _this select 0;
				_pos3 = position _chopper1;
				_mkr = createMarker ["HeliMarker",_pos3];
//			};
			
			
			
			
            while {alive _unit} do
            {   
				_pos3 = position _unit;
				"HeliMarker" setMarkerType "mil_warning";
				"HeliMarker" setMarkerText "Rescue";
				_mkr setMarkerPos _pos3;			
                sleep 15;
                _curPos = getPos _unit;
                _curPos set [2,500];
				if (_debug) then
				{
					diag_log format ["##AirEvac : %1 status: _curPos:%2 | _hasLeftHome:%3 | _homePos:%4 | distance:%5 | time:%6",_unit,_curPos,_hasLeftHome,_homePos, (_curPos distance _homePos), time];
                };
				if (_hasLeftHome > 0 ) then
                {
					if (_debug) then
					{
						diag_log format ["##AirEvac : %1 status: Has left",_unit];
                    };
					if (_curPos distance [0,0,500] < 1000) then 
                    {
						if (_debug) then
						{
							diag_log format ["##AirEvac : %1 status: Distance Close",_unit];
                        };
						// driver is close to home!
                        if ( time > (_hasLeftHome +120)  )then // and had been away for atleast 2 minutes
                        {         
                            private ["_veh"];
                
                            _veh = vehicle _unit;

							if (_debug) then
							{
								diag_log format ["##AirEvac : %1 has returned home. Deleting them!",_unit];
								diag_log format ["##AirEvac: Deleting %1",units _veh];
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


