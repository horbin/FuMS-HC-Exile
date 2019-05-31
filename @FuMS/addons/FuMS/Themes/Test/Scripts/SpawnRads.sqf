// SpawnRads.sqf
// TheOneWhoKnocks
// 05/01/2019
// This script will activate the radiation effect if the trigger object is found
// Many thanks to the main himself, Alias, whose hard work and creativity made these scripts possible and thankfully he was willing to share them with the community
/*
// by ALIAS


// =========== Objects emitting radiation

null = [_obj_rad,_rad_radius,_rad_dam,_rad_prot_equip,_rad_detector,_glowindark,_timetoglow,_AI_react_rad] execvm "AL_radiation\radioactive_object.sqf";

_obj_rad		- string, the object which will radiate
_rad_radius		- number, area around the object affected by radiation
_rad_dam		- number, amount of damage inflicted on player over time
_rad_prot_equip	- string, class name of the equipment you want to use as protective gear, it can be a helmet, vest, googles or backpack, but the script can be tweaked to acomodate other items if needed
_rad_detector	- string, class name of the item used as radiation detector
_glowindark		- boolean, if true the units will glow in the dark when they are irradiated
_timetoglow		- number, time for which the unit will glow in the dark, _glowindark must be true for this time to be considered
_AI_react_rad	- boolean, if true AI will move away from radiation if they have a detector, they will also take damage from radiation if they don't have protective gear

//Example =====================================================================
null = [object_name,30,0.02,"H_PilotHelmetFighter_B","MineDetector",false,10,true] execvm "AL_radiation\radioactive_object.sqf";

// if you do not want to use a radiation detector assign as detector an item that all players would have by default, like a map or watch
// this way everyone possessing for instance a watch will hear the geiger sound

// making an object radioactive
//null = [my_radioactive_obj,15,0.02,"H_PilotHelmetFighter_B","MineDetector",true,10,true] execvm "AL_radiation\radioactive_object.sqf";
null = [my_radioactive_obj,15,0,"H_PilotHelmetFighter_B","MineDetector",true,10,true] execvm "AL_radiation\radioactive_object.sqf";

null = [bob,30,0.02,"H_PilotHelmetFighter_B","MineDetector",true,10,true] execvm "AL_radiation\radioactive_object.sqf";

null = [desk,5,0.02,"H_PilotHelmetFighter_B","MineDetector",true,10,true] execvm "AL_radiation\radioactive_object.sqf";



// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// I DO NoT RECOMMEND USING THE METHOD BELLOW BECAUSE I DID NoT HAVE TIME TO TEST IT WITH THE NEW AI DAMAGE SYSTEM, GLOWING AND DETECTION
STILL NEEDS WORK!!!
// ============== Radiation areas
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

// EX:
are_gen = [3,50,0.01,"H_PilotHelmetFighter_B",["a","b","c"],"ItemWatch"] execVM "AL_radiation\area_radiation.sqf";

nul = [_number_of_areas,_ras_radius,_rad_prot_equip,_ignore_markers,false,10,false] execVM "ambient\area_radiation.sqf";

_number_of_areas	- integer, number of radioactive areas you want to have 
_rad_radius			- number, area around the marker affected by radiation
_rad_dam			- number, amount of damage inflicted on player over time
_rad_prot_equip		- string, class name of the equipment you want to use as protective gear, it can be a helmet, vest, googles or backpack, but the script can be tweaked to acomodate other items if needed
_ignore_markers		- array containing emapty markers which you want to be ignored by script and not place radioactive areas there
_rad_detector	- string, class name of the item used as radiation detector
_glowindark		- boolean, if true the units will glow in the dark when they are irradiated
_timetoglow		- number, time for which the unit will glow in the dark, _glowindark must be true for this time to be considered
_AI_react_rad	- boolean, if true AI will move away from radiation if they have a detector, they will also take damage from radiation if they don't have protective gear

Example =====================================================================
nul = [3,50,0.01,"H_PilotHelmetFighter_B",["a","b","c"],"MineDetector",false,10,false] execVM "AL_radiation\area_radiation.sqf";

// no markers in ignore marker array, so any empty marker on the map can be used to create a radioactive zone
nul = [3,50,0.01,"H_PilotHelmetFighter_B",[],"MineDetector",false,10,false] execVM "AL_radiation\area_radiation.sqf";
*/

// This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

private ["_obj_rad","_rad_radius","_rad_dam","_rad_prot_equip","_rad_detector","_glowindark","_AI_react_rad"];

_obj_rad = _this select 0;
_rad_radius	= 25;							// number, area around the object affected by radiation
_rad_dam = 0.02;							// number, amount of damage inflicted on player over time
_rad_prot_equip = "H_PilotHelmetFighter_B";	// string, class name of the equipment you want to use as protective gear, it can be a helmet, vest, googles or backpack, but the script can be tweaked to acomodate other items if needed
_rad_detector = "ItemRadio";				// string, class name of the item used as radiation detector
_glowindark	= false;						// boolean, if true the units will glow in the dark when they are irradiated
											// DO NOT USE ^^^ YET, THIS HAS NOT BEEN IMPLEMENTED ON THE FuMS SYSTEM
_timetoglow = 0;							// number, time for which the unit will glow in the dark, _glowindark must be true for this time to be considered
_AI_react_rad = true;						// boolean, if true AI will move away from radiation if they have a detector, they will also take damage from radiation if they don't have protective gear


FuMS_SpawnRads = [_obj_rad,_rad_radius,_rad_dam,_rad_prot_equip,_rad_detector,_glowindark,_timetoglow,_AI_react_rad];
publicVariableServer "FuMS_SpawnRads";

diag_log format ["<FuMS> SpawnRads: Radiation trigger marker:%1", _obj_rad];
