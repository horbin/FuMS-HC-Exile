// by ALIAS
if (!isServer) exitWith {};

params ["_poz_orig_sc","_teritoriu","_damage_flamer","_hp_flamer"];
diag_log format ["<FuMS> SpawnFlamer: Flamer code started at %1",_poz_orig_sc];

_ck_pl = false;
while {!_ck_pl} do {{if (_x distance getMarkerPos _poz_orig_sc < _teritoriu) then {_ck_pl = true}} foreach allPlayers;sleep 10};
_flamer = createAgent ["O_Soldier_VR_F",getMarkerPos _poz_orig_sc, [],0, "NONE"]; _flamer setVariable ["BIS_fnc_animalBehaviour_disable", true]; _flamer setSpeaker "NoVoice"; _flamer disableConversation true; _flamer addRating -10000; _flamer setBehaviour "CARELESS"; _flamer enableFatigue false; _flamer setSkill ["courage", 1]; _flamer setUnitPos "UP"; _flamer disableAI "ALL"; _flamer setMass 7000; {_flamer enableAI _x} forEach ["MOVE","ANIM","TEAMSWITCH","PATH"];
_hp_curr_flamer = 1/_hp_flamer;
_flamer setVariable ["al_dam_total",_hp_curr_flamer,true]; _flamer setVariable ["al_dam_incr",_hp_curr_flamer,true]; _flamer setCaptive true;

_flamer removeAllEventHandlers "hit"; _flamer addEventHandler ["Hit", {[[_this select 0],"AL_flamer\splash_hit.sqf"] remoteExec ["execvm"]}];
_flamer addEventHandler ["Killed", {(_this select 0) hideObjectGlobal true; (_this select 1) addRating 2000}];
_flamer removeAllEventHandlers "HandleDamage"; _flamer addEventhandler ["HandleDamage",{params ["_unit","_damage","_bullet"];	_unit = _this select 0;	_bullet =_this select 4; _curr_dam = (_unit getVariable "al_dam_total") + (_unit getVariable "al_dam_incr"); _unit setVariable ["al_dam_total",_curr_dam,true];
if ((_bullet=="") or ((_unit getVariable "al_dam_total")<1)) then {0}else{1}}];
_flamer setAnimSpeedCoef 1.2;

_cap_flamer = "Land_HelipadEmpty_F" createVehicle [0,0,0]; _cap_flamer attachto [_flamer, [0,0,0.2],"neck"]; _flamer setVariable ["_cap_flamer", _cap_flamer, true];
for "_i" from 0 to 5 do {_flamer setObjectMaterialGlobal [_i,_flamer setObjectTextureglobal [_i, "AL_flamer\03_flesh.jpg"]]};
_flamer setVariable ["atk",false];
_flamer call fnc_hide_flamer;
_list_unit_range_flamer = [];
[_flamer] execvm "AL_flamer\al_end_flamer.sqf";
while {alive _flamer} do 
{
	while {count _list_unit_range_flamer isEqualTo 0} do {_list_unit_range_flamer = [_flamer,_teritoriu] call fnc_find_target_flamer; sleep 10};
	_tgt_flamer = selectRandom _list_unit_range_flamer;
	[_flamer,getMarkerPos _poz_orig_sc,_teritoriu,_damage_flamer] call fnc_show_flamer;
	while {(!isNil "_tgt_flamer") && {(alive _flamer) && ((_flamer distance getMarkerPos _poz_orig_sc) < _teritoriu)}} do 
	{
		_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities ["CAManBase",5]; {_x setDamage (getDammage _x + 0.05); _tip = selectrandom ["04","burned","02","03"]; [_x,[_tip,200]] remoteExec ["say3d"]} forEach (_nearflamer-[_flamer]); 
		if (selectRandom [true,false,true,true,false]) then { _flamer moveTo AGLToASL (_tgt_flamer getRelPos[10,180]); [_flamer,_tgt_flamer] call fnc_avoid_flamer}
		else {_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities ["CAManBase",5]; {_x setDamage (getDammage _x + 0.05)} forEach (_nearflamer-[_flamer]); [[_flamer],"AL_flamer\flamer_jump_SFX.sqf"] remoteExec ["execvm"]; [_flamer,_tgt_flamer,_cap_flamer] spawn fnc_jump_flamer};
		sleep 1;
		_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities ["CAManBase",5]; {_x setDamage (getDammage _x + 0.05); _tip = selectrandom ["04","burned","02","03"]; [_x,[_tip,200]] remoteExec ["say3d"]} forEach (_nearflamer-[_flamer]); 
		if ((_flamer distance _tgt_flamer <15)&&!(_flamer getVariable "atk")) then 
		{_flamer setVariable ["atk",true]; [_flamer,_tgt_flamer,_damage_flamer] spawn fnc_attk_flamer; sleep 0.5; [[_tgt_flamer],"AL_flamer\flamer_atk_SFX.sqf"] remoteExec ["execvm"]};
		sleep 1;
		_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities ["CAManBase",5]; {_x setDamage (getDammage _x + 0.05); _tip = selectrandom ["04","burned","02","03"]; [_x,[_tip,200]] remoteExec ["say3d"]} forEach (_nearflamer-[_flamer]); 
		if ((!alive _tgt_flamer)or(_tgt_flamer distance getMarkerPos _poz_orig_sc > _teritoriu)) then {_list_unit_range_flamer = [_flamer,_teritoriu] call fnc_find_target_flamer; if !(count _list_unit_range_flamer isEqualTo 0) then {_tgt_flamer = selectRandom _list_unit_range_flamer} else {_tgt_flamer = nil}};
		sleep 1;
		_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities ["CAManBase",5]; {_x setDamage (getDammage _x + 0.05); _tip = selectrandom ["04","burned","02","03"]; [_x,[_tip,200]] remoteExec ["say3d"]} forEach (_nearflamer-[_flamer]); 
	};
	_flamer call fnc_hide_flamer;
	_tgt_flamer = nil;
	_list_unit_range_flamer = [];
	sleep 5;
	_flamer setVariable ["al_dam_total",_hp_curr_flamer,true];
};
detach _cap_flamer;deleteVehicle _cap_flamer;sleep 5;deleteVehicle _flamer;