//Detect.sqf
// Horbin
// 6/28/2015

// Detect will not just need to go through the list of groups and vehicles in the mission and
//  check if the 'FuMS_ISDETECTOR" is set, and if it is, then see if that unit 'sees' a player.

private ["_params","_msnTag","_groups","_vehicles","_isDetected","_units","_var"];

_params = _this select 0;
_msnTag = _params select 0;

// Get list of groups and vehicles
_groups = missionNameSpace getVariable ( format ["%1_Groups",_msnTag]);
_vehicles = missionNameSpace getVariable ( format ["%1_Vehicles",_msnTag]);

_isDetected = false;

{
	_units = units _x;
	{
		_var = _x GetVariable "FuMS_DETECTOR";
		if (!isNil "_var") then
		{
			if (_var) then
			{
				if (! isNull (_x findNearestEnemy _x)) exitWith
				{
					_isDetected = true;
				};
			};
		};
	}foreach _units;
	if (_isDetected) exitWith {};
}foreach _groups;
if (!_isDetected) then
{
	// Vehicles. Even if an AI originally not ON the detector should enter a vehicle that was, that unit's
	//   detection will count for the vehicle!
	{
		_var = _x GetVariable "FuMS_DETECTOR";
		if (!isNil "_var") then
			{
				if (_var) then
				{	
					_units = crew _x;
					{
						if (! isNull (_x findNearestEnemy _x)) exitWith
						{
							_isDetected = true;
						};	
					}foreach _units;
				};
			};
		if (_isDetected) exitWith {};
	}foreach _vehicles;
};
//diag_log format ["<FuMS Detected: #Groups:%1  #Vehicles:%2 status:%3",count _groups, count _vehicles, _isDetected];
_isDetected
