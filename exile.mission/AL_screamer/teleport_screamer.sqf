// by ALIAS

if (!hasInterface) exitWith {};

_obj_eff = _this select 0;

_obj_eff say3D ["teleport_screamer", 500];

enableCamShake true;
addCamShake [1, 5, 25];

_blur_sonic = "#particlesource" createVehicleLocal (getPosATL _obj_eff);
_blur_sonic setParticleCircle [0, [0, 0, 0]];
_blur_sonic setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_blur_sonic setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [0, 0, 0], 12, 12, 6, 0.002, [7, 5, 1], [[1, 1, 1, 0.5], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _obj_eff];
_blur_sonic setDropInterval 0.01;


sleep 1;
playsound "earthquakes";

sleep 8;
deleteVehicle _blur_sonic;
enableCamShake false;