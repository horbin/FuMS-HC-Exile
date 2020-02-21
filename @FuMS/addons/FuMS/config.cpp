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
	class CAMS
	{
		class functions
		{
			file = "FuMS\CAMS\functions";
			class loadCart {};
			class preInit
				{
					preInit = 1;
				};
		};
	};
	
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
