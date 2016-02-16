//initHCMenus.sqf
// Horbin
// 3/9/15
//These variables will be crated in missionNamespace, with a numeric tag on it equal to its ThemeControlID.
// each these will have a PVEH to capture changes then broadcast them to the clients with admin privs.
//FuMS_ActiveMissionsList = []; // list of current running missions.
//FuMS_ActiveThemes = []; // list of active themes.
//FuMS_AdminThemeOn = [];  // turns themes on and off, indexed by theme index 
//FuMS_ListofMissions = []; // list of missions available [mission name, theme index, themeName]
private ["_slot","_prefix","_varList"];
diag_log format ["##initHCMenus:  Ran on this system"];
//FuMS_HCThemeControlID   --set by server--

_slot = FuMS_HCThemeControlID;
_prefix = "FuMS_";
_varList = ["AdminActiveMissionList","AdminActiveThemes","AdminThemeOn","AdminActiveThemesHC"];
{
    missionNamespace setVariable [format["%1%2%3",_prefix,_x,_slot],[]];
}foreach _varList;

FuMS_Admin_SpawnMissionHC_Server =
{
     _data = _this select 0;
    _loc = _data select 0;
    _themeIndex = _data select 1;
    _themeName = _data select 2;
    _missionName = _data select 3;
    if (isNil "_loc") then {FuMS_AdminSPAWNLOC = [];}
    else {FuMS_AdminSPAWNLOC = _loc;};
    diag_log format ["##initHCMenus:  %1 %2 %3 at %4",_themeIndex, _themeName, _missionName, FuMS_AdminSPAWNLOC];
    [[_missionName],_themeIndex,[_themeName, -1], true] spawn FuMS_fnc_HC_MsnCtrl_StaticMissionControlLoop;    
    
    // [_activeMission,_themeIndex,_missionTheme, true] spawn FuMS_fnc_HC_MsnCtrl_StaticMissionControlLoop;
};


"FuMS_Admin_SpawnMissionHC" addpublicVariableEventHandler   
{
    [_this select 1] spawn FuMS_Admin_SpawnMissionHC_Server;

};
