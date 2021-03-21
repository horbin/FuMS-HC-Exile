#include "\A3XAI\globaldefines.hpp"

private ["_unitGroup", "_unitType", "_fnc_execEveryLoop", "_fnc_checkUnits", "_fnc_generateLoot", "_fnc_vehicleAmmoFuelCheck", "_fnc_antistuck"];

_unitGroup = _this select 0;
_unitType = _this select 1;

call {
	if (_unitType isEqualTo "static") exitWith {
		_fnc_execEveryLoop = A3XAI_execEveryLoop_infantry;
		_fnc_checkUnits = A3XAI_checkGroupUnits;
		_fnc_generateLoot = A3XAI_generateGroupLoot;
		_fnc_vehicleAmmoFuelCheck = {};
		_fnc_antistuck = A3XAI_antistuck_generic;
	};
	if (_unitType isEqualTo "random") exitWith {
		_fnc_execEveryLoop = A3XAI_execEveryLoop_infantry;
		_fnc_checkUnits = A3XAI_checkGroupUnits;
		_fnc_generateLoot = A3XAI_generateGroupLoot;
		_fnc_vehicleAmmoFuelCheck = {};
		_fnc_antistuck = A3XAI_antistuck_generic;
	};
	if (_unitType isEqualTo "dynamic") exitWith {
		_fnc_execEveryLoop = A3XAI_execEveryLoop_infantry;
		_fnc_checkUnits = A3XAI_checkGroupUnits;
		_fnc_generateLoot = A3XAI_generateGroupLoot;
		_fnc_vehicleAmmoFuelCheck = {};
		_fnc_antistuck = A3XAI_antistuck_generic;
	};
	if (_unitType isEqualTo "air") exitWith {
		_fnc_execEveryLoop = A3XAI_execEveryLoop_air;
		_fnc_checkUnits = {};
		_fnc_generateLoot = A3XAI_generateGroupLoot;
		_fnc_vehicleAmmoFuelCheck = A3XAI_checkAmmoFuel;
		_fnc_antistuck = A3XAI_antistuck_air;
	};
	if (_unitType isEqualTo "land") exitWith {
		_fnc_execEveryLoop = A3XAI_execEveryLoop_vehicle;
		_fnc_checkUnits = A3XAI_checkGroupUnits;
		_fnc_generateLoot = A3XAI_generateGroupLoot;
		_fnc_vehicleAmmoFuelCheck = A3XAI_checkAmmoFuel;
		_fnc_antistuck = A3XAI_antistuck_land;
	};
	if (_unitType isEqualTo "uav") exitWith {
		_fnc_execEveryLoop = A3XAI_execEveryLoop_uav;
		_fnc_checkUnits = {};
		_fnc_generateLoot = {};
		_fnc_vehicleAmmoFuelCheck = A3XAI_checkAmmoFuel;
		_fnc_antistuck = A3XAI_antistuck_uav;
	};
	if (_unitType isEqualTo "ugv") exitWith {
		_fnc_execEveryLoop = A3XAI_execEveryLoop_ugv;
		_fnc_checkUnits = {};
		_fnc_generateLoot = {};
		_fnc_vehicleAmmoFuelCheck = A3XAI_checkAmmoFuel;
		_fnc_antistuck = A3XAI_antistuck_ugv;
	};
	if (_unitType isEqualTo "air_reinforce") exitWith {
		_fnc_execEveryLoop = {};
		_fnc_checkUnits = {};
		_fnc_generateLoot = {};
		_fnc_vehicleAmmoFuelCheck = {};
		_fnc_antistuck = {};
	};
	if (_unitType isEqualTo "vehiclecrew") exitWith {
		_fnc_execEveryLoop = A3XAI_execEveryLoop_infantry;
		_fnc_checkUnits = A3XAI_checkGroupUnits;
		_fnc_generateLoot = A3XAI_generateGroupLoot;
		_fnc_vehicleAmmoFuelCheck = {};
		_fnc_antistuck = A3XAI_antistuck_generic;
	};
	if (_unitType isEqualTo "staticcustom") exitWith {
		_fnc_execEveryLoop = {};
		_fnc_checkUnits = A3XAI_checkGroupUnits;
		_fnc_generateLoot = A3XAI_generateGroupLoot;
		_fnc_vehicleAmmoFuelCheck = {};
		_fnc_antistuck = A3XAI_antistuck_generic;
	};
	if (_unitType isEqualTo "aircustom") exitWith {
		_fnc_execEveryLoop = {};
		_fnc_checkUnits = {};
		_fnc_generateLoot = A3XAI_generateGroupLoot;
		_fnc_vehicleAmmoFuelCheck = A3XAI_checkAmmoFuel;
		_fnc_antistuck = A3XAI_antistuck_aircustom;
	};
	if (_unitType isEqualTo "landcustom") exitWith {
		_fnc_execEveryLoop = A3XAI_execEveryLoop_vehicle;
		_fnc_checkUnits = A3XAI_checkGroupUnits;
		_fnc_generateLoot = A3XAI_generateGroupLoot;
		_fnc_vehicleAmmoFuelCheck = A3XAI_checkAmmoFuel;
		_fnc_antistuck = A3XAI_antistuck_generic;
	};
	_fnc_execEveryLoop = {};
	_fnc_checkUnits = {};
	_fnc_generateLoot = {};
	_fnc_vehicleAmmoFuelCheck = {};
	_fnc_antistuck = {};
	diag_log format ["A3XAI Warning: Group functions for unit type %1 not found.",_unitType];
};

[_fnc_execEveryLoop,_fnc_checkUnits,_fnc_generateLoot,_fnc_vehicleAmmoFuelCheck,_fnc_antistuck]