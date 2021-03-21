#include "\A3XAI\globaldefines.hpp"

private ["_unit", "_unitLevel", "_unitLevelInvalid", "_loadout", "_weaponSelected", "_unitLevelString", "_uniforms", "_uniformItem", "_backpackChance", "_backpacks", "_backpackItem", 
"_vestChance", "_vests", "_vestItem", "_headgearChance", "_headgears", "_headgearItem", "_magazine", "_useGL", "_weaponMuzzles", "_GLWeapon", "_GLMagazines", "_isRifle", "_opticsList", 
"_opticsType", "_pointersList", "_pointerType", "_muzzlesList", "_muzzleType", "_underbarrelList", "_underbarrelType", "_gadgetsArray", "_gadget"];

_unit = _this select 0;
_unitLevel = _this select 1;

if !(isNil {_unit getVariable "loadout"}) exitWith {diag_log format ["A3XAI Error: Unit already has loadout! (%1)",__FILE__];};

if !(_unitLevel in A3XAI_unitLevelsAll) then {
	_unitLevelInvalid = _unitLevel;
	_unitLevel = A3XAI_unitLevels call A3XAI_selectRandom;
	diag_log format ["A3XAI Error: Invalid unitLevel provided: %1. Generating new unitLevel value: %2. (%3)",_unitLevelInvalid,_unitLevel,__FILE__];
};

_unit call A3XAI_purgeUnitGear;	//Clear unwanted gear from unit first.

_loadout = [[],[]];
_weaponSelected = _unitLevel call A3XAI_getWeapon;
_unitLevelString = str (_unitLevel);

_uniforms = missionNamespace getVariable ["A3XAI_uniformTypes"+_unitLevelString,[]];
if !(_uniforms isEqualTo []) then {
	_uniformItem = _uniforms call A3XAI_selectRandom;
	_unit forceAddUniform _uniformItem;
	//diag_log format ["DEBUG: %1",_uniformItem];
};


_backpackChance = missionNamespace getVariable ["A3XAI_addBackpackChance"+_unitLevelString,1.00];
if (_backpackChance call A3XAI_chance) then {
	_backpacks = missionNamespace getVariable ["A3XAI_backpackTypes"+_unitLevelString,[]];
	if !(_backpacks isEqualTo []) then {
		_backpackItem = _backpacks call A3XAI_selectRandom;
		_unit addBackpack _backpackItem; 
		clearAllItemsFromBackpack _unit;
		//diag_log format ["DEBUG: %1",_backpackItem];
	};
};

_vestChance = missionNamespace getVariable ["A3XAI_addVestChance"+_unitLevelString,1.00];
if (_vestChance call A3XAI_chance) then {
	_vests = missionNamespace getVariable ["A3XAI_vestTypes"+_unitLevelString,[]];
	if !(_vests isEqualTo []) then {
		_vestItem = _vests call A3XAI_selectRandom;
		_unit addVest _vestItem;
		//diag_log format ["DEBUG: %1",_vestItem];
	};
};

_headgearChance = missionNamespace getVariable ["A3XAI_addHeadgearChance"+_unitLevelString,1.00];
if (_headgearChance call A3XAI_chance) then {
	_headgears = missionNamespace getVariable ["A3XAI_headgearTypes"+_unitLevelString,[]];
	if !(_headgears isEqualTo []) then {
		_headgearItem = _headgears call A3XAI_selectRandom;
		_unit addHeadgear _headgearItem;
		//diag_log format ["DEBUG: %1",_headgearItem];
	};
};

_magazine = getArray (configFile >> "CfgWeapons" >> _weaponSelected >> "magazines") select 0;

_unit addMagazine _magazine;
_unit addWeapon _weaponSelected;
_unit selectWeapon _weaponSelected;
(_loadout select 0) pushBack _weaponSelected;
(_loadout select 1) pushBack _magazine;
if ((getNumber (configFile >> "CfgMagazines" >> _magazine >> "count")) < 6) then {
	_unit setVariable ["extraMag",true];
	_unit addMagazine _magazine;
};

//Grenades
_useGL = if !(A3XAI_levelRequiredGL isEqualTo -1) then {_unitLevel >= A3XAI_levelRequiredGL} else {false};
if (_useGL) then {
	_weaponMuzzles = getArray(configFile >> "cfgWeapons" >> _weaponSelected >> "muzzles");
	if ((count _weaponMuzzles) > 1) then {
		_GLWeapon = _weaponMuzzles select 1;
		_GLMagazines = (getArray (configFile >> "CfgWeapons" >> _weaponSelected >> _GLWeapon >> "magazines"));
		if (GRENADE_AMMO_3RND in _GLMagazines) then {
			_unit addMagazine GRENADE_AMMO_3RND;
			(_loadout select 0) pushBack _GLWeapon;
			(_loadout select 1) pushBack GRENADE_AMMO_3RND;
			if (A3XAI_debugLevel > 1) then {diag_log format ["A3XAI Debug: Modified unit %1 loadout to %2.",_unit,_loadout];};
		} else {
			if (GRENADE_AMMO_1RND in _GLMagazines) then {
				_unit addMagazine GRENADE_AMMO_1RND;
				(_loadout select 0) pushBack _GLWeapon;
				(_loadout select 1) pushBack GRENADE_AMMO_1RND;
				if (A3XAI_debugLevel > 1) then {diag_log format ["A3XAI Debug: Modified unit %1 loadout to %2.",_unit,_loadout];};
			}
		};
	};
};

//Select weapon optics
_isRifle = ((getNumber (configFile >> "CfgWeapons" >> _weaponSelected >> "type")) isEqualTo 1);
if ((missionNamespace getVariable [("A3XAI_opticsChance"+_unitLevelString),3]) call A3XAI_chance) then {
	_opticsList = getArray (configFile >> "CfgWeapons" >> _weaponSelected >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
	if !(_opticsList isEqualTo []) then {
		_opticsType = A3XAI_weaponOpticsList call A3XAI_selectRandom;
		if (_opticsType in _opticsList) then {
			if (_isRifle) then {_unit addPrimaryWeaponItem _opticsType} else {_unit addHandGunItem _opticsType};
		};
	};
};

//Select weapon pointer
if ((missionNamespace getVariable [("A3XAI_pointerChance"+_unitLevelString),3]) call A3XAI_chance) then {
	_pointersList = getArray (configFile >> "CfgWeapons" >> _weaponSelected >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
	if !(_pointersList isEqualTo []) then {
		_pointerType = _pointersList call A3XAI_selectRandom;
		if (_isRifle) then {_unit addPrimaryWeaponItem _pointerType} else {_unit addHandGunItem _pointerType};
		//diag_log format ["DEBUG :: Added pointer item %1 to unit %2.",_pointerType,_unit];
	};
};

//Select weapon muzzle
if ((missionNamespace getVariable [("A3XAI_muzzleChance"+_unitLevelString),3]) call A3XAI_chance) then {
	_muzzlesList = getArray (configFile >> "CfgWeapons" >> _weaponSelected >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
	if !(_muzzlesList isEqualTo []) then {
		_muzzleType = _muzzlesList call A3XAI_selectRandom;
		if (_isRifle) then {_unit addPrimaryWeaponItem _muzzleType} else {_unit addHandGunItem _muzzleType};
		//diag_log format ["DEBUG :: Added muzzle item %1 to unit %2.",_muzzleType,_unit];
	};
};

//Select weapon muzzle
if ((missionNamespace getVariable [("A3XAI_underbarrelChance"+_unitLevelString),3]) call A3XAI_chance) then {
	_underbarrelList = getArray (configFile >> "CfgWeapons" >> _weaponSelected >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");
	if !(_underbarrelList isEqualTo []) then {
		_underbarrelType = _underbarrelList call A3XAI_selectRandom;
		if (_isRifle) then {_unit addPrimaryWeaponItem _underbarrelType} else {_unit addHandGunItem _underbarrelType};
		//diag_log format ["DEBUG :: Added underbarrel item %1 to unit %2.",_underbarrelType,_unit];
	};
};

_gadgetsArray = missionNamespace getVariable ["A3XAI_gadgetsList"+_unitLevelString,[]];
for "_i" from 0 to ((count _gadgetsArray) - 1) do {
	if (((_gadgetsArray select _i) select 1) call A3XAI_chance) then {
		_gadget = ((_gadgetsArray select _i) select 0);
		_unit addWeapon _gadget;
	};
};

//If unit was not given NVGs, give the unit temporary NVGs which will be removed at death.
if (A3XAI_enableTempNVGs && {sunOrMoon < 1}) then {
	_unit call A3XAI_addTempNVG;
};

//Give unit temporary first aid kits to allow self-healing (unit level 1+)
if (A3XAI_enableHealing) then {
	for "_i" from 1 to (_unitLevel min 3) do {
		[_unit,FIRST_AID_ITEM_AI] call A3XAI_addItem;
	};
};

_unit setVariable ["loadout",_loadout];
if (A3XAI_debugLevel > 1) then {diag_log format ["A3XAI Debug: Created loadout for unit %1 (unitLevel: %2): %3.",_unit,_unitLevel,_loadout];};

true
