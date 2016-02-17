//ActionToggleTheme.sqf
// Horbin
// 2/25/15
private ["_index","_slot","_msg","_themeName"];
_slot = _this select 0;
_index = _this select 1;
_themeName = _this select 2;
_var = "AdminThemeOn";
_varName = format ["FuMS_%1%2",_var,_slot];
_msg = "";

if (_slot == -1) then {_slot = FuMS_MissionResource;};
//diag_log format ["##ActionToggleTheme: Attempting to toggle '%3' theme index :%1 on %2",_index, FuMS_HCNames select _slot,_varName];
_curValue = missionNamespace getVariable format ["%1",_varName];
if (_curValue select  _index) then
{
    //FuMS_AdminThemeOn set [_index, false];
    _curValue set [_index, false];
    _msg="OFF";
}
else
{
    //FuMS_AdminThemeOn set [_index, true];_msg="ON";
    _curValue set [_index, true];
    _msg="ON";
};

missionNamespace setVariable [format ["%1",_varName], _curValue];
FuMS_AdminUpdateData = [_slot, _var,_curValue, 0];
publicVariableServer "FuMS_AdminUpdateData";

systemChat format["FuMS:Admin:Theme <%1> was turned %2",_themeName, _msg];


// this somehow needs to be specific like the global vars.....
// then admin talks to server, and server will know how to update.

