//SpawnTrigger.sqf
// Horbin
// 6/28/2015
// Inputs: [_params array], _msnTag, "<TriggerType>", _trigName

private ["_params","_msnTag","_trigType","_trigName"];
_params = _this select 0; // [ _radius, _range, [_list], etc] 
_msnTag = _this select 1; // FuMS_0_0_0
_trigType = _this select 2;  // ProxPlayer, LowUnitCount, etc
_trigName = _this select 3; // Trig1, Trig2, etc

[_params, _msnTag, _trigType, _trigName] spawn
{
    private ["_stop","_TriggerFunction","_trigType","_params","_msnTag","_trigName"];
    _params = _this select 0;
    _msnTag = _this select 1;               
    _trigType = _this select 2;
    _trigName = _this select 3;
    
    _stop = false;
    _TriggerFunction = missionNameSpace getVariable (format ["FuMS_fnc_HC_Triggers_%1",_trigType]);
  //  diag_log format ["<FuMS> SpawnTrigger: FuMS_fnc_HC_Triggers_%1",_trigType];
    while {!_stop} do
    {
        private ["_trigState"];
        _stop = missionNameSpace getVariable  (format ["%1_closetriggers",_msnTag]);
        _trigState = [_params] call _TriggerFunction;
        if (_trigState) then { missionNameSpace setVariable [format ["%1TGR_%2",_msnTag,_trigName], true];};
        uisleep 5;
    };
};

//diag_log format ["<FuMS> SpawnTrigger: %1 %2 with params %3 started.",_trigName, _trigType, _params];