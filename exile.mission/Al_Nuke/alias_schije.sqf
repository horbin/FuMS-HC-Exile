// by ALIAS

if (!hasInterface) exitWith {};

_buc_sch = _this select 0;

if ((player distance _buc_sch)>2000) exitWith {};

_fum_sch = "#particlesource" createVehicleLocal getpos _buc_sch;
_fum_sch setParticleCircle [0, [0, 0, 0]];
_fum_sch setParticleRandom [2, [0, 0, 0], [0.2, 0.2, 0.5], 0.3, 0.5, [0, 0, 0, 0.5], 0, 0];
_fum_sch setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 5+random 3, [0, 0, 0], [0, 0, 0.5], 0, 10.2, 7.9, 0.01, [3,5,7], [[1,1,1,1], [1,1,1,0.5], [1,1,1,0]], [0.125], 1, 0, "", "", _buc_sch];
_fum_sch setDropInterval 0.02;