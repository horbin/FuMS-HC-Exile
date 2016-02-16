//GetIndexers.sqf
// Horbin
// 6/3/15
// INPUTS: String of format "ALL", "1", "0-4", or "1,2,4,5", or "1,2,5-9,7,10-15"   and MAX value
//  'maxValue' should be the total length of the array the 'list of indexers' is being created for.
// OUTPUT: list of numbers based upon input string.
//  stepping through the returned list will provide 'numbers' that are index references to each element in the data array
//   for which the indexers are created.
//  "ALL" = list will be 0,1,2,3....MAX Value
private ["_inputString","_maxValue","_list"];
_inputString = toupper (_this select 0);
_maxValue = _this select 1; 
_list = [];
if (_inputString == "NONE") exitwith {_list};
if (_inputString == "ALL") then
{
  private ["_i"];
  for [{_i=0},{_i < _maxValue},{_i=_i+1}] do
  {
	_list = _list + [_i];
  };
}else
{
	private ["_inputList"];
    _inputList = [];
	// input String is a number or collection of number indexers
	// look for a ',', if found know format to be "1,2,3,4" or "1,2,3-8,10"
	if (_inputString find "," > -1) then
	{
        // found a ',' so break string into component strings for conversion
        private ["_buffer"];
        _buffer = "";
        _inputArray = toArray _inputString;
        {
            if (toString [_x] == ",") then
            {
                _inputList = _inputList + [_buffer];
                _buffer = "";
            }else
            {
                _buffer = format ["%1%2",_buffer,toString [_x]];
            };
        }foreach _inputArray;
        _inputList = _inputList + [_buffer];
	}else{_inputList = [_inputString];}; // store the single number as an array for next step of processing.
	
    //diag_log format ["<FuMS> GetIndexers _inputList:%1",_inputList];
    
	// look for a '-', if found know format to be "2-4"
	{
		private ["_dashRef"];
		_dashRef = _x find "-";
		if (_dashRef > -1) then
		{
			private ["_firstNum","_endNum","_i"];
			// found format of 4-15
			// get 1st number
			_firstNum = parseNumber _x;
			// trim the 1st _dashRef characters off of _x
			_trimmedX = [_x,_dashRef+1] call BIS_fnc_trimString;
            _endNum = (parseNumber _trimmedX)+1;
			for [{_i=_firstNum},{_i<_endNum},{_i=_i+1}] do
			{
				_list = _list + [_i];
			};			
		}else
		{
			// else format is a single number.
			_list = _list + [parseNumber _x];
		};	
	}foreach _inputList;
};
//diag_log format ["<FuMS> GetIndexers: %2 generated indexers:%1",_list];
_list


