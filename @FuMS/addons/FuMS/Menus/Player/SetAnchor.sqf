//SetAnchor.sqf
// Horbin
// 3/8/15
private ["_setAnchorMenu","_ii","_txt","_command","_playerList"];
//_action = FuMS_fnc_Menu_Action_SetAnchor;
_setAnchorMenu =[["Set Anchor",true]];

_playerList = [];
// loop for each active player on the server!
//_list = FuMS_MapCenter nearEntities ["Man",FuMS_MapRange];
{
	if (isPlayer _x) then {_playerList pushBack [_x];};
}foreach playableUnits;

// _anchorName = format to be readable FuMS_Anchor
//Get the player's name.   
FuMS_anchorNameTxt = [FuMS_Anchor] call FuMS_fnc_HC_Util_GetShortName;
// _anchorLoc =  format location to be readable FuMS_AnchorLoc
if (count FuMS_AnchorLoc > 1) then
{
    _xx = FuMS_AnchorLoc select 0;
    _yy = FuMS_AnchorLoc select 1;
    _xx = round(_xx/1000);
    _yy = round(_yy/1000);
    FuMS_anchorLocTxt = format ["   [%1K , %2K]",_xx,_yy];
} else {FuMS_anchorLocTxt =      "   [---K, ---K]";};


FuMS_PlayerList = [];
for [{_ii=0},{_ii < count _playerList},{_ii=_ii+1}] do
{
  //  diag_log format ["##SetAnchor: Adding %1 to the list",_playerList select _ii];
    _playername = [_playerList select _ii] call FuMS_fnc_HC_Util_GetShortName;
    // _playername is 'simple', with no group tags.        
   // diag_log format ["##SetAnchor: found player: %1",_playername];
    
    //      if ((((FuMS_THEMEDATA select _i) select 0) select 1) == 4) then {_txt="STATIC:";};
    // not worth broadcasting this to all clients to get the indications.                                                                                               
    _txt = format ["%1",_playername];
    FuMS_PlayerList set [_ii, _playerList select _ii];
    //_command = '['+format ["%1",_i] + '] spawn compile '+_action;
        _command = format ["[%1] spawn compile FuMS_fnc_Menu_Action_SetAnchor",_ii];
    //diag_log format ["##ToggleTheme: attempting to spawn with on mission %1 with index %2 :",_txt,_i];
    _setAnchorMenu pushBack [_txt,             [0],"",-5,[["expression",    _command]],"1","1"];		           
};
_setAnchorMenu pushBack ["CLEAR Anchor", [0], "", -5, [["expression", "[500] spawn compile FuMS_fnc_Menu_Action_SetAnchor"]], "1", "1"];
_setAnchorMenu pushBack ["Current Anchor", [0], "", -2, [["expression", ""]], "1", "1"];
_setAnchorMenu pushBack [format["%1", FuMS_anchorNameTxt], [0], "", -2, [["expression", ""]], "1", "1"];
_setAnchorMenu pushBack [format["%1",FuMS_anchorLocTxt], [0], "", -2, [["expression", ""]], "1", "1"];
_setAnchorMenu pushBack ["EXIT", [0], "", -4, [["expression", ""]], "1", "1"];
_setAnchorMenu

