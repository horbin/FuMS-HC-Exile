/*
	Code written by Haz
*/

#define DEBUG_MODE getNumber (getMissionConfig "notificationSystem" >> "config_master" >> "debugMode")
#define TITLE_TEXT_COLOUR getArray (getMissionConfig "notificationSystem" >> "config_master" >> "defaultTitleTextColour")
#define TITLE_BG_COLOUR getArray (getMissionConfig "notificationSystem" >> "config_master" >> "defaultTitleBgColour")
#define MAX_SHOWN_NOTIFICATIONS getNumber (getMissionConfig "notificationSystem" >> "config_master" >> "maxNotificationsOnScreen")
#define SCREEN_POS getText (getMissionConfig "notificationSystem" >> "config_master" >> "positionOnScreen")
#define EXPAND_SHRINK_TOGGLE getNumber (getMissionConfig "notificationSystem" >> "config_master" >> "expandShrinkToggle")
#define EXPAND_SHRINK_KEY (getMissionConfig "notificationSystem" >> "config_master" >> "expandShrinkKey")
#define EXPAND_DISPLAY_TIME getNumber (getMissionConfig "notificationSystem" >> "config_master" >> "expandDisplayTime")
#define SHOW_QUEUE_COUNT getNumber (getMissionConfig "notificationSystem" >> "config_master" >> "showNotificationsQueue")