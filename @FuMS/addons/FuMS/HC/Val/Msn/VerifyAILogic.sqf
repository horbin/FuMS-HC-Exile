//VerifyAILogic.sqf
// Horbin
// 3/4/15
// Input - from mission file - a group's Logic array
// ["LogicType", [spawnloc],[logic's loc origin], [array of options] ]
private ["_abort","_data","_aiProgram","_aiSpawnLoc","_aiworkLoc","_aiOptions","_option"];
_abort = false;
_data = _this select 0;
while {true} do
{
	if ([_data,4] call FuMS_fnc_HC_Val_Util_CheckArray) exitwith {_abort=true; FuMS_FileError = format ["Error in AI logic. Should be arrray of 4 elements. Found %1",_data];};
	_aiProgram = _data select 0;
	_aiSpawnLoc = _data select 1;
	_aiworkLoc = _data select 2;
	_aiOptions = _data select 3;
	if (TypeName _aiProgram != "STRING") exitwith {_abort=true; FuMS_FileError = format ["No defined AI Logic Found %1",_aiProgram];};
	if (TypeName _aiOptions != "ARRAY") exitwith {_abort=true; FuMS_FileError = format ["AILogic options must be an array %1",_aiOptions];};
	if ([_aiSpawnLoc] call FuMS_fnc_HC_Val_Util_VerifyLocation) exitWith {_abort=true;FuMS_FileError = format ["Spawn location needs to be a 2d offset, 3d location or named string. Found %1",_aiSpawnLoc];};			
	if ([_aiworkLoc] call FuMS_fnc_HC_Val_Util_VerifyLocation) exitWith {_abort=true;FuMS_FileError = format ["Work location needs to be a 2d offset, 3d location or named string. Found %1",_aiworkLoc];};			
	_aiProgram = toupper _aiProgram;
	switch (_aiProgram) do
	{
		case "BUILDINGS":
		{
			if (count _aiOptions != 1 or TypeName (_aiOptions select 0) != "SCALAR") exitwith {_abort=true;FuMS_FileError = format ["'Building' logic should have 1 number as a parameter. Found %1",_aiOptions];};
		};
		case "EXPLORE":
		{
			if (count _aiOptions != 1 or TypeName (_aiOptions select 0) != "SCALAR") exitwith {_abort=true;FuMS_FileError = format ["'Explore' logic should have 1 number as a parameter. Found %1",_aiOptions];};
		};
		case "BOXPATROL":
		{
			if (count _aiOptions != 1 or TypeName (_aiOptions select 0) != "SCALAR") exitwith {_abort=true;FuMS_FileError = format ["'BoxPatrol' logic should have 1 number as a parameter. Found %1",_aiOptions];};
		};
		case "SENTRY":
		{
			if (count _aiOptions != 1 or TypeName (_aiOptions select 0) != "SCALAR") exitwith {_abort=true;FuMS_FileError = format ["'Sentry' logic should have 1 number as a parameter. Found %1",_aiOptions];};
		};
        case "TOWERGUARD":
		{
            if (count _aiOptions != 2) exitwith {_abort=true; FuMS_FileError = format ["'TowerGuard' logic should have 2 optional paramaters. Found %1",_aiOptions];};
            
            if (TypeName (_aiOptions select 0) != "SCALAR") exitwith {_abort=true;FuMS_FileError = format ["'TowerGuard logic should have a number as its first parameter. Found %1",_aiOptions select 0];};
            if (TypeName (_aiOptions select 1) != "STRING") exitwith {_abort=true;FuMS_FileError = format ["'TowerGuard logic should have a string as ints 2nd parameter. Found %1",_aiOptions select 1];};
        //    if (TypeName (_aiOptions select 2) != "STRING") exitwith {_abort=true;FuMS_FileError = format ["'TowerGuard logic should have a value of ""StandGround"" or ""Manuver"" as ints 3nd parameter. Found %1",_aiOptions select 2];};
		};
        case "GUNNER":
        {
              if (count _aiOptions != 1) exitwith {_abort=true; FuMS_FileError = format ["'Gunner logic should have 1 optional paramaters with a value of '0'. Found %1",_aiOptions];};
        };
		case "CONVOY":
		{
      //      diag_log format ["##VerifyAILogic: convoy in _abort = %1  options:%2", _abort, _aiOptions];
			if (count _aiOptions != 5 and count _aiOptions != 4) exitwith {_abort=true;FuMS_FileError = format ["'Convoy' logic should have 4 or 5 options. Found %1",_aiOptions];};			
			_option = _aiOptions select 0;		
			_option = toupper _option;
			if (_option != "LIMITED" and _option!="NORMAL" and _option!="FULL") exitWith 
            {
                _abort=true;
                FuMS_FileError = format ["'Convoy' speed should be 'Limited', 'Normal' or 'Full'. Found %1",_option];
            };			
			if (TypeName (_aiOptions select 1) != "BOOL") exitWith
            {
                _abort=true;
                FuMS_FileError = format ["'Convoy' RTBFlag should be true or false. Found %1",_aiOptions select 1];
            };			
			if (TypeName (_aiOptions select 2) != "BOOL") exitWith {_abort=true;FuMS_FileError = format ["'Convoy' RoadsFlag should be true or false. Found %1",_aiOptions select 2];};			
			if (TypeName (_aiOptions select 3) != "BOOL") exitWith {_abort=true;FuMS_FileError = format ["'Convoy' DespawnFlag should be true or false. Found %1",_aiOptions select 3];};			
			_option = _aiOptions select 4;
			if (!isNil "_option") then
			{
				_option = toupper _option;
				if (_option != "XFILL") exitWith {_abort=true;FuMS_FileError = format ["'Convoy' 'XFILL' is the only valid option for the 5th option. Found %1",_aiOptions select 4];};			
			};
      //      diag_log format ["##VerifyAILogic: convoy out _abort = %1", _abort];
		};
		case "PARADROP":
		{
			if (count _aiOptions != 4) exitWith {_abort=true;FuMS_FileError = format ["'Paradrop' Logic requires 4 parameters. Found %1",_aiOptions];};			
			_option = _aiOptions select 0;
			_option = toupper _option;
			if (_option != "LIMITED" and _option!="NORMAL" and _option!="FULL") exitWith {_abort=true;FuMS_FileError = format ["'Paradrop' speed should be 'Limited', 'Normal' or 'Full'. Found %1",_option];};			
			if (TypeName (_aiOptions select 1) != "SCALAR") exitWith {_abort=true;FuMS_FileError = format ["'Paradrop' altitude needs to be a number. Found %1",_aiOptions select 1];};			
			if (TypeName (_aiOptions select 2) != "BOOL") exitWith {_abort=true;FuMS_FileError = format ["'Paradrop' RTBFlag should be true or false. Found %1",_aiOptions select 2];};			
			if (TypeName (_aiOptions select 3) != "BOOL") exitWith {_abort=true;FuMS_FileError = format ["'Paradrop' SmokesFlag should be true or false. Found %1",_aiOptions select 3];};							
		};
		case "PATROLROUTE":
		{
            if (count _aiOptions != 7 and count _aiOptions != 6) exitWith {_abort=true;FuMS_FileError = format ["'PatrolRoute' expects 6 or 7 options. Found %1",_aiOptions ];};			
            _option = _aiOptions select 0;				
            _option = toupper _option;
            if (_option != "CARELESS" and _option!="SAFE" and _option!="AWARE" and _option!="COMBAT" and _option!="STEALTH") exitWith {_abort=true;FuMS_FileError = format ["'PatrolRoute: Valid behaviour is Careless, Safe, Aware, Combat, or Stealth. Found %1",_option];};			
            _option = _aiOptions select 1;
            _option = toupper _option;
            if (_option != "LIMITED" and _option!="NORMAL" and _option!="FULL") exitWith {_abort=true;FuMS_FileError = format ["PatrolRoute' speed should be 'Limited', 'Normal' or 'Full'. Found %1",_option];};			
            if (TypeName (_aiOptions select 2) != "ARRAY") exitWith {_abort=true;FuMS_FileError = format ["PatrolRoute' route locations should be an array of 2d, 3d or named locations. Found %1",_aiOptions select 2];};			
            {                
                if ([_x] call FuMS_fnc_HC_Val_Util_VerifyLocation) exitWith {_abort=true;FuMS_FileError=format["PatrolRoute: route locations need to be string name, 2D offset, or 3D locations. Found %1",_x];};
            }foreach (_aiOptions select 2);
            if (_abort) exitwith {};
            if (TypeName (_aiOptions select 3) != "BOOL") exitWith {_abort=true;FuMS_FileError = format ["PatrolRoute' RTBFlag should be true or false. Found %1",_aiOptions select 3];};			
            if (TypeName (_aiOptions select 4) != "BOOL") exitWith {_abort=true;FuMS_FileError = format ["PatrolRoute' RoadsFlag should be true or false. Found %1",_aiOptions select 4];};			
            if (TypeName (_aiOptions select 5) != "BOOL") exitWith {_abort=true;FuMS_FileError = format ["PatrolRoute' DespawnFlag should be true or false. Found %1",_aiOptions select 5];};					
            _option = _aiOptions select 6;
            if (!isNil "_option") then
            {
                if (TypeName _option != "SCALAR") exitWith {_abort=true;FuMS_FileError = format ["PatrolRoute' fly height needs to be a number. Found %1",_aiOptions select 6];};			
			};        
		};	
        case "ZOMBIE":
        {
          //  if (count _aiOptions != 0 ) exitwith {_abort=true;FuMS_FileError = format ["Zombie logic should have no options. Found %1",_aiOptions];};            
        };
        case "LOITER":
        {
        };		
        case "TRACKROUTE":
        {
            if (count _aiOptions != 7 and count _aiOptions != 6) exitWith {_abort=true;FuMS_FileError = format ["'TrackRoute' expects 6 or 7 options. Found %1",_aiOptions ];};			
            _option = _aiOptions select 0;				
            _option = toupper _option;
            if (_option != "CARELESS" and _option!="SAFE" and _option!="AWARE" and _option!="COMBAT" and _option!="STEALTH") exitWith {_abort=true;FuMS_FileError = format ["'TrackRoute: Valid behaviour is Careless, Safe, Aware, Combat, or Stealth. Found %1",_option];};			
            _option = _aiOptions select 1;
            _option = toupper _option;
            if (_option != "LIMITED" and _option!="NORMAL" and _option!="FULL") exitWith {_abort=true;FuMS_FileError = format ["TrackRoute' speed should be 'Limited', 'Normal' or 'Full'. Found %1",_option];};			
            if (TypeName (_aiOptions select 2) != "ARRAY") exitWith {_abort=true;FuMS_FileError = format ["TrackRoute' route locations should be an array of 2d, 3d or named locations. Found %1",_aiOptions select 2];};			
            {                
                if ([_x] call FuMS_fnc_HC_Val_Util_VerifyLocation) exitWith {_abort=true;FuMS_FileError=format["TrackRoute: route locations need to be string name, 2D offset, or 3D locations. Found %1",_x];};
            }foreach (_aiOptions select 2);
            if (_abort) exitwith {};
            if (TypeName (_aiOptions select 3) != "BOOL") exitWith {_abort=true;FuMS_FileError = format ["TrackRoute' RTBFlag should be true or false. Found %1",_aiOptions select 3];};			
            if (TypeName (_aiOptions select 4) != "BOOL") exitWith {_abort=true;FuMS_FileError = format ["TrackRoute' RoadsFlag should be true or false. Found %1",_aiOptions select 4];};			
            if (TypeName (_aiOptions select 5) != "BOOL") exitWith {_abort=true;FuMS_FileError = format ["TrackRoute' DespawnFlag should be true or false. Found %1",_aiOptions select 5];};					
            _option = _aiOptions select 6;
            if (!isNil "_option") then
            {
                if (TypeName _option != "SCALAR") exitWith {_abort=true;FuMS_FileError = format ["TrackRoute' fly height needs to be a number. Found %1",_aiOptions select 6];};			
			};        
		};	
        case "CAPTURED":
        {
            
        };
		default 
        {
      //      diag_log format ["##VerifyAILogic:  DEFAULT Logic option found???!!!!???"];
            _abort=true; FuMS_FileError = format ["No defined AI Logic Found %1",_aiProgram];
        };	
	};
    if (true) exitWith{};
};
//diag_log format ["##VerifyAILogic: _abort = %1 : %2",_abort, FuMS_FileError];
_abort


