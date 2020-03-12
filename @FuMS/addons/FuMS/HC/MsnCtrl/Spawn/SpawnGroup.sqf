//SpawnGroup.sqf
// Horbin
// 1/4/15
// INPUTS groups array from Mission routine, mission center, encounter size, theme index, FlagSilentcheckin, missionName

//_groupData FORMAT:  [["RESISTANCE","COMBAT","RED","LINE"],   [  [2,"CivNoGun"]                                              ],   ["Guard",[6,6],[0,0],[30]       ]]
// _data FORMAT: [["RESISTANCE","COMBAT","RED","LINE"]
// _units FORMAT: [2,"CivNoGun"],[3,"Rifleman"]
//_aiLogic FORMAT: "Guard",[6,6],[0,0],30    
//     patrolpattern, spawnloc, focus loc of patrolpattern, [  pattern options]
// pattern options are parsed specific to the patrolpattern type.

// Flagsilentcheckin FALSE: 1st group of squad will checkin in with base. TRUE: no initial communicatin with base.
// this flag does NOT turn off AI radio chatter, just the intial checkin.

// OUTPUTS list of groups crated


 private ["_data","_side","_behaviour","_combat","_form","_units","_patrol","_spawnpos","_patternOptions","_silentcheckin",
"_aiLogic","_patrolSpawnLoc","_patrolPatrolLoc","_groupData","_groups","_eCenter","_group","_encounterSize","_themeIndex", "_missionName"];
_groupData = _this select 0;
_eCenter = _this select 1;
_encounterSize = _this select 2;
_lineage = _this select 3;
_silentcheckin = _this select 4;
_missionName = _this select 5;

_themeIndex = _lineage select 0;
_generation = _lineage select 1;
_offspringID = _lineage select 2;
_msnTag = format ["FuMS_%1_%2_%3",_themeIndex,_generation,_offspringID];

if (isNil "_silentcheckin") then
{
    _silentcheckin = (((FuMS_THEMEDATA select _themeIndex) select 3) select 0) select 1;
};
_groups = [];
if (!isNil "_groupData") then
{
    {
        if (count _x == 3) then
        {
            _data = _x select 0;
            _units = _x select 1;
            _aiLogic = _x select 2;
            //    diag_log format ["#Spawn Group: _data:%1, _units:%2, _aiLogic:%3",_data, _units, _aiLogic];
            _side = _data select 0;
            _behaviour = _data select 1;
            _combat = _data select 2;
            _form = _data select 3;
            //    diag_log format ["#Spawn Group: _side:%1, _behavior:%2, _combat:%3, _form:%4", _side, _behaviour, _combat, _form];
            _patrol = _aiLogic select 0;
            _patrolSpawnLoc = _aiLogic select 1;
            _patrolPatrolLoc = _aiLogic select 2;
            _patternOptions = _aiLogic select 3;   
            _spawnpos =[_eCenter, _patrolSpawnLoc] call FuMS_fnc_HC_MsnCtrl_Util_XPos;
			_side = toupper _side;
            switch (_side) do 
            {                
                case "RESISTANCE":	{_group = createGroup RESISTANCE;};//RESISTANCE
                case "GUER": 		{_group = createGroup RESISTANCE;};
                case "WEST": 		{_group = createGroup WEST;};
                case "EAST": 		{_group = createGroup EAST;};
                case "CIV" : 		{_group = createGroup CIVILIAN;};
                case "CIVILIAN":	{_group = createGroup CIVILIAN;};
                case "ZOMBIE":		{_group = createGroup WEST;};
                default 			{_group = [];};
            };
            if (isNil "_group") exitWith {diag_log format ["#Spawn Group: ###ERROR###: Invalid _side: %1. No group created!",_side];};
            //diag_log format ["<FuMS> SpawnGroup: _group:%1 Side:%2",_group, _side];
			_group = [_group,_spawnpos, _units,_themeIndex ] call FuMS_fnc_HC_msnCtrl_Spawn_CreateGroup;	
            _group setBehaviour _behaviour; 	// "CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"
			
            _group setCombatMode _combat;		// "BLUE" : Never fire, keep formation
												// "GREEN" : Hold fire, keep formation
												// "WHITE" : Hold fire, engage at will/loose formation
												// "YELLOW" : Fire at will, keep formation
												// "RED" : Fire at will, engage at will/loose formation
												
            _group setFormation _form; 			// "COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT"
												// "VEE", "LINE", "FILE", "DIAMOND"
    
           
            //    diag_log format["#Spawn Group: _group:%1, _spawnpos:%2, _patrol:%3",_group, _spawnpos, _patrol];
            //Group Behavior
            _patrolPatrolLoc = [_eCenter, _patrolPatrolLoc] call FuMS_fnc_HC_MsnCtrl_Util_XPos;
            _patrol = toUpper _patrol;        
            // FuMS AI global initialization.
            {
                _x setVariable ["FuMS_AILOGIC", [ _patrol, _eCenter, _spawnpos, _patrolPatrolLoc, _patternOptions], false];
                _x setVariable ["FuMS_XFILL", 	[_themeIndex, _side, "TRUE"], false];      
                _x setVariable ["FuMS_MSNTAG", 	[ ((FuMS_THEMEDATA select _themeIndex) select 0) select 0, _missionName], false];
                _x setVariable ["FuMS_LINEAGE",_msnTag, false]; 
                [_x] spawn FuMS_fnc_HC_AI_Logic_AIEvac;
                
            }foreach units _group;   
            _group setVariable ["LINEAGE",_msnTag, false];
            // _validOptions = [_group] call FuMS_fnc_HC_Val_Msn_ValidateAILOGIC; 
            // if (_validOptions) then
            // {
                switch (_patrol) do
                {
                    private ["_patrolRadius","_patrolDuration"];
                    case "PERIMETER":
                    { 
                        _patrolRadius = _patternOptions select 0;
                        if ( _patrolRadius == 0) then 
                        { 
                            _patrolRadius = .8* _encounterSize;
                        };
                        [_group, _patrolPatrolLoc, _patrolRadius,12,0,true] call FuMS_fnc_HC_AI_Logic_PolygonPatrol;
                    };
                    case "BOXPATROL":
                    { 
                        _patrolRadius = _patternOptions select 0;
                        if ( _patrolRadius == 0) then 
                        { 
                            _patrolRadius = .8* _encounterSize;
                        };  
                        [_group, _patrolPatrolLoc, _patrolRadius, 0, true] call FuMS_fnc_HC_AI_Logic_BoxPatrol;
                    };       
                    case "EXPLORE":
                    { 
                        _patrolRadius = _patternOptions select 0;
                        if ( _patrolRadius == 0) then 
                        { 
                            _patrolRadius = .8* _encounterSize;
                        };    
                        [_group, _patrolPatrolLoc, _patrolRadius] call FuMS_fnc_HC_AI_Logic_AreaPatrol;
                    };
                    case "BUILDINGS":
                    {
                        _patrolRadius = _patternOptions select 0;
                        //      _patrolDuration = _patternOptions select 1;     
                        [_group, _patrolPatrolLoc,"AI_PB", [_patrolPatrolLoc, _patrolRadius]  ] call FuMS_fnc_HC_AI_Logic_ScriptPatrol;
                    };
                    case "SENTRY":
                    {
                        _patrolRadius = _patternOptions select 0;
                        if ( _patrolRadius == 0) then 
                        { 
                            _patrolRadius = .8* _encounterSize;
                        };
                        {                           
							[_x, true] spawn FuMS_fnc_HC_AI_Logic_AIGuardBuilding;
                        } foreach units _group;
                    };
                    case "GUNNER":
                    {
                        [_group, _patternOptions] call FuMS_fnc_HC_AI_Logic_StaticGunner;
                    };
                    case "LOITER":
					{
						[_group, _eCenter, _patternOptions] call FuMS_fnc_HC_AI_Logic_Loiter;
					};
                    case "CONVOY":
                    {
                        //"NORMAL",true,true, true
                        private ["_wp","_speed","_rtb","_roads","_despawn"];
                        //_speed = _patternOptions select 0; 
                        //_rtb = _patternOptions select 1;
                        //_roads = _patternOptions select 2;
                        //_despawn = _patternOptions select 3;
                        //_xfill = _patternOptions select 4;
                        _wp = [_group, _patrolPatrolLoc, _patternOptions] call FuMS_fnc_HC_AI_Logic_Convoy;            
                    };
                    case "PARADROP":
                    {
                        //pilotgroup, dropoff point, options!                        
						[_group, _patrolPatrolLoc, _patternOptions] spawn FuMS_fnc_HC_AI_Logic_Paradrop;
                    };
					case "AIREVAC":
                    {
                        //pilotgroup, dropoff point, options!                        
						[_group, _patrolPatrolLoc, _patternOptions] spawn FuMS_fnc_HC_AI_Logic_AirEvac;
                    };
                    case "PATROLROUTE":
                    {                       
						 [_group, _patrolPatrolLoc, _patternOptions] spawn FuMS_fnc_HC_AI_Logic_PatrolRoute;
                    };
                    case "ZOMBIE":
                    {
                        {                            
                           // diag_log format ["<FuMS> SpawnGroup: Zombie:%1 options:%2",_zombieType,_patternOptions];
                            [_x, _patternOptions] spawn FuMS_fnc_HC_AI_Logic_RZnD_Zombie;                                                          
                        }foreach units _group;                           
                    };				
                    case "TRACKROUTE":
                    {                       
                        [_group, _patrolPatrolLoc, _patternOptions] spawn FuMS_fnc_HC_AI_Logic_TrackRoute;
                    };
                    case "SADROUTE":
                    {                       
                        [_group, _patrolPatrolLoc, _patternOptions] spawn FuMS_fnc_HC_AI_Logic_TrackRoute;
                    };
                    case "TOWERGUARD":
                    {                       
                        [_group, _patrolPatrolLoc, _patternOptions] spawn FuMS_fnc_HC_AI_Logic_TowerGuard;
                    };
                    case "CAPTURED":
                    {
                        [_group, _patrolPatrolLoc, _eCenter, _patternOptions] spawn FuMS_fnc_HC_AI_Logic_Captured;
                    };
                };
          //  };
            // _wp available here to permit further customization of the group's behavior at each waypoint.
            // _wp is set to the 1st waypiont the AI are to move too (ie not their spawn loc!))
            // ##For behavior that execVM's##: no wp modification is available.    
            //Spawn RadioChatter module for this Group
            // Data available _groupData, _eCenter, _encounterSize, _themeIndex
            // Know there are going to be 'count _groupData' groups made.
            //  desire to have only the 'lead' group check in.
            if (!_silentcheckin) then  // if not silent checkin, then ONLY lead group of squad checks in.
            {
                if (count _groups == 0) then {_silentcheckin = false;}else{_silentcheckin=true;}
            };    
            // initiate radio logic for the group, now that its formation is complete!
			// [_group, _themeIndex, _eCenter, _silentcheckin, _missionName] execVM "HC\Encounters\AI_Logic\RadioChatter\AIRadio.sqf";   
			//[_group, _themeIndex, _eCenter, _silentcheckin, _missionName] spawn FuMS_fnc_HC_AI_RC_AIRadio;
            _groups = _groups + [_group];
        }else{diag_log format ["##SpawnGroup: Error in data formatting in Group section: %1, theme:%2, data:%3",_missionName, _themeIndex, _x];};
    } foreach _groupData;
};
_groups


