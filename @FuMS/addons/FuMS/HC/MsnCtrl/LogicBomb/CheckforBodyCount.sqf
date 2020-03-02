//CheckforBodyCount.sqf
// Horbin
// 6/28/2015
// Input: _unit object
//  This function will examine lineage and for each mission where BodyCount is defined it will increment it.
// if BC is defined in any of the parents to '_msnTag' its associated BodyCount will be incremented.
// This routine is called by AI_Killed script for all FuMS AI.
// also called by Capture.sqf AI logic when an AI 'escapes'

FuMS_fnc_TraceBodyCount =
{
    private ["_msnTag","_lineage","_bcVar","_unit","_capVar"];
    _msnTag = _this select 0;
    _unit = _this select 1;
    // Research the 'heritage' of the unit here to expand the list.
    // if the 'owner' of this is a child then look to parent.
    _lineage = missionNameSpace getVariable [(format ["%1_Lineage",_msnTag]),[0,0]];
	//diag_log format ["##CHECKFORBODYCOUNT: Launch Parameters: _msnTag:%1 | _unit:%2 | _lineage:%3", _msnTag, _unit, _lineage];

    if (_lineage select 1 != 0) then
    {   
        // call self on parent
        [_lineage select 4, _unit] call FuMS_fnc_TraceBodyCount;
    };    
    
    _capVar = missionNameSpace getVariable (format ["%1_CaptiveCount",_msnTag]);
    if (!isNil "_capVar") then
    {
        if (alive _unit) then
        {
            _capVar = _capVar + 1;
            missionNameSpace setVariable [format ["%1_CaptiveCount",_msnTag],_capVar];       
        };
        diag_log format ["<FuMS> CheckforBodyCount : CaptiveCount %1 for %2",_capVar, _msnTag];   
    }else
    {
        _bcVar = missionNameSpace getVariable (format ["%1_BodyCount",_msnTag]);
        if (!isNil "_bcVar") then
        {
            if (!alive _unit) then
            {
                _bcVar = _bcVar +1;
                missionNameSpace setVariable [format ["%1_BodyCount",_msnTag],_bcVar];
                diag_log format ["<FuMS> CheckforBodyCount : %1 for %2",_bcVar, _msnTag];
            };
        };
    };    
};

private ["_msnTag","_unit"];
_unit = _this select 0;
//_wasCaptive = _unit getVariable "FuMS_CaptiveAction";
//if (!isNil "_wasCaptive") exitWith {}; // ai was a captive, so do not 'count' it! 
_msnTag = _unit getVariable "FuMS_Lineage";
diag_log format ["<FuMS> CheckforBodyCount : %1 in %2",_unit, _msnTag];   
[_msnTag, _unit] call FuMS_fnc_TraceBodyCount;

