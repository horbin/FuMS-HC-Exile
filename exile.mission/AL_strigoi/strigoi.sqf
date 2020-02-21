// by ALIAS
// ["strigoi_1",500,false,0.1] execvm "AL_strigoi\strigoi.sqf";
if (!isServer) exitwith {};

private ["_spawn_loc","_list_unit_range_casp","_pos_strig","_poz_orig_sc","_anomalie_dedus","_hp_strigoi","_gasit","_obj_de_agatat","_pot_poz","_press_implicit_x","_press_implicit_y","_fct_mult","_vert_vit","_inaltime_salt","_distanta_salt","_dur_zbor","_umbla_casper","_strigoi","_tgt_casp"];

fnc_avoid_casp ={
	private ["_danger_close","_op_dir","_chased_units","_fct","_reldir","_avoid_poz"];
	_danger_close = _this select 0;
	//_chased_units = _this select 1;
	_chased_units = [_danger_close] call fnc_find_target;
	{
		if (_x!=_danger_close) then {
		_reldir = [_x, getPos _danger_close] call BIS_fnc_dirTo;
		_fct = [30,-30] call BIS_fnc_selectRandom;
		if (_reldir<180) then {_op_dir=_reldir+180 +_fct} else {_op_dir=_reldir-180+_fct};
		_avoid_poz = [getposATL _x,20+random 20, _op_dir] call BIS_fnc_relPos;
		_x doMove _avoid_poz;
		_x setSkill ["commanding", 1];
		};
	} foreach _chased_units;
};

fnc_hide_strig = {
private ["_strigoi"];
_strigoi= _this select 0;
_strigoi setVariable ["vizibil",false,true];
[_cap_casper,["03_tip_casp",1000]] remoteExec ["say3d"];
_strigoi enableSimulationGlobal false; _strigoi hideObjectGlobal true;
};

fnc_show_strig = {
private ["_strigoi","_poz_orig_sc","_pos_strig","_teritoriu","_spawn_loc"];
_strigoi= _this select 0;
_poz_orig_sc= _this select 1;
_teritoriu= _this select 2;
_pos_strig = [getPos _poz_orig_sc,1,_teritoriu/10, 3, 0, 20, 0] call BIS_fnc_findSafePos;
_strigoi setPos _pos_strig;
_strigoi setVariable ["vizibil",true,true];
[[_strigoi],"AL_strigoi\strigoi_sfx.sqf"] remoteExec ["execVM",0,true];
_strigoi enableSimulationGlobal true; _strigoi hideObjectGlobal false; {_strigoi reveal _x} forEach allUnits;
[_cap_casper,["03_tip_casp",1000]] remoteExec ["say3d"];
};

fnc_find_target = {
private ["_strigoi","_list_unit_range_casp","_anomalie_dedus"];
_strigoi= _this select 0;
_list_unit_range_casp = [];
_list_unit_range_casp = (position _strigoi) nearEntities ['Exile_Unit_Player',100];
_anomalie_dedus = [_strigoi];
_list_unit_range_casp = _list_unit_range_casp - _anomalie_dedus;
_list_unit_range_casp
};

fnc_salt_strig_1 ={
private ["_strigoi","_poz_tgt","_umbla_casper","_obj_de_agatat","_cap_casper","_unghi_fugarit","_pot_poz"];
_strigoi		= _this select 0;
_poz_tgt		= _this select 1;
_umbla_casper	= _this select 2;
_obj_de_agatat	= _this select 3;
_cap_casper		= _this select 4;
_pot_poz		= _this select 5;

_umbla_casper setPos (_obj_de_agatat getPos [2,_obj_de_agatat getRelDir _poz_tgt]);
//_strigoi disableCollisionWith _obj_de_agatat;
sleep 0.2;
_salt_sunet=["01_salt","02_salt","03_salt"] call BIS_fnc_selectRandom; 
[_cap_casper,[_salt_sunet,200]] remoteExec ["say3d"];
_strigoi setVelocityTransformation [getPosASL _strigoi,getposasl _umbla_casper, velocity _strigoi,velocity _umbla_casper,[0,0,0],[0,0,0],[0,0,1],[0,0,2],0.3];
_strigoi disableCollisionWith _obj_de_agatat;
_strigoi attachto [_umbla_casper,[0,0,(getPos _obj_de_agatat select 2) + _pot_poz/4]];
_strigoi setdir (_strigoi getRelDir _poz_tgt);
_tipat_casp=["01_tip_casp","NoSound","02_tip_casp","03_tip_casp","NoSound","04_tip_casp","05_tip_casp","06_tip_casp","07_tip_casp","NoSound"] call BIS_fnc_selectRandom;
[_cap_casper,[_tipat_casp,500]] remoteExec ["say3d"];
sleep 1;
};

fnc_salt_strig_2 ={
private ["_strigoi","_tgt_casp","_umbla_casper","_obj_de_agatat"];
_strigoi		= _this select 0;
_tgt_casp		= _this select 1;
_umbla_casper	= _this select 2;
_obj_de_agatat	= _this select 3;
	
sleep 1;
_dir_salt = _strigoi getdir _tgt_casp;
if (_dir_salt<=90) then {_press_implicit_x = linearConversion [0, 90,_dir_salt, 0, 1, true];_press_implicit_y = 1-_press_implicit_x;};
if ((_dir_salt>90)and(_dir_salt<180)) then {_dir_salt = _dir_salt-90;_press_implicit_x = linearConversion [0, 90,_dir_salt, 1, 0, true];_press_implicit_y = _press_implicit_x-1;};
if ((_dir_salt>180)and(_dir_salt<270)) then {_dir_salt = _dir_salt-180;	_press_implicit_x = linearConversion [0, 90,_dir_salt, 0, -1, true];_press_implicit_y = (-1*_press_implicit_x)-1;};
if ((_dir_salt>270)and(_dir_salt<360)) then {_dir_salt = _dir_salt-270;_press_implicit_x = linearConversion [0, 90,_dir_salt, -1, 0, true];_press_implicit_y = 1+_press_implicit_x;};
_salt_sunet=["01_salt","02_salt","03_salt"] call BIS_fnc_selectRandom; 
_strigoi attachto [_umbla_casper,[0,0,((boundingCenter _obj_de_agatat) select 2)*2]];
[_cap_casper,[_salt_sunet,200]] remoteExec ["say3d"];
detach _strigoi;
sleep 0.1;
_strigoi setvelocity [_press_implicit_x*7,_press_implicit_y*7,3];
};

fnc_attk_strigoi = {
	private ["_strigoi","_tgt_casp","_damage_strig"];
	_strigoi		= _this select 0;
	_tgt_casp		= _this select 1;
	_damage_strig	= _this select 2;
	[[_strigoi,_tgt_casp],"AL_strigoi\atk_viz.sqf"] remoteExec ["execVM"];
	//if (_tgt_casp in allPlayers_on) then 
	{[[_damage_strig],"AL_strigoi\tgt_attk.sqf"] remoteExec ["execVM",_tgt_casp]}
	else {_tgt_casp setDamage ((getDammage _tgt_casp) + _damage_strig)};
	sleep 1;
};
/*
fnc_strig_drain ={
	private ["_list_unit_range_casp"];
	_list_unit_range_casp = _this select 0;
	{if !(_x in allPlayers_on) then {_x setFatigue ((getfatigue _x) + 0.1)}} forEach _list_unit_range_casp;
};
*/
if (!isServer) exitWith {};

_spawn_loc	= _this select 0;
_teritoriu		= _this select 1;
_vizible_day	= _this select 2;
_damage_strig	= _this select 3;
_hp_strigoi		= _this select 4;

hp_strig = 1/_hp_strigoi;

if (!_vizible_day) then {waitUntil{sleep 5; sunOrMoon==0}};
	_grp = createGroup CIVILIAN;
	
	_poz_orig_sc =  "Land_HelipadEmpty_F" createVehicle [getMarkerPos _spawn_loc select 0,getMarkerPos _spawn_loc select 1,round (2+random 7)];
	_pos_strig = [getPos _poz_orig_sc,1,_teritoriu/10, 3, 0, 20, 0] call BIS_fnc_findSafePos;
	_strigoi = _grp createUnit ["C_Soldier_VR_F",_pos_strig, [], _teritoriu/10,"NONE"];
	_strigoi setSpeaker "NoVoice";_strigoi disableConversation true;_strigoi setcaptive true; _strigoi addRating -10000;_strigoi setBehaviour "CARELESS";_strigoi enableFatigue false;_strigoi setSkill ["courage", 1];_strigoi setUnitPos "UP"; RemoveAllItems _strigoi; removeUniform _strigoi; Removevest _strigoi; removeHeadgear _strigoi; removeAllWeapons _strigoi; _strigoi unassignItem "NVGoggles"; _strigoi removeItem "NVGoggles";_strigoi setUnitPos "UP";
	_strigoi removeAllEventHandlers "hit";
	_strigoi addEventHandler ["Hit", {[[_this select 0],"AL_strigoi\splash_hit.sqf"] remoteExec ["execvm"]}];
	_strigoi addEventHandler ["Killed", {(_this select 0) hideObjectGlobal true; (_this select 1) addRating 2000}];
	_strigoi addEventhandler ["HandleDamage",{params ["_unit","_damage","_bullet"];_unit = _this select 0;_bullet =_this select 4; if ((_bullet=="")and!(isTouchingGround _unit)) then{0}else{(damage _unit)+hp_strig}}];
	_umbla_casper = "Land_HelipadEmpty_F" createVehicle [getPosATL _strigoi select 0,getPosATL _strigoi select 1, 20];
	_cap_casper = "Sign_Sphere10cm_F" createVehicle [0,0,0];
	_cap_casper setObjectTextureGlobal [0,"#(argb,8,8,3)color(0,0,0,0,ca)"];
	_cap_casper attachto [_strigoi, [0,0,0.2],"neck"];
	for "_i" from 0 to 5 do {_strigoi setObjectMaterialGlobal [_i,"A3\Structures_F\Data\Windows\window_set.rvmat"]};
	for "_i" from 0 to 5 do {_strigoi setObjectTextureGlobal [_i,"#(ai,512,512,1)perlinNoise(256,256,0,0.3)"]};
	[_strigoi] call fnc_hide_strig;
	
	waitUntil {sleep 1; !isNil{"allPlayers_on"}};
	[[_strigoi],"AL_strigoi\fatigue_p.sqf"] remoteExec ["execVM",0,true];
	
while {alive _strigoi} do 
{
	_list_unit_range_casp = [_strigoi] call fnc_find_target;

	if (count _list_unit_range_casp > 0) then 
	{
		_tgt_casp = _list_unit_range_casp call BIS_fnc_selectRandom;
		[_strigoi,_poz_orig_sc,_teritoriu] call fnc_show_strig;
		//if (!isNil "_tgt_casp") then {
		while {(!isNil "_tgt_casp")and(alive _strigoi)and((_strigoi distance getPos _poz_orig_sc)<_teritoriu)} do 
		{
			//[_list_unit_range_casp] call fnc_strig_drain;
			_gasit = false;
			//_strigoi doMove (getpos _tgt_casp);
			_strigoi doMove (_tgt_casp getRelPos[5,180]);
			//[_strigoi,_list_unit_range_casp] call fnc_avoid_casp;
			[_strigoi] call fnc_avoid_casp;
			sleep 1;
			if (_strigoi distance _tgt_casp <40) then 
			{
			_atk_sun=["01_atk_bg","02_atk","03_atk","04_atk"] call BIS_fnc_selectRandom;
			[_strigoi,[_atk_sun,400]] remoteExec ["say3d"];
			[_strigoi,_tgt_casp,_damage_strig] call fnc_attk_strigoi;
		   {_x setVelocity [1+random 3,1+random 3,1+random 5]; _x setDammage ((getDammage _x) + 0.2)} foreach _list_unit_range_casp;        //comment this line is you don't want strigoi to deal damage
			sleep 1;
			};
			_salt = [true, false] call BIS_fnc_selectRandom;
			if (_salt) then 
			{
				_salt = false;
				_copaci = nearestTerrainObjects [_tgt_casp,["TREE"],20];
				if (count _copaci>0) then 
				{		
					{
					_unghi_fugarit = _strigoi getRelDir _tgt_casp;
					_unghi_ancora = _strigoi getRelDir _x;
					_toleranta = abs(_unghi_fugarit-_unghi_ancora);
					_pot_poz = (boundingCenter _x) select 2; 					//hint format["unghi si inaltime centru %1---%2",_toleranta,_pot_poz];	//if ((_pot_poz>2)and(_toleranta<60)and(_strigoi distance _x < 20)and(_strigoi distance _tgt_casp > 15)) then {_gasit = true; _obj_de_agatat=_x};
					if ((_pot_poz>2)and(_toleranta<60)and(_strigoi distance _x < 20)) then {_gasit = true; _obj_de_agatat=_x};
					} foreach _copaci;
					if (_gasit) then {[_strigoi,_tgt_casp,_umbla_casper,_obj_de_agatat,_cap_casper,_pot_poz] call fnc_salt_strig_1};
				};
			};
			sleep 1;
			if (_gasit) then 
			{
				[_strigoi,_tgt_casp,_umbla_casper,_obj_de_agatat] call fnc_salt_strig_2;
				_gasit = false;
			};
			if (!alive _tgt_casp) then {
					_list_unit_range_casp = [_strigoi] call fnc_find_target;
					if (count _list_unit_range_casp > 0) then {_tgt_casp = _list_unit_range_casp call BIS_fnc_selectRandom} else {_tgt_casp = nil};
				};
		};	
		[_strigoi] call fnc_hide_strig;
		//};
	};
sleep 5;
};
deleteVehicle _umbla_casper;detach _cap_casper;deleteVehicle _cap_casper;sleep 5;deleteVehicle _strigoi;