 //AIRadio.sqf
 //Horbin
 // 1/16/15
 //Inputs: _group, themeIndex, encounter center, Flagsilentcheckin
 // Manages 'AI comms' for the specified group.
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
//FormatAndBroadcastAI = compile preprocessFileLineNumbers "HC\Encounters\AI_Logic\RadioChatter\FormatAndBroadcastAI.sqf";
//RadioChatter = compile preprocessFileLineNumbers "HC\Encounters\Functions\RadioChatter.sqf";

//REINFORCE = 100;  // 20% chance reinforcements when a call for help is made.
private ["_data","_themeRadioData","_group","_index","_pos","_aiDeathMsg","_options", "_numgroups","_number","_silentCheckinOverride",
"_radioChannel","_radioRange","_aiCallsign","_baseCallsign","_aiMsgs","_callsign","_leader","_activeRadio","_silentcheckin", "_missionName"];
if (!((FuMS_ServerData select 4) select 0)) exitWith {};

    //Inputs: _group, themeIndex, encounter center
    _group = _this select 0;
    _index = _this select 1;
    _pos = _this select 2;
    _silentcheckinOverride = _this select 3;
    _missionName = _this select 4;
    _themeRadioData = FuMS_THEMEDATA select _index;
	diag_log format ["##AIRadio index:%1 data:%2",_index,FuMS_THEMEDATA select _index];
    _data = _themeRadioData select 3;
    _options = _data select 0;
    _radioChannel = _options select 0;
    _silentCheckIn = _options select 1;
    _aiDeathMsg = _options select 2;
    _radioRange = _options select 3;
    _aiCallsign = _options select 4;
    _baseCallsign = _options select 5;
    _aiMsgs = _data select 1;
    //_baseMsgs =_data select 2;
    //Generate group's full callsign...ie callsignXX
    _numgroups = FuMS_GroupCount select _index; // get number groups made so far for this theme.
    _numgroups = _numgroups +1;
    FuMS_GroupCount set [_index, _numgroups];
	diag_log format ["##AIRadio: _aiCallsign:%1,  _numgroups:%2",_aiCallsign, _numgroups];
    if (_numgroups < 10) then
    {
        _number = format ["0%1",_numgroups];
        _callsign = format ["%1%2",_aiCallsign, _number];
    }
    else { _callsign = format ["%1%2",_aiCallsign, _numgroups];};
	diag_log format ["##AIRadio: _callsign:%1",_callsign];
    // add RadioChat variable to support RadioChatter details in deathspam.
    if (_aiDeathMsg) then
    {
        private ["_units","_unitnum","_unitCallsign"];
        //  diag_log format ["##AIRadio: Killed EH added for %1",_callsign];
        _unitnum = 1;
        _units = units _group;
        {
            _unitCallsign = format ["%1-%2",_callsign, _unitnum];
            _x setVariable ["FuMS_RadioChat", [_unitCallsign,_radioChannel,_radioRange,_index     ], false];
            _unitnum = _unitnum +1;      
        }foreach _units;
    };
    //Perform checkin with Base Ops, by placing a 'silent' transmission from base ops in the AI's receive que.
    // if _silentCheckIn = true => Globall NO checkins!
    // if _silentcheckinOverride = true => ignore global and do not check in.
    if (!_silentCheckIn) then
    { 
        if (!_silentcheckinOverride) then
        {
            FuMS_AI_RCV_MsgQue set [ _index, [_callsign,"CheckIn"]]; 
        };
    };
    _leader = leader _group;
    // add proper radio to the leader's belt!
    if (TypeName _radioChannel == "STRING") then { _activeRadio = "EpochRadio0";}
    else { _activeRadio = format ["EpochRadio%1",_radioChannel];};
    //diag_log format ["##AIRadio :: Attempting to add %1 to %2",_activeRadio, _leader];
    _leader addweapon _activeRadio;
    //run loop till group leader dies!
    private ["_initialGroupSize","_curGroupSize","_prevGroupSize","_detTime","_callForHelp","_helpTime"];
    _initialGroupSize = count units _group;
    _prevGroupSize = _initialGroupSize;
    _detTime = -600;  //permits detection response within 1st 10minutes.
    _callForHelp = 3; // number of times group leader will attempt to call for reinforcements
    _helpTime = 0; // last time  group called for help
    while {alive _leader} do
    {
        private ["_queMsg"];
        _curGroupSize = count units _group;
        //   diag_log format ["##AIRadio: _initial:%1, _cur:%2, _prev:%3",_initialGroupSize, _curGroupSize, _prevGroupSize];
        sleep 1; // group leader takes a few seconds to talk on his radio.
        // check msqQue for a message send by BaseOps to 'callsign'
        _queMsg = (FuMS_AI_RCV_MsgQue select _index) select 0;
        if (  _queMsg==_callsign or _queMsg==_aiCallsign) then // if =_aiCallsign, message intended for ALL groups!
        {
            //  diag_log format ["##AIRadio: RCV_MsqQue match:  %1",_queMsg];
            {    // Response loop.       
            if ( ( (FuMS_AI_RCV_MsgQue select _index) select 1) == (_x select 0) )then
            {
                // Need to have code to pull a unique aicallsign that is incremented off the base!!!
                // Bear01, Bear02..maybe use a count variable within the theme?
                //diag_log format ["##AIRadio : %1 : %2  radio:%3  range:%4  posit:%5",_callsign, _baseCallsign, _x select 1, _radioChannel, _radioRange, _pos];
                [_callsign, _baseCallsign, _x select 1, _radioChannel, _radioRange, _pos, 
                [_leader, _missionName, _curGroupSize, _initialGroupSize]  ] call FuMS_fnc_HC_AI_RC_FormatAndBroadcastAI;
                //message sent so clear the que
                if (_queMsg == _aiCallsign) then
                {
                //    diag_log format ["##AIRadio: Pausing for Global Response :%1",_aiCallsign];
                    sleep 5;
                }; // sleep 5 to allow other groups to catch and respond to the 99 call.
                FuMS_AI_RCV_MsgQue set [_index, ["",""]];
                
                // uncomment this if 3rd element added for chaining messages
                //AI_XMT_MsgQue set [_index, [_callsign, _x select 2]];
            };
        }foreach _aiMsgs;
    };                                                             
    // Perform AI communication duties
    // silent fill of RCV que will trigger AI's text transmisison and cause BaseOps response.
    if (_curGroupSize < _prevGroupSize) then
    { 
        FuMS_AI_XMT_MsgQue set [_index, [_callsign, "Death"]]; 
        [_callsign, _baseCallsign, (_aiMsgs select 6) select 1, _radioChannel, _radioRange, _pos,
        [_leader, _missionName, _curGroupSize, _initialGroupSize] ] call FuMS_fnc_HC_AI_RC_FormatAndBroadcastAI;
        _prevGroupSize = _curGroupSize;
    };
    _enemy = _leader findNearestEnemy _leader;
    if (!isNull (_enemy)) then //only report this once every 10minutes.
    { 
        if (time > _detTime+600) then
        {
            if (isPlayer _enemy) then
            {
                _detTime = time;
                FuMS_AI_XMT_MsgQue set [_index, [_callsign, "Detected"]];
                [_callsign, _baseCallsign, (_aiMsgs select 2) select 1, _radioChannel, _radioRange, _pos,
                [_leader, _missionName, _curGroupSize, _initialGroupSize] ] call FuMS_fnc_HC_AI_RC_FormatAndBroadcastAI;
            }else
            {
                // enemy detected is a hostile AI faction
                _detTime = time;
                FuMS_AI_XMT_MsgQue set [_index, [_callsign, "DetHostileAI"]];
                [_callsign, _baseCallsign, (_aiMsgs select 7) select 1, _radioChannel, _radioRange, _pos,
                [_leader, _missionName, _curGroupSize, _initialGroupSize] ] call FuMS_fnc_HC_AI_RC_FormatAndBroadcastAI;            
            };
        };
    };
    if (_curGroupSize <= (.5*_initialGroupSize)) then 
    { 
        if (time > _helpTime+180) then
        {
            _helpTime = time;
            _callForHelp = _callForHelp - 1;
            if (_callForHelp > 0 ) then
            {
                FuMS_AI_XMT_MsgQue set [_index, [_callsign, "Less50"]];
                [_callsign, _baseCallsign, (_aiMsgs select 3) select 1, _radioChannel, _radioRange, _pos,
                [_leader, _missionName, _curGroupSize, _initialGroupSize] ] call FuMS_fnc_HC_AI_RC_FormatAndBroadcastAI;
                
                // Determine if BaseOps will send Reinforcements done in LogicBomb
                // exec the mission by passing mission identification to LogicBomb's Reinforcement Trigger.
                // ASSERT mission center is UNIQUE to any other mission that may be running!
                //diag_log format ["##AI Radio : Call for Help by %1",_callsign];
                FuMS_RC_REINFORCEMENTS = [_pos, _index, _callsign];               
            };
        };
    };
};




