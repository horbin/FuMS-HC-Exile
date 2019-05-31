// by ALIAS


fnc_flicker_rad = 
{
	private ["_unit","_unit_glowing"];
	_unit = _this select 0;
	if !(isPlayer _unit) then 
	{
	_unit setVariable ["glowing_unit",true,true];
	//hint str (_unit getvariable "glowing_unit");
	_unit setObjectMaterial [0, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"]; 
	(backpackContainer _unit) setObjectMaterial [0, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];
	sleep timetoglow;
	_unit setVariable ["glowing_unit",nil,true];
	_unit setObjectMaterial [0,"\a3\data_f\default.rvmat"]; 
	(backpackContainer _unit) setObjectMaterial [0,"\a3\data_f\default.rvmat"];	
	};
};

private ["_rad_obj","_list_ai_in_range","_rad_radius_obj"];

if (!hasInterface) exitWith {};

_rad_obj = _this select 0;
_rad_radius_obj = _this select 1;

while {!isNull _rad_obj} do 
{
	if (sunOrMoon==0) then 
	{
		_list_ai_in_range = (position _rad_obj) nearEntities ["Man",_rad_radius_obj];		
		if (count _list_ai_in_range>0) then 
		{
			if (isNil {_x getVariable "glowing_unit"}) then 
			{
				{[_x] spawn fnc_flicker_rad} forEach _list_ai_in_range
			};
		};
	};
	sleep 2;
};
