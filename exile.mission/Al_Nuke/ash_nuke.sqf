// by ALIAS
// nul = [] execvm "Al_Nuke\ash_nuke.sqf";

if (!hasInterface) exitWith {};

	sleep 120;
	_pozp = position player;
	_parray = [ ["A3\Data_F\ParticleEffects\Universal\Universal", 16, 12, 8, 1],"","Billboard",1,4,[0,0,0],[0,0,0],1,0.000001,0,1.4,[0.05,0.05],[[0.1,0.1,0.1,1]],[0,1],0.2,1.2,"","",vehicle player];
	_cenusa = "#particlesource" createVehicleLocal _pozp;  
	if (vehicle player != player) then {_cenusa attachto [vehicle player]} else {_cenusa attachto [player]};
	_cenusa setParticleParams _parray;
	_cenusa setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
	_cenusa setParticleCircle [0.0, [0, 0, 0]];
	_cenusa setDropInterval 0.1;
