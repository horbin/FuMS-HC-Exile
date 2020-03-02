//LoadScriptsForHC
// Horbin
// 2/27/15
// _S_ string of code created server side
// _CX_ actual code compiled on HC side.
//  X - indicates the tier folder the  is located in on the server.
// Original Mission .pbo was 460Kb, current 103Kb = 77.6% smaller (460-144/460) (41kb is the sound file)
private ["_start","_scripts","_ryansZnDs"];
_start = time;

//Check if Ryans Zombies and Demons is being used
//Use to find PLP markers
FuMS_ZnDs = isClass(configFile>>"cfgPatches">>"Ryanzombies");
diag_log format ["<FuMS> LoadScriptsForHC : Ryan's Zombies and Demons = %1", FuMS_ZnDs];
//if (_ryansZnDs) then
//{
//	FuMS_Zombie = compile preprocessFileLineNumbers "\Ryanzombies\zombie.sqf";
//	FuMS_ZombieSpider =compile preprocessFileLineNumbers "\Ryanzombies\zombiespider.sqf";
//	FuMS_ZombieBoss = compile preprocessFileLineNumbers "\Ryanzombies\zombieboss.sqf";
//};

//HC Root
_scripts =
[
	[
		"FuMsnInit.sqf"
	],
	[
		"AI",
		[
			"AIKilled.sqf",
			"AttachMuzzle.sqf", 
			"SpawnSoldier.sqf",
			"TrackAI.sqf",
			"PayPlayer.sqf"
		],
		[
			"Logic",
			[
				"AIEvac.sqf",
				"DriverXFill.sqf",
				"fnparadrop.sqf",
				"AddWaypoint.sqf", 
				"VehStuck.sqf",
				"AIGuardBuilding.sqf", 
				"AIPB.sqf", 
				"AreaPatrol.sqf", 
				"BoxPatrol.sqf", 
				"Loiter.sqf",
				"Paradrop.sqf", 
				"PolygonPatrol.sqf", 
				"Convoy.sqf", 
				"PatrolRoute.sqf", 
				"ScriptPatrol.sqf",
				"TrackRoute.sqf",
				"TowerGuard.sqf",
				"StaticGunner.sqf",
				"Captured.sqf"					
			]
			/*
			[
				"RZnD",
				[
					"HostDetected.sqf",
					"MoveToTarget.sqf",
					"ZContact.sqf",
					"zAttack.sqf",
					"zThrow.sqf",
					"zBoard.sqf",
					"zJump.sqf",
					"zombie.sqf"
				]
			]
			*/
		],
		[
			"RC",
			[				
				"FormatAndBroadcast.sqf", 
				"FormatAndBroadcastAI.sqf", 
				"RadioChatter.sqf",
				"AIRadio.sqf", 
				"BaseOps.sqf"
			]
		]	
	],
	[
		"Loot",
			[
				"AddIt.sqf", 
				"GetBox.sqf", 
				"GetQuantity.sqf",
				"FillLoot.sqf", 
				"GetChoice.sqf",
				"DropLootVehicle.sqf",
				"Scatter.sqf"
			]
	],
	[
		"Menus",
		[
			"initHCMenus.sqf"
		]
	],
	[
		"MsnCtrl",
		[
			//"LogicBomb.sqf", 
			//"MissionInit.sqf", 
			"ControlLoop.sqf", 
			"StaticMissionControlLoop.sqf",
			"NewLogicBomb.sqf",
			"PlayerWatchControlLoop.sqf"
		],
		[
			"Spawn",
			[
				"SpawnNotifications.sqf", 
				"SpawnMissionLoot.sqf", 
				"CreateGroup.sqf", 
				"SpawnGroup.sqf", 
				"SpawnVehicle.sqf", 
				"SpawnBuildings.sqf"
			]
		],
		[
			"Util",
			[			
				"SetSpecialNameandLocation.sqf",
				"GetSafeSpawnVehPos.sqf", 
				"XPos.sqf",
				"PullData.sqf",
				"GetSafeMissionSpawnPos.sqf",
				"GetIndexers.sqf"
			]
		],
		[
			"LogicBomb",
			[
				"RemoveDecayObjects.sqf",
				"TriggerBomb.sqf",
				"ActionBomb.sqf",
				"LogicBomb.sqf",
				"SpawnTrigger.sqf",
				"CheckforBodyCount.sqf",
				"TransferObjects.sqf"
			]
		]
	],
	[
		"Triggers",
		[
			//"AllDeadorGone.sqf",
			"BodyCount.sqf",
			"Detect.sqf",
			"ProxPlayer.sqf",
			"Timer.sqf",
			"TimerNoPlayers.sqf",
				
			"CheckVehicle.sqf",

			//"UnitCount.sqf",
			"LowUnitCount.sqf",
			"HighUnitCount.sqf",
			"ZuppaCapture.sqf",
			//"DmgBuildings.sqf",
			//"DmgVehicles.sqf",
			"ZuppaCaptureInit.sqf",
			"DmgObjects.sqf",
			"CaptiveCount.sqf"
		]
	],
	[
		"Util",
		[
			"FindNearestLand.sqf", 
			"FindNearestRoad.sqf", 
			"FindNearestWater.sqf", 
			"FindTown.sqf", 
			"GetBuildingPositions.sqf",
			"KKcommonTurrets.sqf",
			"GetShortName.sqf",
			"GetWorldInfo.sqf",
			"Effects.sqf"
		],
		[
			"HC",
			[
				"AddObject.sqf", 
				"RemoveObject.sqf", 
				"CreateVehicle.sqf", 
				"InitHCVariables.sqf"
			]
		]
	],
	[
		"Val",
		[
			"ValidateLootData.sqf", 
			"ValidateSoldierData.sqf", 
			"ValidateThemeData.sqf", 
			"ValidateServerData.sqf", 
			"VerifyLoot.sqf", 
			"VerifySoldier.sqf", 
			"VerifyTheme.sqf", 
			"ValidateMissionData.sqf"
		], 
		[
			"Msn",
			[
				"GroupConfiguration.sqf",
				"MissionBuildingConfig.sqf", 
				"MissionLootConfig.sqf", 
				"MissionTriggerConfig.sqf", 
				"MissionVehicleConfiguration.sqf",                   
				"ValidateBuildings.sqf", 
				"VerifyAILogic.sqf",
				"VerifyMission.sqf"
			]
		],
		[
			"Util",
			[
				"CheckArray.sqf", 
				"VerifyLocation.sqf"
			]
		]
	]
];
                            
FuMS_GetVarName =
{
    private ["_string","_path"];
    _string = _this select 0;
    _path = _this select 1;
    
   // if (TypeName _string == "ARRAY") then {diag_log format ["Found %1,%2",TypeName (_string select 0), TypeName(_string select 1)];}
    //else { diag_log format ["Found %1", TypeName _string];};
    
    // just a file passed in.
    //if (TypeName _string == "STRING") exitWith { diag_log format ["#####$$$$$$#######  %1\%2",_path,_string];};
    if (TypeName _string == "STRING") exitWith { [format ["%1\%2",_path,_string]] call FuMS_ProcessVarName;};
    // folder and array passed
    if (TypeName (_string select 1) == "ARRAY" and TypeName (_string select 0) == "STRING") exitWith
    {
        _path = format ["%1\%2",_path,_string select 0];
     //   diag_log format ["..seeking %1 with %2",_path,_string select 1];
        _string = _string - [_string select 0];
        {
            [_x, _path] call FuMS_GetVarName;
        }foreach _string;
    };
    // multiple files or combo of folder/files
    {
        // run this if 1st 2 elements are both strings, or both arrays.
     //   diag_log format ["..Looking %1 with path:%2",_x,_path];
        [_x,_path] call FuMS_GetVarName;
    }foreach _string;2
};

FuMS_ProcessVarName =
{
    private["_string","_var","_ary","_pos"];
    _string = _this select 0;
    _var = format[""];
    _ary = toArray _string;    
    _pos = 0;
    {
        if ((toString [_x]) == ".") exitWith
        {
            //diag_log format ["##LoadScriptsForHCv2 _string:%1",_string];
            //diag_log format ["##LoadScriptsForHCv2 --var:  %1",_var];
            missionNamespace setVariable [_var, preprocessFileLineNumbers format["%1",_string]];
            FuMS_HC_ScriptList = FuMS_HC_ScriptList + [_var];
        };
        if (_pos > 0) then
        {
			
            if (toString [_x] == "\") then
            {
                _var = format["%1_",_var];
            }
            else
            {
                _var = format ["%1%2",_var, toString [_x]];
            };
			if (_pos == 4) then { _var = format ["%1%2",_var,"_str"];};
        };
        _pos = _pos + 1;
    }foreach _ary;
};

private ["_base"];
//diag_log format ["## Starting Dude"];
_base = "\FuMS\HC";
FuMS_HC_ScriptList = [];
[_scripts, _base] call FuMS_GetVarName;
diag_log format ["## HC Script load complete %2 Scripts in %1 secs ",time -_start, count FuMS_HC_ScriptList];





