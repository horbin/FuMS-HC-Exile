//GetBuildingPositions.sqf

/*
Author: 
rübe  
Description
returns a list of all available building positions.   
Parameter(s):
_this: building (object)    
Example:
_positions = _building call FN_getBuildingPositions;     
Returns:
array of positions (guaranteed to return at least one position; position building)
*/    
private ["_building", "_positions", "_i","_next"];
_building = _this select 0;
if (TypeName _building == "ARRARY") exitWith {diag_log format ["##GetBuildingPositions: !!ERROR!! _building is an array: %1",_building];};
_positions = [(getPos _building)];    
// search more positions
_i = 1;
while {_i > 0} do
{
    _next = _building buildingPos _i;
    if (((_next select 0) == 0) && ((_next select 1) == 0) && ((_next select 2) == 0)) then
    {
        _i = 0;
    } else {
        _positions = _positions + [_next];
        _i = _i + 1;
    };
};  
// return positions
_positions

