//GetFamilyObjects.sqf
// Horbin
// 6/28/2015
// Inputs: _msnTag - base mission to start from
//  _objects : object type to build list of and return.
//  _ofRelation: family members to go to next to add to count.
//  _objectList : list to which objects located are added.
// This routine looks at the children of the mission, and returns the objects of the specified type that match the 'child type'
private ["_msnTag","_objectList","_lineage","_objectType","_ofRelation"];
_msnTag = _this select 0;
_objectType = _this select 1;
_ofRelation = _this select 2;
_objectList = _this select 3;
if (isNil "_objectList") then {_objectList =[];};

_lineage = missionNameSpace GetVariable (format ["%1_Lineage",_msnTag]);
_relation = _lineage select 2;

// for each Child, get the number of objects from it
// Get list of children
_listofChildren = missionNameSpace GetVariable (format ["%1_Children",_msnTag]);
if (!isNil "_listofChildren") then
{
	{
		
		_objectList = [_x,_objectType,_objectList] call FuMS_fnc_HC_MsnCtrl_LogicBomb_GetFamilyObjects;
	}foreach _listofChildren;
};













