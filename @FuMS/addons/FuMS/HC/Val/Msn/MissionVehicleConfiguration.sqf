//MissionVehilceConfiguration.sqf
// Horbin
// 3/4/15
private ["_vehicles","_abort","_prefix","_sec","_dat2","_dat3"];
_vehicles = _this select 0;
_abort = false;
_prefix = "Vehicle Data:";
FuMS_FileError = "";
while {true} do
{
	if (isNil "_vehicles") exitwith {_abort=true; FuMS_FileError = format ["%1 no data found",_prefix];};
	if (TypeName _vehicles != "ARRAY") exitwith{_abort=true; FuMS_FileError = format ["%1 should be an array. Found %2",_prefix, _vehicles];};
	{
        if ([_x,3] call FuMS_fnc_HC_Val_Util_CheckArray) exitWith {_abort=true; FuMS_FileError = format ["%1 should contain 3 elements per Convoy [vehicle],[driver],[troops]",_prefix];};
		//vehicle section
		//	[type string, [spawnloc],[x,type]<--crew, "loot type"]
		_sec = "Vehicle";
   //      diag_log format ["##MissionVehicleConfiguration: %1 check", _sec];
		_dat2 = _x select 0;
        {
            if ([_x,4] call FuMS_fnc_HC_Val_Util_CheckArray and [_x,5] call FuMS_fnc_HC_Val_Util_CheckArray)exitWith {_abort=true; FuMS_FileError = format ["%1%2 should contain 4 or 5 elements [""vehicle"",[spawnloc],[#,""Rifleman""],loot type or ""NONE"". Found %3",_prefix,_sec, _x];};
            if (TypeName (_x select 0) != "STRING" and TypeName (_x select 0) != "ARRAY" ) exitWith {_abort=true; FuMS_FileError = format ["%1%2 name needs to be string or array of strings. found %3",_prefix,_sec,_x select 0];};
            if ([_x select 1] call FuMS_fnc_HC_Val_Util_VerifyLocation) exitWith{_abort=true; FuMS_FileError = format ["%1%2 should be 2D offset, 3D loc, or string name location. found %3",_prefix,_sec,_x select 1];};
            _dat3 = _x select 2;
            if (count _dat3 > 0) then
            {
                if (([_dat3,2] call FuMS_fnc_HC_Val_Util_CheckArray) and ([_dat3,1] call FuMS_fnc_HC_Val_Util_CheckArray))exitWith {_abort=true; FuMS_FileError = format ["%1%2 crew should be an array of [number,""soldier type""] OR [number] for a static weapon. Found %3",_prefix,_sec, _dat3];};	                 
             //   if (TypeName (_dat3 select 0) != "SCALAR" or TypeName (_dat3 select 1) != "STRING") exitwith {_abort=true; FuMS_FileError = format ["%1%2 Each soldier definition should be a [num, ""Type""] pair. Found %3",_prefix,_sec,_x];};			              
            };
            if (TypeName (_x select 3) != "STRING") exitWith {_abort=true; FuMS_FileError = format ["%1%2 vehicle loot should be a string. Found %3",_prefix, _sec, _x select 3];};
        }foreach _dat2;
        if (_abort) exitwith{};
		// driver section       
		_sec ="Driver";
     //    diag_log format ["##MissionVehicleConfiguration: %1 check", _sec];
		if ([_x select 1] call FuMS_fnc_HC_Val_Msn_GroupConfiguration) exitWith {_abort=true; FuMS_FileError = format ["%1%2%3 found %4",_prefix,_sec,FuMS_FileError,_x select 1];};
		//	  call group check
		// troop section
        
		_sec ="Troops";
     //    diag_log format ["##MissionVehicleConfiguration: %1 check", _sec];
		if ([_x select 2] call FuMS_fnc_HC_Val_Msn_GroupConfiguration) exitWith {_abort=true; FuMS_FileError = format ["%1%2%3 found %4",_prefix,_sec,FuMS_FileError,_x select 2];};
		//    call group check
	}foreach _vehicles;
	if(true)exitwith{};
};
//diag_log format ["##MissionVehilceConfiguration: _abort = %1",_abort];
_abort;



