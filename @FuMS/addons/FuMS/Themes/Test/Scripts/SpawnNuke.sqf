// SpawnNuke.sqf
// TheOneWhoKnocks
// 05/01/2019
// This script will activate the radiation effect if the trigger object is found
// Many thanks to the main himself, Alias, whose hard work and creativity made these scripts possible and thankfully he was willing to share them with the community
/*
// by ALIAS
// Tutorial: https://www.youtube.com/watch?v=brQa42CRcWE


/*
* Script MP and SP compatible
** Impact on FPS can be remarcable depending on parameters, so use with care and test first

// nul = [nuke_obj,radius,damage_buildings_units,weather_effect,radiation,fallout] execvm "Al_Nuke\alias_nuke.sqf";

nuke_obj				- string, the name you gave to the object you want as origin for nuke
radius					- meters, area around marker where damage and radiation will be effective
damage_buildings_units	- boolean, if true the objects inside the radius will be destroyed
weather_effect			- boolean, if true the wheather will be affected for 300 seconds
radiation				- boolean, if true players will get damage from radiation inside defined radius
fallout					- boolean, if true screen effect will simulate fallout once the initial blast is gone
EMP						- number, range in meters affected by EMP
							- NVG, Rangefinder, GPS, radio, thermal - vanilla assets will be removed from units
							- street lamps, towers - vanilla assets will be damaged
							- vehicles - vanilla assets will have the engine damaged
							* for this to work with mods (in case they have different classes) you need to add their className in the array you can find in emp_nuke,sqf
*/

/**** Example Usage

ex. 1- Will be only for show, no damage will be inflicted, no radiation, no fallout and weather effect, no EMP
	nul = [nuke,0,false,false,false,false,0] execvm "Al_Nuke\alias_nuke.sqf";

ex. 2- All optional parameters enabled
	nul = [nuke,200,true,true,true,true,1000] execvm "Al_Nuke\alias_nuke.sqf";
	
	


nul = [nuke_me,200,true,true,true,true,1000] execvm "Al_Nuke\alias_nuke.sqf";

// ======== Example for player dropped NUKE - designate the type of bomb by giving the className below in this example i used "Bomb_04_F" found on vanilla Wipeout plane
// you can define whatever bomb you want to work as NUKE, edit value of _custom_nuke_bomb variable
//Place lines below in init field of the plane you want to use to drop nukes from.

this addEventHandler ["Fired",{private ["_bomb_type","_custom_nuke_bomb","_plane_player"];_plane_player = _this select 0;_bomb_type = _this select 6;
_custom_nuke_bomb = "Bomb_04_F";  
[[_bomb_type,_custom_nuke_bomb,_plane_player,300,true,true,true,true,1000],"Al_Nuke\alias_nuke_player.sqf"] remoteExec ["execVM"]}];
	
	
	
	
*/

// This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

private ["_nuke_obj","_radius","_damage_buildings_units","_weather_effect","_radiation","_fallout","_EMP"];

_nuke_obj = _this select 0;			//- string, the name you gave to the object you want as origin for nuke
_radius = 500;						//- meters, area around marker where damage and radiation will be effective
_damage_buildings_units = true;		//- boolean, if true the objects inside the radius will be destroyed
_weather_effect	= true;				//- boolean, if true the wheather will be affected for 300 seconds
_radiation	= true;					//- boolean, if true players will get damage from radiation inside defined radius
_fallout = true;					//- boolean, if true screen effect will simulate fallout once the initial blast is gone
_EMP = 300;							//- number, range in meters affected by EMP

sleep 300;
FuMS_SpawnNuke = [_nuke_obj,_radius,_damage_buildings_units,_weather_effect,_radiation,_fallout,_EMP];
publicVariableServer "FuMS_SpawnNuke";

diag_log format ["<FuMS> SpawnNuke: Nuke trigger marker:%1", _nuke_obj];
