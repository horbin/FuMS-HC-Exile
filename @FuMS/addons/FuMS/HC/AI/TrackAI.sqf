//TrackAI.sqf
// Horbin
// 4/1/2015
// Inputs: Group
// Generates a map symbol that follows the group's leader. 
// Symbol is updated every few seconds.
private ["_group","_markerName","_mkr"];
_group = _this select 0;
_markerName = format ["TrackAI_%1",_group];
_mkr = createMarker [_markerName, [0,0]];
["Markers",_markerName] call FuMS_fnc_HC_Util_HC_AddObject;

_markerName setMarkerColor "ColorRed";
_markerName setMarkerShape "ICON";

// check the initial leader of the group and base the symbol upon his status.

[_group, _markerName] spawn
{
    private ["_group","_mkr","_units","_leader","_symbol","_veh"];
	_group = _this select 0;
	_mkr = _this select 1;
	_units = units _group;
	while {count _units > 0} do
	{
		_leader = leader _group;
        _veh = vehicle (_leader);
        if (_veh isKindOf "Man") then {_symbol = "o_inf";};
        if (_veh isKindOf "Tank") then {_symbol = "o_armor";};
        if (_veh isKindOf "Car") then {_symbol = "o_motor_inf";};
        if (_veh isKindOf "Truck" or _veh isKindOf "Wheeled_APC") then {_symbol = "o_mech_inf";};
        if (_veh isKindOf "Air") then {_symbol = "o_air";};
        if (_veh isKindOf "Ship") then {_symbol = "o_naval";};
        _mkr setMarkerType _symbol;
        
        _mkr setMarkerPos (getPos _leader);
		sleep 5;
        _units = units _group;
	};
    ["Markers",_mkr] call FuMS_fnc_HC_Util_HC_RemoveObject;
	deleteMarker _mkr;
};



