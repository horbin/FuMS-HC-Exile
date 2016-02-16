//GetQuantity.sqf
// Horbin
// 1/10/15
// INPUTS: an array of 3 numbers [a,b,c]
// OUTPUTS: a value of a + random (c-b)
private ["_options","_value","_low","_high","_delta"];
_options = _this select 0;
//diag_log format ["GetQuantity: %1",_options];
if (TypeName _options == "ARRAY") then
{
    _value = _options select 0;
    _low = _options select 1;
    _high = _options select 2;
    _delta = _high - _low;
    _value = _value + _low;
    _value = _value + floor(random _delta);
}
else  // _options is a number
{
    _value = _options;
};
_value