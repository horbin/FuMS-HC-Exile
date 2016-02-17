//VerifyMission_Simple.sqf
// Horbin
// 3/1/15
// Inputs: mission file data array
// Performs simplistic check on data. Enough checking is done to ensure safe extraction of phase mission names and reinforcement mission names
// This routine is just in support of BuildThemeMissionList. Full mission data verification is offloaded to the HC's and accomplished by another function.
private ["_data", "_abort","_msg","_fileList"];
_data = _this select 0;
_msg = "";
_abort = false;

_fileList = [];
while {true} do
{
    private ["_sec","_data2","_data3","_name"];
    if (isNil "_data") exitWith {_abort=true; _msg = "No mission data passed!";};
    if (TypeName _data != "ARRAY") exitWith {_abort=true; _msg = format ["data passed is not an ARRAY. Found %1",_data];};
    if (count _data != 8 ) exitWith {_abort=true; _msg = format ["Expected 8 sections. Found %1",count _data];};
    _sec = "Mission Area Setup:";
    _data2 = _data select 0;
    if (TypeName _data2 != "ARRAY") exitWith {_abort=true; _msg = format ["%1 data passed is not an ARRAY. Found %2",_sec, _data2];};
    if (count _data2 < 2 or count _data2 > 6) exitWith {_abort=true; _msg = format ["%1 expected 3, 4 or 6 entries. Found %2",_sec, _data2];};
    if (TypeName (_data2 select 0) != "STRING") exitWith {_abort=true; _msg = format ["%1 Mission name not a text string. Found %2",_sec, _data2 select 0];};
    _name = _data2 select 0;
    _data2 = _data select 7; // Trigger section:
    _sec = format ["%1:Trigger Section:",_name];
    
    // Need to scan the 2nd portion of the Trigger section for "CHILD" to extract mission Names.
    // _data2 is an array of size 2
        if (TypeName (_data2) != "ARRAY") exitWith {_abort=true; _msg = format ["%1 data passed is not an ARRAY. Found %1",_sec, _data2];};
        if ( count _data2 != 2) exitWith {_abort=true; _msg = format ["%1 data passed is not an array of size 2. Found %1",_sec, _data2];};    
    // _data2 select 1 is an array.
        if (TypeName (_data select 1) != "ARRAY") exitWith {_abort=true; _msg = format ["%1 data passed is not an ARRAY. Found %1",_sec, _data2 select 1];};    
    // for each _data2 select 1
    _sec = format ["%1:Action/Logic pairs",_sec];
    {
        private ["_newFile"];
        //_x is 2 elements long.
          if (TypeName (_x) != "ARRAY") exitWith {_abort=true; _msg = format ["%1 data passed is not an ARRAY. Found %1",_sec, _x];};
        if ( count _data2 != 2) exitWith {_abort=true; _msg = format ["%1 data passed is not an array of size 2. Found %1",_sec, _x];};    
        //_x select 0 is an array
        if (TypeName (_x select 0) != "ARRAY") exitWith {_abort=true; _msg = format ["%1 [Action] should be an array. Found %1",_sec, _x select 0];};
        //if _x select 0 select 0 == "CHILD" then
        if (TypeName ((_x select 0) select 0) != "STRING") exitWith {_abort=true; _msg = format ["%1 Action name should be a string. Found %1",_sec, (_x select 0) select 0];};
            // _x select 0 select 1 is the file name!
        if ( toupper((_x select 0) select 0) == "CHILD") then
        {
            private ["_newFileData"];
              // add the file name to _fileList
            _newFileData = ((_x select 0) select 1);
            if (TypeName _newFileData != "ARRAY") exitWith {_abort=true; _msg = format ["%1 ['Child' 's file data should be an array [<FileName>,[location],#reps, freq]. Found %1",_sec, _newFileData]; }; 
            _newFile = _newFileData select 0;
            if (TypeName _newFile != "String") exitWith {_abort=true; _msg = format ["%1 ['Child' 's file name should be a string. Found %1",_sec, _newFile]; };            
            _fileList = _fileList + [_newFile];
        };
    }foreach (_data2 select 1);
    if (_abort) exitWith{};
   
    if (true) exitWith{};
};
[_abort, _msg, _fileList] 


