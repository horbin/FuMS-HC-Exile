// by ALIAS

private ["_unit_to_reveal","_potential_spotters","_player_glowing"];

if (!isServer) exitWith {};

_unit_to_reveal	= _this select 0;
_player_glowing = _unit_to_reveal getVariable "glowing_player";

	while {_player_glowing} do 
	{
		{_x reveal _unit_to_reveal} forEach allUnits;
		sleep timetoglow;
		_player_glowing = _unit_to_reveal getVariable "glowing_player";
	};

	{_x forgetTarget _unit_to_reveal} forEach allUnits;