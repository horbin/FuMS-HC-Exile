// DropLootVehicle.sqf
// TheOneWhoKnocks
// DropLootVehicle is called when the loot is determind to be a vehicle classname and not a loottype
// Very heavily influenced by Apoc's Airdrop script, justmodified to handle a specfic loot vehicle dropped
// and to include variables from the FuMS system
// Orignial credits
// ******************************************************************************************
// * This script is licensed under the GNU Lesser GPL v3.
// ******************************************************************************************
// Apoc's Airdrop Assistance
// https://github.com/osuapoc
//Author: Apoc
//Credits: Some methods taken from Cre4mpie's airdrop scripts, props for the idea!
//Starts off much the same as the client start.  This is to find information from config arrays
// INPUTS: Vehicle classname and drop position (x,y,y(ARRAY) OR a veh object(OBJECT))
// Outputs: box item, if created.
// ASSERT Global Variable BaseLoot.sqf have been defined!

private ["_allowDamageDuringFall","_DropSelection","_pos","_extraMoney","_heliType","_center","_grp","_flyHeight","_dropSpot","_heliDirection","_heliStartDistance","_spos","_heli","_crew","_heliDistance","_dir","_flySpot","_DropType","_objectSpawnPos","_objectPosDrop","_para","_smoke1","_flare1","_smoke2","_flare2"];


_DropSelection = toupper (_this select 0);
_pos = _this select 1;
_extraMoney = 1000;  // will add in loot money later
_allowDamageDuringFall = true;

//diag_log format ["<FuMS> DropLootVehicle: Launch parameters:  _DropSelection:%1 | _pos:%2",_DropSelection,_pos];


// The following logic will allow for loot drops of both types in the future
//if ( ((_loot select 0) isKindOf "Air") or ((_loot select 0) isKindOf "LandVehicle") or ((_loot select 0)_type isKindOf "Ship")) then
//{
	_DropType = "vehicle";
//}else
//{
//	_DropType = "vehicle"
//};
//_player 				= objectfromNetID (_this select 2); //FIGURE THIS OUT

//diag_log format ["<FuMS> DropLootVehicle: Drop Type: %1",_DropType];

/////// Spawn Heli /////////////////////////////////////////////////
_heliType = selectRandom FuMS_Heli_Airdrop; //Pick a vehicle from main FuMS loot table
//diag_log format ["<FuMS> DropLootVehicle - _heliType: %1", _heliType];  //Heli selection

// _center = createCenter civilian; probably not needed
_grp = createGroup civilian;
if(isNil("_grp2"))then{_grp2 = createGroup civilian;}else{_grp2 = _grp2;};  //WHY?
_flyHeight = 200;  //Distance from ground that heli will fly at
_dropSpot = [(_pos select 0),(_pos select 1),_flyHeight]; //Location vehicle will be dropped
_heliDirection = random 360;
_heliStartDistance = 5000;
_spos=[(_dropSpot select 0) - (sin _heliDirection) * _heliStartDistance, (_dropSpot select 1) - (cos _heliDirection) * _heliStartDistance, (_flyHeight+200)];

//diag_log format ["<FuMS> DropLootVehicle - Heli Spawned at %1", _spos];
_heli = createVehicle [_heliType, _spos, [], 0, "FLY"];
_heli allowDamage false; //No shooting this one down you jerks

//Spawn pilot
_crew = _grp createUnit ["O_recon_F", _spos, [], 0, "NONE"];
_crew moveInDriver _heli;
_crew allowDamage false;

_heli setCaptive true;  //Make heli invisible to other AI

_heliDistance = 4000;
_dir = ((_dropSpot select 0) - (_spos select 0)) atan2 ((_dropSpot select 1) - (_spos select 1));
_flySpot = [(_dropSpot select 0) + (sin _dir) * _heliDistance, (_dropSpot select 1) + (cos _dir) * _heliDistance, _flyHeight];

_grp setCombatMode "BLUE";
_grp setBehaviour "CARELESS";  //Just out for a sunday stroll.

{_x disableAI "AUTOTARGET"; _x disableAI "TARGET";} forEach units _grp;

//Well ole chap, where are we going?
_wp0 = _grp addWaypoint [_dropSpot, 0, 1];
[_grp,1] setWaypointBehaviour "CARELESS";
[_grp,1] setWaypointCombatMode "BLUE";
[_grp,1] setWaypointCompletionRadius 20;
_wp1 = _grp addWaypoint [_flySpot, 0, 2];
[_grp,2] setWaypointBehaviour "CARELESS";
[_grp,2] setWaypointCombatMode "BLUE";
[_grp,2] setWaypointCompletionRadius 20;
_heli flyInHeight _flyHeight;
//////// Create Purchased Object //////////////////////////////////////////////
_object = switch (_DropType) do {
	case "vehicle":
	{
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = [ _DropSelection, _objectSpawnPos, [], 0 , "CAN_COLLIDE"] call FuMS_fnc_HC_Util_HC_CreateVehicle;
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		_object
	};
	default {  //In case it all gets snafu'd.
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle ["Exile_Container_SupplyBox", _objectSpawnPos, [], 0, "None"];
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		_object
		};
	/*
	case "supply":
	{
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle ["Exile_Container_SupplyBox", _objectSpawnPos, [], 0, "None"];

		[_object, _DropSelection] call ExAdServer_fnc_fillAirdrop;
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		_object
	};
	default {  //In case it all gets snafu'd.
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle ["Exile_Container_SupplyBox", _objectSpawnPos, [], 0, "None"];

		[_object, "airdrop_FoodSmall"] call ExAdServer_fnc_fillAirdrop;
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		_object
		};
	*/
};

_object allowDamage false; // Drop vehicle cannot be damaged in flight

//diag_log format ["<FuMS> DropLootVehicle - Object at %1", position _object];  //Loot vehicle created

//Wait until the heli reaches the drop waypoint
While {true} do {
	sleep 0.1;
	if (currentWaypoint _grp >= 2) exitWith {};  //Completed Drop Waypoint
};


//  Now on to the fun stuff:
	//diag_log format ["<FuMS> DropLootVehicle - Object at %1, Detach Up Next", position _object];  // Loot Vehicle about to drop
	detach _object;  // LEROOOOOOOOOOOOY JENKIIIIIIIIIIINS!!!!!!!
	_objectPosDrop = position _object;
	_heli fire "CMFlareLauncher";
	_heli fire "CMFlareLauncher";

//Delete heli once it has proceeded to end point
	[_heli,_grp,_flySpot,_dropSpot,_heliDistance] spawn {
		private ["_heli","_grp","_flySpot","_dropSpot","_heliDistance"];
		_heli = _this select 0;
		_grp = _this select 1;
		_flySpot = _this select 2;
		_dropSpot = _this select 3;
		_heliDistance = _this select 4;
		while{([_heli, _flySpot] call BIS_fnc_distance2D)>200}do{
			if(!alive _heli || !canMove _heli)exitWith{};
			sleep 5;
		};
		waitUntil{([_heli, _dropSpot] call BIS_fnc_distance2D)>(_heliDistance * .5)};
		{ deleteVehicle _x; } forEach units _grp;
		deleteVehicle _heli;
	};

//Time based deletion of the heli, in case it gets distracted
	[_heli,_grp] spawn {
		private ["_heli","_grp"];
		_heli = _this select 0;
		_grp = _this select 1;
		sleep 30;
		if (alive _heli) then
		{
			{ deleteVehicle _x; } forEach units _grp;
			deleteVehicle _heli;
			//diag_log "<FuMS> DropLootVehicle - Deleted Heli after Drop";
		};
	};

//Attach Parachute / Flares / Smokes
WaitUntil {(((position _object) select 2) < (_flyHeight-50))};

_heli fire "CMFlareLauncher";
_objectPosDrop = position _object;
_para = createVehicle ["B_Parachute_02_F", _objectPosDrop, [], 0, ""];
_object attachTo [_para,[0,0,-1.5]];

_smoke1= "SmokeShellGreen" createVehicle getPos _object;
_smoke1 attachto [_object,[0,0,-0.5]];
_flare1= "F_40mm_Green" createVehicle getPos _object;
_flare1 attachto [_object,[0,0,-0.5]];

if (_allowDamageDuringFall) then {
	if (_DropType == "vehicle") then {_object allowDamage true;}; //Turn on damage for vehicles while they're falling
};

sleep 20;
_smoke3= "SmokeShellGreen" createVehicle getPos _object;
_smoke3 attachto [_object,[0,0,-0.5]];
_flare3= "F_40mm_Green" createVehicle getPos _object;
_flare3 attachto [_object,[0,0,-0.5]];

//Drop some flares and smokes on the ground when the object lands
WaitUntil {((((position _object) select 2) < 1) || (isNil "_para"))};

detach _object;
_smoke2= "SmokeShellGreen" createVehicle getPos _object;
//_smoke2 attachto [_object,[0,0,-0.5]]; ////Enable this line if you want the smoke attached to the object.
_flare2= "F_40mm_Green" createVehicle getPos _object;
//_flare2 attachto [_object,[0,0,-0.5]]; //Enable this line if you want the flare attached to the object.  Pretty fun at night to watch it drive away lit up
sleep 5;	//Give it a few seconds to get all landed and such.
if (_DropType == "vehicle") then {_object allowDamage true;}; //Turn on damage for vehicles once they're on the ground.