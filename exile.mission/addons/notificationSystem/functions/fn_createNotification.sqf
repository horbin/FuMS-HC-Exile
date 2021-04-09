scriptName "fn_createNotification";

/*
	Code written by Haz
*/

#define __FILENAME "fn_createNotification.sqf"

if (isDedicated || !hasInterface) exitWith {};

#include "..\macros.hpp"

disableSerialization;

params
[
	["_notificationTitle", localize "STR_notification_title_example"],
	["_notificationMessage", localize "STR_notification_message_example"],
	["_titleTextColour", TITLE_TEXT_COLOUR],
	["_titleBgColour", TITLE_BG_COLOUR call BIS_fnc_colorConfigToRGBA]
];

_display = uiNamespace getVariable ["disp_notifications", findDisplay 46];

expanded = false;

if (EXPAND_SHRINK_TOGGLE isEqualTo 1) then
{
	expandKeyEH = (findDisplay 46) displayAddEventHandler ["KeyDown",
	{
		_toggleKey = if (isText EXPAND_SHRINK_KEY) then {actionKeys (getText EXPAND_SHRINK_KEY) select 0} else {getNumber EXPAND_SHRINK_KEY};
		if (param [1] isEqualTo _toggleKey) then
		{
			_display = uiNamespace getVariable "disp_notifications";
			_posX = if (SCREEN_POS isEqualTo "LEFT") then {0.0125 * safezoneW + safezoneX} else {0.5625 * safezoneW + safezoneX};
			_posW = if (SCREEN_POS isEqualTo "LEFT") then {0.2125 * safezoneW} else {0.425 * safezoneW};
			if (!expanded) then {expanded = true;} else {expanded = false;};
			if (!expanded) then
			{
				_posX = if (SCREEN_POS isEqualTo "LEFT") then {0.0125 * safezoneW + safezoneX} else {0.775 * safezoneW + safezoneX};
				_posW = if (SCREEN_POS isEqualTo "LEFT") then {0.425 * safezoneW} else {0.2125 * safezoneW};
			};
			{
				if (ctrlCommitted _x) then
				{
					_position = ctrlPosition _x;
					_position set [0, _posX];
					_position set [2, _posW];
					_x ctrlSetPosition _position;
					_x ctrlCommit 0.4;
				};
			} forEach (allControls _display);
			true
		};
	}];
};

if (isNil "notificationsIndex") then {notificationsIndex = 0;};
if (isNil "notificationsHiddenIndex") then {notificationsHiddenIndex = 0;};

_myIndex = notificationsIndex;
notificationsIndex = notificationsIndex + 1;

_numNotifications = if (MAX_SHOWN_NOTIFICATIONS > 4) then {3} else {MAX_SHOWN_NOTIFICATIONS};

if (SHOW_QUEUE_COUNT isEqualTo 1) then
{
	(_display displayCtrl 10) ctrlSetText format [localize "STR_notification_queueCount", if (notificationsIndex > MAX_SHOWN_NOTIFICATIONS) then {(notificationsIndex - MAX_SHOWN_NOTIFICATIONS)} else {0}];
};

waitUntil {_myIndex - notificationsHiddenIndex < _numNotifications};

_position = _myIndex % _numNotifications;

_safeZoneX = if (SCREEN_POS isEqualTo "LEFT") then {(-1 * safezoneW + safezoneX)} else {(2 * safezoneW + safezoneX)};

_title = _display ctrlCreate ["RscStructuredText", 10];
_title ctrlSetPosition
[
	_safeZoneX,
	(0.209 + (_position * 0.16)) * safezoneH + safezoneY,
	0.2125 * safezoneW,
	0.0255 * safezoneH
];
_title ctrlSetStructuredText parseText _notificationTitle;
_title ctrlSetTextColor _titleTextColour;
_title ctrlSetBackgroundColor _titleBgColour;
_title ctrlCommit 0;

_background = _display ctrlCreate ["RscPicture", 20];
_background ctrlSetPosition
[
	_safeZoneX,
	(0.24 + (_position * 0.16)) * safezoneH + safezoneY,
	0.2125 * safezoneW,
	0.12 * safezoneH
];
_background ctrlSetText "#(argb,8,8,3)color(0,0,0,0.75)";
_background ctrlCommit 0;

_notification = _display ctrlCreate ["RscStructuredText", 30];
_notification ctrlSetPosition
[
	_safeZoneX,
	(0.24 + (_position * 0.16)) * safezoneH + safezoneY,
	0.2125 * safezoneW,
	0.12 * safezoneH
];
_notification ctrlSetStructuredText parseText _notificationMessage;
_notification ctrlCommit 0;

_controls = [_title, _background, _notification];

{
	_position = ctrlPosition _x;
	_posX = if (SCREEN_POS isEqualTo "LEFT") then {0.0125 * safezoneW + safezoneX} else {0.775 * safezoneW + safezoneX};
	_position set [0, _posX];
	_x ctrlSetPosition _position;
	_x ctrlCommit 1;
} forEach _controls;

sleep 7;

waitUntil {_myIndex - notificationsHiddenIndex == 0};

_sleep = if (expanded) then {5} else {1};

sleep EXPAND_DISPLAY_TIME;

{
	_position = ctrlPosition _x;
	_position set [0, (_safeZoneX)];
	_x ctrlSetPosition _position;
	_x ctrlCommit 1;
} forEach _controls;

sleep 1;

{
	ctrlDelete _x;
} forEach _controls;

notificationsHiddenIndex = notificationsHiddenIndex + 1;

if (SHOW_QUEUE_COUNT isEqualTo 1) then
{
	(_display displayCtrl 10) ctrlSetText format [localize "STR_notification_queueCount", if (notificationsIndex > MAX_SHOWN_NOTIFICATIONS) then {(notificationsIndex - MAX_SHOWN_NOTIFICATIONS) - 1} else {0}];
};