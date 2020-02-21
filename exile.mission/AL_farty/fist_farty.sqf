// by ALIAS
private ["_picior_mobil","_picior_effect"];

if (!hasInterface) exitWith {};

_picior_mobil = _this select 0;

_picior_effect = "#particlesource" createVehicleLocal (getPosATL _picior_mobil);
_picior_effect setParticleCircle [0, [0, 0, 0]];
_picior_effect setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
_picior_effect setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "Billboard", 1, 1,[0,0,0],[0,0,0], 3, 10, 7.9, 0.0000000001, [1,3], [[0,1,0,1],[0,1,0,0.5]], [0.08], 1, 0, "", "", _picior_mobil];
_picior_effect setDropInterval 0.01;

sleep 2;
deleteVehicle _picior_effect;