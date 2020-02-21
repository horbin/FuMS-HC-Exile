//TriggerBomb.sqf
// Horbin
// 6/21/2015
// Inputs: _tiggerData from mission file, which is the list of all triggers needed for the mission.
//           _msnTag, which is the prefix for each trigger's global status variable.
//          _MsnData, which is an array of 'base init' data needed by the triggers from the mission.
//            _positionOffset - centroid around which all mission objects are created (not necesarily the mission center)

private ["_triggerList","_msnTag","_MsnData","_positionOffset","_eCenter","_themeIndex","_missionName"];
_triggerList = _this select 0;
           // Ex   ["Trig1",["ProxPlayer",[0,0],150,1] ],
	 //             ["Trig2",["ProxPlayer",[0,0],10,1]  ]
_msnTag = _this select 1;
_MsnData = _this select 2;

_positionOffset = _MsnData select 0;
_eCenter = _MsnData select 1;
_themeIndex = _MsnData select 2;
_missionName = _MsnData select 3;

// Add internal FuMS triggers to the list.
_triggerList = _triggerList + [ ["FuMS_KillMe",["KILL"]]   ]; // used to enable FuMS to kill missions outside of trigger'd events.
_triggerList = _triggerList + [ ["OK", ["squirrel!"]]         ];
//diag_log format ["<FuMS> TriggerBomb: %1 starting %2 with %3",_msnTag, _triggerList, _MsnData];
//Initialize and spawn process to querry each Trigger.
{
    private ["_trigName","_trigType","_trigFlag"];
    _trigName = _x select 0; // used to build a unique global variable associated with the 'state' of the trigger (ie true/false)
    _trigType = _x select 1; // name of trigger and its 'start up paramaters'
    // create the global var for this trigger, set it to False!
    _trigFlag = format ["%1TGR_%2",_msnTag, _trigName];
    missionNameSpace setVariable [_trigFlag , false];
    
    switch (toupper (_trigType select 0)) do
    {
        case "FuMS_KillMe":
        {
            // internal trigger used by parent missions to force a child mission to terminate
            // watches the missions "killme" flag, when it is true, mission executes a TERM action.                   
            // no spawn routine for this flag because it will be modified by outside forces!   
            // END is the only defined action that watches for this trigger!
            diag_log format ["<FuMS> TriggerBomb: %1 %2 with params %3 started.",_trigFlag, _trigType select 0, "None"];
        };
        case "OK":
        {
            // Forces the associated actions to occur when the mission 1st starts.           
            // no spawn routine for this flag because it will always be TRUE!
            missionNameSpace setVariable [format ["%1TGR_%2",_msnTag, _trigName], true];
            diag_log format ["<FuMS> TriggerBomb: %1 %2 with params %3 started.",_trigFlag, _trigType select 0, "None"];
        };
         case "PROXPLAYER":
        {
            // ["ProxPlayer",[_offset], _range, _numPlayers]
            private ["_range","_offset","_dt","_numPlayers","_pos","_params"];
            _range = _trigType select 2;
            _offset = _trigType select 1;
            _numPlayers = _trigType select 3;
            _pos = [_positionOffset, _offset] call FuMS_fnc_HC_MsnCtrl_Util_XPos;     
            _params = [_pos, _range, _numPlayers];            
            [_params, _msnTag, "ProxPlayer", _trigName] call FuMS_fnc_HC_MsnCtrl_LogicBomb_SpawnTrigger;                     
        };
        case "LOWUNITCOUNT":
        // ['LOWUNITCOUNT", side, numAI, radius, offset]
        {
            private ["_side","_numAI","_radius","_offset","_pos","_params"];
            _side = _trigType select 1;
            _numAI = _trigType select 2;
            _radius = _trigType select 3;
            _offset = _trigType select 4;
            _pos = [_positionOffset, _offset] call FuMS_fnc_HC_MsnCtrl_Util_XPos;
            _params = [_pos, _side, _numAI, _radius, _msnTag];
            [_params, _msnTag, "LowUnitCount",_trigName] call FuMS_fnc_HC_MsnCtrl_LogicBomb_SpawnTrigger;           
        };
         case "HIGHUNITCOUNT":
        // ['HIGHUNITCOUNT", side, numAI, radius, offset]
        {
            private ["_side","_numAI","_radius","_offset","_pos","_params"];
            _side = _trigType select 1;
            _numAI = _trigType select 2;
            _radius = _trigType select 3;
            _offset = _trigType select 4;
            _pos = [_positionOffset, _offset] call FuMS_fnc_HC_MsnCtrl_Util_XPos;            
            _params = [_pos, _side, _numAI, _radius, _msnTag];            
            [_params, _msnTag, "HIGHUNITCOUNT", _trigName] call FuMS_fnc_HC_MsnCtrl_LogicBomb_SpawnTrigger;           
        };
        case "DETECTED":
        // ["DETECTED", grp#, vehicle#]
        {
            private ["_grpNum","_vehNum","_groups","_vehicles","_grplist","_vehlist","_params"];
            _groups = missionNameSpace getVariable (format ["%1_Groups",_msnTag]);
            _vehicles = missionNameSpace getVariable (format ["%1_Vehicles",_msnTag]);
            _grplist = [_trigType select 1, count _groups] call FuMS_fnc_HC_MsnCtrl_Util_GetIndexers;
            _vehlist = [_trigType select 2, count _vehicles] call FuMS_fnc_HC_MsnCtrl_Util_GetIndexers;          
            {
                private ["_units","_group"];
                _group = _groups select _x;
                diag_log format ["<FuMS> TriggerBomb: Detector set  for group#%1 in  %2_%3",_x,_msnTag,_trigName];
                _units = units _group;
                {
                    _x setVariable ["FuMS_DETECTOR", true];
                }foreach _units;
            }foreach _grplist;
            {
                private ["_units","_veh"];
                _veh = _vehicles select _x;
                _veh setVariable ["FuMS_DETECTOR", true];
                diag_log format ["<FuMS> TriggerBomb: Detector set  for vehicle#%1 in  %2_%3",_x,_msnTag,_trigName];
                _units = crew _veh; 
                {
                    _x setVariable ["FuMS_DETECTOR",true];
                }foreach _units;
            }foreach _vehlist;            
            _params = [_msnTag,_grplist, _vehlist];            
            [_params, _msnTag, "DETECT", _trigName] call FuMS_fnc_HC_MsnCtrl_LogicBomb_SpawnTrigger;           
        };
        case "BODYCOUNT":
        // ["BODYCOUNT", numAI]
        {
            private ["_numAI","_params"];
            _numAI = _trigType select 1;
            _params = [_msnTag, _numAI];
            missionNameSpace setVariable [format ["%1_BodyCount",_msnTag],0];
            [_params, _msnTag,"BODYCOUNT",_trigName] call FuMS_fnc_HC_MsnCtrl_LogicBomb_SpawnTrigger;           
        };
        case "TIMER":
        {
            private ["_duration","_params"];
            _duration = _trigType select 1;
            _params = [_msnTag, _duration, time];
            [_params, _msnTag,"TIMER",_trigName] call FuMS_fnc_HC_MsnCtrl_LogicBomb_SpawnTrigger;              
        };
		case "TIMERNOPLAYERS":
        {
            private ["_duration","_params"];
            _duration = _trigType select 1;
            _pos = [_positionOffset, [0,0]] call FuMS_fnc_HC_MsnCtrl_Util_XPos;            
            _params = [_msnTag, _duration, time, _pos];
            [_params, _msnTag,"TIMERNOPLAYERS",_trigName] call FuMS_fnc_HC_MsnCtrl_LogicBomb_SpawnTrigger;              
        };

        case "ZUPPACAPTURE":
        {
            private ["_locationList","_params"];
            _locationList = _trigType select 1;
            _params = [_msnTag, _trigName];
            [_locationList, _themeIndex, _missionName, _eCenter, _msnTag, _trigName] call FuMS_fnc_HC_Triggers_ZuppaCaptureInit;
            [_params, _msnTag,"ZUPPACAPTURE",_trigName] call FuMS_fnc_HC_MsnCtrl_LogicBomb_SpawnTrigger;                                                 
        };
        case "DMGBUILDINGS":
        {
            private ["_bldgNum","_amount","_list","_buildings","_params","_total", "_obj"];
            _bldgNum = _trigType select 1;
            _amount = _trigType select 2;
            _buildings = missionNamespace getVariable (format["%1_Buildings", _msnTag]);
          
            _list = [_bldgNum, count _buildings] call FuMS_fnc_HC_MsnCtrl_Util_GetIndexers;
            _total = count _list;
            missionNamespace setVariable [format ["%1_%2_ObjectTotal",_msnTag,_trigName], _total];
            {
                _obj = _buildings select _x;
                _obj setVariable ["FuMS_ObjectDamage", [_amount, true]];
               // diag_log format ["<FuMS> TriggerBomb:DmgBuildings: Building#%1 for %2_%3 set at amount of %4",_x,_msnTag,_trigName,_amount];
            }foreach _list;
            _params = [_msnTag, _trigName, "BUILDINGS"]; 
            [_params, _msnTag,"DMGOBJECTS",_trigName] call FuMS_fnc_HC_MsnCtrl_LogicBomb_SpawnTrigger;                                                 
        };
        case "DMGVEHICLES":
        {
            private ["_vehNum","_amount","_list","_vehicles","_params","_total","_obj"];
            _vehNum = _trigType select 1;
            _amount = _trigType select 2;
            _vehicles = missionNamespace getVariable (format["%1_Vehicles", _msnTag]);
                        
            _list = [_vehNum, count _vehicles] call FuMS_fnc_HC_MsnCtrl_Util_GetIndexers;
             _total = count _list;
            missionNamespace setVariable [format ["%1_%2_ObjectTotal",_msnTag,_trigName], _total];
            {
                _obj = _vehicles select _x;
                _obj setVariable ["FuMS_ObjectDamage", [_amount, true]];
              // diag_log format ["<FuMS> TriggerBomb:DmgVehicles: Vehicle#%1 for %2_%3 set at amount of %4",_x,_msnTag,_trigName,_amount];
            }foreach _list;
            _params = [_msnTag, _trigName, "VEHICLES"]; 
            [_params, _msnTag,"DMGOBJECTS",_trigName] call FuMS_fnc_HC_MsnCtrl_LogicBomb_SpawnTrigger;                                                 
        };    
        case "TAKEVEHICLE":
        {
            private ["_vehNum","_amount","_list","_vehicles","_params","_total","_obj"];
            _vehNum = _trigType select 1;
            _distance = _trigType select 2;
            _vehicles = missionNamespace getVariable (format["%1_Vehicles", _msnTag]);
			
            _list = [_vehNum, count _vehicles] call FuMS_fnc_HC_MsnCtrl_Util_GetIndexers;


			_obj = _vehicles select (_list select 0);
			_obj setVariable ["FuMS_Taken", false, true];
			_obj setVariable ["FuMS_Homepos", getpos _obj, true];
			diag_log format ["<FuMS> TriggerBomb:TakeVehicle: Vehicle#%1 for %2_%3 set with distance of %4",_vehNum,_msnTag,_trigName,_distance];
			_params = [_msnTag, _trigName, _obj, _distance]; 
			[_params, _msnTag,"CHECKVEHICLE",_trigName] call FuMS_fnc_HC_MsnCtrl_LogicBomb_SpawnTrigger;                                                 


			 
            //_list = [_vehNum, count _vehicles] call FuMS_fnc_HC_MsnCtrl_Util_GetIndexers;
			/*
			diag_log format ["TriggerBomb: TakeVehicle: _vehNum:%1 _distance:%2",_vehNum,_distance];
			
			
             _total = count _list;
            missionNamespace setVariable [format ["%1_%2_ObjectTotal",_msnTag,_trigName], _total];
            {
                _obj = _vehicles select _x;
                _obj setVariable ["FuMS_Taken", false, true];
                _obj setVariable ["FuMS_Homepos", getpos _obj, true];
                diag_log format ["<FuMS> TriggerBomb:TakeVehicle: Vehicle#%1 for %2_%3 set at distance of %4",_x,_msnTag,_trigName,_distance];
            }foreach _list;
            _params = [_msnTag, _trigName, _distance]; 
            [_params, _msnTag,"CHECKVEHICLE",_trigName] call FuMS_fnc_HC_MsnCtrl_LogicBomb_SpawnTrigger;                                                 
		*/
		
		};    
         case "CAPTIVE":
        // ["CAPTIVE", numAI]
        {
            private ["_numAI","_params"];
            _numAI = _trigType select 1;
            _params = [_msnTag, _numAI];
            missionNameSpace setVariable [format ["%1_CaptiveCount",_msnTag],0];
            [_params, _msnTag,"CAPTIVECOUNT",_trigName] call FuMS_fnc_HC_MsnCtrl_LogicBomb_SpawnTrigger;           
        };
    };   
}foreach _triggerList;
