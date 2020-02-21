// by ALIAS

if (!hasInterface) exitWith {};

params ["_flamer"];

_burn_grnd = "Land_HelipadEmpty_F" createVehiclelocal [getPosASL _flamer select 0,getPosASL _flamer select 1,0];
_burn_grnd say3D ["furnal",300];
enableCamShake true;
_blast_dust = "#particlesource" createVehicleLocal (getPosATL _flamer);
_blast_dust setParticleCircle [3,[-3,-3,0]];
_blast_dust setParticleRandom [0.5,[2,2,0],[-7,-7,0],5,1,[0,0,0,1],1,0.5];
_blast_dust setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1],"","Billboard",1,2,[0,0,0],[0,0,0.1],0,10,7.9,0,[1,10],[[0.3,0.27,0.15,0.3],[0.3,0.27,0.15,0]],[0.5],1,0.5,"","",_flamer,0,true];
_blast_dust setDropInterval 0.01;
_flama = "#particlesource" createVehicleLocal (getPosATL _flamer);
_flama setParticleCircle [3,[0,0,0]];
_flama setParticleRandom [1,[2,2,0],[0,0,0],0,0.1,[0,0,0,0],1,0];
_flama setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,10,32,1],"","Billboard",1,9,[0,0,0],[0,0,0],0,10.07,7.9,0,[2,2,2],[[1,1,1,0],[1,1,1,1],[1,1,1,0]],[0.8],0, 0, "", "", _flamer,0,true];
_flama setDropInterval 0.02;
_li_fire = "#lightpoint" createVehicle [getPosATL _flamer # 0,getPosATL _flamer # 1,3];
_li_fire setLightUseFlare false;
_li_fire setLightAttenuation [0,0,100,0,0.1,round (10+random 5)];
_li_fire setLightBrightness 10;
_li_fire setLightDayLight true;	
_li_fire setLightAmbient[1,0.2,0.1];
_li_fire setLightColor[1,0.2,0.1];
sleep 0.5;
deleteVehicle _blast_dust;
deleteVehicle _flama;
_bbb = 8;
while {_bbb>0} do 
{
	if (player distance _li_fire < 6) then {addCamShake [5,2,5]; call BIS_fnc_flamesEffect; [10] call BIS_fnc_bloodEffect; call BIS_fnc_indicateBleeding};
	_li_fire setLightBrightness _bbb;
	_li_fire setLightAttenuation [0,0,100,0,0.1,15+(random 1)];
	sleep 2.3;
	_bbb = _bbb-2;
};
deleteVehicle _li_fire;
sleep 5;
deleteVehicle _burn_grnd;