// Zombie.sqf
// Horbin
// 10/13/15
// Converted .sqs to .sqf based upon Ryan's Zombie and Demons Mod


/*
	**ISSUES**
	Zombies will not walk when not agro!
	
  poor group communication
  -chasing is a little stuttery
  -need to add better 'wonder' logic for fields and buildings
  -need to add pattern spawning
--Logic--	

--Testing Modifications



added 'lineintersects' check prior to 'attacking' in zattak



*/
ryanzombiesdisableaggressive = false;
private ["_zombie","_patternOptions","_detectionRange","_group","_wonderLimit","_sound",
"_attackarray","_jumparray","_collisionarray","_throwarray","_typeTarget","_eathitarray","_typeZombie","_homeloc","_memoryDuration"];

_zombie = _this select 0;
_patternOptions = _this select 1;
_detectionRange = _patternOptions select 0;
_zombieCanThrow = _patternOptions select 1;
_wonderLimit = _patternOptions select 2;


_typeZombie = _zombie getVariable "FuMS_RyanZombieType";

switch (toupper _typeZombie) do
{
    case "ZOMBIE":
    {  // set memory to 1, jump throw back to 0.1,15
        _attackarray = ["ryanzombies\sounds\ryanzombiesattack1.ogg", "ryanzombies\sounds\ryanzombiesattack2.ogg", "ryanzombies\sounds\ryanzombiesattack3.ogg", "ryanzombies\sounds\ryanzombiesattack4.ogg", "ryanzombies\sounds\ryanzombiesattack5.ogg"];
        _jumparray = ["ryanzombies\sounds\ryanzombiesleap1.ogg", "ryanzombies\sounds\ryanzombiesleap2.ogg", "ryanzombies\sounds\ryanzombiesleap3.ogg", "ryanzombies\sounds\ryanzombiesleap4.ogg", "ryanzombies\sounds\ryanzombiesleap5.ogg", "ryanzombies\sounds\ryanzombiesleap6.ogg"];
        _collisionarray = ["ryanzombies\sounds\collision1.ogg", "ryanzombies\sounds\collision2.ogg", "ryanzombies\sounds\collision3.ogg", "ryanzombies\sounds\collision4.ogg"];
        _throwarray = ["ryanzombies\sounds\vehicle_collision.wss", "ryanzombies\sounds\vehicle_drag_end.wss"];
        _eathitarray = ["ryanzombies\sounds\ryanzombieseathit.wav"];
        _zombie setVariable ["FuMS_ZJump",[20, 00]]; // jump range and chance to jump
        _zombie setVariable ["FuMS_ZThrow",[00, 10]]; // chance and 'how close target must be to vehicle in order for zombie to throw it'
        _zombie setVariable ["FuMS_ZAttackStats", [
            //Push/rattle velocity, Damage, Attack Speed, Attack Range
            [3.5, .05, .8, 2.3],  // Man
            [2.5, .025, .8, 7], // Car
            [.4, .005, .8,8], // Tank
            [1.5, .01, .8,10], // Air
            [2.0, .015, .8,7], // Ship
            [3.0, .025, .8, 6] // staticweapon
        ]];
        _memoryDuration = 2; // 2= almost instant forget upon breaking LOS   
    };
    case "ZOMBIESOLDIER":
    {
        _attackarray = ["ryanzombies\sounds\ryanzombiesattack1.ogg", "ryanzombies\sounds\ryanzombiesattack2.ogg", "ryanzombies\sounds\ryanzombiesattack3.ogg", "ryanzombies\sounds\ryanzombiesattack4.ogg", "ryanzombies\sounds\ryanzombiesattack5.ogg"];
        _jumparray = ["ryanzombies\sounds\ryanzombiesleap1.ogg", "ryanzombies\sounds\ryanzombiesleap2.ogg", "ryanzombies\sounds\ryanzombiesleap3.ogg", "ryanzombies\sounds\ryanzombiesleap4.ogg", "ryanzombies\sounds\ryanzombiesleap5.ogg", "ryanzombies\sounds\ryanzombiesleap6.ogg"];
        _collisionarray = ["ryanzombies\sounds\collision1.ogg", "ryanzombies\sounds\collision2.ogg", "ryanzombies\sounds\collision3.ogg", "ryanzombies\sounds\collision4.ogg"];
        _throwarray = ["ryanzombies\sounds\vehicle_collision.wss", "ryanzombies\sounds\vehicle_drag_end.wss"];
        _eathitarray = ["ryanzombies\sounds\ryanzombieseathit.wav"];
        _zombie setVariable ["FuMS_ZJump",[20, 5]]; // jump range and chance to jump
        _zombie setVariable ["FuMS_ZThrow",[60, 20]]; // chance and distance
        _zombie setVariable ["FuMS_ZAttackStats", [
            //Push/rattle velocity, Damage, Attack Speed, Attack Range
            [3.5, .1, .8, 4.5],  // Man
            [2.5, .025, .8, 7], // Car
            [.4, .005, .8,8], // Tank
            [1.5, .01, .8,10], // Air
            [2.0, .015, .8,7], // Ship
            [3.0, .025, .8, 6] // staticweapon
        ]];
        _memoryDuration = 4; // 0=no memory 5=avoidable 10=hard
        
    };
    case "ZOMBIESPIDER":
    {
        _attackarray = ["ryanzombies\sounds\ryanzombiesattack1.ogg", "ryanzombies\sounds\ryanzombiesattack2.ogg", "ryanzombies\sounds\ryanzombiesattack3.ogg", "ryanzombies\sounds\ryanzombiesattack4.ogg", "ryanzombies\sounds\ryanzombiesattack5.ogg"];
        _jumparray = ["ryanzombies\sounds\ryanzombiesleap1.ogg", "ryanzombies\sounds\ryanzombiesleap2.ogg", "ryanzombies\sounds\ryanzombiesleap3.ogg", "ryanzombies\sounds\ryanzombiesleap4.ogg", "ryanzombies\sounds\ryanzombiesleap5.ogg", "ryanzombies\sounds\ryanzombiesleap6.ogg"];
        _collisionarray = ["ryanzombies\sounds\collision1.ogg", "ryanzombies\sounds\collision2.ogg", "ryanzombies\sounds\collision3.ogg", "ryanzombies\sounds\collision4.ogg"];
        _throwarray = ["ryanzombies\sounds\vehicle_collision.wss", "ryanzombies\sounds\vehicle_drag_end.wss"] ;
        _eathitarray = ["ryanzombies\sounds\ryanzombieseathit.wav"];
         _zombie setVariable ["FuMS_ZJump",[40, 50]]; // jump range and chance to jump
        _zombie setVariable ["FuMS_ZThrow",[5, 15]]; // chance and distance
        _zombie setVariable ["FuMS_ZAttackStats", [
            //Push/rattle velocity, Damage, Attack Speed, Attack Range
            [3.5, .11, .8, 4.5],  // Man
            [2.5, .025, .8, 7], // Car
            [.4, .005, .8,8], // Tank
            [1.5, .01, .8,10], // Air
            [2.0, .015, .8,7], // Ship
            [3.0, .025, .8, 6] // staticweapon
        ]];
        _memoryDuration = 8; // 0=no memory 5=avoidable 10=hard
    };
    case "ZOMBIEBOSS":
    {
        _attackarray = ["ryanzombies\sounds\ryanzombiesattack1boss.ogg", "ryanzombies\sounds\ryanzombiesattack2boss.ogg", "ryanzombies\sounds\ryanzombiesattack3boss.ogg", "ryanzombies\sounds\ryanzombiesattack4boss.ogg", "ryanzombies\sounds\ryanzombiesattack5boss.ogg"];
        _jumparray = ["ryanzombies\sounds\ryanzombiesleap1.ogg", "ryanzombies\sounds\ryanzombiesleap2.ogg", "ryanzombies\sounds\ryanzombiesleap3.ogg", "ryanzombies\sounds\ryanzombiesleap4.ogg", "ryanzombies\sounds\ryanzombiesleap5.ogg", "ryanzombies\sounds\ryanzombiesleap6.ogg"];
        _collisionarray = ["ryanzombies\sounds\collision1.ogg", "ryanzombies\sounds\collision2.ogg", "ryanzombies\sounds\collision3.ogg", "ryanzombies\sounds\collision4.ogg"];
        _throwarray = ["ryanzombies\sounds\vehicle_collision.wss", "ryanzombies\sounds\vehicle_drag_end.wss"];
        _eathitarray = ["ryanzombies\sounds\ryanzombieseathitboss1.ogg", "ryanzombies\sounds\ryanzombieseathitboss2.ogg"];
          _zombie setVariable ["FuMS_ZJump",[40, 30]]; // jump range and chance to jump
        _zombie setVariable ["FuMS_ZThrow",[80, 35]]; // chance and distance
        _zombie setVariable ["FuMS_ZAttackStats", [
            //Push/rattle velocity, Damage, Attack Speed, Attack Range
            [3.5, .4, .8, 4.5],  // Man
            [2.5, .24, .8, 7], // Car
            [.4, .01, .8,8], // Tank
            [1.5, .1, .8,10], // Air
            [2.0, .15, .8,7], // Ship
            [3.0, .2, .8, 6] // staticweapon
        ]];
        _memoryDuration = 12; // 0=no memory 5=avoidable 10=hard
    };
};


_group = group _zombie;

_group allowFleeing 0;
_group enableAttack false;
//_zombie disableAI "FSM";
//_zombie disableAI "AUTOTARGET";
//_zombie disableAI "TARGET";
_zombie setdammage .7; // zombies health
_zombie setspeaker "NoVoice";
_zombie enableFatigue false;
_zombie setunitpos "UP"; // down, middle
_zombie setmimic "dead";
_zombie setBehaviour "Careless";
_zombie setCombatMode "Blue";

//#start
_zombie setVariable ["FuMS_ZDetectionRange", _detectionRange];
_zombie setVariable ["FuMS_ZMove",[3, 13, _wonderLimit]]; // walk and run speed
// last object seen, time it was seen, where it was seen, memory duration.
_zombie setVariable ["FuMS_ZMemory",[objNull, diag_tickTime, getPos _zombie, _memoryDuration]]; // last number is milliseconds of memory.
_zombie setVariable ["FuMS_ZActiveTarget", objNull];
_zombie setVariable ["FuMS_ZActionTime",0];

// These may need to be changed based upon the TYPE of Zombie!
_homeLoc = getPos _zombie;

//_lastTarget = _zombie;
_sound = 0;
while {alive _zombie} do
{   
    private ["_hostDetected","_zombieMemory","_movetoTarget"];
    
    _hostDetected = [_zombie ] call FuMS_fnc_HC_AI_Logic_RZnD_HostDetected;
    // Zombie sees a bad guy, so go get him!   
    if (_hostDetected) then
    {
        private ["_target"];
        //_zombie moveto (getpos _zombie); // stop any random zombie movement so it is able to be driven by MoveToTarget.
        if ((_sound < diag_tickTime) && (!ryanzombiesdisableaggressive)) then
        {
            [_zombie] exec "\ryanzombies\soundsclose.sqf";
            _sound = diag_tickTime + 5;
        };                               
        _zombieMemory = _zombie getVariable "FuMS_ZMemory";    
        _target = _zombieMemory select 0;
        if (_zombie distance _target > _wonderLimit) then
        {
            // ai/player has escaped the zombie!
         //   diag_log format ["<FuMS> zombie.sqf : target %1 outside of zombie's agro zone",_target];				
            _zombieMemory set [1,0]; //set time last target seen to way into the past
            _zombie setVariable ["FuMS_ZMemory",_zombieMemory];
            sleep 2;
        }
        else
        {   
            private ["_attkstats","_attackRange"];
            if (vehicle _target iskindof "man") then{_typeTarget = 0;}; 
            if (vehicle _target iskindof "air") then{_typeTarget = 3;};      
            if (vehicle _target iskindof "car") then {_typeTarget = 1;};
            if (vehicle _target iskindof "tank") then {_typeTarget = 2;};
            if (vehicle _target iskindof "staticweapon") then {_typeTarget =5;};
            if (vehicle _target iskindof "ship") then {_typeTarget=4;};
            _attkstats = _zombie getVariable "FuMS_ZAttackStats";
            _attackRange = (_attkstats select _typeTarget) select 3;
            // React will determine if zombie attacks, mounts, or moves.
            if ( _zombie distance _target < _attackRange) then
            {
                [_zombie, _typeTarget, _attackarray, _collisionarray, _eathitarray] call FuMS_fnc_HC_AI_Logic_RZnD_ZAttack;
            }else
            {                
                [_zombie,_attackarray,_throwarray,_jumparray, _typeTarget,_zombieCanThrow] call FuMS_fnc_HC_AI_Logic_RZnD_MoveToTarget;
            };
        };
    }
	else
	{
        private ["_zombieLastTarget"];
        _sound = 0;
		// no target so either walk around randomly, or return home if just lost a target!
        _zombieMemory = _zombie getVariable "FuMS_ZMemory";    
		_zombie setFormDir random 360;
	//	_zombie setBehaviour "SAFE";
		_zombie forcespeed 2;
		//_zombie setSpeedMode "LIMITED";
			
		_zombieLastTarget = _zombieMemory select 0;
		if (isNull _zombieLastTarget) then
		{	
            private ["_zmemTargetpos"];
            
            _zmemTargetpos = _zombieMemory select 2;            
            if ( (_zombie distance _zmemTargetpos) < 3) then
            {
       //         diag_log format ["<FuMS> Zombie.sqf : starting random wondering"];
                _zombieMemory set [2, [(position _zombie select 0) + random 15 - random 15, (position _zombie select 1) + random 15 - random 15]];
                _zombie setVariable ["ZMemory", _zombieMemory];
                _zombie domove (_zombieMemory select 2);			
            };           
        }
        else
        {           
  //          diag_log format ["<FuMS> Zombie.sqf : %1 Lost target returning Home!",_zombie];
            // _zombie spawn loc = FuMS_AILOGIC [ _patrol, _eCenter, _spawnpos,_patrolLoc, _patternOptions]           
          
            _zombieMemory set [0, objNull];
            _zombieMemory set [2, _homeLoc];
            _zombie setVariable ["ZMemory", _zombieMemory];
            _zombie domove (_zombieMemory select 2);
        };
        sleep .25;
	};   
};