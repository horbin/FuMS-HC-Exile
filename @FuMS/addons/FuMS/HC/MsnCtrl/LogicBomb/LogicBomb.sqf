//LogicBomb.sqf
// Horbin
// 6/24/2015
// Inputs: List of triggers to be evaluated.
//    _msnTag to ID which mission.
private ["_triggerList","_msnTag","_result","_triggersToCheck","_trigpack","_triggerName"];
_triggerList = _this select 0;
// _triggerList is a single string or array of strings.
_msnTag = _this select 1;

//diag_log format ["<FuMS> LogicBomb: _triggerList :%1",_triggerList];
// _triggerlist needs to be parsed for conditional statements
// _triggersToCheck will be an array of TriggerNames. Each array represnts and AND'd logic series that if evaluated true produces a TRUE solution.

_triggersToCheck = []; // This will be a list of triggers, each item on the list can be a series of triggers that are 'and'd together.
_trigpack = [];  //This will be a list of triggers that together must all evaluate to TRUE to return a TRUE _result.
_triggerName = "";
_result = false;
{   
    _triggerName = _x;
  //  diag_log format ["<FuMS> LogicBomb: _x  from _triggerList :%1",_triggerName];
    if (toupper _triggerName == "OK") exitwith {_result=true;};
    if (toupper _triggerName == "OR") then
    {
        _triggersToCheck = _triggersToCheck + [_trigpack];
        _trigpack = [];
     //   diag_log format ["<FuMS> LogicBomb: _trigpack :%1",_trigpack];   
    }else
    {
        _trigpack = _trigpack + [_triggerName];
    };    
}foreach _triggerList;
_triggersToCheck = _triggersToCheck + [_trigpack];
if (_result) exitwith {_result};


//diag_log format ["<FuMS> LogicBomb _triggersToCheck:%1",_triggersToCheck];
{
    private ["_count","_value"];
	_count = 0;
	{
		_value = missionNamespace getVariable (format ["%1TGR_%2",_msnTag,_x]);
		if (_value) then
        {
            _count = _count + 1;            
        };
       // diag_log format ["<FuMS> LogicBomb: %1TGR_%2 is %3",_msnTag,_x, _value];
	}foreach _x;
	if (_count == count _x) exitWith {_result = true;};
}foreach _triggersToCheck;

_result;
