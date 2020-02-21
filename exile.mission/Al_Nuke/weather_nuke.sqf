// by ALIAS
// nul = [] execvm "Al_Nuke\weather_nuke.sqf";

if (!hasInterface) exitWith {};

	sleep 32;

    Leaves_Green = "#particlesource" createVehicleLocal (getpos player);
    Leaves_Green attachto [player];
    Leaves_Green setParticleParams [["\A3\data_f\ParticleEffects\Hit_Leaves\Leaves_Green.p3d", 1, 0, 1],"","SpaceObject",1,7,[0,0,0],[0,0,0],1,0.000001,0,1.4,[1],[[0.68,0.68,0.68,1]],[0,1],0.2,1.2,"","",vehicle player];
    Leaves_Green setParticleRandom [0, [10, 10, 7], [4, 4, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
    Leaves_Green setParticleCircle [0.0, [0, 0, 0]];
                
	Leaves_leaf = "#particlesource" createVehicleLocal (getpos player);
    Leaves_leaf attachto [player];
    Leaves_leaf setParticleParams [["\A3\data_f\cl_leaf", 1, 0, 1],"","SpaceObject",1,7,[0,0,0],[0,0,0],1,0.000001,0,1.4,[1],[[0.68,0.68,0.68,1]],[0,1],0.2,1.2,"","",vehicle player];
    Leaves_leaf setParticleRandom [0, [10, 10, 7], [4, 4, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
    Leaves_leaf setParticleCircle [0.0, [0, 0, 0]];
                			   
	WoodParts = "#particlesource" createVehicleLocal (getpos player);
	WoodParts attachto [player];
	WoodParts setParticleParams [["\A3\data_f\ParticleEffects\Universal\WoodParts_01.p3d", 1, 0, 1],"","SpaceObject",1,7,[0,0,0],[0,0,0],1,0.000001,0,1.4,[1],[[0.68,0.68,0.68,1]],[0,1],0.2,1.2,"","",vehicle player];
	WoodParts setParticleRandom [0, [10, 10, 7], [4, 4, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
	WoodParts setParticleCircle [0.0, [0, 0, 0]];
                
	leaves_p  = "#particlesource" createVehicleLocal (getpos player);
	leaves_p attachto [player];
	leaves_p setParticleRandom [0, [10, 10, 7], [4, 4, 5], 2, 0.1, [0, 0, 0, 0.5], 1, 1];
				
	leaves_p setParticleCircle [100, [0, 0, 0]]; 
	leaves_p setParticleParams [["\A3\data_f\ParticleEffects\Hit_Leaves\Sticks_Green", 1, 1, 1], "", "SpaceObject", 1,27,[0,0,0],[50,50,10],2,0.000001,0.0,0.1,[0.5+random 5],[[0.68,0.68,0.68,1]],[1.5,1],13,13,"","",vehicle player];
					
	Leaves_Green setDropInterval 0.01 + random 0.3;
	Leaves_leaf setDropInterval 0.01 + random 0.3;
	
	WoodParts setDropInterval 0.01 + random 0.3;
	leaves_p setDropInterval 3 + random 51;

	
	[] spawn {
		sleep 600;
		deleteVehicle Leaves_Green;
		deleteVehicle Leaves_leaf;
		deleteVehicle WoodParts;
		deleteVehicle leaves_p;	
	};