//GetChoice.sqf
// Horbin
// 1/11/15
// Inputs: arrary containing 'data', and a 'chance'  [data, chance]
// Output: a single element of data, or nullObj
//  If AddIt true, and 'data' is an array a random element is selected from 'data'.
//AddIt = compile preprocessFileLineNumbers "HC\Encounters\Functions\AddIt.sqf";
// Input: [ data, chance]
// if chance passes, returns data.
// if 'data' is an array of items, a single random choice is returned.
// a failed chance returns nullObj.
private["_data","_chance","_selection","_dataset"];
_data = _this select 0;
_selection = "";
if (count _data != 2) exitWith {diag_log format["##GetChoice: ERROR in data sent to 'GetChoice': %1",_data];};
_dataset = _data select 0;
_chance = _data select 1;
_selection = "";
//diag_log format ["## GetChoice: _data:%1 _chance:%2",_dataset, _chance];
if ( [_chance] call FuMS_fnc_HC_Loot_AddIt) then
{
    if (TypeName _dataset == "ARRAY") then
    {
        _selection = _dataset call BIS_fnc_selectRandom;
    }else
    { 
        _selection = _dataset;
    };
};
_selection