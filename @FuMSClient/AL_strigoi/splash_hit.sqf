// by ALIAS

private ["_pos_hit"];

if (!hasInterface) exitWith {};

_pos_hit = _this select 0;

_part_hit = "#particlesource" createVehicleLocal (getPos _pos_hit);
_part_hit setParticleCircle [0, [0, 0, 0]];
_part_hit setParticleRandom [0.5,[0,0,2],[5,5,5],0,0.25,[0,0,0,0.1],0,0];
_part_hit setParticleParams [["\A3\data_f\blesk1",1,0,1],"","SpaceObject",1,0.3,[0,0,0],[0,0,0],5, 10, 7.9, 0.0001, [0.003, 0.0005], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _pos_hit];
_part_hit setDropInterval 0.001;
	
sleep 0.2;
deleteVehicle _part_hit;