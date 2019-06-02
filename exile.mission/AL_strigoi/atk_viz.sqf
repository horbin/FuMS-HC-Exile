// by ALIAS

if (!hasInterface) exitWith {};

private ["_press_implicit_x","_press_implicit_y","_dir_salt","_fct_z","_al_pressure"];

_strigoi	= _this select 0;
_tgt_casp	= _this select 1;

// flux de energie scurgandu-se de la victima la strigoi//ceata fosforescenta


_dist = _strigoi distance _tgt_casp;
_poz_z = (getpos _tgt_casp select 2)-(getpos _strigoi select 2);
_unghi_vert = atan ((abs _poz_z)/_dist);
_press_implicit_z = linearConversion [0, 90,_unghi_vert, 0, 1, true];
if ((_unghi_vert <=90)or(_unghi_vert>=270)) then {_fct_z = 1} else {_fct_z=-1};
_press_implicit_z = (_press_implicit_z*_fct_z);

_dir_salt = _tgt_casp getdir _strigoi;
if (_dir_salt<=90) then {_press_implicit_x = linearConversion [0, 90,_dir_salt, 0, 1, true];_press_implicit_y = 1-_press_implicit_x;};
if ((_dir_salt>90)and(_dir_salt<180)) then {_dir_salt = _dir_salt-90;_press_implicit_x = linearConversion [0, 90,_dir_salt, 1, 0, true];_press_implicit_y = _press_implicit_x-1;};
if ((_dir_salt>180)and(_dir_salt<270)) then {_dir_salt = _dir_salt-180;	_press_implicit_x = linearConversion [0, 90,_dir_salt, 0, -1, true];_press_implicit_y = (-1*_press_implicit_x)-1;};
if ((_dir_salt>270)and(_dir_salt<360)) then {_dir_salt = _dir_salt-270;_press_implicit_x = linearConversion [0, 90,_dir_salt, -1, 0, true];_press_implicit_y = 1+_press_implicit_x;};

_al_pressure = 15;
// ceata
_en_field = "#particlesource" createVehicleLocal (getPosATL _tgt_casp);
_en_field setParticleCircle [0,[0,0,0]];
_en_field setParticleRandom [0,[0.1,0.1,0.5],[0,0,0.3],0,0,[0,0,0,0],0,0];
_en_field setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "SpaceObject", 1, 0.5,[0,0,0],
		[_press_implicit_x*_al_pressure,_press_implicit_y*_al_pressure,_press_implicit_z*(_al_pressure/3)],
		1, 10.5, 7.9, 0.0001, [1, 0.1], [[1,1,1,0.3], [1,1,1,0]], [0.08], 1, 0, "", "", _tgt_casp];
_en_field setDropInterval 0.002;

_en_cloud = "#particlesource" createVehicleLocal (getPosATL _tgt_casp);
_en_cloud setParticleCircle [0,[0,0,0]];
_en_cloud setParticleRandom [0.5,[0.4,0.4,1],[0,0,0.3],0.5,0,[0,0,0,0],0,0];
_en_cloud setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 1,[0,0,0],
		[_press_implicit_x*_al_pressure,_press_implicit_y*_al_pressure,_press_implicit_z*(_al_pressure/3)],
		1, 10.5, 7.9, 0.0001, [2,1,0.1], [[1,1,1,1],[1,1,1,1],[1,1,1,0]], [0.08], 1, 0, "", "", _tgt_casp];
_en_cloud setDropInterval 0.01;



sleep 1;
deleteVehicle _en_field;
deleteVehicle _en_cloud;