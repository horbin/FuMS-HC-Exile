#include "\A3XAI\globaldefines.hpp"

private ["_unitGroup", "_unit", "_loadout", "_currentMagazines", "_magazine"];

_unitGroup = _this select 0;
_vehicle = _this select 1;

_result = _vehicle call A3XAI_reloadVehicleTurrets; //Rearms vehicle weapons/turrets individually
if ((A3XAI_debugLevel > 0) && {_result}) then {diag_log format ["A3XAI Debug: Reloaded ammo for group %1 %2.",_unitGroup,(typeOf _vehicle)];};
if ((fuel _vehicle) < 0.50) then {_vehicle setFuel 1; if (A3XAI_debugLevel > 0) then {diag_log format ["A3XAI Debug: Refueled group %1 %2.",_unitGroup,(typeOf _vehicle)];};};
_unitGroup setVariable ["lastRearmTime",diag_tickTime];

true