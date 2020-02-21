// by ALIAS
// see ini_nuke.sqf for more info about parameters

private ["_weather_effect"];

if (!isServer) exitWith {};

_obj_nuke				= _this select 0;
_radius					= _this select 1;
_damage_buildings_units = _this select 2;
_weather_effect 		= _this select 3;
_radiation 				= _this select 4;
_radiation 				= _this select 5;
_emp_range				= _this select 6;

if (!isNil {_obj_nuke getVariable "is_ON"}) exitwith {};
_obj_nuke setVariable ["is_ON",true,true];

[[_obj_nuke,_radius],"Al_Nuke\ignite_nuke_alt.sqf"] remoteExec ["execVM"];

if (_radiation) then 
{
	[[],"Al_Nuke\ash_nuke.sqf"] remoteExec ["execVM",0,true];
	null=[_obj_nuke] execvm "Al_Nuke\falling_nuke.sqf"
};

if (_weather_effect) then 
{
	[[],"Al_Nuke\weather_nuke.sqf"] remoteExec ["execVM",0,true];
	null=[] execvm "Al_Nuke\fog_nuke.sqf"
};

if (_damage_buildings_units) then {sleep 1; null = [_obj_nuke,_radius] execvm "Al_Nuke\damage_nuke.sqf"};

if (_radiation) then 
{
	[[_obj_nuke,_radius],"Al_Nuke\rad_nuke.sqf"] remoteExec ["execVM",0,true];
};

if (_emp_range>0) then 
{
	[[_obj_nuke,_emp_range],"Al_Nuke\emp_nuke.sqf"] remoteExec ["execVM"];
};
enableEnvironment [false,false];
sleep 120; 
deleteVehicle _obj_nuke;
sleep 300;
enableEnvironment [true,true];