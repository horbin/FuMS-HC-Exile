//ActionSpawnMission.sqf
// Horbin
// 2/25/15
private ["_index","_msg"];
FuMS_Admin_SpawnMission = [];
//diag_log format ["##ActionSpawnMission: Attempting to launch mission"];
//if (FuMS_anchorNametxt == "N/A") exitWith {systemChat format["FuMS:Admin:A player must be set as the anchor before a mission can be spawned."];};
if (FuMS_missionTxt == "None") exitWith {systemChat format["FuMS:Admin:A mission has not been selected!"];};
if (FuMS_resourceTxt == "None") exitWith {systemChat format["FuMS:Admin:A spawn resource (server/HC) must be selected!"];};

if (FuMS_anchorNametxt == "N/A") then
{
	FuMS_AnchorLoc = [];
	systemChat format["FuMS:Admin:Mission ,%1 was started using theme designed location.",FuMS_MissionSet];
}
else
{
	FuMS_AnchorLoc = getPos FuMS_Anchor;
	systemChat format["FuMS:Admin:Mission ,%1 was started using Admin set location.",FuMS_MissionSet];
};

	FuMS_Admin_SpawnMission = [FuMS_AnchorLoc, FuMS_MissionSet, FuMS_MissionResource];
//	diag_log format ["##ActionSpawnMission: passing %1 to server",FuMS_Admin_SpawnMission];
	publicVariableServer "FuMS_Admin_SpawnMission";
