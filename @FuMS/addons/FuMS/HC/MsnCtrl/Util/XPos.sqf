//Xpos.sqf
// Horbin
// 1/3/2015
// INPUTS: Origin point, offset point
// OUTPUTS:Provides in game coordinates for an 'offset' from the supplied origin.
//FindTown = compile preprocessFileLineNumbers "HC\Encounters\Functions\FindTown.sqf";
private ["_origin","_offset","_newloc","_newx","_newy"];
_origin = _this select 0;
_offset = _this select 1;
//diag_log format ["##Xpos: _origion:%1  _offset:%2",_origin, _offset];
if (!isNil "_offset") then
{
    if (count _offset == 3) exitWith { _newloc = _offset; }; // If 3D simply return it.
    if (count _offset == 1) then {_offset = _offset select 0;};  // string location embedded in an array ["Stavros"]
    //if (typeName _offset == "STRING") then { _newloc = [_offset] call FuMS_fnc_HC_Util_FindTown;}  // just a string "Stavros"

	//_isArray = (_loot select 0) isEqualType [];
	_isString = _offset isEqualType "STRING";

    if (_isString) then { _newloc = [_offset] call FuMS_fnc_HC_Util_FindTown;}  // just a string "Stavros"


    else
    {  
        _newx = _origin select 0;
        _newx = _newx + (_offset select 0);
        
        _newy = _origin select 1;
        _newy = _newy + (_offset select 1);
        
        _newloc = [ _newx, _newy];
    };
}else
{
    if (count _origin == 1) then {_origin = _origin select 0;};  // string location embedded in an array ["Stavros"]
//    if (typeName _origin == "STRING") then { _newloc = [_origin] call FuMS_fnc_HC_Util_FindTown;}  // just a string "Stavros"

	_isString = _origin isEqualType "STRING";
    if (_isString) then { _newloc = [_origin] call FuMS_fnc_HC_Util_FindTown;}  // just a string "Stavros"


    else { _newloc = _origin;};
};
_newloc




