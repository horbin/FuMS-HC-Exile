// by ALIAS

params ["_flamer"];
waitUntil {sleep 1; !alive _flamer};
[[_flamer],"AL_flamer\flamer_end_SFX.sqf"] remoteExec ["execvm"];
_burn_grnd_last = "Crater" createVehicle [getPosASL _flamer select 0,getPosASL _flamer select 1,0];
_burn_grnd_last say3D ["close_bomb",300];
_obj_veg = nearestTerrainObjects [position _flamer,["TREE","SMALL TREE","BUSH","FOREST BORDER","FOREST TRIANGLE","FOREST SQUARE","FOREST"],20,false];
_obj_man = _flamer nearEntities ["Exile_Unit_Player",20];
_obj_build = nearestObjects [position _flamer,["BUILDING","HOUSE","CHURCH","CHAPEL","FUELSTATION","HOSPITAL","RUIN","BUNKER","Land_fs_roof_F","Land_TTowerBig_2_F","Land_TTowerBig_1_F","Lamps_base_F","PowerLines_base_F","PowerLines_Small_base_F","Land_LampStreet_small_F","CAR","TANK","PLANE","HELICOPTER","Motorcycle","Air","Ship"],20,false];
{_x setDamage [1,false]} foreach (_obj_build - [_burn_grnd_last]);
{_x setDamage [1,false]} foreach _obj_veg;
{_x setDamage 1} foreach _obj_man;