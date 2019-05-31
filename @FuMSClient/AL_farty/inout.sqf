// by ALIAS

private ["_inoutpoz"];

if (!hasInterface) exitWith {};

_inoutpoz = _this select 0;

_eff_apar = "#particlesource" createVehicleLocal (getPosATL _inoutpoz);
_eff_apar setParticleCircle [2,[0,0,0]];
_eff_apar setParticleRandom [0, [3,3,0],[5,5,0.3], 0, 0, [0, 0, 0, 0], 0, 0];
_eff_apar setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1],"","Billboard", 1,3,[0,0,0],[0,0,0], 13, 10, 7.9, 0.0001, [5,10],[[0.2,1,0,0.5],[0.2,1,0,0]], [0.08], 1, 0, "", "", _inoutpoz];
_eff_apar setDropInterval 0.001;

sleep 1;

deletevehicle _eff_apar;