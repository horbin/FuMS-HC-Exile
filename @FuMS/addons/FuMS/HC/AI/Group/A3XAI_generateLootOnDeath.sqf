#include "\A3XAI\globaldefines.hpp"

private ["_unit", "_unitLevel", "_weaponLoot", "_toolLoot", "_pistol", "_magazine", "_toolsArray", "_item", "_loadout", "_primaryWeapon"];

_unit = _this select 0;
_unitLevel = _this select 1;

if (_unit getVariable ["LootGenerated",false]) exitWith {};
_unit setVariable ["LootGenerated",true];

if !(local _unit) then {
	waitUntil {uiSleep 1; local _unit};
};

if (A3XAI_debugLevel > 1) then {diag_log format["A3XAI Debug: Generating loot for AI unit with unitLevel %2.",_unit,_unitLevel];};

_weaponLoot = [];
_toolLoot = [];

_loadout = _unit getVariable ["loadout",[[],[]]];
_primaryWeapon = [_loadout select 0,0,""] call A3XAI_param;

//Generate a pistol if one wasn't assigned with loadout script.
if ((getNumber (configFile >> "CfgWeapons" >> _primaryWeapon >> "type")) != 2) then {
	_pistol = A3XAI_pistolList call A3XAI_selectRandom;
	_magazine = getArray (configFile >> "CfgWeapons" >> _pistol >> "magazines") select 0;
	_unit addMagazine _magazine;	
	_unit addWeapon _pistol;
	if (A3XAI_debugLevel > 1) then {
		_weaponLoot pushBack _pistol;
		_weaponLoot pushBack _magazine
	};
};

//Add tool items
_toolsArray = missionNamespace getVariable ["A3XAI_toolsList"+str(_unitLevel),[]];
{
	_item = _x select 0;
	if (((_x select 1) call A3XAI_chance) && {[_item,"weapon"] call A3XAI_checkClassname}) then {
		_unit addWeapon _item;
		if (A3XAI_debugLevel > 1) then {
			_toolLoot pushBack _item;
		};
	}
} forEach _toolsArray;
	
if (A3XAI_debugLevel > 1) then {diag_log format ["A3XAI Debug: Generated loot for AI death: %1,%2,%3.",_weaponLoot,_toolLoot];};
