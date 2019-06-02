// by ALIAS

private ["_pos_hit"];

if (!hasInterface) exitWith {};

_pos_hit = _this select 0;

_part_hit = "#particlesource" createVehicleLocal (getPos _pos_hit);
_part_hit setParticleCircle [0,[0,0,0]];
_part_hit setParticleRandom [0,[0,0,0],[0,0,0],0,0,[0,0,0,0],0,0];
_part_hit setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,0,32,0],"","Billboard",1,1,[0,0,1],[0,0,0],5,10,7.9,0,[3,3],[[1,1,1,1],[1,1,1,1]],[3],0,0,"","",_pos_hit];
_part_hit setDropInterval 5;
	
sleep 0.2;
deleteVehicle _part_hit;