// SpawnCrazy.sqf
// TheOneWhoKnocks
// 05/01/2019
// This script will spawn kamikaze crazy people if the trigger object is found
// Many thanks to the main himself, Alias, whose hard work and creativity made these scripts possible and thankfully he was willing to share them with the community
/*
// by ALIAS

nul = [unit_name,trigger_distance,sound,chase_players] execvm "Scripts\kam.sqf";

unit				- string, is the name of the kamikaze unit
trigger_distance	- number, distance from targeted player at which the kamikaze will blow himself up
sound				- boolean, if is true a random sound from a given array is played, if is false kamikaze will not shout
chase_players		- boolean, if true the kamikaze unit will chase players, otherwise will be pasive and blow himself up when a random player is in its proximity

// >>>> Example 1
nul = [this,50,true,true] execvm "Scripts\kam.sqf";

- kamikaze will blow up at 50 meters from target
- kamikaze will yell
- Kamikaze will chase players


// >>>> Example 2
nul = [this,50,false,false] execvm "Scripts\kam.sqf";

- kamikaze will blow up at 50 meters from target
- kamikaze will NOT yell
- Kamikaze will NOT chase players



// SPAWNING A CUSTOM NUMBER OF KAMIKAZE AT A GIVEN MARKER POSITION
null = [MARKER_name,kamikaze_number,sound,chase_players,trigger_distance]  execvm "Scripts\kam_group.sqf";

>> Example
null = ["spawn_me",10,true,true,10] execvm "Scripts\kam_group.sqf";
*/

// This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

private ["_crazyMarker","_kamikazeNumber","_sound","_chasePlayers","_triggerDistance"];

_crazyMarker = _this select 0;

_kamikazeNumber = 4;
_sound = true;
_chasePlayers = true;
_triggerDistance = 25;

FuMS_SpawnCrazy = [_crazyMarker,_kamikazeNumber,_sound,_chasePlayers,_triggerDistance];
publicVariableServer "FuMS_SpawnCrazy";

diag_log format ["<FuMS> SpawnCrazy: Crazy trigger marker:%1", _crazyMarker];
