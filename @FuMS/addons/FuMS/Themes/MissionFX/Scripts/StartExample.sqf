//StartExample.sqf
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
private ["_encounterCenter","_missionOffset","_buildings","_groups","_vehicles","_lootBoxes",
"_yourCustomVariables"];


_encounterCenter = _this select 0;
_missionOffset = _this select 1;
_buildings = _this select 2;
_groups = _this select 3;
_vehicles = _this select 4;
_lootBoxes = _this select 5;
_yourCustomVariables = []; // store information you want passed to your custom 'mission end' script in this array!

diag_log format ["<FuMS> Custom Script: StartExample executed."];

// To call any other custom script you have designed AND defined in the \FuMS\Theme\<your theme>\Scripts folder
// simply call it by name.
diag_log format ["<FuMS> StartExample Script _vehicles %1 | _buildings %2",_vehicles,_buildings];
[_vehicles] call supportscript;
// could also spawn it...
//[_vehicles] spawn supportscript;

//You may also call any scripts located in your main MPmission.pbo via normal path definitions.
// []execVM Scripts\my_other_custom_scripts

// Data you may need in your Custom End Script, assign to _yourCustomVariable as part of an array.
// the below variable will be passed into the End Script.
_yourCustomVariable = ["StringTest", 25, [[1,1],[2,2]], "OtherTestData"];
// Start scripts MUST return the below information or FuMS may crash!
[_buildings, _groups, _vehicles, _lootboxes, _yourCustomVariables]