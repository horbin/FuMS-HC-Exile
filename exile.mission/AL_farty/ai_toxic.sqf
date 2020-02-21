//by ALIAS
//["myfarty",1,50] execvm "AL_farty\ai_toxic.sqf";

private ["_location_mark","_damage_toxic","_radius_toxic","_list_ai_in_range_tox","_reldir","_fct","_op_dir","_avoid_poz","_farty_boss"];

_location_mark	= _this select 0;
_damage_toxic	= _this select 1;
_radius_toxic	= _this select 2;

waitUntil {!isNil "allPlayers_on"};

while {true} do 
{
	_list_ai_in_range_tox = (getMarkerPos _location_mark) nearEntities [['Exile_Unit_Player'],_radius_toxic+10];
	if (count _list_ai_in_range_tox>0) then 
	{
		{//[str _list_ai_in_range_tox] remoteExec ["hint",0,true];
		if (!(_x in allPlayers_on)and(isNil {_x getVariable "anomalie"})) then {
		[[_x,_location_mark,_damage_toxic,_radius_toxic],"AL_farty\ai_action.sqf"] remoteExec ["execvm"];
		};
		} foreach _list_ai_in_range_tox;
	};
	sleep 4+(random 4);
};