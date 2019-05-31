//VerifyLocation =
// Horbin
// 3/4/15
// Modified by TheOneWhoKnocks
// 4/20/19
// Allow for random loot locations passed as an array


private ["_loc","_abort","_numElements","_doNothing"];
_loc = _this select 0;
_abort = false;	
FuMS_FileError = format ["Location:%1",_loc];;
while {true} do
{
    if (isNil "_loc") exitWith {_abort=true;FuMS_FileError = format ["%1No value found.",FuMS_FileError];};
    if (TypeName _loc != "ARRAY" and TypeName _loc != "STRING") exitWith {_abort=true;FuMS_FileError = format ["%1 must an array containing a 2D offset, 3D location, or location name. Found %2",FuMS_FileError, _loc];};
    
	if (TypeName _loc == "ARRAY" and {TypeName (_loc select 0) == "ARRAY" }) exitWith{};

	
	if (TypeName _loc == "ARRAY") then
    {
        _numElements = count _loc;
        if (_numElements > 3) exitWith {_abort=true;FuMS_FileError = format ["%1 must an array containing a 2D offset, 3D location, or location name. Found %2",FuMS_FileError, _loc];};
        if (_numElements == 1 and TypeName (_loc select 0) != "STRING") exitWith {_abort=true;FuMS_FileError = format ["%1 must an array containing a 2D offset, 3D location, or location name. Found %2",FuMS_FileError, _loc select 0];};
        if (_numElements ==2 or _numElements ==3) then
        {
            {
                if (TypeName _x != "SCALAR") exitWith {_abort=true;FuMS_FileError = format ["%1 2D offset, 3D location values must be numbers. Found %2",FuMS_FileError, _x];};
            }foreach _loc;  
        };
    };
    if (true) exitWith{};
};
//diag_log format ["##VerifyLocation _abort = %1 with input loc:%2",_abort, _loc];
_abort;

