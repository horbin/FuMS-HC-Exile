// HeartMonitor.sqf
// Horbin
// 2/28/15

// Needs to occur LAST after all other server initialization!
//Launch HC cleanup process.
// This script watches for an HC disconnect
// When identified, server will cleanup objects that where controlled by the HC
// Use included HC_CreateGroup, HC_CreateVehicle, etc functions on the HC to ensure cleanup!
FuMS_HC_DataCleanup	= compile preprocessFileLineNumbers "\FuMS\Functions\HC_DataCleanup.sqf"; 
FuMS_InitHeadlessClient = compile preprocessFileLineNumbers "\FuMS\Functions\InitHeadlessClient.sqf";

private ["_hcID","_owner"];
_owner = _this select 0;
_hcID = owner _owner;

[_owner, _hcID] spawn
{
    private ["_prefix","_hcID","_pulse","_status","_owner","_dead","_ownerName"];
    _prefix = "FuMS_HC_isAlive";
    _owner = _this select 0;
    _hcID = _this select 1;
    //_hcIDtest = owner _owner;
    _ownerName = format ["%1",_owner]; // convert it to text, so when it goes dead, we still know its name!    
    // HC object will be transfered to server. It will continue to excist UNTIL it totally disconnects!
    _pulse = format ["%1%2",_prefix, _hcID];
    _dead = false;
    if (isNull _owner) then
    {
        diag_log format ["<FuMS> HeartMonitor: _owner is Null! Attempting to locate lost HC object!"];
    };
    if (_hcID == 0) exitWith
    {
        FuMS_ServerIsClean = true;
        diag_log format ["<FuMS> HeartMonitor: Server ID 0 detected as source heartbeat, not valid. exiting heartbeat monitor for id:0"];
    };
    missionNamespace setVariable [_pulse, false];  // set false to start.
    
    // now wait for the 1st heartbeat. This one is sent AFTER the HC finishes all of its initializations!
    _status = false;
	_expireTime = diag_ticktime+180000;
	_rptCount = 0;
    while {!_status} do
    {
        uiSleep 2;
		if (_rptCount == 0) then
		{
			diag_log format ["<FuMS> HeartMonitor: Waiting for HC:%1 initialization to finalize with signature %2",_ownerName, _pulse];
		}else {_rptCount=_rptCount + 1;};
		if (_rptCount == 30) then {_rptCount = 0;};
     //   if (isNull _owner) exitWith
     //   {
     //       diag_log format ["<FuMS> HeartMonitor: HC:%1 disconnected prior to completing initialization. FuMS abort!",_ownerName];
     //       _dead = true;
     //   };
        _status = missionNamespace getVariable _pulse; 
		if (_expireTime < diag_ticktime) then
		{
			diag_log format ["<FuMS> HeartMonitor: HC failed to properly handshake with server. Restarting HC init"];
			_status = true;
			_dead = true;
		};
    };
    
    FuMS_ServerIsClean = true;   
    // HC should be complete with loading and init, so free server up to receive other HC connections.
    while {!_dead} do
    {                    
      //  waitUntil {!isNil "HC_isAlive00"};
        missionNamespace setVariable [_pulse, false];
		FuMS_ServerFPS = diag_fps;
		_hcID publicVariableClient "FuMS_ServerFPS";
        uiSleep 3;
        //Wait for 2secs, if value still FALSE, listen for a 2nd heartbeat.  
        _status = missionNamespace getVariable _pulse;
        if (!_status) then // listening for 2nd heart beat
        {
          //  diag_log format ["<FuMS> HeartMonitor: %1: 1st Heart beat missed!!%2",_ownerName,_pulse];    
            uiSleep 4;           
            //Wait 2secs, if value still FALSE, listen for a 3rd heart beat.
            _status = missionNamespace getVariable _pulse;
            if (!_status) then //listening for the 3rd heart beat.
            {
                diag_log format ["<FuMS> HeartMonitor:%1: 2nd Heart beat missed!!%2",_ownerName,_pulse];       
                uiSleep 4;       
                _status = missionNamespace getVariable _pulse;   
                if (!_status) then // HC_HAL is very likely disconnected.                            
                {
                    private ["_start","_waitonHC","_status"];
                    _start = time;
                    diag_log format ["<FuMS> HeartMonitor:%3:%1: Disconnect detected. Preparing to clean up the Mess!!!!%2",_ownerName,_pulse,_hcID];                                        
                    // wait here for one of two conditions
                   _waitonHC = true;
                    while {_waitonHC} do
                    {
                        // 1) _status becomes true = HC has recovered, just lagged out, so resume behavior.
                        _status = missionNamespace getVariable _pulse;
                        if (_status) then
                        {
                            _waitonHC = false;
                            diag_log format ["<FuMS> HeartMonitor:%3:%1: Disconnect recovered!!!!%2",_ownerName,_pulse,_hcID];                                        
                        }; // HC recovered, so resume monitoring it!
                        if (isNull _owner) then
                        {
                            // 2) _owner becomes NULL-object = HC is disconnected
                            // ASSERT: ALL objects now owned by server, and not 'in limbo'
                            FuMS_ServerIsClean = false;
                            publicVariable "FuMS_ServerIsClean";
                            [_hcID] call FuMS_HC_DataCleanup;                   
                            diag_log format ["<FuMS> HeartMonitor: HC:%1: Complete in %3 secs!%2",_ownerName,_pulse, time-_start];  
                            missionNamespace setVariable [_pulse, nil];                    
                            _dead = true;
                            _waitonHC = false;                            
                        };
                        uisleep 4;
                    };
                };
                // End of cleanup
            };
            // End of 3rd heartbeat
        };
        // End of 2nd heartbeat
    };
    //End of 1st heartbeat
    diag_log format ["<FuMS> HeartMonitor: Has ended for %3:%1:%2",_ownerName,_pulse,_hcID];
    FuMS_ServerIsClean = true;
};

diag_log format ["<FuMS> HeartMonitor: Server-HC Heart Monitor Slot #%1 initialized for %2", _hcID, _owner];

[_owner ] call FuMS_InitHeadlessClient;
//waitUntil {ScriptDone _handle};
FuMS_ServerIsClean = false;
FuMS_ServerInitData = true;
_hcID publicVariableClient "FuMS_ServerInitData";    // once received by HC, it will start FuMS control loops.

diag_log format ["<FuMS> HeartMonitor: HC started! Starting HeartBeat monitor for slot#%1 : %2", _hcID, _owner];


