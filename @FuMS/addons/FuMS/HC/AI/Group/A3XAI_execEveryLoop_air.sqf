#include "\A3XAI\globaldefines.hpp"

private ["_unitGroup", "_vehicle","_inNoAggroArea","_inArea","_result","_leader"];

_unitGroup = _this select 0;
_vehicle = _this select 1;

_leader = (leader _unitGroup);
_inArea = [_vehicle,NO_AGGRO_RANGE_AIR] call A3XAI_checkInNoAggroArea;

if !(_inArea) then {
	_assignedTarget = (assignedTarget (vehicle _leader));
	if ((_assignedTarget distance _leader) < NO_AGGRO_RANGE_AIR) then {	//900: replace with engagement range
		_inArea = [_assignedTarget,300] call A3XAI_checkInNoAggroArea;
	};
}; //To test!

_result = [_unitGroup,_inArea] call A3XAI_noAggroAreaToggle;

true
