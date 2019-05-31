//EndExample.sqf
// Horbin
// 6/19/2015
// This is an example Custom script than can be executed by any FuMS mission.
// Note the code below to see what information is passed to any custom function you design.
// ********************************
// ********************************
// ********************************
// ********************************
// *** REMEMBER: This script will suspend normal mission execution while it runs
// *** If you need long control loops, ensure you 'spawn' those processes from this script.
// *** do not code in control loops in this script or the Mission may exhibit undesired behavior.
// ********************************
// ********************************
// ********************************
// ********************************
// ********************************
private ["_encounterCenter","_missionOffset","_buildings","_groups","_vehicles","_lootBoxes","_yourCustomVariables"];

_encounterCenter = _this select 0;
_missionOffset = _this select 1;
_buildings = _this select 2;
_groups = _this select 3;
_vehicles = _this select 4;
_lootBoxes = _this select 5;
_yourCustomVariables = _this select 6; 
// yourVar = _yourCustomVariables select 0;
// yourVar2 = _yourCustomVarialbes select 1;
// etc.....
diag_log format ["<FuMS> Custom Script: EndExample executed. Custom data: %1",_yourCustomVariables];

// End scripts MUST return the below information or FuMS may crash!
[_buildings, _groups, _vehicles, _lootboxes]