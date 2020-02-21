//RemoveDecayObjects.sqf
// Horbin
// 6/21/15
// Inputs: '_thisTag' , a string configured with themeName themeIndex missionName childName
private ["_thisTag"];
_thisTag = _this select 0;
//_thisTag = "FuMS_0_0_0_";
//_lineage = missionNamespace getVariable (format ["%1_lineage",_thisTag]);
//_generation = _lineage select 0;
//_relation = _lineage select 1;
//_offspringID = _lineage select 2;
//_parentsName = _lineage select 3;
//_listofChildren = missionNamespace getVariable (format ["%1_Children",_thisTag]); // list of active children.

private ["_buildings","_vehicles","_boxes","_groups"];
_buildings = missionNamespace getVariable format ["%1_buildings",_thisTag];
//diag_log format ["<FuMS> RemoveDecayObjects %1 deleting %2 Buildings:%3",_thisTag, count _buildings, _buildings];
{
    private ["_keep"];
    _keep = _x getVariable "FuMS_PERSIST";    
    if (!isNil "_keep") then
    {
        if (!_keep) then
        {                                         
            { 
                //   diag_log format ["<FuMS> RemoveDecayObjects: deleting effect :%1",_x];
                detach _x; 
                deleteVehicle _x;
            } foreach (attachedObjects _x);                 
            deleteVehicle _x;                   
            ["Buildings",_x] call FuMS_fnc_HC_Util_HC_RemoveObject;              
        };       
    };
} foreach _buildings;        

_vehicles = missionNamespace getVariable format ["%1_vehicles",_thisTag];
//diag_log format ["<FuMS> RemoveDecayObjects %1 deleting %2 Vehicles: %3",_thisTag, count _vehicles, _vehicles];
{
  //  diag_log format ["<FuMS> RemoveDecayObjects: Vehicle %1 attempting to remove.",_x];
    if (TypeName _x == "ARRAY") then
    {
        // do nothing for now. Not sure why vehicle array is becoming an array of arrays.       
    }else
    {
        private ["_keep"];
        _keep = driver _x;
        if (! (isNull _keep) and !(isPlayer _keep) )then
        // if there is an AI driver that is NOT a player then look to remove the vehicle.
        { 
            private ["_enemy"];
            _enemy = _keep findNearestEnemy _keep;
            if (!isNull _enemy) then
            {
                // Vehicle persists spawn process                        
                [_keep] spawn
                {
                    private ["_unit","_timer","_done","_veh","_enemy"];
                    _unit = _this select 0;                            
                    _timer = time;
                    _done = false;
                    _veh = vehicle _unit;
                    diag_log format ["<FuMS> RemoveDecayObjects: %1 cleanup delayed because its driver, %2, is engaged with players!",_veh,_unit];
                    while {alive _unit  and !_done} do
                    {
                        _enemy = _unit findNearestEnemy _unit;
                        if (isNull _enemy) then 
                        {
                            if (time > _timer + 180) then { _done = true;};
                        }else{_timer = time;};
                        sleep 15;
                    };    
                    if (alive _unit) then
                    { 
                        { 
                            //  diag_log format ["<FuMS> RemoveDecayObjects: deleting effect :%1",_x];
                            detach _x; 
                            deleteVehicle _x;
                        } foreach attachedObjects _unit;      
                        deleteVehicle _veh;                            
                    } // if driver was alive delete the vehicle
                    else
                    {
                        //driver was dead, so wait 3 minutes for TEMPVAR to change on vehicle. If it does not, delete it!
                        [_veh] spawn
                        {
                            private ["_timer","_veh","_keep"];
                            _veh = _this select 0;
                            _timer = time+ 180;
                            _keep = false;
                            while {time < _timer} do
                            {
                                if ((_veh getVariable "HCTEMP") == "PLAYER") then
                                {
                                    _keep = true;
                                    _timer = time;
                                };
                                sleep 15;
                            };
                            if (!_keep) then
                            { 
                                //      _effects = _x getVariable "effects";
                                //    {deleteVehicle _x} forEach _effects;   
                                { 
                                    //diag_log format ["<FuMS> RemoveDecayObjects: deleting effect :%1",_x];
                                    detach _x; 
                                    deleteVehicle _x;
                                } foreach attachedObjects _veh;                                          
                                deleteVehicle _veh;
                            };                                    
                        };                                
                    };                            
                    deleteVehicle _unit;
                };
                //End Spawn watch process.
            }else
            {                       
                ["Vehicles",_x] call FuMS_fnc_HC_Util_HC_RemoveObject;
                { 
                    //  diag_log format ["<FuMS> RemoveDecayObjects: deleting effect :%1",_x];
                    detach _x; 
                    deleteVehicle _x;
                } foreach attachedObjects _x;      
                deleteVehicle _x;
            };
        }
        else
        {
            // test if vehicle has been captured...if not delete it!
            _var = _x getVariable "FuMS_HCTemp";
            if (!isNil "_var") then
            {
                if (_var == "AI") then {deleteVehicle _x;};
            }else
            {
               // deleteVehicle _x;
          //      diag_log format ["<FuMS> RemoveDecayObjects: Non FuMS generated Vehicle (%1) found on Mission list. Leaving vehicle alone!",_x];
            };
        };
    };
}foreach _vehicles;        

_groups = missionNamespace getVariable format ["%1_groups",_thisTag];
//diag_log format ["<FuMS> RemoveDecayObjects %1 deleting %2 Groups",_thisTag, count _groups];
{
    {
        private ["_enemy"];
        _var = _x getVariable "FuMS_CaptiveAction"; // if the AI has this variable set it IS a CAPTIVE type AI.
        _enemy = objNull;
        if (isNil "_var") then
        {
           // this AI is NOT a captive, so check if it sees any players/enemies around.
            _enemy = _x findNearestEnemy _x;
        };
        if (!isNull _enemy) then                
        {
            // start of unit spawn code.                    
            [_x] spawn
            {
                private ["_unit","_timer","_done","_enemy"];
                _unit = _this select 0;
                _timer = time;
                _done = false;
                diag_log format ["<FuMS> RemoveDecayObjects: %1 cleanup delayed because it is engaged with players!",_unit];
                while {alive _unit  and !_done} do
                {
                    _enemy = _unit findNearestEnemy _unit;
                    if (isNull _enemy) then 
                    {
                        if (time > _timer + 180) then { _done = true;};
                    }else{_timer = time;};
                    sleep 15;
                };    
                deleteVehicle _unit;
            };
        }else { deleteVehicle _x;};
    } foreach units _x;
    if ((count units _x) == 0) then
    { 
        ["AIGroups",_x] call FuMS_fnc_HC_Util_HC_RemoveObject;
        deletegroup _x;          
    };
}foreach _groups;



_boxes = missionNamespace getVariable format ["%1_boxes",_thisTag];
//diag_log format ["<FuMS> RemoveDecayObjects: %3 Loot will expire in %2 minutes Loot : %1",_boxes, FuMS_LootBoxTime, count _boxes];
{
    
	//if (typeName _x != "ARRAY") then
	
	
	_isArray = _x isEqualType [];
	if (!_isArray) then

	
    {
        [_x] spawn
        {
            private ["_box","_timer"];
            _box = _this select 0;
            _timer = time + (FuMS_LootBoxTime)*60;       
            while {time < _timer} do
            {              
                sleep 30;
            };
            deleteVehicle _box;
        };
    };
}foreach _boxes;

//missionNamespace setVariable [format ["%1_closetriggers",_thisTag], true];  // used by all triggers to be told to terminate. 

// this mission has handled its resources, now set itself to dead so any waiting parents can take action.




