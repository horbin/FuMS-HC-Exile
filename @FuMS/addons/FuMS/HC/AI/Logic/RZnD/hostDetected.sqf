//hostDetected.sqf
// Horbin
// 10/18/2015

private ["_zombie","_detectionRange","_hostDetected","_losTargets","_posTargets","_targetLOS","_targetGroup","_targetMemory","_zombieMemory",
"_targetTimeLastSeen","_targetMemoryDuration","_targetActive"];
_zombie = _this select 0;
_detectionRange = _zombie getVariable "FuMS_ZDetectionRange";

_hostDetected = false;	

if (!alive _zombie) exitwith {};
//#findtarget
_losTargets = [];	

_posTargets = _zombie nearEntities [["Man","air","car","tank","ship","staticweapon"], _detectionRange]; // list of all non-zombie and living'men' within 100m
//  diag_log format ["<FuMS> Zombie.sqf: %1 possible targets",_posTargets];
{       
    private ["_isZombie","_crew"];
    _isZombie = _x getVariable "FuMS_RyanZombieType";
    if (alive _x and (isNil "_isZombie") ) then
    // target is alive and not a zombie (but could still be an unmanned vehicle
    {         
        _crew = crew _x;
        // diag_log format ["<FuMS> zombie.sqf : Crew in vehicle %2 = %1",_crew, _x];
        if (count _crew > 0) then
        {               					
            if (_x iskindof "Man") then
            {
                // only add what the zombie can see/smell
                if ([_zombie, _x] call FuMS_fnc_HC_AI_Logic_RZnD_ZContact) then
                {	
                    _result = isObjectHidden _x;
                    if ( !_result ) then
                    {
                        _losTargets = _losTargets + [ _x];					
                        //  diag_log format ["<FuMS> hostDetected: %1 added to LOS Targets. ", name _x];
                    };
                };
            }else
            {
                // _x is a vehicle, so it is spotted by the zombie no matter what!
                _losTargets = _losTargets + [_x];
             //  diag_log format ["<FuMS> hostDetected: VEHICLE: %1 added to LOS Targets. ", name _x];
            };
            
        };
    };     
}foreach _posTargets ;

//Zombie has 3 sources of location.  LOS, Group, its Memory.
// nearest LOS target will be 1st in the LOS list.
_targetLOS = objNull;
if (count _losTargets > 0) then {_targetLOS = _losTargets select 0;};	
//nearest enemy detected by the GROUP!
_targetGroup = _zombie findNearestEnemy _zombie; 
// zombie's memory.
_zombieMemory = _zombie getVariable "FuMS_ZMemory";
_targetMemory = _zombieMemory select 0;
_targetTimeLastSeen = _zombieMemory select 1;
//	_targetLocLastSeen = _zombieMemory select 2;
_targetMemoryDuration = _zombieMemory select 3;

//diag_log format ["<FuMS> hostDetected: Group:%1 | LOS:%2 | Memory:%3 ", _targetGroup, _targetLOS, _targetMemory];
//diag_log format ["<FuMS> hostDetected: Zomb Memory:%1",_zombieMemory];

_targetActive = objNull;
// select which source for the 'target'
// group target has priority, unless there is a losTarget that is closer.
if (!isnull _targetGroup) then 
{
    if (!isNull _targetLOS) then
    {
        if (_targetLOS distance _zombie < _targetGroup distance _zombie) then
        {
            _targetActive = _targetLOS;
            //diag_log format ["<FuMS> hostDetected: LOS:%1 selected over Group:%2 target",_targetLOS, _targetGroup];
        }
        else
        {
            _targetActive = _targetGroup;
           // diag_log format ["<FuMS> hostDetected: Group:%1 selected as target",_targetGroup];
        };	
    };
    _zombieMemory set [0,_targetActive];  // what was seen
    _zombieMemory set [1, diag_tickTime]; // when it was seen
    _zombieMemory set [2, getPos _targetActive]; // where it was when seen			
}
else 
{
    if (!isNull _targetLOS) then
    {
        _targetActive = _targetLOS;
       // diag_log format ["<FuMS> hostDetected: LOS:%1 selected as target",_targetLOS];
        _zombieMemory set [0,_targetActive];  // what was seen
        _zombieMemory set [1, diag_tickTime]; // when it was seen
        _zombieMemory set [2, getPos _targetActive]; // where it was when seen
    }
    else
    {
        _forgetTime = _targetTimeLastSeen + _targetMemoryDuration;
        // diag_log format ["<FuMS> hostDetected: Using Zombies memory! %1, _forgetTime:%2, currtime:%3",_targetMemory, _forgetTime, diag_tickTime];
        if (alive _targetMemory and (diag_tickTime < _forgetTime) ) then
        {
            //zombie still remembers its old target, so go to the last 'known location.
            _targetActive = _targetMemory;
          //  diag_log format ["<FuMS> hostDetected: Memory:%1 selected as target",_targetMemory];
            // don't modify his memory with anything else!
        };
    };
};

if (!isNull _targetActive) then
{
    _hostDetected = true;
    _zombie setVariable ["FuMS_ZMemory", _zombieMemory];
};

_hostDetected	

