// GetSafeSpawnVehPos = 
// Horbin
// 2/24/15
// Inputs: position, driver, vehicle
// Outputs: nearest location to 'postion' that meets requirements of 'driver's logic and the vehicle type.

private ["_driver","_pos","_veh","_mode"];
_pos = _this select 0;
_driver = _this select 1;
_veh = _this select 2;
// _driver is array of format : ["Convoy",[-75,-600],[0,-50],["NORMAL",true,true, true] or "none"   
_mode = "CAN_COLLIDE";
//diag_log format ["##SpawnVehicle:GetSafeSpawnVehPos: _pos:%1 _driver:%2 _veh:%3",_pos, _driver,_veh];
//diag_log format ["  Vehicle %1:%5 is  Land:%2  Air:%3  Boat:%4",_veh, _veh isKindOf "Land",_veh isKindOf "Air", _veh isKindOf "Boat", toupper (_driver select 0)];  
if (_veh isKindOf "Boat") then {_pos = [_pos] call FuMS_fnc_HC_Util_FindNearestWater;}
else
{           
    if (TypeName _driver == "ARRAY") then
    {
        private ["_aiLogic","_aiOptions"];
        _aiLogic = toupper (_driver select 0);
        _aiOptions = _driver select 3;		
        // diag_log format ["......._aiOptions:%1",_aiOptions];
        // Land vehicle with Convoy ai logic using Roads.
        if (_veh isKindOf "Land" and surfaceIsWater _pos ) then
        { 
            diag_log format ["<FuMS> GetSafeSpawnVehPos: Attempting to create Land vehicle:%1 over water. Looking for a better place.",_veh];
            _pos = [_pos] call FuMS_fnc_HC_Util_FindNearestLand;
        };
        if (_aiLogic == "CONVOY" and _veh isKindOf "Land") then
        {
            if(_aiOptions select 2) then
            {
                // diag_log format ["##SpawnVehicle:GetSafeSpawnVehPos: %2:%1 is on land, looking for a road",_veh,_aiLogic];
                _pos = [_pos] call FuMS_fnc_HC_Util_FindNearestRoad;
            };
        };
        if (_aiLogic == "PATROLROUTE" and _veh isKindOf "Land") then
        {
            if (_aiOptions select 4) then
            {
                //diag_log format ["##SpawnVehicle:GetSafeSpawnVehPos: %2:%1 is on land, looking for a road",_veh,_aiLogic];   
                _pos = [_pos] call FuMS_fnc_HC_Util_FindNearestRoad;
            };
        };     
        if (_veh isKindOf "Air") then
        {
            _mode = "FLY";
          //  diag_log format ["<FuMS> GetSafeSpawnVehPos: creating a flying vehicle: %1",_veh];
        
        };		
    }else // No DRIVER
    {
        // find nearest road for a 'safe position' if a clear spot can not be found within 100m of the desired spawn location!
        private ["_safepos"];			
        _safepos = [_pos] call FuMS_fnc_HC_Util_FindNearestRoad;
        _pos = [_pos, 0, 100, 5,0, 2,0,[],[_safepos]] call BIS_fnc_findSafePos; // 5m clear, terraingradient 2 (pretty flat)	
    };
};
[_pos, _mode]

