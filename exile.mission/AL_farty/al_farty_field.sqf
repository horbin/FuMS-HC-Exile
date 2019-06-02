// by ALIAS

private ["_toxic_center","_damage_toxic","_radius_toxic","_farty_on","_fog_toxic","_farty_loc"];

if (!hasInterface) exitWith {};

_toxic_center	= _this select 0;
_radius_toxic	= _this select 1;
_damage_toxic	= _this select 2;
_farty_on		= _this select 3;
_farty_loc		= _this select 4;

_obj_tox = "BloodPool_01_Large_New_F" createVehiclelocal (getmarkerPos _toxic_center);
_obj_tox setObjectMaterialglobal [0, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];
_obj_tox setObjectTextureGlobal [0,"AL_farty\04_lake.paa"];
_obj_tox setDir (random 360);
_obj_tox allowDamage false;

[_toxic_center,_radius_toxic,_damage_toxic] execvm "AL_farty\damage_toxic_field.sqf";

[_obj_tox,_radius_toxic] spawn 
{
  private ["_puf","_radius_toxic"];
  _puf = _this select 0;
  _radius_toxic=_this select 1;
	while {true} do 
	{
	_puf say3D ["toxic_field", 10*_radius_toxic];
	sleep 6.5;
	};
};

if (_farty_on) then {
[_obj_tox,_radius_toxic,_farty_loc] spawn 
{
  private ["_puf"];
  _puf = _this select 0;
  _rad = _this select 1;
  _fck = _this select 2;
  while {(player distance _puf) > (_rad/2)}do{sleep 5};
  _fck setVariable ["activ",true,true];
};
};
	
while {alive _obj_tox} do 
{
	while {(player distance _obj_tox) >1500} do {sleep 5};
	if (sunOrMoon==1) then 
	{
	 _fog_toxic = "#particlesource" createVehicleLocal (getPosATL _obj_tox);
	 _fog_toxic setParticleCircle [0, [0, 0, 0]];
	 _fog_toxic setParticleRandom [0, [50, 50, -0.3], [0.175, 0.175, 0], 0, 1, [0, 0, 0, 0.1], 1, 0];
	 _fog_toxic setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 15, [0, 0, 0], [0, 0, 0], 13, 10.2, 7.9, 0.0001, [5, 5, 10], [[0.3, 0.5, 0.1, 0], [0.3, 0.5, 0.1, 0.2], [0.1, 0.3, 0.1, 0]], [0.08], 1, 0, "", "", _obj_tox];
	 _fog_toxic setDropInterval 0.02;
	} else 
	{
	 _fog_toxic = "#particlesource" createVehicleLocal (getPosATL _obj_tox);
	 _fog_toxic setParticleCircle [0, [0, 0, 0]];
	 _fog_toxic setParticleRandom [0, [50, 50, -0.3], [0.175, 0.175, 0], 0, 1, [0, 0, 0, 0.1], 1, 0];
	 _fog_toxic setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "Billboard", 1, 15, [0, 0, 0], [0, 0, 0], 13, 10.2, 7.9, 0.0001, [10,15,20], [[0.3, 0.5, 0.1, 0.3], [0.3, 0.5, 0.1, 1], [0.1, 0.4, 0.1, 0]], [0.08], 1, 0, "", "", _obj_tox];
	 _fog_toxic setDropInterval 0.02;
	};
	while {(player distance _obj_tox) < 1500} do {sleep 5};
	deleteVehicle _fog_toxic;
};