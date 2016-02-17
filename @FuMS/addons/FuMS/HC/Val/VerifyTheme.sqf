//VerifyTheme.sqf
// Horbin
// 2/25/15
// Inputs: theme Index
// Ouputs: true if all data checks good.
private ["_dat","_abort","_msg","_dat2","_sec","_dat3","_i","_theme"];
_i = _this select 0;
_theme = (FuMS_ServerData select 3) select _i;
//	_file = format ["\FuMS\Themes\%1\ThemeData.sqf",_theme];
_dat = FuMS_THEMEDATA select _i;
_abort = false;
_msg = "";
while {true} do
{	
    if (isNil "_dat") exitWith {_abort=true; _msg = format ["Syntax/Format error in ThemeData.sqf for theme %1",_theme];};//Abort later, no need to if Theme=<NULL>
    if (TypeName _dat != "ARRAY") exitWith {_abort=true; _msg = format ["Syntax/Format error in ThemeData.sqf for theme %1",_theme];};//Abort later, no need to if Theme=<NULL>
    if (count _dat !=  4  and  count _dat !=5) exitWith {_abort=true; _msg = format ["ThemeData Error in theme %1. Expected 4 sections, found %2",_theme, count _dat];};  // 4 major fields defined in each ThemeData.sqf		
    // Options -6-
    _sec = "Options:";
    _dat2 = _dat select 0;
    //   string, fix it dynamically
    //   scalar 1,2,3,4
    //   scalar
    //   bool
    //   bool
    // bool - admin controls
    if (TypeName _dat2 != "ARRAY") exitWith {_abort = true;_msg = format ["%1 found %2, expected array of entries",_sec, _dat2];}; 
    if ((count _dat2) != 8) exitWith {_abort = true;_msg = format ["%1 found %2, expected 8 entries",_sec, count _dat2];}; 
    _dat3 = _dat2 select 0;
    if (TypeName _dat3 != "STRING") exitWith {_abort = true;_msg = format ["%1 Theme name should be a text string! Found %2",_sec, count _dat3];}; 
    if ( _dat3 != (_theme select 0)) exitWith {_abort = true; _msg = format ["%1 Theme name mismatch! Theme name in BaseServerData:%2, found %3 in the actual THEMEDATA. Values MUST MATCH!",_sec, _theme select 0, _dat3];}; 
    _dat3 = _dat2 select 1;
    if (TypeName _dat3 != "SCALAR") exitWith {_abort = true;_msg = format ["%1 Mission selection option needs to be a number betweeen 1 and 4, found %2",_sec, _dat3];};
    if (_dat3 > 5 or _dat3 <0) exitWith {_abort = true;_msg = format ["%1 Mission selection option needs to be a number betweeen 1 and 5, found %2",_sec, _dat3];};
    _dat3 = _dat2 select 2;
    if (TypeName _dat3 != "SCALAR") exitWith {_abort = true;_msg = format ["%1 Respawn delay needs to be a number a number, found %2",_sec, _dat3];};
    _dat3 = _dat2 select 3;
    if (TypeName _dat3 != "BOOL") exitWith {_abort = true;_msg = format ["%1 Global Loot Data flag needs to be true or false, found %2",_sec, _dat3];};
    _dat3 = _dat2 select 4;
    if (TypeName _dat3 != "BOOL") exitWith {_abort = true;_msg = format ["%1 Global Soldier Data flag needs to be true or false, found %2",_sec, _dat3];};
    _dat3 = _dat2 select 5;
    if (TypeName _dat3 != "BOOL") exitWith {_abort = true;_msg = format ["%1 Admin Controls flag needs to be true or false, found %2",_sec, _dat3];};
     _dat3 = _dat2 select 6;
    if (TypeName _dat3 != "SCALAR") exitWith {_abort = true;_msg = format ["%1 Min Players for theme needs to be a number,  found %2",_sec, _dat3];};
     _dat3 = _dat2 select 7;
    if (TypeName _dat3 != "SCALAR") exitWith {_abort = true;_msg = format ["%1 Max Players for theme needs to be a number, found %2",_sec, _dat3];};
    // Mission List -list-
    // array of atleast 1 element
    // each element can be:
    //   string
    //   string,string
    //   string, 2d array
    //   string, 3d array
    _sec = "Mission List:";
    _dat2 = _dat select 1;
    //diag_log format ["##ValidateThemeData: _dat2:%1",_dat2];
    if (TypeName _dat2 != "ARRAY") exitWith {_abort = true;_msg = format ["%1 Needs to be an array of mission names, found %2",_sec, _dat2];};      
    if (TypeName _dat2 != "ARRAY") exitWith {_abort = true;_msg = format ["%1 Needs to be an array of mission names, found %2",_sec, _dat2];};
    if ( !(count _dat2 > 0)) exitWith {_abort = true;_msg = format ["%1 Needs to contain at least 1 mission, found %2",_sec, _dat2];};      
    {
        // diag_log format ["##ValidateThemeData: count=:%1 for _x:%2",count _x, _x];
        if ( TypeName _x !="ARRAY") exitWith {_abort=true;}; 
        if (count _x !=1 and count _x != 2) exitWith {_abort=true;};
        if (count _x == 1 and  TypeName (_x select 0) != "STRING") exitWith {_abort=true;};            
        if (count _x == 2) then
        {
            if (TypeName (_x select 0) != "STRING") exitWith {_abort=true;};
            if (TypeName (_x select 1) != "STRING" and TypeName (_x select 1) !="ARRAY") exitWith {_abort=true;};                
            if (TypeName (_x select 1) == "ARRAY") then
            {
                if (count (_x select 1) !=2 and count (_x select 1) != 3) exitWith {_abort=true;}; 
            };
        };            
    }foreach _dat2;
    if (_abort) exitWith {_msg =format ["%1 should be of format [""MsnName""], [""TestHeloPatrol"",""Stavros""], or [""MazeTest"",[23587,18368.5]]] , found %2",_sec, _dat2];}; 		
    // Locations -list-
    // array of zero + elements
    // each element can be:
    //   string
    //   2d array, string
    //   3d array, string
    //   2d array
    //   3d array
    _sec = "Locations List:";
    _dat2 = _dat select 2;
    if (TypeName _dat2 != "ARRAY") exitWith {_abort = true;_msg = format ["%1 Needs to be an array of location names or points, found %2",_sec, _dat2];};		
    {
        if (TypeName _x != "ARRAY") exitWith {_abort=true;format ["![not array]:%1",_sec];}; 
        if (count _x == 1 and TypeName (_x select 0) != "STRING")  exitWith {_abort=true;format ["![string]:%1",_sec];}; 
        if (count _x == 2 ) then
        {
            _abort = true;
            if ((TypeName (_x select 0) == "ARRAY" and TypeName (_x select 1) == "STRING")) then
            {
                if (count (_x select 0) == 2 or count (_x select 0) == 3) then
                {
                    _abort = false;
                };            
            };
            if ((TypeName (_x select 0) == "SCALAR" and TypeName (_x select 1) == "SCALAR")) then {_abort=false;};
        };
        if (_abort) exitWith {_msg =format ["%1 should be of format [""Keyword""], [[x,y],""Custom Name""], or [23587,18368.5] , found %2",_sec, _dat];}; 		
        //if (count (_x select 1) != 1 or count (_x select 1) != 2) exitWith {_abort=true;}; 
    }foreach _dat2;
    if (_abort) exitWith {_msg =format ["%1 should be of format [""Keyword""], [[x,y],""Custom Name""], or [23587,18368.5] , found %2",_sec, _dat];}; 		
    // Radio Chatter -3-
    // -1-
    //  6 values
    //   1 = "ALL" or scalar 0-9
    //   2 = bool
    //   3 = bool
    //   4 = scalar
    //   5 = string
    //   6 = string
    _sec = "Radio Chatter:";
    _dat2 = _dat select 3;
    if (TypeName _dat2 != "ARRAY") exitWith {_abort = true;_msg = format ["%1 Malformed data detected. Data should be an array, found %2",_sec, _dat2];};		
    _dat3 = _dat2 select 0;
    if (TypeName _dat3 != "ARRAY") exitWith {_abort = true;_msg = format ["%1 Configuration section requires 6 entries, found %2",_sec, _dat3];};		        
    if (count _dat3 != 6) exitWith {_abort=true;_msg= format ["%1 Configuration section requires 6 entries. Found %2",_sec,_dat3];};
    if (TypeName (_dat3 select 0) != "STRING" and TypeName (_dat3 select 0) != "SCALAR" )exitWith {_abort=true;_msg= format ["%1 Radio Channel should be ""ALL"" or 0-9. Found %2",_sec,_dat3 select 0];};
    if (TypeName (_dat3 select 1) != "BOOL")exitWith {_abort=true;_msg= format ["%1 silent checkin flag should be true or false. Found %2",_sec,_dat3 select 1];};
    if (TypeName (_dat3 select 2) != "BOOL")exitWith {_abort=true;_msg= format ["%1 AI death message flag should be true or false. Found %2",_sec,_dat3 select 2];};
    if (TypeName (_dat3 select 3) != "SCALAR")exitWith {_abort=true;_msg= format ["%1 Radio range should be a number. Found %2",_sec,_dat3 select 3];};
    if (TypeName (_dat3 select 4) != "STRING")exitWith {_abort=true;_msg= format ["%1 AI callsign should be a text value. Found %2",_sec,_dat3 select 4];};
    if (TypeName (_dat3 select 5) != "STRING")exitWith {_abort=true;_msg= format ["%1 BaseOps callsign should be a text value. Found %2",_sec,_dat3 select 5];};	
    
    // -2-
    //  array of length 8
    //   each element is array
    //     each sub is a string.
    _dat3 = _dat2 select 1;
    if (TypeName _dat3 != "ARRAY")exitWith {_abort=true;_msg= format ["%1 AI to Base Chatter should be a list 8 items. Found %2",_sec,_dat3];};	
    if (count _dat3 != 8 and count _dat3 != 7)exitWith {_abort=true;_msg= format ["%1 AI to Base Chatter should be a list 8 items. Found %2",_sec,_dat3];};	
    {			
        if (TypeName _x != "ARRAY") exitWith {_abort=true;_msg= format ["%1 AI to Base Chatter should be 8 separate string pairs [""CheckIn"",""On Staton""]. Found %2",_sec, _x];};
        if (count _x != 2 or TypeName (_x select 0) != "STRING" or TypeName (_x select 1) != "STRING") exitWith {_abort=true;_msg= format ["%1 AI to Base Chatter should be 8 separate string pairs [""CheckIn"",""On Staton""]. Found %2",_sec, _x];};
    }foreach _dat3;
    // -3-
    //  array of length 8
    //   each element is array
    //     each sub is a string.
    _dat3 = _dat2 select 2;
    if (TypeName _dat3 != "ARRAY")exitWith {_abort=true;_msg= format ["%1 Base to AI Chatter should be a list 8 items. Found %2",_sec,_dat3];};	
    if (count _dat3 != 8 and count _dat3 != 7)exitWith {_abort=true;_msg= format ["%1 Base to AI Chatter should be a list 8 items. Found %2",_sec,_dat3];};	
    {			
        if (TypeName _x != "ARRAY") exitWith {_abort=true;_msg= format ["%1 Base to AI Chatter should be 8 separate string pairs [""CheckIn"",""On Staton""]. Found %2",_sec, _x];};
        if (count _x != 2 or TypeName (_x select 0) != "STRING" or TypeName (_x select 1) != "STRING") exitWith {_abort=true;_msg= format ["%1 Base to AI Chatter should be 8 separate string pairs [""CheckIn"",""On Staton""]. Found %2",_sec, _x];};
    }foreach _dat3;
    if (true) exitWith {};
};
[_abort, _msg]



    
    
    