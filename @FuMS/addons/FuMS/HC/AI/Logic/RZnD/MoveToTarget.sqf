//MoveToTarget.sqf
// Horbin
// 10/18/15
private ["_attackarray","_jumparray","_throwarray","_zombie","_zombieMemory","_roll","_canThrow",
"_zMove","_zRun","_target","_targetType","_zthrow","_throwchance","_throwdistance","_objectcar","_specialActionTime"];

_zombie = _this select 0;
_attackarray = _this select 1;
_throwarray = _this select 2;
_jumparray = _this select 3;
_targetType = _this select 4;
_canThrow = _this select 5;

_zombieMemory = _zombie getVariable "FuMS_ZMemory";

_zMove = _zombie getVariable "FuMS_ZMove";
//_zwalk = _zMove select 0; 
_zrun = _zMove select 1;

_target = _zombieMemory select 0;

_zombie forcespeed _zrun;
_zombie setSpeedMode "FULL";
_zombie setBehaviour "CARELESS";


_zthrow = _zombie getVariable "FuMS_ZThrow";
_throwchance = _zthrow select 0;
_throwdistance = _zthrow select 1;
_objectcar = nearestObject [_zombie, "car"];
//diag_log format ["<FuMS> MoveToTarget : nearest car to %1 is %2",_zombie,_objectcar];

// If I am closer to car than I am to the target
// If target is closer to the car than me
// and the car is less than throw distance from target
// and I am close enough to the car to grab it 
// and a random chance passes THEN throw the car!
_specialActionTime = _zombie getVariable "FuMS_ZActionTime";
// ONLY CHECK FOR SPECIAL ACTIONS EVERY 3 SECONDS!
//diag_log ["<FuMS> MoveToTarget: diag_tick:%1 _specTime+3K:%2",diag_ticktime, _specialActionTime+3000];

if (diag_tickTime > _specialActionTime + 3) then
{
    //diag_log format ["<FuMS> MoveToTarget: %1 Performing special attack check",_zombie];
    _zombie setVariable ["FuMS_ZActionTime",diag_tickTime];
    _roll = floor (random 100);
    if ((_objectcar iskindof "car") && 
    (_zombie distance _objectcar < _zombie distance _target) && 
    (_objectcar distance _target < _zombie distance _target) && 
    (_zombie distance _objectcar < 7) &&
    ( _roll < _throwchance) &&
    (_objectcar distance _target < _throwdistance)&&
     _canThrow ) then 
    {
      //  diag_log format ["<FuMS> MoveToTarget: %3:throwchance %1 is throwing %2 roll:%4", _zombie, _objectcar,_throwchance,_roll];
        [_zombie, _target,_attackarray, _throwarray, _objectcar] call FuMS_fnc_HC_AI_Logic_RZnD_ZThrow;
    }
    else
    {
        private ["_zJumpRange","_zJump","_zheight","_theight","_zJumpChance"];
        _zJump = _zombie getVariable "FuMS_ZJump";
        _zJumpRange = _zJump select 0;
        _zJumpChance = _zJump select 1;    
        _zheight = (getPos _zombie) select 2;
        _theight = (getPos _target) select 2;
        // if zombie is greater than jump distance away, or
        //  if the zombie is above/below the target by 1.4m 
        //  and random chance passes.
        //  then jump at target!
        
        _roll = floor (random 100);
        if (
            ( (_zombie distance _target > _zJumpRange) /*OR (abs(_zheight-_theight)> 1.4) */) && 
            (alive _zombie) && 
            (alive _target) && 
            (!surfaceIsWater position _zombie) &&
            (_roll < _zJumpChance)
        ) then 
        {
         //   diag_log format ["<FuMS> MoveToTarget: %3:chance %1 is jumping to %2 roll:%4", _zombie, _target, _zJumpChance,_roll];
            [_zombie, _target, _jumparray] call FuMS_fnc_HC_AI_Logic_RZnD_ZJump;
            
        }else
        {
            private ["_targetASL","_zombieASL","_zJumpstats","_zJumpRange","_zJumpChance"];
            _zJumpstats = _zombie getVariable "FuMS_ZJump";
            _zJumpRange = _zJumpstats select 0;
            _zJumpChance = _zJumpstats select 1;
            _targetASL = (getPosASL _target ) select 2;
            _zombieASL = (getPosASL _zombie) select 2;
            _roll = floor (random 100);           
            if (  _targetType == 3 && 
            (_targetASL - _zombieASL) > 25 &&
            (_targetASL - _zombieASL) < _zJumpRange &&
            _roll < _zJumpChance) then
            {               
                diag_log format ["<FuMS> MoveToTarget: %3:chance %1 is boarding to %2", _zombie, _target, _zJumpChance];
                // If air target is 25' higher than zombie, see if zombie can jump up to the air target!
                [_zombie, _target,_jumparray ] call FuMS_fnc_HC_AI_Logic_RZnD_ZBoard;
            };
        };
    };
}else
{
    _zombie domove getposATL _target;
    sleep .5;
//    _zombie dowatch _target;       
//    diag_log format ["<FuMS> MoveToTarget: Moving toward %1",_target];
//    diag_log format ["<FuMS> MoveToTarget: range:%1",_zombie distance _target];  
};

    
    
    
    
    
    
    


