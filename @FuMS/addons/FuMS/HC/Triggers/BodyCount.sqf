//BodyCount.sqf
// Horbin
// 6/28/2015
// Inputs - params array
// [_msnTag, _numAI]

// global var of FuMS_0_0_0_BodyCount is set up when trigger initialized
// This routine will check that variable against the numAI for a result.

// when an AI dies, it needs to look at its lineage.  While following it, if BodyCount is defined for that mission it
// should be incremented.

private ["_params","_msnTag","_numAI","_result","_bodyCount"];
_params = _this select 0;
_msnTag = _params select 0;
_numAI = _params select 1;
_result = false;

_bodyCount = missionNameSpace getVariable (format ["%1_BodyCount",_msnTag]);
if (_bodyCount > _numAI) then
{
	_result = true;	
};
//diag_log format ["<FuMS BodyCount: Goal:%1 #Dead:%2", _numAI, _bodyCount];
_result;


