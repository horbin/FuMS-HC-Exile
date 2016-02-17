//PullData.sqf
// Horbin
// 3/5/15
// Inputs: Theme Index, Mission Name(string)
    private ["_themeIndex","_mission","_return","_data","_indexName","_indexCode"];
    _themeIndex = _this select 0;
    _mission = toupper (_this select 1);
    _return = [];
    _data = FuMS_ListofMissions select _themeIndex;
   {
     //  diag_log format ["##PullData: _x:%1 _mission:%2 index:%3",_x,_mission,_themeIndex];
       _indexName = toupper (_x select 0);  
       _indexCode = _x select 1;    
   //    diag_log format ["##PullData: _mission:%1 _indexName:%2   :%4:_indexCode:%3",_mission,_indexName, _indexCode, TypeName _indexCode];
       
       if (_mission == _indexName and TypeName _indexCode != "STRING") exitWith{_return = _x select 1; };
   }foreach _data;
   if (count _return != 8) then
   {
       diag_log format ["*************************************************************************"];
       diag_log format ["<FuMS> PullData: ERROR!! Unable to locate %1 in FuMS_ListofMissions",_mission];
       diag_log format ["*************************************************************************"];
   };
   _return
