//ZuppaCapture.sqf
// Horbin

private ["_params","_msnTag","_trigName","_root","_condition","_result"];
_params = _this select 0;
_msnTag = _params select 0;
_trigName = _params select 1;
_root = format ["%1_%2",_msnTag, _trigName];

_result = false;

//diag_log format ["<FuMS> ZuppaCapture: %1_ZuppaCapture", _root];    
_condition = missionNameSpace getVariable (format ["%1_ZuppaCapture",_root]);
if (!isNil "_condition") then
{
   // diag_log format ["<FuMS> ZuppaCapture: %1_ZuppaCapture is %2", _root, _condition];    
    if (_condition) then
    {
        missionNameSpace setVariable [format ["%1TGR_%2",_msnTag,_trigName],true];
        _result=true;
    };
};
_result
