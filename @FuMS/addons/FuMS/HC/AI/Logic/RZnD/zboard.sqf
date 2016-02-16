//ZBoard.sqf
// Horbin
// 10/18/15
private ["_zombie","_target","_jumparray"];

_zombie = _this select 0;
_target = _this select 1;
_jumparray = _this select 2;
// 0=man, 1=car, 2=tank, 3=air, 4=ship, 5=staticweapon


private ["_jumprandom","_dir","_basespeed","_extraspeed","_startJump","_caughtIt"];
_basespeed = 8 + random 2;
_extraspeed = (_zombie distance _target)/8 min 60;
_zombie disableAI "MOVE";
_jumprandom = _jumparray select floor random count _jumparray;
playsound3d [format ["%1",_jumprandom], _zombie];
sleep 0.15;
_zombie setdir ([_zombie, _target] call BIS_fnc_dirTo);
_dir = ((getpos _target select 0) - (getpos _zombie select 0)) atan2 ((getpos _target select 1) - (getpos _zombie select 1));									
_zombie setvelocity [(_basespeed + _extraspeed) * (sin _dir), (_basespeed + _extraspeed) * (cos _dir), 12 + random 6];

sleep 1;

_zombie allowdammage false;

_startJump = diag_tickTime;
_caughtIt = false;
waituntil
{
    private ["_zpos","_chkpos"];
    _zpos = getpos _zombie;
    _chkpos = _zpos select 2;
    if (_zombie distance _target < 5) then {_caughtIt = true;};
    (_chkpos < 2 or diag_tickTime > _startJump+2000)
};
if (_caughtIt) then
{
    _zombie attachTo [vehicle _target, [0,0,-1]];
    _zombie allowdamage true;
    [_zombie] spawn
    {
        private ["_zombie"];
        _zombie = _this select 0;
        waituntil
        {
            private ["_zpos","_chkpos"];                  
            _zpos = getPosATL _zombie;
            _chkpos = _zpos select 2;
            (_chkpos < 3 or !alive _zombie)
        };
        detach _zombie;
        _zombie enableAI "MOVE";
        sleep 1;       
    };
}else
{
    _zombie enableAI "MOVE";
    sleep 1;
};            


