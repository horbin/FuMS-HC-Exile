// by ALIAS

private ["_rad_location","_rad_radius","_list_ai_in_range","_pos_rad","_op_dir","_fct","_reldir"];

_rad_location = _this select 0;
_rad_radius	  = _this select 1;

while {!isNil "_rad_location"} do 
{
	if (_rad_location in allMapMarkers) then 
	{
		_pos_rad = getMarkerPos _rad_location;
		_list_ai_in_range = _pos_rad nearEntities ["Man",_rad_radius];
	} else {
		_pos_rad = position _rad_location;
		_list_ai_in_range = _pos_rad nearEntities ["Man",_rad_radius];
	};
		
	if (count _list_ai_in_range>0) then 
	{
		{
		if ((local _x) and ((headgear _x == rad_det)or(goggles _x==rad_det)or(uniform _x==rad_det)or(vest _x==rad_det)or(Backpack _x==rad_det) or (rad_det in (assigneditems _x + items _x)))) then 
		{
			_reldir = [_x, _pos_rad] call BIS_fnc_dirTo;
			_fct = [30,-30] call BIS_fnc_selectRandom;
			if (_reldir<180) then {_op_dir=_reldir+180 +_fct} else {_op_dir=_reldir-180+_fct};
			_avoid_poz = [getposATL _x,(_rad_radius+10)+random 100, _op_dir] call BIS_fnc_relPos;
			_x doMove _avoid_poz;
			_x setSkill ["commanding", 1];
		}
		} foreach _list_ai_in_range;
		
		{[_x,_pos_rad,_rad_radius] execvm "AL_radiation\ai_flicker.sqf"} foreach _list_ai_in_range;
	};
	sleep 2;
};