/*
	File: fn_paradrop.sqf
	Version: 1.1
	
	Author(s): cobra4v320 - effects adapted from old halo.sqs, sounds from freesound.org
	
	Description: allows AI units and players to paradrop - fixes AI bug
	
	Parameters:
	0: UNIT    - (object) the unit that will be doing the paradrop
	1: VEHICLE - (object) the vehicle that will be doing the paradrop
	2: (optional) SAVELOADOUT - (boolean) true to save backpack and its contents, and add a "fake" backpack to the front of the unit.
    3: drop smoke
	
	Example(s):
	[this, helo_1, true, true] call COB_fnc_paradrop
*/
//if (!isServer || isDedicated) exitWith {};

//Parameters
private ["_unit","_vehicle","_saveLoadOut","_chemLight","_smokes","_handle"]; 
_unit 	 	 = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_vehicle 	 = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_saveLoadOut = [_this, 2, true, [true]] call BIS_fnc_param;
_smokes = _this select 3;

//Validate parameters
if (isNull _unit) exitWith {"Unit parameter must not be objNull. Accepted: OBJECT" call BIS_fnc_error};
if (isNull _vehicle) exitWith {"Vehicle parameter must not be objNull. Accepted: OBJECT" call BIS_fnc_error};

//create a log entry
//["Paradrop function has started"] call BIS_fnc_log;

// wait here until unit is out of the vehicle!
waitUntil { _unit == vehicle _unit};

//save the backpack and its contents, also adds fake pack to front of unit
if (_saveLoadOut && !isNull (unitBackpack _unit)) then 
{
    private ["_pack","_class","_magazines","_weapons","_items"];
    _pack	   = unitBackpack _unit;
    _class	   = typeOf _pack;
    _magazines = getMagazineCargo _pack;
    _weapons   = getWeaponCargo _pack;
    _items	   = getItemCargo _pack;
    
    removeBackpack _unit; //remove the backpack
    _unit addBackpack "b_parachute";
    
    //attach the bacpack to the unit
    [_unit,_class,_magazines,_weapons,_items] spawn 
    {
        private ["_unit","_class","_magazines","_weapons","_items"];
        _unit		= _this select 0;
        _class		= _this select 1;
        _magazines	= _this select 2;
        _weapons 	= _this select 3;
        _items 		= _this select 4;
        
        private "_packHolder";
        _packHolder = createVehicle ["groundWeaponHolder", [0,0,0], [], 0, "can_collide"];
        _packHolder addBackpackCargoGlobal [_class, 1];
        
        waitUntil {animationState _unit == "para_pilot"};
        _packHolder attachTo [vehicle _unit,[-0.07,0.67,-0.13],"pelvis"]; 
        _packHolder setVectorDirAndUp [[0,-0.2,-1],[0,1,0]];
        
        waitUntil {isTouchingGround _unit || (getPos _unit select 2) < 1};
        deleteVehicle _packHolder; //delete the backpack in front
        _unit addBackpack _class; //return the backpack
        clearAllItemsFromBackpack _unit; //clear all gear from new backpack
        
        for "_i" from 0 to (count (_magazines select 0) - 1) do {
            (unitBackpack _unit) addMagazineCargoGlobal [(_magazines select 0) select _i,(_magazines select 1) select _i]; //return the magazines
        };
        for "_i" from 0 to (count (_weapons select 0) - 1) do {
            (unitBackpack _unit) addWeaponCargoGlobal [(_weapons select 0) select _i,(_weapons select 1) select _i]; //return the weapons
        };
        for "_i" from 0 to (count (_items select 0) - 1) do {
            (unitBackpack _unit) addItemCargoGlobal [(_items select 0) select _i,(_items select 1) select _i]; //return the items
        };
    };
} else 
{
    if ((backpack _unit) != "b_parachute") then {_unit addBackpack "B_parachute"}; //add the parachute if unit has no backpack
};

//eject from vehicle
_handle = [_unit,_vehicle, _smokes] spawn
{
    private ["_unit","_vehicle","_altitude","_smokes"];
    _unit = _this select 0;
    _vehicle = _this select 1;
    _smokes = _this select 2;
    
    _altitude = (getPos _vehicle select 2);
    _unit allowDamage false; //keep the AI from being injured when in para_pilot, its an AI bug
    
    if (_altitude > 3040 && (headgear _unit) != "H_CrewHelmetHeli_B") then {_unit addHeadgear "H_CrewHelmetHeli_B"};
    waitUntil {_unit == vehicle _unit}; // unit will be ejected by aircraft's logic!
 //   unassignVehicle _unit;
   // _unit action ["EJECT", _vehicle];
    _unit setDir getDir _vehicle;
    _unit setPos [(getPos _vehicle select 0), (getPos _vehicle select 1) - random 15 + random 30, _altitude - 4];
    _unit setVelocity [0,0,-15];
    
    if(_smokes)then
    {
        private ["_smoke"];
        waitUntil{((getPos _unit)select 2)<75};
        _smoke = "SmokeShell" createVehicle (getPos _unit);
    };
    
    waitUntil {isTouchingGround _unit or ((getPosATL _unit select 2) < 2)}; //wait for unit to touch ground
    
    if (!isPlayer _unit) then {
        _unit setPos [(getPos _unit select 0), (getPos _unit select 1), 0]; //this removes the unit from the parachute
        _unit setVelocity [0,0,0]; //set speed to zero
        _unit setVectorUp [0,0,1]; //set the unit upright
        sleep 1;
        _unit allowDamage TRUE; //allow unit to be damaged again
       // diag_log format ["##fnparadrop AI:%1 on ground able to be damaged! and alive=%2",_unit, alive _unit];
    } ;
};
while {alive _unit} do { sleep 10;};
// exiting this script will cause the AI to despawn..AI continue to execute logic assigned from Mission file too!
