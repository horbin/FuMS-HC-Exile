params [["_per1", 13], ["_per2", 5], ["_per3", 2], ["_blacklistArea",[]]];

if (worldSize < 15) exitWith {diag_log "AbandonedRoads: WORLD SIZE IS NOT DEFINED. SKIPPING ROAD ABANDONMENT!"};

private _roads = [worldSize/2,worldSize/2] nearRoads worldSize;
private _groundClutter = ["Land_Garbage_square3_F","Land_Garbage_square5_F","Land_Garbage_line_F","MedicalGarbage_01_3x3_v2_F","MedicalGarbage_01_3x3_v1_F","MedicalGarbage_01_5x5_v1_F","MedicalGarbage_01_1x1_v3_F"];
private _extraTrash = ["Land_GarbageHeap_02_F","Land_GarbageHeap_01_F","Land_GarbageBags_F","Land_GarbagePallet_F","Land_GarbageWashingMachine_F","Land_GarbageHeap_04_F","Land_GarbageHeap_03_F","Land_Barricade_01_4m_F","Oil_Spill_F"];
private _randomWreaks = ["Land_Wreck_BMP2_F","Land_Wreck_BRDM2_F","Land_Wreck_AFV_Wheeled_01_F","Land_Wreck_HMMWV_F","Land_Wreck_Hunter_F","Land_Wreck_Car_F","Land_Wreck_Skodovka_F","Land_Wreck_Ural_F","Land_Wreck_MBT_04_F","Land_Wreck_LT_01_F","Land_Wreck_Slammer_F","Land_Wreck_Truck_F","Land_Wreck_Car2_F","Land_Tyres_F","Land_Wreck_Van_F","Land_Wreck_Truck_dropside_F","Land_Wreck_Offroad2_F"];
private _counter = 0;
private _time = diag_tickTime;
private _skipped = 0;
if (_blacklistArea isEqualTo []) then {

  {
    _dir = 360;
      _rndNum = floor random 100;
      if (_rndNum < _per1) then {
        _location = _x getRelPos [floor random 3,floor random _dir];
        _obj = [selectRandom _groundClutter, [_location select 0, _location select 1,abs (getTerrainHeightASL _location)], random 360] call BIS_fnc_createSimpleObject;
        _obj setVectorUp surfaceNormal position _obj;
        _counter = _counter + 1;
      };

      _rndNum = floor random 100;
      if (_rndNum < _per2) then {
        _location = _x getRelPos [floor random 3,floor random _dir];
        _obj = [selectRandom _extraTrash, [_location select 0, _location select 1,abs (getTerrainHeightASL _location)], random 360] call BIS_fnc_createSimpleObject;
        _obj setVectorUp surfaceNormal position _obj;
        _counter = _counter + 1;
      };

      _rndNum = floor random 100;
      if (_rndNum < _per3) then {
        _location = _x getRelPos [floor random 3,floor random _dir];
        _sel = selectRandom _randomWreaks;
        _obj = [_sel, [_location select 0, _location select 1,abs (getTerrainHeightASL _location)], random 360] call BIS_fnc_createSimpleObject;
        _obj setVectorUp surfaceNormal position _obj;
        if (_sel in ["Land_Wreck_LT_01_F","Land_Wreck_MBT_04_F","Land_Wreck_AFV_Wheeled_01_F"]) then {
            _obj setPos [getPos _obj select 0, getPos _obj select 1, getPos _obj select 2];
        };
        _counter = _counter + 1;
      };
  } forEach _roads;

}else{
  _bLRoads = [];

  {
      _pos = _x select 0;
      _range = _x select 1;
      if !((_pos isEqualto [0,0,0] && _range isEqualTo 0) || _range isEqualTo 0) then {
        _blRoads append (_pos nearRoads _range);
      };
  } forEach _blacklistArea;

  {
    _dir = 360;
    if !(_x in _blRoads) then {
      _rndNum = floor random 100;
      if (_rndNum < _per1) then {
        _location = _x getRelPos [floor random 3,floor random _dir];
        _obj = [selectRandom _groundClutter, [_location select 0, _location select 1,abs (getTerrainHeightASL _location)], random 360] call BIS_fnc_createSimpleObject;
        _obj setVectorUp surfaceNormal position _obj;
        _counter = _counter + 1;
      };

      _rndNum = floor random 100;
      if (_rndNum < _per2) then {
        _location = _x getRelPos [floor random 3,floor random _dir];
        _obj = [selectRandom _extraTrash, [_location select 0, _location select 1,abs (getTerrainHeightASL _location)], random 360] call BIS_fnc_createSimpleObject;
        _obj setVectorUp surfaceNormal position _obj;
        _counter = _counter + 1;
      };

      _rndNum = floor random 100;
      if (_rndNum < _per3) then {
        _location = _x getRelPos [floor random 3,floor random _dir];
        _sel = selectRandom _randomWreaks;
        _obj = [_sel, [_location select 0, _location select 1,abs (getTerrainHeightASL _location)], random 360] call BIS_fnc_createSimpleObject;
        _obj setVectorUp surfaceNormal position _obj;
        if (_sel in ["Land_Wreck_LT_01_F","Land_Wreck_MBT_04_F","Land_Wreck_AFV_Wheeled_01_F"]) then {
            _obj setPos [getPos _obj select 0, getPos _obj select 1, getPos _obj select 2];
        };
        _counter = _counter + 1;
      };
    }else{_skipped = _skipped + 1;};
  } forEach _roads;

};


diag_log str format["Asaayu's Abandoned Roads ----------- %1 simple objects (%4 blacklisted roads skipped) have been created around %3 in %2 seconds! -----------",_counter,(diag_tickTime - _time), toUpper worldName,_skipped];
