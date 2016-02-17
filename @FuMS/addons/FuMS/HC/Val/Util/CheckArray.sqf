// CheckArray.sqf
// Horbin
// 3/3/15
// Inputs: variable, expected 'size'
// Output true if variable is an array of 'size'
private ["_abort","_var","_size"];
_var = _this select 0;
_size = _this select 1;
_abort = false;
while {true} do
{
	if (isNil "_var") exitWith {_abort = true;};
	if (TypeName _var != "ARRAY") exitWith {_abort=true;};
	if (count _var != _size) exitWith {_abort=true;};
	if (true) exitWith{};
};
_abort