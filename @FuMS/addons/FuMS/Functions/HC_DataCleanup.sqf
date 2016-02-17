//HC_DataCleanup.sqf
// Horbin
// 3/2/15
// Inputs : HC's id.
private ["_hcID","_prefix","_var","_varName","_i"];
//_owner = _this select 0;
//_hcID = owner _owner;
_hcID = _this select 0;
_prefix = "FuMS_HC_HAL_";
for [{_i=1},{_i<count FuMS_HCIDs},{_i=_i+1}]do
{
 //   diag_log format ["##HC_DataCleanup: FuMS_HCIDs:%1",FuMS_HCIDs];
//    diag_log format ["##HC_DataCleanup: FuMS_HCNames:%1",FuMS_HCNames];
    if (FuMS_HCIDs select _i == _hcID) then
    { 
        FuMS_HCIDs set [_i,-1];
        FuMS_HCNames set [_i, "Disconnected"];
        {
            _x publicVariableClient "FuMS_HCNames";
        }foreach FuMS_AdminIDs;
    };
};

// ASSERT:  HC has been verified to be disconnected.
// ASSERT: HC owned assets may still not be owned by Server, so need to wait for ownership transfer
_varName = format ["%1AIGroups%2",_prefix,_hcID]; //AIGroups
_var = missionNameSpace getVariable _varName;
//diag_log format ["##HC_DataCleanup: _varName :%1 _var:%2",_varName, _var];

if (!isNil "_var") then
{
    {
        if (!isNull _x) then 
        {
            waitUntil
            { 
               // diag_log format ["HC:CLEANUP Groups: %1 is local= %2", _x, local _x];  
                local _x
            };
            {
                if (!isNull _x) then
                {
                    waitUntil { local _x};
                    deleteVehicle _x; 
                };
            } forEach units _x;         
            deleteGroup _x;     
        };
  
        
    }foreach _var;
 
    diag_log format ["HC:CLEANUP Groups: %1 deleted from %2", count _var, _varName];
};

_varName = format ["%1Vehicles%2",_prefix,_hcID];
_var = missionNameSpace getVariable _varName;
if (!isNil "_var") then
{
    { 
        if (TypeName _x == "ARRAY") then
        {
            diag_log format ["##HC_DataCleanup: error in %2: found %1",_x,_varName];
        }else
        {
            private ["_value"];
            _value = _x getVariable "HCTEMP";
       //     diag_log format ["HC:CLEANUP: %1 being checked.",_x];
            if (!(isNil "_value")) then  // if _value 'isNil' then somehow calling on a vehicle not created by the HC!
            {
                if (_value != "AI") then
                {
                    diag_log format ["HC:CLEANUP: %1 is no longer AI controlled: %2",_x, _value];           
                }else
                {
        //            diag_log format ["HC:CLEANUP: %1 deleted",_x];
                    {
                        detach _x;
                        deleteVehicle _x;
                    }foreach attachedObjects _x;
                    deleteVehicle _x;   
                    //_x = nil;
                };
            };
        };
    } forEach _var;
    diag_log format ["HC:CLEANUP: %1 vehicles checked for %2",count _var, _varName];
};

// Markers
_varName = format ["%1Markers%2",_prefix,_hcID];
_var = missionNameSpace getVariable _varName;
if (!isNil "_var") then
{
    {     
        _x setMarkerAlpha 0; 
        publicVariable _x; 
        deleteMarker _x;
        _x = nil;
    } forEach _var;    
    diag_log format ["HC:CLEANUP Markers: %1 deleted from %2",count _var, _varName];
};
// Buildings
_varName =  format ["%1Buildings%2",_prefix,_hcID];
_var = missionNameSpace getVariable _varName;
if (!isNil "_var") then
{
    {    
        if ( TypeName _x == "ARRAY") then
        {
            {
                {
                    detach _x;
                    deleteVehicle _x;
                }foreach attachedObjects _x;
                deleteVehicle _x;
            }foreach _x;
        } else
        {
            {
                detach _x;
                deleteVehicle _x;
            }foreach attachedObjects _x;               
            deleteVehicle _x;
        };
    }foreach _var;
    diag_log format ["HC:CLEANUP Buildings: %1 deleted from %2", count _var, _varName];
};
missionNameSpace setVariable [format ["%1NumBuildings%2",_prefix,_hcID],0];

// Triggers.
_varName = format ["%1Triggers%2",_prefix,_hcID];
_var = missionNameSpace getVariable _varName;
if (!isNil "_var") then
{
    {    
        if ( TypeName _x == "ARRAY") then
        {
            {
                deleteVehicle _x;
            }foreach _x;
        } else
        {
            deleteVehicle _x;
        };                      
    } forEach _var;
    diag_log format ["HCCLEANUP Triggers: %1 deleted from %2", count _var,_varName];  
};

FuMS_ServerIsClean = true;
publicVariable "FuMS_ServerIsClean";
