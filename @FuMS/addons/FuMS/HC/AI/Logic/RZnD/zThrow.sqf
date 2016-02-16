//ZThrow.sqf
// Horbin
// 10/18/15
private ["_zombie","_target","_attackarray","_throwarray","_objectcar","_pos","_dir","_attackrandom",
"_speed","_airpos","_vel","_throwRandom","_objectcar_originalLoc"];
_zombie = _this select 0;
_target = _this select 1;
_attackarray = _this select 2;
_throwarray = _this select 3;
_objectcar = _this select 4;

//[[_zombie, "AwopPercMstpSgthWnonDnon_throw"], "switchmove"] call BIS_fnc_MP;
_zombie playMoveNow "AwopPercMstpSgthWnonDnon_throw";
_zombie setdir ([_zombie, _objectcar] call BIS_fnc_dirTo);

_pos = position _objectcar;
_dir = ((_pos select 0) - (getpos _zombie select 0)) atan2 ((_pos select 1) - (getpos _zombie select 1));


_attackrandom = _attackarray select floor random count _attackarray;
playsound3d [format ["%1",_attackrandom], _zombie];
sleep .3;
_zombie setpos [(_pos select 0) - 4*sin _dir, (_pos select 1) - 4*cos _dir];
if !(alive _zombie) exitwith {};
_speed = 20 + random 25;
_dir = ((getpos _target select 0) - (getpos _objectcar select 0)) atan2 ((getpos _target select 1) - (getpos _objectcar select 1));
//_range = _objectcar distance _target;

_airpos = [5+((getPos _objectcar) select 0), 5+((getPos _objectcar )select 1), 5+((getPos _objectcar) select 2)];
_vel = [abs(_speed * (sin _dir)),abs( _speed * (cos _dir)), abs(1 * _speed)];

_objectcar_originalLoc = position _objectcar;
FuMS_ThrowIt = [_objectcar, _airpos, _vel];
publicVariableServer "FuMS_ThrowIt";

//diag_log format ["<FuMS> ZThrow : _objectcar velocity = %1,%2,%3",_speed * (sin _dir), _speed * (cos _dir), 1 * (_speed)];

_throwrandom = _throwarray select floor random count _throwarray;
playsound3d [format ["%1",_throwrandom], _objectcar];

//_objectcar setfuel 0;
[_objectcar] exec "\ryanzombies\carland.sqf";
sleep .8;

_zombie domove _objectcar_originalLoc;
sleep (0.5 + (_zombie distance _objectcar_originalLoc)/50 min 4);                                                                  
 