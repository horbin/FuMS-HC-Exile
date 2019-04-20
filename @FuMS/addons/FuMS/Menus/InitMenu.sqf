//InitMenu.sqf
// Horbin
// 3/7/15
//Input: player
private ["_player","_id"];
_player = _this select 0;

_id = owner _player;
// Pass for ALL PLAYERS!
//_id publicVariableClient "FuMS_str_HC_Zombies_INF_fnc_nextSound";


if (FuMS_AdminControlsEnabled) then
{
    diag_log format ["##InitMenu: Checking for Admin Access for %1",_player];
	diag_log format ["##InitMenu: Admin Access for %1 | %2",_player,([_player] call FuMS_HasAdminAccess)];
    if ([_player] call FuMS_HasAdminAccess) then
    {
        //  diag_log format ["##InitMenu: %1 found, passing scripts!",_player];
        //	_id = owner _player;
        _adminQuePos = count FuMS_AdminIDs;
        FuMS_AdminIDs pushback _id;
        //    FuMS_AdminNames pushback [_player] FuMS_GetShortName;
        [_player, _adminQuePos] spawn
        {
            _player = _this select 0;
            _index = _this select 1;
            _id = owner _player;
            while {alive _player} do {sleep 5;};
            FuMS_AdminIDs = FuMS_AdminIDs - [FuMS_AdminIDs select _index];
        };
        
        _id publicVariableClient "FuMS_fnc_Menu_StartMenu";
        _id publicVariableClient "FuMS_fnc_Menu_ToggleTheme";
        _id publicVariableClient "FuMS_fnc_Menu_KillMission";
        _id publicVariableClient "FuMS_fnc_Menu_AdminMenu";
        _id publicVariableClient "FuMS_fnc_Menu_SetAnchor";
        _id publicVariableClient "FuMS_fnc_Menu_SetMission";
        _id publicVariableClient "FuMS_fnc_Menu_SetResource";
        
        _id publicVariableClient "FuMS_fnc_Menu_Action_SpawnMission";                                        
        _id publicVariableClient "FuMS_fnc_Menu_Action_SetResource";
        _id publicVariableClient "FuMS_fnc_Menu_Action_SetMission";
        _id publicVariableClient "FuMS_fnc_Menu_Action_KillMission";
        _id publicVariableClient "FuMS_fnc_Menu_Action_ToggleTheme";
        _id publicVariableClient "FuMS_fnc_Menu_Action_SetAnchor";
        _id publicVariableClient "FuMS_str_HC_Util_GetShortName";
        _id publicVariableClient "FuMS_AdminListofMissions"; //This is defined in BuildThemeMissionList.sqf
        //   diag_log format ["##InitMenu: AdminListofMissions: %1",FuMS_AdminListofMissions];
        //[themeIndex, themeName, missionName]
        //   _id publicVariableClient "FuMS_fnc_Menu_Action_SpawnMission";
        
        FuMS_PlayerAuthenticated = [_player] call FuMS_GetUserData;
        
        
    }else{ FuMS_PlayerAuthenticated = "LOCKOUT";};
    // else do nothing else
    owner _player publicVariableClient "FuMS_PlayerAuthenticated";
    // FuMS_fnc_Menu_StartMenu has not been defined so no menu for this player.
};

