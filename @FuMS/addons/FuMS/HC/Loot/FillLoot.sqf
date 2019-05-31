//FillLoot.sqf
// Horbin
// 1/8/15
// updated 4/19/15 to support Scatter loot options.
// FillLoot is ONLY called by LootData.sqf from the applicable theme folder!
// INPUTS: Loot Option, position (x,y,y(ARRAY) OR a veh object(OBJECT)), and LootData to parse!.
// Outputs: box item, if created.
// ASSERT Global Variable BaseLoot.sqf have been defined!

private ["_extraMoney","_pickLootPos","_lootOption","_pos","_options","_typeLoot","_boxtype","_box","_weapons","_magazines","_items","_backpacks","_found","_isVehicle",
"_item","_number","_lootData","_randomLootData","_themeIndex","_fakeBox"];
_lootOption = toupper (_this select 0);
_pos = _this select 1;
_themeIndex = _this select 2;
_extraMoney = 1000;

//diag_log format ["<FuMS> FillLoot: Launch parameters:  _lootOption:%1 | _pos:%2 | _themeIndex:%3",_lootOption,_pos,_themeIndex];


if (((FuMS_THEMEDATA select _themeIndex) select 0) select 3) then
{
   _lootData = FuMS_LOOTDATA select FuMS_GlobalDataIndex;   
}else
{
   _lootData = FuMS_LOOTDATA select _themeIndex;      
};
if (isNil "_lootData") exitWith
{
    diag_log format ["<FuMS> FillLoot: ERROR: no theme specific LootData.sqf for theme #%1",_themeIndex];
    diag_log format ["<FuMS> Check options in ThemeData.sqf for theme %1",((FuMS_THEMEDATA select _themeIndex) select 0) select 0];
};

_isVehicle = false;
if ( (TypeName _pos) == "OBJECT") then
{
    // ASSERT value passed is a vehicle object!
    _isVehicle = true;
};
_box = objNull;
//diag_log format ["## FillLoot: _lootOption:%1 _pos:%2 LOOTDATA index:%3",_lootOption, _pos, _this select 2];
if (_lootOption != "NONE") then
{   
    if (_lootOption == "RANDOM") then
    {      
        _count = 0;
        _randomLootData = [];
        while{true} do
        {  
            _count = _count + 1;
            if (_count > 1000) exitWith
            {
                diag_log format ["<FuMS> FillLoot: Error in GlobalLootData, or LootData file being used by a mission!"];
                diag_log format ["<FuMS> FillLoot: No loot description containing ""RANDOM"" configuration option (option 3)"];
                diag_log format ["<FuMS> FillLoot: but random loot was called for by the mission file."];
                diag_log format ["<FuMS> FillLoot: Ensure ""Random"" is added to atleast one loot description."];
            };
            _randomLootData = _lootData call BIS_fnc_selectRandom;
            _options = _randomLootData select 0;  // grab the 1st block of data from the loot.
            _notRandom = _options select 2;
            if (isNil "_notRandom") exitwith {};  
            if (toupper _notRandom == "RANDOM") exitwith{};
        };
        _lootOption = (_randomLootData select 0) select 0;
    };   
    // lootOption determined. Either 'Scatter', what was specified, or randomly selected.
    // need to verify the 'specified' is valid...so checking still required.
    // Now going to search all of the LootData file for a match for '_lootOption'
    _found = false;
    {
        _options = _x select 0; // _options : "LootSetName", "BoxforLoot", "randomization"
        _typeLoot = toupper (_options select 0);
        _boxtype = toupper (_options select 1); 
        if (_typeLoot == _lootOption) then  // Found lootOption in the list of LOOTDATA!
        {
            // check boxtype for "RANDOM" if so select from the global random options in BasicLoot.sqf       
          //  diag_log format ["## FillLoot: _typeLoot:%1, _lootOption:%2 _boxtype:%3",_typeLoot, _lootOption, _boxtype];
            if (_boxtype == "RANDOM" ) then { _boxtype = call FuMS_fnc_HC_Loot_GetBox;};
            //diag_log format ["## FillLoot: _typeLoot:%1, _lootOption:%2 _boxtype:%3",_typeLoot, _lootOption, _boxtype];
            _found = true;
            _weapons = _x select 1;
            _magazines = _x select 2;
            _items = _x select 3;
            _backpacks = _x select 4;
			if ((count _x) == 6) then {_extraMoney = _x select 5;};
			//diag_log format ["## FillLoot: _extraMoney:%1 | COUNT:%2",_extraMoney,(count _x)];

            if (_isVehicle or _typeLoot == "SCATTER" or _boxtype =="SCATTER") then {_box = _pos;} // _pos contains a vehicle Object! or we are going to scatter loot.
            else 
            {         
                // build a box and set up its smoke.
				//diag_log format ["<FuMS> FillLoot: Array before logic.  Chose:%1",_pos];				

				//if (typeName (_pos select 0) == "ARRAY") then
				
				_isArray = (_pos select 0) isEqualType [];
				if (_isArray) then
				{
					_pickLootPos = selectRandom _pos;
					//diag_log format ["<FuMS> FillLoot: Array found for loot pos.  Chose:%1",_pickLootPos];
					_pos = _pickLootPos;
					// _pos = [_eCenter, _pickLootPos] call FuMS_fnc_HC_MsnCtrl_Util_XPos;

				};
				
				
				
				
               // if (count _pos ==2) then //offset being used so find something nearby that is Safe.
              //  {
               //     _pos = [_pos, 0, 30, 1,0, 8,0,[],[]] call BIS_fnc_findSafePos; // 1m clear, terraingradient 8 pretty hilly
              //  }; //else leave the 3d solution because person making the mission knows what they are doing!
				//diag_log format ["<FuMS> FillLoot : Creating %1 at %2 with option %3",_boxtype, _pos, _typeLoot];
				/*
				if (_boxtype == "Exile_PopTabs") then
				{
					_box = createVehicle ["Supply500", _pos,[],0,"NONE"];
					_fakeBox = "Exile_PopTabs" createVehicle [0,0,0];
					_fakeBox setVariable ["ExileMoney",25000,true];
					_fakeBox attachTo [_box, [0,0,0]];
					//deletes _fakeBox
					_box addEventHandler ["Deleted", 
					{
						{
							detach _x, 
							deleteVehicle _x;
						} 
						forEach attachedObjects (_this select 0);
					}];					
				}else
				{*/
					_box = createVehicle [_boxtype, _pos,[],0,"NONE"];
				//};
                if (FuMS_LootSmoke ) then
                { 
                         // FuMS_SmokeProximity = _dat select 1;
                         // FuMS_SmokeColors = _dat select 2;
                         //FuMS_SmokeDuration = _dat select 3;
              //      diag_log format ["##FillLoot: SmokeBox Proximity:%1 Dur:%2 minutes Colors:%3",FuMS_SmokeProximity, FuMS_SmokeDuration, FuMS_SmokeColors];
                    [_box] spawn
                    {
                        private ["_box","_smoke01","_smokeStopTIme","_smokeOn","_color","_done","_entities"];
                        _box = _this select 0;                                             
                        _done = false;
                        _smokeOn = false;
                        while {!isNil "_box"} do
                        {
                            //if (FuMS_SmokeProximity ==0) then {_smokeOn=true;FuMS_SmokeProximity=2000;_smokeStopTime = time+60*FuMS_SmokeDuration;};
                            while {!_smokeOn} do
                            {
                                if (isNil "_box") exitwith {};    
                                if (isNull _box) exitwith {}; 
                                _entities = _box nearEntities FuMS_SmokeProximity;
                                if (count _entities > 0) then
                                {
                                    {
                                        if (isPlayer _x) exitwith
                                        {
                                            _smokeOn = true;
                                            _smokeStopTime = time+60*FuMS_SmokeDuration;
                                        };   
                                    }foreach _entities;
                                };
                                sleep 5;
                            };
                            while {_smokeOn and !isNil "_box"} do
                            {                               
                                {   
                                    _color = "";
                                    _x = toupper _x;
                                    if (_x != "WHITE") then
                                    {
                                        if (_x == "RED" or _x=="GREEN" or _x=="YELLOW" or _x=="ORANGE" or _x=="PURPLE" or _x=="BLUE") then {_color=_x;};
                                    };
                                    _smoke01 = (format ["SmokeShell%1",_color] )createVehicle (getPos _box);    
                                }foreach FuMS_SmokeColors;                                                              
                                uisleep 30;                                
                                if (time>_smokeStopTime) exitWith {_smokeOn = false;_done=true;};                        
                            };
                            if (_done) exitwith {};
                        };
                        deleteVehicle _smoke01;                     
                    };
                    //End of Smoke spawn for box ------
                    
                };
                clearWeaponCargoGlobal _box;
                clearMagazineCargoGlobal _box;
                clearItemCargoGlobal _box;              
            };
            // box complete, now ready to fill box, vehicle, or scatter loot!
            private ["_numItems","_lootCounter"];
            _numItems = 0;
            //diag_log format ["<FuMS> FillLoot: Filling %1 with loot!",_box];
            _weaponsAdded = [];
            {                
               // diag_log format ["<FuMS> FillLoot: Weapons: _x:%1, _x[0]:%2, _x[1]:%3", _x, _x select 0, _x select 1];
                // _x[0] = "weapon name" or 'array of weapon names'
                // _x[1] = quantity to add.				
				_number = [_x select 1] call FuMS_fnc_HC_Loot_GetQuantity;
				for [{_lootCounter=0}, {_lootCounter<_number}, {_lootCounter=_lootCounter+1}] do
				{				
					if (TypeName (_x select 0) == "ARRAY") then
					{
						_item = (_x select 0) call BIS_fnc_selectRandom;
					}else
					{  
						_item = (_x select 0);
					};
					if (_typeLoot == "SCATTER" or _boxtype == "SCATTER") then
					{
						// pos is either 3dloc, 2d offset, or a vehicle object.
						[_pos, _item, 1,"WEAPON"] spawn FuMS_fnc_HC_Loot_Scatter;
					}
					else
					{
					//        diag_log format ["<FuMS> FillLoot: Adding %1 %2 to %3",_number, _item, _box];
						if (_number > 0 ) then {_box addWeaponCargoglobal [_item, 1]; };    
						_weaponsAdded = _weaponsAdded + [_item];						
					};			
				};
				
                _numItems = _numItems + _number;

            }foreach _weapons;
            
            
            //Magazines
            {
               // diag_log format ["<FuMS> FillLoot: Magazines: _x:%1 _x[0]:%2 _x[1]:%3", _x, _x select 0, _x select 1];	   
				_number = [_x select 1] call FuMS_fnc_HC_Loot_GetQuantity;
				for [{_lootCounter=0}, {_lootCounter<_number}, {_lootCounter=_lootCounter+1}] do
				{
					if (TypeName (_x select 0) == "ARRAY") then
					{
						_item = ((_x select 0) call BIS_fnc_selectRandom);
					}else
					{  
						_item = (_x select 0);
					};					
					// special case 'FuMS_AmmoForEach' defined. So add clips for each weapon that has been added!
					if (_item == "FuMS_AmmoForEach") then
					{
						{
							// get the proper type of magazine for weapon 'x'
							_item = ((getArray (configFile >> "CfgWeapons" >> _x >> "magazines")) call BIS_fnc_selectRandom);
							// Add the proper number of clips to the right locations
							if (_typeLoot == "SCATTER" or _boxtype == "SCATTER") then
							{
								[_pos, _item, 1, "MAGAZINE"] spawn FuMS_fnc_HC_Loot_Scatter;
							}else
							{
								//     diag_log format ["<FuMS> FillLoot: Adding %1 %2 to %3",_number, _item, _box];
								_box addMagazineCargoglobal [_item, 1];   
							};
							_numItems = _numItems + 1;                                                
						}foreach _weaponsAdded;
					}else
					// no special case, so add the clip that is defined.
					{
						if (_typeLoot == "SCATTER" or _boxtype == "SCATTER") then
						{
							[_pos, _item, 1, "MAGAZINE"] spawn FuMS_fnc_HC_Loot_Scatter;
						}else
						{
							//     diag_log format ["<FuMS> FillLoot: Adding %1 %2 to %3",_number, _item, _box];
							_box addMagazineCargoglobal [_item, 1];   
						};
					    _numItems = _numItems + 1;
					
					};
				};	

                
            }foreach _magazines;
            
            // Normal Items
            {
                //diag_log format ["<FuMS> FillLoot: Items: _x:%1  _x[0]:%2  _x[1]:%3", _x, _x select 0, _x select 1];
				_number = [_x select 1] call FuMS_fnc_HC_Loot_GetQuantity;
				for [{_lootCounter=0}, {_lootCounter<_number}, {_lootCounter=_lootCounter+1}] do
				{
					if (TypeName (_x select 0) == "ARRAY") then
					{
						_item = (_x select 0) call BIS_fnc_selectRandom;
					}else
					{ 
						_item = (_x select 0);
					};

					if (_typeLoot == "SCATTER" or _boxtype=="SCATTER") then
					{
						[_pos, _item, 1, "ITEM"] spawn FuMS_fnc_HC_Loot_Scatter;       
					}else
					{       
						//diag_log format ["<FuMS> FillLoot (Items): (Loop %1) Adding %2 to %3",_lootCounter, _item, _box];
						_box addItemCargoglobal [_item, 1]; 
					};
				};
				
				
				
                _numItems = _numItems + _number;
            }foreach _items;
            
            //Backpacks
            {
                //diag_log format ["<FuMS> FillLoot: Backpacks: _x:%1 _x[0]:%2 _x[1]:%3", _x, _x select 0, _x select 1];

				_number = [_x select 1] call FuMS_fnc_HC_Loot_GetQuantity;
				for [{_lootCounter=0}, {_lootCounter<_number}, {_lootCounter=_lootCounter+1}] do
				{			
					if (TypeName (_x select 0) == "ARRAY") then
					{
						_item = (_x select 0) call BIS_fnc_selectRandom;
					}else{  _item = (_x select 0);};
					if (_typeLoot == "SCATTER" or _boxtype=="SCATTER") then
					{
						 [_pos, _item, 1, "BACKPACK"] spawn FuMS_fnc_HC_Loot_Scatter;
					}else
					{
						//diag_log format ["<FuMS> FillLoot (Backpacks): (Loop %1) Adding %2 to %3",_lootCounter, _item, _box];
						_box addBackpackCargoglobal [_item, 1]; 
					};
				
				};
                _numItems = _numItems + _number;
            }foreach _backpacks;
            
           // Add Poptabs to mission create (Minimum 500 + up to another 1000.  Adjust to your liking)
			   if (_typeLoot == "SCATTER" or _boxtype=="SCATTER") then
			   {
			   }else
			   {   
				   private "_amount";
				   _amount = 500 + floor (random _extraMoney); //Adds 500 poptabs + up to (_extraMoney) more to the box/container/crate referred to as "_box" 
		         //diag_log format ["<FuMS> FillLoot: Adding %1 poptabs %3",_amount, _box];
				   _box setVariable ["ExileMoney", _amount, true]; 
			   };
            
            //initialize FuMSLoot variable
           if (!(TypeName _box == "ARRAY")) then { _box setVariable ["FuMS_Loot", [0, _numItems], true];            };
		   // diag_log format ["<FuMS> FillLoot: %1 items added to %2",_numItems, _box];
           // private ["_packs","_ammo","_items","_weapons","_lootItems","_actualNumItems"];
            if (TypeName _box != "ARRAY") then
            {
                _packs = getBackpackCargo _box;
                _ammo = getmagazineCargo _box;
                _items = getItemCargo _box;
                _weapons = getWeaponCargo _box;
                _lootItems = [[_packs],[_ammo],[_items],[_weapons]];
                _actualNumItems = 0;
                // diag_log format ["_lootItems = %1",_lootItems];
                {
                    //  diag_log format ["category = %1",_x];
                    {
                        //    diag_log format ["quantity = %1",_x];
                        {
                            //       diag_log format ["scalar = %1",_x];
                            _actualNumItems = _actualNumItems + _x;
                        }foreach (_x select 1); // [5,10]]
                    }foreach _x; // [["5ItemsType1","10ItemsType2"],[5,10]]
                }foreach _lootItems; 
             //   diag_log format ["<FuMS> FillLoot: %1 has %2 items (verified)",_box, _actualNumItems];
            };
        };   
    }foreach _lootData;
    if (!_found) then
    {
        diag_log format ["*******************************************************"];
        diag_log format ["*****FillLoot: Error! Loot option %1 in Theme Index #%2 not found!", _lootOption, _this select 2];
        diag_log format ["*******************************************************"];
       // make an empty box and put it at 0 on the map since it isn't defined!
         if (_isVehicle) then {_box = _pos;}// _pos contains a vehicle Object!
        else
        {
            _box = createVehicle ["box_nato_ammoveh_f", [0,0,0],[],0,"NONE"];                                
            clearWeaponCargoGlobal _box;
            clearMagazineCargoGlobal _box;
            clearItemCargoGlobal _box;        
        };
    };
};
if (TypeName _box == "ARRAY") then {_box = objNull;};
_box




