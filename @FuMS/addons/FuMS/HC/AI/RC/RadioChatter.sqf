//RadioChatter.sqf
// Horbin
// 1/15/15
// Inputs message, radio, range, position
// radio: 0-9 - sets what radio set will be used. Default: 0
// range: sets range (meters) from position the chatter is able to be heard. Default: Unlimited
// Outputs: TRUE if message is sent to at least 1 player. FALSE = no players to hear the message.
// ["Hello World"] call RadioChatter - sends message to all players, regardless of radio 
// ["Hello World", 0] call RadioChatter - sends message to all players with a 0 channel radio
// ["Hello World, 2, 1000, _pos] call RadioChatter - sends message to all players within 1000m of _pos who hold ch2 radio.
private ["_msg","_channel","_range","_pos","_messageheard","_radio","_receivers","_hasRadio","_distance"];
_msg = _this select 0;
_channel = _this select 1;
_range = _this select 2;
_pos = _this select 3; //Assert: Is equal to the encounter center! If not, reinforcement calls will not work!
_messageheard = false;
if (isNil "_channel") then {_channel = "ALL";};
if (isNil "_range") then {_range = 0;};  // 0 will disable range checking, so all players will receive message
if (isNil "_msg") then
{
    diag_log format ["##RadioChatter: ERROR! No Message _channel:%1, _pos:%2",_channel, _pos];
}else
{
    //diag_log format ["##RadioChatter: Generating message %1,%2,%3,%4", _channel, _range, _pos, _msg];
    if (FuMS_RC_EnableRadioChatterSystem) then
    {
        _messageheard = false;
        //set up the radio
        _radio = format ["EpochRadio%1",_channel];
        if (!FuMS_RC_RadioRequired) then {_radio = "EpochRadioALL";}; // Can hear messages without a radio!
        // find all players
        _receivers = [];
        {
            if (isPlayer _x) then
            {
                _receivers = _receivers + [_x];
            };
        }foreach allUnits;
        // find all players with the matching radio.
        if (_radio != "EpochRadioALL") then  // this sends it to everyone, even folks without a radio!
        {
            _hasRadio = false;
            if (FuMS_RC_RadioFollowTheme) then
            {
                {
                    _hasRadio = _radio in (assignedItems _x);
                    if (!_hasRadio) then 
                    {
                        _receivers = _receivers - [_x];
                    };
                } foreach _receivers;
            }else   // push message to a player as long as he has ANY radio equiped!
            {
                private ["_hasanyradio","_i"];
                _hasanyradio = [];
                {
                    for [{_i=0},{_i<10},{_i=_i+1}] do
                    {
                        _radio = format ["EpochRadio%1",_i];
                        _hasRadio = _radio in (assignedItems _x);
                        if (_hasRadio) then {_hasanyradio = _hasanyradio + [_x];};
                    };
                }foreach _receivers;
                _receivers = _hasanyradio;
            }
        };
        // find all players that are within range.
        if (_range > 0 ) then
        {
            {
                _distance = _x distance _pos;
                if ( _distance > _range) then {_receivers = _receivers - [_x];};
            } foreach _receivers;
        };
        // send it to server to be able to utilize 'owner' function
        //  diag_log format ["##RadioChatter: sent to PVEH: %1 :: %2",_msg,_receivers];
        if (isServer) then
        {
            [[_msg, _receivers]] spawn FuMS_RadioChatter_Server;
        }
        else
        {
            FuMS_RADIOCHATTER_Distro = [_msg, _receivers];
            publicVariableServer "FuMS_RADIOCHATTER_Distro";
        };
        if (count _receivers > 0) then { _messageheard = true;};
    };
};
_messageheard