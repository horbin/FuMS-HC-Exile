//SupportScript.sqf
// Horbin
// 6/19/2015
// This is an example Custom support script than can be executed by a mission Start or Mission end script.

private ["_vehicles"];
_vehicles = _this select 0;

	diag_log format ["<FuMS> SupportScript _vehicles %1",_vehicles];
{
	diag_log format ["<FuMS> SupportScript test example for vehicle %1",_x];
}foreach _vehicles;