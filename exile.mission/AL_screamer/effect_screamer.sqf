// by ALIAS

if (!hasInterface) exitWith {};

_obj_eff = _this select 0;
_emit	= _this select 1;

_emit say3D ["scream", 500];
_obj_eff say3D ["stones_scream", 500];

enableCamShake true;
if ((player distance _emit)<50) then 
{
	addCamShake [1, 5, 25];
};
/*
_blur_sonic = "#particlesource" createVehicleLocal (getPosATL _obj_eff);
_blur_sonic setParticleCircle [0, [0, 0, 0]];
_blur_sonic setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_blur_sonic setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [0, 0, 0], 12, 12, 6, 0.002, [1, 3, 5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _obj_eff];
_blur_sonic setDropInterval 0.01;
*/
_blur_sonic = "#particlesource" createVehicleLocal (getPosATL _obj_eff);
_blur_sonic setParticleCircle [0, [0, 0, 0]];
_blur_sonic setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_blur_sonic setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 0.5, [0, 0, 0], [0, 0, 0], 12, 12, 6, 0.00001, [0.2, 3, 15], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.2]], [0.08], 1, 0, "", "", _obj_eff];
_blur_sonic setDropInterval 0.01;

_wat_vap = "#particlesource" createVehicleLocal (getPosATL _obj_eff);
_wat_vap setParticleCircle [0, [0, 0, 0]];
//XXXPARTICLEEFFECTSOURCEXXX setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [3, 3, 3], [[1, 1, 1, 0.01], [1, 1, 1, 0.01], [1, 1, 1, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
_wat_vap setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_wat_vap setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [0, 0, 0], 12, 12, 6, 0.002, [1, 2, 3], [[1, 1, 1, 0.005], [1, 1, 1, 0.05], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _obj_eff];
_wat_vap setDropInterval 0.01;

_bolovani_ground = "#particlesource" createVehicleLocal (getPosATL _obj_eff);
_bolovani_ground setParticleCircle [0.3, [0, 0, 0]];
_bolovani_ground setParticleRandom [0, [0.25, 0.25, 0], [0, 0, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_bolovani_ground setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], "", "SpaceObject", 1, 10, [0, 0, 0], [0, 0, 0.1], 0, 20, 7.9, 0.075, [1, 1, 1], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _obj_eff,0,true,0.1,[[0,0,0,0]]];
_bolovani_ground setDropInterval 0.001;

sleep 0.1;

_dirt_dust = "#particlesource" createVehicleLocal (getPosATL _obj_eff);
_dirt_dust setParticleCircle [1, [0, 0, 0]];
_dirt_dust setParticleRandom [0, [0.25, 0.25, 0], [4, 4, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_dirt_dust setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], "", "SpaceObject", 1, 5, [0, 0, 0], [0, 0, 5], 3, 20, 7.9, 0.075, [0.2, 0.2, 0.2], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _obj_eff,0,true,0.3,[[0,0,0,0]]];
_dirt_dust setDropInterval 0.005;

sleep 1;
if ((player distance _emit)<100) then {playsound "earthquakes"};

sleep 2;
deleteVehicle _blur_sonic;
enableCamShake false;
sleep 2;
deleteVehicle _dirt_dust;
deleteVehicle _bolovani_ground;
deleteVehicle _wat_vap;
