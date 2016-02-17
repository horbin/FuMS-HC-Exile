//ActionKillMission.sqf
// Horbin
// 2/25/15
private ["_index","_mission","_killMsg","_slot","_var","_varName","_missionList"];
_slot = _this select 0;
_index = _this select 1;
_var = "AdminActiveMissionList";
_varName = format ["FuMS_%1%2",_var,_slot];

//_missionList is a list of [index, "mission:Theme"] 
//diag_log format ["##ActionKillMission: Attempting to kill mission index :%1 on HC#%2 varName:%3",_index,_slot,_varName];
_missionList = missionNamespace getVariable format ["%1",_varName];
_mission = (_missionList select _index ) select 1;
_killMsg = [_index, "KILL"];
_missionList set [_index, _killMsg];
missionNamespace setVariable [format ["%1",_varName], _missionList];
diag_log format ["##ActionKillMission: _slot:%3 _varName:%1  _missionList:%2",_varName,_missionList, _slot];
FuMS_AdminUpdateData = [_slot, _var,_missionList, 0];
publicVariableServer "FuMS_AdminUpdateData";



systemChat format["FuMS:Admin:Mission <%1> is being terminated!",_mission];