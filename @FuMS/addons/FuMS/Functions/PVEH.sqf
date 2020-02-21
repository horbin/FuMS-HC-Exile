// PVEH.sqf
// Horbin
// 2/28/15
// Collection of Server side PVEH's.

FuMS_SendExileMessage = compile preprocessFileLineNumbers "\FuMS\Functions\SendExileMessage.sqf";
FuMS_RespectUpdate = compile preprocessFileLineNumbers "\FuMS\Functions\RespectUpdate.sqf";

_usingExile = true;
// NOTE: This may break if multiple HC's are in use. Or it will use the last HC that connects as the source for spawning playerwatch missions
"FuMS_StartPlayerEncounter" addPublicVariableEventHandler
{
	if (FuMS_PlayerWatch_Enable) then
	{
		_player = _this select 1;
		_playerID = owner _player;
		FuMS_StartPlayerEncounterHC = [_player, _playerID];
		FuMS_HC_SlotNumber publicVariableClient "FuMS_StartPlayerEncounterHC";
		diag_log format ["<FuMS> PVEH: %1:%2 starting a personal mission",_player, _playerID];
	};
};

"FuMS_ThrowIt" addPublicVariableEventHandler
{
  _data = _this select 1;
  _object = _data select 0;
  _airpos = _data select 1;
  _vel = _data select 2;
  
  if (owner _object != 0) then
  {
	FuMS_ThrowIt = [_object,_airpos,_vel];
	(owner _object) publicVariableClient "FuMS_ThrowIt";
  }else
  {
	_object setpos _airpos;
	_object setvelocity _vel;
	_object setVectorUp [0,0,-1];
  };  
};

"FuMS_PayPlayer" addPublicVariableEventHandler
{
    _data =    _this select 1; // _data is an array of ["FactionName",amount] pairs.    
    _factionPairs = _data select 0;
    _player = _data select 1;
    _victim = _data select 2;
	_debug = false;
	
	if (_debug) then
	{
		diag_log format ["<FuMS> PVEH PayPlayer: _data: %1",_data];
	};				
    
    _rescue = false;
    if (_player == _victim) then {_rescue=true;};
    
    //[_victim, _player] call ExileServer_Object_Player_event_onMPKilled;
      
    _uid = getplayerUID _player;
    _netID = owner _player;
    {
        _amount = _x select 1;
        _typepayment = _x select 0;
        // _player = _data select 2;                     
        switch (toupper _typepayment) do
        {
            case "TABS":
            {
         
            };
            case "TABSGROUP":
            {
                // get list of players in _player's group
                // convert typepayment to "KRYPTO"
                // for each send the PV.         
            };
            case "RESPECT":
            {
                if (!_rescue) then { [_player, _victim, _player, _amount] call FuMS_RespectUpdate;};
             
            };
            case "RESPECTGROUP":
            {
                //get list of players in _player's group
                // convert payments and send to all group memembers
                if (!_rescue) then
                {
                    {
                        if (_x != _player) then
                        {
                            if (_usingExile) then
							{
								_points = [];
								_points pushBack ["GROUP RESPECT", _amount];
								_playerScore = _x getVariable ["ExileScore",0];
								_playerScore = _playerScore + _amount;
								_x setVariable ["ExileScore", _playerScore];
								format["setAccountScore:%1:%2", _playerScore,GetPlayerUID _x] call ExileServer_system_database_query_fireAndForget;
								[_x, "showFragRequest", [_points] ] call FuMS_sendExileMessage;                            
								_x call ExileServer_object_player_sendStatsUpdate;
							};
                        };
                    }foreach (units (group _player));
                };             
            };
            case "RESCUEGROUP":
            {
                if (_rescue) then
                {
                    {
						if (_usingExile) then
						{
							_points = [];
							_points pushBack ["RESCUE",_amount];
							_playerScore = _x getVariable ["ExileScore",0];
							_playerScore = _playerScore + _amount;
							_x setVariable ["ExileScore", _playerScore];
							
							
							format["setAccountScore:%1:%2", _playerScore,GetPlayerUID _x] call ExileServer_system_database_query_fireAndForget;
							[_x, "showFragRequest", [_points]] call FuMS_sendExileMessage;
							_x call ExileServer_object_player_sendStatsUpdate;
						};
                    }foreach (units (group _player));
                };
            };
            case "RESCUEGROUPTABS":
            {
                if (_rescue) then
                {                   
                    {
                              
                    }foreach (units (group _player));
                };
            };            
            default {(owner _player) publicVariableClient "FuMS_PayPlayer";};
        };
    }foreach _factionPairs;
};

"FuMS_Message" addPublicVariableEventHandler
{
    _data = _this select 1;
    _type = _data select 0;
    _sender = _data select 1;
    _receiver = _data select 2;
    _msg = _data select 3;
	_debug = false;
	if (_debug) then
	{
		diag_log format ["<FuMS> PVEH: Msg passing: %1",_data];
    };
    if ( (format ["%1",_receiver select 0]) == "ALL") exitWith { publicVariable "FuMS_Message";};
    {
        (owner _x) publicVariableClient "FuMS_Message";
    }foreach _receiver;    
};

FuMS_RegisterVehicle_Server =
{
    // for use by non-FuMS addons to register vehicles to keep them from going poof.
  //  [_this select 0] call EPOCH_server_setVToken;
};


"FuMS_RegisterVehicle" addPublicVariableEventHandler
{
    //[_this select 1] spawn FuMS_RegisterVehicle_Server;
    _vehObj = _this select 1;
//    _vehObj call EPOCH_server_setVToken;
};

"FuMS_DataValidation" addPublicVariableEventHandler
{
	_msg = _this select 1;
    diag_log format ["-------------------------------------------------------------------------------------"];
    diag_log format ["----------------            Fulcrum Mission System                    -----------------"];
    diag_log format ["-------------------------------------------------------------------------------------"];   
    diag_log format [" Potential fatal errors in FuMS initialization or mission execution.     "];
    diag_log format ["   check your Headless Client's .rpt for specifics!"];
    diag_log format ["Offending File: %1",_msg];
    diag_log format ["-------------------------------------------------------------------------------------"];
    diag_log format ["-------------------------------------------------------------------------------------"];      
};


FuMS_BuildVehicle_Server =
{
      //        diag_log format ["##HC_HAL: BuildVehicle_HAL fired!"];  
    private ["_vehObj"];
  _vehObj = _this select 0;

    _vehObj setVariable ["FuMS_HCTEMP", "AI", true]; // HCTEMP set to "PLAYER" once a player enters.

  //  _vehObj=createVehicle[_item,_position,[],0,"NONE"];
  //  _vehObj call EPOCH_server_setVToken;
	
    addToRemainsCollector[_vehObj];
    _vehObj disableTIEquipment true;
    clearWeaponCargoGlobal    _vehObj;
    clearMagazineCargoGlobal  _vehObj;
    clearBackpackCargoGlobal  _vehObj;
    clearItemCargoGlobal	  _vehObj;   
        
    _vehObj addEventHandler ["GetIn",
    {
        _vehobj = _this select 0;
        _vehseat = _this select 1;
        _owner = _this select 2;
        _idowner = owner _owner;
        _vehactual = vehicle _vehobj;
        // If it is ID:0, the server, or the HC controlling AI, then no changes required.
        // HC_HAL_ID is a null object after a disconnect or if it is NOT the 1st thing to connect after a reboot...        
       // _hcID =HCHAL_ID;
       // diag_log format ["###EH:GetIn: HC_HAL_Player: %1, _hcID: %2, _owner: %4, _idowner: %3",HC_HAL_Player, _hcID, _idowner, _owner];
        // Any one of the below checks implies _veh owned by AI, not a player.
        if ( (!isPlayer _owner) ) then
        // if (  (_idowner == 0) or (_idowner == _hcID) or (!isPlayer _owner)  ) then
        {
           // diag_log format ["###EH:GetIn:AI DETECTED: %1 ID entered a vehicle: %2",_idowner,_vehobj];
        }else
        {            
			_typeveh = typeOf _vehobj;
			_abort = false;
			{
				if (_typeveh == _x) exitWith
				{
					FuMS_AIONLYVEHICLE = true;
					_idowner publicVariableClient "FuMS_AIONLYVEHICLE";
					_owner action ["getOut", _vehobj];
					_abort = true;
				};
			}foreach FuMS_AIONLYVehicles;
			if (_abort) exitWith {};
		
            //diag_log format ["###EH:GetIn: %1 with ID:%4 entering %2 on %3",_owner, _vehseat, _vehactual, _idowner];
            FuMS_TEMPVEHICLE = true;
            _idowner publicVariableClient "FuMS_TEMPVEHICLE";
            // If a player enters the vehicle, update the HCTEMP, so server will not delete vehicle on  an HC disconnect!
            _value = _vehobj getVariable "FuMS_HCTEMP";
            diag_log format ["<FuMS> PVEH BuildVehicle_server: _value:%1 LootOption:%2",_value, FuMS_GlobalLootOptions select 2];
			if (_value != "PLAYER" and (FuMS_GlobalLootOptions select 2) ) then // make vehicle purchasable, and save it to the Hive!
			{
                
          //      _veh setVariable["LASTLOGOUT_EPOCH",1000000000000];
          //      _veh setVariable["LAST_CHECK",1000000000000];
                // Possibly needed to keep from breaking normal vehicle limits?    
            //    EPOCH_VehicleSlotsLimit = EPOCH_VehicleSlotsLimit + 1;
          //      EPOCH_VehicleSlots pushBack str(EPOCH_VehicleSlotsLimit);
                // Code below is used when a vehicle is 'purchased' off a vendor!
           //     _slot=EPOCH_VehicleSlots select 0;                
          //      _vehObj setVariable["VEHICLE_SLOT",_slot,true];           
                
           //     EPOCH_VehicleSlots=EPOCH_VehicleSlots-[_slot];
           //     EPOCH_VehicleSlotCount=count EPOCH_VehicleSlots;
           //     publicVariable "EPOCH_VehicleSlotCount";
                
               // diag_log format ["<FuMS> PVEH BuildVehicle_Server: Attempting to save %1 to server",_vehObj];
              //  diag_log format ["<FuMS> PVEH BuildVehicle_Server: Vehicle = %1",vehicle _vehObj];
              //  _vehObj call EPOCH_server_setToken;
          //      _vehObj call EPOCH_server_save_vehicle;
              //  _vehObj call EPOCH_server_save_vehicle;
          //      _vehObj call EPOCH_server_vehicleInit;            
                if (FuMS_VehicleZeroAmmo) then {_vehobj setvehicleAmmo 0;};
				
			};
            //diag_log format ["###EH:GetIn: HCTEMP = %1", _value];
            _vehobj setVariable ["FuMS_HCTEMP", "PLAYER", true];
            _vehobj setVariable ["FuMS_Taken", true, true];			
        };       
    }];   

};

"FuMS_BuildVehicle_HC" addPublicVariableEventHandler
{
    [_this select 1] spawn FuMS_BuildVehicle_Server;
};

FuMS_RadioChatter_Server =
{
    private["_data","_msg","_receivers"];
    _data = _this select 0;
    _msg = _data select 0;
    _receivers = _data select 1;
    //diag_log format ["#FuMsnInit: RadioChatter for:%1",_receivers];
    FuMS_RADIOCHATTER = _msg;
    {
        (owner (vehicle _x)) publicVariableClient "FuMS_RADIOCHATTER";
    }foreach _receivers; 
};


"FuMS_RADIOCHATTER_Distro" addPublicVariableEventHandler
{
    [_this select 1] spawn FuMS_RadioChatter_Server;
};


FuMS_HeartMonitor = compile preprocessFileLineNumbers "\FuMS\Functions\HeartMonitor.sqf";
FuMS_InitToken = true;
"FuMS_GetInitToken" addPublicVariableEventHandler
{
    _headlessClient = _this select 1;
   // diag_log format ["<FuMS> GetInitToken PVEH: Heard Request from player:%1 ServerClean=%2",_headlessClient, FuMS_ServerisClean];    
    if (!isNull _headlessClient) then
    {
        if (FuMS_ServerisClean) then
        {
            _hcID = owner _headlessClient;
            if (_hcID != 0) then
            {
                FuMS_ServerisClean = false;                
              //  diag_log format ["<FuMS> GetInitToken PVEH: player:%1 owner id:%2 holds Init Token",_headlessClient, _hcID];    
                _hcID publicVariableClient "FuMS_InitToken";        
            };
        };
    };
};

// invoked by an HC when it connects.
"FuMS_GetHCIndex" addPublicVariableEventHandler
{
    _headlessClient = _this select 1; // set to 'player' object by HC before sending.
    _hcID = owner _headlessClient;    
 //   if (isNil "_hcID") exitWith {diag_log format ["<FuMS> PVEH: Detected HC connection prior to HC completing initialization. No owner ID available. Waiting...."];};
    _prefix = "FuMS_HC_isAlive";
    _var = format ["%1%2",_prefix, _hcID]; 
  //  diag_log format ["<FuMS> GetHCIndex PVEH: player:%1 owner id:%2",_headlessClient, _hcID];    
        
    missionNamespace setVariable [_var, true];
    FuMS_HC_SlotNumber = _hcID; // used to broadcast _hcID back to the HC for variable suffix'ing.
    _hcID publicVariableClient "FuMS_HC_SlotNumber";
    [_headlessClient] spawn FuMS_HeartMonitor;      
};

/*
FuMS_ZombieNoise_Server =
{
    private ["_data","_sound","_zombie","_players"];
    _data = _this select 0;
    _sound = _data select 0;
    _zombie = _data select 1;
    _players = _data select 2;
    diag_log format ["##PVEH %1 is pushing sound %2 to %3",_zombie, _sound, _players];
    {
        FuMS_ZombieNoise = [_sound, _zombie];
        (owner _x) publicVariableClient "FuMS_ZombieNoise";      
        //"FuMS_ZombieNoise" addPublicVariableEventHandler
        publicVariable "FuMS_ZombieNoise";
    }foreach _players;
};

"FuMS_ZombieNoise" addPublicVariableEventHandler
{
    [_this select 1] spawn FuMS_ZombieNoise_Server;    
};
*/

"FuMS_ZupaCaptureServer" addPublicVariableEventHandler
{
    _data = _this select 1;
    _players = _data select 0;
    _timeRemaining = _data select 1;    
    {
        FuMS_ZupaCapture = _timeRemaining;
        (owner _x) publicVariableClient "FuMS_ZupaCapture";
        diag_log format ["<FuMS:%1> PVEH: ZupaCaptureServer: _data:%2 _playerID:%3/%5 _time:%4",FuMS_Version, _data, owner _x,_timeRemaining,_x];
    }foreach _players;
};

"FuMS_CaptiveAction" addPublicVariableEventHandler
{
    _data = _this select 1;
    //_hcID = owner (_data select 0);
    // _data select 0 is the object the 'addaction' menu was attached too.
    // for vehicles the ownership will change and NOT always be the HC!
    // need to identify the AI involved with the action and pass the info off to the HC controlling that AI!
    //
    {
        if (!isplayer _x) exitWith
        {
            _hcID = owner _x;
            _hcID publicVariableClient "FuMS_CaptiveAction";
            diag_log format ["<FuMS> PVEH FuMS_CaptiveAction  %1 passed to HC ID:%2",FuMS_CaptiveAction,_hcID];
        };
    }foreach crew (_data select 0);
  
    
};

"FuMS_SpawnFlamer" addPublicVariableEventHandler
{
	_data = _this select 1;
	diag_log format ["<FuMS> FuMS_SpawnFlamer PVEH Code:  _data:%1",_data];
	
	_markerName = _data select 0;
	_flamerRadius = _data select 1;
	_flamerDamage = _data select 2;
	_flamerHealth = _data select 3;

	null = [_markerName,_flamerRadius,_flamerDamage,_flamerHealth] execVM "AL_flamer\al_flamer.sqf";
  
};

"FuMS_SpawnFarty" addPublicVariableEventHandler
{
	_data = _this select 1;
	diag_log format ["<FuMS> FuMS_SpawnFarty PVEH Code:  _data:%1",_data];
	
	_markerName = _data select 0;
	_class_name = _data select 1;
	_anomalyVSarea = _data select 2;
	_radius = _data select 3;
	_damage_value = _data select 4;
	_farty_trail = _data select 5;
	_random_puddles = _data select 6;

	null = [_markerName,_class_name,_anomalyVSarea,_radius,_damage_value,_farty_trail,_random_puddles] execVM "AL_farty\area_toxic_ini.sqf";
      
};

"FuMS_SpawnFartyPools" addPublicVariableEventHandler
{
	_data = _this select 1;
	diag_log format ["<FuMS> FuMS_SpawnFartyPools PVEH Code:  _data:%1",_data];

	_object_name = _data select 0;
	_puddle_SFX = _data select 1;

	null = [_object_name,_puddle_SFX] execVM "AL_farty\simple_toxic_puddle.sqf";
  
    
};


"FuMS_SpawnScreamer" addPublicVariableEventHandler
{
	_data = _this select 1;

	_markerName = _data select 0;
	
	diag_log format ["<FuMS> FuMS_SpawnScreamer PVEH Code:  _data:%1 : Marker:%2",_data,_markerName];

	null=[_markerName] execvm "AL_screamer\screamer.sqf"
  
    
};

"FuMS_SpawnStrigoi" addPublicVariableEventHandler
{
	_data = _this select 1;
	diag_log format ["<FuMS> FuMS_SpawnStrigoi PVEH Code:  _data:%1",_data];
	
	_strigoiMarker = _data select 0;
	_territory = _data select 1;
	_day_activ = _data select 2;
	_inflicted_damage = _data select 3;
	_hp_strigoi = _data select 4;
	
	// ACTIVE DURING NIGHT AND DAY
	[_strigoiMarker, _territory, _day_activ,_inflicted_damage,_hp_strigoi] execvm "AL_strigoi\strigoi.sqf";
	
};

"FuMS_SpawnSparky" addPublicVariableEventHandler
{
	_data = _this select 1;
	diag_log format ["<FuMS> FuMS_SpawnSparky PVEH Code:  _data:%1",_data];
	
	_sparkyMarker = _data select 0;
	_protection_gear = _data select 1;
	_AI_avoid_sparky = _data select 2;
	
	null = [_sparkyMarker,_protection_gear,_AI_avoid_sparky] execvm "AL_spark\al_sparky.sqf";
	
};

"FuMS_SpawnCrazy" addPublicVariableEventHandler
{
	_data = _this select 1;
	diag_log format ["<FuMS> FuMS_SpawnCrazy PVEH Code:  _data:%1",_data];
	
	_crazyMarker = _data select 0;
	_kamikazeNumber = _data select 1;
	_sound = _data select 2;
	_chasePlayers = _data select 3;
	_triggerDistance = _data select 4;
	
	null = [_crazyMarker,_kamikazeNumber,_sound,_chasePlayers,_triggerDistance]  execvm "AL_crazy\kam_group.sqf";

};


"FuMS_SpawnRads" addPublicVariableEventHandler
{
	_data = _this select 1;
	diag_log format ["<FuMS> FuMS_SpawnRads PVEH Code:  _data:%1",_data];
	
	_obj_rad = _data select 0;
	_rad_radius	= _data select 1;		
	_rad_dam = _data select 2;			
	_rad_prot_equip = _data select 3;	
	_rad_detector = _data select 4;		
	_glowindark	= _data select 5;		
	_timetoglow = _data select 6;		
	_AI_react_rad = _data select 7;
	
	null = [_obj_rad,_rad_radius,_rad_dam,_rad_prot_equip,_rad_detector,_glowindark,_timetoglow,_AI_react_rad]  execvm "AL_radiation\radioactive_object.sqf";

};

"FuMS_SpawnNuke" addPublicVariableEventHandler
{
	_data = _this select 1;
	diag_log format ["<FuMS> FuMS_SpawnNuke PVEH Code:  _data:%1",_data];
	
	_nuke_obj = _data select 0;
	_radius	= _data select 1;		
	_damage_buildings_units = _data select 2;			
	_weather_effect = _data select 3;	
	_radiation = _data select 4;		
	_fallout	= _data select 5;		
	_EMP = _data select 6;
	
	null = [_nuke_obj,_radius,_damage_buildings_units,_weather_effect,_radiation,_fallout,_EMP] execvm "Al_Nuke\alias_nuke.sqf";

};