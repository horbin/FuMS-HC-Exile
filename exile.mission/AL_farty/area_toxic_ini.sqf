// by ALIAS

fnc_create_puddle = {
	private ["_sfx_puddle","_img_puddle","_poz_puddle","_location_mark","_obj_puddle"];
	_location_mark = _this select 0;
	_sfx_puddle	=[true,false] call BIS_fnc_selectRandom;
	_img_puddle	=["AL_farty\01_lake.paa","AL_farty\02_lake.paa","AL_farty\03_lake.paa","AL_farty\04_lake.paa"] call BIS_fnc_selectRandom;
	_poz_puddle = [getmarkerpos _location_mark,random _radius_toxic,random 360] call BIS_fnc_relPos;
	_obj_puddle = "BloodPool_01_Large_New_F" createVehicle _poz_puddle;
	_obj_puddle setObjectMaterialglobal [0, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];
	_obj_puddle setObjectTextureGlobal [0,_img_puddle];
	_obj_puddle setDir (random 360);
	if (_sfx_puddle) then {[[_obj_puddle],"AL_farty\toxic_puddle.sqf"] remoteExec ["execVM",0,true]}
};

fnc_avoid_fart ={
	private ["_danger_close","_op_dir","_chased_units","_fct","_reldir","_avoid_poz","_fct_move"];
	_danger_close = _this select 0;
	_chased_units = (position _danger_close) nearEntities [['Exile_Unit_Player'],25];
	{
		_reldir = [_x, getPos _danger_close] call BIS_fnc_dirTo;
		_fct = [30,-30] call BIS_fnc_selectRandom;
		if (_reldir<180) then {_op_dir=_reldir+180 +_fct} else {_op_dir=_reldir-180+_fct};
		_avoid_poz = [getposATL _x,20+random 10, _op_dir] call BIS_fnc_relPos;
		_x doMove _avoid_poz;
		_x setSkill ["commanding", 1];
	} foreach _chased_units;
};

fnc_puddle_trail = {
	private ["_obj_tox","_toxic_pos","_prob_create"];
	_toxic_pos=_this select 0;
	_prob_create = random 10;
	if (_prob_create>8) then 
	{
	sleep 10;
	_obj_tox = createVehicle ["BloodPool_01_Large_New_F",[getPos _toxic_pos select 0,getPos _toxic_pos select 1,0], [], 0, "CAN_COLLIDE"];
	_obj_tox setObjectMaterialglobal [0, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];
	_aspect_puddle = ["AL_farty\01_lake.paa","AL_farty\02_lake.paa","AL_farty\03_lake.paa","AL_farty\04_lake.paa"] call BIS_fnc_selectRandom;
	_obj_tox setObjectTextureGlobal [0,_aspect_puddle];
	_obj_tox setdir (random 360);
	sleep 60;
	deleteVehicle _obj_tox;
	};
};

fnc_dir_speed = {
	private ["_fart_move","_object_to_move","_dir_move","_press_implicit_x","_press_implicit_y","_tolerance","_multiplier"];
	_object_to_move = _this select 0;
	_dir_move 		= _this select 1; // directie
	_tolerance 		= _this select 2; // abatere de la directie
	_multiplier 	= _this select 3; // multiplicator viteza deplasare
	
	//_dir_move = _dir_move+([random _tolerance,random -_tolerance] call BIS_fnc_selectRandom);
	
	_fart_move = ["01_anomaly_move","02_anomaly_move"] call BIS_fnc_selectRandom;

	if (_dir_move<=90) then {
	_press_implicit_x = linearConversion [0, 90,_dir_move, 0, 1, true];
	_press_implicit_y = 1-_press_implicit_x;
	};
	if ((_dir_move>90)and(_dir_move<180)) then {
	_dir_move = _dir_move-90;
	_press_implicit_x = linearConversion [0, 90,_dir_move, 1, 0, true];
	_press_implicit_y = _press_implicit_x-1;
	};
	if ((_dir_move>180)and(_dir_move<270)) then {
	_dir_move = _dir_move-180;
	_press_implicit_x = linearConversion [0, 90,_dir_move, 0, -1, true];
	_press_implicit_y = (-1*_press_implicit_x)-1;
	};
	if ((_dir_move>270)and(_dir_move<360)) then {
	_dir_move = _dir_move-270;
	_press_implicit_x = linearConversion [0, 90,_dir_move, -1, 0, true];
	_press_implicit_y = 1+_press_implicit_x;
	};
	_object_to_move setVelocity [_press_implicit_x*_multiplier,_press_implicit_y*_multiplier,3];
	sleep 0.3;
	[_object_to_move,[_fart_move,200]] remoteExec ["say3d"];
};

if (!isServer) exitwith {};


private ["_fart_parts","_part_body","_poz_fart","_dir_move","_array_markers_radioactive","_mrk_temp","_array_temp","_nr_mrk","_carcasa","_core","_tgt_fart","_radius_toxic","_farty_on","_no_puddles","_trail_on","_damage_toxic","_anomalyVSfield","_location_mark"];

_location_mark   = _this select 0;
_toxic_prot_mask = _this select 1;
_anomalyVSfield  = _this select 2; // place the toxic field with anomaly if true
_radius_toxic	 = _this select 3;
_damage_toxic	 = _this select 4;
_trail_on		 = _this select 5; // while moving the anomaly will leave a trail of puddles
_no_puddles		 = _this select 6;

diag_log format ["<FuMS> Farty Initialization: Location:%1",_location_mark];

obj_prot_toxic = _toxic_prot_mask;
publicVariable "obj_prot_toxic";

		  
_farty_loc = "Land_HelipadEmpty_F" createVehicle [getMarkerPos _location_mark select 0,getMarkerPos _location_mark select 1,-500];

if (_no_puddles>0) then {for "_tt" from 1 to _no_puddles step 1 do {[_location_mark] call fnc_create_puddle}};
[[_location_mark,_radius_toxic,_damage_toxic,_anomalyVSfield,_farty_loc],"AL_farty\al_farty_field.sqf"] remoteExec ["execVM",0,true];

[_location_mark,_damage_toxic,_radius_toxic] execvm "AL_farty\ai_toxic.sqf";

if (_anomalyVSfield) then {
waitUntil {sleep 2;!isNil{_farty_loc getVariable "activ"}};

_grp = createGroup CIVILIAN;
_farty_boss = _grp createUnit ["C_Soldier_VR_F",[0,0,1], [], 0,"NONE"];
_farty_boss setVariable ["anomalie",true,true];

for "_i" from 0 to 5 do {_farty_boss setObjectMaterialglobal [_i, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"]};
for "_i" from 0 to 5 do {_farty_boss setObjectTextureGlobal [_i,"AL_farty\02_lake.paa"]};

_farty_boss setSpeaker "NoVoice";_farty_boss disableConversation true;_farty_boss setcaptive true; _farty_boss addRating -10000;_farty_boss setBehaviour "CARELESS";_farty_boss enableFatigue false;_farty_boss setSkill ["courage", 1];_farty_boss setUnitPos "UP"; RemoveAllItems _farty_boss; removeUniform _farty_boss; Removevest _farty_boss; removeHeadgear _farty_boss; removeAllWeapons _farty_boss; _farty_boss unassignItem "NVGoggles"; _farty_boss removeItem "NVGoggles";_farty_boss setUnitPos "DOWN";
_farty_boss hideObjectGlobal true;

_comp_obj_casp = [];
_pct_farty=["spine3","leftshoulder","leftforearmroll","leftleg","leftfoot","leftupleg","rightshoulder","rightforearmroll","rightupleg","rightleg","rightfoot","leftforearm", "rightforearm"];
{_carcasa = "Sign_Sphere200cm_F" createVehicle [0,0,0];_carcasa setObjectMaterialglobal [0, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];	_carcasa setObjectTextureGlobal [0,"AL_farty\shell.jpg"];	_carcasa setdir (random 360);	_comp_obj_casp pushBack _carcasa;	_carcasa attachTo [_farty_boss, [0,0,0],_x]} forEach _pct_farty;

_cap_segment = "Sign_Sphere200cm_F" createVehicle [0,0,0];_cap_segment setObjectMaterialglobal [0, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];_cap_segment setObjectTextureGlobal [0,"AL_farty\shell.jpg"];
_carcasa_coada = "Sign_Sphere200cm_F" createVehicle [0,0,0];_carcasa_coada setObjectMaterialglobal [0, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];_carcasa_coada setObjectTextureGlobal [0,"AL_farty\shell.jpg"];
_carcasa_coada_1 = "Sign_Sphere200cm_F" createVehicle [0,0,0];_carcasa_coada_1 setObjectMaterialglobal [0, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];_carcasa_coada_1 setObjectTextureGlobal [0,"AL_farty\shell.jpg"];
_carcasa_coada_2 = "Sign_Sphere200cm_F" createVehicle [0,0,0];_carcasa_coada_2 setObjectMaterialglobal [0, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];_carcasa_coada_2 setObjectTextureGlobal [0,"AL_farty\shell.jpg"];

[_farty_boss,_cap_segment,_carcasa_coada,_carcasa_coada_1,_carcasa_coada_2] spawn 
{
private ["_farty_boss","_cap_segment","_carcasa_coada","_carcasa_coada_1","_carcasa_coada_2","_fart_parts"];
_farty_boss			= _this select 0;
_cap_segment		= _this select 1;
_carcasa_coada		= _this select 2;
_carcasa_coada_1	= _this select 3;
_carcasa_coada_2	= _this select 4;

while {alive _farty_boss} do 
{
 _cap_segment attachTo [_farty_boss, [0,0.8,-0.1],"neck"];
 _carcasa_coada attachTo [_farty_boss, [0,-1.3,0.1]];
 _carcasa_coada_1 attachTo [_farty_boss, [0,-2,-0.1]];
 _carcasa_coada_2 attachTo [_farty_boss, [0,-3,-0.25]];
 sleep 0.01;
 detach _cap_segment;
 sleep 0.01;
 detach _carcasa_coada_2;
 sleep 0.01;
 detach _carcasa_coada_1;
 sleep 0.01;
 detach _carcasa_coada;
 sleep 0.01;
};
};
_poz_fart = [getMarkerPos _location_mark,1,_radius_toxic/2,2,0,0,0] call BIS_fnc_findSafePos;
_farty_loc setPos _poz_fart;
_farty_boss setpos _poz_fart;
// efect aparitie
[[_farty_loc],"AL_farty\inout.sqf"] remoteExec ["execVM"];
				
sleep 1;
_farty_loc setpos (getMarkerPos _location_mark);
_farty_boss setDamage 0;
[[_cap_segment,_carcasa_coada,_farty_boss],"AL_farty\al_farty_sfx.sqf"] remoteExec ["execVM",0,true];

_fist = "Land_Battery_F" createVehicle [0,0,0];
_fist attachTo [_cap_segment,[0,-0.2,0]];
[_fist,["01_strig_fart",200]] remoteExec ["say3d"];
_shell_fist = "Sign_Sphere100cm_F" createVehicle [0,0,0];
_shell_fist setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.2,1,0.1,1,ca)"];
_shell_fist setObjectMaterialglobal [0, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];
_shell_fist setObjectTextureGlobal [0,"AL_farty\01_splash.paa"];
_shell_fist attachTo [_fist,[0,0,0]];

[_farty_boss,_cap_segment,_carcasa_coada,_carcasa_coada_1,_carcasa_coada_2,_comp_obj_casp,_fist,_shell_fist] spawn 
{
	private ["_farty_boss","_cap_segment","_carcasa_coada","_carcasa_coada_1","_carcasa_coada_2","_comp_obj_casp","_fist","_shell_fist"];
	_farty_boss		=_this select 0;
	_cap_segment	=_this select 1;
	_carcasa_coada	=_this select 2;
	_carcasa_coada_1 = _this select 3;
	_carcasa_coada_2 = _this select 4;
	_comp_obj_casp	= _this select 5;
	_fist			= _this select 6;
	_shell_fist		= _this select 7;
	waitUntil {!alive _farty_boss};
	_carcasa_coada_2 hideObjectGlobal true;
	[[_carcasa_coada_2],"AL_farty\farty_mort.sqf"] remoteExec ["execVM"];
	[_carcasa_coada_2,["farty_mort",3000]] remoteExec ["say3d"];
	{deleteVehicle _x} foreach _comp_obj_casp;
	deleteVehicle _farty_boss;
	deleteVehicle _cap_segment;
	deleteVehicle _carcasa_coada;
	deleteVehicle _carcasa_coada_1;
	deleteVehicle _shell_fist;
	sleep 2.2;
	deleteVehicle _carcasa_coada_2;
};
_fart_parts =[_cap_segment,_carcasa_coada,_carcasa_coada_1,_carcasa_coada_2,_fist,_shell_fist];
_part_body =[_cap_segment,_carcasa_coada,_carcasa_coada_1,_carcasa_coada_2];
	while {alive _farty_boss} do 
	{
		_list_ai_in_range_fart = (position _farty_boss) nearEntities [['Exile_Unit_Player'],100];
		_list_ai_in_range_fart = _list_ai_in_range_fart -[_farty_boss];
		if (count _list_ai_in_range_fart > 0) then 
		{
				if (!isNil{_farty_boss getVariable "ascuns"}) then
				{
					if (_farty_boss getVariable "ascuns") then 
					{
					_farty_boss enableSimulation true;
					_poz_fart = [getMarkerPos _location_mark,1,_radius_toxic,2,0,0,0] call BIS_fnc_findSafePos;
					_farty_boss setPos _poz_fart;
					_farty_loc setPos _poz_fart;
					[[_farty_loc],"AL_farty\inout.sqf"] remoteExec ["execVM"];
					[_farty_loc,["01_strig_fart",200]] remoteExec ["say3d"];
					sleep 2;
					{_x setObjectTextureGlobal [0,"AL_farty\shell.jpg"];} forEach _comp_obj_casp;
					{_x setObjectTextureGlobal [0,"AL_farty\shell.jpg"];} forEach _fart_parts;
					};
				};
			_farty_boss setVariable ["ascuns",false,true];
			sleep 1;
			_tgt_fart = _list_ai_in_range_fart call BIS_fnc_selectRandom;
			while {(_tgt_fart distance _farty_boss < 80)and(alive _tgt_fart)} do 
			{
				_farty_boss doMove (getpos _tgt_fart);
				if (_trail_on) then {[_carcasa_coada_1] spawn fnc_puddle_trail};
				sleep 3;
				if (_farty_boss distance _tgt_fart < 30) then 
				{
					_splash_img = ["AL_farty\01_splash.paa","AL_farty\02_splash.paa"] call BIS_fnc_selectRandom;
					_shell_fist setObjectTextureGlobal [0,_splash_img];
					_dir_fist = [getPos _fist,getPos _tgt_fart] call BIS_fnc_dirTo;
					//_shell_fist setdir (_dir_fist+90);
					[[_fist],"AL_farty\fist_farty.sqf"] remoteExec ["execVM"];
					_fist_sound = ["01_fart_attack","02_fart_attack"] call BIS_fnc_selectRandom;
					[_fist,[_fist_sound,200]] remoteExec ["say3d"];
					_fist hideObjectGlobal false;
					//_shell_fist hideObjectGlobal false;
					detach _fist;
					[_fist,_dir_fist,1,55] call fnc_dir_speed;
					sleep 0.2;
					_tgt_fart attachTo [_fist,[0,0,0]];
					_tgt_fart setDammage ((getDammage _tgt_fart) + 0.35);
					[[_tgt_fart],"AL_farty\damage_tgt.sqf"] remoteExec ["execVM",_tgt_fart];
					sleep 0.1;
					detach _tgt_fart;
					//_shell_fist hideObjectGlobal true;
					_fist hideObjectGlobal true;
					_fist attachTo [_cap_segment,[0,-0.2,0]];
				};
				sleep 0.3;
				_list_ai_in_range_fart = [];
				sleep 0.5 + random 0.5;
				_taunt_me = random 10;
				if (_taunt_me>8) then {[_fist,["01_strig_fart",200]] remoteExec ["say3d"]};
				[_farty_boss] call fnc_avoid_fart;
			};
		} else {
					sleep 5;
					if (!(_farty_boss getVariable "ascuns")) then 
					{
					_farty_boss setVariable ["ascuns",true,true];
					_farty_loc setPos (getPos _farty_boss);
					[[_farty_loc],"AL_farty\inout.sqf"] remoteExec ["execVM"];
					[_farty_loc,["01_strig_fart",200]] remoteExec ["say3d"];
					//ascunde
					{_x setObjectTextureGlobal [0,"#(argb,8,8,3)color(0,0.6,0.1,0,ca)"];} forEach _fart_parts;
					{_x setObjectTextureGlobal [0,"#(argb,8,8,3)color(0,0.6,0.1,0,ca)"];} forEach _comp_obj_casp;
					_farty_boss enableSimulation false;
					};
				};
	};
} else {[_location_mark,_damage_toxic,_radius_toxic] execvm "AL_farty\ai_toxic.sqf"};