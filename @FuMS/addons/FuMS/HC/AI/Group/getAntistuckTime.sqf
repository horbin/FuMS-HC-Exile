private ["_unitType"];

_unitType = _this;

call {
	if (_unitType in ["static","staticcustom","vehiclecrew","aircustom","landcustom"]) exitWith {60};
	if (_unitType in ["air","uav"]) exitWith {300};
	if (_unitType in ["land","ugv"]) exitWith {120};
	300
};
