//AttachMuzzle.sqf
// Horbin
// 1/11/2015
// Input: "weapon name"
// Output: "suppressor" appropriate for the input weapon's caliber and type.
private ["_weapon","_muzzlesList","_muzzleType"];
_weapon = _this select 0;

_muzzleType = "";
//assumes just rifles!
//_isRifle = true;
_muzzlesList = [] + getArray (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
	if ((count _muzzlesList) > 0) then 
    {
		_muzzleType = _muzzlesList call BIS_fnc_selectRandom;
    };
_muzzleType        
