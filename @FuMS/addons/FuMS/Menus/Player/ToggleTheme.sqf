//ToggleTheme.sqf
// Horbin
// 2/25/15
private ["_toggleThemeMenu","_i","_txt","_command","_slot"];
//_action = FuMS_fnc_Menu_Action_ToggleTheme;
_toggleThemeMenu =[["Toggle Theme",true]];
_toggleThemeMenu pushback ["STAT : HC :  Theme", [0], "", -2, [["expression", ""]], "1", "0"];
                                          
for [{_slot=0},{_slot < count FuMS_HCIDs},{_slot=_slot+1}] do
{
    private ["_hcName","_activeThemes","_onOff"];
    _hcName = FuMS_HCNames select _slot;
 //   diag_log format ["##ToggleTheme: retrieving vars: :%1 in slot %2",_hcName, _slot];
    _activeThemes = missionNameSpace getVariable format["FuMS_AdminActiveThemes%1",_slot];
    //_activeThemesHC = missionNameSpace getVariable format["FuMS_AdminActiveThemesHC%1",_slot];
    
    if (!isNil "_activeThemes") then
    { 
 //       diag_log format ["##ToggleTheme: #%1 _activeThemes",count _activeThemes];
        _onOff = missionNameSpace getVariable format["FuMS_AdminThemeOn%1",_slot];
        for [{_i=0},{_i < count _activeThemes},{_i=_i+1}] do
        {
            if (_onOff select _i) then
            {                                 
                _txt =" ON   :";
            }else{    _txt=" OFF  :";};                                                                                                  
            _txt = format ["%1 %2 :%3",_txt,_slot,_activeThemes select _i];        
            _command = format ["[%1,%2,%3] spawn compile FuMS_fnc_Menu_Action_ToggleTheme",_slot,_i, _activeThemes select _i];
            //diag_log format ["##ToggleTheme: attempting to spawn with on mission %1 with index %2 :",_txt,_i];
            _toggleThemeMenu pushback [_txt,             [0],"",-5,[["expression",    _command]],"1","1"];		           
        };
    };
};
_toggleThemeMenu pushback ["EXIT", [13], "", -4, [["expression", ""]], "1", "1"];
_toggleThemeMenu

