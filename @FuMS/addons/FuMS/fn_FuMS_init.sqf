// init.sqf
// Horbin
// 2/7/15
// mod 10/6/15
// Server side init for FuMS.pbo addon
diag_log format ["###Fulcrum Mission System Init.sqf executed."];
if (!isServer) exitWith {};
[] execVM "\FuMS\Functions\InitServer.sqf"; 

