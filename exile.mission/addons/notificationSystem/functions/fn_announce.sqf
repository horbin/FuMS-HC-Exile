//scriptName "fn_announce";

/*
	Code written by TheOneWhoKnocks
	Sends announcements via several methods
	
	[_messageType,_messageTitle,_messageBody,[_image,_barColor,_titleColor,_bodyColor]] call FuMS_NS_fnc_announce;
		
	_messageType = Type of message to send ()
	CURRENTLY SUPPORTED MESSAGE TYPES:
		- system 	- Shows up on HUD near where chat shows up.  This is a dark grey and fades after 
		- hint 		- Shows on upper right side just under the status window. White on a black background and fades after a long time
		- popUp		- Creates a pop-up window on the right side with a green window
		- tiles		- Tiled text appears in lower right corner
		- type		- Typed out text in center of screen 1/3 from top with sound
		- type2		- Typed out text in right center of screen 1/3 from top with sound
		- dynamic	- Fades in (then out) big white text in middle of screen
		- toast		- Exile toast
		- info		- 
		- sitrep	- Fades in text in lower right corner
	
	side - In Development
	
	_messageTitle = Title of notification 
	_messageBody = Body of notification
	
	OPTIONS:
	TO BE WRITTEN
	
*/

//#define __FILENAME "announce.sqf"

RGBA_WHITE = [1,1,1,1];
RGBA_RED = [1,0,0,1];
RGBA_GREEN = [0,1,0,1];
RGBA_BLUE = [0,0,1,1];
RGBA_LIGHTPINK = [1,0.71,0.76,1]; 
RGBA_PURPLE = [0.5,0,0.5,1]; 
RGBA_ODGREEN = [0.42,0.56,0.14,1]; 
RGBA_ORANGE = [1,0.65,0,1]; 

HEX_WHITE = "#FFFFFF";
HEX_RED = "#FF0000";
HEX_GREEN = "#00FF00";
HEX_BLUE = "#0000FF";
HEX_LIGHTPINK = "#FFB6C1";
HEX_PURPLE = "#800080";
HEX_ODGREEN = "#6B8E23";
HEX_ORANGE = "#FFA500";




if (isDedicated || !hasInterface) exitWith {};


disableSerialization;

params ["_messageType","_messageTitle","_messageBody",["_msgParams",[]]];


//diag_log format ["[FrSB] fn_announce type:%3 : Title: %1 | Message: %2 | Params:%4",_messageTitle,_messageBody,_messageType,_msgParams];


switch (_messageType) do {
	/*
    case "side": 
				{ 
					if !(count _params == 0) then 
					{
						private _side = _params select 0;
						private _text = toUpper _messageTitle + ": " + _messageBody;
						[format ["%1",_side], "HQ"] sideChat _text;
					};
				};
	*/
    case "hint":	
				{ 
					private _text = toUpper _messageTitle + ": " + _messageBody;
					hint _text; 
				// ["msg"] call ExileClient_gui_network_standardHintRequest.sqf
				// ["msg"] call ExileClient_gui_network_advancedHintRequest.sqf  ????
					
				};
	
    case "toast":	
				{ 
					["ErrorTitleAndText", [_messageTitle,_messageBody]] call ExileClient_gui_network_toastRequest;		

					/*
					ErrorEmpty
					ErrorTitleAndText
					ErrorTitleOnly
					InfoEmpty
					InfoTitleAndText
					InfoTitleOnly
					SuccessEmpty
					SuccessTitleAndText
					SuccessTitleOnly
					WarningEmpty
					WarningTitleAndText
					WarningTitleOnly
					*/
				};

	
    case "popUp": 
				{ 
					_msgTxtColor = RGBA_WHITE;
					_msgBgColor = RGBA_ODGREEN;
					
					if !(_msgParams isEqualTo [])then
					{
						_msgTxtColor = _msgParams select 0;
						_msgBgColor = _msgParams select 1;
					};
					
					[_messageTitle,_messageBody,_msgTxtColor,_msgBgColor] spawn FuMS_NS_fnc_createNotification;
				};
    case "tiles":	// https://community.bistudio.com/wiki/BIS_fnc_textTiles
 
				{
					_text = parseText format ["<t font='PuristaBold' size='1.6'>%1</t>",_messageTitle];
					[_text, true, [10,10], 5, 1, 0.3] spawn BIS_fnc_textTiles; 
					sleep 6;

					_text = parseText format ["<t font='PuristaBold' size='1.0'>%1</t>",_messageBody];

					[_text, true, [7,7], 5, 1, 0.3] spawn BIS_fnc_textTiles;
					sleep 6;
				};
    case "type": 	// https://community.bistudio.com/wiki/BIS_fnc_typeText
				{
					[
						[
							[_messageTitle, "<t align = 'center' shadow = '1' size = '1.0' font='PuristaBold'>%1</t><br/>"],
							[_messageBody, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>", 15]
						]
					] spawn BIS_fnc_typeText;
				};
    case "type2": 	// https://community.bistudio.com/wiki/BIS_fnc_typeText2
				{ 
					[
						[
							[_messageTitle, "align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
							//["RESUPPLY POINT", "align = 'center' shadow = '1' size = '0.7'", "#aaaaaa"],
							["","<br/>"], // line break
							[_messageBody,"align = 'center' shadow = '1' size = '1.0'"]
						]
					] spawn BIS_fnc_typeText2;
				};
	case "dynamic":	// https://community.bistudio.com/wiki/BIS_fnc_dynamicText

				{
					_text = toUpper _messageTitle + ": " + _messageBody;
					[_text, -1,-1,4,1,0,789] spawn BIS_fnc_dynamicText;
				};
				
				// ["_txt", "_pos", "_size", "_color"] call ExileClient_gui_network_dynamicTextRequest.sqf
				
	case "baguette":	// WTF is this?

				{							
					// [msg] spawn ExileClient_gui_baguette_show;				
				};




	case "info":	// https://community.bistudio.com/wiki/BIS_fnc_infoText

				{							
					[_messageTitle, _messageBody] spawn BIS_fnc_infoText;
				};
	case "sitrep":	// https://community.bistudio.com/wiki/BIS_fnc_EXP_camp_SITREP

				{							
					[[_messageTitle,4,5],[_messageBody,3,5,8]] spawn BIS_fnc_EXP_camp_SITREP;
				};

	
    case "system";
    default { 
				_text = toUpper _messageTitle + ": " + _messageBody;
				systemChat _text;
				// ["msg"] call ExileClient_gui_network_systemChatRequest.sqf
				
			};
};








