//Timer.sqf
//Horbin
// 6/28/2015
// Inputs: _params
// [_msnTag, _duration, time]
private ["_msnTag","_duration","_time","_params","_result"];
_params = _this select 0;
_msnTag = _params select 0;
_duration = _params select 1;
_time = _params select 2;
_pos = _params select 3;
_result = false;

if (time > (_time + _duration)) then 
{
	private ["_players","_numInRange","_xpos","_dist","_dist2"];
	_result=true;
    //_state = _this select 1;
    //_pos = _data select 0;
    _range = 300;
    _numPlayers = 1;   
    _players = [];
    {
        if (isPlayer _x) then 
        {
            _players = _players +[_x];
			//diag_log format ["<FuMS> TimerNoPlayers playable unit type: %1 : _pos:%2", (typeOf _x), (getpos _x) ];	 

        };   
    }foreach playableUnits;
	//diag_log format ["<FuMS> TimerNoPlayers  _pos:%1 | _range:%2 | _numPlayers:%3", _pos,_range,_numPlayers ];
	//diag_log format ["<FuMS> TimerNoPlayers  _players:%1", _players ];
	//diag_log format ["<FuMS> TimerNoPlayers  playableUnits:%1", playableUnits ];

    _numInRange = 0;
    _pos set [2,0];
    {
        _xpos = position _x;
        _xpos set [2,0];
        _dist = _xpos distance _pos;
		_dist2 = _xpos distance2d _pos;		
		//diag_log format ["<FuMS> TimerNoPlayers  _xpos: %1 | _pos: %2 | _dist:%3 | _dist2:%4", _xpos, _pos, _dist,_dist2 ];
		
        if (_dist < _range) then 
        {
            _numInRange = _numInRange +1;
        };
    }foreach _players;
    if ( _numInRange >= _numPlayers) then 
    {
        _result =false;
    };
	//diag_log format ["<FuMS> TimerNoPlayers  _numInRange: %1", _numInRange ];
		
     //nearest not working well due to 3d calculation and encounter not always being at surface level!  
	//diag_log format ["<FuMS> TimerNoPlayers  nearest Objects: %1", (nearestObjects [_pos, [], 50]) ];	 
	//diag_log format ["<FuMS> TimerNoPlayers player Type: %1", (typeOf player) ];	 
    _nearFolks = nearestObjects [_pos, ["Exile_Unit_Player"], _range];
	//diag_log format ["<FuMS> TimerNoPlayers  ProxPlayerFound:%1", _nearFolks ];
	_playerCount = 0;
	{
		if (isPlayer _x) then {_playerCount = _playerCount + 1;};
	}foreach _nearFolks;
    if ( _playerCount >= _numPlayers) then
    { 
        _result = false;
    } ;
	//diag_log format ["<FuMS> TimerNoPlayers _playerCount:%1 | _numPlayers:%2 | _result:%3",_playerCount, _numPlayers,_result];
	
	if (!_result) then
	{
		sleep 60;
	};


};
_result
