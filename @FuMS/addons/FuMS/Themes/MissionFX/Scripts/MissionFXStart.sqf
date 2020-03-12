// MissionFXStart.sqf
// TheOneWhoKnocks
// 5/1/19
// This is a custom script than can be executed by any FuMS mission.
// This executes custom mission FX 
// These effects includes:
//
// SpawnMinefield	-	Scans the buildings spawned in the mission and if mines are included, spawns a small minefield of simliar mines and set of signs
// SpawnFlamer 		- 	Scans the buildings spawned in the mission and if "FirePlace_burning_F" is found, it spawns a Flamer from it
// SpawnFarty 		- 	Scans the buildings spawned in the mission and if "Land_GarbageBarrel_01_F" is found, it spawns a Farty anomoly and Farty field from it
// SpawnFarty (alt)	- 	Scans the buildings spawned in the mission and if "Land_GarbageBarrel_01_english_F" is found, it spawns a Farty field (NO ANOMOLY) from it
// SpawnFartyPools	- 	Scans the buildings spawned in the mission and if "Skeet_Clay_F" is found, it replaces it with a Farty pool
// SpawnScreamer	- 	Scans the buildings spawned in the mission and if "Land_AncientStatue_01_F" is found, it spawns a Screamer from it
// SpawnStrigoi		- 	Scans the buildings spawned in the mission and if "Land_Grave_rocks_f" is found, it spawns a Strigoi from it
// SpawnSparky		- 	Scans the buildings spawned in the mission and if "Land_RoadCrack_01_4x4_F" is found, it spawns a Sparky from it


// ********************************
// ********************************
// ********************************
// ********************************
// *** REMEMBER: This script will suspend normal mission execution while it runs
// *** If you need long control loops, ensure you 'spawn' those processes from this script.
// *** do not code in control loops in this script or the Mission may exhibit undesired behavior.
// ********************************
// ********************************
// ********************************
// ********************************
// ********************************
private ["_anomolies","_markers","_mines","_encounterCenter","_missionOffset","_buildings","_groups","_vehicles","_lootBoxes","_yourCustomVariables"];


_encounterCenter = _this select 0;
_missionOffset = _this select 1;
_buildings = _this select 2;
_groups = _this select 3;
_vehicles = _this select 4;
_lootBoxes = _this select 5;
_yourCustomVariables = []; // store information you want passed to your custom 'mission end' script in this array!

_mines = [];
_markers = [];
_anomolies = [];

_debug = false;

diag_log format ["<FuMS> Custom Script: MissionFXStart executed."];

// To call any other custom script you have designed AND defined in the \FuMS\Theme\<your theme>\Scripts folder
// simply call it by name.
if (_debug) then
{
	diag_log format ["<FuMS> MissionFXStart Script _vehicles %1 | _buildings %2",_vehicles,_buildings];
};

////////////////// Spawn Minefields
{
	if (_debug) then
	{
		diag_log format ["<FuMS> MissionFXStart mine check %1",_x];
	};
	if (_x isKindof "MineGeneric") then
	{
		private _spawnedMines = [_x] call SpawnMinefield;
		_mines append _spawnedMines;
	};
}foreach _buildings;
if (_debug) then
{
	diag_log format ["<FuMS> MissionFXStart mines created %1",_spawnedMines];
};

///////////////// Alias Flamer

{
	if (_debug) then
	{
		diag_log format ["<FuMS> MissionFXStart Flamer check %1",_x];
	};

	if (typeOf _x == "FirePlace_burning_F") then
	{
		private _flamerCenter = getPos _x;
		
		_randomID = floor random 10000;
		_markerName = format ["flamer_%1",_randomID];
		_flamerMarker = createMarker [_markerName, _flamerCenter];
		//_flamerMarker setMarkerType "hd_dot";
		//_marker = "Sign_Arrow_F" createVehicle _flamerCenter;
		
		_markers pushback _flamerMarker;
		
		diag_log format ["<FuMS> MissionFXStart Flamer trigger found, starting script: Marker :%1",_flamerMarker];

		[_flamerMarker] spawn SpawnFlamer;
	};
}foreach _buildings;

///////////////// Alias Farty

{
	if (_debug) then
	{
		diag_log format ["<FuMS> MissionFXStart Farty check %1",_x];
	};

	if ((typeOf _x == "Land_GarbageBarrel_01_F") or (typeOf _x == "Land_GarbageBarrel_01_english_F")) then
	{
		private _fartyCenter = getPos _x;
		private _anomolyPresent = true;
		
		_randomID = floor random 10000;
		_markerName = format ["farty_%1",_randomID];

		_fartyMarker = createMarker [_markerName, _encounterCenter];
		//_fartyMarker setMarkerType "hd_dot";
		//_marker = "Sign_Arrow_F" createVehicle _encounterCenter;
		
		_markers pushback _fartyMarker;
		
		if (typeOf _x == "Land_GarbageBarrel_01_english_F") then
		{
			_anomolyPresent = false;
		};
		
		[_fartyMarker, _anomolyPresent] spawn SpawnFarty;
		diag_log format ["<FuMS> MissionFXStart Farty trigger found, starting script: Marker :%1",_fartyMarker];

	};
}foreach _buildings;

///////////////// Alias Farty Pool

{
	if (_debug) then
	{
		diag_log format ["<FuMS> MissionFXStart Farty Pool check %1",_x];
	};
	//	if ((typeOf _x == "ATMine") or (typeOf _x == "APERSMine")) then

	if (typeOf _x == "Skeet_Clay_F") then
	{
		//_buildings = _buildings - _x;
		[_x] spawn SpawnFartyPools;
		diag_log format ["<FuMS> MissionFXStart Farty Pool trigger found, starting script: _poolName:%1",_x];

	};
}foreach _buildings;

///////////////// Alias Screamer

{
	if (_debug) then
	{
		diag_log format ["<FuMS> MissionFXStart Screamer check %1",_x];
	};

	if (typeOf _x == "Land_AncientStatue_01_F") then
	{
		private _screamerCenter = getPos _x;
				
		_randomID = floor random 10000;
		_markerName = format ["screamer_%1",_randomID];

		_screamerMarker = createMarker [_markerName, _screamerCenter];
		//_screamerMarker setMarkerType "hd_dot";
		//_marker = "Sign_Arrow_F" createVehicle _screamerCenter;
		
		_markers pushback _screamerMarker;
		
		[_markerName] spawn SpawnScreamer;

		//_buildings = _buildings - _x;
		diag_log format ["<FuMS> MissionFXStart Screamer trigger found, starting script: Screamer Marker:%1",_markerName];

	};
}foreach _buildings;

///////////////// Alias Strigoi

{
	if (_debug) then
	{
		diag_log format ["<FuMS> MissionFXStart Strigoi check %1",_x];
	};

	if (typeOf _x == "Land_Grave_rocks_f") then
	{
		private _strigoiCenter = getPos _x;
		
		_randomID = floor random 10000;
		_markerName = format ["strigoi_%1",_randomID];
		_strigoiMarker = createMarker [_markerName, _strigoiCenter];
		//_strigoiMarker setMarkerType "hd_dot";
		//_marker = "Sign_Arrow_F" createVehicle _strigoiCenter;
		
		_markers pushback _strigoiMarker;
		
		diag_log format ["<FuMS> MissionFXStart Strigoi trigger found, starting script: Marker :%1",_strigoiMarker];

		[_strigoiMarker] spawn SpawnStrigoi;
	};
}foreach _buildings;

///////////////// Alias Sparky

{
	if (_debug) then
	{
		diag_log format ["<FuMS> MissionFXStart Sparky check %1",_x];
	};

	if (typeOf _x == "Land_RoadCrack_01_4x4_F") then
	{
		private _sparkyCenter = getPos _x;
		
		_randomID = floor random 10000;
		_markerName = format ["sparky_%1",_randomID];
		_sparkyMarker = createMarker [_markerName, _sparkyCenter];
		//_sparkyMarker setMarkerType "hd_dot";
		//_marker = "Sign_Arrow_F" createVehicle _sparkyCenter;
		
		_markers pushback _sparkyMarker;
		
		diag_log format ["<FuMS> MissionFXStart Sparky trigger found, starting script: Marker :%1",_sparkyMarker];

		[_sparkyMarker] spawn SpawnSparky;
	};
}foreach _buildings;


///////////////// Alias Kamikaze

{
	if (_debug) then
	{
		diag_log format ["<FuMS> MissionFXStart Crazy check %1",_x];
	};

	if (typeOf _x == "Land_Sign_WarningUnexplodedAmmo_F") then
	{
		private _crazyCenter = getPos _x;
		
		_randomID = floor random 10000;
		_markerName = format ["crazy_%1",_randomID];
		_crazyMarker = createMarker [_markerName, _crazyCenter];
		//_crazyMarker setMarkerType "hd_dot";
		//_marker = "Sign_Arrow_F" createVehicle _crazyCenter;
		
		_markers pushback _crazyMarker;
		
		diag_log format ["<FuMS> MissionFXStart Crazy trigger found, starting script: Marker :%1",_crazyMarker];

		[_crazyMarker] spawn SpawnCrazy;
	};
}foreach _buildings;

// could also spawn it...
//[_vehicles] spawn supportscript;

//You may also call any scripts located in your main MPmission.pbo via normal path definitions.
// []execVM Scripts\my_other_custom_scripts

// Data you may need in your Custom End Script, assign to _yourCustomVariable as part of an array.
// the below variable will be passed into the End Script.

_yourCustomVariable = [_mines,_markers];
diag_log format ["<FuMS> MissionFXStart Mines :%1 | Markers:%2",_mines,_markers];

// Start scripts MUST return the below information or FuMS may crash!
[_buildings, _groups, _vehicles, _lootboxes, _yourCustomVariables]