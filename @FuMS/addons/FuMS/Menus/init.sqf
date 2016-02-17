//Init.sqf
// Horbin
// 2/26/15
// For FuMS Admin Controls menu system
//waitUntil {!isNil "FuMS_AdminControlsEnabled"};
if (!isServer) exitWith {};
if (!FuMS_AdminControlsEnabled) exitWith{}; //Admin Controls are off, so exit.

FuMS_HasAdminAccess = compile preprocessFileLineNumbers "\FuMS\Menus\HasAdminAccess.sqf";
FuMS_InitMenu = compile preprocessFileLineNumbers "\FuMS\Menus\InitMenu.sqf";
FuMS_GetUserData = compile preprocessFileLineNumbers "\FuMS\Menus\GetUserData.sqf";


//Player functions:
FuMS_fnc_Menu_AdminMenu = preprocessFileLineNumbers "\FuMS\Menus\Player\AdminMenu.sqf"; // constructs menu
FuMS_fnc_Menu_StartMenu = preprocessFileLineNumbers "\FuMS\Menus\Player\StartMenu.sqf";  // adds action menu
FuMS_fnc_Menu_ToggleTheme = preprocessFileLineNumbers "\FuMS\Menus\Player\ToggleTheme.sqf";
FuMS_fnc_Menu_KillMission = preprocessFileLineNumbers "\FuMS\Menus\Player\KillMission.sqf";
FuMS_fnc_Menu_SetAnchor = preprocessFileLineNumbers "\FuMS\Menus\Player\SetAnchor.sqf";
//FuMS_fnc_Menu_SpawnMission = preprocessFileLineNumbers "\FuMS\Menus\Player\SpawnMission.sqf";
FuMS_fnc_Menu_SetMission = preprocessFileLineNumbers "\FuMS\Menus\Player\SetMission.sqf";    
FuMS_fnc_Menu_SetResource = preprocessFileLineNumbers "\FuMS\Menus\Player\SetResource.sqf";     
// Player Actions:
FuMS_fnc_Menu_Action_SetResource = preprocessFileLineNumbers "\FuMS\Menus\Player\ActionSetResource.sqf";    
FuMS_fnc_Menu_Action_SetMission  =preprocessFileLineNumbers "\FuMS\Menus\Player\ActionSetMission.sqf";
FuMS_fnc_Menu_Action_KillMission =preprocessFileLineNumbers "\FuMS\Menus\Player\ActionKillMission.sqf";
FuMS_fnc_Menu_Action_ToggleTheme =preprocessFileLineNumbers "\FuMS\Menus\Player\ActionToggleTheme.sqf";
FuMS_fnc_Menu_Action_SetAnchor =preprocessFileLineNumbers "\FuMS\Menus\Player\ActionSetAnchor.sqf";
FuMS_fnc_Menu_Action_SpawnMission = preprocessFileLineNumbers "\FuMS\Menus\Player\ActionSpawnMission.sqf";

//These variables will be crated in missionNamespace, with a numeric tag on it equal to its ThemeControlID.
// each these will have a PVEH to capture changes then broadcast them to the clients with admin privs.
// '0' control index established here for server AI support.
private ["_prefix","_varList"];

// Init Admin variables for 'SERVER', HC's created in intHCMenus.sqf
_prefix = "FuMS_";
_varList = ["AdminActiveMissionList","AdminActiveThemes","AdminThemeOn","AdminActiveThemesHC"];
{
    missionNamespace setVariable [format["%1%20",_prefix,_x,0],[]];
}foreach _varList;

FuMS_AdminIDs = [];

FuMS_AdminMenuOpen_Server =
{
    private ["_owner","_id","_varList","_slot"];
       _owner = _this select 0;
    _id = owner _owner;
    _varList = ["AdminActiveMissionList","AdminActiveThemes","AdminThemeOn","AdminActiveThemesHC"];
    //spawnloc and ListofMissions removed. Not required in loop code.
    _id publicVariableClient "FuMS_HCIDs";
    _id publicVariableClient "FuMS_HCNames";
    _id publicVariableClient "FuMS_AdminListofMissions";
    
    for [{_slot = 0},{_slot < count FuMS_HCIDs},{_slot=_slot +1}] do
    {
        {
          //  diag_log format ["##Menus:init.sqf  Admin:%1 pushing:FuMS_%2%3",_owner,_x,_slot];
          //  diag_log format ["##Menus:init.sqf          Data = %1", missionNamespace getVariable format["FuMS_%1%2",_x,_slot]];
            _id publicVariableClient format ["FuMS_%1%2",_x, _slot];
        }foreach _varList;        
    };
};


"FuMS_AdminMenuOpen" addPublicVariableEventHandler
{
    [_this select 1] spawn FuMS_AdminMenuOpen_Server;
};

"FuMS_AdminUpdateData" addPublicVariableEventHandler
{
    _var = _this select 1;
    _slot = _var select 0;
    _string = _var select 1;
    _data = _var select 2;
    _toHC = false;
    if (count _var == 4) then {_toHC = true;};
    
    diag_log format ["##FuMS:Menus:init.sqf  AdminUpdateData:%1",_var];
    
    missionNamespace setVariable [format["FuMS_%1%2",_string,_slot],_data];
    if (_toHC) then
    {
        if (_slot != 0) then // value already set here on server, so only need to do something if going back to an HC.
        {
              diag_log format ["##Menus:init.sqf AdminUpdateData: To HC:%2 FuMS_%1%2   with :%3",_string,_slot,_data]; 
            (FuMS_HCIDs select _slot) publicVariableClient format ["FuMS_%1%2",_string,_slot];
        };
    }else
    {
     //   diag_log format ["##Menus:init.sqf AdminUpdateData: fromHC:%2 FuMS_%1%2   with :%3",_string,_slot,_data];
        {
            _x publicVariableClient format["FuMS_%1%2",_string,_slot];
        }foreach FuMS_AdminIDs;
    };
};



"FuMS_GetPlayerIndex" addPublicVariableEventHandler
{
    _player = _this select 1;
  //  diag_log format ["##Menu Init.sqf: found request from Player:%1", _player];
  
    
 //   diag_log format ["##Menu Init.sqf: Attempting to call 'FuMS_InitMenu' "];
    [_player] spawn FuMS_InitMenu;
};

"FuMS_Admin_SpawnMission" addpublicVariableEventHandler
{
    // called by a player client.....
    FuMS_Admin_SpawnMissionHC=[];
    _data = _this select 1; //[Location, [ themeIndex, themeName, missionName  ], resource]
    _loc = _data select 0;
    _data2 = _data select 1;
    _themeIndex = _data2 select 0;
    _themeName = _data2 select 1;
    _missionName = _data2 select 2;
    _resource = _data select 2;

    if (_resource==0) then
    {
        // spawn it directly here! since request came in from a player client!
        [[_loc, _themeIndex, _themeName, _missionName]] spawn FuMS_Admin_SpawnMissionHC_Server;
    }
    else
    {    
        FuMS_Admin_SpawnMissionHC = [_loc, _themeIndex, _themeName, _missionName];
        _resource publicVariableClient "FuMS_Admin_SpawnMissionHC";
    };
    //FuMS_AdminThemeSpawnLoc = _data select 3;
    //[_missionName, _themeIndex, _themeName] call FuMS_fnc_HC_MsnCtrl_StaticMissionControlLoop;
 //   diag_log format ["##FuMsnInit: PVEH: Admin Spawn to HC:%1 with Data : %2",_resource, FuMS_Admin_SpawnMissionHC];
    // get hc.
    // _hc = FuMS_ListofHCs select 0;
    //  _hc publicVariableClient "FuMS_AdminSpawnMission";
};

       
       
       