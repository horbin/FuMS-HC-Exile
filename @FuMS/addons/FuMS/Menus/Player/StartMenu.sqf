//StartMenu.sqf
// Horbin
// 3/7/15
// FuMS_fnc_Menu_StartMenu will be nil if no menu options are authorized.
//diag_log format ["##StartMenu: Configured for %1",player];
//diag_log format ["<FuMS:%1> StartMenu: Initializing Zombie Sounds for %2",FuMS_Version,player];

//FuMS_INF_nextSound = compile FuMS_str_HC_Zombies_INF_fnc_nextSound;
//[] call FuMS_INF_nextSound;

if (!isNil "FuMS_fnc_Menu_AdminMenu") then
{
    FuMS_Anchor = "";
    FuMS_AnchorLoc = [];
    FuMS_MissionSet = ""; // mission to be created when 'spawn' is clicked.
    FuMS_MissionResource = 1; // server resource to use. default is 1(1st HC), set to 0 implies SERVER!
    FuMS_PlayerList = [];
    
    FuMS_anchorNameTxt = "N/A";
    FuMS_anchorLocTxt = "";
    FuMS_missionTxt = "None";
    FuMS_resourceTxt = "None";
    
    FuMS_AdminMenu = compile FuMS_fnc_Menu_AdminMenu; 
    
    waituntil {!isnull (finddisplay 46)};
    //waituntil {player == player};
    sleep 10;
    player addaction [("<t color=""#1376e5"">" + ("FuMS Admin") +"</t>"),FuMS_AdminMenu,"",5,false,true,"",""];    
    
    while {true} do 
    {
        waitUntil {!alive player};
        // uh oh...
        waitUntil {alive player};
        player addaction [("<t color=""#1376e5"">" + ("FuMS Admin") +"</t>"),FuMS_AdminMenu,"",5,false,true,"",""];       
    };        
};