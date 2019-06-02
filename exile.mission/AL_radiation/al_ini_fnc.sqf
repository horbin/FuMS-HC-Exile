fnc_overlay = { 0 cutRsc ["equipment_prot","PLAIN", 1, false];	sleep 0.1;};

// If you want the mask to be visible when you display the map un-comment line from bellow and comment/delete line above
//fnc_overlay = { 0 cutRsc ["equipment_prot","PLAIN", 1, true];	sleep 0.1;};

if (!hasInterface) exitWith {};

waitUntil {!isNil "obj_prot_rad"};

[] spawn 
{
	while {!isNull player} do 
	{
		waitUntil {alive player};
		if ((headgear player == obj_prot_rad)or(goggles player==obj_prot_rad)or(uniform player==obj_prot_rad)or(vest player==obj_prot_rad)or(Backpack player==obj_prot_rad)) then 
		{player setVariable ["protejat_rad",true,true]} else {player setVariable ["protejat_rad",false,true]};
		sleep 0.2;
	};
};

sleep 1;

while {!isNull player} do 
{
	waitUntil {alive player};
	_player_check_prot = player getVariable "protejat_rad";
	while {!_player_check_prot} do {_player_check_prot = player getVariable "protejat_rad";sleep 0.1};
	
	playsound "echipare";	
	sleep 2.5;
	onEachFrame {overlayeffects = 0 spawn fnc_overlay};
	sleep 0.1; 
	0 fadeSound (soundVolume/6);
	[] spawn 
		{
			_player_check_prot = player getVariable "protejat_rad";
			while {_player_check_prot} do 
			{
			_player_check_prot = player getVariable "protejat_rad";
			_int_b = linearConversion [0, 1,(getFatigue player), 8, 1.8, true];
			playsound "breath";
			sleep _int_b;
			};
		};
	while {_player_check_prot} do {_player_check_prot = player getVariable "protejat_rad";sleep 0.1};
	onEachFrame {0 cutText ["","PLAIN"]};
	playsound "dezechipare";
	terminate overlayeffects;
	0 fadeSound 1;
	sleep 0.1;
};