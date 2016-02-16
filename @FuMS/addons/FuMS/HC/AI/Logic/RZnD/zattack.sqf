//zReact.sqf
// Horbin
// 10/18/15

// [_zombie, _typeTarget, _attackarray, _collisionarray, _eathitarray] call FuMS_fnc_HC_AI_Logic_RZnD_ZAttack;

private ["_zombie","_typeTarget","_attackarray","_collisionarray","_zombieMemory","_zatkstatsALL","_zatkstats","_attackstrength",
"_damage","_attackspeed","_target","_eathitarray"];
_zombie = _this select 0;
_typeTarget = _this select 1;
_attackarray = _this select 2;
_collisionarray = _this select 3;
_eathitarray = _this select 4;

_zombieMemory = _zombie getVariable "FuMS_ZMemory";
// 0=man, 1=car, 2=tank, 3=air, 4=other
_zatkstatsALL = _zombie getVariable "FuMS_ZAttackStats";
_zatkstats = _zatkstatsALL select _typeTarget;
_attackstrength = _zatkstats select 0;
_damage = _zatkstats select 1;
_attackspeed = _zatkstats select 2;

_target = _zombieMemory select 0;


private ["_pos","_dir","_attackrandom"];
//#attack

// This does not work! :(
//if ([_target] call ExileClient_util_world_isInSpawnZone) exitWith{};
    if (!lineintersects [eyePos _target, eyePos _zombie, _target, _zombie]) then
    {
        _zombie setdir ([_zombie, _target] call BIS_fnc_dirTo);
        _pos = position _target;
        _dir = ((_pos select 0) - (getpos _zombie select 0)) atan2 ((_pos select 1) - (getpos _zombie select 1));
        if (speed _target < 5) then 
        // pushes zombie back a little to prevent warping?
        {
            _zombie setpos [(_pos select 0) - 3*sin _dir, (_pos select 1) - 3*cos _dir];
        };
        //[[_zombie, "AwopPercMstpSgthWnonDnon_throw"], "switchmove"] call BIS_fnc_MP;
        _zombie playMoveNow "AwopPercMstpSgthWnonDnon_throw";
        
        _attackrandom = _attackarray select floor random count _attackarray;
        //diag_log ["zattack: attack:%1",_attackrandom];
        playsound3d [format ["%1",_attackrandom], _zombie];
        
        //diag_log format ["<FuMS> Zattack: %1 attacking %2 @ %3m  Type#:%4 Sound:%5",_zombie,name _target,_zombie distance _target, _typeTarget,format ["%1",_attackrandom]];
        
        
        private ["_collisionrandom","_vel"];
        // #damage
		//_minimumDistanceToTraderZone = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToTraderZones");
		//if ([getPos _zombie, _minimumDistanceToTraderZone] call ExileClient_util_world_isTraderZoneInRange) exitwith {};
		_inSafeZone = false;
        {
			//_markerName = 
			//_safezonesize = getMarkerSize _markerName;
			if (_x distance _zombie < 150) exitWith { deletevehicle _zombie; _inSafeZone=true;};
            if (_x distance _target < 200) exitWith {_inSafeZone= true;};
        }foreach exiletraderzonemarkerpositions;
        if (_inSafeZone) exitWith {};
        
        if (isClass(configFile >> "CfgPatches" >> "ace_main")) then
        {
            
            // [_target] execVM "\ryanzombies\acedamage.sqf";
            //      diag_log format ["<FuMS> Zattack : Damge:%1 onto %2 under ACE mod logic",_damage, _target];
            // ryan's acedamage requires modification here ISO FuMS AI configuraiton and logic.
            if(isPlayer _target) then 
            {
                
                [-2,
                {
                    _target = _this;
                    if(player == _target) then 
                    {
                        _body = _target gethit "body";
                        _legLeft = _target gethit "leg_l";
                        _legRight = _target getHit "leg_r";
                        if (_body > 0.85) then {_target sethit ["body",1]; _target setdammage 1};
                        _target sethit ["body",_body + _damage];
                        _target sethit ["leg_l",_legLeft + _damage];
                        _target sethit ["leg_r",_legRight + _damage];
                    };
                },_target] call CBA_fnc_globalExecute;
                
            } else 
            {
                
                _body = _target gethit "body";
                _legLeft = _target gethit "leg_l";
                _legRight = _target getHit "leg_r";
                if (_body > 0.85) then {_target sethit ["body",1]; _target setdammage 1};
                _target sethit ["leg_l",_legLeft + _damage];
                _target sethit ["leg_r",_legRight + _damage];                
            };
            
        }else
        {
            //      diag_log format ["<FuMS> Zattack : Damge:%1 onto %2",_damage, _target];
            _target setdamage (damage _target + _damage);
        };
        if (_typeTarget == 0) then
        {
            private ["_eathitrandom"];
            
            [_target] exec "\ryanzombies\scream.sqf";
            _eathitrandom = _eathitarray select floor random count _eathitarray;
            playsound3d [format ["%1",_eathitrandom],_target];
        }else
        {
            _collisionrandom = _collisionarray select floor random count _collisionarray;
            
            playsound3d [format ["%1",_collisionrandom], _target];
        };        
        _vel = velocity _target;
        _dir = direction _zombie;
        _target setvelocity [(_vel select 0) + (sin _dir * _attackstrength), (_vel select 1) + (cos _dir * _attackstrength), (_vel select 2) + random 1];                           
        sleep _attackspeed;                                                                
    };
        
        
        