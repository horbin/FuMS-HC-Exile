// by ALIAS

if (!isServer) exitwith {};

private ["_array_markers_radioactive","_mrk_temp","_array_temp","_nr_mrk"];

_number_of_areas = _this select 0;
_ras_radius		 = _this select 1;
_damage_rad		 = _this select 2;
_rad_prot_maska	 = _this select 3;
_protect_markers = _this select 4;
_rad_detector	 = _this select 5;
_glowindark		 = _this select 6;
_timetoglow	 	 = _this select 7;

_debug_radiation = false; // make it true for debug info as hint

damagebyradiation=_damage_rad;
publicVariable "damagebyradiation";

glowindark = _glowindark; publicVariable "glowindark";
if ((_timetoglow>0) and (glowindark)) then {timetoglow = _timetoglow; publicVariable "timetoglow"};

obj_prot_rad = _rad_prot_maska;
publicVariable "obj_prot_rad";

rad_det = _rad_detector;
publicVariable "rad_det";

_array_markers_radioactive = [];

{
	if (markerType _x == "Empty") then {
	_array_markers_radioactive pushback _x;
	}
} forEach allMapMarkers;

protejate	= count _protect_markers;

if (protejate >0) then {_array_markers_radioactive = _array_markers_radioactive - _protect_markers};

radiate		= count _array_markers_radioactive;
//hint str _array_markers_radioactive;

lista_finala_radiatie = [];

// selectare random
if (radiate > _number_of_areas) then {
	_nr_mrk = 0;
	_nm=0;
	while {_nr_mrk <_number_of_areas} do {
	_array_temp=[];
	_mrk_temp = _array_markers_radioactive call BIS_fnc_selectRandom;
	//hint str _mrk_temp;
	_array_temp pushBack _mrk_temp;
	_array_markers_radioactive=_array_markers_radioactive-_array_temp;
	_emitator_rad = "Land_HelipadEmpty_F" createVehicle (getMarkerPos _mrk_temp);
	lista_finala_radiatie pushBack _emitator_rad;
		if (_debug_radiation) then {
		_markern = format[ "markern_%1", str (_nm+1)];
		_markerstr = createMarker [_markern,getPos _emitator_rad];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "hd_dot";
		_markerstr setMarkerColor "ColorRed";
		_nm=_nm+1;
		hint str _nm;
		};	
	_nr_mrk=_nr_mrk + 1;
	//hint str _nr_mrk;
	sleep 0.01;
	};
};

// numar egal de markere si zone radioactive
if (radiate == _number_of_areas) then {
	// toate markerele
	_nm=0;
	while {_nm < radiate} do {
	_mrk_rad_cur = _array_markers_radioactive select _nm;
	_emitator_rad = "Land_HelipadEmpty_F" createVehicle (getMarkerPos _mrk_rad_cur);
	lista_finala_radiatie pushBack _emitator_rad;
	if (_debug_radiation) then {
		_markern = format[ "markern_%1", str (_nm+1)];
		_markerstr = createMarker [_markern,getPos _emitator_rad];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "hd_dot";
		_markerstr setMarkerColor "ColorRed";
		hint str (_nm+1);
	};
	_nm=_nm+1;
	sleep 0.1;
	};
};

if (radiate < _number_of_areas) then {hint "You need to place more empty markers or reduce the number of radioactive areas for this to work!!!"};

publicVariable "lista_finala_radiatie";

//{sleep 0.1; [[[_x,_ras_radius,_damage_rad,_rad_prot_maska,_rad_detector], "AL_radiation\rad_emitter.sqf"], "BIS_fnc_execVM", true, true] spawn BIS_fnc_MP;} foreach lista_finala_radiatie;
{sleep 0.1;[[_x,_ras_radius,_damage_rad,_rad_prot_maska,_rad_detector], "AL_radiation\rad_emitter.sqf"] remoteExec ["execVM",0,true]} foreach lista_finala_radiatie;

if (glowindark) then 
{
	{[_x,_ras_radius] execvm "AL_radiation\ai_glowing.sqf"} foreach lista_finala_radiatie;
};







