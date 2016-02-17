//TowerGuard.sqf
//Horbin
// 5/1/15
//
// Inspiration from 
/*
Name: Rooftop Static Weapons Script
	Author: MisterGoodson (aka Goodson)
	Version: 1.0
	
*/
// Inputs: 
//   Origin: Center of area to search
//   Radius: radius from 'Origin' to search
//(optional)   SpecBuilding: specific building to be occupied.
//
// Behaviour:
// Script will search 'AREA' for all enter-able buildings. 
// highest point of all buildings in the area are located.
// if "Specific" building is provided, the list will be filtered to only buildings matching this name and the closest to the 'Origin' will be selected.
// AI will be spawned at the top of these buildings and remain there.
// IF an unoccupied static weapon is located within 5m's of the spawn point, the AI will occupy the static weapon.

// Get arguments
private ["_group","_actionLoc","_patternOptions","_radius","_specBuilding","_area","_legalRooftops","_rooftopPositionsUsed","_debug","_buildings","_units","_tactic","_numToAdd"];
_group = _this select 0; // group to be placed
_actionLoc= _this select 1; //3D point already processed by FuMS.
_patternOptions = _this select 2;
_radius= _patternOptions select 0; // search radius in meters
_specBuilding = _patternOptions select 1; // specific building name to occupy.
_tactic = _patternOptions select 2; // StandGround, or Manuver

_tactic = "StandGround";
// Using moveto is not working to return AI to their locations inside buildings, so this script will force all AI to hold their guard position, unless and XFILL is called

if (isNil "_specBuilding") then {_specBuilding = "ANY";};

//_area = getMarkerSize _marker; // Get area under marker
_area = [_radius,_radius];
_legalRooftops = [];
_rooftopPositionsUsed = [];
_debug = false;


// Define weapon placement types
//_light = ["RDS_DSHKM_CSAT", "RDS_KORD_high_CSAT"];
//_medium = ["RDS_SPG9_CSAT", "RDS_Metis_CSAT"];
//_heavy = ["RDS_Igla_AA_pod_CSAT", "RDS_ZU23_CSAT"];

_buildings = nearestObjects [_actionLoc, ["house"], (_area select 0)];


//diag_log format["<FuMS> TowerGuard: Buildings found: %1:%2", count(_buildings), _buildings];

{
    if (typeOf _x == _specBuilding or _specBuilding == "ANY") then
    {
        private ["_buildingPositions","_isHighPoint","_buildingPositionASL","_isObstructedX","_isObstructedY","_isObstructedZ","_highestPos"];
        //diag_log format ["<FuMS> TowerGuard: Looking at building : %1",typeOf _x];
        
        //	_buildingPositions = [_x] call BIS_fnc_buildingPositions;
        _buildingPositions = [_x] call FuMS_fnc_HC_Util_GetBuildingPositions;
        if ((count _buildingPositions) > 0) then 
        {		
            _highestPos = _buildingPositions select 0;
            {         
                if (_x select 2 > _highestPos select 2) then
                {
                    _highestPos = _x;
                };                              
            } forEach _buildingPositions;
            _legalRooftops = _legalRooftops + [_highestPos];
            
            if (_debug) then 
            {
                private ["_dummy","_dummyX","_dummyY","_debugMarker"];                
                _debugMarker = createMarker [str(_x), _x];
                _debugMarker setMarkerShape "ICON";
                _debugMarker setMarkerType "mil_dot";
                _debugMarker setMarkerColor "ColorRed";
            };
        };
    };
} forEach _buildings;

// Exit if no legal rooftops found
if ((count _legalRooftops) < 1) exitWith {diag_log format ["<FuMS> Towerguard: No valid spawn locations found near %1 radius:%2",_actionLoc, _radius];};


//diag_log format["<FuMS> TowerGuard: Viable high points founds: %1:%2", count(_legalRooftops), _legalRooftops];

// If the number of rooftops is less than then number of AI in the group, then take non-rooftop positions from list of available buildings
_numToAdd = count (units _group) - count _legalRooftops;
//diag_log format["<FuMS> TowerGuard: Number of AI to place: %1, finding %2 additional locations.", count (units _group), _numToAdd];
if (_numToAdd > 0) then
{
    private ["_i","_bps","_buildingList"];
    // filter building list to specific requested
    if (_specBuilding == "ANY") then
    {
        _buildingList = _buildings;
    }else
    {
        _buildingList = [];
        {
            if (typeOf _x == _specBuilding) then {_buildingList = _buildingList + [_x];};
        }foreach _buildings;
    };
    if (count _buildingList > 0) then
    {
        for [{_i=0;},{_i < _numToAdd;},{_i=_i+1;}] do
        {
            _bps = [_buildingList call BIS_fnc_selectRandom] call FuMS_fnc_HC_Util_GetBuildingPositions;
            _legalRooftops = _legalRooftops + [_bps call BIS_fnc_selectRandom];
        };
    };
};

_units = units _group;
{
    private ["_rooftopPos"];
	// Select a legal rooftop at random
	_rooftopPos = _legalRooftops call BIS_fnc_selectRandom;
	
	if (_rooftopPos in _rooftopPositionsUsed) then 
	{
		// Keep selecting rooftop positions at until an unused one has been found
		// If no unused positions can be found, skip placement of the AI
		for "_x" from 0 to ((count _legalRooftops) - 1) do 
		{
			_rooftopPos = _legalRooftops select _x;
			if !(_rooftopPos in _rooftopPositionsUsed) exitWith {};
		};
	};
	
	if !(_rooftopPos in _rooftopPositionsUsed) then 
	{
		_rooftopPositionsUsed = _rooftopPositionsUsed + [_rooftopPos];
	
      //  diag_log format ["<FuMS> TowerGuard: Moving %1 to %2",_x,_rooftopPos];
		_x setPosATL _rooftopPos;
        
        [_x, _rooftopPos, _tactic] spawn
        {
            private ["_unit","_rooftopPos","_xfillStatus","_outofPosition","_tactic","_debugMarker","_debug"];
            _unit = _this select 0;
            _rooftopPos = _this select 1;
            _tactic = toupper (_this select 2);
            //_unit disableAI "MOVE";
            _unit forceSpeed 0;
            _outofPosition = false;
            _debug = false;
            
            if (_debug) then 
            {              
                _debugMarker = createMarker [str(_unit), (getPosATL _unit)];
                _debugMarker setMarkerShape "ICON";
                _debugMarker setMarkerType "mil_dot";
                _debugMarker setMarkerColor "ColorGreen";
            };
            
            while {alive _unit} do
            {
               // _debugMarker setMarkerPos (getPosATL _unit);
                
                if (!isNull (_unit findNearestEnemy _unit) and _tactic == "MANUVER") then
                {
                    _unit forceSpeed -1; // return to normal speed to allow AI to chase after Enemies
                    _outofPosition = true;
                };
                if (isNull (_unit findNearestEnemy _unit) and _outofPosition) then
                {
                    waitUntil
                    { 
                        _unit doMove _rooftopPos;
                      //  _debugMarker setMarkerPos _unit;
                        (unitReady _unit or !alive _unit)
                    };
                    _unit forceSpeed 0;
                    _outofPosition = false;
                    diag_log format ["<FuMS> TowerGuard: %1 returned to its guard position of %2: actual pos:%3",_unit, _rooftopPos, getPosATL _unit];      
                };
                _xfillStatus = _unit getVariable "FuMS_XFILL";
                if (!isNil "_xfillStatus") then
                {
                    // if this is set, AI will be provided logic to navigate to the vehicle calling for the XFILL, so exit this logic.
                    if (_xfillStatus select 2 == "EVAC") exitWith {_unit forceSpeed 13;};                  
                };
               // _unit doMove _rooftopPos;                
                sleep 2;
            };
           // diag_log format ["<FuMS> TowerGuard: Logic terminated for %1.",_unit];
        };	
	};
}foreach _units;


