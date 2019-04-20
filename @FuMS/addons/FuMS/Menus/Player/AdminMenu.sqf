//AdminMenu.sqf
// Horbin
// 2/25/15
diag_log format ["##AdminMenu: Running"];
FuMS_AdminMenuOpen = player;
publicVariableServer "FuMS_AdminMenuOpen";
sleep 1;
//diag_log format ["##AdminMenu: HCIDs:%1   ",FuMS_HCIDs];
//diag_log format ["##AdminMenu: List of Missions ", FuMS_AdminListofMissions];

//Menus
FuMS_ToggleTheme = compile FuMS_fnc_Menu_ToggleTheme;
FuMS_KillMission = compile FuMS_fnc_Menu_KillMission;
FuMS_SetAnchor = compile FuMS_fnc_Menu_SetAnchor;
FuMS_SetMission = compile FuMS_fnc_Menu_SetMission;
FuMS_SetResource = compile FuMS_fnc_Menu_SetResource;
FuMS_SpawnMission = compile FuMS_fnc_Menu_Action_SpawnMission;
FuMS_fnc_HC_Util_GetShortName = compile FuMS_str_HC_Util_GetShortName;

if (isNil "FuMS_HCIDs" or isNil "FuMS_HCNames" ) exitWith
{
    systemChat format ["FuMS Admin data not available. Please wait for the Headless Client to initialize."];
};

systemChat format ["FuMS Admin menu loaded."];
if (true) then
{ 
    private ["_pData","_adminLevel","_options"];
    FuMS_AdminToggleThemeMenu = call FuMS_ToggleTheme;
    FuMS_AdminKillMissionMenu = call FuMS_KillMission;
    FuMS_AdminSetAnchorMenu = call FuMS_SetAnchor;
    FuMS_AdminSetMissionMenu = call FuMS_SetMission;
    FuMS_AdminSetResourceMenu = call FuMS_SetResource;
    //FuMS_AdminSpawnMissionMenu = call FuMS_SpawnMission;
    //	FuMS_AdminMenuOpen = player;
    
    
    
    _pData = FuMS_PlayerAuthenticated;
    _adminLevel = _pData select 2;
    //_adminLevel = 1;
    _options = _pData select 3;
    
    FuMS_AdminToolsMenu =[["FuMS Admin",true]];
    
    if (_adminLevel == 1 or _adminLevel == 2) then
    {		
        FuMS_AdminToolsMenu = FuMS_AdminToolsMenu + [["Toggle Theme", [0],"#USER:FuMS_AdminToggleThemeMenu", -5, [["expression", ""]], "1","1"]];
    };
    if (_adminLevel == 1 ) then
    {
        FuMS_AdminToolsMenu = FuMS_AdminToolsMenu + [["Kill Mission", [0],"#USER:FuMS_AdminKillMissionMenu", -5, [["expression", ""]], "1", "1"]];
    };
    if (_adminLevel == 1) then
    {
        FuMS_AdminToolsMenu = FuMS_AdminToolsMenu + [["Set Anchor", [0], "#USER:FuMS_AdminSetAnchorMenu", -5, [["expression", ""]], "1", "1"]];
    };
    if (_adminLevel == 1) then
    {
        FuMS_AdminToolsMenu = FuMS_AdminToolsMenu + [["Set Mission", [0],"#USER:FuMS_AdminSetMissionMenu", -5, [["expression", ""]], "1", "1"]];
    };
    if (_adminLevel == 1) then
    {
        FuMS_AdminToolsMenu = FuMS_AdminToolsMenu + [["Set Spawner", [0],"#USER:FuMS_AdminSetResourceMenu", -5, [["expression", ""]], "1", "1"]];
    };    
    
    FuMS_AdminToolsMenu pushBack ["===============", [0], "", -2, [["expression", ""]], "1", "0"];
    
    FuMS_anchorNameTxt = [FuMS_Anchor] call FuMS_fnc_HC_Util_GetShortName;
    // _anchorLoc =  format location to be readable FuMS_AnchorLoc
    if (count FuMS_AnchorLoc > 1) then
    {
        private ["_xx","_yy"];
        diag_log format ["##AdminMenu: AnchorLoc = %1",FuMS_AnchorLoc];
        _xx = FuMS_AnchorLoc select 0;
        _yy = FuMS_AnchorLoc select 1;
        _xx = round(_xx/1000);
        _yy = round(_yy/1000);
        FuMS_anchorLoc = format ["   [%1K , %2K]",_xx,_yy];
    } else {FuMS_anchorLocTxt =      "   [---K, ---K]";}; 
    FuMS_AdminToolsMenu pushBack ["Admin Spawn Info", [0], "", -2, [["expression", ""]], "1", "0"];
    FuMS_AdminToolsMenu pushBack [format["%1", FuMS_anchorNameTxt], [0], "", -2, [["expression", ""]], "1", "0"];
    FuMS_AdminToolsMenu pushBack [format["%1",FuMS_anchorLocTxt], [0], "", -2, [["expression", ""]], "1", "0"];
    FuMS_AdminToolsMenu pushBack [format["%1",FuMS_missionTxt], [0], "", -2, [["expression", ""]], "1", "0"];
    FuMS_AdminToolsMenu pushBack [format["%1",FuMS_resourceTxt], [0], "", -2, [["expression", ""]], "1", "0"];
    if (_adminLevel == 1) then
    {
        _command = format ["[] spawn FuMS_SpawnMission"];
        FuMS_AdminToolsMenu pushback ["Spawn Mission!", [12],"", -5, [["expression", _command]], "1", "1"];
    };                    
    FuMS_AdminToolsMenu pushback ["EXIT", [13], "", -3, [["expression", ""]], "1", "1"];	
    showCommandingMenu "#USER:FuMS_AdminToolsMenu";
    
    
    _nearestObjects = nearestObjects [player, ["PlotPole_EPOCH"], 200];
    
    diag_log format ["##AdminMenu: Nearest PlotPole: %1",_nearestObjects];
    
           
    
};



