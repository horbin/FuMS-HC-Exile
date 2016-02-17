//ActionSetMission.sqf
// Horbin
// 3/10/15
private ["_ii","_txt","_command","_playerList"];
_data = _this select 0;
_themeIndex = _data select 0;
_themeName = _data select 1;
_missionName = _data select 2;

FuMS_missionTxt = format ["%1:%2",_missionName,_themeName];
FuMS_MissionSet = _data;
systemChat format["FuMS:Admin:Spawn Mission <%1> has been set",FuMS_missionTxt];

