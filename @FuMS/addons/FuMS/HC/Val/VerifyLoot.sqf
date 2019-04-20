//VerifyLoot.sqf
// Horbin
// 2/25/15
// Inputs: theme Index
// Outputs abort code and message
private ["_dat","_abort","_msg","_dat2","_sec","_dat3","_i","_theme","_name","_pos","_val","_themeList"];
_i = _this select 0;
_dat = FuMS_LOOTDATA;
_themeList = FuMS_ServerData select 3;
_abort = false;
_msg = "";

while {true} do
{    
    _dat = FuMS_LOOTDATA select _i;
    // force check of global.                          
    _theme = _themeList select _i;                 
    // skip data check if theme not using its own data file.
    
    
    //      diag_log format ["##ValidateLootData: _i:%1 _usingGlobal:%2",_i,_usingGlobal];
    
    if (isNil "_dat") exitWith {_abort=true; _msg = format ["Syntax/Format error in LootData.sqf for theme %1",_theme];};//Abort later, no need to if Theme=<NULL>
    if (TypeName _dat != "ARRAY") exitWith {_abort=true; _msg = format ["Syntax/Format error in LootData.sqf for theme %1",_theme];};//Abort later, no need to if Theme=<NULL>        
    if (count _dat == 0) exitWith {_abort=true; _msg = format ["No data to parse in LootData.sqf for theme %1",_theme];};//Abort later, no need to if Theme=<NULL>        
    // _dat is list of Loot configurations
    {
        //-0- 2 strings
        _dat2 =_x;
        if (TypeName _dat2 != "ARRAY") exitWith {_abort=true; _msg = format ["Invalid Loot description. Found %1",_dat2];};
        if ( (count _dat2 < 5) or (count _dat2 > 6))exitWith {_abort=true; _msg = format ["Loot description should have 5 or 6 sections. Found %1",_dat2];};
        _dat3 = _dat2 select 0;			
        if (TypeName _dat3 != "ARRAY") exitWith {_abort=true; _msg = format ["Loot Name or box type invalid"];};
        if (count _dat3 != 2 and count _dat3 !=3)exitWith {_abort=true; _msg = format ["Loot Name or box type invalid. Ex:[""CloneHunter"",""box_nato_ammoveh_f"",""RANDOM"""];};
        if (TypeName (_dat3 select 0) != "STRING" or TypeName (_dat3 select 1) != "STRING") 
        exitWith {_abort=true; _msg = format ["Loot Name or box type invalid"];};
        // all data arrays: ["name",#] or ["name",[x,y,z]] or [ array,#] or [array,[x,y,z]
        _name = _dat3 select 0;	
        //                diag_log format ["##ValidateLootData: loot:%1 File:%2",_name, _file];
        _pos = 1;
        {
            _dat3 = _dat2 select _pos;	//_dat3 is an array of ["item",#] type pairs!
            _pos = _pos +1;
            _sec = format ["%1 Section:",_x];
            //   diag_log format ["##ValidateLootData: Checking %1",_sec];
            if (TypeName _dat3 != "ARRAY") exitWith {_abort=true; _msg = format ["%1:%2 must contain a list of array pairs similiar to [""item"",4].. Found %3",_name,_sec,_dat3];};
            
            {   
                if(TypeName _x != "ARRAY") exitWith {_abort=true; _msg= format ["%1:%2 must contain a list of array pairs similiar to [""item"",4]. Found %3",_name,_sec,_x];};
                if (count _x != 2)exitWith {_abort=true; _msg = format ["%1:%2 must contain an array. Found %3",_name,_sec,_x];};
                _val = _x select 0;
                if (isNil "_val")exitWith {_abort=true; _msg = format ["%1:%2 First entry, a global variable is not defined. CheckSpelling. Found %3",_name,_sec,_x];};
                if (TypeName (_x select 0) != "STRING" and TypeName (_x select 0) != "ARRAY") 
                exitWith {_abort=true; _msg = format ["%1:%2 First entry must be an item string or array. Found %3",_name,_sec,_x select 0];};      
                
                //    diag_log format["##ValidateLootDta: _dat3 select 1:%1 TypeName:%2",_x select 1, TypeName (_x select 1)];
                
                if (TypeName (_x select 1) != "SCALAR" and TypeName (_x select 1) != "ARRAY") 
                exitWith {_abort=true; _msg = format ["%1:%2 Second entry must be a number or array of [x,y,z]. Found %3",_name,_sec,_x select 1];};
                if (TypeName (_x select 1) == "ARRAY") then
                {
                    if( count (_x select 1) != 3) 
                    exitWith {_abort=true; _msg = format ["%1:%2 Second entry must be a number or array of [x,y,z]. Found %3",_name,_sec,_x select 1];};
                };
            }foreach _dat3;
            
            if (_abort) exitWith{};
        }foreach ["Weapons","Magazines","Items","Backpacks"];
        if (_abort) exitWith{};
    }foreach _dat;
    
    if (true) exitWith{};		
};
[_abort, _msg];


