private ["_obj_rad","_list_ai_in_range","_rad_rad","_reldir","_op_dir","_avoid_poz","_fct","_pos_rad"];

_obj_rad = _this select 0;
_rad_rad = _this select 1;

while {alive _obj_rad} do 
{
	_list_ai_in_range = (position _obj_rad) nearEntities [["Civilian","SoldierGB","SoldierEB","SoldierWB"],_rad_rad];
	if (count _list_ai_in_range>0) then 
	{
		{
		if ((local _x) and ((headgear _x == rad_det)or(goggles _x==rad_det)or(uniform _x==rad_det)or(vest _x==rad_det)or(Backpack _x==rad_det) or (rad_det in (assigneditems _x + items _x)))) then 
		{
			//[str _list_ai_in_range] remoteExec ["hint",0,true];
			_reldir = [_x, getpos _obj_rad] call BIS_fnc_dirTo;
			_fct = [30,-30] call BIS_fnc_selectRandom;
			if (_reldir<180) then {_op_dir=_reldir+180 +_fct} else {_op_dir=_reldir-180+_fct};
			_avoid_poz = [getposATL _x,(_rad_rad+10)+random 100, _op_dir] call BIS_fnc_relPos;
			_x setSkill ["commanding", 1];
			_x doMove _avoid_poz;
		}
		} foreach _list_ai_in_range;
	};
	sleep 5;
};