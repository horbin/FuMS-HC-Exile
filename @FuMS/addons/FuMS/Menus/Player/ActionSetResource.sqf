//ActionSetResource.sqf
// Horbin
// 3/10/15
private ["_index"];
_index = _this select 0;

diag_log format ["##ActionSetResource: Attempting to set Resource from :%1 ID:%2",FuMS_resourceTxt, FuMS_MissionResource];
FuMS_MissionResource = FuMS_HCIDs select _index;
FuMS_resourceTxt = FuMS_HCNames select _index;
diag_log format ["##ActionSetResource: Attempting to set Resource to :%1 ID:%2",FuMS_resourceTxt, FuMS_MissionResource];
systemChat format["FuMS:Admin:Spawn Resource set to <%1> .",FuMS_resourceTxt];

