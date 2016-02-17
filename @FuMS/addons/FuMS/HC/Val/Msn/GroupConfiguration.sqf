//GroupConfiguration.sqf
// Horbin
// 3/4/15
private ["_groups","_abort","_prefix","_dat3"];
_groups = _this select 0;
_abort = false;
_prefix = "Group Data:";
FuMS_FileError = "";
while {true} do
{
	if (isNil "_groups") exitwith {_abort=true; FuMS_FileError = format ["%1 no data found",_prefix];};
	if (TypeName _groups != "ARRAY") exitwith{_abort=true; FuMS_FileError = format ["%1 should be an array. Found %2",_prefix, _groups];};
	{
       // diag_log format ["##GroupConfiguration: Checking %1",_x];
		// 3 elements
		if ([_x,3] call FuMS_fnc_HC_Val_Util_CheckArray) exitWith {_abort=true; FuMS_FileError = format ["%1 group definition needs to be an array of 3 elements. Found %2",_prefix,_x];};
		//	behaviour 4 strings        
		_dat3 = _x select 0;
      // diag_log format ["##GroupConfiguration: Behaviour %1",_dat3];
		if ([_dat3,4] call FuMS_fnc_HC_Val_Util_CheckArray) exitWith {_abort=true; FuMS_FileError = format ["%1 group behaviour needs to be an array of 4 strings. Found %2",_prefix,_dat3];};
		{
			if (TypeName _x != "STRING") exitwith{_abort=true; FuMS_FileError = format ["%1 group behaviour elements should be strings. Found %2",_prefix,_x];};
		}foreach _dat3;
		if (_abort) exitWith{};
		//	soldier def array of [#,string] pairs
		_dat3 = _x select 1;
     //  diag_log format ["##GroupConfiguration: soldier array %1",_dat3];
		if (TypeName _dat3 != "ARRAY") exitWith {_abort=true; FuMS_FileError = format ["%1 Soldier definitions need to be an array of [#,""Type""] pairs. Found %2",_prefix,_dat3];};
		{
			if ([_x,2] call FuMS_fnc_HC_Val_Util_CheckArray) exitWith {_abort=true; FuMS_FileError = format ["%1 Each soldier definition should be a [num, ""Type""] pair. Found %2",_prefix,_x];};
            if (TypeName (_x select 0) != "SCALAR" or TypeName (_x select 1) != "STRING") exitwith {_abort=true; FuMS_FileError = format ["%1 Each soldier definition should be a [num, ""Type""] pair. Found %2",_prefix,_x];};			
		}foreach _dat3;
		if (_abort) exitWith{};
		//	array of AI logic
		_dat3 = _x select 2;
      //  diag_log format ["##GroupConfiguration: AI Logic %1",_dat3];
		if (TypeName _dat3 != "ARRAY") exitWith {_abort=true; FuMS_FileError = format ["%1 Soldier AI LOGIC should be an array of values. Found %2",_prefix,_dat3];};
		if ([_dat3] call FuMS_fnc_HC_Val_Msn_VerifyAILogic) exitWith {_abort=true; FuMS_FileError = format ["%1%2",_prefix,FuMS_FileError];};				
		if (_abort) exitWith{};
	}foreach _groups;
	if(true)exitwith{};
};
//diag_log format ["##GroupConfiguration _abort = %1 with Err:%2",_abort, FuMS_FileError];
_abort



