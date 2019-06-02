// by ALIAS
//nul = [obj_nuke,radius] execvm "Al_Nuke\rad_nuke.sqf";

if (!hasInterface) exitWith {};

obj_nuke_c = _this select 0;
radius_c = _this select 1;

if (radius_c>0) then {
	
	[obj_nuke_c, radius_c,/*damage-edit this for more or less*/0.02] spawn {
			_mark_rad = _this select 0;
			_radiux = _this select 1;
			_dam = _this select 2;
			_d = getdammage player;
			
			_center_rad = [getpos _mark_rad select 0, getpos _mark_rad select 1, 0];
			
		while {true} do { 
				if((player distance _center_rad) < _radiux) then {
					_noise_rad = ppEffectCreate ["FilmGrain", 2000];
					_noise_rad ppEffectEnable true;
					_noise_rad ppEffectAdjust[0.1,0.1,0.5,0.3,0.3,true];
					_noise_rad ppEffectCommit 0;				
					enableCamShake true;
					addCamShake [1, 3, 17];
					_d=_d+_dam;
					player setdammage _d;
					playsound "geiger";
					sleep 4;
					_noise_rad ppEffectEnable false;
				};
			enableCamShake false;
			sleep 0.1;
		};
	};
};
