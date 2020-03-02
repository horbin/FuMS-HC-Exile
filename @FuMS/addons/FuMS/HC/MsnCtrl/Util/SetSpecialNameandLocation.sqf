//SetSpecialNameandLocation.sqf
// Horbin
// 3/1/15
// Inputs: current selected mission position
//			mission info array containing mission name and/or special location 
//			mission override name
// Outputs: position and override name for the encounter
// if a position is included with the mission file name, use this FIXED position for the encounter!
//  and remove any 'location' related name
private ["_pos","_mission","_missionNameOverride","_missionFileName"];
_pos = _this select 0;
_mission = _this select 1;
_missionNameOverride = _this select 2;
//diag_log format ["##SetSpecialNameandLocation: _mission:%1",_mission];
if (TypeName _mission == "ARRAY") then
{
    if (count _mission > 1) then
    {                              
        if (TypeName (_mission select 1) == "ARRAY") then // mission is of format [["MissionName",[Location]]
        {
            _pos = _mission select 1;
            _missionNameOverride = "";
			_missionFileName = _mission select 0;
        };
        if (TypeName (_mission select 1) == "STRING") then // mission is of format [["MissionName","Location"]]
        {        
			private ["_name","_curLoc","_target"];
			_curLoc = (_mission select 1);
			if (_curLoc == "Villages") then
			{
				_target = selectRandom FuMS_VillageList;
				_name = (text _target);
				_pos = locationPosition _target;
				_missionNameOverride = _name;
				_missionFileName = _mission select 0;
			};
			if (_curLoc == "Cities") then
			{
				_target = selectRandom FuMS_CityList;
				_name = (text _target);
				_pos = locationPosition _target;
				_missionNameOverride = _name;
				_missionFileName = _mission select 0;
			};
			if (_curLoc == "Capitals") then
			{
				_target = selectRandom FuMS_CapitalList;
				_name = (text _target);
				_pos = locationPosition _target;
				_missionNameOverride = _name;
				_missionFileName = _mission select 0;
			};
			if (_curLoc == "Marine") then
			{
				_target = selectRandom FuMS_MarineList;
				_name = (text _target);
				_pos = locationPosition _target;
				_missionNameOverride = _name;
				_missionFileName = _mission select 0;
			};
			// check individual city names as last resort!
			{
				_name = (text _x);
				if (_curLoc == _name) then
				{					
                    _pos = locationPosition _x;
                    _missionNameOverride = _name;
					_missionFileName = _mission select 0;	
				};
			}foreach FuMS_DefinedMapLocations;             

			//diag_log format ["##SetSpecialNameandLocation: _pos:%1 _name:%2",_pos,_missionNameOverride];
        };
    }else{_missionFileName = _mission select 0;};  // mission is of format [["MissionName"]]
} else {_missionFileName = _mission;}; // mission is of format ["MissionName"]
[_pos, _missionNameOverride, _missionFileName]              