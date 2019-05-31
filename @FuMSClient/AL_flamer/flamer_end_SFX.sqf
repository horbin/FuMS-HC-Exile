// by ALIAS

if (!hasInterface) exitWith {};
params ["_flamer"];
_poz_final = getPosATL _flamer;
_part_surs = "Land_HelipadEmpty_F" createVehiclelocal _poz_final;

enableCamShake true;
[getposATL _part_surs] spawn {params ["_coord"]; sleep 2; playSound3D [eko_sharp,"",false,[_coord select 0,_coord select 1,500],8,1,3000]; sleep 1.5;playSound3D [eko_bomb,"",false,[_coord select 0,_coord select 1,500],4,1,3000];};
if (player distance _part_surs > 300) then {};
_li_exp = "#lightpoint" createVehicle getPosATL _part_surs;
_li_exp lightAttachObject [_part_surs, [0,0,3]];
_li_exp setLightAttenuation [0,0,0,0,0,300];  
_li_exp setLightIntensity 1000;
_li_exp setLightBrightness 6;
_li_exp setLightDayLight true;	
_li_exp setLightFlareSize 150;
_li_exp setLightFlareMaxDistance 2000;	
_li_exp setLightAmbient[1,0.2,0.1];
_li_exp setLightColor[1,0.2,0.1];

_scantei = "#particlesource" createVehicleLocal getPosATL _part_surs;
_scantei setParticleCircle [2,[40,40,50]];
_scantei setParticleRandom [1,[0.5,0.5,0.5],[30,30,20],0,0.1,[0,0,0,0.1],1,0];
_scantei setParticleParams [["\A3\data_f\cl_exp",1,0,1],"","Billboard",1,3,[0,0,1],[0,0,0],0,300,10,15,[0.3,0.1],[[1,1,1,1],[1,1,1,1]],[1],1,0,"","",_part_surs,0,false,-1,[[1,0.1,0,1]]];
_scantei setDropInterval 0.01;	
[_scantei] spawn {_de_sters = _this select 0;sleep 0.5;	deleteVehicle _de_sters};

_part_hit = "#particlesource" createVehicleLocal getpos _part_surs;
_part_hit setParticleCircle [0,[0,0,0]];
_part_hit setParticleRandom [0,[0,0,0],[0,0,0],0,0,[0,0,0,0],0,0];
_part_hit setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,0,32,0],"","Billboard",1,1,[0,0,0],[0,0,0],5,10,7.9,0,[5,15],[[1,1,1,1],[1,1,1,1]],[2],0,0,"","",_part_surs];
_part_hit setDropInterval 5;
[_part_hit] spawn {params ["_sterg"]; sleep 0.3; deletevehicle _sterg};

_vapori_bmb = "#particlesource" createVehicleLocal getPosATL _part_surs;
_vapori_bmb setParticleCircle [0,[0,0,0]];
_vapori_bmb setParticleRandom [0,[0,0,0],[0,0,0],0,0,[0,0,0,0],0,0];
_vapori_bmb setParticleParams [["\A3\data_f\cl_basic",1,0,1],"","Billboard",1,0.5,[0,0,0],[0,0,3],0,10,7.9,0,[1,100],[[1,1,1,0.5],[1,1,1,0]],[1],0,0,"","",_part_surs];
_vapori_bmb setDropInterval 500;
[_vapori_bmb] spawn {_de_sters = _this select 0;sleep 0.5;deleteVehicle _de_sters};	
sleep 0.1;
_wave = "#particlesource" createVehicleLocal getPosATL _part_surs;
_wave setParticleCircle [3,[20,20,0]];
_wave setParticleRandom [0.1,[3,3,0],[-10,-10,0],0,0.1,[0,0,0,0.1],0,0];
_wave setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1],"","Billboard",1,2,[0,0,0],[0,0,0],0,17,13,0,[10,30],[[0,0,0,0.5],[0,0,0,0]],[1],0,0,"","",_part_surs];
_wave setDropInterval 0.005;
[_wave] spawn {_de_sters = _this select 0;sleep 0.2;deleteVehicle _de_sters};
sleep 0.1;

_palarie = "#particlesource" createVehicleLocal getpos _part_surs;
_palarie setParticleCircle [2,[-0.5,-0.5,0]];
_palarie setParticleRandom [0.5,[1,1,0.3],[0.3,0.3,0],0,0.1,[0,0,0,0.1],1,0];
_palarie setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,3,112,0],"","Billboard",1,3,[0,0,0],[0,0,6],0,15,7.9,0,[2,5],[[1,1,1,1],[0,0,0,0]],[0.1],1,0,"","",_part_surs,45];
_palarie setDropInterval 0.001;
[_palarie] spawn {params ["_sterg"]; sleep 0.3; deletevehicle _sterg};
sleep 0.2;

_picior = "#particlesource" createVehicleLocal getpos _part_surs;
_picior setParticleCircle [0.5,[0,0,0]];
_picior setParticleRandom [0.5,[0,0,0.3],[0,0,0],0,0.1,[0,0,0,0.1],0,0];
_picior setParticleParams [["\A3\data_f\cl_exp",1,0,1],"","Billboard",1,1.5,[0,0,0],[0,0,3.5],3,10,7.9,0,[4,0.5],[[1,1,1,1],[1,1,1,0]],[1],0,0,"","",_part_surs,90];
_picior setDropInterval 0.05;
[_picior] spawn {params ["_sterg"]; sleep 1; deletevehicle _sterg};

_picior_sec = "#particlesource" createVehicleLocal getpos _part_surs;
_picior_sec setParticleCircle [1,[0,0,0]];
_picior_sec setParticleRandom [0.5,[0.3,0.3,0.3],[0,0,0],0,0.1,[0,0,0,0.1],0,0];
_picior_sec setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Universal",16,7,48,1],"","Billboard",1,1.5,[0,0,0],[0,0,3.5],0,10,7.9,0,[3,3,2,2,2,1],[[0,0,0,1],[0,0,0,1],[0,0,0,1],[0,0,0,1],[0,0,0,0.5],[0,0,0,0]],[0.2],0,0,"","",_part_surs,90];
_picior_sec setDropInterval 0.02;
[_picior_sec] spawn {params ["_sterg"]; sleep 1.1; deletevehicle _sterg};	

if (player distance _part_surs < 100) then 
{	
	[] spawn 
	{		
		cutText ["", "WHITE OUT", 1];
		sleep 0.1;
		titleCut ["", "WHITE IN", 1];
		"dynamicBlur" ppEffectEnable true;   
		"dynamicBlur" ppEffectAdjust [1];   
		"dynamicBlur" ppEffectCommit 0;     
		"dynamicBlur" ppEffectAdjust [0.0];
		"dynamicBlur" ppEffectCommit 5;  
		sleep 5;
		"dynamicBlur" ppEffectEnable false; 
	};
	addCamShake [5,3,10]
};
if (player distance _part_surs < 10) then {playsound "burned"; addCamShake [5,2,5];call BIS_fnc_flamesEffect; [10] call BIS_fnc_bloodEffect;call BIS_fnc_indicateBleeding};
sleep 0.1;
_alias_local_fog = "#particlesource" createVehicleLocal (getpos _part_surs); 
_alias_local_fog setParticleCircle [50,[0,0,0]];
_alias_local_fog setParticleRandom [1,[50,50,0],[0,0,0],1,0.1,[0,0,0,0.1],0,0];
_alias_local_fog setParticleParams [["\A3\data_f\cl_basic",1,0,1],"","Billboard",1,10,[0,0,1],[0,0,0],3,10.1,7.9,0.01,[1,10,20],[[0.1,0.09,0.09,0],[0.1,0.09,0.09,0.5],[0.1,0.09,0.09,0]],[1],1,0,"","",_part_surs];
_alias_local_fog setDropInterval 0.01;
[_alias_local_fog] spawn {params ["_sterg"]; sleep 3; deletevehicle _sterg};
sleep 2;
_flama = "#particlesource" createVehicleLocal (getPosATL _part_surs);
_flama setParticleCircle [10,[0,0,0]];
_flama setParticleRandom [1,[10,10,0],[0,0,0],0,0.1,[0,0,0,0],1,0];
_flama setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,10,32,1],"","Billboard",1,5,[0,0,0],[0,0,0],0,10.07,7.9,0,[1,5,1],[[1,1,1,1],[1,1,1,1],[1,1,1,0]],[0.8],0, 0, "", "", _part_surs,0,true];
_flama setDropInterval 0.02;
[_flama] spawn {params ["_sterg"]; sleep 1.1; deletevehicle _sterg};
_brit = 5;
while {_brit>0} do 
{
	_li_exp setLightBrightness _brit;
	_brit = _brit-0.1;
	sleep 0.1;
};	
deleteVehicle _li_exp;
sleep 5;
deleteVehicle _part_surs;