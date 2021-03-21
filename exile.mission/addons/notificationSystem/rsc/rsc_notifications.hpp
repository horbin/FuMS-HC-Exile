/*
	Code written by Haz
*/

#define CT_STATIC 0

class RscText
{
	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	fixedWidth = 0;
	sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	colorText[] = {1, 1, 1, 1};
	colorShadow[] = {0, 0, 0, 0.5};
	colorBackground[] = {0, 0, 0, 0};
	tooltipColorText[] = {1, 1, 1, 1};
	tooltipColorBox[] = {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.65};
	font = "RobotoCondensed";
	shadow = 1;
	lineSpacing = 1;
};

class rsc_notifications
{
	idd = 12345;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['disp_notifications', param [0]];";
	onUnLoad = "uiNamespace setVariable ['disp_notifications', nil];";
	duration = 1e011;
	fadeIn = 0;
	fadeOut = 0;
	class controls
	{
		class notificationsInQueue : RscText
		{
			idc = 10;
			x = 0 * safezoneW + safezoneX;
			y = 0.98 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.02 * safezoneH;
			text = "";
		};
	};
};