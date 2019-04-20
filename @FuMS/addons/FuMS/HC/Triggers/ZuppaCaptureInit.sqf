//ZupaCaptureInit.sqf
// Horbin
// Code heavily based upon Zupa's Capture points
// http://epochmod.com/forum/index.php?/topic/32882-server-addon-zcp-zupas-capture-points-20-updated-for-epoch-03/
// Inputs:
//  Encounter Center
//  Radius
private ["_missionName","_themeIndex","_msnText","_ogjstr","_arrayOfData","_eCenter","_ZupaTrackerVar","_msnTag","_trigName","_root"];

_arrayOfData = _this select 0; // contains array of [ [offset], radius, time] elements
_themeIndex = _this select 1;
_missionName = _this select 2;
_eCenter = _this select 3;
_msnTag = _this select 4;
_trigName = _this select 5;
_root = format ["%1_%2",_msnTag,_trigName];
// Mission Start Msg: "ZCP-FuMS" "%1 has made Camp. Check your map for the location and claim it for your own!",_ZCP_name]];
FuMS_Trigger_ZupaCapture set [_themeIndex, false];
missionNamespace setVariable [format ["%1_ZuppaCapture",_root], false];
missionNamespace setVariable [format ["%1_ZuppaTerminate",_msnTag], false];

//diag_log format ["<FuMS:%1> ZupaCapture: setting for %3 under theme Index %2",FuMS_Version,_themeIndex, _missionName];

if (count _arrayOfData == 1) then 
{
    _msnText = [_missionName,"Fresh Cap Point",format["%1 has become a fresh capture point!",_missionName]  ];
}
else
{
    _msnText = [_missionName,"Fresh Cap Points", format ["%1 has established %2 capture points!",_missionName, count _arrayOfData] ];
};

_ogjstr = format ["<t color='#f29420'>%1</t>",_msnText select 0];
_ogjstr = format ["%1<br /><t color='#f22b20'>%2</t>",_ogjstr,_msnText select 1];
_ogjstr = format ["%1<br />__________", _ogjstr];
_ogjstr = format["%1<br /><t color='#ffff00'>%2</t>",_ogjstr, _msnText select 2];
//FuMS_GlobalHint = _ogjstr;
//publicVariable "FuMS_GlobalHint"; 

FuMS_ExileToast = ["Capture points established",_ogjstr];
publicVariable "FuMS_ExileToast";					
 	  

// create variable that will be used to track the state of each flag.
// this will be an array of bool's, one for each cap point specified in the Trigger.
_ZupaTrackerVar = format ["%1_ZuppaTracker",_root];
missionNamespace setVariable [_ZupaTrackerVar, []];

// for each ZupaCapture data element [offset], radius, time, "name"]
{
    private ["_offset","_ZCP_CapRadius","_ZCP_CapTime","_capPointName","_capturePosition","_mkrName","_dotName","_marker","_dot"];
    _offset = _x select 0;
    _ZCP_CapRadius = _x select 1;
    _ZCP_CapTime = _x select 2;
    _capPointName = _x select 3;
    _capturePosition = [_eCenter, _offset] call FuMS_fnc_HC_MsnCtrl_Util_XPos;    
    
    _mkrName = format ["%1_Point%2",_root,_capturePosition];
    _marker = createMarker [_mkrName, _capturePosition];
    _marker setMarkerColor "ColorIndependent"; // Free
    _marker 		setMarkerShape "ELLIPSE";
    _marker 		setMarkerBrush "Solid";
    _marker 		setMarkerSize [_ZCP_CapRadius,_ZCP_CapRadius];
    //_marker 		setMarkerText _name;
    _dotName = format ["%1DOT",_mkrName];
    _dot 			= createMarker [_dotName, _capturePosition];
    _dot 			setMarkerColor "ColorBlack";
    _dot 			setMarkerType "hd_flag";
    _dot 			setMarkerText _capPointName;
    publicVariable _mkrName;
    publicVariable _dotName;
    ["Markers",_mkrName] call FuMS_fnc_HC_Util_HC_AddObject;
    ["Markers",_dotName] call FuMS_fnc_HC_Util_HC_AddObject;
         
    // spawn process to control the cap Point.
    [_capturePosition, _ZCP_CapRadius, _ZCP_CapTime, _capPointName, _missionName, _mkrName, _dotName, _ZupaTrackerVar, _msnTag  ] spawn
    {
        private ["_capturePosition","_ZCP_CapRadius","_ZCP_CapTime","_missionName","_ZCP_currentCapper","_ZCP_previousCapper","_ZCP_currentGroup",
        "_ZCP_startContested","_ZCP_wasContested","_ZCP_continue","_ZCP_Halfway","_ZCP_min","_ZCP_Data","_capPointName","_mkrName",
        "_dotName","_ZupaTrackerVar","_holder","_ogjstr","_msnText","_ZCP_TimeRemaining","_hasbeentouchedbyplayer","_previousReportedTime",
    "_msnEnd","_msnTag"];  
        _capturePosition = _this select 0;
        _ZCP_CapRadius = _this select 1;
        _ZCP_CapTime = _this select 2;
        _capPointName = _this select 3;
        _missionName = _this select 4;
     //   _themeIndex = _this select 5;
        _mkrName = _this select 5;
        _dotName = _this select 6;
        _ZupaTrackerVar = _this select 7;
        _msnTag = _this select 8;
        
        _ZCP_Data = [];
       // _ZCP_changedOwner = true;
        _ZCP_currentCapper = objNull;
        _ZCP_previousCapper = objNull;
        _ZCP_currentGroup = objNull;
        _ZCP_startContested = 0;	
        _ZCP_wasContested = false;
        _ZCP_continue = true;		
        _ZCP_Halfway = false;
        _ZCP_min = false;
        _hasbeentouchedbyplayer = false;
        _msnEnd = false;
        _previousReportedTime = _ZCP_CapTime;
        _ZCP_timeRemaining = _ZCP_CapTime;
        // initialize each element of the global variable to track the state of each FLAG.
     //   diag_log format ["<FuMS:%1> ZupaCapture: ZupaTrackerVar name :%2",FuMS_Version,_ZupaTrackerVar];
        _holder = missionNamespace getVariable _ZupaTrackerVar;
        _holder = _holder + [[false, _mkrName, _dotName]]; // set to true when flag is finally captured. (full timeout)
        missionNamespace setVariable [_ZupaTrackerVar, _holder];
        
        _ZCP_Data set [1,0];  // set to get rid of the global
        while{_ZCP_continue and !_msnEnd}do
        {				
            private ["_proximityList","_msg"];
            _proximityList = [];	
            _ogjstr = [];
            _msnEnd = missionNamespace getVariable (format ["%1_ZuppaTerminate",_msnTag]);
            {			
                if(isPlayer _x && alive _x)then
                {
                    _nil =  _proximityList pushBack _x;
                };
            }count (_capturePosition nearEntities _ZCP_CapRadius);

            //diag_log format ["<FuMS:%1> ZupaCapture: Players near point %2 = %3",FuMS_Version, _capturePosition, _proximityList];
            
            if(count(_proximityList) == 0) then
            {
                _ZCP_currentCapper = objNull;
                _ZCP_previousCapper = objNull;
                _ZCP_Data set[1,0];                   
                _ZCP_wasContested = false;	
                _ZCP_Halfway = false;
                _ZCP_min = false;		
                if (_hasbeentouchedbyplayer) then
                {
                 //   diag_log format ["<FuMS:%1> ZupaCapture: No players near. Reseting cap point %2",FuMS_Version, _capturePosition];
                    _msnText = [_capPointName,"Vacant",format["%1 is no longer under player influence.",_capPointName]];
                    _ogjstr = format ["<t color='#f29420'>%1</t>",_msnText select 0];
                    _ogjstr = format ["%1<br /><t color='#f22b20'>%2</t>",_ogjstr,_msnText select 1];
                    _ogjstr =  format ["%1<br />__________", _ogjstr];
                    _ogjstr = format["%1<br /><t color='#ffff00'>%2</t>",_ogjstr, _msnText select 2];
                    //FuMS_GlobalHint = _ogjstr;
                    //publicVariable "FuMS_GlobalHint"; 
					FuMS_ExileToast = ["Point no longer under control",_ogjstr];
					publicVariable "FuMS_ExileToast";					
                    _mkrName setMarkerColor "ColorIndependent";
                    publicVariable _mkrName;
                    _dotName 			setMarkerText _capPointName;
                    publicVariable _dotName;
                    _hasbeentouchedbyplayer = false;
                    _previousReportedTime = _ZCP_CapTime;
                    _ZCP_startContested = 0;
                };
            }else
            {	
                //PV to produce 'systemChat' messages on time remaining to players in area.
                if (floor(_previousReportedTime) > (round ( (_ZCP_TimeRemaining/60)*10))/10   ) then
                {
                    FuMS_ZupaCaptureServer = [_proximityList, round(_ZCP_TimeRemaining/60)];
                    publicVariableServer "FuMS_ZupaCaptureServer";
                    _previousReportedTime =(round ( (_ZCP_TimeRemaining/60)*10))/10  ;
                };
                _hasbeentouchedbyplayer = true;
                //diag_log format ["<FuMS:%1> ZupaCapture: sending 'systemchat update of %2 to %3",FuMS_Version, round(_ZCP_TimeRemaining/60), _proximityList];

                // if previousCapper is in list, make him the current capper.
                if(_ZCP_previousCapper in _proximityList)then
                {		
                    _ZCP_currentCapper = _ZCP_previousCapper; 
                    _ZCP_Data set[1,1];
                }
                else
                {
                    // new capper so unsetcontested and reset flag timer.
                    _ZCP_wasContested = false;	
                    _ZCP_Halfway = false;
                    _ZCP_min = false;
                    _ZCP_currentCapper = _proximityList select 0;
                    _ZCP_Data set[1,1];

                    // announce new 'capping' of the point.
                    _msnText = [_capPointName,"Contested",format["%1 is being captured by %2. You have %3 minutes to prevent this.",_capPointName,name _ZCP_currentCapper,round(_ZCP_TimeRemaining/ 60)]];
                    _ogjstr = format ["<t color='#f29420'>%1</t>",_msnText select 0];
                    _ogjstr = format ["%1<br /><t color='#f22b20'>%2</t>",_ogjstr,_msnText select 1];
                    _ogjstr =  format ["%1<br />__________", _ogjstr];
                    _ogjstr = format["%1<br /><t color='#ffff00'>%2</t>",_ogjstr, _msnText select 2];
                    //FuMS_GlobalHint = _ogjstr;
                    //publicVariable "FuMS_GlobalHint";  	
					
					FuMS_ExileToast = ["Point being captured",_ogjstr];
					publicVariable "FuMS_ExileToast";
					
                    _mkrName setMarkerColor "ColorOPFOR";
                    publicVariable _mkrName;
                    _dotName setMarkerText format ["%1(Contested)",_capPointName];
                    publicVariable _dotName;
                };
                
                _ZCP_currentGroup = group _ZCP_currentCapper;							
                {
                    if( _x != _ZCP_currentCapper)then
                    {
                        if( isNull _ZCP_currentGroup || group _x != _ZCP_currentGroup)then
                        {
                            // players from more than 1 group are inside the cap point!
                            _ZCP_Data set[1,2];   
                        };
                    };
                }foreach _proximityList;
                
                if(!_ZCP_wasContested)then
                {
                    _ZCP_startContested = diag_tickTime;	
                    _ZCP_wasContested = true;
                };
                
                // if a player is in the area and time elapsed is greater than the cap time, it is CAPPED! so 'continue' = false;
                if( _ZCP_startContested != 0 && (diag_tickTime - _ZCP_startContested) >  _ZCP_CapTime )then
                {						
                    _ZCP_continue = false;				
                    _ZCP_startContested = 0;
                    _ZCP_wasContested = false;	
                      _msnText = [_capPointName,"CAPTURED",format["%1 has been Captured by %2.",_capPointName,name _ZCP_currentCapper]];
                    _ogjstr = format ["<t color='#f29420'>%1</t>",_msnText select 0];
                    _ogjstr = format ["%1<br /><t color='#f22b20'>%2</t>",_ogjstr,_msnText select 1];
                    _ogjstr =  format ["%1<br />__________", _ogjstr];
                    _ogjstr = format["%1<br /><t color='#ffff00'>%2</t>",_ogjstr, _msnText select 2];
                    //FuMS_GlobalHint = _ogjstr;
                    //publicVariable "FuMS_GlobalHint";  
					
					FuMS_ExileToast = ["Capture Point",_ogjstr];
					publicVariable "FuMS_ExileToast";
					
                    _mkrName setMarkerColor "ColorGrey";
                    publicVariable _mkrName;                    
                    _dotName setMarkerText format ["%1(Captured)",_capPointName];
                    publicVariable _dotName;
                    
                    
                };	
                
                if( !_ZCP_Halfway && _ZCP_startContested != 0 && (diag_tickTime - _ZCP_startContested) >  (_ZCP_CapTime / 2))then
                {				
                 
                    _msnText = [_capPointName,"Being Secured",format["%1 is 50%4 secured by %2. You still have %3 minutes to prevent this.",_capPointName,name _ZCP_currentCapper,round(_ZCP_CapTime / 2 / 60),"%"]];
                    _ogjstr = format ["<t color='#f29420'>%1</t>",_msnText select 0];
                    _ogjstr = format ["%1<br /><t color='#f22b20'>%2</t>",_ogjstr,_msnText select 1];
                    _ogjstr =  format ["%1<br />__________", _ogjstr];
                    _ogjstr = format["%1<br /><t color='#ffff00'>%2</t>",_ogjstr, _msnText select 2];
                    //FuMS_GlobalHint = _ogjstr;
                    //publicVariable "FuMS_GlobalHint";  
					FuMS_ExileToast = ["Point being captured",_ogjstr];
					publicVariable "FuMS_ExileToast";
                    _mkrName setMarkerColor "ColorCivilian";
                    publicVariable _mkrName;
                    _dotName setMarkerText format["%1(almost secured)",_capPointName];
                    publicVariable _dotName;
                    _ZCP_Halfway = true;				
                };	
                
                if( !_ZCP_min && _ZCP_startContested != 0 && (diag_tickTime - _ZCP_startContested) >  (_ZCP_CapTime - 60))then
                {					
                    //PV_ZCP_zupastic = ["ZCP",format["%1 is almost captured by %2. 60 seconds left. Move in!",_ZCP_name,name _ZCP_currentCapper]];
                    //publicVariable "PV_ZCP_zupastic";		
                    _msnText = [_capPointName,"Almost Secured",format["%1 is almost captured by %2. 60 seconds left. Move in!",_missionName,name _ZCP_currentCapper]];
                    _ogjstr = format ["<t align='center' size='2.0' color='#f29420'>%1</t>",_msnText select 0];
                    _ogjstr = format ["%1<br /><t size='1.10' color='#f22b20'>%2</t>",_ogjstr,_msnText select 1];
                    _ogjstr =  format ["%1<br />__________", _ogjstr];
                    _ogjstr = format["%1<br /><t size='1.25' color='#ffff00'>%2</t>",_ogjstr, _msnText select 2];
                    //FuMS_GlobalHint = _ogjstr;
                    //publicVariable "FuMS_GlobalHint";  	
					FuMS_ExileToast = ["Point almost captured",_ogjstr];
					publicVariable "FuMS_ExileToast";					
                    _mkrName setMarkerColor "ColorCivilian";					
                    publicVariable _mkrName;
                    _ZCP_min = true;
                };	
                
                _ZCP_previousCapper = _ZCP_currentCapper;	
                _ZCP_TimeRemaining = _ZCP_CapTime - (diag_tickTime - _ZCP_startContested);
            };																						
            uiSleep 1;                               
        };
        _holder = missionNamespace getVariable _ZupaTrackerVar;
        for [{_i=0},{_i< count _holder},{_i=_i+1}] do
        {
            if ( (_holder select _i ) select 1 == _mkrName) exitWith
            { 
                _holder set [_i, [true,_mkrName,_dotName]];
                missionNamespace setVariable [_ZupaTrackerVar, _holder];
         //       diag_log format ["<FuMS:%1> ZupaCapture. Setting ZupaTrackerVar:%2 with %3",FuMS_Version, _ZupaTrackerVar, _holder];  
            };
        };              
    }; 
    
    // end of spawned routine that controls this capture point   
}foreach _arrayOfData;


// create process to watch for all the control points under this mission to complete.
// tracker var format : [bool, mkrName, dotName];
[ _ZupaTrackerVar, _themeIndex, _missionName, count _arrayOfData, _msnTag,_root] spawn
{
    private ["_done","_count","_total","_ogjstr","_msnText","_themeIndex","_ZupaTrackerVar","_missionName","_msnTag","_msnEnd","_root"];
    _ZupaTrackerVar = [];
    _msnTag = _this select 4;
    _root = _this select 5;
    _msnEnd = false;
    //spawn process above may take a few cycles to complete, so need to wait until all cap points are fully constructed!
    while {(count _ZupaTrackerVar != _this select 3) and !_msnEnd} do
    {
        _msnEnd = missionNamespace getVariable (format ["%1_ZuppaTerminate",_msnTag]);
        _ZupaTrackerVar = missionNamespace getVariable (_this select 0);
        _themeIndex = _this select 1;
        _missionName = _this select 2;
     //   diag_log format ["<FuMS:%1> ZupaCapture: _ZupaTrackerVar = %2",FuMS_Version, _ZupaTrackerVar];
    };
    if (!_msnEnd) then
    {
        _done = false;
        while {!_done and !_msnEnd} do
        {
            _count = 0;
            _msnEnd = missionNamespace getVariable (format ["%1_ZuppaTerminate",_msnTag]);
            _total = count (_ZupaTrackerVar);
            {
                if (_x select 0) then {_count = _count +1;};
            }foreach (_ZupaTrackerVar);
            
            if (_count == _total) then {_done = true;};
            sleep 2;            
        };
        if (!_msnEnd) then
        {
            // all points have been captured, so delete them.
            _msnText = [_missionName,"Conquered",format["All points for %1 have been captured",_missionName]];
            _ogjstr = format ["<t color='#f29420'>%1</t>",_msnText select 0];
            _ogjstr = format ["%1<t color='#f22b20'>%2</t>",_ogjstr,_msnText select 1];
            _ogjstr =  format ["%1<br />__________", _ogjstr];
            _ogjstr = format["%1<br /><t color='#ffff00'>%2</t>",_ogjstr, _msnText select 2];
            //FuMS_GlobalHint = _ogjstr;
           // publicVariable "FuMS_GlobalHint"; 
			FuMS_ExileToast = ["All points captured",_ogjstr];
			publicVariable "FuMS_ExileToast";			
            FuMS_Trigger_ZupaCapture set [_themeIndex, true];
            missionNamespace setVariable [format ["%1_ZuppaCapture",_root], true];
            diag_log format ["<FuMS> ZuppaCaptureInit: final eval for %1_ZuppaCapture",_root];
        };
        {
            private ["_mkrName","_dotName"];
            // return true. Only result from this routine is a successful capture.	                        
            _mkrName = _x select 1;
            _dotName = _x select 2;
            ["Markers",_mkrName] call FuMS_fnc_HC_Util_HC_RemoveObject;
            ["Markers",_dotName] call FuMS_fnc_HC_Util_HC_RemoveObject;
            deleteMarker _mkrName;
            deleteMarker _dotName;
        }foreach  (_ZupaTrackerVar);   
        //Set the global value to true here.      
    };
};












