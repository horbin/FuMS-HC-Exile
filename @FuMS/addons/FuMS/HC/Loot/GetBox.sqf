//GetBox.sqf
// Horbin
// 2/7/15
// INPUTS: None
// OUTPUTS: box object
// selects a random box for loot, based upon global options found in BaseLoot.sqf
private ["_box"];
// _side = _this select 0;
//_type = _this select 1;
//_llistofboxes = FuMS_STORAGE select 0;
diag_log format ["##GetBox: LootList: %1",FuMS_STORAGE];
_box = FuMS_STORAGE call BIS_fnc_selectRandom;
diag_log format ["##GetBox: Loot selected: %1",_box];
_box
