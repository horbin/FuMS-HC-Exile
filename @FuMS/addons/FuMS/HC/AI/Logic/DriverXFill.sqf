//DriverXFill.sqf
//Horbin
// 1/26/2015
// Inputs: Driver, XFill waypoint, EvacTo waypoint
private ["_wp","_wp2","_driver","_wpPos","_drvVar","_drvTheme","_drvSide","_list","_xfillList","_cargoslots"];
_driver = _this select 0;
_wp = _this select 1;
_wp2 = _this select 2;          
_wpPos = getWPPos _wp;
_wpPos set [2,0];
_drvVar = _driver getVariable "FuMS_XFILL";
_drvTheme = _drvVar select 0;
_drvSide = _drvVar select 1;
// check for when vehicle gets to the XFILL/Pickup zone.
waitUntil
{  
    private ["_unitPos"];
    _unitPos = getPos _driver;
    _unitPos set [2,0];
    sleep 5;
    ((getWPPos _wp) distance  _unitPos < 80 || unitready _driver)
};       
//diag_log format ["##DriverXFill: %1:driver has arrived at XFILL:%2",_driver,_wpPos];
// search within 250m for compatible AI
if (alive _driver) then
{
    _list = _driver nearEntities 250;
    //diag_log format ["##DriverXFill: %1:driver has arrived at XFILL:%2. %3 Entities found",_driver,_wpPos, count _list];
    //diag_log format ["##DriverXfill: Entities:%1",_list];
    _xfillList = [];
    _cargoslots = (vehicle _driver) emptyPositions "cargo";
   // diag_log format ["##driverXFill:driver xfill:%1",_drvVar];
    {
        //if this vehicle is NOT full
        if (_cargoslots > 0) then
        {
            //if unit is on foot
            if (vehicle _x == _x) then //do not try to evacuate guys already in vehicles!
            {
                private ["_xfillVar","_themeIndex","_side","_status"];  
                _xfillVar = _x getVariable "FuMS_XFILL";
                // If find AI in the area with an XFILL variable.
                if (!isNil "_xfillVar") then
                {
                    _themeIndex = _xfillVar select 0;
                    _side = _xfillVar select 1;
                    _status = _xfillVar select 2;
                   // diag_log format ["##DriverXFill: xfill Var = %1",_xfillVar];
                    if (_themeIndex==_drvTheme and _side==_drvSide and _status != "EVAC") then
                    {
                        private ["_driverVar","_evacLoc"];
                        // driver belongs to same team as the unit found, and the unit has not began a vehicle evacuation.
                        _status = "EVAC";
                        _cargoslots = _cargoslots - 1;
                        //pass back the vehicle and evac loc for the 'unit' to exac into!
                        _driverVar = _driver getVariable "FuMS_AILOGIC";
                        _evacLoc = _driverVar select 2;
                        _x setVariable ["FuMS_XFILL", [_themeIndex, _side, _status, vehicle _driver, _evacLoc],false];
                        _xfillList = _xfillList + [_x];
                    };
                };
            };
        };
    }foreach _list;
};
//Wait for all evacuies to get into the vehicle!
if (alive _driver) then
{
    private ["_trackList","_endTime","_drvLogic","_veh"];
 //   diag_log format ["##DriverXFill: %1 located %2 units to XFill!",_driver, count _xfillList];
 //   diag_log format ["##DriverXFill: Driver AILOGIC: %1", _driver getVariable "AILOGIC"];
    _driver forceSpeed 0;
    _drvVar set [2,"HOLD"]; // set in the event vehicle has to be abondon, transition to EVACONFOOT
    _driver setVariable ["FuMS_XFILL", _drvVar, false];
    _veh = vehicle _driver;
    // wait while those contacted board vehicle.
    _trackList = _xfillList;
    //wait a maximum of 5 minutes!
    _endTime = time + 3000;
    while {  (alive _driver) and (time <_endTime) and (count _xfillList !=0) and canMove _veh} do
    {
        sleep 2; 
        // check to see if xfillList memeber is dead or now in a vehicle, if so remove it from the list.
        {
            if (alive _x) then
            {
                // Unit is no longer on foot!
                if (! (vehicle _x == _x) ) then{_xfillList = _xfillList - [_x];};
            }else {_xfillList = _xfillList - [_x];}; // unit died so remove it!
        }foreach _xfillList;
        // all units attempting to evac are dead or in vehicles  
    };
    // loading is now done, for one of the above 4 reasons:
    // driver alive, done waiting, all aboard, or vehicle broken
    if (alive _driver) then 
    {
     //   diag_log format ["## DriverXFill: All XFill contacted units aboard. Heading out!"];
        _driver forceSpeed -1; // returns to normal behaviour
        _drvVar set [2,"TRUE"];
        _driver setVariable ["FuMS_XFILL", _drvVar, false];
        (group _driver) setCurrentWaypoint _wp2;
        // and tell units that did not get loaded to evaconfoot
        {
            if (alive _x) then
            {
                private ["_var"];
                _var = _x getVariable "FuMS_XFILL";
                _var set [2, "EVACONFOOT"];
                _x setVariable ["FuMS_XFILL", _var, false];
            };
        }foreach _xfillList;
    };
};
