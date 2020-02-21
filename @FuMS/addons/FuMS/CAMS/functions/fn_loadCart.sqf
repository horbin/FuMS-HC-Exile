scriptName "fn_loadCart";

/*
	Code written by TheOneWhoKnocks
	Loads the CART files and updates global asset variables.
*/

#define __FILENAME "fn_loadCart.sqf"

//if (isDedicated || !hasInterface) exitWith {};

//#include "..\macros.hpp"

disableSerialization;

params ["_cartName","_cartData","_debugCart"];
private ["_startTime","_endTime"];
diag_log format ["[CAMS] loadCart.sqf cartname : %1 | cartdata: %2",_cartName,_cartData];

_startTime = time;
{
	private ["_globalVariableName","_group","_replaceContent","_newContent"];

	_globalVariableName = _x select 0;
	_group = _x select 1;
	_replaceContent = _x select 2;
	_newContent = _x select 3;

	if (_debugCart) then
	{
		diag_log format ["[CAMS] loadCart.sqf (internal) GVname : %1 | _group: %2 | _replaceContent: %3 | _newContent :%4",_globalVariableName,_group,_replaceContent,_newContent];
	};


	if (_replaceContent) then
	{
		private _newData = [];
		// Parse arrays if found
		//diag_log format ["LoadCart: main:%1",_x];
		{
			if (_group == 0) then
			{
				{
					_oldData = missionNamespace getVariable [_x,[]];
					_newData append _oldData;
				} forEach _newContent;		
			}else
			{
				_newData pushBack _x;
			};
		} forEach _newContent;
		
		missionNamespace setVariable [_globalVariableName, _newData];
		publicVariable _globalVariableName;
		
		if (_debugCart) then
		{
			diag_log format ["[CAMS] Cart(%1) - Replace: %2 | data: %3",_cartName,_globalVariableName,_newData]

		};
	} else
	{
		private _newData = [];
		// Parse arrays if found
		{
			if (_group == 0) then
			{
				{
					_oldData = missionNamespace getVariable [_x,[]];
					_newData append _oldData;
				} forEach _newContent;		
			}else
			{
				_newData pushBack _x;
			};
		} forEach _newContent;
		
		
		private _oldData = missionNamespace getVariable [_globalVariableName,[]];
		private _update = _oldData + _newData;
		missionNamespace setVariable [_globalVariableName, _update];
		publicVariable _globalVariableName;
		
		if (_debugCart) then
		{
			diag_log format ["[CAMS] Cart(%1) - Update: %2 | old: %3 | new:%4 | update: %5",_cartName,_globalVariableName,_oldData,_newData,_update]
		};
	};
	
} forEach _cartData;

_endTime = time;
diag_log format ["[CAMS] FrSB_fn_loadCart.sqf cartname : %1 SUCCESS compiled in %2 seconds",_cartName,(_endTime - _startTime)];
