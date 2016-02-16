//ValidateMissionData.sqf
// Horbin
// 3/1/15
//Inputs: Works off data in global variable FuMS_ListofMissions []
// ListofMissions is indexed by the number of themes. This routine called from FuMsnInit
// within each index is an array of ["MissionName","Mission Code-String"] pairs for each mission in the theme.
private ["_abort","_msg","_start","_critical","_i","_theme","_file","_path"];
_abort = false;
_msg = "";
_critical = false;
_start = time;
while {true} do
{
	for [{_i=0},{_i < count FuMS_ListofMissions},{_i=_i+1}] do  // for each Theme!
	{  
        private ["_dat","_mission"];
        _abort = false;
        _msg = "";
        _theme = ((FuMS_THEMEDATA select _i) select 0 ) select 0;
        _file = "\FuMS\Themes\";
        if (isNil "_theme") then{_abort=true;_msg="Error in Theme definition, skipping mission check for this theme.";_theme = "NONE";}
        else
        {
            if (TypeName _theme != "STRING") then{_abort=true;_msg="Error in Theme definition, skipping mission check for this theme.";}            
            else
            {
                _path = "\FuMS\Themes";
                if ( _theme !="<FuMS_OFFLINE>") then  // theme is not already off line,  so check out the missions
                {
                    
                    _dat = FuMS_ListofMissions select _i; // list of mission, mission code pairs for this theme!
                    private ["_ii"]; // _ii = index for each mission.  _i=index for the theme.
                    for [{_ii=0},{_ii < count _dat},{_ii=_ii+1}]do
                    {
                        private ["_status","_missionCode","_missiondat"];    
                        _abort = false;
                        _mission = (_dat select _ii) select 0;
                        _missionCode = (_dat select _ii) select 1;                    
                        _file = format ["%1\%2\%3",_path,_theme,_mission];
                       // diag_log format ["##ValidateMissionData: Validating %1",_file];
                        if ([_missionCode] call FuMS_fnc_HC_Val_Msn_VerifyMission) then                        
                        {
                            _abort=true; 
                            _msg = FuMS_FileError;
                            _dat set [_ii,[_mission, "OFFLINE"] ];                                                                  
                            FuMS_ListofMissions set [_i, _dat];
                            diag_log format ["-------------------------------------------------------------------------------------"];
                            diag_log format ["----------------            Fulcrum Mission System                    -----------------"];
                            diag_log format ["-------------------------------------------------------------------------------------"];
                            diag_log format ["##ValidateMissionData: ERROR in Mission Data"];
                            diag_log format ["Recommend verifying data in file %1 on your server!",_file];                
                            diag_log format ["                          Mission %1 in Theme %2 offline!", _mission, _theme];
                            diag_log format ["REASON: %1",_msg];
                            diag_log format ["-------------------------------------------------------------------------------------"];
                            diag_log format ["-------------------------------------------------------------------------------------"];   
                             if (!isServer) then
                            {
                                FuMS_DataValidation = format[ "%1",_file];
                                publicVariableServer "FuMS_DataValidation";     
                            };
                        };
                    };
                };
            };
        };
    }; 
	if (true) exitWith{};
};
if (_critical) then
{
    diag_log format ["-------------------------------------------------------------------------------------"];
    diag_log format ["----------------            Fulcrum Mission System                    -----------------"];
    diag_log format ["-------------------------------------------------------------------------------------"];    
    diag_log format ["##ValidateMissionData: CRITICAL ERROR!"];
    diag_log format ["Recommend verifying data in file %1 on your server!",_file];            
    diag_log format ["                         FuMS offline!"];       
    diag_log format ["REASON: %1",_msg];
    diag_log format ["-------------------------------------------------------------------------------------"];
    diag_log format ["-------------------------------------------------------------------------------------"];     
     if (!isServer) then
    {
        FuMS_DataValidation = format ["%1",_file];
        publicVariableServer "FuMS_DataValidation";      
    };
}else { diag_log format ["------ Mission Data validation complete. %1secs----",time -_start];_abort=false;}; 
_abort



