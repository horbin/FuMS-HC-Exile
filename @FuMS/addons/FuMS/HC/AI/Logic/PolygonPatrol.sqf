//PolygonPatrol
// Horbin
// 12/26/14
//INPUTS: Group, centroid, radius (meters), vertices, rotation, closeout
// Adds 'vertices'+1 waypoints to 'Group'. Waypoints form a polygon. 
//   polygon is scribed inside the circle of 'radius', and rotated clockwise by 'rotation'
// closeout = TRUE: "cycle" waypoint added to enable looped patrol of the box.
//                FALSE: just the 'vertices' points are added to the group, to permit further points to be added.
// NOTE: 'vertices+1' total points, AI will complete box no matter what 'closeout' is set too.
//       closeout just controls if the patrol will repeat the path.
//OUTPUTS: 1st of the waypoints added, to permit further modification.
//  NOTE: closeout = TRUE => vertices+1 points  FALSE=> vertices   
//HC_AddWaypoint = compile preprocessFileLineNumbers "HC\Functions\HC_AddWaypoint.sqf";

//_wp = [_group, [_xx, _yy], 0] call HC_AddWaypoint;  
private ["_group","_radius","_rotation","_vertices","_degsep","_i","_xx","_yy","_wp","_closeout","_centroid",
"_cos","_sin","_xbase","_ybase","_xmulti","_ymulti","_closeoutoffset"];
_group = _this select 0;
_centroid = _this select 1;
_radius = _this select 2;
_vertices = _this select 3;
_rotation = _this select 4;   
_closeout = _this select 5;    
//_basepoints = [45,135,225,315,45]; // 5 points to create 4 patrol paths.
_degsep = 360 / _vertices;
_xbase = _centroid select 0;
_ybase = _centroid select 1;
for [ {_i=0}, {_i < 360}, {_i = _i + _degsep}] do
{
    //    diag_log format ["##HC: Rendering Waypoints:Offset:%4, centriod:%1, rotation:%2, radius:%3",_centroid, _rotation, _radius, _x];
    _cos = cos (_i+ _rotation);
    _sin = sin (_i + _rotation);
    _xmulti = _radius * _cos;
    _ymulti = _radius * _sin;
    //      diag_log format ["######\n######\n##HC: Cos %1=%2 :: Sin %1=%3.\n##HC: Centroid:X=%4, Y+%5/n##HC:  xmulti=%5, ymulti=%6",
    //    _x,_cos, _sin, _xbase, _ybase, _xmulti, _ymulti];
    _xx = _xbase + _xmulti;
    _yy = _ybase + _ymulti;
    // diag_log format ["##HC: Rendering Waypoints:closeout=%3 X:%1, Y:%2",_xx, _yy,_closeout];
    _wp = [_group, [_xx, _yy], 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;  
     _wp setWaypointBehaviour "COMBAT";
    _wp setWaypointType "MOVE";
};
if (_closeout) then
{
    // add the 'cycle' waypoint
    _closeoutoffset = 0;
    _cos = cos (_closeoutoffset + _rotation);
    _sin = sin (_closeoutoffset + _rotation);
    _xmulti = _radius * _cos;
    _ymulti = _radius * _sin;
    _xx = _xbase + _xmulti;
    _yy = _ybase + _ymulti;
    // diag_log format ["######\n######\n##HC: Cos %1=%2 :: Sin %1=%3.\n##HC: Centroid:X=%4, Y+%5/n##HC:  xmulti=%5, ymulti=%6",_closeoutoffset,_cos, _sin, _xbase, _ybase, _xmulti, _ymulti];
    _wp = [_group, [_xx, _yy], 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;       
    _wp setWaypointType "CYCLE";
    // set back count, including the cycle waypoint.
    //diag_log format ["##HC: Rendering Waypoints:Total #%1", _wp select 1];
    _wp = [_wp select 0, (_wp select 1) - (_vertices)];    
    //diag_log format ["##HC: Rendering Waypoints:Total #%1", _wp select 1];
}else
{
    // set back count,set back to wp#1, not wp#0. wp#0 is current group's pos, or last wp to have been added to the list.
    _wp = [_wp select 0, (_wp select 1) - (1-_vertices)]; 
};
_wp
