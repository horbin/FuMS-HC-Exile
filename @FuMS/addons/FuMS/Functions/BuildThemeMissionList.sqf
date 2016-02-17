//BuildThemeMissionList.sqf
// Horbin
// 3/1/15
// Inputs: themeIndex
//  Array list of ["Mission Name", missionData]
//  missionData is an array of data containing information from the mission file.
// Ref vars: THEMEDATA, 
// Outputs: to FuMS_ListofMissions set [themeIndex, data]
FuMS_ScanMission = compile preprocessFileLineNumbers "\FuMS\Functions\ScanMission.sqf"; 
FuMS_VerifyTheme = compile preprocessFileLineNumbers "\FuMS\HC\Val\VerifyTheme.sqf";

private ["_themeIndex","_themeData","_status","_theme","_missionList","_mission","_i","_formedList","_foundRandom"];
//_testdata = call compile preprocessFileLineNumbers "\FuMS\Themes\Test\TestMission01.sqf"; 
_themeIndex = _this select 0;

// check data check info going to need. Full checking will be done by HC!
if (isNil "_themeIndex") exitWith {diag_log format ["##BuildThemeMissionList: 'nil' theme Index passed. Aborting List creation"];};
if (isNil "FuMS_THEMEDATA") exitWith {diag_log format ["##BuildThemeMissionList: 'nil' THEMEDATA. Aborting List creation"];};
if (TypeName FuMS_THEMEDATA != "ARRAY")exitWith {diag_log format ["##BuildThemeMissionList: Format error in THEMEDATA. Aborting List creation"];};
if (_themeIndex >= count FuMS_THEMEDATA)exitWith {diag_log format ["##BuildThemeMissionList: Index of %1 is greater than # of loaded THemes! Aborting List creation",_themeIndex];};
_themeData = FuMS_THEMEDATA select _themeIndex;
_status = [_themeIndex] call FuMS_VerifyTheme;
if (_status select 0) exitWith{diag_log format ["##BuildThemeMissionList: Error found in Theme with Index %1",_themeIndex];};
_theme = (_themeData select 0 ) select 0;
_missionList = (_themeData select 1);

_formedList = [];
FuMS_SCANNED_LIST = [];
FuMS_Master_LIST = [];
FuMS_Master_CodeStrings = [];
FuMS_Found_RANDOM = false; 
//diag_log format ["##BuildThemeMissionList: _missionList:%1",_missionList];
_foundRandom = false;

{	
	_mission = (_x select 0 );// mission is embedded in an array in the original data.	
	[_theme, _mission] call FuMS_ScanMission;	
}foreach _missionList;
// Now have the list: in FuMS_Master_LIST
//FuMS_ListofMissions = [];
//diag_log format ["##BuildThemeMissionList: List from Theme: %1",_missionList];
diag_log format ["<FuMS> BuildThemeMissionList:%2: List from recursion: %1",FuMS_Master_LIST, _theme];
for [{_i=0},{_i < count FuMS_Master_LIST},{_i=_i+1}] do
{
    // if it is "RANDOM" remove it.
    // and add the 3 basic missions.
    // remove the RANDOM and its code string.
    _mission22 = FuMS_Master_LISt select _i;
    _value = [_themeIndex, _theme, [_mission22]];
    // mission placed into an ARRAY....may need to rework this later to re-include location values
    // as of now, ALL ADMIN spawns, spawn at the LOC set by the ADMIN.
    FuMS_AdminListofMissions pushback _value;
    
    _formedList set [_i, [FuMS_Master_LIST select _i, FuMS_Master_CodeStrings select _i]];
};

FuMS_ListofMissions set [ _themeIndex, _formedList];

//diag_log format ["##BuildThemeMissionList:%2: List of AdminMissions: %1",FuMS_AdminListofMissions, _theme];


