//ControlLoop_Basic.sqf
// Horbin
// 12/31/14
// Inputs: From FuMsnInit: This loop sets up overall THEME information, then maintains constant stream of missions for that theme.
// Event/Mission Control loop:
// This code provides core mission functionality for a group of missions
//PullData = compile preprocessFileLineNumbers "HC\Encounters\Functions\PullData.sqf";
//StaticMissionControlLoop = compile preprocessFileLineNumbers "HC\Encounters\LogicBomb\StaticMissionControlLoop.sqf";
//FuMS_C1_PullData = compile FuMS_S_PullData;
private ["_missionTheme","_respawnDelay","_encounterLocations","_missionList","_spawnedByAdmin",
"_pos","_activeMission","_missionSelection","_trackList","_missionTheme","_themeIndex","_themeOptions","_themeData",
"_locationAdditions","_missionNameOverride","_activeThemeIndex", "_controlledByThisHC","_themeMinPlayers","_themeMaxPlayers",
"_themeName"];

_missionTheme = _this select 0; // ["<themeName>, #id ]  ex: ["Test",-1]
_themeIndex = _this select 1;
_spawnedByAdmin = _this select 2;
if (isNil "_spawnedByAdmin") then {_spawnedbyAdmin=false;};
_themeData = FuMS_THEMEDATA select _themeIndex;
_themeOptions = _themeData select 0;
_missionList = _themeData select 1;
_encounterLocations = _themeData select 2;

_themeName = _themeOptions select 0;
_missionSelection = _themeOptions select 1;
_respawnDelay = _themeOptions select 2;
_themeMinPlayers = _themeOptions select 6;
_themeMaxPlayers = _themeOptions select 7;
_debug = false;

if (_debug) then
{
	diag_log format ["##ControlLoop: %1 Missions Initializing##", _missionTheme];
};
// Look for keyword locations. If found, add them to the provided list of _encounterLocations
//diag_log format ["##ControlLoop: _missionTheme:%1  ActiveThemes:%2",_missionTheme, FuMS_ActiveThemes];

//_activeThemeIndex = FuMS_ActiveThemes find _missionTheme; // returns a ["theme", index] pair
//{
//    if (_x select 0 == _missionTheme) exitWith {_controlledByThisHC = _x select 1;};
//}foreach FuMS_ActiveThemes;
//diag_log format ["##ControlLoop: _activeThemeIndex =====%1",_activeThemeIndex];
//_controlledByThisHC =  (FuMS_ActiveThemes select _activeThemeIndex) select 1;
_controlledByThisHC = _missionTheme select 1;
if (  !(_controlledByThisHC == -1 or _controlledByThisHC == FuMS_ThemeControlID)  ) exitWith
{
    // this theme not under control of the HC...so exit...
    diag_log format ["##ControlLoop: %1 not started. It is under HC#%2 control. Check BaseServer.sqf to reconfigure!",_missionTheme, _controlledByThisHC];    
};
_locationAdditions = [];
{
    //Locations: [STRING] or [[array], STRING] or [array]
    //diag_log format ["##Control Loop : Examining Location : %1",_x];
    if (TypeName (_x select 0) == "STRING") then
    {
        private ["_name","_loc","_curLoc","_curLoc","_value"];
        _value = _x;
        _curLoc = _x select 0;
        if (_curLoc == "Villages") then
        {
            {
                _name = (text _x);
                _loc = locationPosition _x;         
                _locationAdditions = _locationAdditions + [[_loc, _name]];
            } foreach FuMS_VillageList;
            _encounterLocations = _encounterLocations - [_x];
        };
        if (_curLoc == "Cities") then
        {
            {
                _name = (text _x);
                _loc = locationPosition _x;         
                _locationAdditions = _locationAdditions + [[_loc, _name]];
            } foreach FuMS_CityList;
            _encounterLocations = _encounterLocations - [_x];
        };
        if (_curLoc == "Capitals") then
        {
            {
                _name = (text _x);
                _loc = locationPosition _x;         
                _locationAdditions = _locationAdditions + [[_loc, _name]];
            } foreach FuMS_CapitalList;
            _encounterLocations = _encounterLocations - [_x];
        };
        if (_curLoc == "Marine") then
        {
          {
                _name = (text _x);
                _loc = locationPosition _x;         
                _locationAdditions = _locationAdditions + [[_loc, _name]];
            } foreach FuMS_MarineList;
            _encounterLocations = _encounterLocations - [_x];   
        };
        // add individual city names if present!
        {
            _name = (text _x);
            if (_curLoc == _name) then
            {
                _loc = locationPosition _x;
                _locationAdditions = _locationAdditions + [[_loc, _name]];
                _encounterLocations = _encounterLocations - [_value];
            };
        }foreach FuMS_DefinedMapLocations;     
    };
}foreach _encounterLocations;
//_encounterLocations FORMAT: [[loc], Name]], or [array]
																		
_encounterLocations = _encounterLocations + _locationAdditions;
_trackList = _missionList;

if (_debug) then
{
	diag_log format ["## Control Loop : Loc Additions: %1", _locationAdditions];
	diag_log format ["## Control Loop: Encounter Locations: %1",_encounterLocations];
	diag_log format ["## Control Loop:Them Index:%3 Full Location List: %2:%1", _encounterLocations, count _encounterLocations, _themeIndex];
};
//Initialize Radio Chatter and other THEME related global variables!
private ["_data","_options","_abort"];
_data = (FuMS_THEMEDATA select _themeIndex)select 3;
//Theme Data elements : 0= config options, 1=AI messages, 2=base messages
//diag_log format ["##BaseOps: Themedata select 3: _data:%1",_data];
_options = _data select 0;
//FuMS_radioChannel set [ _themeIndex, _options select 0];
//FuMS_silentCheckIn set [ _themeIndex, _options select 1];
//FuMS_aiDeathMsg set [ _themeIndex,_options select 2];
//FuMS_radioRange set [ _themeIndex,_options select 3];
//FuMS_aiCallsign  set [ _themeIndex,_options select 4];
//FuMS_baseCallsign set [ _themeIndex, _options select 5];

//FuMS_aiMsgs  set [ _themeIndex,_data select 1];
//FuMS_baseMsgs set [ _themeIndex, _data select 2]; // list of all bases messagess (array of arrays)
//FuMS_AI_XMT_MsgQue set [ _themeIndex, ["From","MsgType"] ]; // just using radiochannel array to get the 'count'
//FuMS_AI_RCV_MsgQue set [ _themeIndex, ["To", "MsgType"]  ];

//FuMS_radioChatInitialized set [_themeIndex, true];

//FuMS_GroupCount set [ _themeIndex, 0 ]; // set this themes group count to zero.
FuMS_BodyCount set [_themeIndex, 0];
FuMS_Trigger_ZupaCapture set [_themeIndex,false];
_id = format ["%1%2",_themeName, _themeIndex];

_abort=false;
while {true} do
{
    private ["_msnDoneList","_properNumPlayers"];
    _msnDoneList = [];   
    
    // ASSERT if number players on line is not betweenn min/max, wait for this to occur before launching another mission!
    _properNumPlayers = false;
    while {true} do
    {
        private ["_numPlayers"];       
        _numPlayers = count ([] call BIS_fnc_listPlayers);
        if (_numPlayers >= _themeMinPlayers and _numPlayers < _themeMaxPlayers) exitWith
        {           
			if (_debug) then
			{
				diag_log format ["<FuMS> ControlLoop: Theme:%1(index:%5) #Players:%2 met launch requirements [%3:%4]. Starting a mission!", _themeName, _numPlayers, _themeMinPlayers,_themeMaxPlayers,_themeIndex];
			};
		};
         uisleep 60;
    };

    if (FuMS_AdminControlsEnabled) then
    {        
        private ["_onOff"];
		if (!_spawnedByAdmin) then  // ignore togglestate if this was spawned by an Admin
		{
			waitUntil
			{
				_onOff = missionNameSpace getVariable format["FuMS_AdminThemeOn%1",FuMS_ThemeControlID];
				//diag_log format ["<FuMS> ControlLoop:  _themeIndex:%1  _onOff : %2",_id, _onOff];
				sleep 2; 
				(_onOff select _themeIndex)
			};
		};
    };

	// all other checks passed, now check SERVER FPS, if good and another mission not starting, start this mission!
	
	//set up process on server to pass server FPS to HC every second.
	//_serverFPS = FuMS_ServerFPS;
	_hold = false;
	while {!(FuMS_ServerFPS > FuMS_FPSMinimum and !FuMS_Mission_is_Starting)} do
	{
		_hold = true;
		uisleep 30;
		if (FuMS_ServerFPS < FuMS_FPSMinimum) then
		{
			if (_debug) then
			{
				diag_log format ["<FuMS>: ControlLoop:Theme:%3 waiting on server FPS of %1 to become greater than :%2", FuMS_ServerFPS, FuMS_FPSMinimum,_themeIndex];
			};
		}
		else
		{
			if (_debug) then
			{
				diag_log format ["<FuMS>: ControlLoop:Theme:%1 Another mission launch in progress: is_Starting=%2",_themeIndex,FuMS_Mission_is_starting];
			};
		};
	};
	FuMS_Mission_is_Starting = true;
	if (_hold) then {diag_log format ["<FuMS>: ControlLoop: Theme:%1: My turn! Launching mission",_themeIndex];};
	
	
    // SELECT A MISSION.
  
	if (_debug) then
	{
		diag_log format ["<FuMS> ControlLoop: %3 OrderOption:%2 _missionList:%1",_missionList, _missionSelection, _id];
		diag_log format ["<FuMS> OrderOption:%2 _missionList:%1",_missionList, _missionSelection];

	};
	//  perform call of the mission chosen
    switch (_missionSelection) do
    {
        case 1: // select a random mission from the list
        {
            _activeMission = [_trackList call BIS_fnc_selectRandom];
        };
        case 2: // run missions in order, per the list.
        {
            _activeMission = [_trackList select 0];
            //diag_log format ["##ControlLoop Premath list:%1",_trackList];
            if(TypeName _activeMission == "STRING") then
            {
                _trackList = _trackList -[_activeMission];   
            } else
            {
                _trackList = _trackList -_activeMission;
            };
            //diag_log format ["##ControlLoop Postmath list:%1",_trackList];
            if (count _trackList == 0) then { _trackList = _missionList;};
        };
        case 3: // remove mission from list once it is started
        {
            _activeMission = [_trackList call BIS_fnc_selectRandom];
              if(TypeName _activeMission == "STRING") then
            {
                _trackList = _trackList -[_activeMission];   
            } else
            {
                _trackList = _trackList -_activeMission;
            };
            if (count _trackList == 0) then { _trackList = _missionList;};   
        };
        case 4: // spawn all the missions in the missionList
        {
            //this flow controlled by below, spawn ALL missions on the Theme's list!                     
        };
    };    
    
    if (_missionSelection == 4 or _missionSelection ==5) then
    {
        _activeMission = _trackList;
		if (_debug) then
		{
			diag_log format ["##ControlLoop: Calling StaticMissionControlLoop with mission List:%1",_activeMission];
        };
		[_activeMission,_themeIndex,_missionTheme] call FuMS_fnc_HC_MsnCtrl_StaticMissionControlLoop;
        FuMS_Mission_is_Starting = false;
        // loop has done its work and launched all the missions, so shut it down if Admin Controls are OFF
        if (!FuMS_AdminControlsEnabled) exitWith{diag_log format ["##controlLoop: Admin Controls OFF"];_abort=true};
        
        // Admin Controls are enabled so turn this Theme to 'off'
        private ["_onOff"];
        //FuMS_AdminThemeOn set[ _themeIndex,false];
        _onOff = missionNameSpace getVariable format["FuMS_AdminThemeOn%1",FuMS_ThemeControlID];
        _onOff set [_themeIndex, false];
        missionNameSpace setVariable [format["FuMS_AdminThemeOn%1",FuMS_ThemeControlID],_onOff];
        // tell other admins of status change.
        FuMS_AdminUpdateData = [FuMS_ThemeControlID, "AdminThemeOn", _onOff];
        publicVariableServer "FuMS_AdminUpdateData";             
    }
    else
    {
        private ["_result","_dataFromServer","_missionFileName","_msnTag"];
        //diag_log format ["##ControlLoop: _activeMission:%1",_activeMission];   
        {   
            // Get location for the mission
            // 1st check if the mission is a ["missionName",[location]] pair           
            _pos = 0;
            _missionNameOverride = "";
            _result = [_pos, _x, _missionNameOverride] call FuMS_fnc_HC_MsnCtrl_Util_SetSpecialNameandLocation;
            _pos = _result select 0;
            _missionNameOverride = _result select 1;
            _missionFileName = _result select 2;
             _dataFromServer = [_themeIndex,_missionFileName] call FuMS_fnc_HC_MsnCtrl_Util_PullData;
        
            if ( !(count _dataFromServer > 0) ) exitWith
            { diag_log format ["##ControlLoop: Theme: %1 : HC:%3 skipped mission %2 check your Server .rpt file.",_missionTheme, _missionFileName, FuMS_ThemeControlID];};    
        
            // if _pos not set to an array, than this mission is NOT a missionName/location pair, but just a mission name needing a location.
            //diag_log format ["##ControlLoop: _pos:%1 _missionFileName:%2",_pos, _missionFileName];
            if (TypeName _pos == "SCALAR") then
            {
                // encounter does not have a STATIC spawn point, so find one!                                                      
                //diag_log format ["##ControlLoop: _dataFromServer:%1 _missionFileName",_dataFromServer, _missionFileName];                            
                if (count _encounterLocations ==0 ) then // Theme location list is empty so generate a global location!
                {
                    _pos = [_dataFromServer, _themeIndex, _missionFileName] call FuMS_fnc_HC_MsnCtrl_Util_GetSafeMissionSpawnPos;                                   
                }else
                {
                    private ["_location"];
                    _location = _encounterLocations select (floor random count _encounterLocations);
                    // If the location has a specific name, use it. Otherwise use mission name!                    
                    if (TypeName (_location select 1) == "STRING") then
                    {
                        // found a [pos,"LocationName"] combo (a village, town, city, or custom defined item in 'Locations' list)
                        _pos = _location select 0;
                        _missionNameOverride = _location select 1;
                    }else
                    {
                        _pos = _location;
                    };
                };     
            };
            if (_spawnedByAdmin) then
            {			
                if (count FuMS_AdminSPAWNLOC > 1) then {_pos = FuMS_AdminSPAWNLOC;};
            };
          
            [_dataFromServer,[_pos, _missionTheme, _themeIndex, _missionNameOverride], [0,"PARENT",0,"ROOT"]] spawn FuMS_fnc_HC_MsnCtrl_NewLogicBomb;
      
        }foreach _activeMission; 
  
		FuMS_Mission_is_Starting = false;
	    uisleep 3;		
        private ["_var"];
        _msnTag = format ["FuMS_%1_%2_%3",_themeIndex,0,0];       
        waitUntil
        {            
            _var = missionNamespace getVariable (format ["%1_MsnStatus",_msnTag]);            
            (!isNil "_var")
        };    
        // if MsnStatus is 'dead' at this point it was set by the previous mission. So wait until THIS mission changes the status to something other than DEAD!
        //diag_log format ["<FuMS> ControlLoop: %1_MsnStatus defined with value of %2. Waiting for mission to start.",_msnTag, _var];
        waitUntil
        {
            _var = missionNamespace getVariable (format ["%1_MsnStatus",_msnTag]);            
            ( (_var select 0) != "DEAD")
        };
        //diag_log format ["<FuMS> ControlLoop: %1_MsnStatus defined with value of %2. Waiting for 'DEAD'",_msnTag, _var];
        waitUntil
        {           
            _var = missionNamespace getVariable (format ["%1_MsnStatus",_msnTag]);
            ( (_var select 0) == "DEAD")
        };
        //diag_log format ["<FuMS> ControlLoop: %1_MsnStatus %2. Selecting a new mission for this Theme:%3",_msnTag, _var, _missionTheme];
        sleep _respawnDelay;
    };    
    if (_abort) exitWith{    
        //diag_log format ["<FuMS> ControlLoop: Theme:%1 loop terminated after multi-mission spawn of single loops due to Admin Controls being disabled."];
    };
};
    
    
    
    