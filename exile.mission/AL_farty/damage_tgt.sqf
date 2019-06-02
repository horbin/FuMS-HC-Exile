// by ALIAS
private ["_tgt","_dam_effect"];

if (!hasInterface) exitWith {};

_tgt = _this select 0;

//playsound "sfaraie_01";

[_tgt,["sfaraie_01",200]] remoteExec ["say3d"];

if (player==_tgt) then 
{
0 = ["DynamicBlur", 400, [1]] spawn 
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
	uiSleep 1; 
	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};
				
0 = ["ColorInversion", 2500, [0.44, 0.72, 0.1]] spawn 
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
};

_dam_effect = "#particlesource" createVehicleLocal (getPosATL _tgt);
_dam_effect setParticleCircle [0, [0, 0, 0]];
_dam_effect setParticleRandom [0, [0.1, 0.1, 0.3], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
_dam_effect setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "Billboard", 1, 2,[0,0,1.6],[0,0,0], 3, 10.5, 7.9, 0.0000000001, [1,4], [[0,1,0,1],[0,1,0,0]], [0.08], 1, 0, "", "", _tgt];
_dam_effect setDropInterval 0.05;

sleep 1;
deleteVehicle _dam_effect;