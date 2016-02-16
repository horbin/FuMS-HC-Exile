//SetMission.sqf
// Horbin
// 3/10/15
private ["_setMissionMenu","_ii","_txt","_command","_themeIndex","_themeName","_missionName"];
_setMissionMenu =[["Set Mission",true]];

// List is a common global list. of format [themeIndex, themeName, missionname]
// This list is 'static' based upon data parsed by the server.
// set by server, pushed to admin client by menu init. FuMS_ListofMissions;
for [{_ii=0},{_ii < count FuMS_AdminListofMissions},{_ii=_ii+1}] do
{
    _themeIndex = (FuMS_AdminListofMissions select _ii) select 0;
    _themeName = (FuMS_AdminListofMissions select _ii) select 1;
    _missionName = (FuMS_AdminListofMissions select _ii)select 2;
 //   diag_log format ["##SetMission: Adding [%1, %2, %3]",_themeIndex, _themeName, _missionName];
   _txt = format ["%1:%2",_missionName, _themeName];
   _command = format ["[%1] spawn compile FuMS_fnc_Menu_Action_SetMission",FuMS_AdminListofMissions select _ii];    
    _setMissionMenu pushBack [_txt,             [0],"",-5,[["expression",    _command]],"1","1"];		           
};
_setMissionMenu pushBack ["EXIT", [0], "", -4, [["expression", ""]], "1", "1"];
_setMissionMenu

