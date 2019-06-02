// by ALIAS

private ["_check_time","_part_gost","_part_gost_sec","_comp_obj_casp","_tease_voice","_strigoi","_final_strigoi"];

if (!hasInterface) exitWith {};

_strigoi = _this select 0;

_check_time = sunOrMoon;
_comp_obj_casp = [];

waitUntil {sleep 5; player distance _strigoi <1000};

[_strigoi] spawn {_casper_voice = _this select 0;while {(alive _casper_voice) and {_casper_voice getVariable "vizibil"}} do {_casper_voice say3D ["casp_voice", 100];sleep 50;};};
_pct_casper=["spine3","leftshoulder","leftforearmroll","leftleg","leftfoot","leftupleg","rightshoulder","rightforearmroll","rightupleg","rightleg","rightfoot","pelvis","neck","leftforearm", "rightforearm"];
{_part_surs = "Sign_Sphere10cm_F" createVehiclelocal [0,0,0];_part_surs setObjectTextureGlobal [0,"#(argb,8,8,3)color(0,0,0,0,ca)"];_comp_obj_casp pushBack _part_surs;_part_surs attachTo [_strigoi, [0,0,0],_x];} forEach _pct_casper;

[_comp_obj_casp,_strigoi] spawn {_guri = _this select 0;_tease_voice=_this select 1;while {alive _tease_voice} do {_gura = _guri call BIS_fnc_selectRandom;	_tease_sound = ["01_tease","02_tease","NoSound"] call BIS_fnc_selectRandom;	_gura say3D [_tease_sound, 100];sleep 30 + random 30};};
_check_time = sunOrMoon;
	
if (sunOrMoon ==0) then 
{
	{_part_gost = "#particlesource" createVehicleLocal (getPosATL _x);_part_gost setParticleCircle [0, [0, 0, 0]];_part_gost setParticleRandom [0.5, [0, 0, 0.2], [0, 0, 0.3], 0, 0, [0, 0, 0, 0], 0, 0];_part_gost setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "SpaceObject", 1, 0.4, [0, 0, 0], [0, 0, 0.1], 1, 10.1, 7.9, 0.0001, [0.05, 0.1, 0.01], [[1,1,1,1], [1,1,1,0.5], [1,1,1,0]], [0.08], 1, 0, "", "", _x];_part_gost setDropInterval 0.01;} forEach _comp_obj_casp;
} else 
{
	{
	_part_gost = "#particlesource" createVehicleLocal (getPosATL _x);
	_part_gost setParticleCircle [0, [0, 0, 0]];
	_part_gost setParticleRandom [0.5, [0, 0, 0.25], [0.175, 0.175, 0.1], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_part_gost setParticleParams [["\A3\data_f\cl_feathers2", 1, 0, 1], "", "SpaceObject", 1, 0.4, [0, 0, 0], [0, 0, 0.1], 3, 10, 7.9, 0.0075, [15, 15, 15], [[1, 1, 1, 0.5], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _x];
	_part_gost setDropInterval 0.01;
	} forEach _comp_obj_casp;
};
	
{_part_gost_sec = "#particlesource" createVehicleLocal (getPosATL _x);	_part_gost_sec setParticleCircle [0, [0, 0, 0]];_part_gost_sec setParticleRandom [0, [0.3, 0.5, 0], [0, 0, 0.1], 0, 0, [0, 0, 0, 0], 0, 0];	_part_gost_sec setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0.1], 5, 10.1, 7.9, 0.0000001, [1,2,5], [[1,1,1,1], [1,1,1,0.5], [1,1,1,0]], [0.08], 1, 0, "", "", _x];_part_gost_sec setDropInterval 0.02} forEach _comp_obj_casp;

waitUntil {_final_strigoi = "Land_HelipadEmpty_F" createVehicle [getPosASL _strigoi select 0,getPosASL _strigoi select 1, 3]; sleep 2; !(_strigoi getVariable "vizibil")or(!alive _strigoi)};
deleteVehicle _part_gost;deleteVehicle _part_gost_sec;
{deleteVehicle _x} forEach _comp_obj_casp;
_final_strigoi say3D ["03_tip_casp",1000];
_part_gost = "#particlesource" createVehicleLocal (getPosATL _strigoi);
_part_gost setParticleCircle [0,[0,0,0]];
_part_gost setParticleRandom [0,[0.5,0.5,2],[0,0,0.3],0,0,[0,0,0,0],0,0];
_part_gost setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "SpaceObject", 1, 1, [0,0,2], [0, 0, 0.1], 1, 10.5, 7.9, 0.0001, [0.05, 0.1, 0.01], [[1,1,1,1], [1,1,1,0.5], [1,1,1,0]], [0.08], 1, 0, "", "", _strigoi];
_part_gost setDropInterval 0.001;

_part_gost_sec = "#particlesource" createVehicleLocal (getPosATL _strigoi);
_part_gost_sec setParticleCircle [0,[0,0,0]];
_part_gost_sec setParticleRandom [0,[0.5,0.5,2],[0,0,0.1],0,0,[0,0,0,0],0,0];
_part_gost_sec setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 1, [0,0,2], [0, 0, 0.1], 5, 10.5, 7.9, 0.0000001, [1,2,5], [[1,1,1,1], [1,1,1,1], [1,1,1,0]], [0.08], 1, 0, "", "", _strigoi];
_part_gost_sec setDropInterval 0.001;

sleep 3;
deleteVehicle _part_gost;deleteVehicle _part_gost_sec;
sleep 6;
deleteVehicle _final_strigoi;

/*
	{
	_part_gost = "#particlesource" createVehicleLocal (getPosATL _x);
	_part_gost setParticleCircle [0, [0, 0, 0]];
	_part_gost setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_part_gost setParticleParams [["\A3\data_f\cl_water", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0.1], 5, 10, 7.9, 0.075, [0.1, 0.6, 0.01], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _x];
	_part_gost setDropInterval 0.1;
	} forEach _comp_obj_casp;