//Init_HC_HAL_Variables.sqf
// Horbin
// 3/2/15
// utilizes global FuMS_HC_SlotNumber
diag_log format ["##Init_HC_HAL_Variables: Slot %1 initialized.",FuMS_HC_SlotNumber];
private ["_prefix","_suffix","_globalListofArrays"];
_prefix = "FuMS_HC_HAL_";
_suffix = FuMS_HC_SlotNumber;
_globalListofArrays = ["Markers","Vehicles","Buildings","Triggers","AIGroups"];
{
//    diag_log format ["##Init_HC_HAL_Variables:  Initializing %1",format ["%1%2%3",_prefix,_x,_suffix]];
    missionNamespace setVariable [format ["%1%2%3",_prefix,_x,_suffix],[]];     
}foreach _globalListofArrays;
missionNamespace setVariable [format ["%1NumBuildings%2",_prefix,_suffix],0];