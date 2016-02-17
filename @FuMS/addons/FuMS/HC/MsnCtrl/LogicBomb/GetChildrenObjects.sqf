//GetChildrenOjbects.sqf
// Horbin
// 6/28/2015
// Inputs: _msnTag - base mission to start from
//  _objects : object type to build list of and return.
//  _objectList : list to which objects located are added.
private ["_msnTag","_objectList","_lineage","_objectType"];
_msnTag = _this select 0;
_objectType = _this select 1;
_objectList = _this select 2;

_lineage = missionNameSpace GetVariable (format ["%1_Lineage",_msnTag]);
_relation = _lineage select 2;

// for each Child, get the number of objects from it
// Get list of children
if	 (_relation == "CHILD" or _relation == "PARENT" or _relation == "STEPCHILD") then
{	
	_listofChildren = missionNameSpace GetVariable (format ["%1_Children",_msnTag]);
	if (!isNil "_listofChildren") then
	{
		{
			_objectList = [_x,_objectType,_objectList] call FuMS_fnc_HC_MsnCtrl_LogicBomb_GetChildrenObjects;
		}foreach _listofChildren;
	};
};













