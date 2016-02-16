//ValidateSoldierData.sqf
// Horbin
// 2/22/15
// Inputs ServerData array
// OUTPUTS true or false
private ["_abort","_msg","_globalIndex","_themeList","_file","_start","_critical","_i","_theme","_usingGlobal"];
_themeList = FuMS_ServerData select 3;
_globalIndex = count _themeList;    // index to globalLoot and globalSoldier data.
_abort = false;
_msg = "";
_file = "";
_start = time;
_critical=false;
while {true} do
{	
	_file = "\FuMS\Themes\BaseServerData.sqf";
	if (isNil "FuMS_SOLDIERDATA") exitWith {_abort = true;_critical=true; _msg = format ["No SOLDIERDATA passed to Headless Client"];}; 
    if (TypeName FuMS_SOLDIERDATA != "ARRAY") exitWith {_abort = true;_critical=true; _msg = format ["No SoldierData defined by Server"];};
	if (count FuMS_SOLDIERDATA == 0) exitWith {_abort = true;_critical=true; _msg = format ["No Soldier Data defined by Server"];};    
    if (TypeName _themeList != "ARRAY") exitWith {_abort = true;_critical=true; _msg = format ["No ServerData defined by Server"];};    
   // diag_log format ["##ValidateSoldierData: _globalIndex:%1",_globalIndex];
    for [{_i=0},{_i < _globalIndex+1},{_i=_i+1}] do 
	{
        private ["_status"];        
        if (_i == (_globalIndex)) then
        {
            _file = "\FuMS\Themes\GlobalSoldierData.sqf";
            _theme="";
            _critical=true;
            _usingGlobal = false; // this IS the global data, so force it to be checked!
        }
        else
        {
            _theme = ((FuMS_THEMEDATA select _i) select 0 ) select 0;
            if (isNil "_theme") then
            {
                // this theme has already been removed! No other testing required!
                _usingGlobal = true;
            }else
            {
                _file = format ["\FuMS\Themes\%1\SoldierData.sqf",_theme];               
                _usingGlobal = (((FuMS_THEMEDATA select _i) select 0) select 4);
            };
        };
        if (!_usingGlobal) then 
        {
            _status = [_i] call FuMS_fnc_HC_Val_VerifySoldier;
            _abort = _status select 0;
            _msg = _status select 1;
        };
       if (_abort and !_critical) then
        {
            diag_log format ["-------------------------------------------------------------------------------------"];
            diag_log format ["----------------            Fulcrum Mission System                    -----------------"];
            diag_log format ["-------------------------------------------------------------------------------------"];            
            diag_log format ["##ValidateSoldierData: ERROR in FuMS_SOLDIERDATA"];
            diag_log format ["Recommend verifying data in file %1 on your server!",_file];            
            diag_log format ["                          Theme %1 offline!", _theme];
            _abort = false;
            FuMS_ActiveThemes = FuMS_ActiveThemes - [_theme];     
             _update = FuMS_THEMEDATA select 0;
            _update set [0,"<FuMS_OFFLINE>"];
            FuMS_THEMEDATA set [0, _update];
            diag_log format ["REASON: %1",_msg];
            diag_log format ["-------------------------------------------------------------------------------------"];
            diag_log format ["-------------------------------------------------------------------------------------"];      
            FuMS_DataValidation = format ["%1",_file];
            publicVariableServer "FuMS_DataValidation";                         	
        };           
     };
    if (true) exitWith{};
};
if (count FuMS_ActiveThemes == 0) then {_critical=true;_abort=true;}; // no themes and it is offlline, so all of FuMS is offline!
if (_critical and _abort) then
{
    diag_log format ["-------------------------------------------------------------------------------------"];
    diag_log format ["----------------            Fulcrum Mission System                    -----------------"];
    diag_log format ["-------------------------------------------------------------------------------------"];    
    diag_log format ["##ValidateSoldierData: CRITICAL ERROR!"];
    diag_log format ["Recommend verifying data in file %1 on your server!",_file];            
    diag_log format ["                         FuMS offline!"];       
    diag_log format ["REASON: %1",_msg];
    diag_log format ["-------------------------------------------------------------------------------------"];
    diag_log format ["-------------------------------------------------------------------------------------"];      
    FuMS_DataValidation = format ["%1",_file];
    publicVariableServer "FuMS_DataValidation";  
}else { diag_log format ["------ Soldier Data validation complete  %1secs-----", time - _start];_abort=false;};
_abort



