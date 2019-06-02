// by ALIAS
//fnc_overlay_toxic = { 0 cutRsc ["equipment_prot_toxic","PLAIN", 1, false];	sleep 0.1;};

// If you want the mask to be visible when you display the map un-comment line from bellow and comment/delete line above
fnc_overlay_toxic = { 0 cutRsc ["equipment_prot_toxic","PLAIN", 1, true];	sleep 0.1;};

if (!hasInterface) exitWith {};

sleep 3;

waitUntil {!isNil "obj_prot_toxic"};

[] spawn 
{
	while {!isNull player} do 
	{
		waitUntil {alive player};
		if ((headgear player == obj_prot_toxic)or(goggles player==obj_prot_toxic)or(uniform player==obj_prot_toxic)or(vest player==obj_prot_toxic)or(Backpack player==obj_prot_toxic)) then 
		{player setVariable ["protejat_tox",true,true]} else {player setVariable ["protejat_tox",false,true]};
		sleep 0.2;
	};
};

waitUntil {!isNil {player getVariable "protejat_tox"}};

while {!isNull player} do 
{
	waitUntil {alive player};
	while {!(player getVariable "protejat_tox")} do {sleep 0.1};
	
	playsound "echipare_toxic";	
	sleep 2.5;
	onEachFrame {overlayeffects_tox = 0 spawn fnc_overlay_toxic};
	sleep 0.1; 
	0 fadeSound (soundVolume/6);
	[] spawn 
		{
			while {player getVariable "protejat_tox"} do 
			{
			_int_b = linearConversion [0, 1,(getFatigue player), 8, 1.8, true];
			playsound "breath_toxic";
			sleep _int_b;
			};
		};
	while {player getVariable "protejat_tox"} do {sleep 0.1};
	onEachFrame {0 cutText ["","PLAIN"]};
	playsound "dezechipare_toxic";
	terminate overlayeffects_tox;
	0 fadeSound 1;
	sleep 0.1;
};