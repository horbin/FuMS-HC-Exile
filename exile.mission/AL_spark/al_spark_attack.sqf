
//if (!hasInterface) exitWith {};

_attck_obj = _this select 0;
_voice_attk= _this select 1;
enableCamShake true;

//lumina 1
_unu_lum = "#lightpoint" createVehicle (getPosATL _voice_attk); 
_unu_lum lightAttachObject [_voice_attk, [0,0,0]];
_unu_lum setLightUseFlare false;
_unu_lum setLightFlareSize 1;
_unu_lum setLightFlareMaxDistance 1500;
_unu_lum setLightAttenuation [/*start*/ 0, /*constant*/0, /*linear*/ 50, /*quadratic*/ 1000, /*hardlimitstart*/1,/* hardlimitend*/50];
_unu_lum setLightColor [1,1,1];
_unu_lum setLightAmbient [0.8,0.6,0.9];
_unu_lum setLightDayLight true;
_unu_lum setLightBrightness 30+random 30;

_attack_spark = ["01_atak","02_atak","03_atak","04_atak","05_atak"] call BIS_fnc_selectRandom;
_attack_after = ["after_01","after_02"] call BIS_fnc_selectRandom;
_voice_attk say3D [_attack_spark, 600];
//hint str _attack_spark;
sleep 0.2;

_bule_spark = "#particlesource" createVehicleLocal (getPosATL _attck_obj);
_bule_spark setParticleCircle [0, [0, 0, 0]];
_bule_spark setParticleRandom [0, [0.25, 0.25, 0], [20,20,20], 0, 0.1, [0, 0, 0, 0.1], 0, 0];
_bule_spark setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.3, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [0.03, 0.01], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _attck_obj];
_bule_spark setDropInterval 0.001;

sleep random 0.1;
deletevehicle _unu_lum;
sleep 0.1;

_bule_space = "#particlesource" createVehicleLocal (getPosATL _attck_obj);
_bule_space setParticleCircle [0, [0, 0, 0]];
_bule_space setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_bule_space setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 0.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [1,20], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _attck_obj];
_bule_space setDropInterval 0.1;
sleep 0.1;
addCamShake [1,4,13+(random 33)];
//lumina 2
_doi_lum = "#lightpoint" createVehicle (getPosATL _voice_attk); 
_doi_lum lightAttachObject [_voice_attk, [0,0,0]];
_doi_lum setLightUseFlare false;
_doi_lum setLightFlareSize 1;
_doi_lum setLightFlareMaxDistance 1500;
_doi_lum setLightAttenuation [/*start*/ 0, /*constant*/0, /*linear*/ 50, /*quadratic*/ 1000, /*hardlimitstart*/1,/* hardlimitend*/50];
_doi_lum setLightColor [1,1,1];
_doi_lum setLightAmbient [0.8,0.6,0.9];
_doi_lum setLightDayLight true;
_doi_lum setLightBrightness 80+random 40;
deletevehicle _bule_spark;
sleep 0.1;
deletevehicle _bule_space;
sleep random 0.2;
deletevehicle _doi_lum;
sleep 1;
if ((player distance _attck_obj) <500) then {playsound _attack_after;};
enableCamShake false;

/*
bula scantei
_bule_scantei setParticleCircle [0, [0, 0, 0]];
_bule_scantei setParticleRandom [0, [0.25, 0.25, 0], [5, 5, 5], 0, 0.1, [0, 0, 0, 0.1], 0, 0];
_bule_scantei setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_sparks_01.p3d", 1, 0, 1], "", "SpaceObject", 1, 2, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [2, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _attck_obj];
_bule_scantei setDropInterval 0.002;