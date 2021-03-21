private ["_unitGroup","_status"];

_unitGroup = _this select 0;
_status = _this select 1;

_unitGroup setVariable ["NoAggroStatus",_status];

_status
