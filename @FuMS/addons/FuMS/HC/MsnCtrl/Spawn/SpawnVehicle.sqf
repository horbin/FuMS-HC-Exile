//SpawnVehicle.sqf
// Horbin
// 1/4/15
// INPUTS groupsdata array from Mission routine, Encounter center, mission size, array of groups from MissionInit.
// OUTPUTS list of groups and vehicles crated [_groups array, vehicle array]
private ["_convoy","_vehdat","_driverdat","_troopdat","_driverGroup","_crewcount","_troopGroups","_masterIndex",
"_numberTroops","_totalvehicles","_abort","_msg"];
private ["_vehicleData","_eCenter","_encounterSize","_groups","_returnval","_themeIndex","_missionName","_totalvehicles","_lineage","_msnTag",
"_generation","_offspringID"];
_vehicleData = _this select 0;
_eCenter = _this select 1;
_encounterSize = _this select 2;
_groups = _this select 3;
_totalvehicles = _this select 4;
_lineage = _this select 5;
_missionName = _this select 6;

_themeIndex = _lineage select 0;
_generation = _lineage select 1;
_offspringID = _lineage select 2;

_msnTag = format ["FuMS_%1_%2_%3",_themeIndex,_generation,_offspringID];

_returnval =[_groups, _totalvehicles];
_abort = false;
_msg = "";
if (!_abort) then
{
    { 
        // Being of Convoy Creation!
        private ["_numVeh","_ebk","_vehType","_vehLoc","_vehLoot","_numDriverGroups","_driverBehaviour","_driverTypes","_driverOptions","_vehCrew",
        "_numTroopGroups","_troopBehaviour","_troopTypes","_troopOptions","_vehicles","_vehDamage"];  
        _convoy = _x;
        _vehdat = _convoy select 0; // vehicle definitions block
        _driverdat = _convoy select 1;  // driver def block
        _troopdat = _convoy select 2; // troop def block
        _vehicles = [];
        _vehType = [];
        _vehLoc = [];
        _vehLoot = [];
        _vehDamage = [];
        _vehCrew = [];
        _driverBehaviour = [];
        _driverTypes = [];
        _driverOptions = [];
        _troopBehaviour = [];
        _troopTypes = [];
        _troopOptions = [];
        // Parse the Vehicle Data Block!
        _numVeh = 0;
        _ebk= "Vehicle Data: Vehicle ";
        {
            if (TypeName (_x select 0) == "ARRAY") then
            {
                _vehType set [ _numVeh , (_x select 0) call BIS_fnc_selectRandom ];
            }else
            {
                _vehType set [ _numVeh, _x select 0];
            };
            _vehLoc set [_numVeh, _x select 1];
            _vehCrew set [_numVeh, _x select 2];
            _vehLoot set [_numVeh, _x select 3];	
           // diag_log format ["<FuMS> SpawnVehicle: %1:%2 ",count _x, _x];
            if (count _x > 4) then
            {
                _vehDamage set [_numVeh, _x select 4];
            } else
            { 
                _vehDamage set [_numVeh, []];
            };
            _numVeh = _numVeh + 1;				
        }foreach _vehdat;      
        _numDriverGroups = 0;
        _ebk="Driver Data: Driver ";
        {          
            _driverBehaviour set [_numDriverGroups, _x select 0];
            _driverTypes set [_numDriverGroups, _x select 1]; // array of [[x,name],[x,name]]
            _driverOptions set [_numDriverGroups, _x select 2];        
            _numDriverGroups = _numDriverGroups + 1;
        }foreach _driverdat;      
        _numTroopGroups = 0;
        _ebk="Troop Data: Troops ";
        {         
            _numTroopGroups = _numTroopGroups + 1;
        }foreach _troopdat;      
        
        //Data format checks out! Time to make some vehicles.	
        private ["_vehicles","_drivers","_troops","_driverIndividual","_numdrivers","_i","_silentCheckIn"];
        _vehicles = [];			
        _drivers = [];
        _troops = [];
        _driverIndividual = []; //list of each individual driver's patrol logic.
        _numdrivers = 0;
        // find 'state' for each vehicle based upon driver's AI logic.
        
        //**************************
        //**************************
        //attempt to create drivers before vehicles to see if this fixes issue!
        _silentCheckIn = (((FuMS_THEMEDATA select _themeIndex) select 3) select 0) select 1;
        _driverGroup = [_driverdat, _eCenter, _encounterSize, [_themeIndex,_generation,_offspringID],_silentCheckIn, _missionName] call FuMS_fnc_HC_MsnCtrl_Spawn_SpawnGroup;   
		//diag_log format ["<FuMS:%1 SpawnVehicle: _driverGroup:%2",FuMS_Version,_driverGroup];		
        
        
        for [{_i=0},{_i < _numDriverGroups},{_i=_i+1}] do
        {            
            private ["_curList","_ii","_logic"];          
            {
                // _x should be [#,name]       
                for [{_ii=_numdrivers},{_ii<(_x select 0)+_numdrivers},{_ii=_ii+1}] do
                {
                    _logic = (_driverOptions select _i);
                    _driverIndividual set [_ii, _logic];
                };
                _numdrivers = _numdrivers +( _x select 0);
            }foreach (_driverTypes select _i);       
        };       
        for [{_i=0},{_i < _numVeh},{_i=_i+1}] do
        {
            private ["_mode","_pos","_data","_driver","_veh","_loot","_damage","_var"];
            // create the vehicle
            //_overwater = surfaceIsWater _pos;
            _mode = "";
            _pos = [_eCenter, _vehLoc select _i] call FuMS_fnc_HC_MsnCtrl_Util_XPos;
            _driver = "none";
            if (_i < _numdrivers) then {_driver = _driverIndividual select _i;};
            _data = [_pos, _driver, _vehType select _i] call FuMS_fnc_HC_MsnCtrl_Util_GetSafeSpawnVehPos;	
            diag_log format ["<FuMS> SpawnVehicle: Creating a Vehicle: mission:%5, pos:%1, driver:%2, type:%3 data:%4",_pos, _driver, _vehType select _i,_data,_missionName];
            _veh = [ _vehType select _i, _data select 0, [], 0 , _data select 1] call FuMS_fnc_HC_Util_HC_CreateVehicle;	
            _veh setVariable ["FuMS_LINEAGE",_msnTag, false];
			{_veh deleteVehicleCrew _x} forEach crew _veh;
			_veh setUnloadInCombat [true, true];
            
            if (_veh iskindof "StaticWeapon") then
            {
             //   diag_log format ["<FuMS:%1 SpawnVehicle: Setting staticWeapon %2 to face %3",FuMS_Version,_veh,(_vehCrew select _i) select 0];
                _veh setDir ((_vehCrew select _i) select 0);
            };
            // install its loot if any!
            _loot = toupper (_vehLoot select _i);
            if ( _loot != "NONE") then
            {
                _veh = [_loot, _veh, _themeIndex] call FuMS_fnc_HC_Loot_FillLoot;
            };
            _damage = _vehDamage select _i;
           // diag_log format ["<FuMS> SpawnVehicle: damage options:%1",_damage];
            if (count _damage > 0) then
            {                
                _var = _damage select 0; 
                if (TypeName _var == "SCALAR") then
                { 
                    _veh setDamage _var;
                }
                else
                {    
                 //   diag_log format ["<FuMS> SpawnVehicle: %1 _damage:%2",count _damage, _damage];
                    {
                     //   diag_log format ["<FuMS> SpawnVehicle: %2 damage options:%1",_x,_veh];   
                        _veh setHitPointDamage [format ["hit%1",_x select 0], _x select 1];
                    }foreach _damage;
                };
            };
            _vehicles = _vehicles + [_veh];
        };
        
        //diag_log format ["##SpawnVehicle: _silentCheckIn: %1", _silentCheckIn];
     //   _driverGroup = [_driverdat, _eCenter, _encounterSize, _themeIndex,_silentCheckIn, _missionName] call FuMS_fnc_HC_MsnCtrl_Spawn_SpawnGroup;    
        //_driverGroup is a LIST of groups, even if it only contained 1 group. 
        _drivers=[];
        {
            _drivers = _drivers + units _x;
            _groups = _groups + [_x];
        }foreach _driverGroup;
              
        for [{_i=0},{_i < count _drivers},{_i=_i+1}] do
        { 
            private ["_var"];
            if ((_vehicles select _i) isKindOf "StaticWeapon") then
            {
                (_drivers select _i) moveinGunner (_vehicles select _i);
            } else
            { 
                //diag_log format ["<FuMS> SpawnVehicle: Current Driver of %1 is %2", _vehicles select _i, driver (_vehicles select _i)];
                if (_vehtype select _i in FuMS_UnMannedVehicles )then
                {
                    createVehicleCrew (_vehicles select _i);
                  //  diag_log format ["<FuMS> SpawnVehicle: UGV:Driver=%1 Group=%2", driver (_vehicles select _i), group (driver (_vehicles select _i))];
                    (crew (_vehicles select _i)) joinSilent (_driverGroup select 0);
                  //  diag_log format ["<FuMS> SpawnVehilce: UGV:Driver=%1 Group=%2", driver (_vehicles select _i), group (driver (_vehicles select _i))];
                    _oldDriver = _drivers select _i;
                    _newDriver = driver (_vehicles select _i);
                    _newDriver setVariable ["FuMS_LINEAGE",_msnTag, false];
                    _drivers set [_i, _newDriver];
                    deleteVehicle _oldDriver;
                   // diag_log format ["<FuMS> SpawnVehicle: Driver's waypoints: %1", waypoints  ( group (driver (_vehicles select _i)))];
                   // diag_log format ["<FuMS> SpawnVehicle: Driver istypeof %1", typeof (_newDriver)];
                   
                    (group _newDriver) setBehaviour "COMBAT";
                    // diag_log format ["<FuMS> SpawnVehicle: CombatMode:%1 Behaviour:%2", combatMode (group _newDriver), behaviour _newDriver];
                    
                }else
                {
                  //  diag_log format ["<FuMS> SpawnVehicle: moving %1 into %2",_drivers select _i, _vehicles select _i];
                    (_drivers select _i) moveinDriver (_vehicles select _i);
                //   diag_log format ["<FuMS> SpawnVehicle: New Driver of %1 is %2", _vehicles select _i, driver (_vehicles select _i)];
                      // need to update driver's spawn loc with the spawn loc of this vehicle!
                    _var = (_drivers select _i) getVariable "FuMS_AILOGIC";
                    _var set [2,getPos (_vehicles select _i)];
                    (_drivers select _i) setVariable ["FuMS_AILOGIC",_var,false];
                    [_drivers select _i, _vehicles select _i] spawn 
                    {
                        while {alive (_this select 0)} do 
                        {
                            (_this select 1) setFuel 1;
                            sleep 180;
                        };                      
                    };
                };
            };
          
            
            // move new 'VehStuck' code to actual AI creation.
            // new code monintors for 'driver' status then starts proper 'stuck' portions
            /*
            if (! ( (_vehicles select _i) isKindOf "Air") ) then
			{
				//[_drivers select _i] execVM "HC\Encounters\AI_Logic\VehStuck.sqf";
				[_drivers select _i] spawn FuMS_fnc_HC_AI_Logic_VehStuck;
			};
            */
        };              
        // create and load up the CREW!	
        //diag_log format ["<FuMS:%1> SpawnVehicle: Building Crew: %2",FuMS_Version,_vehCrew];
        for [{_i=0},{_i < count _vehCrew},{_i=_i+1}] do
        {
            private ["_crewData"]; 
           // diag_log format ["<FuMS:%1> SpawnVehicle: Building Crew: %2",FuMS_Version,_vehCrew select _i];
            _crewData = _vehCrew select _i;  // this is an array of [#,name]  or is [facing]
            if (!isNil "_crewData") then // vehicle has crew!
            {                
                private["_turretsArray","_leader","_crewVeh","_ii"];
                if (count _crewData == 2 ) then
                {
                    _turretsArray =[_vehicles select _i] call FuMS_fnc_HC_Util_KKcommonTurrets;
                    //diag_log format ["##SPAWN Vehicles : %1 has %2 turrets", _x select 0, count _turretsArray]; 
                    _crewcount = _crewData select 0;
                    _leader = driver (_vehicles select _i);
                    _crewVeh = _vehicles select _i;
                    for [{_ii =0}, {_ii < _crewcount}, {_ii = _ii+1}] do
                    {
                        if ( count _turretsArray > 0 ) then  // a turret is avail!
                        {    
                            private ["_type","_crew","_boarded"];
                            _boarded=true;
                            _type = _crewData select 1;		
							//diag_log format ["##SPAWN Vehicles : group:%1 | _type:%2 | pos:%3 | theme:%4", (group _leader),_type, (getPos _crewVeh), _themeIndex]; 							
                            _crew = [group _leader,_type, getPos _crewVeh, _themeIndex] call FuMS_fnc_HC_AI_SpawnSoldier;                   
                            _crew setVariable ["FuMS_AILOGIC", _leader getVariable "FuMS_AILOGIC", false];
                            _crew setVariable [ "FuMS_XFILL", _leader getVariable "FuMS_XFILL", false];   
                            _crew setVariable ["FuMS_MSNTAG", _leader getVariable "FuMS_MSNTAG", false];
                            _crew setVariable ["FuMS_LINEAGE",_msnTag, false];
                            [_crew] spawn FuMS_fnc_HC_AI_Logic_AIEvac;
                            //radio chatter only required for group leaders, so only requires init inside SpawnGroup                                                                
                            //_crew assignAsGunner _veh;
                            //_crew moveInTurret [_veh, (_turretsArray select 0)];
                            _boarded = _crew moveInAny (_crewVeh);
                            if (!_boarded) then { deleteVehicle _crew;};
                            _turretsArray = _turretsArray - [_turretsArray select 0];
                        }else
                        {
                            //no turrents left for the crew!
                            diag_log format ["<FuMS:%4> SpawnVehicle: NON-FATAL ERROR: Index:%1/%2 excess crew defined for %3. Vehicle is Full!",_themeIndex,_missionName,_crewVeh,FuMS_Version];	                           
                        };                   
                    };
                };
            };
        }foreach _vehCrew;
        
        // Add Troops
        //   diag_log format ["##Spawn Vehicle : _troopdat:%1",_troopdat];  
        //Obtain the list of troops to be added to the list of vehicles
        _troops = [];
        _troopGroups =  [_troopdat, _eCenter, _encounterSize, [_themeIndex,_generation,_offspringID], true, _missionName] call FuMS_fnc_HC_MsnCtrl_Spawn_SpawnGroup;  // all troops are silent checkin
        {
            _groups = _groups + [_x]; // add the troop groups to the list to be returned by this script.
            {
                _troops = _troops + [_x]; // add each unit within the group for cargo placement!
            }foreach units _x;       
        }foreach _troopGroups;    
        private ["_done","_activeVehicle","_totalCargo"];
        _done = false;
        _totalCargo = 0;
        _masterIndex = 0;
        _numberTroops = count _troops;
        //    diag_log format ["Spawn Vehicle: _numberTroops:%1  for _troops:%2",_numberTroops, _troops]; 
        //    diag_log format ["Spawn Vehicle: adding troops to %1 vehicles",count _vehicles];
        {
            private ["_i","_numCargo","_numCommander","_numDriver","_numGunner","_turretsArray"];
            _numCargo = _x emptyPositions "Cargo";
            _totalCargo = _totalCargo + _numCargo;
            // _numCommander = _x emptyPositions "Commander";
            // _numDriver = _x emptyPositions "Driver";
            // _numGunner = _x emptyPositions "Gunner";
          //    diag_log format ["Spawn Vehicle: Cargo:%1 CMD:%2 Driver:%3 Gunner:%4:%5",_numCargo, _numCommander, _numDriver, _numGunner, _x];      
            // Fill vehicle's cargo
            for [{_i = 0}, {_i < _numCargo},{ _i=_i+1}] do
            {
                if (_masterIndex == _numberTroops) then {_i=_numCargo;}
                else
                {
                    //diag_log format ["Spawn Vehicle: Adding %1 to %2",_troops select _masterIndex, _x];
                    //(_troops select _masterIndex) assignAsCargo _x;
                    (_troops select _masterIndex) moveInCargo _x;                    
                    _masterIndex = _masterIndex + 1;
                };
            };        
            _totalvehicles = _totalvehicles + [_x];
        } foreach _vehicles;
        if (_numberTroops > _totalCargo) then {diag_log format ["##SpawnVehicle: NON-FATAL ERROR: Index:%1/%2 excess cargo defined %3 men left w/o transport. Vehicle is Full!",_themeIndex,_missionName,_totalCargo-_numberTroops];};				
    }foreach _vehicleData;
};
if (_abort) then
{
    diag_log format ["-------------------------------------------------------------------------------------"];
    diag_log format ["----------------            Fulcrum Mission System                    -----------------"];
    diag_log format ["-------------------------------------------------------------------------------------"];
    diag_log format ["##FuMsnInit: ERROR in Fulcrum Mission Data!"];
    diag_log format ["    Recommend verifying data in \FuMS\Themes\%1\%2.sqf on your server!",((FuMS_THEMEDATA select _themeIndex) select 0) select 0   ,_missionName];        
    diag_log format ["             -ABORT- -ABORT- -FORMAT ERROR- -ABORT- -ABORT-"];   
    diag_log format ["                           Vehicle Creation for this mission offline....."];
    diag_log format ["REASON: %1",_msg];
    diag_log format ["  Check your HC's .rpt file for other possible details!"];
    diag_log format ["-------------------------------------------------------------------------------------"];
    diag_log format ["-------------------------------------------------------------------------------------"];        
};
_returnval = [_groups, _totalvehicles];
_returnval
