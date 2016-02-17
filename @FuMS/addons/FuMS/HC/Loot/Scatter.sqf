// Scatter.sqf
// Horbin
// 4/19/15
//
// Inputs: 2d, 3d position, or a vehicle,  
//      item,  
//      number of item to create, 
//      type of object "WEAPON", "MAGAZINE", "ITEM", "BACKPACK"
// Function will determine centroid location, then place items randomly around the location at a distance of 5-15m
private ["_pos","_item","_number","_type","_i","_playerNear"];
_pos = _this select 0;
_item = _this select 1;
_number = _this select 2;
_type = _this select 3;
// Get Center position
if (TypeName _pos == "OBJECT") then {_pos = getPos _pos;};
// For each _item

// wait for a player to get within 50m
_playerNear = false;
while {!_playerNear} do
{
    {
        if (isplayer _x) exitWith {_playerNear = true;};
    }foreach ( _pos nearentities 50);
    uisleep 5;
};
//diag_log format ["<FuMS> Scatter: Loot spawning at %1.  Player detected",_pos];
for [{_i=0;},{_i < _number},{_i=_i+1}] do
{
    private["_dist","_direction","_randomPos","_box" ];
	// get position to create weapon holder
	_dist = [5,15] call BIS_fnc_randomInt;
	_direction = [0,359] call BIS_fnc_randomInt;
	_randomPos = [_pos,_dist,_direction] call BIS_fnc_relPos;
	// create the weapon holder
    _box = createVehicle ["weaponHolderSimulated",_randomPos,[],0,"CAN_COLLIDE"];
    _box setPosATL [_randomPos select 0, _randomPos select 1, 2];
	// register the weapon holder with the HC as a vehicle for mission - currently FuMS does NOT clean up loot...so nothing needed.
	// register with server so it will clean this up if HC disconnects.
	["Vehicles",_box] call FuMS_fnc_HC_Util_HC_AddObject;
	// place item into the weapon holder based upon its _type.
	switch (_type) do
	{
		case "WEAPON": { _box addWeaponCargoGlobal [_item,1];};
		case "MAGAZINE": {_box addMagazineCargoGlobal [_item,1];};
		case "ITEM":{_box addItemCargoGlobal [_item, 1];};
		case "BACKPACK":{_box addBackpackCargoGlobal [_item, 1];};
	};
   // diag_log format ["<FuMS> Scatter: Creating %1  %2m/%3brg from %4 (%5)",_item,_dist,_direction,_pos, _randomPos];
};
	


