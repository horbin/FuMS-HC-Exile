#Fulcrum Mission System (FuMS)
(like the mod? please feel free to donate.  http://conroh.com/fums/
------------------------------------------------------------------------------------
---- Read the information in the Docs folder, or you are missing out!
------------------------------------------------------------------------------------
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
Note: Raptors use the same AI patrol logics as regular FuMS soldiers, so BoxPatrol, building searching, PatrolRoute, etc logics will 
  all work with the "RaptorM", and "RaptorF" AI types.
Note: Feel free to add Raptors to your own encounters!, see the Jurassic theme for examples.

