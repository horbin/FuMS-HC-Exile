// SpawnFarty.sqf
// TheOneWhoKnocks
// 05/01/2019
// This script will spawn a Farty if the trigger object is found
// Many thanks to the main himself, Alias, whose hard work and creativity made these scripts possible and thankfully he was willing to share them with the community

//by ALIAS

//[_marker,_class_name,_anomalyVSarea,_radius,_damage_value,_farty_trail,_random_puddles] execVM "AL_farty\area_toxic_ini.sqf";

/*
_marker				- string, the name of the marker placed where you want Farty to be
_class_name			- string, the name of the item you want as protective gear
_anomalyVSarea		- boolean, if is true a toxic field is generated along with the anomaly, if false only the toxic field is created
_radius				- number, the radius of the toxic field
_damage_value		- number, the amount of damage the units inside toxic area will take
_farty_trail		- boolean, if is true Farty will leave a trail of toxic puddles while moving
_random_puddles		- number, must be integer and must be bigger than 0, if is negative will be ignored, is the number of random puddles will be generated inside toxic field


Example:

["myfarty","H_PilotHelmetFighter_B",true,30,0.01,true,7] execVM "AL_farty\area_toxic_ini.sqf";

*/

// This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.


private ["_fartyMarker","_class_name","_anomalyVSarea","_radius","_damage_value","_farty_trail","_random_puddles"];
_fartyMarker = _this select 0;
_anomalyVSarea = _this select 1;

_class_name = "H_PilotHelmetFighter_B";
_radius = 30;
_damage_value = 0.01;
_farty_trail = true;
_random_puddles = 7;

FuMS_SpawnFarty = [_fartyMarker,_class_name,_anomalyVSarea,_radius,_damage_value,_farty_trail,_random_puddles];
publicVariableServer "FuMS_SpawnFarty";

diag_log format ["<FuMS> SpawnFarty: Farty trigger spawned at :%1",_fartyMarker];
