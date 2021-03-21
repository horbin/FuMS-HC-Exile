#include "\A3XAI\globaldefines.hpp"

private ["_unitGroup", "_unit", "_loadout", "_currentMagazines", "_magazine"];

_unitGroup = _this select 0;

{
	if ((isNull (objectParent _x)) && {_x getVariable ["canCheckUnit",true]} && {local _x}) then {
		_x setVariable ["canCheckUnit",false];
		_nul = _x spawn {
			if (!alive _this) exitWith {};
			_unit = _this;
			_loadout = _unit getVariable "loadout";
			if (!isNil "_loadout") then {
				if (A3XAI_debugLevel > 1) then {diag_log format ["A3XAI Debug: Unpacked unit manager for unit %1. Loadout found: %2.",_unit,_loadout];};
				while {(alive _unit) && {isNull (objectParent _unit)} && {local _unit}} do {
					_currentMagazines = (magazines _unit);
					_magazine = ((_loadout select 1) select 0);
					if (((_unit ammo ((_loadout select 0) select 0)) isEqualTo 0) || {!((_magazine in _currentMagazines))}) then {
						_unit removeMagazines _magazine;
						[_unit,_magazine] call A3XAI_addItem;
						if (_unit getVariable ["extraMag",false]) then {
							[_unit,_magazine] call A3XAI_addItem;
						};
					};
					for "_i" from 1 to ((count (_loadout select 0)) - 1) do {
						_magazine = ((_loadout select 1) select _i);
						if (((_unit ammo ((_loadout select 0) select _i)) isEqualTo 0) && {!((_magazine in _currentMagazines))}) then {
							_unit removeMagazines _magazine;
							[_unit,_magazine] call A3XAI_addItem;
						};
					};
					if (alive _unit) then {uiSleep 15};
				};
			};
			if (alive _unit) then {
				_unit setVariable ["canCheckUnit",true];
				if (A3XAI_debugLevel > 1) then {diag_log format ["A3XAI Debug: Repacking unit manager for unit %1.",_unit];};
			};
		};
	};
	uiSleep 0.1;
} forEach (units _unitGroup);

true