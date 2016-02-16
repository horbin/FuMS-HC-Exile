//ScriptPatrol.sqf
// Horbin
// 1/21/15
//Inputs: group, position of script,"AIscriptName", [array of values]  which are passed to the specific script.


// This ONLY LAUNCHES AI_PB script! So this is now Tier03!

//HC_AddWaypoint = compile preprocessFileLineNumbers "HC\Functions\HC_AddWaypoint.sqf";

//_wp = [_group, [_xx, _yy], 0] call HC_AddWaypoint;  
//AI_PB.sqf - patrols buildings [radius, time]
// [_group, _pos, "AI_PB", [radius, time] ] call ScriptPatrol
private ["_group","_location","_passOnData","_aiScript","_wp","_script"];
_group = _this select 0;
_location = _this select 1; // location script should start at.
_aiScript = _this select 2; // name of script
_passOnData = _this select 3; // array to be sent to the script.
_xfillVehicleWP = _this select 4;
//diag_log format ["##ScriptPatrol MoveWaypoint  for %1 at %2",_group, _location];
_wp = [_group, _location,0] call FuMS_fnc_HC_AI_Logic_Addwaypoint;  // basic move to waypoint to ensure AI gets there before script run.
//_script = format ["HC\Encounters\AI_Logic\%1.sqf",_aiScript];
//diag_log format ["##ScriptPatrol Scripted waypoint adeded. Info:%1  script:%2",_passOnData, _script];
// this will be done outside of ScriptPatrol ..just here for testing!
_wp = [_group, _location,0] call FuMS_fnc_HC_AI_Logic_Addwaypoint;
_wp setWaypointSpeed "FULL";
_wp setWaypointType "GETIN";
// add all necessary wp's before starting script to ensure tracability.
//[_group, _passOnData] execVM _script;
[_group, _passOnData] spawn FuMS_fnc_HC_AI_Logic_AIPB;
//diag_log format ["##ScriptPatrol execVM: %1 for _%2",_script, _group];
_wp
