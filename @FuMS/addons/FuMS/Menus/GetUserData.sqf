//GetUserData.sqf
// Horbin
// 2/26/15
// Output: data associated with 'player', 'nil' if no match for GUID found
private ["_data","_pUID","_dataUID","_player"];
_player = _this select 0;
_data = [];
_pUID = getPlayerUID _player;
waitUntil {!isNil "FuMS_Users"};  // hold here at server start for list to become defined. 
diag_log format ["<FuMS> GetUserData   Player:%1 with Guid:%2",_player, _pUID];
{
    diag_log format ["<FuMS> GetUserData examining:%1",_x];
	_dataUID = _x select 1;
	if (_pUID == _dataUID) exitWith {_data = _x};
}foreach FuMS_Users;
_data
