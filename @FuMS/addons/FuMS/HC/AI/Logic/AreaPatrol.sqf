//AreaPatrol
// Horbin
// 12/26/14
//INPUTS: Group, centroid, radius (meters),
//[_group, _pos, _radius] call AreaPatrol
// Creates 12 waypoints with 30 deg's of separation.
//  Each waypoint located 'radius' distance from center
// 12 waypoints then added randomly to the group. With cycle set back to 1st waypoint.
//
//OUTPUTS: 1st of the waypoints added, to permit further modification.
// modifications post 'call AreaPatrol' will override functionality.
// all waypoints added are default 'NO CHANGE', so base behavior of group, or
//  settings of the groups last waypoint before these are added, will be used.
//HC_AddWaypoint = compile preprocessFileLineNumbers "HC\Functions\HC_AddWaypoint.sqf";

//_wp = [_group, [_xx, _yy], 0] call HC_AddWaypoint;  
private ["_group","_radius","_degsep","_xx","_yy","_wp","_centroid","_cos","_sin","_xbase","_ybase","_xmulti","_ymulti"];
_group = _this select 0;
_centroid = _this select 1;
_radius = _this select 2;
_degsep = [30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330, 360];
_degsep = _degsep call BIS_fnc_arrayShuffle;
_xbase = _centroid select 0;
_ybase = _centroid select 1;
//diag_log format["##HC:AreaPatrol: Group:%1, Center:%2, Raidus:%3",_group, _centroid, _radius];
{
    _cos = cos (_x);
    _sin = sin (_x);
    _xmulti = _radius * _cos;
    _ymulti = _radius * _sin;
    _xx = _xbase + _xmulti;
    _yy = _ybase + _ymulti;
    _wp = [_group, [_xx, _yy], 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;  
    _wp setWaypointBehaviour "COMBAT";
    
} foreach _degsep;
//diag_log format ["##HC:AreaPatrol: %1 waypoints",_wp select 1];
    _cos = cos (_degsep select 0);
    _sin = sin (_degsep select 0);
    _xmulti = _radius * _cos;
    _ymulti = _radius * _sin;
    _xx = _xbase + _xmulti;
    _yy = _ybase + _ymulti;
_wp = [_group, [_xx, _yy], 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;     
_wp setWaypointType "CYCLE";     
_wp = [_wp select 0, (_wp select 1) - 12];    
_wp
