// by ALIAS

private ["_obj_sursa","_mark_sursa","_toxic_center","_toxic_rad","_toxic_dam","_d_pre","_center_toxic","_amplificat_effect"];

if (!hasInterface) exitWith {};

_mark_sursa	= _this select 0;
_toxic_rad	= _this select 1;
_toxic_dam	= _this select 2;

_obj_sursa = "Land_HelipadEmpty_F" createVehicle (getMarkerPos _mark_sursa);
_center_toxic = getPosATL _obj_sursa;
_d_pre 		= damage player;

waitUntil {!isNil {player getVariable "protejat_tox"}};

while {alive player} do {

waitUntil {(player distance _center_toxic) < _toxic_rad};

if((player distance _center_toxic) < _toxic_rad) then 
{
	if (player getVariable "protejat_tox") then {sleep (1.2 + random 1)}
		else {
			_d_pre=_d_pre+_toxic_dam;
			player setDamage _d_pre;
			_amplificat_effect = linearConversion [0, 1,(getdammage player), 2, 0.1, true];
			if (_d_pre>0.05) then 
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
					_handle ppEffectCommit 1;
					waitUntil {ppEffectCommitted _handle};
					uiSleep 1; 
					_handle ppEffectAdjust [0];
					_handle ppEffectCommit 1;
					uiSleep 2; 
					_handle ppEffectEnable false;
					ppEffectDestroy _handle;
				};	
				
				enableCamShake true;
				_shake_b = linearConversion [0.1, 1,(getdammage player), 0, 1, true];
				addCamShake [_shake_b, 3, 17];
				_afect = ["NoSound","NoSound","NoSound","01_breat_toxic","NoSound","NoSound","NoSound","NoSound","02_breat_toxic","NoSound","NoSound","NoSound","NoSound","03_breat_toxic","NoSound","NoSound","NoSound","04_breat_toxic"] call BIS_fnc_selectRandom;
				playsound _afect;
				playsound "puls_1";
			};
			sleep _amplificat_effect;
		};
};// else {todo};
sleep 0.1;
};