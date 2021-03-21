private ["_array", "_index", "_default", "_return", "_value"];

_array = 	_this select 0;
_index = 	_this select 1;
_default = 	_this select 2;

_return = -1;
if ((count _array) > _index) then {
	_value = _array select _index;
	if ((typeName _value) isEqualTo (typeName _default)) then {
		_return = _value;
	} else {
		_return = _default;
	};
} else {
	_return = _default;
};

//diag_log format ["Debug: Array: %1, Return: %2",_this,_return];

_return
