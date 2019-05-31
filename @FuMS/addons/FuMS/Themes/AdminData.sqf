//AdminData.sqf
//Horbin
// 2/26/15
FuMS_Users = [];
FuMS_Users =
[
//name | GUID      |        admin level| Options
  //["Horbin","76561198074623284",1,       ["<ALL>"]], // able to toggle all themes
   // ["Horbin","72261198074623284",1,       ["<ALL>"]] // able to toggle all themes
     ["TheOneWhoKnocks","76561198110476397",1,       ["<ALL>"]]

//  ["test","0000000000000000",   2,       ["Test"]]      // only able to toggle the 'Test' theme

];

diag_log format ["##AdminData: FuMS_Users:%1",FuMS_Users];


//**NOTE: NO True options at this time. You either have full access or you don't.  
// More flexability to be developed later.
//Admin Level
// 1 = Toggle Theme, Kill Mission, Set Anchor, Spawn Mission

// Options
// <ALL> = able to control all themes
// "Test","SEM" = only able to toggle 'test' and 'sem' themes

// More functionality to come: To include general 'player' abilities to control 'specific' missions depending upon an item they may hold, or a flag set by an admin.
// Through this mechanism, players will be able to spawn a loot box, start a small 'guard mission' for their base, etc...MORE TO COME!