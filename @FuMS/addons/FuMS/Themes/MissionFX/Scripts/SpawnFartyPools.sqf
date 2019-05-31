// SpawnFartyPools.sqf
// TheOneWhoKnocks
// 05/01/2019
// This script will spawn a Farty Pool if the trigger object is found
// Many thanks to the main himself, Alias, whose hard work and creativity made these scripts possible and thankfully he was willing to share them with the community

//by ALIAS

/*
-------------------------------------------------------------
[_puddleName,_puddle_SFX] execVM "AL_farty\simple_toxic_puddle.sqf";

_puddleName - string, the name of the object you want to the location from
_puddle_SFX	 - boolean, if is true bubbles and smoke will be generated in that puddle

If you want to place toxic puddles by hand follow these steps:
1. in EDEN place an object on the ground in desired position, doesn't matter what object because is going to be deleted anyways,
	--the puddle will have the same direction as the object you placed
2. give the object a name and use it as parameter in the line below 
3. chose a value for puddle_SFX and place it in parameters
4. copy-paste the line in your init.sqf


Examples:
[my_puddle_1,true] execVM "AL_farty\simple_toxic_puddle.sqf";
[my_puddle_2,false] execVM "AL_farty\simple_toxic_puddle.sqf";
*/

// This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.


private ["_puddleName","_puddle_SFX"];
_puddleName = _this select 0;
_puddle_SFX = true;

FuMS_SpawnFartyPools = [_puddleName,_puddle_SFX];
publicVariableServer "FuMS_SpawnFartyPools";

diag_log format ["<FuMS> SpawnFartyPools: Farty pools spawned at :%1", _puddleName];
