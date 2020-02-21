// by ALIAS

private ["_obj_rad_obj","_rad_radius_obj","_rad_dam_obj","_rad_prot_mask_obj","_glowindark","_timetoglow","_list_ai_in_range"];

if (!isServer) exitWith {};

_obj_rad_obj 		= _this select 0;
_rad_radius_obj 	= _this select 1;
_rad_dam_obj 		= _this select 2;
_rad_prot_mask_obj	= _this select 3; 
_rad_detector		= _this select 4;
_glowindark		 	= _this select 5;
_timetoglow	 	 	= _this select 6;
_rad_affect_AI		= _this select 7;

if (isNil {_obj_rad_obj getVariable "isalreadyon"}) then 
{
_obj_rad_obj setVariable ["isalreadyon",true,true];
obj_prot_rad = _rad_prot_mask_obj;
publicVariable "obj_prot_rad";

rad_det = _rad_detector;
publicVariable "rad_det";

AI_react_rad = _rad_affect_AI;
publicVariable "AI_react_rad";

glowindark = _glowindark; 
publicVariable "glowindark";

if (glowindark) then {if (_timetoglow>0) then {timetoglow = _timetoglow; publicVariable "timetoglow"} else {hint "Time to glow must be bigger than 0(ZERO)"};};

if (AI_react_rad) then {[[_obj_rad_obj,_rad_radius_obj],"AL_radiation\ai_avoid_rad.sqf"] remoteExec ["execvm",0,true];};

waitUntil {!isNil "glowindark"};

[[_obj_rad_obj,_rad_radius_obj,_rad_dam_obj], "AL_radiation\rad_emitter.sqf"] remoteExec ["execVM",0,true];

if (glowindark) then 
{
	[[_obj_rad_obj,_rad_radius_obj], "AL_radiation\ai_flicker.sqf"] remoteExec ["execVM",0,true];
		
	while {!isNull _obj_rad_obj} do 
	{
		_list_ai_in_range = (position _obj_rad_obj) nearEntities ["Man",_rad_radius_obj];
// if you don't want the sneaks to glow use the line below instead of the one above
// _list_ai_in_range = (position _obj_rad_obj) nearEntities [["Civilian","SoldierGB","SoldierEB","SoldierWB"],_rad_radius_obj];
		if (count _list_ai_in_range>0) then 
		{
			{
			if ((headgear _x == obj_prot_rad)or(goggles _x==obj_prot_rad)or(uniform _x==obj_prot_rad)or(vest _x==obj_prot_rad)or(Backpack _x==obj_prot_rad) or (obj_prot_rad in (assigneditems _x + items _x))) then {} else {_x setdammage ((getdammage _x)+_rad_dam_obj);};
			} foreach _list_ai_in_range;
		};	
	sleep 2;
	};
};
};