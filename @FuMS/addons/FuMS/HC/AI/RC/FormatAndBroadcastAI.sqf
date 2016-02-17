// Messages Transmitted by AI!
// Inputs: From, To, Message, RadioChannel, Range, Position
//RadioChatter = compile preprocessFileLineNumbers "HC\Encounters\Functions\RadioChatter.sqf";
private ["_from","_to","_msg","_channel","_range","_position","_formattedMsg","_mA","_start","_keyword","_keywords","_newMsg",
"_actionData","_leader","_missionName","_numAlive","_maxAlive"];
_from = _this select 0;
_to = _this select 1;
_msg = _this select 2;
_channel = _this select 3;
_range = _this select 4;
_position = _this select 5; // mission center
_actionData = _this select 6;  //  [ leader, missionname, #alive, startingalive] 
_leader = _actionData select 0;
_missionName = _actionData select 1;
_numAlive = _actionData select 2;
_maxAlive = _actionData select 3;
//KRON_StrToArray (Kronzky)
private["_i","_arr","_out"];
if (isNil "_msg") then { _msg = " ";};

_arr = toArray(_msg);
_out=[];
for "_i" from 0 to (count _arr)-1 do {
    _out=_out+[toString([_arr select _i])];
};
_mA = _out;
//diag_log format ["##FABroadcastAI: _out:%1",_out];
//diag_log format ["##FABroadcastAI: _msnName:%1 #Alive:%2 #max:%3 leader:%4",_missionName,_numAlive,_maxAlive,_leader];
//Find Keywords, place them in an array along with the position they start.
// _keyword ["keyword", start,
_keywords = [];
for [{_i=0},{_i < count _mA},{_i=_i+1}] do
{
    if ( _mA select _i == "<") then
    {
        _start = _i;
        _keyword = "";
        _i=_i+1;
        while {_mA select _i != ">"} do
        {     
           _keyword = format ["%1%2",_keyword, _mA select _i];
            _i = _i + 1;
        };
        _keywords = _keywords + [[_keyword, _start]];
    };
};
//diag_log format ["##FABroadcastAI: _keywords:%1", _keywords];

if (count _keywords > 0) then
{
    // add translations to the message
    _newMsg = "";
    for [{_i=0},{_i < count _mA},{_i=_i+1}] do
    {   
        {
            if (_x select 1 == _i) then
            {
                // do all the magic here
                switch (_x select 0) do
                {
                    case "DIST":
                    {
                        private ["_distance"];
                        _distance = _position distance _leader;
                        _distance = (round(_distance/100))*100;
                        _newMsg = format ["%1%2",_newMsg,_distance];
                        _i = _i + 6;
                    };
                    case "DIR":
                    {
                        private ["_vd","_xcntr","_ycntr","_xldr","_yldr","_xdif","_ydif","_deg","_quad","_dir"];
                        _position;
                        
//                        _vd = _position vectorDiff (getPosASL _leader);
                        if (count _position == 2) then { _position set [2,0];};
                        _vd = (getPosASL _leader) vectorDiff  _position;
                        _deg = (_vd select 0) atan2 (_vd select 1); //_dir range from -180 to +180 
                        if (_deg < 0) then {_deg = 360 + _deg}; //_dir range from 0 to 360
                        if (_deg < 23    or  _deg >= 337) then   {_dir = "N";};
                        if (_deg >=23 and _deg <68) then   {_dir = "NE";};
                        if (_deg >=68 and _deg <113) then  {_dir = "E";};
                        if (_deg >=113 and _deg <158) then {_dir = "SE";};
                        if (_deg >=158 and _deg <203) then {_dir = "S";};
                        if (_deg >=203 and _deg <248) then {_dir = "SW";};
                        if (_deg >=248 and _deg <293) then {_dir = "W";};
                        if (_deg >=293 and _deg <337) then {_dir = "NW";};
                        _newMsg = format ["%1%2", _newMsg, _dir];
                        _i = _i +5;
                    };
                    case "POS":
                    {
                        private ["_unitPos","_xpos","_ypos"];
                        _unitPos = getPos _leader;
                        _xpos = _unitPos select 0;
                        _ypos = _unitPos select 1;
                        _xpos = (round (_xpos/100))*100;
                        _ypos = (round (_ypos/100))*100;
                        _newMsg = format ["%1%2-%3",_newMsg,_xpos,_ypos];
                        _i=_i+5;
                    };
                    case "MSNNAME":
                    {
                        _newMsg = format ["%1%2",_newMsg, _missionName];
                        _i=_i+9;
                    };
                    case "#ALIVE":
                    {
                        _newMsg = format ["%1%2",_newMsg, _numAlive];
                        _i=_i+8;
                    };
                    case "#DEAD":
                    {
                        _newMsg = format ["%1%2",_newMsg, _maxAlive-_numAlive];
                        _i=_i+7; 
                    };
                    case "STATUS":
                    {
                        private ["_status"];
                        _status = "OPS Normal";
                        if (!isNull (_leader findNearestEnemy _leader))then{_status="Engaged with hostiles!"};
                        _newMsg = format ["%1%2",_newMsg, _status];
                        _i=_i+8;
                    };
                };        
            };
        }foreach _keywords;
        _newMsg = format ["%1%2", _newMsg, _mA select _i];
    };
}else
{
    _newMsg = _msg;  
};
_formattedMsg = format ["%1 , %2.: %3",_to, _from, _newMsg];	
if (isNil "_formattedMsg") then
{
    diag_log format ["##FormatAndBroadcastAI: ERROR! No Message _channel:%1, _pos:%2",_channel, _position];
    diag_log format ["##FormatAndBroadcastAI: To:%1 From:%2", _to, _from];
}else
{
    [_formattedMsg, _channel, _range, _position] call FuMS_fnc_HC_AI_RC_RadioChatter;
};
           