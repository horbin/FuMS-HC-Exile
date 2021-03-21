#include "\A3XAI\globaldefines.hpp"

private ["_unitGroup","_lootPool","_groupSize"];

_unitGroup = _this;

_lootPool = _unitGroup getVariable ["LootPool",[]];
_groupSize = _unitGroup getVariable ["GroupSize",0];
_unitType = _unitGroup getVariable ["unitType",""];

if (_unitType != "dynamic") then {
	for "_j" from 1 to _groupSize do {
		if (A3XAI_firstAidKitChance call A3XAI_chance) then {
			_lootPool pushBack FIRST_AID_ITEM_PLAYER;
		};
		
		//Add food to loot list
		for "_i" from 1 to A3XAI_foodLootCount do {
			_lootPool pushBack (A3XAI_foodLoot call A3XAI_selectRandom);
		};

		//Add items to loot list
		for "_i" from 1 to A3XAI_miscLootCount do {
			_lootPool pushBack (A3XAI_MiscLoot call A3XAI_selectRandom);
		};
		
		sleep 0.25;
	};
} else {
	for "_j" from 1 to _groupSize do {
		if (A3XAI_firstAidKitChance call A3XAI_chance) then {
			_lootUnit = (units _unitGroup) call A3XAI_selectRandom;
			[_lootUnit,FIRST_AID_ITEM_PLAYER] call A3XAI_addItem;
		};
		
		//Add food to randomly chosen unit
		for "_i" from 1 to A3XAI_foodLootCount do {
			_lootUnit = (units _unitGroup) call A3XAI_selectRandom;
			_lootItem = (A3XAI_foodLoot call A3XAI_selectRandom);
			[_lootUnit,_lootItem] call A3XAI_addItem;
		};

		//Add items to randomly chosen unit
		for "_i" from 1 to A3XAI_miscLootCount do {
			_lootUnit = (units _unitGroup) call A3XAI_selectRandom;
			_lootItem = (A3XAI_MiscLoot call A3XAI_selectRandom);
			[_lootUnit,_lootItem] call A3XAI_addItem;
		};
		
		sleep 0.25;
	};
};

//Update local group loot pool
_unitGroup setVariable ["LootPool",_lootPool];

true