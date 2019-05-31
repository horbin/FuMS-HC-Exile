// SpawnNotifications.sqf
// Horbin
// 1/4/15
// INPUTS: Mission Marker data, Mission notifications, mission status
// OUTPUTS: None
//RadioChatter = compile preprocessFileLineNumbers "HC\Encounters\Functions\RadioChatter.sqf";
private ["_markers","_notifications","_msnStatus","_mkr1","_mkr2","_eCenter","_notify","_showMap","_delay",
"_msnSuccessText","_msnStartText","_msnFailureText","_ogjstr","_msnText","_options","_winDelay","_loseDelay",
"_radionotify","_radiochannel","_radiorange","_missionNameOverride","_msnStatus_status"];
_markers = _this select 0;
_notifications = _this select 1;
_msnStatus = _this select 2;
_mkr1 = _this select 3;
_mkr2 = _this select 4;
_eCenter = _this select 5;
_missionNameOverride = _this select 6;
_options = _notifications select 0;
_msnStartText = _notifications select 1;
_msnSuccessText =_notifications select 2;
_msnFailureText = _notifications select 3;
_radionotify = _options select 0;
_delay = 0;
_msnText = "";

_msnStatus_status = _msnStatus select 0;

_radiochannel = _options select 1;
if (isNil "_radiochannel") then {_radiochannel = "ALL";};

_radiorange = _options select 2;
_notify = _options select 3;
_showMap = _options select 4;
_winDelay = _options select 5;
_loseDelay = _options select 6;
if (isNil "_winDelay") then {_winDelay = 0;};
if (isNil "_loseDelay") then {_loseDelay = 0;};
switch (_msnStatus_status) do
{
    case "STATIC":
    {
         _msnText = _msnStartText;
        _delay = 0;
    };
    case "WIN":
    {
        _msnText = _msnSuccessText;
        _delay = _winDelay;
    };
    case "LOSE":
    {
        _msnText = _msnFailureText;
        _delay = _loseDelay;  
    };        
};
// Notify the world of the event, if desired
//if (_radionotify) then
//{ 
 //   if (!isnil "_msnText") then
 //   {
        // right now, do not care if radio msg heard!
 //       if (count _msnText > 0 ) then  // something in file to transmit.
  //      {
     //       [_msnText select 2, _radiochannel, _radiorange, _eCenter] call FuMS_fnc_HC_AI_RC_RadioChatter; 
 //       };
//    };
//};   
if (_notify) then
{
    if (!isnil "_msnText") then
    {   
        /*    //////////////////////// Old notification code, will be deprecated in future versions
        _ogjstr = "";
        if (count _msnText >0) then {_ogjstr = format ["<t align='center' size='2.0' color='#f29420'>%1</t>",_msnText select 0];};
        if (count _msnText >1) then {_ogjstr = format ["%1<br /><t size='1.10' color='#f22b20'>%2</t>",_ogjstr,_msnText select 1];};
        _ogjstr =  format ["%1<br />__________", _ogjstr];
        if (count _msnText >2) then {_ogjstr = format["%1<br /><t size='1.25' color='#ffff00'>%2</t>",_ogjstr, _msnText select 2];};
        FuMS_GlobalHint = _ogjstr;
        publicVariable "FuMS_GlobalHint";  
        */
    	
	// Exile Toasts (Corrected to avoid NULL _msnText)
	if (!isnil "_msnText") then
	{
		FuMS_ExileToast = [(_msnText select 0),(_msnText select 1)];
		publicVariable "FuMS_ExileToast"; 
	};
	
	// System Chat notification (Corrected to avoid NULL _msnText)
	if (!isnil "_msnText") then
	{
		format["%1: %2",toUpper (_msnText select 0),(_msnText select 1)] remoteExecCall ["systemChat",-2];
	};

    };
};  
if (_showMap) then 
{ 
    if (_msnStatus_status == "WIN" or _msnStatus_status == "LOSE") then
    {  
        if (_msnStatus_status == "WIN") then {_mkr1 setMarkerColor "ColorGreen";}
        else {_mkr1 setMarkerColor "ColorBlack";};
		_mkr1 setMarkerBrush "Solid";		
            //publicVariable _mkr1;  
            //leave green circle up for 'delay' secs, then remove markers       
        //diag_log format ["##Spawn Notification: _msnStatus:%1  _delay:%2", _msnStatus, _delay];
            sleep _delay;
            _mkr1 setMarkerAlpha 0;
           _mkr2 setMarkerAlpha 0;
            _mkr2 setMarkerText "";
            publicVariable _mkr1;
           publicVariable _mkr2;     
           
        ["Markers",_mkr1] call FuMS_fnc_HC_Util_HC_RemoveObject;
        ["Markers",_mkr2] call FuMS_fnc_HC_Util_HC_RemoveObject;
           
    };       
    if (_msnStatus_status == "STATIC") then
    {
       // diag_log format ["##%1 starting at %2##", _mkr1, _eCenter];
        //AI Operational Area
        _mkr1 setMarkerPos _eCenter;
        //_mkr1 setMarkerType (_markers select 1);
        _mkr1 setMarkerShape (_markers select 2);
        _mkr1 setMarkerSize [_markers select 5, _markers select 5];
        _mkr1 setMarkerColor (_markers select 3);
        _mkr1 setMarkerAlpha 0.8;
        _mkr1 setMarkerBrush (_markers select 4);
        //_mkr1 setMarkerText (_markers select 0);
        publicVariable _mkr1;
        
        _mkr2 setMarkerPos _eCenter;
        _mkr2 setMarkerAlpha 0.5;
        _mkr2 setMarkerType (_markers select 1);
        
        if ( count _missionNameOverride > 0) then
        {
           // diag_log format ["##SpawnNotifications : override mission %2 name to %1",_missionNameOverride, _markers select 0];
            _mkr2 setMarkerText format[" %1",_missionNameOverride];   
        }
        else { _mkr2 setMarkerText format[" %1",(_markers select 0)];};
        //_mkr2 setMarkerColor (_markers select 3);
        _mkr2 setMarkerColor "ColorBlack";
	
		
        publicVariable _mkr2;
        ["Markers",_mkr1] call FuMS_fnc_HC_Util_HC_AddObject;
        ["Markers",_mkr2] call FuMS_fnc_HC_Util_HC_AddObject;
      
    };
}else {_delay;}; // delay here if no map marker was used!
  // Note: This delay will suspend mission cleanup of AI, buildings, and ai occupied vehicles until it the delay expires.
// below return value no longer utilized!
//_delay
