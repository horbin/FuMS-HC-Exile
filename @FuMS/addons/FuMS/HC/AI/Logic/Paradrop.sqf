//Paradrop.sqf
// Horbin
// 1/29/15
//Inputs: group, droploc, array of options [speed, height, FlagRTB, smokes]
// _dropData = [_x,  HC_CreateGroup data,  _testingpos, 300, "undefined"];
// executed by 'pilot' of an airborne asset.
//HC_AddWaypoint = compile preprocessFileLineNumbers "HC\Functions\HC_AddWaypoint.sqf";

private ["_dropLoc","_fih","_data","_group","_flagRTB","_flagSmoke","_spawnLoc","_leaderData","_speed","_wp"];
_group = _this select 0;
_dropLoc = _this select 1;
_data = _this select 2;
_speed = _data select 0;
_fih = _data select 1;  // Fly In Height
_flagRTB = _data select 2;
_flagSmoke = _data select 3;
_leaderData = (leader _group) getVariable "FuMS_AILOGIC";
_spawnLoc = _leaderData select 2;

//_dropLoc set [2,0];
//HCDEBUG = "WP";
_wp = [_group, _dropLoc, 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
_wp setWaypointType "MOVE";
_wp setWaypointSpeed _speed;
//_wp setWaypointCompletionRadius 250;
if (_flagRTB) then
{    
    _wp = [_group, _spawnLoc, 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
    _wp setWaypointType "MOVE";
    _wp setWaypointSpeed _speed;
//    _wp setWaypointCompletionRadius 75;
    //diag_log format ["##Paradrop: flagRTB set. Returning to:%1 as wp:%2",_spawnLoc, _wp]; 
    // start process to despawn when near home location!
}else
{
    _wp = [_group, _dropLoc, 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;    
    _wp setWaypointType "LOITER"; 
    _wp setWaypointSpeed _speed;
    _wp setWaypointLoiterRadius 300;    
};
HCDEBUG = "";
//diag_log format ["Speed:%3 drop:%1 spawn:%2",_dropLoc, _spawnLoc, _speed];
//diag_log format ["wp list: %1 current:", waypoints _group, currentWaypoint _group];

//identify the pilots and collect an array of vehicles being flown by this group!
{       
    [_x, _dropLoc, _flagSmoke, _fih,_spawnLoc, _flagRTB] spawn
    {
        private ["_pilot","_dropLoc","_flagSmoke","_curPos","_fih","_spawnLoc","_dropLoc2D","_flagRTB"];
        _pilot = _this select 0;
        _dropLoc = _this select 1;
        _flagSmoke = _this select 2;
        _fih = _this select 3;
        _spawnLoc = _this select 4;
        _flagRTB = _this select 5;      
        _dropLoc2D = _dropLoc;
        _dropLoc2D set [2, _fih];        
        waitUntil { _pilot != vehicle _pilot};
       //diag_log format ["##Paradrop: Pilot parardrop logic started for %1",_pilot];        
        // unit is now in a vehicle!
     
        if (driver (vehicle _pilot) == _pilot) then
        {           
   //         diag_log format ["##Paradrop: Pilot parardrop logic initialized for %1 at alt:%2",_pilot, _fih];            
            // move to the drop zone
            (vehicle _pilot) flyInHeight _fih;
            //diag_log format ["##Paradrop:1:  %1 heading to %2 for paradrop! current wp is:%3",_pilot, _dropLoc2D, currentWaypoint (group _pilot)];                
            _curPos = getPos _pilot;
            _curPos set [2,_fih];
            // when withing 150m slow to 50kph            
            while {alive _pilot and canMove (vehicle _pilot) and (_curPos distance _dropLoc2D > 150)} do
            {
            //    diag_log format ["##Paradrop:2: %4m Sep.....%1:%2 moving toward: %3",_pilot, _curPos, _dropLoc, _curPos distance _dropLoc];
                sleep 1;
                _curPos = getPos _pilot;
                _curPos set [2,_fih];                    
            };
            //diag_log format ["##Paradrop:3; Within 150m slowing speed: %1",_pilot];   
            
            waitUntil 
            {
                _curPos = getPos _pilot;
                _curPos set [2,_fih];
            //    diag_log format ["##Paradrop:4: Approaching drop zone: delta=%1",_curPos distance _dropLoc];
             //   diag_log format ["##Paradrop:5:  %1 heading to %2 for paradrop! current wp is:%3",
              //  _pilot, waypointPosition[(group _pilot), (currentWaypoint (group _pilot))], currentWaypoint (group _pilot)];           
                  (_curPos distance _dropLoc2D < 100 or !alive _pilot or !canMove (vehicle _pilot) )  
            };
          //  diag_log format ["<FuMS> Paradrop: %1 Cargo units being dropped by %2!",count assignedCargo (vehicle _pilot),_pilot];
   //*** spawn code to kick out troopers         
            [_pilot, _flagSmoke] spawn
            {
                private ["_pilot","_flagSmoke"];			
                _pilot = _this select 0;
                _flagSmoke = _this select 1;
                {       
                    [_x, vehicle _x, true, _flagSmoke] spawn FuMS_fnc_HC_AI_Logic_fnparadrop;   
                    unassignVehicle _x;
                    _x action ["getOut", vehicle _x];   
                }foreach assignedCargo (vehicle _pilot);      
            };
//**** end spawn code     
            if (_flagRTB) then
            {
                //***spawn RTB watch code
                [_pilot, _spawnLoc, _fih] spawn
                {
                    private ["_pilot","_spawnLoc","_veh","_fih","_curPos"];
                    _pilot = _this select 0;
                    _spawnLoc = _this select 1;
                    _fih = _this select 2;
                    _spawnLoc set [2,_fih];
                    _curPos = getPos _pilot;
                    _curPos set [2,_fih];
                    while {alive _pilot and canMove (vehicle _pilot) and _curPos distance _spawnLoc > 250} do
                    {
                        sleep 2;
                        _curPos = getPos _pilot;
                      //diag_log format ["##Paradrop: %1 proceeding to %2 @%3m",_pilot, _spawnLoc, _curPos distance _spawnLoc];             
                        _curPos set [2, _fih];
                    };
                        //diag_log format ["##Paradrop: %1  mission complete!",_pilot, _spawnLoc];           
                    _veh = vehicle _pilot;
                    {
                        deleteVehicle _x
                    }foreach crew (vehicle _pilot);
                    deleteVehicle _veh;
                };
                //****end spawn code                
            };       
        };  
    };
}foreach units _group;
