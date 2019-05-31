fnc_find_target_flamer = {
	params ["_flamer","_teritoriu"];
	private ["_neartargets","_teritoriu"];
	_neartargets = (ASLToAGL getPosASL _flamer) nearEntities ["Exile_Unit_Player",_teritoriu];
	_neartargets - [_flamer]
};

fnc_avoid_flamer = {
	params ["_flamer","_chased"];
	private ["_flamer","_chased"];
	if (isPlayer _chased) exitWith {};
	_relPos = _chased getPos [30, (_flamer getDir _chased) + (random 33)*(selectRandom [1,-1])];
	_chased doMove _relPos;
	_chased setSkill ["commanding", 1];
};

fnc_attk_flamer = {
	params ["_flamer","_tgt_casp","_damage_flamer"];
	private ["_flamer","_tgt_casp","_damage_flamer"];
	_shoot_dir = (getposasl _flamer vectorFromTo getposasl _tgt_casp) vectorMultiply 15;
	[_flamer getVariable "_cap_flamer",["foc_initial",500]] remoteExec ["say3d"];
	[[_flamer,_shoot_dir],"AL_flamer\plasma_SFX.sqf"] remoteExec ["execVM"];
	sleep 0.5; //	hint "booooooooooom";
	_tip = selectrandom ["04","burned","02","03"];
	_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities ["Exile_Unit_Player",5]; {_x setDamage (getDammage _x + _damage_flamer); [_x,[_tip,200]] remoteExec ["say3d"];} forEach (_nearflamer-[_flamer]);
	_nearvik = nearestObjects [position _flamer,["CAR","TANK","PLANE","HELICOPTER","Motorcycle","Air"],7,false]; {_x setDamage (getdammage _x + _damage_flamer)} forEach _nearvik;
	sleep 4;
	_flamer setVariable ["atk",false];
};

fnc_hide_flamer = {
	_this setVariable ["vizibil",false,true];
	[_this getVariable "_cap_flamer",["foc_initial",1000]] remoteExec ["say3d"];
	_this enableSimulationGlobal false; _this hideObjectGlobal true;
};

fnc_show_flamer = {
	params ["_flamer","_poz_orig_sc","_teritoriu","_damage_flamer"];
	private ["_flamer","_poz_orig_sc","_pos_strig","_teritoriu","_damage_flamer"];
	_pos_strig = [_poz_orig_sc,1,_teritoriu/10, 3, 0, 20, 0] call BIS_fnc_findSafePos;
	_flamer setPos _pos_strig;
	_flamer setVariable ["vizibil",true,true];
	[[_flamer,_damage_flamer],"AL_flamer\flamer_sfx.sqf"] remoteExec ["execVM",0];
	_flamer enableSimulationGlobal true; _flamer hideObjectGlobal false; {_flamer reveal _x} forEach (_flamer nearEntities [["Exile_Unit_Player"],100]);
	[_flamer getVariable "_cap_flamer",["foc_initial",1000]] remoteExec ["say3d"];
};

fnc_jump_flamer = {
	params ["_flamer","_tgt_casp","_cap_flamer"];
	private ["_jump_dir","_blast_dust","_flama","_li_fire","_bbb"];
	_jump_dir = (getposasl _flamer vectorFromTo getposasl _tgt_casp) vectorMultiply round (10+random 10);
	_salt_sunet= selectRandom ["01_blast","02_blast","03_blast"]; 
	_obj_veg = nearestTerrainObjects [position _flamer,["TREE","SMALL TREE","BUSH","FOREST BORDER","FOREST TRIANGLE","FOREST SQUARE","FOREST"],20,false];
	_nearvik = nearestObjects [position _flamer,["CAR","TANK","PLANE","HELICOPTER","Motorcycle","Air"],20,false];
	[_cap_flamer,[_salt_sunet,200]] remoteExec ["say3d"];
	_flamer setvelocity [_jump_dir # 0,_jump_dir # 1,round (10+random 15)];
	{_x setDamage [1,false]; _x hideObjectGlobal true} foreach _obj_veg;
	{_x setDamage (getdammage _x + 0.05)} forEach _nearvik;
};