//HC_AddWaypoint.sqf
// Horbin
// 12/26/14
// INPUTS: Group, Position, Radius
//  Adds a NEW waypoint to 'Group'. If radius is specified, waypoint will be located
//    a random distance of 'radius' from position.
// OUTPUTS: Waypoint created, in waypoint format [Group, waypoint index]
// Note: If HCDEBUG is defined, a marker will be created to show the waypoint on the map
private ["_group", "_poss","_radius","_wp","_mrkrname"];
_group = _this select 0;
_poss = _this select 1;
_radius = _this select 2;
_wp = _group addWaypoint [_poss, _radius];

//HCDEBUG = "WP";

if (!(isNil "HCDEBUG") ) then
{
    if (HCDEBUG == "WP") then
    {
        //plot the waypoint on the map.
        _mrkrname = format ["WP%2_%1", _wp select 1, _wp select 0];
        _tstmrk = createMarker [_mrkrname, [0,0]];
        _mrkrname setMarkerPos _poss;
        _mrkrname setMarkerAlpha 1;
        _mrkrname setMarkerType "mil_dot";
        _mrkrname setMarkerText _mrkrname;
        publicVariable _mrkrname;
        
        if (!isServer) then
        {
            ["Markers",_mrkrname] call FuMS_fnc_HC_Util_HC_AddObject;      
        };
    };
};
_wp