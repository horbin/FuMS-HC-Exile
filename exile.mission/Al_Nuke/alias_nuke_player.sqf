
if (!isServer) exitWith {};

_bomb_type			= _this select 0;
_custom_jdam_bomb	= _this select 1;
_plane_player		= _this select 2;
_radius				= _this select 3;
_damage_buildings_units = _this select 4;
_weather_effect		= _this select 5;
_radiation			= _this select 6;
_fallout			= _this select 7;
_emp_range			= _this select 8;
//mushroom_type		= _this select 8;

if (typeOf _bomb_type != _custom_jdam_bomb) exitWith {};

waitUntil {(getposATL _bomb_type select 2)<50};
_poz_blow = getPos _bomb_type;
deletevehicle _bomb_type;
_bomb_obj_b = "Land_HelipadEmpty_F" createVehicle [_poz_blow select 0,_poz_blow select 1,0];

[[_bomb_obj_b,_radius],"Al_Nuke\ignite_nuke_alt.sqf"] remoteExec ["execVM"];

if (_fallout) then 
{
	[[],"Al_Nuke\ash_nuke.sqf"] remoteExec ["execVM",0,true];
	null=[_bomb_obj_b] execvm "Al_Nuke\falling_nuke.sqf"
};

if (_weather_effect) then 
{
	[[],"Al_Nuke\weather_nuke.sqf"] remoteExec ["execVM",0,true];
	null=[] execvm "Al_Nuke\fog_nuke.sqf"
};

if (_damage_buildings_units) then {sleep 1; [_bomb_obj_b,_radius] execvm "Al_Nuke\damage_nuke.sqf"};

if (_radiation) then 
{
	[[_bomb_obj_b,_radius],"Al_Nuke\ash_nuke.sqf"] remoteExec ["execVM",0,true];
};

if (_emp_range>0) then 
{
	[[_bomb_obj_b,_emp_range],"Al_Nuke\emp_nuke.sqf"] remoteExec ["execVM"];
};

enableEnvironment [false,false];
sleep 120; 
deleteVehicle _obj_nuke;
sleep 300;
enableEnvironment [true,true];