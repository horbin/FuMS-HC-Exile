// by ALIAS
// null=[gogu] execvm "AL_flamer\AL_flamer.sqf"

if (!isServer) exitWith {};

_blaze_obj = _this select 0;

_blaze_obj setCaptive true;
/*
_blaze_obj setObjectMaterialglobal [0,"a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];  
_blaze_obj setObjectMaterialGlobal [1,"a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];  
_blaze_obj setObjectMaterialGlobal [2,"a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];  
_blaze_obj setObjectMaterialGlobal [3,"a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];  
_blaze_obj setObjectMaterialGlobal [4,"a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];  
_blaze_obj setObjectMaterialGlobal [5,"a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];  
*/
//_blaze_obj setObjectTextureGlobal [0, "#(argb,8,8,3)color(1,0,0,0.3,ca)"];

_blaze_obj setObjectTextureglobal [0, "AL_flamer\03_flesh.jpg"];
_blaze_obj setObjectTextureglobal [1, "AL_flamer\03_flesh.jpg"];
_blaze_obj setObjectTextureglobal [2, "AL_flamer\03_flesh.jpg"];
_blaze_obj setObjectTextureglobal [3, "AL_flamer\03_flesh.jpg"];
_blaze_obj setObjectTextureglobal [4, "AL_flamer\03_flesh.jpg"];
_blaze_obj setObjectTextureglobal [5, "AL_flamer\03_flesh.jpg"];
/*
_fire_nod = "#particlesource" createVehicleLocal (getPos _blaze_obj);
_fire_nod setParticleCircle [0, [0, 0, 0]];
_fire_nod setParticleRandom [0, [0.1, 0.1,0.5], [0, 0, 0], 0, 0.5, [0, 0, 0, 0.5], 0, 0,90,0];
//_fire_nod setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,10,1,1], "", "Billboard", 1, 1, [0,0,0],[0,0,0.3],0,10,7.9,0.0001,[1,2,3],[[1,1,1,1],[1,1,1,1],[1,1,1,0.1]],[1000],0,0, "", "", _blaze_obj];
//_fire_nod setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,0,1,1], "", "Billboard", 1, 1, [0,0,0],[0,0,0.3],0,10,7.9,0.0001,[1,2,3],[[1,1,1,1],[1,1,1,1],[1,1,1,0.1]],[1000],0,0, "", "", _blaze_obj];
_fire_nod setParticleParams [["\A3\data_f\cl_exp",16,0,1,1], "", "SpaceObject", 1, 1, [0,0,0],[0,0,0.3],0,10,7.9,0.0001,[1,2,3],[[1,1,1,1],[1,1,1,1],[1,1,1,0.1]],[1000],0,0, "", "", _blaze_obj];
_fire_nod setDropInterval 0.01;



//_blaze_obj hideObjectGlobal true;

/*

_listi=selectionNames gogu; 
copyToClipboard str _listi;


bob = createGroup east createUnit ["O_Soldier_F", [0,0,0], [], 0, "NONE"];
bob setVehiclePosition [player modelToWorld [0,100,0], [], 0, "NONE"];
onEachFrame
{
	_beg = ASLToAGL eyePos bob;
	_endE = (_beg vectorAdd (eyeDirection bob vectorMultiply 100));
	drawLine3D [ _beg, _endE, [0,1,0,1]];
	_endW = (_beg vectorAdd (bob weaponDirection currentWeapon bob vectorMultiply 100));
	drawLine3D [_beg, _endW, [1,0,0,1]];
	_endV = (_beg vectorAdd (getCameraViewDirection bob vectorMultiply 100));
	drawLine3D [_beg, _endV, [0,0,1,1]];
};

/*

/*
_blaze_obj setObjectTextureGlobal [0, "#(argb,8,8,3)color(1,0,0,0.3,ca)"];
/*
