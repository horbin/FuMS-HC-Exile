//Chance.sqf
// Horbin
// 1/11/15
// Inputs: Number :Assert between 0 - 1.0
// Outputs: true/false
// returns true if Number is less than a randomly generated number between 0-99
// scales input prior to making the determination. 
// Input %chance. If random is less than %chance, AddIt returns true.
private ["_return","_chance"];
_return = false;
_chance = _this select 0;
if (TypeName _chance == "SCALAR") then
{
    _chance = _chance * 100;
    if ( floor(random 100) < _chance) then
    {
        _return = true;
    };
};
_return