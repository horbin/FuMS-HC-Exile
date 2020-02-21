// SpawnFlamer.sqf
// TheOneWhoKnocks
// 05/01/2019
// This script will spawn a Flamer if the trigger object is found
// Many thanks to the main himself, Alias, whose hard work and creativity made these scripts possible and thankfully he was willing to share them with the community
/*
// by ALIAS

[marker,territory_radius,damage_inflicted,health_points] execvm "AL_flamer\al_flamer.sqf";

marker				- string, name of the marker where you want to place the anomaly
territory_radius	- number, radius in meters of FLAMERs territory
damage_inflicted	- number, damage inflicted by FLAMERs main attack
health_points		- number, amount of health/hit points FLAMER has

>>>>> EXAMPLE

["flamer_1",300,0.1,500] execvm "AL_flamer\al_flamer.sqf";
*/

// This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.


private ["_flamerMarker","_flamerRadius","_flamerDamage","_flamerHealth"];

_flamerMarker = _this select 0;
_flamerRadius = 300;
_flamerDamage = 0.1;
_flamerHealth = 500;


FuMS_SpawnFlamer = [_flamerMarker,_flamerRadius,_flamerDamage,_flamerHealth];
publicVariableServer "FuMS_SpawnFlamer";



diag_log format ["<FuMS> SpawnFlamer: Flamer trigger spawned at :%1", getPos _flamerMarker];
