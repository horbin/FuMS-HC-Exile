// SpawnMinefield.sqf
// TheOneWhoKnocks
// 5/1/19
// Based on DMS_fnc_SpawnMinefield Created by eraser1 for DMS
// This script will spawn when a "mine" (cosmetic since it's a building) is detected.
// It spawns 5 mines in a defined radius around the seed mine as well as a sign warning players
//
// This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

private ["_mines","_seedMine","_seedPos","_seedType","_spawnRadius","_spawnNumber","_minesCanBeShot","_mineSide"];
_mines = [];
_seedMine = _this select 0;
diag_log format ["<FuMS> SpawnMinefield: _seedMine:%1 | _pos:%2 | _type:%3",_seedMine, (getPos _seedMine), (typeOf _seedMine) ];
_seedPos = getPosATL _seedMine;
_seedType = typeOf _seedMine;


// You can adjust damagability, spread and number of mines here 
_minesCanBeShot = true;
_spawnRadius = 10;
_spawnNumber = 5;
//_mineSide = EAST;

// spread out directional mines to make it real fun
if ((_seedType == "APERSTripMine") or (_seedType == "SLAMDirectionalMine")) then
{
	_spawnRadius = _spawnRadius * 3;
};

for "_i" from 1 to _spawnNumber do
	{
		private _minePos = _seedPos getPos [random _spawnRadius,random 360];
		private _mine = createMine [_seedType, _minePos, [], 0];
		//private _marker = "Sign_Arrow_F" createVehicle _minePos;
		_mine allowDamage _minesCanBeShot;
		//In case you're using directional mines such as tripwires/SLAMs
		_mine setDir (random 360);
		_mine setPosATL _minePos;
		diag_log format ["<FuMS> SpawnMinefield Mine data: %1",_mine];
		//diag_log format ["<FuMS> SpawnMinefield Mine Type: %1 | Position:%2 | Position (ATL):%3",_seedType,(getPos _mine),(getPosATL _mine) ];
		EAST revealMine _mine;
		_mines pushBack _mine;
		

		
	};

private _randDirOffset = random 45;
	for "_i" from 0 to 359 step 90 do
	{
		private _sign = createVehicle ["Land_Sign_Mines_F", [0,0,0], [], 0, "CAN_COLLIDE"];
		_sign setDir (180+_i);
		_sign setPosATL (_seedPos getPos [_spawnRadius+2, _randDirOffset+_i]);
		_sign setVectorUp [0,0,1];

		// _mines array is for only cleanup atm, so just add them to the list
		_mines pushBack _sign;
	};

// sends back list of mines and signs spawned
_mines
