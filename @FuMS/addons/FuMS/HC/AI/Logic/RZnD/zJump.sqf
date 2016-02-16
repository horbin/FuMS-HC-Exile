//ZJump.sqf
// Horbin
// 10/18/15
private ["_zombie","_target","_jumparray"];

_zombie = _this select 0;
_target = _this select 1;
_jumparray = _this select 2;

//diag_log format ["<FuMS> MoveToTarget : zheight= %1 theight=%2 delta=%3",_zheight, _theight, abs(_zheight-_theight)];
	      
private ["_basespeed","_extraspeed","_jumprandom","_dir","_zpos","_chkpos","_hangtime"];
_zombie disableAI "MOVE";

_basespeed = 8 + random 2;
_extraspeed = (_zombie distance _target)/8 min 60;

_jumprandom = _jumparray select floor random count _jumparray;
playsound3d [format ["%1",_jumprandom], _zombie];
sleep 0.15;
_zombie setdir ([_zombie, _target] call BIS_fnc_dirTo);
_dir = ((getpos _target select 0) - (getpos _zombie select 0)) atan2 ((getpos _target select 1) - (getpos _zombie select 1));									
_zombie setvelocity [(_basespeed + _extraspeed) * (sin _dir), (_basespeed + _extraspeed) * (cos _dir), 12 + random 6];

sleep 1;

_zombie allowdammage false;

_hangtime = diag_tickTime+4000;
// set to 4 seconds. If after 4 seconds zombie is not on ground and has possibly climbed up on something or is stuck, so allow him to move off.
waituntil
{
    _zpos = getpos _zombie;
    _chkpos = _zpos select 2;
    (_chkpos < 2 or (diag_tickTime > _hangtime))
};
_zombie enableAI "MOVE";
_zombie domove getPos _zombie;
sleep 1;
_zombie allowdamage true;

    