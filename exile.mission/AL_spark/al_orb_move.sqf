// by ALIAS

private ["_list_units_in_range","_obiect_orb","_mark_orig","_spawn_loc"];

_spawn_loc =_this select 0;
//obj_prot_sparky = ["H_CrewHelmetHeli_I","CUP_H_SLA_Pilot_Helmet","CUP_H_TK_PilotHelmet","CUP_H_USMC_Helmet_Pilot","H_PilotHelmetHeli_B","H_PilotHelmetHeli_I","H_PilotHelmetFighter_B","H_PilotHelmetFighter_I","H_PilotHelmetFighter_O"];

if (!hasInterface) exitWith {};

_mark_orig =  "Land_HelipadEmpty_F" createVehiclelocal [getMarkerPos _spawn_loc select 0,getMarkerPos _spawn_loc select 1,round (2+random 7)];
_poz_ini = [getPos _mark_orig select 0,getPos _mark_orig select 1,round (2+random 7)];

_poz_ini = [getPos _mark_orig select 0,getPos _mark_orig select 1,round (2+random 7)];
                //_obiect_orb = "testsphere1" createVehiclelocal [getPos _mark_orig select 0,getPos _mark_orig select 1,round (2+random 7)]; //aussie		
_obiect_orb = "Sign_Sphere10cm_F" createVehiclelocal [getPos _mark_orig select 0,getPos _mark_orig select 1,round (2+random 7)];
_obiect_orb setObjectMaterialGlobal [0, "\a3\data_f\default.rvmat"];
//_obiect_orb setObjectTextureGlobal [0, "#(argb,8,8,3)color(1,1,0.1,0.5,ca)"];
_obiect_orb setObjectTextureGlobal [0, "#(argb,8,8,3)color(1,1,1,0.5,ca)"];
_obiect_orb setPosATL [_poz_ini select 0,_poz_ini select 1, round (2+random 7)];
_obiect_orb allowDamage true;  //aussie		
_voice_orb = "Land_HelipadEmpty_F" createVehiclelocal getPos _obiect_orb;
_voice_orb attachTo [_obiect_orb,[0, 0, 2]];

_ele = "#particlesource" createVehicleLocal (getPosATL _obiect_orb);
_ele setParticleCircle [0, [0, 0, 0]];
_ele setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
_ele setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.15, [0, 0, 0], [0, 0, 0], 0.3, 11, 7.9, 0.075, [0.003, 0.003, 0.003], [[0.1, 0.1, 0.1, 0.5], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _obiect_orb];
_ele setDropInterval 0.01;

sleep 9;

_halo = "#particlesource" createVehicleLocal (getPosATL _obiect_orb);
_halo setParticleCircle [0, [0, 0, 0]];
_halo setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
_halo setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_sparks_02.p3d", 1, 0, 1], "", "SpaceObject", 1, 0.1, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [0.5, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _obiect_orb];
_halo setDropInterval 0.0033;

_orb_lit = "#lightpoint" createVehiclelocal (getPosATL _obiect_orb); 
_orb_lit lightAttachObject [_obiect_orb, [0,0,0]];
_orb_lit setLightColor [1,0,0];
_orb_lit setLightAmbient [0.5,0,0];
_orb_lit setLightIntensity 100;
_orb_lit setLightUseFlare true;
_orb_lit setLightFlareSize 2;
_orb_lit setLightFlareMaxDistance 500;
_orb_lit setLightAttenuation [0.1,0,100,1000,100,500]; 
_orb_lit setLightDayLight true;

[_obiect_orb] spawn {
	_orb_obj = _this select 0;
	while {!isNull _orb_obj} do 
	{
	_orb_obj say3D ["magnetic_pulse", 300];
	sleep 12;
	};
};

// plutesc
[_obiect_orb] spawn 
{
	_obiect_plut = _this select 0;
	while {!isNull _obiect_plut} do {
	_poz_z_ini = getPosATL _obiect_plut select 2;
	_poz_dest_1 = _poz_z_ini;
	_i_vert = 0;

	while {(player distance _obiect_plut) < 200} do 
	{
		_fct_vert =[1,-1,2,-2]call BIS_fnc_selectRandom;
		_poz_dest_2 = _poz_z_ini + _fct_vert;
		
		if (_poz_dest_1<_poz_dest_2) then {_i_vert = 0.01} else {_i_vert=-0.01};
			
		while {abs (_poz_dest_1-_poz_dest_2)>0.1} do 
		{
		_obiect_plut setPosATL [getposATL _obiect_plut select 0,getposATL _obiect_plut select 1, _poz_dest_1];
		sleep 0.01+random 1;
		_poz_dest_1 = _poz_dest_1+_i_vert;
		//_obiect_plut setVelocity [5, 5, 0];
		};
	_poz_dest_1 = _poz_dest_2;
	sleep 1 + random 3;
	};
	waitUntil {(player distance _obiect_plut) < 350};
	};
};

[_obiect_orb] spawn 
{
_ob_slide = _this select 0;
_poz_x_ini = getPosATL _ob_slide select 0;
_poz_y_ini = getPosATL _ob_slide select 1;
_x_dest=0;
_y_dest=0;
_poz_x_1 = _poz_x_ini;
_poz_y_1 = _poz_y_ini;

while {(player distance _ob_slide) < 350} do 
{
	_fct_hor = [1,-1]call BIS_fnc_selectRandom;
	_poz_x_2 = _poz_x_ini+ (round (3+random 10))*_fct_hor;
	_poz_y_2 = _poz_y_ini+ (round (3+random 10))*_fct_hor;
		
	if (_poz_x_1<_poz_x_2) then {_x_dest = 0.01} else {_x_dest=-0.01};
	if (_poz_y_1<_poz_y_2) then {_y_dest = 0.001} else {_y_dest=-0.001};
		
	_sunet_spark = ["sparks_1","sparks_2","sparks_3","sparks_4","sparks_5"] call BIS_fnc_selectRandom;
		
	while {abs (_poz_x_2-_poz_x_1)>0.1} do 
	{
		_ob_slide setPosATL [_poz_x_1,_poz_y_1, getposATL _ob_slide select 2];
		sleep 0.001+random 2;
		_poz_x_1 = _poz_x_1 +_x_dest;
		_poz_y_1 = _poz_y_1 +_y_dest;
	};
	_poz_x_1 = _poz_x_2;
	_poz_y_1 = _poz_y_2;
	sleep 1 + random 3;
	_ob_slide say3D [_sunet_spark, 300];

waitUntil {(player distance _ob_slide) < 350};
};
};

sleep 10;


while {alive _obiect_orb} do 
{
//_list_units_in_range = (position _obiect_orb) nearEntities ['Exile_Unit_Player',15];
_list_units_in_range = (position _obiect_orb) nearEntities [['Exile_Unit_Player'], 15];
if ((count _list_units_in_range>0) and ((player distance _obiect_orb)< 200)) then 
{
	{
	if ((headgear _x == obj_prot_sparky)or(goggles _x==obj_prot_sparky)or(uniform _x==obj_prot_sparky)or(vest _x==obj_prot_sparky)or(Backpack _x==obj_prot_sparky) or (obj_prot_sparky in (assigneditems _x + items _x))) then 
	{/*to do*/} 
	else
		{
		nul=[_voice_orb,_voice_orb] execVM "AL_spark\al_spark_attack.sqf";
		//[[_x],"AL_spark\al_spark_damage.sqf"] remoteExec ["execVM",2];
	    {_x setVelocity [1+random 3,1+random 3,1+random 5]; _x setDammage ((getDammage _x) + 0.2)} foreach _list_units_in_range;   //comment this line is you don't want sparky to deal damage
		//_damage_ante = getDammage _x;	_x setDamage [_damage_ante+0.2, true];
		};
	} foreach _list_units_in_range;
};
sleep 5;
};
