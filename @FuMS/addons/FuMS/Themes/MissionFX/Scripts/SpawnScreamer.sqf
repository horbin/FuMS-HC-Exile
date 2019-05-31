// SpawnScreamer.sqf
// TheOneWhoKnocks
// 05/01/2019
// This script will spawn a Screamer if the trigger object is found
// Many thanks to the main himself, Alias, whose hard work and creativity made these scripts possible and thankfully he was willing to share them with the community
/*
// by ALIAS
// SCREAMER DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons


================================================================================================================================
SCREAMER Parameters =======================
================================================================================================================================
null = [marker_name]execvm "AL_screamer\screamer.sqf"

marker_name	- string, name of the marker where you want to place the anomaly

================================================================================================================================
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> EXAMPLES <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
================================================================================================================================

null=["screamer_1"] execvm "AL_screamer\screamer.sqf"
*/

// This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.


private ["_screamerMarker"];

_screamerMarker = _this select 0;

FuMS_SpawnScreamer = [_screamerMarker];
publicVariableServer "FuMS_SpawnScreamer";

diag_log format ["<FuMS> SpawnScreamer: Screamer trigger spawned at :%1", _screamerMarker];
