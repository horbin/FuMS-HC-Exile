//GetShortName.sqf
// Horbin
// 3/9/15
//Input 'player' object
// Returns player name with group and () removed
//Get the player's name.    
private ["_findbrace","_playername","_playerFullName","_i","_arr","_out"];
_findbrace = false;
_playername = "";
_playerFullName = _this select 0; 
_arr = toArray(format ["%1",_playerFullName]);
_out=[];
for "_i" from 0 to (count _arr)-1 do
{
    _out=_out+[toString([_arr select _i])];
};       
// parse the array.        
for [{_i=0},{_i < (count _out)},{_i=_i+1}] do
{
    if (_findbrace) then
    {
        if (_out select _i == ")") then {_findbrace = false;}
        else { _playername = format ["%1%2",_playername, _out select _i];};
    } else
    { 
        if (_out select _i == "(") then {_findbrace = true;};
    };
};       
_playername



