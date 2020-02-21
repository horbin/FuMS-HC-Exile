// by ALIAS

if (!hasInterface) exitWith {};

_damage_strig = _this select 0;

player setDamage ((getdammage player) + _damage_strig);

playsound "puls";

0 = ["DynamicBlur", 400, [10]] spawn 
{
	params ["_name", "_priority", "_effect", "_handle"];
	while {
	_handle = ppEffectCreate [_name, _priority];
	_handle < 0
	} do {
	_priority = _priority + 1;
	sleep 0.01;
	};
	_handle ppEffectEnable true;
	_handle ppEffectAdjust _effect;
	_handle ppEffectCommit 0.5;
	waitUntil {ppEffectCommitted _handle};
	uiSleep 0.5; 
	_handle ppEffectAdjust [0];
	_handle ppEffectCommit 0.5;
	uiSleep 1.5; 
	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};
				
0 = ["ColorInversion", 2500, [0.53, 0.66, 0.94]] spawn 
{
	params ["_name", "_priority", "_effect", "_handle"];
	while {
		_handle = ppEffectCreate [_name, _priority];
		_handle < 0
	} do {
		_priority = _priority + 1;
	};
	_handle ppEffectEnable true;
	_handle ppEffectAdjust _effect;
	_handle ppEffectCommit 0.5;
	//waitUntil {ppEffectCommitted _handle};
	uiSleep 0.5; 
	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};

sleep 4;

playsound "tiuit";