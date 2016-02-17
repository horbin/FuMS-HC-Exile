//StaticMissionControlLoop.sqf
// Horbin
// 2/18/15
// Inputs: list of missions, themeindex to spawn them under.
private ["_listOfMissions","_themeIndex","_themeName","_spawnedByAdmin"];

_listOfMissions = _this select 0;
_themeIndex = _this select 1;
//_themeName = _this select 2;
_themeIDPair = _this select 2;
_themeName = _themeIDPair select 0;
_spawnedByAdmin = _this select 3;
if (isNil "_spawnedByAdmin") then {_spawnedByAdmin = false;}
else
{
    diag_log format ["##StaticMissionControlLoop: AdminSpawn: _listOfMissions:%1, Tindex:%2, Tname:%3",_listOfMissions, _themeIndex, _themeName];
    //StaticMissionControlLoop called from HC\Menus\initHCMenus.sqf
};
// allocate and initialize data for each mission.
// create an index for each theme/mission:
// 4194304 probably high limit for index arrays....no problem!
{
    private ["_nextIndex","_themeData","_options","_originalOption"];
 //   diag_log format ["############STATICMission before addition _nextIndex:%1",count FuMS_LOOTDATA];
 //   diag_log format ["############ThemeData: %1", FuMS_THEMEDATA];
 //   diag_log format ["############BaseThemeData: %1", FuMS_BaseTHEMEDATA];
    _nextIndex = count FuMS_LOOTDATA;//using LOOT array because master data stored at end of initialized themes, so next open slot is after it!
    FuMS_THEMEDATA set [_nextIndex, FUMS_THEMEDATA select _themeIndex];
    FuMS_LOOTDATA set [_nextIndex, FUMS_LOOTDATA select _themeIndex];
    FuMS_SOLDIERDATA set [_nextIndex, FUMS_SOLDIERDATA select _themeIndex];
    FuMS_ListofMissions set [ _nextIndex, FuMS_ListofMissions select _themeIndex];
    
 //   FuMS_ActiveThemes set [_nextIndex, [_themeName, FuMS_ThemeControlID]];
    
    if (FuMS_AdminControlsEnabled) then
    {       
        private ["_onOff"];
        //FuMS_AdminThemeSpawnLoc set [_nextIndex, FUMS_AdminThemeSpawnLoc select _themeIndex];
        _onOff = missionNamespace getVariable format["FuMS_AdminThemeOn%1",FuMS_ThemeControlID];
        _onOff set [_nextIndex, _onOff select _themeIndex];     
        missionNamespace setVariable [format["FuMS_AdminThemeOn%1",FuMS_ThemeControlID], _onOff];         
        // distribute data to admins
        FuMS_AdminUpdateData = [FuMS_ThemeControlID, "AdminThemeOn", _onOff];
        publicVariableServer "FuMS_AdminUpdateData";                                  
    };
   // diag_log format ["##StaticMissionControlLoop: AdminControls:%1 number AdminThemeOn:%2 = %3",FuMS_AdminControlsEnabled, count FuMS_AdminThemeOn, FuMS_AdminThemeOn];
    // modify this themes' options to '1'
  //   diag_log format ["############1 STATICMission "];
  //  diag_log format ["############2 ThemeData: %1", FuMS_THEMEDATA];
  //  diag_log format ["############3 BaseThemeData: %1", FuMS_BaseTHEMEDATA];  
  //  diag_log format ["#######4 _nextIndex: %1",_nextIndex];
 //   diag_log format ["#######5 ThemeData at _nextIndex: %1",FuMS_THEMEDATA select _nextIndex];
    
    _themeData = (FuMS_THEMEDATA select _nextIndex);
   // diag_log format ["##6 _themeData:%1",_themeData];
    _options = _themeData select 0;
    _originalOption = _options select 1;
    if (_originalOption == 5) then { _options set [2, (60*60*6)];};//if option 5, set respawn to 6 hours!
    _options set [1,1];
    _themeData set [0, _options];    
    _themeData set [1, [_x]];
   // diag_log format ["##7 after changes _themeData:%1",_themeData];
     FuMS_THEMEDATA set [_nextIndex, _themeData];
  //  diag_log format ["############8 BaseThemeData: %1", FuMS_BaseTHEMEDATA];  
  ///  diag_log format ["#######9 _nextIndex: %1",_nextIndex];
 //   diag_log format ["#######10  ThemeData at _nextIndex: %1",FuMS_THEMEDATA select _nextIndex];    
    // step through process in FuMsnInit for each mission.
    [_themeIDPair, _nextIndex, _spawnedByAdmin] spawn FuMS_fnc_HC_MsnCtrl_ControlLoop;
 //   diag_log format ["****** STATIC ** STATIC ** STATIC ** STATIC ** STATIC  **************"];
  //  diag_log format ["*********************************************************************"];
//    diag_log format ["##11 StaticMissionControlLoop: FuMS control loops starting for %2/%1 at index:%3.", _x,_themeName, _nextIndex];  
//    diag_log format ["############12 "];
//    diag_log format ["############13 ThemeData: %1", FuMS_THEMEDATA];
//    diag_log format ["############14 BaseThemeData: %1", FuMS_BaseTHEMEDATA];
    // diag_log format ["********Static Mission Control Loop Initialized Index:%1 !           *********",_nextIndex];
   // diag_log format ["*********************************************************************"];
    sleep 5;
}foreach _listOfMissions;


