//ProxPlayer.sqf
//Horbin
// 1/4/15
//INPUTS: [position, range, numPlayers]
//OUTPUTS: true if 'numPlayers' are within range of position
private ["_pos","_range","_numPlayers","_nearFolks","_result","_data"];
_data = _this select 0;
_result = false;
if (count _data == 3) then // this trigger is defined for the current state 'i'
{
    private ["_players","_numInRange","_xpos","_dist"];
    //_state = _this select 1;
    _pos = _data select 0;
    _range = _data select 1;
    _numPlayers = _data select 2;   
	_maxPlayers = _data select 3;
	_increment = _data select 4;
	_previousPlayerCount = _this select 1;
	
    _players = [];
    {
        if (isPlayer _x) then 
        {
            _players = _players +[_x];
        };   
    }foreach playableUnits;
    _numInRange = 0;
    _pos set [2,0];
    {
        _xpos = position _x;
        _xpos set [2,0];
        _dist = _xpos distance _pos;        
        if (_dist < _range) then 
        {
            _numInRange = _numInRange +1;
        };
    }foreach _players;
	
    if ( _numInRange >= _numPlayers and _numInRange > _previousPlayerCount) then 
    {
        _result =true;
    };
     //nearest not working well due to 3d calculation and encounter not always being at surface level!   
    _nearFolks = nearestObjects [_pos, ["Exile_Unit_Player"], _range];
    //diag_log format ["###Trigger Watch:State:%1 ProxPlayerFound:%2", _state, _nearFolks ];
    if ( count _nearFolks >= _numPlayers) then
    { 
        _result = true;
    } ;
};
_result