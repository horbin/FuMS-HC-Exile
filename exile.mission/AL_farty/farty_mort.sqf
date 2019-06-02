// by ALIAS

if (!hasInterface) exitWith {};

_farty_corp = _this select 0;

// splash stropi
_splash_stropi = "#particlesource" createVehicleLocal (getPosATL _farty_corp);
_splash_stropi setParticleCircle [0.5, [0,0,0]];
_splash_stropi setParticleRandom [0, [0.2,0.2,0], [15,15,25], 0, 1, [0, 0, 0, 0.1], 1, 0];
_splash_stropi setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "Billboard", 1, 7, [0, 0, 0], [0, 0, 0], 10, 25, 7.9, 0.0001, [3,1], [[0.3, 0.5, 0.1, 1], [0.1, 0.4, 0.1, 0]], [0.08], 1, 0, "", "", _farty_corp];
_splash_stropi setDropInterval 0.005;

// splash gaz toxic
_splash_gaz = "#particlesource" createVehicleLocal (getPosATL _farty_corp);
_splash_gaz setParticleCircle [1, [-1,-1, 0]];
_splash_gaz setParticleRandom [0, [0.2,0.2,0], [13,13,1], 0, 1, [0, 0, 0, 0.1], 1, 0];
_splash_gaz setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0], 13, 10.2, 7.9, 0.3, [5,20], [[0.3, 0.5, 0.1, 1], [0.1, 0.4, 0.1, 0]], [0.08], 1, 0, "", "", _farty_corp];
_splash_gaz setDropInterval 0.001;

sleep 1;
deleteVehicle _splash_gaz;
deleteVehicle _splash_stropi;