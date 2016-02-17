//LowUnitCount.sqf
// Horbin
// 6/28/2015

FuMS_fnc_UnitsInArea =
{
    private ["_msnTag","_radius","_side","_pos","_numUnits","_childList","_objectList"];
    _msnTag = _this select 0;
    _radius = _this select 1;
    _side = _this select 2;
    _pos = _this select 3;
    _numUnits = 0;
        
    _childList = missionNameSpace getVariable (format ["%1_Children",_msnTag]);
    if (!isNil "_childList") then
    {
       // diag_log format ["<FuMS> LowUnitCount: _Children: %1",_childList];
        {
            _numUnits = _numUnits + ([_x,_radius,_side,_pos] call FuMS_fnc_UnitsInArea);        
        } foreach _childList;         
    };
    // Get total number if AI associated to this mission
    _objectList = missionNameSpace getVariable (format ["%1_Groups",_msnTag]);
//	diag_log format ["<FuMS> LowUnitCount: Groups: %1",_objectList];
//	diag_log format ["<FuMS> LowUnitCount: Looking for side:%1", _side];
	
    if (!isNil "_objectList") then
    {
        {
            private ["_units"];
            _units = units _x;
            {				
                if (_side == format ["%1",(side _x)] or toupper _side == "ANY") then
                {
                    if (_radius > (_pos distance _x)) then {_numUnits = _numUnits + 1;};
                }else
				{
					if (toupper _side == "CAPTIVE") then
					{
						 // _var = _x getVariable "FuMS_CaptiveAction";
						 // if (!isNil "_var" and alive _x) then {_numUnits = _numUnits +1;};
						 if (captive _x) then {_numUnits = _numUnits +1;};
					};
				};
            }foreach _units;
        }foreach _objectList;  
    };
    _numUnits       
};

private ["_pos","_side","_numAI","_radius","_msnTag","_result","_numUnits","_params"];
_params = _this select 0;
_pos = _params select 0;
_side = toupper (_params select 1);
_numAI = _params select 2;
_radius = _params select 3;
if (_radius == 0) then { _radius = 999999;};
_msnTag = _params select 4;
//[_pos, _side, _numAI, _radius, _msnTag]
_result = false;
_numUnits = [_msnTag, _radius,_side,_pos] call FuMS_fnc_UnitsInArea;
//Evaluate results
if ( _numUnits <= _numAI) then {_result = true;};
//diag_log format ["<FuMS LowUnitCount: #AI:%1  Limit:%2  Radius:%3",_numUnits, _numAI, _radius];
_result
