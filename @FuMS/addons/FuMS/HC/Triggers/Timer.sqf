//Timer.sqf
//Horbin
// 6/28/2015
// Inputs: _params
// [_msnTag, _duration, time]
private ["_msnTag","_duration","_time","_params","_result"];
_params = _this select 0;
_msnTag = _params select 0;
_duration = _params select 1;
_time = _params select 2;
_result = false;

if (time > (_time + _duration)) then { _result=true;};
_result
