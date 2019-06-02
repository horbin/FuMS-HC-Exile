// by ALIAS
// Sparky DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons

private ["_mark_orig"];

if (!isServer) exitWith {};

_mark_orig = _this select 0;
_protection_gear_spark = _this select 1;
_AI_see_spark= _this select 2;

if (isNil "_protection_gear_spark") exitWith {hint "You haven't defined a protectiv device!!!"};
obj_prot_sparky = _protection_gear_spark;
publicVariable "obj_prot_sparky";

//poz_curr=[0,0,0];
spark_fired = false;
publicVariable "spark_fired";

[[_mark_orig],"AL_spark\al_orb_move.sqf"] remoteExec ["execVM",0,true];
if (_AI_see_spark) then {null= [_mark_orig] execvm "AL_spark\ai_avoid_spark.sqf";};


/*
while {true} do 
{
_list_units_in_range = (getMarkerPos _mark_orig) nearEntities ["Man",30];
if (count _list_units_in_range>0) then 
{
	{
	if ((headgear _x == obj_prot_sparky)or(goggles _x==obj_prot_sparky)or(uniform _x==obj_prot_sparky)or(vest _x==obj_prot_sparky)or(Backpack _x==obj_prot_sparky) or (obj_prot_sparky in (assigneditems _x + items _x))) then 
	{} 
	else
		{
		spark_fired = true; publicVariable "spark_fired";
		_damage_ante = getDammage _x;
		_x setDamage [_damage_ante+0.2, true];
		};
	sleep 2;
	spark_fired = false; publicVariable "spark_fired";
	} foreach _list_units_in_range;
};
sleep 3;
};

/*
while {true} do 
{
_list_units_in_range = (poz_curr) nearEntities ["Man",20];
if (count _list_units_in_range>0) then 
{
	{
	if ((headgear _x == obj_prot_sparky)or(goggles _x==obj_prot_sparky)or(uniform _x==obj_prot_sparky)or(vest _x==obj_prot_sparky)or(Backpack _x==obj_prot_sparky) or (obj_prot_sparky in (assigneditems _x + items _x))) then 
	{} 
	else
		{
		spark_fired = true; publicVariable "spark_fired";
		_damage_ante = getDammage _x;
		_x setDamage [_damage_ante+0.2, true];
		};
	sleep 0.1;
	spark_fired = false; publicVariable "spark_fired";
	} foreach _list_units_in_range;
};
sleep 5;
};