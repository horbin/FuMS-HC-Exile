// AddObjectsToList.sqf
// Horbin
// 6/28/2015
// Inputs: _objectList : List objects are to be added too
//   _objectType: which objects (buildings, groups, boxes, vehicles) to be added
//   _msnTag : mission resources are being looked to for addition.
private ["_objectList","_objectType","_msnTag","_thisMsnsObjects"];

_objectList = _this select 0;
_objectType = _this select 1;
_msnTag = _this select 2;

if (isNil "_objectList") then {_objectList = [];};

_thisMsnsObjects = missionNameSpace getVariable (format ["%1_%2",_msnTag,_objectType]);
//  Ex: "FuMS_0_0_0_Groups"

if (!isNil "_thisMsnsObjects") then
{
	{
		_objectList = _objectList + [_x];
	}foreach _thisMsnsObjects;
};
_objectList;