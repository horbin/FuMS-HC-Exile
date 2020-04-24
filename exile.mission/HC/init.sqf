//init.sqf
// Horbin
// 12/31/14
// run this script from the server's mpmissions init.sqf
// This script will conduct proper initialization all necessary HC data
/*
if (isServer) then
{

//print music files to the rpt
//_cfg = configFile >> "cfgSounds";

//for "_i" from 0 to (count _cfg) - 1 do {
//    _music = getArray (configfile >> "CfgSounds" >> configName (_cfg select _i) >> "sound");
//    diag_log format ["%1", _music select 0];
//};  

	private ["_path"];
	_path = "\FuMS\init.sqf";
	diag_log format ["Starting FuMS via %1",_path];
	[] ExecVM _path;
};
*/

if (!isServer) then{waitUntil {!isNull player};waitUntil {player == player};};
if !(hasInterface or isServer) then{[] execVM "HC\HC_Init.sqf";};
if (hasInterface) then{[] execVM "HC\Player_Init.sqf";};