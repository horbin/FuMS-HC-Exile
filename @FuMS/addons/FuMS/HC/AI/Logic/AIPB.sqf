//AI_PB.sqf
//Horbin
// 1/21/15
// This script designed to be called by a SCRIPTED waypoint.
//Inputs:
//  0: _group
//  1: searchPosition
// 2: _timeToSearch: amount of time (in seconds) to search before exiting script. :0=forever
// 3: _searchRadius: (meters) area AI will search through :0=100m as default
// 
// [_group, searchPos, searchTime, searchRadius]
// Script is suspeneded while a unit is in a vehicle. Once unit is out, pattern starts.
// When script exits group will resume travel to its next waypoint!
private ["_group","_unitcount","_unitHandle"];
_group = _this select 0;
if (count (_this select 1) != 2) exitWith {diag_log format ["##AI_PB: 'Buildings' Received %1, expecting 2 paramaters. Exiting!!!",count (_this select 1)];};
_unitcount = 0;
_unitHandle = [];
{
    private ["_tmpHandle"];
 //   diag_log format ["##AI_PB: Starting for %1 with %2",_x,_this select 1];    
    // *******Start SPAWN CODE ***********
    _tmpHandle = [_x, _this select 1] spawn
    {
        private ["_unit","_searchPos","_timer","_radius","_forever","_params","_searchComplete","_curPos","_buildingList","_endTime","_xfillStatus"];        
        _unit = _this select 0;
        _params = _this select 1;
        _searchPos = _params select 0;
        _searchPos set [2,0];  // doing distance check on x/y plane only!
       // _timer = _params select 1;
        _timer = 100000;
        _radius = _params select 1;
  //      diag_log format ["##AI_PB: SPAWN Starting for %1 at %2",_unit, _searchPos];
        if (_timer ==0) then { _forever = true;}else{_forever=false;};
        if (_radius ==0) then {_radius = 200;};
        _searchComplete = false;
        _xfillStatus = [0,0," ",0];       
        waitUntil{sleep 5; (vehicle _unit == _unit or !alive _unit)}; //unit on foot 
        if (alive _unit) then
        {
   //         diag_log format ["##AI_PB: %1 is now on foot.",_unit];
            // now unit on foot, if not near search loc, start marching there!
            _curPos = getPos _unit;
            _curPos set [2, 0]; // only do 2D distance.
            
     //       diag_log format ["##AI_PB: %1 moving to search location %2",_unit, _searchPos];   
            _unit forceSpeed 13;
            _unit doMove _searchPos;
            waitUntil{sleep 1; (unitReady _unit || _unit distance _searchPos < 25)};   
        };
        if (alive _unit) then
        {
            //ASSERT: Unit is at searchPos
            _buildingList = nearestObjects [ _unit, ["house"], _radius];
            _endTime = time + _timer;
            if(  (count _buildingList)==0) then
            {
                private ["_nearest"];
                _nearest = nearestBuilding _unit;
                
                diag_log format ["##AI_PB :%2 No building found within %5m radius.  %1(%4) is the nearest at %3 meters!!!",_nearest,_unit, _unit distance _nearest, _unit getVariable "FuMS_MSNTAG", _radius];
                _buildingList = [_nearest];
                //_searchComplete = true;
            };  
        };
        while {alive _unit and !_searchComplete} do
        {
            private ["_curBuilding","_bPoss","_i2"];
    //         diag_log format ["####AI_PB: %2 Located %1 buildings to explore for next %3 seconds",count _buildingList, _unit, _timer];     
            if(isNull(_unit findNearestEnemy _unit))then
            {
                _unit forceSpeed 1;
                _unit setBehaviour "SAFE";
                // _unit action ["handGunOff", _unit];
            };
            _curBuilding = _buildingList call BIS_fnc_selectRandom;
            // **move to the building
             //diag_log format ["####AI_PB:%2: Exploring %1",_curBuilding, _unit];
            _bPoss = [];
            //diag_log format ["##AI_PB: _curBuilding %1", _curBuilding];
            _bPoss = [_curBuilding] call FuMS_fnc_HC_Util_GetBuildingPositions;
    //        diag_log format ["####AI_PB:%3: Located %1 points to explore: %2",count _bPoss, _bPoss,_unit];
            _i2 = 0;
            // Move around inside the building!
            while{_i2 < (count _bPoss)}do
            {
                private ["_endpostime","_newPos","_lastPos","_lastPosTime"];
                _newPos = _bPoss select _i2;
                _unit doMove _newPos;
                //diag_log format ["####A_PB: %4:Moving to position %1 of %3 in bldg:%2.",_newPos,_curBuilding,count _bPoss, _unit];
                _endpostime = time + 120; // if time > _starttime+120 may indicate AI attempting to 
                //  get to a point that is blocked, so advance to next point.
                _lastPos = _newPos;
                _lastPosTime = time;
                waitUntil
                {   
                    sleep 1; 
                    _xfillStatus = _unit getVariable "FuMS_XFILL";
                    if (!isNil "_xfillStatus") then
                    {
                        if ( _xfillStatus select 2 == "EVAC" ) then{ _forever=false; _endTime = 0;};
                        if (    (( getPos _unit) distance _lastPos < 1) and time > _lastPosTime+10) then //unit been in same spot for 10seconds
                        {
                            private ["_list"];
                            if(isNull(_unit findNearestEnemy _unit))then // and unit not in combat.
                            {
                                _list = _unit nearRoads 10; //unit stuck, teleport him back to the road
                                _unit moveTo (getPos (_list select 0) );
                                _i2 = count _bPoss;
                            };
                        };                    
                    };
                    (  unitReady _unit         || _unit distance _newPos < 1.5 || time > _endpostime || (time > _endTime and !_forever) )
                };
                if (time < _endTIme) then {sleep random 5; _i2=_i2+1;}
                else { _searchComplete = true; _i2 = count _bPoss;};
            };
            //Unit has completed exploration of _curBuilding, select the next one.
        };
        if (alive _unit) then
        {
            //diag_log format ["####AI_PB:  %1, search complete, moving to %2",_unit];   
            _unit setBehaviour "COMBAT";
            _unit forceSpeed 13;   
        };
    }; 
    //******END OF SPAWN CODE   
    _unitHandle set [_unitcount, _tmpHandle];
    _unitcount = _unitcount +1;
}foreach (units _group);
// all group member's scripts have completed.
{
    waitUntil { scriptDone _x};
  //  diag_log format ["####AI_PB: %1 completed script!",_x];
}foreach _unitHandle;


	
	
	
	
	
	
	