//MissionLootConfig.sqf
// Horbin
// 3/4/15

private ["_loot","_abort","_prefix","_states","_state"];
_loot = _this select 0;
_abort = false;
_prefix = "Loot Data:";
_state = 0;
_states = ["Static","Win","Lost"];
FuMS_FileError = "";
while {true} do
{
    //diag_log format ["##MissionLootConfig :......."];
	_abort = [_loot, 3] call FuMS_fnc_HC_Val_Util_CheckArray;
	if (_abort) exitwith {FuMS_FileError = format ["%1 is not a valid array of size 3. Found %2",_prefix,_loot];};
	{
		FuMS_FileError = format ["%1%2:",_prefix,_states select _state];
		if (TypeName _x != "ARRAY")exitwith {FuMS_FileError = format ["%1 is not a valid array. Found %2",FuMS_FileError,_x];};
		if (count _x < 2) exitwith {FuMS_FileError = format ["%1 is not a valid array. Found %2",FuMS_FileError,_x];};
		if (TypeName (_x select 0) == "STRING") exitWith
		{
          //  diag_log format ["##MissionLootconfig: calling VerifyLoction with %1",_x select 1];
			if ([_x select 1] call FuMS_fnc_HC_Val_Util_VerifyLocation) exitwith {_abort=true; FuMS_FileError = format["%1%2 invalid location, Found %3",FuMS_FileError,FuMS_FileError,_x select 1];};
		}; // exit's code here.
		{
           // diag_log format ["##MissionLootconfig: calling CheckArray with %1",_x];         
			if ([_x,2] call FuMS_fnc_HC_Val_Util_CheckArray)exitwith {_abort=true;FuMS_FileError=["%1 not valid name, location pair. Found %2",FuMS_FileError,_x];};
			if (TypeName (_x select 0) != "STRING") exitwith {_abort=true;FuMS_FileError=["%1 Loot name is not a string. Found %2",FuMS_FileError,_x select 0];};
			if ([_x select 1] call FuMS_fnc_HC_Val_Util_VerifyLocation) exitwith {_abort=true; FuMS_FileError = format["%1%2 invalid location, Found %3",FuMS_FileError,FuMS_FileError,_x select 1];};
		}foreach _x;
		if(_abort)exitwith{};
		_state = _state +1;
	}foreach _loot;
	if(true)exitwith{};
};
 //diag_log format ["##MissionLootConfig :...exiting...."];
_abort