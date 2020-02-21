//MissionTriggerConfig.sqf
// Horbin
// 3/4/15
private ["_triggers","_abort","_prefix","_dat2","_msg","_trigName","_data","_trigNameList","_triggerDef","_validActions"];
_data = _this select 0;
_abort = false;
_prefix = "Trigger Data:";
FuMS_FileError = "";

while {true} do
{
    if (isNil "_data") exitwith {_abort=true; FuMS_FileError = format ["%1 no data found",_prefix];};
    if ([_data,2] call FuMS_fnc_HC_Val_Util_CheckArray) exitwith{_abort=true; FuMS_FileError = format ["%1 should be array of 2 elements. Found %2",_prefix, _data];};
   
    //Check Trigger definition section
    _msg = format ["%1:Definitions",_prefix];
    _triggers =  _data select 0;
    _trigNameList = [];
    if (TypeName _triggers != "ARRAY")exitWith {_abort=true;FuMS_FileError = format ["%1 is not an array. Found %2",_msg,_triggers];};
    
    {
        // Check Name for validity and being unique.
        _msg = format ["%1:Definitions:Name/Trigger Pair :",_prefix ];
        if ([_x,2] call FuMS_fnc_HC_Val_Util_CheckArray) exitWith {_abort=true;FuMS_FileError = format ["%1 is not a proper Name/Trigger Def pair.  Found %2",_msg,_x];};
        if (TypeName (_x select 0) != "STRING")exitWith {_abort=true;FuMS_FileError = format ["%1 Name is not a string.  Found %2",_msg,_x select 0];};
        if ( (_x select 0) in _trigNameList) exitWith {_abort=true;FuMS_FileError = format ["%1 Name in name/trigger pair may only be used once per mission.  Found %2",_msg,_x select 0];};
        _trigNameList = _trigNameList + [toupper (_x select 0)];
        
        // Check Trigger definition format.
        _triggerDef = _x select 1;        
        if (TypeName _triggerDef != "ARRAY") exitWith {_abort=true;FuMS_FileError = format ["%1 has a trigger Def that is not an array. Found %2",_msg,_triggerDef];};
          
        // Check format of the Trigger Definition.
        _trigName = _triggerDef select 0;
        if (TypeName _trigName != "STRING")exitWith {_abort=true;FuMS_FileError = format ["%1 trigger's 1st paramater must be a string. Found %2",_msg,_trigName];};
		switch (toupper _trigName) do
		{
			case "LOWUNITCOUNT":
			{	//string (east,west,guer,civ,logic,resistance) num, num, location]
			//	_foundTrigger = true;
				if (count _triggerDef != 5) exitWith {_abort=true;FuMS_FileError = format ["%1:%2 should be [""%2"",side, numAI, radius, [loc]] Found %3",_msg,_trigName,_triggerDef];};
				_dat2=_triggerDef select 1;
				_dat2 = toupper _dat2;
				if (TypeName (_triggerDef select 1) != "STRING") exitWith{_abort=true;FuMS_FileError = format ["%1:%2 Side should be West,East,Guer, or Civ. Found %3",_msg,_trigName,_triggerDef select 1];};
				if (_dat2 !="EAST" and _dat2 !="WEST" and _dat2 !="GUER" and _dat2!= "CIV" and _dat2 != "LOGIC" and _dat2 != "CIVILIAN" and _dat2 != "RESISTANCE" and _dat2 !="CAPTIVE")
				 exitwith{_abort=true;FuMS_FileError = format ["%1:%2 Side should be West,East,Guer, or Civ. Found %3",_msg,_trigName,_dat2];};
				if (TypeName (_triggerDef select 2) != "SCALAR") exitwith{_abort=true;FuMS_FileError = format ["%1:%2 Number of AI should be a number. Found %3",_msg,_trigName,_triggerDef select 2];};
				if (TypeName (_triggerDef select 3) != "SCALAR")exitwith {_abort=true;FuMS_FileError = format ["%1:%2 radius should be a number. Found %3",_msg,_trigName,_triggerDef select 3];};
				if ([_triggerDef select 4] call FuMS_fnc_HC_Val_Util_VerifyLocation) exitwith {_abort=true;FuMS_FileError = format ["%1:%2 %4 Found %3",_msg,_trigName,_triggerDef select 4, FuMS_FileError];};				
			};
			case "PROXPLAYER":
			{  // location, num, num
			//	_foundTrigger = true;
				if (count _triggerDef != 4) exitWith {_abort=true;FuMS_FileError = format ["%1:%2 should be [""PROXPLAYER"", [loc], radius, numplayers]. Found %3",_msg,_trigName,_triggerDef];};
				if ([_triggerDef select 1] call FuMS_fnc_HC_Val_Util_VerifyLocation) exitwith {_abort=true;FuMS_FileError = format ["%1:%2 %4 Found %3",_msg,_trigName,_triggerDef select 2, FuMS_FileError];};				
				if (TypeName (_triggerDef select 2) != "SCALAR")exitwith {_abort=true;FuMS_FileError = format ["%1:%2 radius should be a number. Found %3",_msg,_trigName,_triggerDef select 2];};
				if (TypeName (_triggerDef select 3) != "SCALAR")exitwith {_abort=true;FuMS_FileError = format ["%1:%2 number AI should be a number. Found %3",_msg,_trigName,_triggerDef select 3];};
			};		
              case "CAPTIVE";
			case "BODYCOUNT":
			{ // num
			if (count _triggerDef != 2) exitWith {_abort=true;FuMS_FileError = format ["%1:%2 should be [""%2"", numAI]. Found %3",_msg,_trigName,_triggerDef];};
			if (TypeName (_triggerDef select 1) != "SCALAR")exitwith {_abort=true;FuMS_FileError = format ["%1:%2 Number AI should be a number. Found %3",_msg,_trigName,_triggerDef select 1];};			
			};
			case "HIGHUNITCOUNT":
			{ // same as lowunitcount
				//_foundTrigger = true;
				if (count _triggerDef != 5) exitWith {_abort=true;FuMS_FileError = format ["%1:%2 should be [""%2"",side, numAI, radius, [loc]] Found %3",_msg,_trigName,_triggerDef];};
				_dat2=_triggerDef select 1;
				_dat2 = toupper _dat2;
				if (TypeName (_triggerDef select 1) != "STRING")exitwith {_abort=true;FuMS_FileError = format ["%1:%2 Side should be West,East,Guer, or Civ. Found %3",_msg,_trigName,_triggerDef select 1];};
				if (_dat2 !="EAST" and _dat2 !="WEST" and _dat2 !="GUER" and _dat2!= "CIV" and _dat2 != "LOGIC" and _dat2 != "CIVILIAN" and _dat2 != "RESISTANCE")
				 exitwith{_abort=true;FuMS_FileError = format ["%1:%2 Side should be West,East,Guer, or Civ. Found %3",_msg,_trigName,_dat2];};
				if (TypeName (_triggerDef select 2) != "SCALAR") exitwith{_abort=true;FuMS_FileError = format ["%1:%2 Number of AI should be a number. Found %3",_msg,_trigName,_triggerDef select 2];};
				if (TypeName (_triggerDef select 3) != "SCALAR")exitwith {_abort=true;FuMS_FileError = format ["%1:%2 radius should be a number. Found %3",_msg,_trigName,_triggerDef select 3];};
				if ([_triggerDef select 4] call FuMS_fnc_HC_Val_Util_VerifyLocation) exitwith {_abort=true;FuMS_FileError = format ["%1:%2 %4 Found %3",_msg,_trigName,_triggerDef select 4, FuMS_FileError];};				
			};
			  case "TIMERNOPLAYERS";
			case "TIMER":
			{ // num
			//	_foundTrigger=true;
				if (count _triggerDef != 2) exitWith {_abort=true;FuMS_FileError = format ["%1:%2 should be [""%2"", time in seconds]. Found %3",_msg,_trigName,_triggerDef];};
				if (TypeName (_triggerDef select 1) != "SCALAR")exitwith {_abort=true;FuMS_FileError = format ["%1:%2 time(in seconds) should be a number. Found %3",_msg,_trigName,_triggerDef select 1];};			
			};
			case "TIMERNOPLAYERS":
			{ // num
			//	_foundTrigger=true;
				if (count _triggerDef != 2) exitWith {_abort=true;FuMS_FileError = format ["%1:%2 should be [""%2"", time in seconds]. Found %3",_msg,_trigName,_triggerDef];};
				if (TypeName (_triggerDef select 1) != "SCALAR")exitwith {_abort=true;FuMS_FileError = format ["%1:%2 time(in seconds) should be a number. Found %3",_msg,_trigName,_triggerDef select 1];};			
			};

			case "DETECTED":
			{  // num, num
			//_foundTrigger=true;
				if (count _triggerDef != 3) exitWith {_abort=true;FuMS_FileError = format ["%1:%2 should be [""%2"", group#, vehicle#]. Found %3",_msg,_trigName,_triggerDef];};
				if (TypeName (_triggerDef select 1) != "STRING") exitwith {_abort=true;FuMS_FileError = format ["%1:%2 group# should be a string of numbers. Found %3",_msg,_trigName,_triggerDef select 1];};							
				if (TypeName (_triggerDef select 2) != "STRING") exitwith {_abort=true;FuMS_FileError = format ["%1:%2 vehicle# should be a string of numbers. Found %3",_msg,_trigName,_triggerDef select 2];};			
			};		
            case "ZUPPACAPTURE":
            {
                
            };
            case "TAKEVEHICLE":
            {
                // ["vehicle number",distane]
             //   _foundTrigger = true;
                if (count _triggerDef != 3) exitWith {_abort=true;FuMS_FileError = format ["%1:%2 should be [""%2"", ""List of Object Index"",distance in m ]. Found %3",_msg,_trigName,_triggerDef];};
                if (TypeName (_triggerDef select 1) != "STRING") exitwith {_abort=true;FuMS_FileError = format ["%1:%2 List of Object Index should be a string of ALL, 1, 1-4, or 2,3,4, etc. Found %3",_msg,_trigName,_triggerDef select 1];};							
                if (TypeName (_triggerDef select 2) != "SCALAR") exitwith {_abort=true;FuMS_FileError = format ["%1:%2 Distance should be a number. Found %3",_msg,_trigName,_triggerDef select 2];};			
                
            };
			
            case "DMGBUILDINGS";
            case "DMGVEHICLES":
            {
                // ["string",%value]
             //   _foundTrigger = true;
                if (count _triggerDef != 3) exitWith {_abort=true;FuMS_FileError = format ["%1:%2 should be [""%2"", ""List of Object Index"",%amount damage ]. Found %3",_msg,_trigName,_triggerDef];};
                if (TypeName (_triggerDef select 1) != "STRING") exitwith {_abort=true;FuMS_FileError = format ["%1:%2 List of Object Index should be a string of ALL, 1, 1-4, or 2,3,4, etc. Found %3",_msg,_trigName,_triggerDef select 1];};							
                if (TypeName (_triggerDef select 2) != "SCALAR") exitwith {_abort=true;FuMS_FileError = format ["%1:%2 %amount damage should be value 0.0 to 1.0. Found %3",_msg,_trigName,_triggerDef select 2];};			
            };
            default {_abort=true; FuMS_FileError = format ["%1 invalid Trigger name. Found %2",_msg,_trigName];};
		};                                
		if (_abort) exitWith{};	 
	}foreach _triggers;
    if (_abort) exitWith{};
    // Now check Trigger Logic section:
    // _trigNameList contains array of 'strings' that are acceptable! anything else found is INVALID!
    _trigNameList = _trigNameList + ["OR"];
    _trigNameList = _trigNameList + ["OK"];

    _msg = format ["%1:Logic Section",_prefix];
    
    
    
    _validActions = ["WIN","LOSE","END","CHILD"];
    
    
    
    if (TypeName (_data select 1) != "ARRAY") exitwith {_abort=true;FuMS_FileError = format ["%1: is not an array. Found %2",_msg,_data select 1];};			
    {
        if ([_x,2] call FuMS_fnc_HC_Val_Util_CheckArray) exitwith{_abort=true; FuMS_FileError = format ["%1 should be an [Action]/[Logic] pair. Found %2",_prefix, _data];};
        //Check 1st element is a VALID Action.
        if (TypeName (_x select 0) != "ARRAY")exitwith {_abort=true;FuMS_FileError = format ["%1: [Action] must be an array with one of %2.  Found %3",_msg,_validActions, _x select 0];};			
        if (TypeName ((_x select 0) select 0) != "STRING")exitwith {_abort=true;FuMS_FileError = format ["%1: Action must a string. one of %2.  Found %3",_msg,_validActions, (_x select 0) select 0];};			
        if (!(((_x select 0) select 0) in _validActions))exitwith {_abort=true;FuMS_FileError = format ["%1: [Action] must be one of %2.  Found %3",_msg,_validActions, _x select 0];};			
        
        // Check the logic portion.
        {
            if (TypeName _x != "STRING")exitwith {_abort=true;FuMS_FileError = format ["%1: Logic must be a list of strings.  Found %2",_msg,_data select 1];};			
            if (! ( (toupper _x) in _trigNameList)) exitwith {_abort=true;FuMS_FileError = format ["%1: Name used not found in Trigger definition section. Found %2. Valid options: %3",_msg,_x,_trigNameList] ;};			
        }foreach (_x select 1);
        if (_abort) exitWith{};
    }foreach (_data select 1);
    
	if(true)exitwith{};
};

_abort


