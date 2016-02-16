//SpawnSoldier.sqf
// Horbin
// 1/11/15
// Inputs: Group, typeSoldier, position, Theme Index
// Outputs: Unit created.
// Input Data format expected:
// 0:"Type", 1:[ 8 numbers], 2:Uniform, 3:Vest, 4:Helmet, 5:Backpack, 6;Rifle, 7:[3 numbers], 
// 8: Pistol,9: [5 numbers beltItems], 10:[3numbers visionItems], 11:[2 Flags],12:[ array of items]
//AddIt = compile preprocessFileLineNumbers "HC\Encounters\Functions\AddIt.sqf";
//GetChoice = compile preprocessFileLineNumbers "HC\Encounters\LogicBomb\GetChoice.sqf";
//AttachMuzzle = compile preprocessFileLineNumbers "HC\Encounters\AI_Logic\AttachMuzzle.sqf";
private ["_group","_type","_pos","_themeIndex","_unit","_typeFound","_aiName","_gear","_flags","_skills","_types","_i","_priweapon","_soldierData","_secweapon"];
_group = _this select 0;
_type = toupper (_this select 1);
_pos = _this select 2;
_themeIndex = _this select 3;

if (((FuMS_THEMEDATA select _themeIndex) select 0) select 4) then
{
   _soldierData = FuMS_SOLDIERDATA select FuMS_GlobalDataIndex;   
}else
{
   _soldierData = FuMS_SOLDIERDATA select _themeIndex;      
};
if (isNil "_soldierData") exitWith
{
    diag_log format ["<FuMS:%2> SpawnSoldier: ERROR: no theme specific SoldierData.sqf for theme #%1",_themeIndex,FuMS_Version];
    diag_log format ["Check options in ThemeData.sqf for theme %1",((FuMS_THEMEDATA select _themeIndex) select 0) select 0];
};

//diag_log format ["<FuMS:%3> SpawnSoldier: Index:%2 _soldierData:%1",_soldierData,_themeIndex,FuMS_Version];
_typeFound = false;
// locate the data for 'type' soldier.
{
    _aiName = toupper (_x select 0);  // type name
    //diag_log format ["<FuMS:%3> SpawnSoldier: _aiName:%1 _type:%2",_type,_aiName,FuMS_Version];
    if (_type == _aiName) then
    {
        _typeFound = true;
        switch (_type) do
        {
            case "RAPTORM";
            case "RAPTORF":
            {
                if (true) then // addon flag disabled, logic left for now.
                {
                    // All combat related AI logic is handled by the Raptors Addon.
                    // Waypoint movement is controlled by FuMS, as though the raptor was a normal soldier
                    if (_type=="RAPTORM") then {_unit = _group createUnit["RaptorAIM1_W", _pos, [], 25, "FORM"]; };
                    if (_type=="RAPTORF") then {_unit = _group createUnit["RaptorAIF2_E", _pos, [], 25, "FORM"]; };
                    // _unit addEventHandler ["killed",{[(_this select 0), (_this select 1)] spawn FuMS_fnc_HC_AI_AIKilled;}];
                }
                else
                {
                    diag_log format ["<FuMS> SpawnSoldier: Request for spawn of Raptors requested and Mod is not enabled!"];
                    diag_log format ["<FuMS> see http://makearmanotwar.com/entry/ec2EDrOCkM#.VT0zFfnF9EK for the mod."];
                    diag_log format ["<FuMS> and FuMS installation instructions for usage."];
                };
            };
            case "ZOMBIE":
            {
                _zombie = ["RyanZombieC_man_1", "RyanZombieC_man_polo_1_F", "RyanZombieC_man_polo_2_F", "RyanZombieC_man_polo_4_F", "RyanZombieC_man_polo_5_F", "RyanZombieC_man_polo_6_F", "RyanZombieC_man_p_fugitive_F", "RyanZombieC_man_w_worker_F", "RyanZombieC_scientist_F", "RyanZombieC_man_hunter_1_F", "RyanZombieC_man_pilot_F", "RyanZombieC_journalist_F", "RyanZombieC_Orestes", "RyanZombieC_Nikos"];                
				if (!FuMS_ZnDs) then {_zombie = "Exile_Unit_Player";};
                _unit = _group createUnit[_zombie call Bis_fnc_selectRandom, _pos, [], 25, "NONE"];    // swap when skins available    
                _unit setVariable ["FuMS_RyanZombieType", "ZOMBIE"];
            };
             case "ZOMBIESOLDIER":
            {               
                _zombieSoldier = ["RyanZombieB_Soldier_02_f", "RyanZombieB_Soldier_02_f_1", "RyanZombieB_Soldier_02_f_1_1", "RyanZombieB_Soldier_03_f", "RyanZombieB_Soldier_03_f_1", "RyanZombieB_Soldier_03_f_1_1", "RyanZombieB_Soldier_04_f", "RyanZombieB_Soldier_04_f_1", "RyanZombieB_Soldier_04_f_1_1", "RyanZombieB_Soldier_lite_F", "RyanZombieB_Soldier_lite_F_1"];                                                
				if (!FuMS_ZnDs) then {_zombieSoldier = "Exile_Unit_Player";};
                _unit = _group createUnit[_zombieSoldier call Bis_fnc_selectRandom, _pos, [], 25, "NONE"];    // swap when skins available    
                _unit setVariable ["FuMS_RyanZombieType", "ZOMBIESOLDIER"];
            };
            case "ZOMBIESPIDER":
            {
                _zombieSpider = ["RyanZombieSpider1", "RyanZombieSpider2", "RyanZombieSpider3", "RyanZombieSpider4", "RyanZombieSpider5", "RyanZombieSpider6", "RyanZombieSpider7", "RyanZombieSpider8", "RyanZombieSpider9", "RyanZombieSpider10", "RyanZombieSpider11", "RyanZombieSpider12", "RyanZombieSpider13", "RyanZombieSpider14"];
				if (!FuMS_ZnDs) then {_zombieSpider = "Exile_Unit_Player";};
                _unit = _group createUnit[_zombieSpider call Bis_fnc_selectRandom, _pos, [], 25, "NONE"];    // swap when skins available    
                _unit setVariable ["FuMS_RyanZombieType", "ZOMBIESPIDER"];
            };
            case "ZOMBIEBOSS":
            {
                _zombieBoss =["RyanZombieboss1", "RyanZombieboss2", "RyanZombieboss3", "RyanZombieboss4", "RyanZombieboss5", "RyanZombieboss6", "RyanZombieboss7", "RyanZombieboss8", "RyanZombieboss9", "RyanZombieboss10", "RyanZombieboss11", "RyanZombieboss12", "RyanZombieboss13", "RyanZombieboss14"];
				if (!FuMS_ZnDs) then {_zombieBoss = "Exile_Unit_Player";};
                _unit = _group createUnit[_zombieBoss call Bis_fnc_selectRandom, _pos, [], 25, "NONE"];    // swap when skins available    
                _unit setVariable ["FuMS_RyanZombieType", "ZOMBIEBOSS"];
            };
            default
            {
                // NOTE if I_Soldier_EPOCH type is changed, AllDeadorGone.sqf will need to be modified
                _unit = _group createUnit["Exile_Unit_Player", _pos, [], 0, "FORM"];
                removeUniform _unit;
                removeHeadgear _unit;
                removeVest _unit;
                removeAllWeapons _unit;
                _unit removeweapon "ItemWatch";
                _unit removeweapon "ItemRadio";
                _unit removeweapon "ItemCompass";
                _unit removeweapon "ItemMap";  
                // Destroys gear for AI killed by AI and handle other stuff
                // ONLY NEEDS TO RUN ON HeadlessClient!
                // If a port to server only occurs, this will possibly need to be modified to MP to support server notifications.           
                _gear = [_x select 2] call FuMS_fnc_HC_Loot_GetChoice;if (_gear != "") then {_unit forceAddUniform _gear;};
                //  if (toupper _type == "ZOMBIE")then { _unit setObjectTextureGlobal [0, "HC\Zombies\zskin.jpg"];};
                _gear = [_x select 3] call FuMS_fnc_HC_Loot_GetChoice;if (_gear != "") then {_unit addVest _gear;};           
                _gear = [_x select 5] call FuMS_fnc_HC_Loot_GetChoice;if (_gear != "") then {_unit addBackpack _gear;};
                // Rifle
                _gear = [_x select 6] call FuMS_fnc_HC_Loot_GetChoice;
                //diag_log format ["##SpawnSoldier: Rifle-gear:%1",_gear];
                _priweapon = "";
                if (TypeName _gear =="ARRAY") then
                {
                    _priweapon = _gear select 0;
                    _unit addWeapon _priweapon;
                    _mag = getArray (configFile >> "CfgWeapons" >> _priweapon >> "magazines") select 0;
                    //   diag_log format ["<FuMS> SpawnSoldier: %1 with %2 has ammo %3",_unit,_priweapon,_mag];
                    _unit addMagazines [ _mag, FuMS_SoldierMagCount_Rifle];
                    // _unit addMagazine [(_gear select 1),_numRifleMags];
                }else
                {
                    if (_gear != "") then
                    {
                        _priweapon= _gear;
                        _unit addWeapon _priweapon;
                        _mag = getArray (configFile >> "CfgWeapons" >> _priweapon >> "magazines") select 0;
                        _unit addMagazines [ _mag, FuMS_SoldierMagCount_Rifle];
                    };
                    
                    // diag_log format ["##SpawnSoldier: Rifle added:%1",_priweapon];
                    //Pistol
                    _secweapon = "";
                    _gear = [_x select 8] call FuMS_fnc_HC_Loot_GetChoice;
                    // diag_log format ["##SpawnSoldier: Pistol-gear:%1",_gear];
                    if (TypeName _gear =="ARRAY") then
                    {
                        _secweapon = _gear select 0;
                        _unit addWeapon _secweapon;
                        _mag = getArray (configFile >> "CfgWeapons" >> _secweapon >> "magazines") select 0;
                        _unit addMagazines [ _mag, FuMS_SoldierMagCount_Pistol];
                        //_unit addMagazine [(_gear select 1),_numPistolMags];
                    }else
                    {
                        if (_gear != "") then
                        {
                            _secweapon= _gear;
                            _unit addWeapon _secweapon;
                            _mag = getArray (configFile >> "CfgWeapons" >> _secweapon >> "magazines") select 0;
                            _unit addMagazines [ _mag, FuMS_SoldierMagCount_Pistol];
                        };
                    };   
                    // Rifle Attachments
                    //diag_log format ["##Starting to add Rifle Attachments!"];
                    
                    _gear = _x select 7;
                    //diag_log format ["##Trying to add Scope:%1 to Primary weapon",(_gear select 0)];
                    if (TypeName (_gear select 0) == "STRING") then { _unit addPrimaryWeaponItem (_gear select 0);};
                    if (TypeName (_gear select 0) == "ARRAY") then { _unit addPrimaryWeaponItem ( (_gear select 0) call BIS_fnc_selectRandom);};
                    if ([_gear select 0] call FuMS_fnc_HC_Loot_AddIt) then{ _unit addPrimaryWeaponItem (FuMS_W_Attachments call BIS_fnc_selectRandom);};  //scopes
                    //diag_log format ["## Trying to add Muzzle:%1 to Primary weapon",(_gear select 1)];
                    if ([_gear select 1] call FuMS_fnc_HC_Loot_AddIt) then
                    { 
                        _muzzle = [_priweapon] call FuMS_fnc_HC_AI_AttachMuzzle;
                        //if (_muzzle != "None") then
                        if (!isNil "_muzzle") then
                        {
                            //  diag_log format ["##SpawnSolder: Adding %1",_muzzle];
                            _unit addPrimaryWeaponItem _muzzle;
                        };
                    };  //muzzle
                    if ([_gear select 2] call FuMS_fnc_HC_Loot_AddIt) then { _unit addPrimaryWeaponItem "acc_flashlight"};  //flashlight                 
                    // Belt Items
                    _gear = _x select 9;
                    if ([_gear select 0] call FuMS_fnc_HC_Loot_AddIt) then {_unit addweapon "ItemMap";};  //Map.
                    if ([_gear select 1] call FuMS_fnc_HC_Loot_AddIt) then {_unit addweapon "ItemCompass";};  //Compass
                    if ([_gear select 3] call FuMS_fnc_HC_Loot_AddIt) then {_unit addweapon "ItemGPS";};  //GPS
                    if ([_gear select 4] call FuMS_fnc_HC_Loot_AddIt) then {_unit addweapon "ItemWatch";};  //Watch
                    if ((_gear select 5) > 0 ) then
                    {
                        // _radio = format ["EpochRadio%1",(_gear select 5)];
                        _unit addweapon "ItemRadio";
                    };  //Radio
                    // Vision items
                    _gear = _x select 10;
                    if ([_gear select 0] call FuMS_fnc_HC_Loot_AddIt) then {_unit addweapon "Binocular";};  //Binoculars
                    if ([_gear select 1] call FuMS_fnc_HC_Loot_AddIt) then {_unit addweapon "Rangefinder";};  //RangeFinders
                    if ([_gear select 2] call FuMS_fnc_HC_Loot_AddIt) then {_unit addweapon "NVGoggles_INDEP"};  //NVGs
                    // Other Equipment     --see below--           
                    // Flags
                    _flags = _x select 11;
                    // in water, so give them scuba gear!
                    if (_flags select 0) then
                    {
                        if (surfaceIsWater _pos) then
                        {
                            _unit forceAddUniform "U_B_Wetsuit" ;
                            _unit addVest "V_RebreatherB";
                            _unit addGoggles "G_Diving";
                        };
                    };
                    // give them unlimited ammo!
                    if (_flags select 1) then
                    {
                        _unit addeventhandler ["fired",
                        {
                            _gunDevice = vehicle (_this select 0); // if in a vehicle and firing, refill vehicle's ammo. _gunDevice is the AI if not in a vehicle.
                            _gunDevice setvehicleammo 1;
                        }];
                    };
                    // give them some RPG's!
                    _rpg = _flags select 2;
                    if (!isNil "_rpg") then
                    {
                        private ["_launcher","_ammo1","_ammo2"];
                        _launcher = "none";
                        _ammo1 = "none";
                        _ammo2 = "none";
                        if (TypeName _rpg == "BOOL") then
                        {
                            if (_rpg) then
                            {
                                _ammo1 = "RPG32_HE_F";
                                _ammo2 = "RPG32_F";
                                _launcher ="launch_RPG32_F";
                            };
                        }
                        else
                        {
                            if (toupper _rpg == "RANDOM") then
                            {
                                _rpg = ["AIR","LAND"] call BIS_fnc_selectRandom;
                            };
                            if (toupper _rpg == "LAND") then
                            {
                                _ammo1 = "RPG32_HE_F";
                                _ammo2 = "RPG32_F";
                                _launcher = "launch_RPG32_F";
                            }else
                            {
                                _ammo1 = "Titan_AA";
                                _ammo2 = "Titan_AA";
                                _launcher = "launch_I_Titan_F";
                            };                
                        };
                        if (_launcher != "none") then
                        {
                            _unit addMagazines [_ammo1, 1];
                            _unit addMagazines [_ammo2, 1];
                            _unit addWeapon _launcher;   
                        }
                    };    
                    _isCaptured = _flags select 3;
                    if (!isNil "_isCaptured") then
                    {
                        if (_isCaptured) then
                        {
                            _unit setCaptive true;
                          //  diag_log format ["<FuMS> SpawnSoldier: Set %1 as a captive:%2",_unit,captive _unit];
                        };
                        //                diag_log format ["<FuMS> SpawnSoldier: Set %1 as a captive:%2",_unit,captive _unit];
                    };
                    // Set skills
                    _skills = _x select 1;
                    _types = ["aimingAccuracy","aimingShake","aimingSpeed","spotDistance","spotTime","courage","reloadSpeed","commanding"];
                    for [ {_i=0},{_i<8},{_i=_i+1}] do
                    { 
                        if (FuMS_SoldierSkillsOverride select _i == 0) then
                        {
                            _unit setSkill [ (_types select _i), (_skills select _i)];
                        }else
                        {
                            _unit setSkill [ (_types select _i), (FuMS_SoldierSkillsOverride select _i)];
                        };
                    };
                    // Set FuMS specific AI Logic
                    [_unit] spawn FuMS_fnc_HC_AI_Logic_VehStuck;
                };  
            }
        };    
        // All AI, Zombies, and Raptors
        _unit addEventHandler ["killed",{[(_this select 0), (_this select 1)] spawn FuMS_fnc_HC_AI_AIKilled;}];
        // Add custom variables     
        _gear = [_x select 4] call FuMS_fnc_HC_Loot_GetChoice;if (_gear != "") then {_unit addHeadgear _gear;};
        _gear = _x select 12;
        //    diag_log format ["##SpawnSoldier: Other Equipment:%1",_gear];
        {  
            private ["_item","_variance","_min","_numitems"];
            //   diag_log format ["##SpawnSoldier: Attempting to add %1", _x];
            _item = [_x select 0] call FuMS_fnc_HC_Loot_GetChoice;
            if (_item != "") then 
             {
                 _variance = _x select 1;
                 _min = _variance select 0;
                 _numItems = _min + floor (random ( (_variance select 1)-_min) );
                 //   diag_log format ["##SpawnSoldier: Adding %1 %2",_numItems, _item];
                 _unit addMagazines [ _item, _numItems];
             };
        }foreach _gear;
        
        _faction = _x select 13;
        _unit setVariable ["FumS_Krypto", _faction];
      //  diag_log format ["<FuMS> SpawnSoldier: %1 Crypto/Faction data %2",_unit, _faction];
    };
}foreach _soldierData;

if (!_typeFound) then
{
    diag_log format ["*******************************************************"];
    diag_log format ["******SpawnSoldier: %1 not found in Theme index %2's SoldierData.sqf",_type, _themeIndex];
    diag_log format ["*******************************************************"];
};
_unit