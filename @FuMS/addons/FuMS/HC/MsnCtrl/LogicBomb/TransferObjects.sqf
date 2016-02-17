//TransferObjects.sqf
// 7/3/2015
// Horbin
// Inputs: _msnTag
// ASSERT: This mission has been directed to be closed.
// ASSERT: This mission is a child and needs to pass all its objects to the parent!

private ["_msnTag","_lineage","_parent","_listOfObjects","_children"];
_msnTag = _this select 0;
_lineage = missionNameSpace getVariable (format ["%1_Lineage",_msnTag]);
// FuMS_0_0_0_Lineage = [themeIndex, generation, relation, offspringID, parentName]
//_relation = _lineage select 3;
_parent = _lineage select 4;
_listOfObjects = ["Buildings","Groups","Vehicles","Boxes"];

{
    private ["_parentObjects","_childObjects"];
	_parentObjects = missionNameSpace GetVariable (format ["%1_%2",_parent, _x]);
	_childObjects = missionNameSpace GetVariable (format ["%1_%2", _msnTag, _x]);
    diag_log format ["<FuMS> TransferObjects %1_%2 is size %3", _parent, _x, count _parentObjects];
	{
		_x setVariable ["LINEAGE", _parent];
		if (typeName _x == "GROUP") then
		{
			{
				_x setVariable ["LINEAGE", _parent];
            }foreach (units _x);
		};
		_ParentObjects = _parentObjects + [_x];
	}foreach _childObjects;
	missionNameSpace setVariable [format ["%1_%2",_parent,_x],_parentObjects];	
    diag_log format ["<FuMS> TransferObjects %1 %2 transfered to %3 from %4",count _childObjects, _x,_parent, _msnTag];
    diag_log format ["<FuMS> TransferObjects %1_%2 now size %3", _parent, _x, count _parentObjects];
	// conduct special handling of any other variables.		
}foreach _listOfObjects;
_children = missionNameSpace getVariable (format ["%1_Children",_parent]);
_children = _children - [_msnTag];
missionNameSpace setVariable [format ["%1_Children",_parent],_children];

