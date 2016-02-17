// Messages transmitted by BaseOps!
// Inputs: From, To, Message, RadioChannel, Range, Position
//RadioChatter = compile preprocessFileLineNumbers "HC\Encounters\Functions\RadioChatter.sqf";

private ["_from","_to","_msg","_channel","_range","_position","_formattedMsg"];
_from = _this select 0;
_to = _this select 1;
_msg = _this select 2;
_channel = _this select 3;
_range = _this select 4;
_position = _this select 5;
_formattedMsg = format ["%1 , %2. %3",_to, _from, _msg];	
if (isNil "_formattedMsg") then
{
    diag_log format ["##FormatAndBroadcast: ERROR! No Message _channel:%1, _pos:%2",_channel, _position];
}else
{
    [_formattedMsg, _channel, _range, _position] call FuMS_fnc_HC_AI_RC_RadioChatter;
};
