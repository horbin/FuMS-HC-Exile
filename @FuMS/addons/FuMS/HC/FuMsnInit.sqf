//FuMsnInit.sqf
// Horbin
// 1/8/15
// Main Initialization for Fulcrum Mission System
// If on the headless client
if !(hasInterface) then
{   
    private ["_serverOptions","_themeNumber","_radchat","_i","_abort","_msg","_dat","_dat2"];  
	
    diag_log format ["<FuMS> FuMsnInit: Script Transfer complete: FuMS Initializing!"];     

	"FuMS_StartPlayerEncounterHC" addpublicVariableEventHandler
	{
		_data = _this select 1;
		_player = _data  select 0;
		_playerID = _data select 1;
				
		_ownerActive = _player getVariable "FuMS_PlayerWatch";		
		if (!isNil "_ownerActive") then
		{
			// SANITY CHECKS - does player already have a personal encounter active?
			if (!_ownerActive) then			
			{		
				[_player, _playerID] spawn FuMS_fnc_HC_MsnCtrl_PlayerWatchControlLoop;
			};
		}else
		{
			[_player, _playerID] spawn FuMS_fnc_HC_MsnCtrl_PlayerWatchControlLoop;
		};
		//diag_log format ["<FuMS> FuMsnInit: %1:%3:Launch PlayerMission = %2",_player, _player getVariable "FuMS_PlayerWatch",_playerID];
	};

    "FuMS_CaptiveAction" addpublicVariableEventHandler 
    {
        _data = _this select 1;
        diag_log format ["<FuMS> FuMsnInit: CaptiveAction: _data:%1",_data];
        // 0 = the unit  1=the player, 2=the action    
        if (_data select 2 == "Everyone Out!") then
        {
            // action attached to the vehicle captives are in.
            _crew = crew vehicle (_data select 0);
            diag_log format ["<FuMS> FuMsnInit: CaptiveAction: Vehicle: %2 _crew: %1",_crew,vehicle (_data select 0)];
            {
                private ["_var"];
                _var = _x getVariable "FuMS_CaptiveAction";
                if (!isNil "_var") then
                {                 							
                    if (_x != vehicle _x) then
                    {
                        _x setVariable ["FuMS_CaptiveAction",["Everyone Out!",_data select 1]];
                    };                    
                };
            }foreach _crew;
        }else
        {
            (_data select 0) setVariable ["FuMS_CaptiveAction",[_data select 2, _data select 1]];
        };
        // CaptiveAction is [ action , player ] pair!
        //diag_log format ["<FuMS> FuMsnInit: PVEH CaptiveAction %1 set",_data];
    };
    
    //ASSERT BaseServer, BaseLoot, and BaseSoldier data now on HC  
     if (!isServer) then
    {
        FuMS_THEMEDATA = FuMS_BaseTHEMEDATA;
        FuMS_LOOTDATA = FuMS_BaseLOOTDATA;
       FuMS_SOLDIERDATA = FuMS_BaseSOLDIERDATA;
        FuMS_ListofMissions = FuMS_BaseListofMissions;
        FuMS_ThemeControlID = FuMS_HCThemeControlID;
       // FuMS_BaseTHEMEDATA = [];
       // FuMS_BaseLOOTDATA = [];
       // FuMS_BaseSOLDIERDATA = [];
       // FuMS_BaseListofMissions = [];
       // diag_log format ["<FuMS> FuMsnInit: ThemeData: %1",FuMS_THEMEDATA];
       // diag_log format ["<FuMS> FuMsnInit: ListofMissions: %1", FuMS_ListofMissions];
    };
    //ASSERT ServerData, THEMEDATA, LOOTDATA,SOLDIERDATA fully initialized at this point!   
       
    FuMS_ZnDs = isClass(configFile>>"CfgPatches">>"ryanzombies");
    diag_log format ["<FuMS> FuMsnInit: FuMS_ZnDs = %1",FuMS_ZnDs]; 
    
        [] call FuMS_fnc_HC_Menus_initHCMenus;
    // init admin xxxxHCID vars, and add mission spawnining PVEH.
    
    _abort = false;
    _msg = "";    
    while {true} do
    {
        if([] call FuMS_fnc_HC_Val_ValidateServerData) exitWith {_abort=true;};
        _serverOptions = FuMS_ServerData select 0;
        // Change these to match your specific map!!!
        //Altis specific
        [] call FuMS_fnc_HC_Util_GetWorldInfo;
        //FuMS_MapCenter = _serverOptions select 0;
        //FuMS_MapRange = _serverOptions select 1;
        //FuMS_AdminControlsEnabled = _serverOptions select 2; <-- no set and passed as PV in LoadCommonData.
        // areas to not spawn encounters, if location being randomly generated.
        //FuMS_BlackList = FuMS_ServerData select 1;
       // FuMS_Defaultpos = FuMS_ServerData select 2;
        FuMS_ActiveThemes = FuMS_ServerData select 3; // array of theme names. Used to locate the theme's mission folder.
        // Configure RadioChatter module  See /Basic/ThemeData.sqf for details for more options!
        _radchat = FuMS_ServerData select 4;
   //     FuMS_RC_EnableRadioChatterSystem = _radchat select 0;
   //     FuMS_RC_EnableRadioAudio = _radchat select 1;
   //     publicVariable "FuMS_RC_EnableRadioAudio";
   //     FuMS_RC_RadioRequired = _radchat select 2;
   //     FuMS_RC_RadioFollowTheme = _radchat select 3;
  //      FuMS_RC_EnableAIChatter = _radchat select 4;
  //      FuMS_RC_AIRadioRange = _radchat select 5;
   //     FuMS_RC_REINFORCEMENTS = []; // used in LogicBomb to detect when a group calls for help and BaseOps approves assistance!    
   //     FuMS_RadioChannel = [];
        
         // Soldier Defaults               
        _dat = FuMS_ServerData select 5;
        FuMS_SoldierMagCount_Rifle = _dat select 0;
        FuMS_SoldierMagCount_Pistol = _dat select 1;
        FuMS_SoldierVCOM_Driving = _dat select 2;  
        FuMS_SoldierSkillsOverride = _dat select 3;
        FuMS_SoldierOnlyItems = _dat select 4;
        // Loot Defaults
        _dat = FuMS_ServerData select 6;
        FuMS_LootBoxTime = _dat select 0;
        _dat2 = _dat select 1;
        FuMS_LootSmoke = _dat2 select 0;
        FuMS_SmokeProximity = _dat2 select 1;
        FuMS_SmokeColors = _dat2 select 2;
        FuMS_SmokeDuration = _dat2 select 3;
        
        FuMS_LootSaveVehicle = _dat select 2;
        FuMS_STORAGE	= _dat select 3;
        FuMS_AIONLYVehicles = _dat select 4;
        
        // FuMS_Raptors = true;
        
        //FuMS_GlobalDataIndex = count FuMS_ThemeData; <-- set and broadcast by server!
        if([] call FuMS_fnc_HC_Val_ValidateThemeData) exitWith {_abort=true;};                    
        if([] call FuMS_fnc_HC_Val_ValidateLootData) exitWith {_abort=true;};                
        if([] call FuMS_fnc_HC_Val_ValidateSoldierData) exitWith {_abort=true;};   
        
        if([] call FuMS_fnc_HC_Val_ValidateMissionData) exitWith {_abort=true;};
        if (true) exitWith{};
    };
    if (_abort) exitWith {diag_log format ["<FuMS> FuMsnInit ############FuMS OFFLINE####################"];};
    
    //FuMS_GlobalDataIndex = (count FuMS_ActiveThemes);
    if (FuMS_AdminControlsEnabled) then
    {     
        private ["_slot","_onOff","_spawnLoc"];
        FuMS_ThemeControlID = FuMS_HCThemeControlID;
         _slot = FuMS_ThemeControlID;
        _onOff =[];
        _spawnLoc=[];                  
        for [{_i=0},{_i < count FuMS_ActiveThemes},{_i=_i+1}] do
        {               
            _onOff set [_i, (((FuMS_THEMEDATA select _i )select 0 ) select 5)];
            _spawnLoc set [_i, []];          
        };      
        missionNameSpace setVariable [format["FuMS_AdminActiveThemes%1",_slot],FuMS_ActiveThemes];
        missionNameSpace setVariable [format["FuMS_AdminActiveThemesHC%1",_slot],FuMS_ActiveThemes];
        missionNameSpace setVariable [format["FuMS_AdminThemeOn%1",_slot],_onOff];
        missionNameSpace setVariable [format["FuMS_AdminThemeSpawnLoc%1",_slot],_spawnLoc];
        
        if (!isServer) then
        {
            FuMS_AdminUpdateData = [FuMS_ThemeControlID, "AdminActiveThemes", FuMS_ActiveThemes];
            publicVariableServer "FuMS_AdminUpdateData";
            
            FuMS_AdminUpdateData = [FuMS_ThemeControlID, "AdminActiveThemesHC", FuMS_ActiveThemes];
            publicVariableServer "FuMS_AdminUpdateData";
            
            FuMS_AdminUpdateData = [FuMS_ThemeControlID, "AdminThemeOn", _onOff];
            publicVariableServer "FuMS_AdminUpdateData";
            
            FuMS_AdminUpdateData = [FuMS_ThemeControlID, "AdminThemeSpawnLoc",_spawnLoc];
            publicVariableServer "FuMS_AdminUpdateData";                 
        };
        diag_log format ["<FuMS> FuMsnInit: Admin On: %1",FuMS_AdminControlsEnabled];        
       // diag_log format ["##FuMsnInit: Theme is on: %1",FuMS_AdminThemeOn];
        //diag_log format ["##FuMsnInit: Theme spawn locs: %1",FuMS_AdminThemeSpawnLoc];
    };
    
   // diag_log format ["<FuMS> FuMsnInit: ServerData:%1",FuMS_ServerData];
    //diag_log format ["<FuMS> FuMsnInit: Indx:%2:GlobalLootData %1", FuMS_LOOTDATA select FuMS_GlobalDataIndex, FuMS_GlobalDataIndex];
    //diag_log format ["<FuMS> FuMsnInit: Indx:%2:GlobalSoldierData %1", FuMS_SOLDIERDATA select FuMS_GlobalDataIndex,FuMS_GlobalDataIndex];
   // diag_log format ["<FuMS> FuMsnInit: #%2:ActiveThemes: %1",FuMS_ActiveThemes, count FuMS_ActiveThemes];          
   // diag_log format ["<FuMS> FuMsnInit: #%2:THEMEDATA:%1",FuMS_THEMEDATA, count FuMS_THEMEDATA]; 
    //diag_log format ["<FuMS> FuMsnInit: #%2:LOOTDATA:%1", FuMS_LOOTDATA, count FuMS_LOOTDATA];
   // diag_log format ["<FuMS> FuMsnInit: #%2:SOLDIERDATA:%1", FuMS_SOLDIERDATA, count FuMS_SOLDIERDATA];
            
    // Identify major areas on the map.
    FuMS_VillageList = nearestLocations [FuMS_MapCenter, ["NameVillage"], 30000];
    FuMS_CityList =nearestLocations [FuMS_MapCenter, ["NameCity"], 30000];
    FuMS_CapitalList = nearestLocations [FuMS_MapCenter, ["NameCityCapital"], 30000];
    FuMS_MarineList = nearestLocations [FuMS_MapCenter, ["NameMarine"], 30000];
    FuMS_DefinedMapLocations = FuMS_VillageList+FuMS_CityList+FuMS_CapitalList+FuMS_MarineList;

	FuMS_HillList = nearestLocations [FuMS_MapCenter, ["Hill"], 30000];
	FuMS_MountList = nearestLocations [FuMS_MapCenter, ["Mount"], 30000];
	FuMS_NameLocalList = (nearestLocations [FuMS_MapCenter, ["NameLocal"], 30000]) - FuMS_DefinedMapLocations;
	diag_log format ["##Init(NameLocal): %1",FuMS_NameLocalList];
	{
		diag_log format ["##Init(NameLocal: %1",text _x];
	}forEach FuMS_NameLocalList;
	//FuMS_NameLocalList = FuMS_NameLocalList - FuMS_DefinedMapLocations;
	FuMS_ChurchList = nearestTerrainObjects [FuMS_MapCenter, ["CHURCH"], 30000,false];
	FuMS_ChapelList = nearestTerrainObjects [FuMS_MapCenter, ["CHAPEL"], 30000,false];
	FuMS_BunkerList = nearestTerrainObjects [FuMS_MapCenter, ["BUNKER"], 30000,false];
	FuMS_ViewTowerList = nearestTerrainObjects [FuMS_MapCenter, ["VIEW-TOWER"], 30000,false];
	FuMS_HospitalList = nearestTerrainObjects [FuMS_MapCenter, ["HOSPITAL"], 30000,false];
	FuMS_FountainList = nearestTerrainObjects [FuMS_MapCenter, ["FOUNTAIN"], 30000,false];
	FuMS_GasStationList = nearestTerrainObjects [FuMS_MapCenter, ["FUELSTATION"], 30000,false];
	FuMS_TransmitterList = nearestTerrainObjects [FuMS_MapCenter, ["TRANSMITTER"], 30000,false];
	FuMS_WaterTowerList = nearestTerrainObjects [FuMS_MapCenter, ["WATERTOWER"], 30000,false];
	FuMS_ShipwreckList = nearestTerrainObjects [FuMS_MapCenter, ["SHIPWRECK"], 30000,false];
	FuMS_IndustrialList = nearestTerrainObjects [FuMS_MapCenter, ["STACK"], 30000,false];
	FuMS_BusStopList = nearestTerrainObjects [FuMS_MapCenter, ["BUSSTOP"], 30000,false];
	FuMS_PowerWindList = nearestTerrainObjects [FuMS_MapCenter, ["POWERWIND"], 30000,false];
	FuMS_PowerSolarList = nearestTerrainObjects [FuMS_MapCenter, ["POWERSOLAR"], 30000,false];
	FuMS_PowerWaveList = nearestTerrainObjects [FuMS_MapCenter, ["POWERWAVE"], 30000,false];
	
    
 /*   _testlocations = nearestLocations [FuMS_MapCenter, ["NameMarine"], 30000];
    {
         //plot the waypoint on the map.
        
        _mrkrname = format ["%1", _x];
        _tstmrk = createMarker [_mrkrname, [0,0]];
        _mrkrname setMarkerPos locationPosition _x;
        _mrkrname setMarkerAlpha 1;
        _mrkrname setMarkerType "mil_dot";
        _mrkrname setMarkerText _mrkrname;
        publicVariable _mrkrname;  
        
        
    }foreach _testlocations;
*/    
    
   // {
    //    private ["_name"];
   //     _name = (text _x);
        //diag_log format ["## FuMsnInit: Urban area Located: %1",_name];
    //}foreach ( FuMS_DefinedMapLocations);    
    // Based upon the list of themes in 'ActiveThemes' the below arrays will be populated.
    // and a control loop started for each theme.     
       FuMS_PhaseMsnID = 0;  // gets incremented every time a phased mission is launched.
       // Each mission launched from another mission increments PhaseMsnID and the phase mission is assigned the value as its ID.
       // This ID is then used to reference the below array from parent missions.
       FuMS_PhaseMsn = []; //Array
       FuMS_BodyCount = []; //Array containing number of AI killed under the current running mission. 
       FuMS_Trigger_ZupaCapture = []; // Array containing 'flag capture' status for all points spawned in a theme.
      
       //Phased missions contribute to the parent mission's total and are not calculated separately.    
       //Initialize ALL data before starting Theme Control Loops to permit global data to be fully initialized.      
       FuMS_ActiveMissions = []; // used by Admin Tools for tracking/killing missions
       // inits globavariables with suffix equal to this HC's ownerID - these used in DataCleanup.
       FuMS_MissionTerritory = []; // used in deconfliction of spawn locations to prevent random loc spawn missions from dropping ontop of current missions.
       //  ["position",eCenter,radius,"mission:Theme"]
       [] call FuMS_fnc_HC_Util_HC_InitHCVariables;                 
         
    // Start AI RadioChatter Operations Center. Done before control loops to permit error checking on RadioChatter data.    
   //    [] spawn FuMS_fnc_HC_AI_RC_BaseOps;
       // Start any other addons here!
       if (FuMS_SoldierVCOM_Driving) then
       {
           [] execVM "HC\VCOM_Driving\init.sqf";
           diag_log format ["<FuMS> FuMsnInit: Genesis92x VCOM_Driving V1.20 Initialized."];
       };   
       
	   FuMS_Mission_is_Starting = false; // used in loop control to prevent server lag out on mission starts
	   FuMS_ServerFPS = 3; // init it here to prevent any 'undefined' errors in the event the HC references the variable before the 1st time the server updates it to the HC.
	   //FuMS_ServerFPS -- this is passed to HC by Server every second.
	   
  //     FuMS_RoamingZombieGroup = createGroup east;
    //   FuMS_RoamingZombieGroup setCombatMode "CARELESS";
    //   FuMS_RoamingZombieGroup setSpeedMode "LIMITED";
  //     diag_log format ["<FuMS> Zombies/init.sqf Zombie Groups initialized!"];
   //    FuMS_AttackingZombieGroup = createGroup east;
   //    FuMS_AttackingZombieGroup setCombatMode "CARELESS";
   //    FuMS_AttackingZombieGroup setSpeedMode "FULL";
    //   ["AIGroups",FuMS_RoamingZombieGroup] call FuMS_fnc_HC_Util_HC_AddObject;
    //   ["AIGroups",FuMS_AttackingZombieGroup] call FuMS_fnc_HC_Util_HC_AddObject;
       
      // _hold = spawn FuMS_fnc_HC_Zombies_Init;
      // waitUntil {ScriptDone _hold};
       // end custom addons
       //sleep 3;    
        //Tell HeartMonitor to start watching, HC done loading/initing and ready to start theme control loops!
       diag_log format ["<FuMS> FuMsnInit:  Heart Beat Started for %1. using slot# %2.", player, FuMS_HC_SlotNumber];
       private ["_prefix","_var"];
       _prefix = "FuMS_HC_isAlive";
       _var = format ["%1%2",_prefix, FuMS_HC_SlotNumber];
       missionNamespace setVariable [_var, true];
       if (!isServer) then
       {
           [_var] spawn
           {
               _var = _this select 0;
               while {true} do
               {
                   uisleep 2;
                   //diag_log format ["<FuMS> FuMsnInit: Heart Beat Pulse: %1 = %2",_var, missionNamespace getVariable _var];
                   publicVariableServer _var; 
               };
           };       
       };
  
       if (!isServer) then
       {
           player forceAddUniform "U_C_Driver_1_white"; 
           player addHeadgear "H_RacingHelmet_1_white_F";   
       };
       
       _themeNumber = 0;
       {
           private ["_themeData","_fault"];
        _fault = false;
        _themeData = FuMS_THEMEDATA select _themeNumber;
        if (!isNil "_themeData") then
        {
            waituntil {diag_fps >FuMS_FPSMinimum};
          //  [_x, _themeNumber ] execVM "HC\Encounters\ControlLoop.sqf";
		  [_x, _themeNumber] spawn FuMS_fnc_HC_MsnCtrl_ControlLoop;
        //    diag_log format ["*********************************************************************"];
         //   diag_log format ["*********************************************************************"];
        //    diag_log format ["<FuMS> FUMSN Init: Fulcrum Mission System control loops starting for %1 at index %2.", _x, _themeNumber];    
         //   diag_log format ["*********************************************************************"];
         //   diag_log format ["*********************************************************************"];
            sleep 5; //pause for 5 secs to permit this control loop to init, and launch its 1st mission.                        
            _themeNumber = _themeNumber + 1;
        };
    }foreach FuMS_ActiveThemes;                 
};



