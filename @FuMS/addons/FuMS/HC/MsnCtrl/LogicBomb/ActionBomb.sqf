//ActionBomb.sqf
// Horbin
//6/24/2015
// Inputs:  List of action/logic pairings:
//
//      : _msnTag 
private ["_actionData","_msnTag","_passData","_done","_lineage","_relation", "_stateWinLoss","_missionKillIndex","_curMission","_missionTheme"];
_actionData = _this select 0;
//Ex:
// [["WIN"],["Trig1"       ]],
//	  [["LOSE"],["Trig2"      ]],
//	  [["END"],["Trig1","OR","Trig2"      ]]
_msnTag = _this select 1;
_passData = _this select 2;
_curMission = _passData select 10;
_missionTheme = _passData select 9;
_lineage = missionNameSpace getVariable (format ["%1_Lineage",_msnTag]);
//diag_log format ["<FuMS> ActionBomb: %1 :Lineage: %2",_msnTag,_lineage];
_relation = _lineage select 2;

_actionData = _actionData + [ [["END"],["FuMS_KillMe"]]  ];
// in the 'End' LogicBomb, just need to check status of the trigger flag.

_stateWinLoss = false; // if true then a WINLOSS state has been achieved so ignore further occurances.
// Other Actions may have different behaviour, those actions will be reset/modified by flags controlled here.
_missionKillIndex = count FuMS_ActiveMissions;
FuMS_ActiveMissions = FuMS_ActiveMissions + [ [_missionKillIndex, format ["%1:%2", _curMission,_missionTheme]] ];  
missionNameSpace setVariable [format["FuMS_AdminActiveMissionList%1",FuMS_ThemeControlID],FuMS_ActiveMissions];
FuMS_AdminUpdateData = [FuMS_ThemeControlID, "AdminActiveMissionList",FuMS_ActiveMissions];
publicVariableServer "FuMS_AdminUpdateData";

_done = false;
while {!_done} do
{
    private ["_endMission"];
        // check if admin has called for this mission to terminate. If so, set its KillMe flag!
        FuMS_ActiveMissions = missionNameSpace getVariable format ["FuMS_AdminActiveMissionList%1",FuMS_ThemeControlID];
        //diag_log format ["<FuMS> ActionBomb: ID:%1 Index: %3 Missions:%2",FuMS_ThemeControlID, FuMS_ActiveMissions, _missionKillIndex];
        _endMission = (FuMS_ActiveMissions select _missionKillIndex) select 1;
        if (!isNil "_endMission") then
        {
            if (_endMission == "KILL") then
            {
                missionNameSpace setVariable [format ["%1TGR_FuMS_KillMe",_msnTag],true];
            };
        };
    
	{
		private ["_triggerList","_triggerList","_result","_action"];
      // diag_log format ["<FuMS> ActionBomb: %2 Processing %1",_x, _msnTag];
        _action = _x select 0; // ["WIN]  or ["CHILD","<MissionName>", location]
		_triggerList = _x select 1;
     
            
        
		// resolve the _triggerList
		// if it returns TRUE, then execute applicable action.
		_result = [_triggerList, _msnTag] call FuMS_fnc_HC_MsnCtrl_LogicBomb_LogicBomb;
		if (_result) then
		{            
            private ["_eCenter","_positionOffset","_buildings","_groups","_vehicles","_boxes","_customData","_endScript","_encounterSize",
            "_missionTheme","_curMission","_themeIndex","_generation","_offspringID","_mkr1","_mkr2","_missionNameOverride",
             "_lootConfig","_markers","_notifications","_actionName","_zupakill"];
								_eCenter = _passData select 0;
								_positionOffset = _passData select 1;
								_buildings = _passData select 2;
								_groups = _passData select 3;
								_vehicles = _passData select 4;
								_boxes = _passData select 5;
								_customData = _passData select 6;
								_endScript = _passData select 7;
								_encounterSize = _passData select 8;
								_missionTheme = _passData select 9;
								_curMission = _passData select 10;
								_themeIndex = _passData select 11;
								_generation = _passData select 12;
								_offspringID = _passData select 13;
								_mkr1 = _passData select 14;
								_mkr2 = _passData select 15;
								_missionNameOverride = _passData select 16;            
            _lootConfig = _passData select 17;
            _markers = _passData select 18;
            _notifications = _passData select 19;

            _actionName = toupper (_action select 0);                       
            
          //  diag_log format ["<FuMS> ActionBomb: %3 Positive Result for %1 using trigList %2",_actionName, _triggerList, _msnTag];
			switch (_actionName) do
			{			
                case "WIN";
                case "LOSE":
                {
                    if (!_stateWinLoss) then
                    {
                        _stateWinLoss = true;
                        // if closetriggers is true, a call to END was mode
                        //  so do not run win/lose results!
                        if ( !( missionNamespace getVariable (format ["%1_closetriggers",_msnTag]))) then
                        {
                            private ["_actionName"];
                            // _x = [ ["WIN"],["Trig1","Trig2"]]
                            _actionName = toupper( (_x select 0) select 0);
                            // call loot
                            _boxes = [_lootConfig, _positionOffset, _x select 0,[_themeIndex, _generation, _offspringID], _boxes] 
                            call FuMS_fnc_HC_MsnCtrl_Spawn_SpawnMissionLoot;
                            // call messaging
                            [_markers, _notifications, _x select 0, _mkr1, _mkr2,_eCenter, _missionNameOverride] 
                            call FuMS_fnc_HC_MsnCtrl_Spawn_SpawnNotifications;
                            missionNamespace setVariable [format ["%1_boxes",_msnTag],_boxes];	 
                            // stop all other TriggerBombs
                            //missionNameSpace setVariable [format ["%1_closetriggers",_msnTag], true];
                            if ( _actionName == "WIN") then {missionNamespace setVariable [format ["%1_MsnStatus",_msnTag],["WIN"]];}
                            else {missionNamespace setVariable [format ["%1_MsnStatus",_msnTag],["LOSE"]];};
                         //   diag_log format ["<FuMS> ActionBomb: Action:%1 for %2",_actionName, _msnTag];
                        };
                    };
                };
                case "STEPCHILD";
                case "CHILD":
                {
                    //   _action =  [ "CHILD",   [ "EvacTown",[0,0],1,0]    ]    
                    private ["_msnName","_location","_reps","_freq","_results","_childList","_launchMission","_childID","_childStatus"];
                    _results = _action select 1; // ["EvacTown",[0,0],1,0]                                          
                    _msnName = _results select 0;
                    _location = _results select 1;
                    _reps = _results select 2;
                    _freq = _results select 3;
                    _launchMission = false;                    
                    // Check/initialize applicable reps and freq counter based upon child's ID.  
                    // Build unique ID for this Child/Result pair
                    _childID = format ["%1_%2_%3%4%5%6",_msnTag,_actionName,_msnName,_location,_reps,_freq];
                    _childStatus = missionNameSpace getVariable (format ["%1",_childID]);
                    if (isNil "_childStatus") then
                    {
                        //This child has NEVER been created, so build tracking vars and start to track it.
                        missionNameSpace setVariable [format["%1",_childID],_reps-1];
                        missionNameSpace setVariable [format["%1_timer",_childID], time+_freq];
                        // LAUNCH THE MISSION.
                        _launchMission = true;
                    }else
                    {
                        if (_childStatus > 0) then
                        {
                            private ["_timer"];
                            // child is configured to run more than once, so now, check its timer!
                            _timer = missionNameSpace getVariable (format ["%1_timer",_childID]);
                            if (time > _timer) then
                            {
                                // ok to launch another instance of this mission.                                                            
                                missionNameSpace setVariable [format["%1",_childID],_childStatus-1];
                                missionNameSpace setVariable [format["%1_timer",_childID], time+_freq];
                                // LAUNCH THE MISSION
                                _launchMission = true;
                            };
                        };
                    };
                    if (_launchMission) then
                    {
                        private ["_childList","_parentsLineage","_generation","_relation","_offspringID","_parentName","_lineage","_childsName","_dataFromServer","_pos"];
                        _childList = missionNameSpace getVariable (format ["%1_Children", _msnTag]);       
                        // Obtain child's lineage                                       
                        _parentsLineage = missionNameSpace getVariable (format ["%1_Lineage",_msnTag]);
                        _generation = (_parentsLineage select 1) + 1; //number representing how far displaced from generation '0' (root mission)
                        _relation = _actionName; // child, stepchild, sibling
                        _offspringID = count _childList; // number that represents birth order of this child
                        _parentName = _msnTag;// Full 'name' of the parent, name of "ROOT" implies spawned from controlloop.
                        _lineage = [_generation,_relation,_offspringID,_parentName];
                        _childsName = format ["FuMS_%1_%2_%3",_themeIndex, _generation,_offspringID];
                        _childList = _childList + [_childsName];
                        missionNameSpace setVariable [format["%1_Children",_msnTag],_childList];                        
                        
                      //  diag_log format ["<FuMS> ActionBomb: CHILD:%3 : %1 birthing it at %2 ",_msnName, _location, _childsName];
                        // establish mission's location.
                        _pos = [_eCenter, _location] call FuMS_fnc_HC_MsnCtrl_Util_XPos;
                        // get data on the mission.
                        _dataFromServer = [_themeIndex,_msnName] call FuMS_fnc_HC_MsnCtrl_Util_PullData;     
                       // diag_log format ["<FuMS> ActionBomb: %1:%2 : %3",_themeIndex,_msnName, _dataFromServer];
                        // Launch the applicable Mission.                                      
                        [_dataFromServer,[_pos, _missionTheme, _themeIndex, _missionNameOverride], _lineage] spawn FuMS_fnc_HC_MsnCtrl_NewLogicBomb;
                    };
                };  
                case "END":
                {
                    private ["_children","_allChildrenDead","_listofChildren","_msnStatus","_state","_delay","_parent"];
                   // uisleep 30; // 30 sec delay for simultanious win/lose with end, to enable win/lose to execute.
                    // check mission status for win/lose. and apply appropriate 'delay' before doing cleanup!
                    _msnStatus = missionNameSpace getVariable (format ["%1_MsnStatus",_msnTag]);
                    _state = _msnStatus select 0;
                    _delay = 2;
                    if (_state == "WIN") then {_delay = (_notifications select 0) select 5  };
                    if (_state == "LOSE") then {_delay = (_notifications select 0) select 6 };
                    uisleep _delay;
                    deleteMarker _mkr1;
                    deleteMarker _mkr2;
                    
                    FuMS_MissionTerritory = FuMS_MissionTerritory - [_eCenter, _encounterSize, format ["%1%2",_missionTheme,_curMission]];
                    
                   // diag_log format ["<FuMS> ActionBomb: Action:%1 for %2",_actionName, _msnTag];   
                    // stop all other TriggerBombs
                    if (!isNil "_endScript") then
                    {
                        if (toupper _endScript != "NONE") then
                        {        								
                            [ _eCenter, _positionOffset, _buildings, _groups, _vehicles, _boxes, _customData] 
                            call  (missionNamespace getVariable _endScript);
                        };
                    };                    
                    // close all other trigger process.
                    missionNameSpace setVariable [format ["%1_closetriggers",_msnTag], true];
                    // close zupa loops if in use for this mission.
                    _zupakill = missionNamespace getVariable (format ["%1_ZuppaTerminate",_msnTag]);
                    if (!isNil "_zupakill") then {missionNamespace setVariable [format ["%1_ZuppaTerminate",_msnTag], true];};
                    
                    //clean up this mission's children.                        
                    _children = missionNamespace getVariable (format ["%1_Children",_msnTag]);
               //     diag_log format ["<FuMS> ActionBomb: %1 terminating children %2",_msnTag, _children];
                    {
                        missionNamespace setVariable [format["%1_FuMS_KillMe",_x],true];
                        waitUntil { ((missionNamespace getVariable (format["%1_MsnStatus",_x])) select 0 ) == "DEAD"};
                    }foreach _children;        
                          //wait for all children (and their children through recursive call to this code via their 'END's to complete.            
                    _allChildrenDead = false;
                    _listofChildren = missionNameSpace getVariable (format ["%1_Children",_msnTag]);
                    while {!_allChildrenDead} do
                    {
                        private ["_deadChildCount","_msnStatus"];
                        _deadChildCount = 0;
                        {
                            _msnStatus = missionNamespace getVariable (format ["%1_MsnStatus",_x]);
                            if ((_msnStatus select 0) == "DEAD") then {_deadChildCount = _deadChildCount +1;};
                        }foreach _listofChildren;
                        if (_deadChildCount == count _listofChildren) then {_allChildrenDead = true;};
                    };                                                                                
                   // At this point all of 'this mission's children are dead and resources properly passed to 'this' mission via the Children's END scripting                   
                      if (_relation == "CHILD") then
                    {                        
                        [_msnTag] call FuMS_fnc_HC_MsnCtrl_LogicBomb_TransferObjects;
                    }
                    else
                    // setup all objects to be removed/decay. (this mission is either a parent or stepchild)
                    {
                        [_msnTag] call FuMS_fnc_HC_MsnCtrl_LogicBomb_RemoveDecayObjects;
                    };
                    _done = true;
                    missionNamespace setVariable [format ["%1_MsnStatus",_msnTag],["DEAD"]];
                    missionNamespace setVariable [format ["%1_Children",_msnTag], []];
                    // if a child remove it from the parent's list
                    _lineage = missionNamespace getVariable (format ["%1_Lineage",_msnTag]);
                    _parent = _lineage select 4;
                    if (!isNil "_parent") then
                    {
                        private ["_kids"];
                        _kids = missionNamespace getVariable (format ["%1_Children", _parent]);
                        if (!isNil "_kids") then
                        {
                            _kids = _kids - [_msnTag];
                            missionNamespace setVariable [format ["%1_Children",_parent],_kids];
                        };
                    };
                    
                    FuMS_ActiveMissions set [_missionKillIndex, "COMPLETE"];
                    missionNameSpace setVariable [format["FuMS_AdminActiveMissionList%1",FuMS_ThemeControlID],FuMS_ActiveMissions];
                    FuMS_AdminUpdateData = [FuMS_ThemeControlID, "AdminActiveMissionList",FuMS_ActiveMissions];
                    publicVariableServer "FuMS_AdminUpdateData";		                                        
                    
                //    diag_log format ["<FuMS> ActionBomb: Action:%1 for %2",_actionName, _msnTag];   
                };
            };
		};
	}foreach _actionData;
uisleep 5;
    if ( ((missionNamespace getVariable (format ["%1_MsnStatus",_msnTag])) select 0) == "DEAD") then {_done = true;};
};
//diag_log format ["<FuMS> ActionBomb: %1 's action loop terminated!", _msnTag];
