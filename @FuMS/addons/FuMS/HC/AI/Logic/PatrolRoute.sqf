//PatrolRoute.sqf
// Horbin
// 2/5/15
//INPUTS: Group, action location, patternOptions
// PatternOptions: travelBehaviour, travelSpeed, [array of destinations], FlagRTB, FlagRoadsOnly, FlagDespawn
//*************************************************************
// This routine will assume locations are MAP specific coords!
//**************************************************************
//HC_AddWaypoint = compile preprocessFileLineNumbers "HC\Functions\HC_AddWaypoint.sqf";
//XPos = compile preprocessFileLineNumbers "HC\Encounters\Functions\XPos.sqf";
private ["_group","_destinations","_returnToBase","_wp","_speed","_roadsOnly","_despawn","_patternOptions","_actionLoc","_behaviour","_flyheight","_compRadius"];
_group = _this select 0;
_actionLoc = _this select 1; // currently ignored in this routine.
_patternOptions = _this select 2;
_behaviour = _patternOptions select 0;
_speed = _patternOptions select 1;
_destinations = _patternOptions select 2;
_returnToBase = _patternOptions select 3;
_roadsOnly = _patternOptions select 4;
_despawn = _patternOptions select 5;
_flyheight = _patternOptions select 6;
//HCDEBUG = "WP";
_compRadius = 150;
if (!isNil "_flyheight") then
{
    if (_flyheight > 0) then
    {
    vehicle (leader _group) flyInHeight _flyheight;
    _compRadius = _compRadius + _flyheight;
    }else {_flyheight = nil;};
};
// for each loc in 'destinations' create a MOVE waypoint
// Add 1st waypoint as 'actionLoc'.
if (_returntoBase) then 
{
    private ["_loc"];
    _wp = [_group, _actionLoc, 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
};

{
    private ["_loc"];
    //remove all waypoints the group currently may contain.
//    _oldwps = waypoints _group;
//    {
//        deleteWaypoint _x;
//    }foreach _oldwps;
    
  // identify type of destination
    _loc = [_actionLoc, _x] call FuMS_fnc_HC_MsnCtrl_Util_XPos;
  if (count _loc > 1) then
  {  
      _wp = [_group, _loc, 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
      // set mode and speed for each waypoint.
      _wp SetWaypointType "MOVE";
      _wp SetWaypointSpeed _speed;
      _wp SetWaypointBehaviour _behaviour;
      _wp SetWaypointCompletionRadius _compRadius;
       _wp setWaypointBehaviour "COMBAT";
      // if roadsOnly, force travel behaviour
      if (_roadsOnly) then {_wp SetWaypointBehaviour "SAFE";};
  };
 }foreach _destinations; 
 
 
 
 if (_returnToBase) then  // travel back to base
 {
     _wp = [_group, (getPos (leader _group)),0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
     // set mode and speed for each waypoint.
     _wp SetWaypointSpeed _speed;
     _wp SetWaypointBehaviour _behaviour;
     // if roadsOnly, force travel behaviour
     if (_roadsOnly) then {_wp SetWaypointBehaviour "SAFE";};
     _wp = [_group, (getWPPos [_group, 1]),0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
 };

sleep 10;
// wait 10 seconds to ensure group has been fully formed and inserted into appropriate vehicles.
// remaining functionality is not time critical!
 // ASSERT: below here all AI in _group are in a vehicle, and _group will receive no new members! (ie as crewman in SpawnVehicle)
 if (_despawn) then
 {
     {
         [_x, _wp] spawn
         {
             private ["_unit","_wp","_lastWpIndex","_curWpIndex"];
             _unit = _this select 0;
             _wp = _this select 1;
             _lastWpIndex = _wp select 1;     
             _curWpIndex = currentWaypoint group _unit;
             
             while {_lastWpIndex > _curWpIndex and alive _unit} do
             { 
                // diag_log format ["..PatrolRoute:despawn:%3 _lastWp:%1  _curWp:%2",_lastWpIndex, _curWpIndex,_unit];
                 sleep 15;
                 _curWpIndex = currentWaypoint group _unit;  
             };
             // last waypoint is active, now have to wait until complete.
             /*
             while {_lastWpIndex == _curWpIndex and alive _unit} do
             {
                 sleep 15;
                 _curWpIndex = currentWaypoint group _unit;   
                diag_log format ["..PatrolRoute:despawn:%3  _lastWp:%1  _curWp:%2 WAITING for last to complete.",_lastWpIndex, _curWpIndex,_unit];
             };
             // last waypoint has completed. Delete AI.
             */
          //   diag_log format ["..PatrolRoute:despawn:%1 last waypoint completed. Performing cleanup",_unit];
             if (driver (vehicle _unit) == _unit and alive _unit)then // unit is the driver
             { 
                 // get list of all units in the vehicle and delete them.
                 {
                     if (alive _x) then {deleteVehicle _x;};
                 }foreach crew (vehicle _unit);
                 deleteVehicle (vehicle _unit);
             };
             if (alive _unit) then {deleteVehicle _unit;             };
         };
     }foreach units _group;
 }else  // if not despawning, then cycle active waypoints.
 {
     _wp SetWaypointType "CYCLE"; 
 };
/* 
// spawn stuck code.  
 if (   ! (( vehicle (leader _group) ) isKindOf "Air") ) then
 {
     {
         if (_x == driver(vehicle _x)) then
         {
             //[_x] execVM "HC\Encounters\AI_Logic\VehStuck.sqf";
			 [_x] spawn FuMS_fnc_HC_AI_Logic_VehStuck;
           //  diag_log format ["##PatrolRoute: VehStuck.sqf started for %1 in %2",_x, vehicle _x];
         };
     }foreach units _group;
 };
*/
if (false) then
 {
     diag_log format ["Debug:PatrolRoute: Waypoint watch loop started for %2",_group];
     [_group] spawn
     {
         private ["_group","_curWp","_wpList"];
         _group = _this select 0;
         while { alive (leader _group)} do
         {
             _wpList = waypoints _group;
             diag_log format ["Debug:PatrolRoute: waypoints: %1", _wpList];
             _curWp = _wpList select currentWaypoint _group;
             diag_log format ["Debug:PatrolRoute: Current waypoint %1", _curWp];
             diag_log format ["Debug:PatrolRoute: CompRadius:%1, Speed:%2, Type:%3, Position:%4",waypointCompletionRadius _curWp, waypointSpeed _curWp, waypointType _curWp, waypointPosition _curWp];
             diag_log format ["Debug:PatrolRoute: Group Loc: %1", getPos (leader _group)];
             sleep 60;
         };
     };
 };
HCDEBUG = "";
 
 
 
 