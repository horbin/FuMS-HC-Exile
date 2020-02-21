// by ALIAS
// nul = [] execvm "Al_Nuke\fog_nuke.sqf";

//if (!isServer) exitWith {};	

	startfog = false; publicVariable "startfog";
	waitUntil {startfog};
	enableEnvironment [false, false];
	al_windlevel	= wind;
	wind_sound_cust = true;
	3 setFog [0.3,0.1,50];

	sleep 35;
	
	[] spawn {
		sleep 5;
		while {wind_sound_cust} do
		{
			["wind_strong"] remoteExec ["playSound"];
			sleep 30;
		};
	};

	incr =(al_windlevel select 0) + (al_windlevel select 1);
	while {incr<30} do 
	{
		sleep 0.01;
		incr = incr+1;
		//hint str incr;
		setWind [incr,incr,true];
	};

	sleep 300;
	enableEnvironment true;
	wind_sound_cust = false;
	setWind [al_windlevel select 0, al_windlevel select 1, true];
	
	