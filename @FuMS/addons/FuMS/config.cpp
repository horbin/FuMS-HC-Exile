class CfgPatches 
{
	class FuMS
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		fileName = "FuMS.pbo";
		author[]= {"Horbin"}; 
	};
};

class CfgFunctions
{
	class FuMS
	{
		class FuMS_Server
		{
			file = "FuMS";
			
			class FuMS_init
			{
				preInit = 1;
			};
		};
	};
};
