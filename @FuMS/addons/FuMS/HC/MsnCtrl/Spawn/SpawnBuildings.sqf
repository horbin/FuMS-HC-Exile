//SpawnBulding.sqf
// Horbin
// 1/4/2015
// 5/15/15 modified to support M3 Editor format.
// 6/11/15 modified to correct 'array of object' option and add Fire/smoke options to M3Editor!
// 4/2/19  Modified by TheOneWhoKnocks to allow for Destroyer and Carrier placement, Still WIP
//INPUTS: Building data from Mission main, eCenter, themeIndex, _curMission
//OUTPUTS: array of buildings

private ["_buildings","_buildingData","_eCenter","_themeIndex","_curMission","_vehicles"];
_buildingData = _this select 0;
_eCenter = _this select 1;
_lineage = _this select 2;
_curMission = _this select 3;

_buildings = [];
_vehicles = [];
// establish global variable prefix
_themeIndex = _lineage select 0;
_generation = _lineage select 1;
_offspringID = _lineage select 2;
_msnTag = format ["FuMS_%1_%2_%3",_themeIndex,_generation,_offspringID];

_debug = true;

if (!isNil "_buildingData") then
{
    if (count _buildingData > 0) then
    { 
        private ["_firstBuilding","_useOffset","_fbLoc"];
        // check if 1st building is at [0,0,0]. If so, work offsets!
        _firstBuilding = _buildingData select 0;
        // if the 1st building is an array to be picked randomly, select one.
        if (TypeName _firstBuilding == "ARRAY") then {_firstBuilding = [_firstBuilding] call BIS_fnc_selectRandom;};
        _fbLoc = _firstBuilding select 1;
        _useOffset = false;          
        if (_fbLoc select 0 == 0 and _fbLoc select 1 == 0 and _fbLoc select 2 ==0) then {_useOffset = true;};    //3d locations, using offsets! 
         //     diag_log format ["##SpawnBuildings: Debug: 1stBuilding: %1  _useOffset:%2",_firstBuilding, _useOffset];
        //foreach _buildingData
        {
            private ["_type","_offset","_rotation","_persist"];
            _type = _x select 0; // should be a 'class string name', 'array of class names', or 'keyword' string
            _offset = _x select 1;
            _rotation = _x select 2;
            _persist = _x select 3;
            // valid 'keywords' = M3EDITOR
			
			if (_debug) then
			{
				diag_log format ["##SPAWNBUILDINGS: Launch params: _offset:%2 | _rotation:%3 | _persist:%4 | _mission:%5 | _type:%1",_type, _offset, _rotation, _persist,  _curMission];
			};
        
            // if _type is an Array, it should be a 'list' of building or vehicle class names, so pick one randomly.
            if (TypeName _type == "ARRAY") then {_type = _type call BIS_fnc_selectRandom;};
            // if the 'type' field is a string, search for the proper key word to determine the formatting to be handled
            //  M3EDITOR = M3 Editor file format.					
            if (TypeName _type == "STRING") then
            {
                if (toupper _type == "M3EDITOR") then
                {
                    //diag_log format ["<FuMS:%1> SpawnBuildings: Found M3Editor building list!",FuMS_Version];                    
                    private ["_xShift","_yShift","_buildingList","_anchorBldg","_fireNsmoke"];
                    _fireNsmoke = _rotation; // firesmoke value stored at this location for M3Editor formating.
                    _buildingList = _x select 4;
                    if (_offset select 0 == -1) then {_xShift=0; _yShift=0; _useOffset = false; //diag_log format ["<FuMS:%1> SpawnBuildings:(M3 - Phase -1,-1) Using offsets of %2,%3",FuMS_Version,_xShift,_yShift];
					}
                    else
                    {
                        _useOffset = true;
                        _anchorBldg = _buildingList select 0;
                        _xShift = (_anchorBldg select 1) select 0;
                        _yShift = (_anchorBldg select 1) select 1;
                        //diag_log format ["<FuMS:%1> SpawnBuildings:(M3 - Phase Offset used) Using offsets of %2,%3",FuMS_Version,_xShift,_yShift];
                    };
                    {
                        private ["_filePosX","_filePosY","_filePosZ","_eCenterX","_eCenterY","_newPos","_filePosition","_newPos","_keep","_bldg"];
                        _newPos = [0,0,0];
                        _type = _x select 0;
						if ( (TypeName _type) == "ARRAY") then
						{ 
							_type = _type call BIS_fnc_selectRandom;
						};
                        // create proper position
                        if (_useOffset) then
                        {
                            _filePosition = _x select 1;
                            // position as defined in the M3Editor file
                            _filePosX = _filePosition select 0;
                            _filePosY = _filePosition select 1;
                            _filePosZ = _filePosition select 2;
                            // encounter's center
                            _eCenterX = _eCenter select 0;
                            _eCenterY = _eCenter select 1;
                            
                            _newPos set [0, _eCenterX + (_filePosX - _xShift)];
                            _newPos set [1, _eCenterY + (_filePosY - _yShift)];                                                                
                            _newPos set [2, _filePosZ];
                            //diag_log format ["<FuMS:%1> SpawnBuildings:(Phase I) Placing %2 at %3",FuMS_Version,_type,_newPos];
                        }else { _newPos = _x select 1;//diag_log format ["<FuMS:%1> SpawnBuildings:(Phase II) Placing %2 at %3",FuMS_Version,_type,_newPos];
						};
                        
						//diag_log format ["<FuMS:%1> SpawnBuildings:Vehicle Spawned (1): _type:%2 | _pos:%3",FuMS_Version,_type,_newPos];

                        if ( _type isKindOf "Air" or _type isKindOf "LandVehicle" or _type isKindOf "Ship") then
                        {                       								                     
                            _bldg = [ _type, _newPos, [], 0 , "CAN_COLLIDE"] call FuMS_fnc_HC_Util_HC_CreateVehicle;
                             //diag_log format ["<FuMS:%1> SpawnBuildings:Vehicle Spawned (1): _type:%2 | _pos:%3",FuMS_Version,_type,_newPos];
                            _vehicles = _vehicles + [_bldg];
                        }else
                        {																		
                            _bldg = createVehicle [ _type, _newpos,[],0,"CAN_COLLIDE"];
							//_bldg = createVehicle [ _type, [0,0,0],[],0,"CAN_COLLIDE"];
							
							/*   Still WIP
							if (_type == "Land_Destroyer_01_base_F") then
							{
							_bldg call bis_fnc_Destroyer01Init;	
							//diag_log format ["<FuMS:%1> SpawnBuildings:Destroyer Init (1): _type:%2 | _pos:%3",FuMS_Version,_type,_newPos];							
							};
							*/

							
                            _buildings = _buildings + [_bldg];
							//diag_log format ["<FuMS:%1> SpawnBuildings:Building Spawned (2): _type:%2 | _pos:%3",FuMS_Version,_type,_newPos];
                        };
                        _bldg setVariable ["LINEAGE",_msnTag, false];
                        
                        if (_x select 4) then
                        {
                            _bldg setDir (_x select 2);
                            _bldg setPos (_newPos);
                            // diag_log format ["<FuMS:%1> SpawnBuildings:Building POS (1): _type:%2 | _pos:%3 | dir: %4",FuMS_Version,_bldg,_newPos,(_x select 2)];

                        }else
                        {
							/*  Adjustments needed for Destroyer and AC, Still WIP
							if (_type == "Land_Destroyer_01_base_F") then
							{
								_bldg setPosWorld (_newPos);
								//diag_log format ["<FuMS:%1> SpawnBuildings:Destroyer SetWorldPos: _type:%2 | _pos:%3",FuMS_Version,_type,_newPos];							
							} else
							{
							*/
								_bldg setPosATL (_newPos);
							//};
                            _bldg setVectorDirAndUp (_x select 3);
                             //diag_log format ["<FuMS:%1> SpawnBuildings:Building POS (2): _type:%2 | _pos:%3",FuMS_Version,_bldg,_newPos];
                        };   
						
						_bldg enableSimulationGlobal true;
						_bldg allowDamage false;

						
						/*  Adjustments needed for Destroyer and AC, Still WIP
						if (_type == "Land_Destroyer_01_base_F") then
						{
							_bldg call call bis_fnc_Destroyer01PosUpdate;	
							//diag_log format ["<FuMS:%1> SpawnBuildings:Destroyer Moved (2): _type:%2 | _pos:%3",FuMS_Version,_type,_newPos];							
						};
						
						if (surfaceiswater _newpos and count _newpos ==3) then
							{ 
								_adjust = _newpos select 2;
								_adjust = _adjust - 1.5;
								_newpos set [2,_adjust];
								_bldg setposASL _newpos;
								_currDir =  getDir _bldg;
								//diag_log format ["<FuMS> SpawnBuildings (WATER): created:%1, _newpos:%2, _currDir:%3",_bldg,_newpos,_currDir];

							};
						*/
                        _keep = false;
                        if (_persist==1) then {_keep = true;};
                        _bldg setVariable ["FuMS_PERSIST",_keep,false];  
                        if (TypeName _fireNsmoke == "STRING") then 
                        {
                            [_bldg,toupper (_fireNsmoke)] call FuMS_fnc_HC_Util_Effects;
                        };
                       // _buildings = _buildings+ [_bldg];                                                        
                    }foreach _buildingList;
                }else 
				{ 	if (toupper _type == "M3EDITOR-ASL") then
					{
					    // diag_log format ["<FuMS:%1> SpawnBuildings: Found M3Editor building list!",FuMS_Version];                    
						private ["_xShift","_yShift","_buildingList","_anchorBldg","_fireNsmoke"];
						_fireNsmoke = _rotation; // firesmoke value stored at this location for M3Editor formating.
						_buildingList = _x select 4;
						if (_offset select 0 == -1) then {_xShift=0; _yShift=0; _useOffset = false;}
						else
						{
							_useOffset = true;
							_anchorBldg = _buildingList select 0;
							_xShift = (_anchorBldg select 1) select 0;
							_yShift = (_anchorBldg select 1) select 1;
							// diag_log format ["<FuMS:%1> SpawnBuildings:Using offsets of %2,%3",FuMS_Version,_xShift,_yShift];
						};
						{
							private ["_filePosX","_filePosY","_filePosZ","_eCenterX","_eCenterY","_newPos","_filePosition","_newPos","_keep","_bldg"];
							_newPos = [0,0,0];
							_type = _x select 0;
							if ( (TypeName _type) == "ARRAY") then
							{ 
								_type = _type call BIS_fnc_selectRandom;
							};
							// create proper position
							if (_useOffset) then
							{
								_filePosition = _x select 1;
								// position as defined in the M3Editor file
								_filePosX = _filePosition select 0;
								_filePosY = _filePosition select 1;
								_filePosZ = _filePosition select 2;
								// encounter's center
								_eCenterX = _eCenter select 0;
								_eCenterY = _eCenter select 1;
								
								_newPos set [0, _eCenterX + (_filePosX - _xShift)];
								_newPos set [1, _eCenterY + (_filePosY - _yShift)];                                                                
								_newPos set [2, _filePosZ];
						        //diag_log format ["<FuMS:%1> SpawnBuildings:Placing %2 at %3",FuMS_Version,_type,_newPos];
							}else { _newPos = _x select 1;};

							if ( _type isKindOf "Air" or _type isKindOf "LandVehicle" or _type isKindOf "Ship") then
							{                       								                     
								_bldg = [ _type, _newPos, [], 0 , "CAN_COLLIDE"] call FuMS_fnc_HC_Util_HC_CreateVehicle;
								// diag_log format ["<FuMS:%1> SpawnBuildings:Vehicle Spawned (1): _type:%2 | _pos:%3",FuMS_Version,_type,_newPos];
								_vehicles = _vehicles + [_bldg];
							}else
							{			
						        // diag_log format ["<FuMS:%1> SpawnBuildings:",FuMS_Version];
								//_bldg = createVehicle [ _type, _newpos,[],0,"CAN_COLLIDE"];
								_bldg = createVehicle [ _type, [0,0,0],[],0,"CAN_COLLIDE"];
								_bldg setPosASL (_newPos);
								_bldg setVectorDirAndUp (_x select 2);
								_bldg enableSimulationGlobal ((_x select 3) select 0);
								_bldg allowDamage ((_x select 3) select 1);
								_buildings = _buildings + [_bldg];
							};
							_bldg setVariable ["LINEAGE",_msnTag, false];
							
//							if (_x select 4) then
//							{
//						        diag_log format ["<FuMS:%1> SpawnBuildings:Step 2:",FuMS_Version];
//								_bldg setDir (_x select 2);
//								_bldg setPos (_newPos);
//							}else
//							{
//						        diag_log format ["<FuMS:%1> SpawnBuildings:Step 3:",FuMS_Version];							
//								private _object = createVehicle [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];

//							};                                                       
							_keep = false;
							if (_persist==1) then {_keep = true;};
							_bldg setVariable ["FuMS_PERSIST",_keep,false];  
							if (TypeName _fireNsmoke == "STRING") then 
							{
								[_bldg,toupper (_fireNsmoke)] call FuMS_fnc_HC_Util_Effects;
							};
						   // _buildings = _buildings+ [_bldg];                                                        
						}foreach _buildingList;
					}else
					{      
						private ["_fireEffect","_newpos","_currDir"];
						// ASSERT: _type is a building or vehicle class name.
						if (count _x > 4) then
						{
							_fireEffect = toupper(_x select 4);
					  //       diag_log format ["<FuMS> SpawnBuildings: Fire/Smoke effect found for %1",_x];
						}else{_fireEffect="NONE";};
						
						if (_useOffset) then
						{
							private ["_newx","_newy","_newz","_offz"];
							if (count _eCenter == 2) then {_eCenter set [2,0];};
							_newx = _eCenter select 0;
							_newx = _newx + (_offset select 0);
							
							_newy = _eCenter select 1;
							_newy = _newy + (_offset select 1);
							
							_newz = _eCenter select 2;
							_offz = _offset select 2;
							if (isNil "_offz") then {_offz = 0;};
							_newz = _newz + _offz;
							_newpos = [_newx, _newy, _newz];
						}else {_newpos = [ _eCenter, _offset] call FuMS_fnc_HC_MsnCtrl_Util_XPos;};
						//   _newpos = [_newpos, 0, 100, 1,0, 8,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // 1m clear, terraingradient 8 pretty hilly
						//      if ( (_type isKindOf "Air" or _type isKindOf "LandVehicle" or _type isKindOf "Ship") and TypeName (_x select 3) == "ARRAY") then
						if (TypeName (_x select 3) == "ARRAY") then
						{
							private ["_data","_veh","_settings"];    
							_settings = _x select 3;
						//    diag_log format ["<FuMS> SpawnBuildings: Vehicle found: pos:%1,  type:%2",_newpos, _type];
							_data = [_newpos, "none", _type] call FuMS_fnc_HC_MsnCtrl_Util_GetSafeSpawnVehPos;	                     
							_veh = [ _type, _data select 0, [], 30 , _data select 1] call FuMS_fnc_HC_Util_HC_CreateVehicle;	 
							_veh setVariable ["LINEAGE",_msnTag, false];
						  //  diag_log format ["<FuMS> SpawnBuildings: created:%1, _type:%2",_veh,_type];                                                                  
							_vehicles = _vehicles + [_veh];                            
							_veh setDir _rotation;                        
							_veh setFuel (_settings select 0);
							_veh setVehicleAmmo (_settings select 1);
							_veh setHitPointDamage ["hitEngine",_settings select 2];
							_veh setHitPointDamage ["hitFuel", _settings select 3];
							_veh setHitPointDamage ["HitHull", _settings select 4];    
							
							[_veh,_fireEffect] call FuMS_fnc_HC_Util_Effects;
							
						}else
						{
							private ["_keep","_adjust","_bldg"];
							_bldg = createVehicle [ _type, _newpos,[],0,"CAN_COLLIDE"];
							_bldg setDir _rotation;
							_bldg setPos (getpos _bldg);
							//_currDir =  getDir _bldg;
							//diag_log format ["<FuMS> SpawnBuildings: created:%1, _rotation:%2, _currDir:%3",_bldg,_rotation,_currDir];                                                                  

							
							if (surfaceiswater _newpos and count _newpos ==3) then
							{ 
								_adjust = _newpos select 2;
								_adjust = _adjust - 1.5;
								_newpos set [2,_adjust];
								_bldg setposASL _newpos;
								//_currDir =  getDir _bldg;
								//diag_log format ["<FuMS> SpawnBuildings (WATER): created:%1, _rotation:%2, _currDir:%3",_bldg,_rotation,_currDir];                                                                  

							};
							
							_keep = false;
							if (_x select 3 == 1) then {_keep = true;};
							_bldg setVariable ["FuMS_PERSIST",_keep,false];
							_bldg setVariable ["LINEAGE",_msnTag, false];
							[_bldg,_fireEffect] call FuMS_fnc_HC_Util_Effects;
							
							// store in HC variable.
							_buildings = _buildings+ [_bldg];
							//   HC_HAL_NumBuildings = HC_HAL_NumBuildings + 1;
					//         diag_log format ["## SPAWN Buildings: _bldg:%1   _buildings:%2",_bldg, _buildings];                
						};                                                                                
					};
				};
            }
            else
            {
                // Data format error if this code is being executed!
                diag_log format ["<FuMS> SpawnBuilding: ERROR in building data format for mission %1/%2", FuMS_ActiveThemes select _themeIndex,  _curMission];
                diag_log format ["<FuMS> SpawnBuilding: Offending building/vehicle : %1", _x];
                _buildingData=_buildingData-[_x];                                                
            };               
        } foreach _buildingData;
        //diag_log format ["## SPAWN Buildings: %1",_buildings];
        if (count _buildings > 0) then
        {
            ["Buildings",_buildings] call FuMS_fnc_HC_Util_HC_AddObject;             
        };
        if (count _vehicles > 0 ) then
        {
            ["Vehicles",_vehicles] call FuMS_fnc_HC_Util_HC_AddObject;            
        };        
    };
};
[ _buildings, _vehicles]
    
    