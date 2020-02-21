 //BaseOps.sqf
 //Horbin
 // 1/16/15
 //Inputs: None - directly
 // Manages 'BaseOps' radio communications for all themes.
 // Radio messages are all 'Theme' based. Thus reference below will be based upon
 //  the _themeIndex used in other portions of the project.  Data for each 'Theme'
 // will be stored at its index.
 /*
    THEMEDATA [_themeIndex] select 3 is RadioChatter config data
	         0 = radio channel
			 1 = ai death message true/false
			 2 = radio range
			 3 = ai callsign
			 4 = base ops callsign
			 5 = ai message list
			 6 = baseops message list
 
 ASSERT: THEMEDATA has been fully initialized.
 */
// Build the list of BaseOps that are active
//FormatAndBroadcast = compile preprocessFileLineNumbers "HC\Encounters\AI_Logic\RadioChatter\FormatAndBroadcast.sqf";
FuMS_AI_XMT_MsgQue = [];
FuMS_AI_RCV_MsgQue = [];
FuMS_GroupCount = [];
private ["_startTime","_sitrepDelta","_msg","_i"];
FuMS_radioChannel = [];
FuMS_silentCheckIn = [];
FuMS_aiDeathMsg = [];
FuMS_radioRange = [];
FuMS_aiCallsign = [];
FuMS_baseCallsign = [];
FuMS_aiMsgs = [];
FuMS_baseMsgs = [];
FuMS_radioChatInitialized = [];
for [{_i=0},{_i < 1000},{_i=_i+1}] do
{ FuMS_radioChatInitialized set [_i, false]; };

_startTime = time;
_sitrepDelta = _startTime;
while {true} do
{
    private ["_i", "_xmtQ","_basemsgtype","_siNit","_isInitialized"];
    for [{_i=0},{_i< count FuMS_THEMEDATA},{_i = _i +1}] do
    {
       _isInitialized = FuMS_radioChatInitialized select _i;
                              
        if (_isInitialized) then
        {
            if (_i != FuMS_GlobalDataIndex) then
            {            
                // check msqQue
				diag_log format ["##BaseOps: baseMsgs:%1",FuMS_baseMsgs select _i];
				diag_log format ["##BaseOps: XMT_MsgQue:%1",FuMS_AI_XMT_MsgQue select _i];
                {
                    _xmtQ = (FuMS_AI_XMT_MsgQue select _i) select 1;
                    _basemsgtype = _x select 0;
					diag_log format ["##BaseOps: _xmtQ:%1  _basemsgtype:%2",_xmtQ, _basemsgtype];
                    if ( _xmtQ == _basemsgtype) then  // if received a message from a Grp.
                    {
                        // process the message and transmit it
                        // base callsign, aicallsign, message, radiochannel, range, position
                        // range is unlimited and position not needed for BaseOps!
                        [FuMS_baseCallsign select _i, (FuMS_AI_XMT_MsgQue select _i) select 0, _x select 1,
                        FuMS_radioChannel select _i, 0, 0] call FuMS_fnc_HC_AI_RC_FormatAndBroadcast;	
                        // message sent so clear the que.
                        FuMS_AI_XMT_MsgQue set [_i, ["",""]];
                        //Special Handling below!
                    };
                    // Perform BaseOps communication duties!
                    // These are communications sent out by Base Ops or if other action is needed based upon a communication!
                }foreach (FuMS_baseMsgs select _i); 
                
                if (time > _sitrepDelta + 1800) then // ask for a SitRep every 30minutes
                {
                    _sitrepDelta = time;
                    FuMS_AI_RCV_MsgQue set [_i, [FuMS_aiCallsign select _i, "SitRep"]];    //tell the AI
                    _msg = ((FuMS_baseMsgs select _i) select 4) select 1; // get SitRep message text
                    [FuMS_baseCallsign select _i, FuMS_aiCallsign select _i, _msg ,FuMS_radioChannel select _i, 0, 0] 
                    call FuMS_fnc_HC_AI_RC_FormatAndBroadcast;	     //tell the player.
                }; 
            };
        }; 
    };
    sleep 2;
};





