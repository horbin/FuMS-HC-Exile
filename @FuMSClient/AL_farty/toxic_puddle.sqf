// by ALIAS

private ["_toxic_puddle","_smoke_toxic"];

if (!hasInterface) exitWith {};

_toxic_puddle = _this select 0;

 [_toxic_puddle] spawn 
 {
	private ["_puf"];
	_puf = _this select 0;
	sleep random 60;
	while {alive _puf} do 
	{
	_sfar = ["sfaraie_08","sfaraie_09","acid_burn_1","acid_burn_2","acid_burn_3","acid_burn_4"] call BIS_fnc_selectRandom;
	_puf say3D [_sfar, 150];
	_splash_toxic = "#particlesource" createVehicleLocal (getPosATL _puf);
	_splash_toxic setParticleCircle [0.4, [0, 0, 0]];
	_splash_toxic setParticleRandom [0, [0.25, 0.25, -0.1], [1, 1, 3], 0, 0.25, [0, 0, 0, 0.1], 1, 0];
	if (sunOrMoon==1) then 
		{
		_splash_toxic setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 7, [0, 0, 0], [0, 0, 0.75], 0, 15, 7.9, 0.0001, [0.05, 0.05, 0.05], [[0.5, 1, 0.3, 1], [1, 1, 0.3, 1], [1, 1, 0.3, 1]], [0.08], 1, 0, "", "", _puf];
		_splash_toxic setDropInterval 0.005;
		} else {
		_splash_toxic setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 7, [0, 0, 0], [0, 0, 0.75], 0, 15, 7.9, 0.0001, [0.1, 0.1, 0.1], [[0.5, 1, 0.3, 1], [0.8, 1, 0.5, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _puf];
		_splash_toxic setDropInterval 0.003;
		};
	sleep 0.3;
	deletevehicle _splash_toxic;
	sleep 7+(random 10);
	};
 };

while {true} do 
{
	while {(player distance _toxic_puddle) >1500} do {sleep 5};
	_bubble_acid = "#particlesource" createVehicleLocal (getPosATL _toxic_puddle);
	_bubble_acid setParticleCircle [1, [0, 0, 0]];
	_bubble_acid setParticleRandom [0, [0.25, 0.25, -0.2], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 1, 0];
	_bubble_acid setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0.3], 13, 10, 7.9, 0.000001, [0.5, 0.2, 0.2, 0.2, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _toxic_puddle];
	_bubble_acid setDropInterval 0.05;

	if (sunOrMoon==1) then 
	{
	_smoke_toxic = "#particlesource" createVehicleLocal (getPosATL _toxic_puddle);
	_smoke_toxic setParticleCircle [0, [0, 0, 0]];
	_smoke_toxic setParticleRandom [0, [1, 1, -0.3], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 1, 0];
	_smoke_toxic setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 0.3], 7, 10, 7.9, 0.05, [1.2, 2, 4], [[0.5, 1, 0.3, 0], [0.2, 0.5, 0.1, 0.3], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _toxic_puddle];
	_smoke_toxic setDropInterval 0.5;	
	} else {
	_smoke_toxic = "#particlesource" createVehicleLocal (getPosATL _toxic_puddle);
	_smoke_toxic setParticleCircle [0, [0, 0, 0]];
	_smoke_toxic setParticleRandom [0, [1, 1, -0.3], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 1, 0];
	_smoke_toxic setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 0.3], 7, 10, 7.9, 0.05, [2, 4, 6], [[0.5, 1, 0.3, 0.3], [0.2, 0.5, 0.1, 1], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _toxic_puddle];
	_smoke_toxic setDropInterval 0.5;	
	};
	
	while {(player distance _toxic_puddle) < 1500} do {sleep 5};
	deleteVehicle _bubble_acid;
	deleteVehicle _smoke_toxic;
}; 