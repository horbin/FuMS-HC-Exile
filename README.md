#Fulcrum Mission System (FuMS)
(like the mod? please feel free to donate.  http://conroh.com/fums/
------------------------------------------------------------------------------------
---- Read the information in the Docs folder, or you are missing out!
------------------------------------------------------------------------------------
v0.3
-fixed typo in @FuMS config.cpp
-removed legacy startup code for FuMS on server
    Thank you Terd Fergasen
-fixed 'multiple building' bug in the Zombies theme.
-fixed a bug with the server FPS monitor was not properly capturing server FPS
-tweaked Heartbeat values to reduce excessive server logging of non-HC error conditions
-added code to prevent zombies from doing damage witin 200m of exile designated trader zones.
-fixed 'safe mission position spawn' code to recognize Exile Territories (only when players are near them). This should prevent
a mission from randomly spawning on top of a player's base while he is at the base.
- fixed a bug with the ProxPlayer trigger that was causing some missions to not behave correctly (specifically zombie missions ending)

+ Roadblock theme
Based upon the concept and building layout of Pato!
1. Specific to ALTIS
2. Can be modified to other maps or other locations in altis by changing the mission spawn locations in ThemeData.sqf
3. See "RoadBlock" loot in GlobalLootData.sqf for customization of loot left by the occupying soldiers.

+ Player Watch
New Theme process model called 'player watch'.
This monitors a player's location and based upon configurable options from the admin will launch missions.
Config file \FuMS\Themes\PlayerWatch\PlayerWatchConfig.sqf

Player watch performs a check every few minutes (configurable). If the check passes, information
about the players location is gathered and a mission is spawned near the player.
See PlayerWatchConfig.sqf for what mission will be launched.

List of locations and default mission type:
In trader zone - NONE
In own territory - small band of friendly armed civilians
In another territory - helo drop of 1-3 AI
In air vehicle - armed helo
In vehicle on land - armed Unmanned Vehicle
In vehicle in water - armed attack boat
In water - 3 man hostile dive squad
In spawn zone - zombies
In a town - squad of AI w/ a UAV
near a road - zombies
default (wilderness) - 2 squads of AI fighting each other

See Docs folder and comments in PlayerWatchConfig.sqf file to customize!






v0.2a
- corrected code to properly monitor server FPS is above the specified threshold before spawning a new mission.

- corrected mission configuration error with Zombie theme that was spawning multiple structures and excessive zombies.

  Sorry guys...but I did say happy halloween ;) Trick or Treat!

v0.2 Ryan's Zombies and Demons Support!
   Happy Halloween!!!
   
ADMIN NOTE: ENSURE mpmission.pbo HC folder is updated with this distro, not just the @FuMS folder!

- AI vehicles will maintain fuel level as long as original driver is alive.
- Old Mod dependency:
   Fixed AI cleanup
   Fixed ProxPlayer trigger

+ Ryan Zombie and Demons support:
1) Install it per the mod's instructions
2) Players WILL need to install/use this mod also, but trust me, its worth it.
3) Zombie Theme
  Background: Out of the list of Villages, Cities, and Captials of the land, Nine are infected by an evil presense. 
  It is up to the Exiled to located the source of this presense and destroy it before the area becomes totally overrun!
  
  What to expect:
  Civilian zombies = not too smart, but quick on their feet
  Soldier zombies = a little stronger, able to move vehicles around, and perform other feats of strength.
  Spider zombies = acute senses, hard to lose once they have you trail. Able to leap most obsticles in pursuit of their prey.
  Rumored to be able to take down low flying helocopers when attacking in mass.
  Zombie Boss = zombie on steroids, best bet, Run!
  
  Smoking obelisk in the center of town is guarded by a Horde. Use the explosives that are nearby to destroy the obelisk, 
  stop the infection and claim your reward!
  
  Note: For initial install, the infected towns are indicated on the map. Change the 'Show encounter' setting in the Zombies\SpawnTrigger.sqf
  mission to 'false' for your production servers if you do not want your players knowing where the infected are hiding.
  
1.	syntax: ["ZOMBIE", [spawnloc], [actionloc],[Detection_range, FlagCanThrow, WonderRange]]
2.	-spawnloc: offset or specific map location group will spawn
3.	-actionloc: --no functionality-- leave as [0,0]
4.	-options 
	a.	Detection_range = distance in meters beyond which zombies will not identify/engage AI and players.
		1.	Zombies have an accute sense of vehicles and will detect players in vehicles if they come within this range regardless of Line of sight.
	b.	FlagCanThrow: true = zombies have a chance to move vehicles out of their way when pursing players.
	c.	Wonder_range = distance a target must get away from the zombie to lose it. 
		1.	Players can lose the zombie in a range shorter than this, but it depends on their ability to block LOS/detection of the zombie to cause it to forget about the player(zombie types have different memories!)
5.	Behavior: Full implementation of Ryan's Zombie and Demons AI.
	a.	Zombies will wonder around until they locate a player or non-side "WEST" AI.
	b.	Zombies will pursue until dead or distracted by a closer target, or player can 'shake' them.
	c.	Zombies will attack cars, boats, helicopters, and static weapons when they are occupied by players/AI.
	d.	Zombies will not attack unoccupied vehicles, but will throw them!
	e.  It is rumored that spiderzombies will attack flying helo's and are even able to board them in search of their prey!
6.	Type Zombies:
	a.	Zombie  Jump 0%/10m ThrowCar 0% Memory 2sec
	b.	ZombieSoldier Jump 5%/20m ThrowCar 60% Memory 4sec
	c.	ZombieSpider Jump 50%/40m ThrowCar 5% Memory 8sec
	d.	ZombieBoss Jump 80%/35m ThrowCar 80% Memory 12sec



v0.1 Initial Port
   See : https://github.com/horbin/FuMS-HC-Server/blob/master/README.md
   for original development path under EPOCH mod.


Installation: (see file in this distro, or read below)
1. Headless Client Installation:

2. See Exile Dedicated server installation here:

3. https://www.dropbox.com/sh/8artg1h8q2b72h1/AABbP1LP6ybL9ovs8EB7Oqbla?dl=0

	a. Download the .pdf file
	
	b. Perform Step 03: Steam/Arma Install on the machine you are going to have your HC running on.
	
		i. If you will be running your HC on the same machine as your server, skip step 'b' above.
		
	c. Place a copy of your @Exile (Client folder) into the main server folder created in step 'b'.
	
		i. C:\Arma\Server\ if you are following the installation .pdf
		
	d. Locate the arma3server.exe file in the main server folder (C:\Arma\Server\)
	
		i. Create a short cut to this executable
		
		ii. add the following to the 'Target:' section of the shortcut's properties

arma3server.exe -client -nosound -connect=192.168.0.27 -port=2302 -mod="@Exile;" -profiles=HCLogs

		iii. Change -connect=   to the ip address of your SERVER.
		
		iv. Change -port= to the port of your SERVER.
		
		v.  Click OK.
		
NOTE: Logs created by the HC will be located in the C:\Arma\Server\HCLogs folder.

	e. See \Docs\Install Examples\mission.sqm
	Modify your mpmissions\Exile.Altis.pbo 's  mission.sqm file
	
		i. Locate:
		
			Class Groups
			
			{
				items = 1;
				
				class Item 0
				
				{
				
		ii. Change items =1; to items=2;
		
		iii. Add the following AFTER the closing }; for the 'class Item 0' definition
		
class Item1

{

	 side="LOGIC";
	 
	class Vehicles
	
            	{
            	
                	items=1;
                	
	                class Item0
	                
	                {
	                
	                    position[]={10720.502,12.714643,11356.243};
	                    
                	    id=100;
                	    
	                    side="LOGIC";
	                    
	                    vehicle="HeadlessClient_F";
	                    
	                    player="PLAY CDG";
	                    
                	    init="this enableSimulation false; this allowDamage false";
                	    
	                    leader=1;
	                    
	                    skill=0.60000002;
	                    
	                    text="HC_HAL";
	                    
                	};
                	
	};
	
 };

	f. Save the mission.sqm file.

## Your server is now ready to accept an HC!

2) FuMS Installation 
	a.   Copy the HC folder in the distribution to your mpmissions/Exile.Altis.pbo
		Add []execVM "HC\init.sqf" to the TOP of the initPlayerLocal.sqf file.
	
	b.  Copy the @FuMS folder to your base server directory (C:\Arma\Server)
		Do this on your SERVER. No need to put this folder on your HC!
	c. Modify your server start parameters to include -servermods=@FuMS;
	
	d. Don't forget to repack your mpmissions pbo!

3) Start your HC, feel free to leave it running.

4) Start your Server.  You should see the HC connect as soon as the server unlocks. 
Default FuMS distribution has some theme sets starting with no players. All others are defaulted to start when at least one player is logged in.

5) Go read the \Docs\ Folder to learn how to customize the themes and missions to meet your server's needs!

6) Still can't figure it out. Send me a PM, or post on the thread!

************************************************
Optional
************************************************
****Jurassic Raptor Addon Support **************
http://makearmanotwar.com/entry/ec2EDrOCkM#.VT0zFfnF9EK

1) Download the addon.

2) Place the '@Jurassic Arma - Raptor Pack' folder in the base folder of your server. At the same folder level as the @Exile folder.

3) Place this folder in the same location on your HC, IF your HC does not share the same source folder as your server.

4) add @Jurrasic Arma - Raptor Pack to the -mod option of your server command line

5) add this to the -mod option for your HC.

6) add this to the -mod option for your client.

7) Ensure your players download the mod, and add the proper @Jurassic.... to their start parameters.

8) Enable the "Jurassic" theme in BaseServer.sqf.

9) Learn to generate a bi-key for the mod and add it.

   OR
   
   edit your config.cfg file and set 'verifySignatures = 0;'
   
10) repack and play!

Note: Raptors use the same AI patrol logics as regular FuMS soldiers, so BoxPatrol, building searching, PatrolRoute, etc logics will all work with the "RaptorM", and "RaptorF" AI types.

Note: Feel free to add Raptors to your own encounters!, see the Jurassic theme for examples.

