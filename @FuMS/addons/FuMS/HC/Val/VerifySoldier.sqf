//VerifySoldier.sqf
// Horbin
// 2/26/15
// Inputs: theme Index
// Outputs abort code and message
private ["_dat","_abort","_msg","_dat2","_dat3","_i","_theme","_name","_themeList","_pre","_dat4","_dat5","_dat6"];
_i = _this select 0;
_dat = [];
_themeList = FuMS_ServerData select 3;
_abort = false;
_msg = "";
//diag_log format ["##VerifySoldier:%1",_dat];
while {true} do
{    
    _dat = FuMS_SOLDIERDATA select _i;
   // diag_log format ["##VerifySoldier:%1",_dat];
    // force check of global.                          
    _theme = _themeList select _i;                 
    // skip data check if theme not using its own data file.
    if (isNil "_dat") exitWith {_abort=true; _msg = format ["Syntax/Format error in SoldierData  for theme %1",_theme];};//Abort later, no need to if Theme=<NULL>
    if (TypeName _dat != "ARRAY") exitWith {_abort=true; _msg = format ["Syntax/Format error in SoldierData for theme %1",_theme];};//Abort later, no need to if Theme=<NULL>        
    if (count _dat == 0) exitWith {_abort=true; _msg = format ["No data to parse in SoldierData  for theme %1",_theme];};//Abort later, no need to if Theme=<NULL>        
    // _dat is list of Loot configurations
    {
       _dat2 = _x;
		if (isNil "_dat2") exitWith {_abort=true; _msg=format ["Empty soldier definition found"];};
		if (TypeName _dat2 != "ARRAY")exitWith {_abort=true; _msg=format ["Soldier definition should be an array of properties, found %1",_dat2];};
		if (count _dat2 != 14)exitWith {_abort=true; _msg=format ["Soldier definition requires 14 properties (array elements), found %1", count _dat2];};
        if (TypeName (_dat2 select 0 )!= "STRING")exitWith {_abort=true; _msg=format ["Soldier definition name needs to be a text string, found %1", _dat2 select 0];};
		_dat3 = _dat2 select 1;
		if (TypeName _dat3 !="ARRAY")exitWith {_abort=true; _msg=format ["Soldier 'Skills Levels' should be an array of 9 numbers, found %1",_dat3];};
		_name=_dat2 select 0;
		if (count _dat3 != 9 ) exitWith {_abort=true; _msg=format ["Soldier 'Skills Levels' should be an array of 9 numbers, found %1",_dat3];};
		{
			if (TypeName _x != "SCALAR") exitWith {_abort=true; _msg=format ["Soldier 'Skills Levels' should be an array of 9 numbers, found %1",_dat3];};
		}foreach _dat3;
		if (_abort) exitwith {};
		
		_dat3 = _dat2 select 2;
		_pre = format ["%1:Uniform:",_name];
		if (TypeName _dat3 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in form [""uniform name"",%chance], found %2",_pre,_dat3];};
		if (count _dat3 !=2) exitWith {_abort=true; _msg=format ["%1should in form [""name"",%chance], found %2",_pre,_dat3];};
		_dat4 = _dat3 select 0;
		if (isNil "_dat4") exitWith {_abort=true;_msg=format ["%1 variable used is not defined, check spelling. found %2",_pre,_dat3];};
		if (TypeName _dat4 != "STRING" and TypeName _dat4 != "ARRAY")exitWith {_abort=true;_msg=format ["%1 name should be a global variable or string. found %2",_pre,_dat3];};
        if (TypeName (_dat3 select 1 )!= "SCALAR") exitWith {_abort=true;_msg=format ["%1 chance should be a value between 0-1.0. found %2",_pre,_dat3 ];};
		
		_dat3 = _dat2 select 3;
		_pre = format ["%1:Vest:",_name];
		if (TypeName _dat3 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in form [""uniform name"",%chance], found %2",_pre,_dat3];};
		if (count _dat3 !=2) exitWith {_abort=true; _msg=format ["%1should in form [""name"",%chance], found %2",_pre,_dat3];};
		_dat4 = _dat3 select 0;
		if (isNil "_dat4") exitWith {_abort=true;_msg=format ["%1 variable used is not defined, check spelling. found %2",_pre,_dat3];};
		if (TypeName _dat4 != "STRING" and TypeName _dat4 != "ARRAY")exitWith {_abort=true;_msg=format ["%1 name should be a global variable or string. found %2",_pre,_dat3];};
        if (TypeName (_dat3 select 1 )!= "SCALAR") exitWith {_abort=true;_msg=format ["%1 chance should be a value between 0-1.0. found %2",_pre,_dat3 ];};
		
		_dat3 = _dat2 select 4;
		_pre = format ["%1:Helmet:",_name];
		if (TypeName _dat3 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in form [""uniform name"",%chance], found %2",_pre,_dat3];};
		if (count _dat3 !=2) exitWith {_abort=true; _msg=format ["%1should in form [""name"",%chance], found %2",_pre,_dat3];};
		_dat4 = _dat3 select 0;
		if (isNil "_dat4") exitWith {_abort=true;_msg=format ["%1 variable used is not defined, check spelling. found %2",_pre,_dat3];};
		if (TypeName _dat4 != "STRING" and TypeName _dat4 != "ARRAY")exitWith {_abort=true;_msg=format ["%1 name should be a global variable or string. found %2",_pre,_dat3];};
        if (TypeName (_dat3 select 1) != "SCALAR") exitWith {_abort=true;_msg=format ["%1 chance should be a value between 0-1.0. found %2",_pre,_dat3 ];};
		
		_dat3 = _dat2 select 5;
		_pre = format ["%1:Backpack:",_name];
		if (TypeName _dat3 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in form [""uniform name"",%chance], found %2",_pre,_dat3];};
		if (count _dat3 !=2) exitWith {_abort=true; _msg=format ["%1should in form [""name"",%chance], found %2",_pre,_dat3];};
		_dat4 = _dat3 select 0;
		if (isNil "_dat4") exitWith {_abort=true;_msg=format ["%1 variable used is not defined, check spelling. found %2",_pre,_dat3];};
		if (TypeName _dat4 != "STRING" and TypeName _dat4 != "ARRAY")exitWith {_abort=true;_msg=format ["%1 name should be a global variable or string. found %2",_pre,_dat3];};
        if (TypeName (_dat3 select 1) != "SCALAR") exitWith {_abort=true;_msg=format ["%1 chance should be a value between 0-1.0. found %2",_pre,_dat3 ];};
		
		_dat3 = _dat2 select 6;
		_pre = format ["%1:PriWeapon:",_name];
		if (TypeName _dat3 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in form [""uniform name"",%chance], found %2",_pre,_dat3];};
		if (count _dat3 !=2) exitWith {_abort=true; _msg=format ["%1should in form [""name"",%chance], found %2",_pre,_dat3];};
		_dat4 = _dat3 select 0;
		if (isNil "_dat4") exitWith {_abort=true;_msg=format ["%1 variable used is not defined, check spelling. found %2",_pre,_dat3];};
		if (TypeName _dat4 != "STRING" and TypeName _dat4 != "ARRAY")exitWith {_abort=true;_msg=format ["%1 name should be a global variable or string. found %2",_pre,_dat3];};
        if (TypeName (_dat3 select 1 )!= "SCALAR") exitWith {_abort=true;_msg=format ["%1 chance should be a value between 0-1.0. found %2",_pre,_dat3 ];};
		
		_dat3 = _dat2 select 8;
		_pre = format ["%1:SecWeapon:",_name];
		if (TypeName _dat3 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in form [""uniform name"",%chance], found %2",_pre,_dat3];};
		if (count _dat3 !=2) exitWith {_abort=true; _msg=format ["%1should in form [""name"",%chance], found %2",_pre,_dat3];};
		_dat4 = _dat3 select 0;
		if (isNil "_dat4") exitWith {_abort=true;_msg=format ["%1 variable used is not defined, check spelling. found %2",_pre,_dat3];};
		if (TypeName _dat4 != "STRING" and TypeName _dat4 != "ARRAY")exitWith {_abort=true;_msg=format ["%1 name should be a global variable or string. found %2",_pre,_dat3];};
        if (TypeName (_dat3 select 1) != "SCALAR") exitWith {_abort=true;_msg=format ["%1 chance should be a value between 0-1.0. found %2",_pre,_dat3 ];};
		
		//scope, muzzle, flashlight
		_dat3 = _dat2 select 7;
		_pre= format ["%1:WeaponAttachments:",_name];
		if (TypeName _dat3 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in form [1,1,1], found %2",_pre,_dat3];};
		if (count _dat3 !=3) exitWith {_abort=true; _msg=format ["%1should in form [1,1,1], found %2",_pre,_dat3];};		
		{
			if (TypeName _x != "SCALAR") exitWith {_abort=true; _msg=format ["%1should be an array of 3 numbers between 0-1.0, found %1",_dat3];};
		}foreach _dat3;
		if (_abort) exitwith {};
		
		//Belt Items
		_dat3 = _dat2 select 9;
		_pre= format ["%1:BeltItems:",_name];
		if (TypeName _dat3 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in form [1,1,1,1,1], found %2",_pre,_dat3];};
		if (count _dat3 !=5) exitWith {_abort=true; _msg=format ["%1should in form [1,1,1,1,1], found %2",_pre,_dat3];};		
		{
			if (TypeName _x != "SCALAR") exitWith {_abort=true; _msg=format ["%1should be an array of 5 numbers between 0-1.0, found %1",_dat3];};
		}foreach _dat3;
		if (_abort) exitwith {};
		//vision items
		_dat3 = _dat2 select 10;
		_pre= format ["%1:Vision:",_name];
		if (TypeName _dat3 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in form [1,1,1], found %2",_pre,_dat3];};
		if (count _dat3 !=3) exitWith {_abort=true; _msg=format ["%1should in form [1,1,1], found %2",_pre,_dat3];};		
		{
			if (TypeName _x != "SCALAR") exitWith {_abort=true; _msg=format ["%1should be an array of 3 numbers between 0-1.0, found %1",_dat3];};
		}foreach _dat3;
		if (_abort) exitwith {};
		
		_dat3 = _dat2 select 11;
		_pre= format ["%1:Special Settings:",_name];
        if (TypeName _dat3 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in form [true,true,true] or [true,true,""AIR""], found %2",_pre,_dat3];};
		if (count _dat3 !=3 and count _dat3 !=4) exitWith {_abort=true; _msg=format ["%1should array of 3 or 4 true/false values, found %2",_pre,_dat3];};	
        if (TypeName (_dat3 select 0) != "BOOL") exitWith {_abort=true; _msg=format ["%1DiverOverWater flag should be  true/false value, found %1",_dat3 select 0];};     
        if (TypeName (_dat3 select 1) != "BOOL") exitWith {_abort=true; _msg=format ["%1Unlimited Ammo flag should be  true/false value, found %1",_dat3 select 1];};     
        if (TypeName (_dat3 select 2) != "ARRAY" ) exitWith {_abort=true; _msg=format ["%1AntiTank/AntiAir flag:3 should be [""false"",""RANDOM"", ""AIR"", or ""LAND"" , Percentage of spawning], found %2",_pre,_dat3 select 2];};     
        if (count (_dat3 select 2) != 2  ) exitWith {_abort=true; _msg=format ["%1AntiTank/AntiAir flag:5 should be [""false"",""RANDOM"", ""AIR"", or ""LAND"" , Percentage of spawning], found %2",_pre,_dat3 select 2];};     

/*        if (TypeName ((_dat3 select 2) select 0) == "STRING") then
        {
            if (toupper ((_dat3 select 2) select 0) != "AIR" and toupper ((_dat3 select 2) select 0) != "LAND" and toupper ((_dat3 select 2) select 0) != "RANDOM") exitwith {_abort=true;_msg=format ["%1AntiTank/AntiAir flag:6 should be [""false"",""RANDOM"", ""AIR"", or ""LAND"" , Percentage of spawning], found %2",_pre,_dat3 select 2];};     
        };

*/



		_dat3 = _dat2 select 12;
		_pre= format ["%1:Items",_name];
		if (TypeName _dat3 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in an array of items [[""item"", %chance],[min,max]], found %2",_pre,_dat3];};
		{
			_dat4 = _x; // array of 2 [  [item,%],  [min,max] ]
			if (TypeName _dat4 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in an array of items [[""item"", %chance],[min,max]], found %2",_pre,_dat4];};
			if (count _dat4 != 2) exitWith {_abort=true; _msg=format ["%1should in an array of items [[""item"", %chance],[min,max]], found %2",_pre,_dat4];};
			_dat5 = _dat4 select 0;
			if (TypeName _dat5 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in an array of items [[""item"", %chance],[min,max]], found %2",_pre,_dat5];};
			if (count _dat5 != 2) exitWith {_abort=true; _msg=format ["%1should in an array of items [[""item"", %chance],[min,max]], found %2",_pre,_dat5];};
			_dat6 = _dat5 select 0;		
			if (isNil "_dat6") exitWith {_abort=true;_msg=format ["%1 variable used is not defined, check spelling. found %2",_pre,_dat5];};
			if (TypeName _dat6 != "STRING" and TypeName _dat6 != "ARRAY")exitWith {_abort=true;_msg=format ["%1 name should be a global variable or string. found %2",_pre,_dat3];};
            if (TypeName (_dat5 select 1) != "SCALAR") exitWith {_abort=true;_msg=format ["%1 chance should be a value between 0-1.0. found %2",_pre,_dat3 ];};	
			_dat5 = _dat4 select 1;
			if (TypeName _dat5 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in an array of items [[""item"", %chance],[min,max]], found %2",_pre,_dat5];};
			if (count _dat5 != 2) exitWith {_abort=true; _msg=format ["%1should in an array of items [[""item"", %chance],[min,max]], found %2",_pre,_dat5];};
            if (TypeName (_dat5 select 0) != "SCALAR") exitWith {_abort=true;_msg=format ["%1 chance should be a value between 0-50. found %2",_pre,_dat5  ];};	
            if (TypeName (_dat5 select 1) != "SCALAR") exitWith {_abort=true;_msg=format ["%1 chance should be a value between 0-50. found %2",_pre,_dat5 ];};									
		}foreach _dat3;
		if (_abort) exitWith {};
        _dat3 = _dat2 select 13;
        _pre = format ["%1:Crypto and Faction",_name];
        if (TypeName _dat3 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should in an array of [""Value Name"", amount] pairs, found %2",_pre,_dat3];};
        {
            _dat4 = _x;
            if (TypeName _dat4 !="ARRAY") exitWith {_abort=true; _msg=format ["%1should be a [""Value Name"", amount] pair, found %2",_pre,_dat4];};
            if (count _dat4 != 2) exitWith {_abort=true; _msg=format ["%1should be a [""Value Name"", amount] pair , found %2",_pre,_dat4];};
        }foreach _dat3;
        if (_abort) exitWith {};
    }foreach _dat;   
    if (true) exitWith{};		
};
[_abort, _msg];


