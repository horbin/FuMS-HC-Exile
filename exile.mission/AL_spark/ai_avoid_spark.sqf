private ["_avoid_poz","_op_dir","_reldir"];

//if (!isServer) exitWith {};

_area_spark = _this select 0;

sleep 30;

while {true} do 
{

_list_ai_in_range = (getMarkerPos _area_spark) nearEntities ['Man',100];

if (count _list_ai_in_range>0) then 
{
	{
	if (local _x) then 
	{
		//_dir_ai = getDir _x;
		_reldir = [_x, getMarkerPos _area_spark] call BIS_fnc_dirTo;// hint str _reldir;
		_fct = [30,-30] call BIS_fnc_selectRandom;
		if (_reldir<180) then {_op_dir=_reldir+180+_fct} else {_op_dir=_reldir-180+_fct};
		_avoid_poz = [getposATL _x,100+random 500, _op_dir] call BIS_fnc_relPos;
		_x doMove _avoid_poz;
		_x setSkill ["commanding", 1];
	}
	} foreach _list_ai_in_range;

};
sleep 30;
};