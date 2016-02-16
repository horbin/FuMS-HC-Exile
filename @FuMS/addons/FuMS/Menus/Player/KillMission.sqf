//KillMission.sqf
// Horbin
// 2/25/15
private ["_killMissionMenu","_i","_txt","_command","_data","_slot","_activeMissions"];
_killMissionMenu =[["Kill Mission",true]];
_killMissionMenu pushback ["HC : Mission:Theme", [0], "", -2, [["expression", ""]], "1", "0"];

for [{_slot=0},{_slot < count FuMS_HCIDs},{_slot=_slot+1}]do
{
    _activeMissions = missionNamespace  getVariable format ["FuMS_AdminActiveMissionList%1",_slot];
    if (!isNil "_activeMissions") then
    {
        for [{_i=0},{_i < count _activeMissions},{_i=_i+1}] do
        {
            _data = _activeMissions select _i;
            if (!isNil "_data")then
            {
                if (count _data == 2) then
                {
                    if (_data select 1 != "COMPLETE" and _data select 1 != "KILL") then
                    {
                        _txt = format ["%1: %2",_slot, _data select 1];
                        // _command = format ["[%1]",_i] + ' spawn compile '+_action+'';
                        _command = format ["[%1,%2] spawn compile FuMS_fnc_Menu_Action_KillMission",_slot,_i];
                        // diag_log format ["##KillMission: attempting to spawn with  %1 with index %2 :",_txt,_i];
                        _killMissionMenu = _killMissionMenu + 
                        [[_txt,             [0],"",-5,[["expression",     _command]],"1","1"]];		           
                    };
                };
            };
        };
    };
};
_killMissionMenu pushback ["EXIT", [13], "", -4, [["expression", ""]], "1", "1"];
_killMissionMenu

