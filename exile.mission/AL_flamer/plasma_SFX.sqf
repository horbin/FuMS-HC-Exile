// by ALIAS

if (!hasInterface) exitwith {};

params ["_ballx","_shoot_dir"];

_ball_sfx = "#particlesource" createVehicleLocal (getPos _ballx);
_ball_sfx setParticleCircle [0,[0,0,0]];
_ball_sfx setParticleRandom [0,[0,0,0],[0,0,0],0,0,[0,0,0,0],0,0];
_ball_sfx setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,0,32,1],"","Billboard",1,0.5,[0,0,1],[_shoot_dir # 0,_shoot_dir # 1,_shoot_dir # 2],0,10,7.9,0,[3,2,2],[[1,1,1,1],[1,1,1,1],[1,1,1,0]],[3],0,0,"","",_ballx];
_ball_sfx setDropInterval 0.05;
sleep 0.5;
deleteVehicle _ball_sfx;