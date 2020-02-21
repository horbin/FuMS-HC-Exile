// SpawnSparky.sqf
// TheOneWhoKnocks
// 05/01/2019
// This script will spawn a Sparky if the trigger item is found
// Many thanks to the main himself, Alias, whose hard work and creativity made these scripts possible and thankfully he was willing to share them with the community
/*
// by ALIAS
// Sparky DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons


================================================================================================================================
Sparky Parameters =======================
================================================================================================================================
null = [marker_name,className_protection_gear,enable_AI_avoid_sparky] execvm "AL_spark\al_sparky.sqf";

marker_name					- string, name of the marker where you want to place the anomaly
className_protection_gear	- string, classname of the item you want to work as protective gear
enable_AI_avoid_sparky		- boolean, if true AI will move away from anomaly

================================================================================================================================
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> EXAMPLES <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
================================================================================================================================

null = ["plasma_anom","B_AssaultPack_blk",true] execvm "AL_spark\al_sparky.sqf";
	"B_AssaultPack_blk" as the protective equipment and AI will move away from Sparky

//
null = ["plasma_anom","B_AssaultPack_blk",false] execvm "AL_spark\al_sparky.sqf";
	AI will not avoid the anomaly
*/

// This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.


private ["_sparkyMarker","_protection_gear","_AI_avoid_sparky"];

_sparkyMarker = _this select 0;
_protection_gear = "B_AssaultPack_blk";
_AI_avoid_sparky = true;

FuMS_SpawnSparky = [_sparkyMarker,_protection_gear,_AI_avoid_sparky];
publicVariableServer "FuMS_SpawnSparky";

diag_log format ["<FuMS> SpawnSparky: Sparky trigger spawned at :%1", _sparkyMarker];
