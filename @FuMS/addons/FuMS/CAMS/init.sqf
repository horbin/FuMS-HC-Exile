// CAMS Initialization

#include "CAMSConfig.sqf";

CAMS_isStable = false;
_camsVersion = missionNamespace getVariable "CAMS_Version";

/////////////////////////////////////////
// System Config ////////////////////////
/////////////////////////////////////////

_loadVanilla = missionNamespace getVariable "CAMS_useVanilla";// Load the vanilla content? 
_loadExile = missionNamespace getVariable "CAMS_useExile";
_cartsLoaded = missionNamespace getVariable "CAMS_cartList";

/*
["systemChatRequest", [format ["%1: %2",_titlePatrol,_messagePatrol]]] call ExileServer_system_network_send_broadcast;

		["toastRequest", ["InfoTitleAndText", [_titlePatrol, format ["A %1 patrol aircraft has been spotted",_chosenTargetName]]]] call ExileServer_system_network_send_broadcast;

*/


//////////////////////////////////////////
// Initialize system /////////////////////
//////////////////////////////////////////
diag_log format ["[CAMS:%1] init.sqf: Launching...",_camsVersion];

_hold = [] execVM "FuMS\CAMS\InitGlobalVars.sqf";
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] init.sqf: ERROR in InitGlobalVars.sqf",_camsVersion];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};

_hold = [] execVM "FuMS\CAMS\InitImFXVars.sqf";
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] init.sqf: ERROR in InitFXVars.sqf",_camsVersion];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};

if (_loadVanilla) then
{
	_hold = [] execVM "FuMS\CAMS\carts\vanilla\assets.sqf";
	if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] init.sqf: ERROR in assets.sqf",_camsVersion];CAMS_isStable=false;};
	waitUntil { ScriptDone _hold};
	diag_log "[CAMS] System | Vanilla assets loaded";
	//["systemChatRequest", ["[CAMS] System | Vanilla assets loaded"]] call ExileServer_system_network_send_broadcast;
	//["[CAMS] System","Vanilla assets loaded"] spawn Haz_fnc_createNotification;
	
	_hold = [] execVM "FuMS\CAMS\carts\vanilla\ImmersionFX.sqf";
	if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] init.sqf: ERROR in cart ImmersionFX.sqf : %2",_camsVersion,_x];CAMS_isStable=false;};
	waitUntil { ScriptDone _hold};
	diag_log "[CAMS] System | Vanilla ImmersionFX loaded";
	//["systemChatRequest", ["[CAMS] System | Vanilla ImmersionFX loaded"]] call ExileServer_system_network_send_broadcast;
	//["[CAMS] System","Cart:Vanilla ImmersionFX loaded"] spawn Haz_fnc_createNotification;
};

if (_loadExile) then
{
	_hold = [] execVM "FuMS\CAMS\carts\Exile\assets.sqf";
	if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] init.sqf: ERROR in assets.sqf",_camsVersion];CAMS_isStable=false;};
	waitUntil { ScriptDone _hold};
	diag_log "[CAMS] System | Exile assets loaded";
	//["systemChatRequest", ["[CAMS] System | Exile assets loaded"]] call ExileServer_system_network_send_broadcast;
	//["[CAMS] System","Exile assets loaded"] spawn Haz_fnc_createNotification;
	
	_hold = [] execVM "FuMS\CAMS\carts\Exile\ImmersionFX.sqf";
	if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] init.sqf: ERROR in cart ImmersionFX.sqf : %2",_camsVersion,_x];CAMS_isStable=false;};
	waitUntil { ScriptDone _hold};
	diag_log "[CAMS] System | Exile ImmersionFX loaded";
	//["systemChatRequest", ["[CAMS] System | Exile ImmersionFX loaded"]] call ExileServer_system_network_send_broadcast;
	//["[CAMS] System","Cart:Exile ImmersionFX loaded"] spawn Haz_fnc_createNotification;
};



//process carts
{
	_hold = [] execVM format ["FuMS\CAMS\carts\%1\assets.sqf",_x];
	if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] init.sqf: ERROR in cart assets.sqf : %2",_camsVersion,_x];CAMS_isStable=false;};
	waitUntil { ScriptDone _hold};
	diag_log format ["[CAMS] Cart:%1 assets loaded",_x];
	//["systemChatRequest", [format ["Cart:%1 assets loaded",_x]]] call ExileServer_system_network_send_broadcast;
	//["CAMS System",format ["Cart:%1 assets loaded",_x]] spawn Haz_fnc_createNotification;

} forEach _cartsLoaded;

//carts completed

// immersion FX
{
	_hold = [] execVM format ["FuMS\CAMS\carts\%1\ImmersionFX.sqf",_x];
	if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] init.sqf: ERROR in cart assets.sqf : %2",_camsVersion,_x];CAMS_isStable=false;};
	waitUntil { ScriptDone _hold};
	diag_log format ["[CAMS] Cart:%1 immersionFX loaded",_x];
	//["systemChatRequest", [format ["Cart:%1 immersionFX loaded",_x]]] call ExileServer_system_network_send_broadcast;
	//["CAMS System",format ["Cart:%1 immersionFX loaded",_x]] spawn Haz_fnc_createNotification;

} forEach _cartsLoaded;

// Complete ImmersionFX

CAMS_isStable = true;
publicVariable "CAMS_isStable";


diag_log format ["[CAMS] CAMS_isStable:%1",CAMS_isStable];

/*
sleep 20;

_messageTypes = ["side","hint","popUp","tiles","type","type2","dynamic","info","sitrep","system"];

hint "Starting message test";

{
	[format ["%1",_x],format ["Testing %1",_x],format ["This is a test of the %1 system",_x],["WEST"]] spawn FrSB_fnc_announce;
	sleep 10;
} forEach _messageTypes;
*/