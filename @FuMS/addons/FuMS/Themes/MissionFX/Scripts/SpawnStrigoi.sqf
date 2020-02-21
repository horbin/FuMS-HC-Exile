// SpawnStrigoi.sqf
// TheOneWhoKnocks
// 05/01/2019
// This script will spawn a Strigoi if the trigger object is found
// Many thanks to the main himself, Alias, whose hard work and creativity made these scripts possible and thankfully he was willing to share them with the community
/*
// by ALIAS
// Tutorial: https://www.youtube.com/user/aliascartoons


================================================================================================================================
STRIGOI Parameters =======================
================================================================================================================================
[_marker_name,_territory,_day_activ,_inflicted_damage,_hp_strigoi] execvm "AL_strigoi\strigoi.sqf"

_marker_name		- string, name of the marker where you want to place the anomaly
_territory			- number, meters, strigoi will move and be active only within boundaries of his territory
_day_activ			- boolean, if false strigoi will be active only at night, if tru he will be active both night and day
_inflicted_damage	- number, the amount of damage strigoi will inflict to his target during attack
_hp_strigoi			- number, strigois health points, as higher it is as resilient will be

================================================================================================================================
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> EXAMPLES <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
================================================================================================================================

// NOT ACTIVE DURING DAYTIME
["strigoi_1",500,false,0.1,30] execvm "AL_strigoi\strigoi.sqf";

// ACTIVE DURING NITGHT AND DAY
["strigoi_1",300,true,0.1,50] execvm "AL_strigoi\strigoi.sqf";
*/

// This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.


private ["_strigoiMarker","_territory","_day_activ","_inflicted_damage","_hp_strigoi"];

_strigoiMarker = _this select 0;

_territory = 300;
_day_activ = true;
_inflicted_damage = 0.1;
_hp_strigoi = 30;

FuMS_SpawnStrigoi = [_strigoiMarker,_territory,_day_activ,_inflicted_damage,_hp_strigoi];
publicVariableServer "FuMS_SpawnStrigoi";

diag_log format ["<FuMS> SpawnStrigoi: Strigoi marker:%1", _strigoiMarker];
