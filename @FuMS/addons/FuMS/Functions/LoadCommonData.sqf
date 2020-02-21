//LoadCommonData.sqf
// Horbin
// 2/17/2020
// Rewritten into standalone system 2/17/2020
// TheOneWhoKnocks
// Inputs : None
// Loads FuMS core data
FuMS_BuildThemeMissionList = compile preprocessFileLineNumbers "\FuMS\Functions\BuildThemeMissionList.sqf"; 

private ["_themeNumber","_hold","_abort"];

FuMS_Version = "vExile0.50";
publicVariable "FuMS_Version";
FuMS_HCIDs = [];
FuMS_HCNames = [];
FuMS_HCIDs set [0,0]; // set the 1st slot to be the actual server's ID.
FuMS_HCNames set [0, "SERVER"];
FuMS_AdminListofMissions = []; //Full list of all missions on the server. [themeIndex, themeName, missionName] format.
FuMS_isStable = true; // set to false in LoadCommonData if critical errors are found.

FuMS_THEMEDATA = []; // Array containing data from \'themename'\ThemeData.sqf
FuMS_LOOTDATA = [];  // Array containing data from \'themename'\LootData.sqf
FuMS_SOLDIERDATA = []; // Array containing data from \'themename'\SoldierData.sqf    
FuMS_ListofMissions = []; // Array of ["Name", "string of preprocessed code"];
// 4 arrays above used by Server for running FuMS server side!
FuMS_BaseTHEMEDATA = [];
FuMS_BaseLOOTDATA = [];
FuMS_BaseSOLDIERDATA = [];
FuMS_BaseListofMissions = [];
FuMS_CustomScripts = [];
// 4 arrays above used as data source for info passed to connecting headlesss clients
// ASSERT above 4 arrays will be static based upon data read in from files!

FuMS_ActiveThemesHC = []; // scalar value of what HC the theme should run on...
FuMS_ActiveThemes = []; // array list of ["theme", configoption] pairs
FuMS_ActiveMissions = []; // [index, "mission:Theme"] combo. to track running missions.


diag_log format ["<FuMS:%1> LoadCommonData: Preparing FuMS common data.",FuMS_Version];
//BaseServer Init
_hold = [] execVM "\FuMS\Themes\BaseServer.sqf";
if (isNil "_hold") exitWith { diag_log format ["<FuMS:%1> LoadCommonData: ERROR in BaseServer.sqf format.",FuMS_Version]; FuMS_isStable=false;};
waitUntil { ScriptDone _hold};
diag_log format ["<FuMS:%1> LoadCommonData: BaseServer data initialized.",FuMS_Version];
_hold = [] execVM "\FuMS\Themes\BaseLoot.sqf";
if (isNil "_hold") exitWith { diag_log format ["<FuMS:%1> LoadCommonData: ERROR in BaseLoot.sqf",FuMS_Version];FuMS_isStable=false;};
waitUntil { ScriptDone _hold};

// Player Watch Code
_hold = [] execVM "\FuMS\Themes\PlayerWatch\PlayerWatchConfig.sqf";
if (isNil "_hold") exitWith { diag_log format ["<FuMS:%1> LoadCommonData: ERROR in \FuMS\Themes\PlayerWatch\PlayerWatchConfig.sqf",FuMS_Version];FuMS_isStable=false;};
waitUntil { ScriptDone _hold};
publicVariable "FuMS_PlayerWatch_CheckTime";
publicVariable "FuMS_PlayerWatch_CheckChance";
publicVariable "FuMS_PlayerWatch_NotifyPlayer";




//diag_log format ["<FuMS:%1> LoadCommonData: BaseLoot data initialized.",FuMS_Version];

_themeListData = FuMS_ServerData select 3;
{
    FuMS_ActiveThemes pushback (_x select 0);// array of theme names. Used to locate the theme's mission folder.
    FuMS_ActiveThemesHC pushback (_x select 1);       
}foreach _themeListData;
//diag_log format ["<FuMS:%2> LoadCommonData: ActiveThemes: %1",FuMS_ActiveThemes,FuMS_Version];
//diag_log format ["<FuMS:%2> LoadCommonData: ActiveThemesHC: %1",FuMS_ActiveThemesHC,FuMS_Version];

FuMS_AIONLYVehicles = (FuMS_ServerData select 6) select 4;

// load the theme options, loot, and soldier configuration data for each Theme found in BaseServer.sqf
_themeNumber = 0;
_abort = false;
{
    _hold = [_themeNumber] execVM format ["\FuMS\Themes\%1\ThemeData.sqf",_x];
    if (isNil "_hold") then { diag_log format ["<FuMS:%2> LoadCommonData: ERROR in %1\ThemeData.sqf format in theme #%1",_x,FuMS_Version];}
    else
    {
        waitUntil { scriptDone _hold}; 
        //diag_log format ["##FuMsnInit: ThemeData: %1 : %2",_x,FuMS_THEMEDATA select _themeNumber];
        if (!(((FuMS_THEMEDATA select _themeNumber) select 0) select 3) ) then //if theme using its own LootData
        {
            _hold = [_themeNumber] execVM format ["\FuMS\Themes\%1\LootData.sqf", _x];				
            if (isNil "_hold") exitWith
            { 
                diag_log format ["************************************************************************"];
                diag_log format ["<FuMS:%2> LoadCommonData: %1/ThemeData GlobalLootData 'true' and error in %1/LootData.sqf",_x,FuMS_Version];
                diag_log format ["<FuMS> LoadCommonData: Theme offline!"];
                diag_log format ["************************************************************************"];
                _abort = true;
                FuMS_isStable=false;
            };
            waitUntil { scriptDone _hold};
           // diag_log format ["##FuMsnInit: LootData: %1 : %2",_x,FuMS_LOOTDATA select _themeNumber];
        };
        if (!(((FuMS_THEMEDATA select _themeNumber) select 0) select 4 )) then // if theme using its own soldierData
        {
            _hold = [_themeNumber] execVM format ["\FuMS\Themes\%1\SoldierData.sqf", _x];				
            if (isNil "_hold") exitwith
            { 
                diag_log format ["************************************************************************"];
                diag_log format ["<FuMS:%2> LoadCommonData: %1/ThemeData GlobalSoldierData 'true' and error in %1/SoldierData.sqf",_x,FuMS_Version];
                diag_log format ["<FuMS> LoadCommonData: Theme offline!"];
                diag_log format ["************************************************************************"];
                _abort = true;
                FuMS_isStable=false;
            };
            waitUntil { scriptDone _hold};
         //   diag_log format ["##FuMsnInit: SoldierData: %1 : %2",_x,FuMS_SOLDIERDATA select _themeNumber];
        };
        
        [_themeNumber] call FuMS_BuildThemeMissionList; 
        FuMS_BaseListofMissions = +FuMS_ListofMissions;
       // {
        //    diag_log format ["<FuMS:%3> LoadCommonData: %1:%2",_themeNumber,_x,FuMS_Version];
       // }foreach (FuMS_ListofMissions select _themeNumber);
        
        // Check theme for a list of custom scripts.
        _customScripts = (FuMS_THEMEDATA select _themeNumber) select 4;
        if (!isNil "_customScripts") then
        {
            private ["_curTheme"];
            _curTheme = _x;
            {
                if (! (_x in FuMS_CustomScripts)) then
                {
                    private ["_path"];
                    FuMS_CustomScripts = FuMS_CustomScripts + [_x];
                    _path = format ["\FuMS\Themes\%1\Scripts\%2.sqf", _curTheme, _x];
                    missionNamespace setVariable [_x, preprocessFileLineNumbers format["%1",_path]];      
                    diag_log format ["<FuMS> LoadCommonData: Preprocessing custom script %1 for theme %2",_x,_curTheme];
                };
            }foreach _customScripts;
        };
        // create global variable for the script's code
        // add the GV to FuMS_CustomScripts
        // preprocess the script and assign it to the globalvariable
        
       // diag_log format ["##FuMsnInit: Theme %1 data parse complete.",_x];
       // diag_log format ["-----------------------------------------------------------"];
    };
    _themeNumber = _themeNumber + 1;
}foreach FuMS_ActiveThemes;
if (_abort) exitWith { diag_log format ["<FuMS:%1> LoadCommonData: Critical Error: Exiting!",FuMS_Version];FuMS_isStable=false;};
FuMS_BaseTHEMEDATA = +FuMS_THEMEDATA;

//diag_log format ["<FuMS:%2> LoadCommonData: THEMEDATA: %1", FuMS_BaseTHEMEDATA,FuMS_Version];

if (_themeNumber == 0 ) exitWith { diag_log format ["FuMsnInit:  ERROR: NO Themes Found! Exiting!"];FuMS_isStable=false;};

_hold = [_themeNumber] execVM format ["\FuMS\Themes\GlobalLootData.sqf"];
if (isNil "_hold") exitWith { diag_log format ["<FuMS:%1> LoadCommonData: ERROR in GlobalLootData.sqf: Exiting!",FuMS_Version];FuMS_isStable=false;};
waitUntil { scriptDone _hold};
FuMS_BaseLOOTDATA = +FuMS_LOOTDATA;
//diag_log format ["##FuMsnInit: #setpos:%2 GlobalLootData: %1 ",FuMS_LOOTDATA select _themeNumber, _themeNumber];

_hold = [_themeNumber] execVM format ["\FuMS\Themes\GlobalSoldierData.sqf"];
if (isNil "_hold") exitWith { diag_log format ["<FuMS:%1> LoadCommonData: ERROR in GlobalSoldierData.sqf: Exiting!",FuMS_Version];FuMS_isStable=false;};
waitUntil { scriptDone _hold};
FuMS_BaseSOLDIERDATA = +FuMS_SOLDIERDATA;
//diag_log format ["##FuMsnInit: #setpos:%2 GlobalSoldierData: %1",FuMS_SOLDIERDATA select _themeNumber, _themeNumber];

FuMS_GlobalDataIndex = _themeNumber;	
FuMS_AdminControlsEnabled = (FuMS_ServerData select 0) select 2;

publicVariable "FuMS_AdminControlsEnabled";

FuMS_FPSMinimum = (FuMS_ServerData select 0 ) select 3;
FuMS_ServerFuMSEnable = (FuMS_ServerData select 0) select 0;
FuMS_FPSVariance = .3; // max 30% fps drop acceptable
FuMS_GlobalLootOptions = (FuMS_ServerData select 6);
FuMS_VehicleZeroAmmo = (FuMS_ServerData select 6) select 5;
FuMS_UnMannedVehicles = (FuMS_ServerData select 5) select 5;

_hold = []execVM "\FuMS\Themes\AdminData.sqf";
waitUntil {ScriptDone _hold};
//diag_log format ["##FuMsnInit: AdminData:%1", FuMS_Users];
//publicVariable "FuMS_Users";
//publicVariable "FuMS_ActiveMissions";

diag_log format ["<FuMS:%1> LoadCommonData Complete ##",FuMS_Version];





