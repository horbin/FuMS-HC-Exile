//HC_CreateVehicle.sqf
// Horbin
// 1/29/15
// INPUTS: Type, position, markers, distance, mode <-- same params as createVehicle
//   Sends call to server to fully initialize vehicle.
//OUTPUTS: vehicle created.

private  ["_type","_pos","_markers","_dist","_mode","_veh"];
_type = _this select 0;
_pos = _this select 1;
_markers = _this select 2;
_dist = _this select 3;
_mode = _this select 4;

diag_log format ["##CREATEVEHICLE: _type:%1 | _pos:%2 | _markers:%3 | _dist:%4 | _mode:%5",_type,_pos,_markers,_dist,_mode];

_veh = createVehicle [_type, _pos, _markers, _dist, _mode];
 
//initialize everything that is needed on the server side!
if (isServer) then
{ 
    [_veh] spawn FuMS_BuildVehicle_Server;
}
else
{
    FuMS_BuildVehicle_HC = _veh;
    publicVariableServer "FuMS_BuildVehicle_HC";
};

["Vehicles",_veh] call FuMS_fnc_HC_Util_HC_AddObject;
  _veh addEventHandler ["HandleDamage",
    {
        _vehobj = _this select 0;
        _location = _this select 1;  // type string
        _damage = _this select 2;   // type number
        _sourceobj = _this select 3;
        _projectile = _this select 4; // type string
        //ASSERT this EH only active when vehicle owned by AI.
       if ( isNull _sourceobj) then
       {
            _damage = 0;
        };
        _damage       
    }];
    
  _veh addEventHandler ["GetIn",
    {
        _vehobj = _this select 0;
        _seatpos = _this select 1;  
        _unit = _this select 2;   
        _turretpath = _this select 3;
        _var = _vehobj getVariable "HCTEMP";
        //ASSERT this EH only runs on the HC
        if ( isPlayer _unit and _var != "PLAYER") then
       {
           ["Vehicles",_veh] call FuMS_fnc_HC_Util_HC_RemoveObject;          
           _vehobj setVariable ["HCTEMP",_var,false];
        };
        _damage       
    }];  
    
_veh
    
    
    
    