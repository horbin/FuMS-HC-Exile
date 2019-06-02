// by ALIAS

private ["_k_unit","_grp","_ksound","_chasep","_distep"];

if (!isServer) exitWith {};

_origin = _this select 0;
_no		= _this select 1;
_ksound = _this select 2;
_chasep	= _this select 3;
_distep	= _this select 4;

if (_no>0) then 
{
	_nr_k = 0;
	while {_nr_k<_no} do 
	{	
		_initSpot = getMarkerPos _origin;
		_newSpot = _initSpot getPos [5,(random 360)];
		
		
		
		_grp = createGroup civilian;
		_type_k = ["C_Man_casual_6_F_afro","C_man_1_1_F","C_Man_casual_1_F_asia","C_man_1_3_F","C_man_polo_1_F","C_man_polo_1_F_afro","C_Man_casual_3_F_asia","C_man_polo_1_F_asia","C_man_polo_2_F","C_man_polo_2_F_afro","C_man_polo_2_F_euro","C_Man_casual_4_F_euro","C_man_polo_3_F","C_man_polo_3_F_afro","C_Man_casual_5_F_euro","C_man_polo_3_F_asia","C_man_polo_4_F","C_man_polo_4_F_afro","C_man_polo_4_F_euro","C_man_polo_4_F_asia","C_man_polo_5_F","C_man_polo_5_F_afro","C_man_polo_5_F_euro","C_man_polo_5_F_asia","C_man_polo_6_F","C_man_polo_6_F_afro","C_man_polo_6_F_euro","C_man_polo_6_F_asia","C_man_p_fugitive_F","C_man_p_fugitive_F_afro","C_man_p_fugitive_F_euro","C_man_p_fugitive_F_asia","C_man_hunter_1_F","C_Orestes","C_Nikos","C_Nikos","C_man_sport_2_F_afro","C_man_sport_3_F_asia"] call BIS_fnc_selectRandom;
		_type_k createUnit [_newSpot, _grp, "[this,_distep,_ksound,_chasep] execvm 'AL_crazy\kam.sqf'",1];
		_nr_k = _nr_k +1;
		sleep 1;
	};
};