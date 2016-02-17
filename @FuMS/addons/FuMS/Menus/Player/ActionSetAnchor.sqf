//ActionSetAnchor.sqf
// Horbin
// 2/25/15
private ["_index","_player"];
_index = _this select 0;
diag_log format ["##ActionSetAnchor: Attempting to set Anchor to :%1",_index];
if (_index == 500) then
{
    FuMS_Anchor = "N/A";
    FuMS_AnchorLoc = [];
    systemChat format["FuMS:Admin:Player Anchor cleared."];
}else
{
    _player = (FuMS_PlayerList select _index) select 0;
    FuMS_Anchor = _player;
	FuMS_AnchorLoc = getPos _player;
    [] spawn
    {
        private ["_anchor"];
        _anchor = FuMS_Anchor;
   //     diag_log format ["##ActionSetAnchor: TypeName        _anchor:%1, value=:%2",TypeName _anchor, _anchor];
    //    diag_log format ["##ActionSetAnchor: TypeName FuMS_Anchor:%1, value=:%2",TypeName FuMS_Anchor, FuMS_Anchor];
        _guidanchor = getPlayerUID _anchor;
        _guidFANCHOR = getPlayerUID FuMS_Anchor;
        // once anchor is changed, this spawn process will end.
        while {_guidanchor == _guidFANCHOR} do
        {
            _guidFANCHOR = getPlayerUID FuMS_Anchor;
            FuMS_AnchorLoc = getPos _anchor;
            uisleep 5;
        };
    };
    systemChat format["FuMS:Admin:%1 now set as Mission spawn anchor",_player];
};