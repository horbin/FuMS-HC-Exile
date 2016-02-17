//SetResource.sqf
// Horbin
// 3/10/15
private ["_setResourceMenu","_ii","_txt","_command","_missionList"];
_setResourceMenu =[["Set Resource",true]];
//diag_log format ["##SetResource:  Set Resource building list."];

for [{_ii=0},{_ii < count FuMS_HCNames},{_ii=_ii+1}] do
{
   _txt = format ["%1",FuMS_HCNames select _ii];
       _command = format ["[%1] spawn compile FuMS_fnc_Menu_Action_SetResource", _ii ];
    //_command = format ["[%1] spawn compile FuMS_fnc_Menu_Action_SetAnchor",_ii];       
    _setResourceMenu pushBack [_txt,             [0],"",-5,[["expression",    _command]],"1","1"];		           
};
_setResourceMenu pushBack ["EXIT", [0], "", -4, [["expression", ""]], "1", "1"];
_setResourceMenu

