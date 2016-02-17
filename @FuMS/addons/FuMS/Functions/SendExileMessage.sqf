// FuMS_SendExileMessage.sqf
// Horbin
// 10/12/2015
//

	private["_messageName","_messageParameters","_player"];
	_player = _this select 0;
	_messageName = _this select 1;
	_messageParameters = _this select 2;
	diag_log format ["<FuMS> SendExileMessage : %1 : %2 : %3 ", _player, _messageName, _messageParameters];
	_publicMessage = [_messageName, _messageParameters];
	_publicMessage remoteExecCall ["ExileClient_system_network_dispatchIncomingMessage",(owner _player)];	
	true