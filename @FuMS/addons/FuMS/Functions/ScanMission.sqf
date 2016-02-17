//ScanMission.sqf
// Horbin 
// 3/1/15
// Inputs: theme and mission
// 
FuMS_VerifyMission_Simple = compile preprocessFileLineNumbers "\FuMS\Functions\VerifyMission_Simple.sqf"; 
//   A Scan!
// theme/filename provided
// add it to SCANNED LIST
// readit, get list of other missions
// if good read, add it to MASTER LIST
// for each 'other mission'
//    if not on SCANNED LIST
//		 Scan it!
private ["_theme","_mission","_fileName","_missionData","_status","_abort"];
_theme = _this select 0;
_mission = _this select 1;
if (isNil "_mission") exitWith {};
if (_mission == "") exitWith {};
_status = [];
FuMS_SCANNED_LIST set[ count FuMS_SCANNED_LIST,_mission];

//diag_log format ["##ScanMission: Scanned List:%1",FuMS_SCANNED_LIST];
if (toupper _mission == "RANDOM") exitWith
{    
   FuMS_Found_RANDOM = true; 
    if (! ("Help_Vehicle" in FuMS_SCANNED_LIST) ) then {[_theme,"Help_Vehicle"] call FuMS_ScanMission;};
    if (! ("Help_Helo" in FuMS_SCANNED_LIST) ) then { [_theme,"Help_Ground"] call FuMS_ScanMission;};
    if (! ("Help_Ground" in FuMS_SCANNED_LIST) ) then { [_theme,"Help_Helo"] call FuMS_ScanMission;};
};
    _fileName = format ["\FuMS\Themes\%1\%2.sqf",_theme, _mission];
    //diag_log format ["##ScanMission: Scanning %1",_fileName];
    _missionData = call compile preprocessFileLineNumbers _fileName;
    if (isNil "_missionData") then
    {
        _abort = true;
        _status set [1, "Unable to find or load file!"];
    }else
    {
        _status = [_missionData] call FuMS_VerifyMission_Simple;
        _abort = _status select 0;
    };
    if (_abort) then
    {
        diag_log format ["** <FuMS> ScanMission.sqf************************************************"];
        diag_log format ["*** FuMS: Inconsistency found in the following file:    ***"];
        diag_log format ["***  %1\%2.sqf",_theme,_mission];
        diag_log format ["*** Reason: %1", _status select 1];
        diag_log format ["*** Mission will not be transferred to Headless client! ***"];
        diag_log format ["*** Failure to correct the error may result in HC Crash ***"];
        diag_log format ["***********************************************************"];
        
    }else
    {
        FuMS_Master_LIST set [ count FuMS_Master_LIST, _mission];
        FuMS_Master_CodeStrings set [count FuMS_Master_CodeStrings, _missionData];
       // diag_log format ["##ScanMission: Master List:%1",FuMS_Master_LIST];
        {
            if (!isNil "_x") then 
            {
                if (! (_x in FuMS_SCANNED_LIST) ) then { [_theme, _x] call FuMS_ScanMission;};
            };
        }foreach (_status select 2);     
    };    

