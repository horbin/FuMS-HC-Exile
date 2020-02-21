 // by ALIAS
// null=["marker"] execvm "AL_screamer\screamer.sqf"

fnc_avoid_screamer ={
    private ["_danger_close","_op_dir","_chased_units","_fct","_reldir","_avoid_poz"];
    _danger_close = _this select 0;
    _chased_units = _danger_close nearEntities ["CAManBase",100]; // any Human type
    {
        if (_x != _danger_close) then
        {
            _reldir = [_x, getPos _danger_close] call BIS_fnc_dirTo;
            _fct = [30,-30] call BIS_fnc_selectRandom;
            if (_reldir<180) then {_op_dir=_reldir+180 +_fct} else {_op_dir=_reldir-180+_fct};
            _avoid_poz = [getposATL _x,30+random 10, _op_dir] call BIS_fnc_relPos;
            _x doMove _avoid_poz;
            _x setSkill ["commanding", 1];
        };
    } foreach _chased_units;
};

if (!isServer) exitWith {};

private ["_box","_entitate","_poz_orig_sc"];

_poz_orig_sc = _this select 0;
_grp = createGroup CIVILIAN;
_entitate= _grp createUnit ["B_Soldier_VR_F",getmarkerpos _poz_orig_sc, [], 0,"NONE"];

_entitate setSpeaker "NoVoice";
_entitate disableConversation true;
_entitate setcaptive true;
_entitate addRating -10000;

RemoveAllItems _entitate;
removeUniform _entitate;
Removevest _entitate;
removeHeadgear _entitate;
removeAllWeapons _entitate;
_entitate unassignItem "NVGoggles";
_entitate removeItem "NVGoggles";

_entitate setBehaviour "CARELESS";
_entitate enableFatigue false;
_entitate setSkill ["courage", 1];
_entitate setUnitPos "UP";
//_entitate disableAI "FSM";
_entitate allowDamage true;
// damage
//_entitate addEventHandler ["HandleDamage",{_damage = (_this select 2)/6; _damage}];
//_entitate addEventHandler ["HandleDamage",{_damage = 0; _damage}];

// vizibility
[_entitate, true] remoteExec ["hideObjectGlobal",0,true];

// apparence
_screamer_anomally = createVehicle ["Land_AncientStatue_01_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_screamer_anomally attachTo [_entitate, [0, 0.5, 0.5],"spine3"];
_screamer_anomally setVectorDirAndUp [[0,-1,0],[0,0,1]];
_screamer_anomally setMass 1;
_screamer_anomally allowDamage true;  //aussie                                            

_bob1 = createVehicle ["Sign_Sphere25cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_bob2 = createVehicle ["Sign_Sphere25cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_bob3 = createVehicle ["Sign_Sphere25cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];

[_bob1, true] remoteExec ["hideObjectGlobal",0,true];
[_bob2, true] remoteExec ["hideObjectGlobal",0,true];
[_bob3, true] remoteExec ["hideObjectGlobal",0,true];

_bob1 attachTo [_screamer_anomally, [0, -6, 0.5]];
_bob2 attachTo [_screamer_anomally, [0, -19, 0.5]];
_bob3 attachTo [_screamer_anomally, [0, -42, 0.5]];

sleep 3;

private ["_press_implicit_y","_press_implicit_x","_list_ai_in_range_scream","_tgt_scream"];
while {alive _entitate} do
{   
    _list_ai_in_range_scream = (position _entitate) nearEntities [['Exile_Unit_Player'],150]; // the only radius distance check
    if  (count _list_ai_in_range_scream > 0) then
    {
        _tgt_scream = _list_ai_in_range_scream call BIS_fnc_selectRandom;
        _wave_obj = createVehicle ["Land_Battery_F", position _screamer_anomally, [], 0];    
        _entitate doMove (getPos _tgt_scream);
        _wave_obj setMass 10;   
        [_screamer_anomally,["miscare_screamer",300]] remoteExec ["say3d"];
        sleep 5;
        
        _entitate lookAt (getPos _tgt_scream);
        dostop _entitate;
        sleep 1;
        _units_range_1= (position _bob1) nearEntities [['Exile_Unit_Player'], 5];
        _units_range_2= (position _bob2) nearEntities [['Exile_Unit_Player'], 10];
        _units_range_3= (position _bob3) nearEntities [['Exile_Unit_Player'], 15];        
        sleep 1;

        _wave_obj attachTo [_screamer_anomally, [0,-1,1.5]];
        detach _wave_obj;
        
        //effect
        if (alive _entitate) then {[[_wave_obj,_screamer_anomally],"AL_screamer\effect_screamer.sqf"] remoteExec ["execvm"]};
        
        _dir_blast = getdir _entitate;

        _al_pressure = 90;

        if (_dir_blast<=90) then {
            _press_implicit_x = linearConversion [0, 90,_dir_blast, 0, 1, true];
            _press_implicit_y = 1-_press_implicit_x;
        };

        if ((_dir_blast>90)and(_dir_blast<180)) then {
            _dir_blast = _dir_blast-90;
            _press_implicit_x = linearConversion [0, 90,_dir_blast, 1, 0, true];
            _press_implicit_y = _press_implicit_x-1;
        };

        if ((_dir_blast>180)and(_dir_blast<270)) then {
            _dir_blast = _dir_blast-180;
            _press_implicit_x = linearConversion [0, 90,_dir_blast, 0, -1, true];
            _press_implicit_y = (-1*_press_implicit_x)-1;
        };

        if ((_dir_blast>270)and(_dir_blast<360)) then {
            _dir_blast = _dir_blast-270;
            _press_implicit_x = linearConversion [0, 90,_dir_blast, -1, 0, true];
            _press_implicit_y = 1+_press_implicit_x;
        };
        [_entitate] call fnc_avoid_screamer; // make AI flee

        // below damages based on distance (but they all have the same value here...)
        {_x setVelocity [1+random 3,1+random 3,1+random 5]; _x setDammage ((getDammage _x) + 0.2)} foreach _units_range_1; // damages based on distance 5m
        sleep 0.1;
        {_x setVelocity [1+random 3,1+random 3,1+random 5]; _x setDammage ((getDammage _x) + 0.2)} foreach _units_range_2; // damages based on distance 10m
        sleep 0.1;
        {_x setVelocity [1+random 3,1+random 3,1+random 5]; _x setDammage ((getDammage _x) + 0.2)} foreach _units_range_3; // damages based on distance 15m
        _wave_obj setVelocity [_press_implicit_x*_al_pressure,_press_implicit_y*_al_pressure,0];
        
        sleep 1;
        deleteVehicle _wave_obj;
        sleep 1;
    };
    sleep 5;
};

	
deleteVehicle _entitate;
[[_screamer_anomally],"AL_screamer\teleport_screamer.sqf"] remoteExec ["execvm"];
sleep 4;
deleteVehicle _screamer_anomally; 