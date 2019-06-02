//by ALIAS
private ["_unit","_location_mark","_damage_toxic","_radius_toxic","_reldir","_fct","_op_dir","_avoid_poz","_sick"];

_unit = _this select 0;
_location_mark = _this select 1;
_damage_toxic = _this select 2;
_radius_toxic = _this select 3;

if ((headgear _unit == obj_prot_toxic)or(goggles _unit==obj_prot_toxic)or(uniform _unit==obj_prot_toxic)or(vest _unit==obj_prot_toxic)or(Backpack _unit==obj_prot_toxic) or (obj_prot_toxic in (assigneditems _unit + items _unit))) exitwith {};

_reldir = [_unit,getMarkerPos _location_mark] call BIS_fnc_dirTo;
_fct = [30,-30] call BIS_fnc_selectRandom;
if (_reldir<180) then {_op_dir=_reldir+180 +_fct} else {_op_dir=_reldir-180+_fct};
_avoid_poz = [getposATL _unit,(_radius_toxic+10)+random 100, _op_dir] call BIS_fnc_relPos;
_unit setSkill ["commanding", 1];
_unit doMove _avoid_poz;
_unit setDamage (getdammage _unit)+_damage_toxic;
_sick = ["02_breat_toxic","03_breat_toxic","tuse_1","tuse_2","tuse_3"] call BIS_fnc_selectRandom;
[_unit,[_sick,100]] remoteExec ["say3d"];