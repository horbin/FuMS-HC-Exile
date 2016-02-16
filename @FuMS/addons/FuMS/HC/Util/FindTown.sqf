//FindTown.sqf
// Horbin
//2/9/15
//INPUTS: town name (string)
//OUTPUTS: location of the town (array) or map center if town not found. 
private ["_town","_townloc","_name","_mapCenter", "_found"];
_town = _this select 0;
_mapCenter =FuMS_MapCenter;
_townloc = _mapCenter; // default to map center if no town name found!
_found = false;
if (toupper _town == "VILLAGES") then { _town = FuMS_VillageList call BIS_fnc_selectRandom;_found=true;}
else
{
    if (toupper _town == "CITIES") then { _town = FuMS_CityList call BIS_fnc_selectRandom;_found=true;}
    else
    {
        if (toupper _town == "CAPITALS") then { _town = FuMS_CapitalList call BIS_fnc_selectRandom;_found=true};
    };
};
if (_found) then
{
    _townloc = locationPosition _town;
};
//diag_log format ["<FuMS> FindTown: _found:%2 _town = %1",_town,_found];

if (!_found) then
{
    {
        _name = (text _x);
        if (_town == _name) then{_townloc = locationPosition _x;_found=true;};
    }foreach (FuMS_VillageList+FuMS_CityList+FuMS_CapitalList); 
};
if (!_found) then {diag_log format ["##FindTown: ERROR: %1 town not found!",_town];};
_townloc
