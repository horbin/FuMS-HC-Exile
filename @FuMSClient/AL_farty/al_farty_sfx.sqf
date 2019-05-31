// by ALIAS

private ["_cap_segment","_carcasa_coada","_farty_boss","_clabuci_cap","_clabuci_coada"];

if (!hasInterface) exitWith {};

_cap_segment 	= _this select 0;
_carcasa_coada 	= _this select 1;
_farty_boss 	= _this select 2;

[_cap_segment] spawn {_inima = _this select 0;while {alive _inima} do {_inima say3D ["voce_fart", 200];sleep 4}};

waitUntil {sleep 2;!isNil{_farty_boss getVariable "ascuns"}};

while {alive _farty_boss} do 
{
	if !(_farty_boss getVariable "ascuns") then 
	{
	_clabuci_cap = "#particlesource" createVehicleLocal (getPosATL _cap_segment);
	_clabuci_cap setParticleCircle [0.8,[0,0,0]];
	_clabuci_cap setParticleRandom [0, [0,0,0],[0.3,0.3,0.3], 0, 0, [0, 0, 0, 0], 0, 0];
	_clabuci_cap setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1,7,[0,0,0.1],[0,0,0], 13, 10, 7.9, 0.0001, [2,3,5], [[0.2,1,0,0.5],[0.2,1,0,1],[0.2,1,0,0]], [0.08], 1, 0, "", "", _cap_segment];
	_clabuci_cap setDropInterval 0.1;

	_clabuci_coada = "#particlesource" createVehicleLocal (getPosATL _carcasa_coada);
	_clabuci_coada setParticleCircle [2.5,[0,0,0]];
	_clabuci_coada setParticleRandom [0, [0.8,0.8,0.8],[0.3,0.3,0.3], 0, 0, [0, 0, 0, 0], 0, 0];
	_clabuci_coada setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1,5,[0,0,0.1],[0,0,0], 13, 10, 7.9, 0.0001, [1,3,6], [[0.2,1,0,0.5],[0.2,1,0,1],[0.2,1,0,0]], [0.08], 1, 0, "", "", _carcasa_coada];
	_clabuci_coada setDropInterval 0.01;
	
	waitUntil {sleep 5;(_farty_boss getVariable "ascuns")};
	deletevehicle _clabuci_cap;
	deletevehicle _clabuci_coada;	
	};
	sleep 5;
};