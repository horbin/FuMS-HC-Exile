// Assets.sqf
// Unsung Version
// TheOneWhoKnocks
// Overwrites the global variables used by FuMS to generate various elements of the system

// Global variables in this file are available to the AI creation and Loot creation portions of FuMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When FuMS encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).

private ["_cartContents","_cartName","_debugCart"];


///////////////////////////////////////////////////
// CART config ////////////////////////////////////
///////////////////////////////////////////////////
_cartName = "unsung"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;		// Setting this to true adds additional info to log for troubleshooting purposes


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	
	//////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////// Uniforms ////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////  Civ
	[	
		"CAMS_U_Civ",		// Global variable being adjusted
		1,					// Side this is assigned to 
							// 0 - Global group combination
							// 1 - Everything else
		true,				// TRUE - Replaces vanilla class      FALSE - Appends to vanilla class
					
		[
			"UNS_CIV_B","UNS_CIV_U",

			
			"U_C_Journalist","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_salmon",
			"U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poor_1","U_C_Poor_2","U_C_Poor_shorts_1",
			"U_C_Scientist","U_OrestesBody","U_Rangemaster","U_NikosAgedBody","U_NikosBody","U_Competitor"

		]
	],

	//////////////////////////////////// Uniforms - WEST
	
	[
		"CAMS_U_Soldier_W",1,true,
		[
			"UNS_ARVN_BDU","UNS_DUCK_BDU",

			"UNS_ARMY_BDU",
			"UNS_ARMY_BDU_101stAB1stlt","UNS_ARMY_BDU_101stAB1stsgt","UNS_ARMY_BDU_101stAB2ndlt",
			
			"UNS_ARMY_BDU_101stAB651stlt","UNS_ARMY_BDU_101stAB651stsgt","UNS_ARMY_BDU_101stAB652ndlt",
			"UNS_ARMY_BDU_101stAB65col","UNS_ARMY_BDU_101stAB65cpl","UNS_ARMY_BDU_101stAB65cpt",
			"UNS_ARMY_BDU_101stAB65ltcol","UNS_ARMY_BDU_101stAB65maj","UNS_ARMY_BDU_101stAB65msg","UNS_ARMY_BDU_101stAB65pfc",
			"UNS_ARMY_BDU_101stAB65pv1","UNS_ARMY_BDU_101stAB65pv2","UNS_ARMY_BDU_101stAB65sfc","UNS_ARMY_BDU_101stAB65sgm",
			"UNS_ARMY_BDU_101stAB65sgt","UNS_ARMY_BDU_101stAB65spc","UNS_ARMY_BDU_101stAB65spc5","UNS_ARMY_BDU_101stAB65ssg",
			
			"UNS_ARMY_BDU_101stAB661stlt","UNS_ARMY_BDU_101stAB661stsgt","UNS_ARMY_BDU_101stAB662ndlt","UNS_ARMY_BDU_101stAB66col",
			"UNS_ARMY_BDU_101stAB66cpl","UNS_ARMY_BDU_101stAB66cpt","UNS_ARMY_BDU_101stAB66ltcol","UNS_ARMY_BDU_101stAB66maj",
			"UNS_ARMY_BDU_101stAB66msg",
			
			"UNS_ARMY_BDU_101stAB66OG1071stlt","UNS_ARMY_BDU_101stAB66OG1071stsgt","UNS_ARMY_BDU_101stAB66OG1072ndlt",
			"UNS_ARMY_BDU_101stAB66OG107col","UNS_ARMY_BDU_101stAB66OG107cpl","UNS_ARMY_BDU_101stAB66OG107cpt",
			"UNS_ARMY_BDU_101stAB66OG107ltcol","UNS_ARMY_BDU_101stAB66OG107maj","UNS_ARMY_BDU_101stAB66OG107msg",
			"UNS_ARMY_BDU_101stAB66OG107pfc","UNS_ARMY_BDU_101stAB66OG107pv1","UNS_ARMY_BDU_101stAB66OG107pv2",
			"UNS_ARMY_BDU_101stAB66OG107sfc","UNS_ARMY_BDU_101stAB66OG107sgm","UNS_ARMY_BDU_101stAB66OG107sgt",
			"UNS_ARMY_BDU_101stAB66OG107spc","UNS_ARMY_BDU_101stAB66OG107spc5","UNS_ARMY_BDU_101stAB66OG107ssg",
			
			"UNS_ARMY_BDU_101stAB66pfc","UNS_ARMY_BDU_101stAB66pv1","UNS_ARMY_BDU_101stAB66pv2","UNS_ARMY_BDU_101stAB66sfc",
			"UNS_ARMY_BDU_101stAB66sgm","UNS_ARMY_BDU_101stAB66sgt","UNS_ARMY_BDU_101stAB66spc","UNS_ARMY_BDU_101stAB66spc5",
			"UNS_ARMY_BDU_101stAB66ssg","UNS_ARMY_BDU_101stABcol","UNS_ARMY_BDU_101stABcpl","UNS_ARMY_BDU_101stABcpt",
			"UNS_ARMY_BDU_101stABFlak1stlt","UNS_ARMY_BDU_101stABFlak1stsgt","UNS_ARMY_BDU_101stABFlak2ndlt","UNS_ARMY_BDU_101stABFlakcol",
			"UNS_ARMY_BDU_101stABFlakcpl","UNS_ARMY_BDU_101stABFlakcpt","UNS_ARMY_BDU_101stABFlakltcol","UNS_ARMY_BDU_101stABFlakmaj",
			"UNS_ARMY_BDU_101stABFlakmsg","UNS_ARMY_BDU_101stABFlakpfc","UNS_ARMY_BDU_101stABFlakpv1","UNS_ARMY_BDU_101stABFlakpv2",
			"UNS_ARMY_BDU_101stABFlaksfc","UNS_ARMY_BDU_101stABFlaksgm","UNS_ARMY_BDU_101stABFlaksgt","UNS_ARMY_BDU_101stABFlakspc",
			"UNS_ARMY_BDU_101stABFlakspc5","UNS_ARMY_BDU_101stABFlakssg","UNS_ARMY_BDU_101stABltcol","UNS_ARMY_BDU_101stABmaj",
			"UNS_ARMY_BDU_101stABmsg","UNS_ARMY_BDU_101stABpfc","UNS_ARMY_BDU_101stABpv1","UNS_ARMY_BDU_101stABpv2",
			"UNS_ARMY_BDU_101stABsfc","UNS_ARMY_BDU_101stABsgm","UNS_ARMY_BDU_101stABsgt","UNS_ARMY_BDU_101stABspc",
			"UNS_ARMY_BDU_101stABspc5","UNS_ARMY_BDU_101stABssg",
			
			"UNS_ARMY_BDU_11thacrSubd1stlt","UNS_ARMY_BDU_11thacrSubd1stsgt","UNS_ARMY_BDU_11thacrSubd2ndlt","UNS_ARMY_BDU_11thacrSubdcol",
			"UNS_ARMY_BDU_11thacrSubdcpl","UNS_ARMY_BDU_11thacrSubdcpt","UNS_ARMY_BDU_11thacrSubdFlak1stlt","UNS_ARMY_BDU_11thacrSubdFlak1stsgt",
			"UNS_ARMY_BDU_11thacrSubdFlak2ndlt","UNS_ARMY_BDU_11thacrSubdFlakcol","UNS_ARMY_BDU_11thacrSubdFlakcpl","UNS_ARMY_BDU_11thacrSubdFlakcpt",
			"UNS_ARMY_BDU_11thacrSubdFlakltcol","UNS_ARMY_BDU_11thacrSubdFlakmaj","UNS_ARMY_BDU_11thacrSubdFlakmsg","UNS_ARMY_BDU_11thacrSubdFlakpfc",
			"UNS_ARMY_BDU_11thacrSubdFlakpv1","UNS_ARMY_BDU_11thacrSubdFlakpv2","UNS_ARMY_BDU_11thacrSubdFlaksfc","UNS_ARMY_BDU_11thacrSubdFlaksgm",
			"UNS_ARMY_BDU_11thacrSubdFlaksgt","UNS_ARMY_BDU_11thacrSubdFlakspc","UNS_ARMY_BDU_11thacrSubdFlakspc5","UNS_ARMY_BDU_11thacrSubdFlakssg",
			"UNS_ARMY_BDU_11thacrSubdltcol","UNS_ARMY_BDU_11thacrSubdmaj","UNS_ARMY_BDU_11thacrSubdmsg","UNS_ARMY_BDU_11thacrSubdpfc",
			"UNS_ARMY_BDU_11thacrSubdpv1","UNS_ARMY_BDU_11thacrSubdpv2","UNS_ARMY_BDU_11thacrSubdsfc","UNS_ARMY_BDU_11thacrSubdsgm",
			"UNS_ARMY_BDU_11thacrSubdsgt","UNS_ARMY_BDU_11thacrSubdspc","UNS_ARMY_BDU_11thacrSubdspc5","UNS_ARMY_BDU_11thacrSubdssg",
			
			"UNS_ARMY_BDU_173rdAB1stlt","UNS_ARMY_BDU_173rdAB1stsgt","UNS_ARMY_BDU_173rdAB2ndlt","UNS_ARMY_BDU_173rdAB651stlt",
			"UNS_ARMY_BDU_173rdAB651stsgt","UNS_ARMY_BDU_173rdAB652ndlt","UNS_ARMY_BDU_173rdAB65col","UNS_ARMY_BDU_173rdAB65cpl",
			"UNS_ARMY_BDU_173rdAB65cpt","UNS_ARMY_BDU_173rdAB65ltcol","UNS_ARMY_BDU_173rdAB65maj","UNS_ARMY_BDU_173rdAB65msg",
			"UNS_ARMY_BDU_173rdAB65pfc","UNS_ARMY_BDU_173rdAB65pv1","UNS_ARMY_BDU_173rdAB65pv2","UNS_ARMY_BDU_173rdAB65sfc",
			"UNS_ARMY_BDU_173rdAB65sgm","UNS_ARMY_BDU_173rdAB65sgt","UNS_ARMY_BDU_173rdAB65spc","UNS_ARMY_BDU_173rdAB65spc5",
			"UNS_ARMY_BDU_173rdAB65ssg","UNS_ARMY_BDU_173rdABcol","UNS_ARMY_BDU_173rdABcpl","UNS_ARMY_BDU_173rdABcpt",
			"UNS_ARMY_BDU_173rdABltcol","UNS_ARMY_BDU_173rdABmaj","UNS_ARMY_BDU_173rdABmsg","UNS_ARMY_BDU_173rdABpfc",
			"UNS_ARMY_BDU_173rdABpv1","UNS_ARMY_BDU_173rdABpv2","UNS_ARMY_BDU_173rdABsfc","UNS_ARMY_BDU_173rdABsgm",
			"UNS_ARMY_BDU_173rdABsgt","UNS_ARMY_BDU_173rdABspc","UNS_ARMY_BDU_173rdABspc5","UNS_ARMY_BDU_173rdABssg",
			
			"UNS_ARMY_BDU_173rdABSubd1stlt","UNS_ARMY_BDU_173rdABSubd1stsgt","UNS_ARMY_BDU_173rdABSubd2ndlt","UNS_ARMY_BDU_173rdABSubdcol",
			"UNS_ARMY_BDU_173rdABSubdcpl","UNS_ARMY_BDU_173rdABSubdcpt","UNS_ARMY_BDU_173rdABSubdltcol","UNS_ARMY_BDU_173rdABSubdmaj",
			"UNS_ARMY_BDU_173rdABSubdmsg","UNS_ARMY_BDU_173rdABSubdpfc","UNS_ARMY_BDU_173rdABSubdpv1","UNS_ARMY_BDU_173rdABSubdpv2",
			"UNS_ARMY_BDU_173rdABSubdsfc","UNS_ARMY_BDU_173rdABSubdsgm","UNS_ARMY_BDU_173rdABSubdsgt","UNS_ARMY_BDU_173rdABSubdspc",
			"UNS_ARMY_BDU_173rdABSubdspc5","UNS_ARMY_BDU_173rdABSubdssg",
			
			"UNS_ARMY_BDU_196thLIBSubd1stlt","UNS_ARMY_BDU_196thLIBSubd1stsgt","UNS_ARMY_BDU_196thLIBSubd21stlt","UNS_ARMY_BDU_196thLIBSubd21stsgt",
			"UNS_ARMY_BDU_196thLIBSubd22ndlt","UNS_ARMY_BDU_196thLIBSubd2col","UNS_ARMY_BDU_196thLIBSubd2cpl","UNS_ARMY_BDU_196thLIBSubd2cpt",
			"UNS_ARMY_BDU_196thLIBSubd2ltcol","UNS_ARMY_BDU_196thLIBSubd2maj","UNS_ARMY_BDU_196thLIBSubd2msg","UNS_ARMY_BDU_196thLIBSubd2ndlt",
			"UNS_ARMY_BDU_196thLIBSubd2pfc","UNS_ARMY_BDU_196thLIBSubd2pv1","UNS_ARMY_BDU_196thLIBSubd2pv2","UNS_ARMY_BDU_196thLIBSubd2sfc",
			"UNS_ARMY_BDU_196thLIBSubd2sgm","UNS_ARMY_BDU_196thLIBSubd2sgt","UNS_ARMY_BDU_196thLIBSubd2spc","UNS_ARMY_BDU_196thLIBSubd2spc5",
			"UNS_ARMY_BDU_196thLIBSubd2ssg","UNS_ARMY_BDU_196thLIBSubdcol","UNS_ARMY_BDU_196thLIBSubdcpl","UNS_ARMY_BDU_196thLIBSubdcpt",
			"UNS_ARMY_BDU_196thLIBSubdltcol","UNS_ARMY_BDU_196thLIBSubdmaj","UNS_ARMY_BDU_196thLIBSubdmsg","UNS_ARMY_BDU_196thLIBSubdpfc",
			"UNS_ARMY_BDU_196thLIBSubdpv1","UNS_ARMY_BDU_196thLIBSubdpv2","UNS_ARMY_BDU_196thLIBSubdsfc","UNS_ARMY_BDU_196thLIBSubdsgm",
			"UNS_ARMY_BDU_196thLIBSubdsgt","UNS_ARMY_BDU_196thLIBSubdspc","UNS_ARMY_BDU_196thLIBSubdspc5","UNS_ARMY_BDU_196thLIBSubdssg",
			
			"UNS_ARMY_BDU_199thLIBSubd1stlt","UNS_ARMY_BDU_199thLIBSubd1stsgt","UNS_ARMY_BDU_199thLIBSubd21stlt","UNS_ARMY_BDU_199thLIBSubd21stsgt",
			"UNS_ARMY_BDU_199thLIBSubd22ndlt","UNS_ARMY_BDU_199thLIBSubd2col","UNS_ARMY_BDU_199thLIBSubd2cpl","UNS_ARMY_BDU_199thLIBSubd2cpt",
			"UNS_ARMY_BDU_199thLIBSubd2ltcol","UNS_ARMY_BDU_199thLIBSubd2maj","UNS_ARMY_BDU_199thLIBSubd2msg","UNS_ARMY_BDU_199thLIBSubd2ndlt",
			"UNS_ARMY_BDU_199thLIBSubd2pfc","UNS_ARMY_BDU_199thLIBSubd2pv1","UNS_ARMY_BDU_199thLIBSubd2pv2","UNS_ARMY_BDU_199thLIBSubd2sfc",
			"UNS_ARMY_BDU_199thLIBSubd2sgm","UNS_ARMY_BDU_199thLIBSubd2sgt","UNS_ARMY_BDU_199thLIBSubd2spc","UNS_ARMY_BDU_199thLIBSubd2spc5",
			"UNS_ARMY_BDU_199thLIBSubd2ssg","UNS_ARMY_BDU_199thLIBSubdcol","UNS_ARMY_BDU_199thLIBSubdcpl","UNS_ARMY_BDU_199thLIBSubdcpt",
			"UNS_ARMY_BDU_199thLIBSubdltcol","UNS_ARMY_BDU_199thLIBSubdmaj","UNS_ARMY_BDU_199thLIBSubdmsg","UNS_ARMY_BDU_199thLIBSubdpfc",
			"UNS_ARMY_BDU_199thLIBSubdpv1","UNS_ARMY_BDU_199thLIBSubdpv2","UNS_ARMY_BDU_199thLIBSubdsfc","UNS_ARMY_BDU_199thLIBSubdsgm",
			"UNS_ARMY_BDU_199thLIBSubdsgt","UNS_ARMY_BDU_199thLIBSubdspc","UNS_ARMY_BDU_199thLIBSubdspc5","UNS_ARMY_BDU_199thLIBSubdssg",
			
			"UNS_ARMY_BDU_1stBrig5thID1stlt","UNS_ARMY_BDU_1stBrig5thID1stsgt","UNS_ARMY_BDU_1stBrig5thID2ndlt","UNS_ARMY_BDU_1stBrig5thIDcol",
			"UNS_ARMY_BDU_1stBrig5thIDcpl","UNS_ARMY_BDU_1stBrig5thIDcpt",
			
			"UNS_ARMY_BDU_1stBrig5thIDFlak1stlt","UNS_ARMY_BDU_1stBrig5thIDFlak1stsgt","UNS_ARMY_BDU_1stBrig5thIDFlak2ndlt",
			"UNS_ARMY_BDU_1stBrig5thIDFlakcol","UNS_ARMY_BDU_1stBrig5thIDFlakcpl","UNS_ARMY_BDU_1stBrig5thIDFlakcpt",
			"UNS_ARMY_BDU_1stBrig5thIDFlakltcol","UNS_ARMY_BDU_1stBrig5thIDFlakmaj","UNS_ARMY_BDU_1stBrig5thIDFlakmsg",
			"UNS_ARMY_BDU_1stBrig5thIDFlakpfc","UNS_ARMY_BDU_1stBrig5thIDFlakpv1","UNS_ARMY_BDU_1stBrig5thIDFlakpv2",
			"UNS_ARMY_BDU_1stBrig5thIDFlaksfc","UNS_ARMY_BDU_1stBrig5thIDFlaksgm","UNS_ARMY_BDU_1stBrig5thIDFlaksgt",
			"UNS_ARMY_BDU_1stBrig5thIDFlakspc","UNS_ARMY_BDU_1stBrig5thIDFlakspc5","UNS_ARMY_BDU_1stBrig5thIDFlakssg",
			
			"UNS_ARMY_BDU_1stBrig5thIDltcol","UNS_ARMY_BDU_1stBrig5thIDmaj","UNS_ARMY_BDU_1stBrig5thIDmsg","UNS_ARMY_BDU_1stBrig5thIDpfc",
			"UNS_ARMY_BDU_1stBrig5thIDpv1","UNS_ARMY_BDU_1stBrig5thIDpv2","UNS_ARMY_BDU_1stBrig5thIDsfc","UNS_ARMY_BDU_1stBrig5thIDsgm",
			"UNS_ARMY_BDU_1stBrig5thIDsgt","UNS_ARMY_BDU_1stBrig5thIDspc","UNS_ARMY_BDU_1stBrig5thIDspc5","UNS_ARMY_BDU_1stBrig5thIDssg",
			"UNS_ARMY_BDU_1stBrig5thIDSubd1stlt","UNS_ARMY_BDU_1stBrig5thIDSubd1stsgt","UNS_ARMY_BDU_1stBrig5thIDSubd2ndlt","UNS_ARMY_BDU_1stBrig5thIDSubdcol",
			"UNS_ARMY_BDU_1stBrig5thIDSubdcpl","UNS_ARMY_BDU_1stBrig5thIDSubdcpt","UNS_ARMY_BDU_1stBrig5thIDSubdltcol","UNS_ARMY_BDU_1stBrig5thIDSubdmaj",
			"UNS_ARMY_BDU_1stBrig5thIDSubdmsg","UNS_ARMY_BDU_1stBrig5thIDSubdpfc","UNS_ARMY_BDU_1stBrig5thIDSubdpv1","UNS_ARMY_BDU_1stBrig5thIDSubdpv2",
			"UNS_ARMY_BDU_1stBrig5thIDSubdsfc","UNS_ARMY_BDU_1stBrig5thIDSubdsgm","UNS_ARMY_BDU_1stBrig5thIDSubdsgt","UNS_ARMY_BDU_1stBrig5thIDSubdspc",
			"UNS_ARMY_BDU_1stBrig5thIDSubdspc5","UNS_ARMY_BDU_1stBrig5thIDSubdssg",
			
			"UNS_ARMY_BDU_1stCav1stlt","UNS_ARMY_BDU_1stCav1stsgt","UNS_ARMY_BDU_1stCav2ndlt","UNS_ARMY_BDU_1stCav651stlt","UNS_ARMY_BDU_1stCav651stsgt",
			"UNS_ARMY_BDU_1stCav652ndlt","UNS_ARMY_BDU_1stCav65col","UNS_ARMY_BDU_1stCav65cpl","UNS_ARMY_BDU_1stCav65cpt","UNS_ARMY_BDU_1stCav65ltcol",
			"UNS_ARMY_BDU_1stCav65maj","UNS_ARMY_BDU_1stCav65msg","UNS_ARMY_BDU_1stCav65pfc","UNS_ARMY_BDU_1stCav65pv1","UNS_ARMY_BDU_1stCav65pv2",
			"UNS_ARMY_BDU_1stCav65sfc","UNS_ARMY_BDU_1stCav65sgm","UNS_ARMY_BDU_1stCav65sgt","UNS_ARMY_BDU_1stCav65spc","UNS_ARMY_BDU_1stCav65spc5",
			"UNS_ARMY_BDU_1stCav65ssg","UNS_ARMY_BDU_1stCavcol","UNS_ARMY_BDU_1stCavcpl","UNS_ARMY_BDU_1stCavcpt",
			
			"UNS_ARMY_BDU_1stCavFlak1stlt","UNS_ARMY_BDU_1stCavFlak1stsgt","UNS_ARMY_BDU_1stCavFlak2ndlt","UNS_ARMY_BDU_1stCavFlakcol",
			"UNS_ARMY_BDU_1stCavFlakcpl","UNS_ARMY_BDU_1stCavFlakcpt","UNS_ARMY_BDU_1stCavFlakltcol","UNS_ARMY_BDU_1stCavFlakmaj",
			"UNS_ARMY_BDU_1stCavFlakmsg","UNS_ARMY_BDU_1stCavFlakpfc","UNS_ARMY_BDU_1stCavFlakpv1","UNS_ARMY_BDU_1stCavFlakpv2",
			"UNS_ARMY_BDU_1stCavFlaksfc","UNS_ARMY_BDU_1stCavFlaksgm","UNS_ARMY_BDU_1stCavFlaksgt","UNS_ARMY_BDU_1stCavFlakspc",
			"UNS_ARMY_BDU_1stCavFlakspc5","UNS_ARMY_BDU_1stCavFlakssg",
			
			"UNS_ARMY_BDU_1stCavltcol","UNS_ARMY_BDU_1stCavmaj","UNS_ARMY_BDU_1stCavmsg","UNS_ARMY_BDU_1stCavpfc",
			"UNS_ARMY_BDU_1stCavpv1","UNS_ARMY_BDU_1stCavpv2","UNS_ARMY_BDU_1stCavsfc","UNS_ARMY_BDU_1stCavsgm",
			"UNS_ARMY_BDU_1stCavsgt","UNS_ARMY_BDU_1stCavspc","UNS_ARMY_BDU_1stCavspc5","UNS_ARMY_BDU_1stCavssg",
			
			"UNS_ARMY_BDU_1stCavSubd1stlt","UNS_ARMY_BDU_1stCavSubd1stsgt","UNS_ARMY_BDU_1stCavSubd2ndlt","UNS_ARMY_BDU_1stCavSubdcol",
			"UNS_ARMY_BDU_1stCavSubdcpl","UNS_ARMY_BDU_1stCavSubdcpt","UNS_ARMY_BDU_1stCavSubdFlak1stlt",
			
			"UNS_ARMY_BDU_1stCavSubdFlak1stsgt","UNS_ARMY_BDU_1stCavSubdFlak2ndlt","UNS_ARMY_BDU_1stCavSubdFlakcol",
			"UNS_ARMY_BDU_1stCavSubdFlakcpl","UNS_ARMY_BDU_1stCavSubdFlakcpt","UNS_ARMY_BDU_1stCavSubdFlakltcol",
			"UNS_ARMY_BDU_1stCavSubdFlakmaj","UNS_ARMY_BDU_1stCavSubdFlakmsg","UNS_ARMY_BDU_1stCavSubdFlakpfc",
			"UNS_ARMY_BDU_1stCavSubdFlakpv1","UNS_ARMY_BDU_1stCavSubdFlakpv2","UNS_ARMY_BDU_1stCavSubdFlaksfc",
			"UNS_ARMY_BDU_1stCavSubdFlaksgm","UNS_ARMY_BDU_1stCavSubdFlaksgt","UNS_ARMY_BDU_1stCavSubdFlakspc",
			"UNS_ARMY_BDU_1stCavSubdFlakspc5","UNS_ARMY_BDU_1stCavSubdFlakssg",
			
			"UNS_ARMY_BDU_1stCavSubdltcol","UNS_ARMY_BDU_1stCavSubdmaj","UNS_ARMY_BDU_1stCavSubdmsg","UNS_ARMY_BDU_1stCavSubdpfc",
			"UNS_ARMY_BDU_1stCavSubdpv1","UNS_ARMY_BDU_1stCavSubdpv2","UNS_ARMY_BDU_1stCavSubdsfc","UNS_ARMY_BDU_1stCavSubdsgm",
			"UNS_ARMY_BDU_1stCavSubdsgt","UNS_ARMY_BDU_1stCavSubdspc","UNS_ARMY_BDU_1stCavSubdspc5","UNS_ARMY_BDU_1stCavSubdssg",
			
			"UNS_ARMY_BDU_1stID1stlt","UNS_ARMY_BDU_1stID1stsgt","UNS_ARMY_BDU_1stID2ndlt","UNS_ARMY_BDU_1stID651stlt",
			
			"UNS_ARMY_BDU_1stID651stsgt","UNS_ARMY_BDU_1stID652ndlt","UNS_ARMY_BDU_1stID65col","UNS_ARMY_BDU_1stID65cpl",
			"UNS_ARMY_BDU_1stID65cpt","UNS_ARMY_BDU_1stID65ltcol","UNS_ARMY_BDU_1stID65maj","UNS_ARMY_BDU_1stID65msg",
			
			"UNS_ARMY_BDU_1stID65OG1071stlt","UNS_ARMY_BDU_1stID65OG1071stsgt","UNS_ARMY_BDU_1stID65OG1072ndlt",
			"UNS_ARMY_BDU_1stID65OG107col","UNS_ARMY_BDU_1stID65OG107cpl","UNS_ARMY_BDU_1stID65OG107cpt",
			"UNS_ARMY_BDU_1stID65OG107ltcol","UNS_ARMY_BDU_1stID65OG107maj","UNS_ARMY_BDU_1stID65OG107msg",
			"UNS_ARMY_BDU_1stID65OG107pfc","UNS_ARMY_BDU_1stID65OG107pv1","UNS_ARMY_BDU_1stID65OG107pv2",
			"UNS_ARMY_BDU_1stID65OG107sfc","UNS_ARMY_BDU_1stID65OG107sgm","UNS_ARMY_BDU_1stID65OG107sgt",
			"UNS_ARMY_BDU_1stID65OG107spc","UNS_ARMY_BDU_1stID65OG107spc5","UNS_ARMY_BDU_1stID65OG107ssg",
			
			"UNS_ARMY_BDU_1stID65pfc","UNS_ARMY_BDU_1stID65pv1","UNS_ARMY_BDU_1stID65pv2","UNS_ARMY_BDU_1stID65sfc",
			"UNS_ARMY_BDU_1stID65sgm","UNS_ARMY_BDU_1stID65sgt","UNS_ARMY_BDU_1stID65spc","UNS_ARMY_BDU_1stID65spc5",
			"UNS_ARMY_BDU_1stID65ssg","UNS_ARMY_BDU_1stIDcol","UNS_ARMY_BDU_1stIDcpl","UNS_ARMY_BDU_1stIDcpt",
			
			"UNS_ARMY_BDU_1stIDFlak1stlt","UNS_ARMY_BDU_1stIDFlak1stsgt","UNS_ARMY_BDU_1stIDFlak2ndlt","UNS_ARMY_BDU_1stIDFlakcol",
			"UNS_ARMY_BDU_1stIDFlakcpl","UNS_ARMY_BDU_1stIDFlakcpt","UNS_ARMY_BDU_1stIDFlakltcol","UNS_ARMY_BDU_1stIDFlakmaj",
			"UNS_ARMY_BDU_1stIDFlakmsg","UNS_ARMY_BDU_1stIDFlakpfc","UNS_ARMY_BDU_1stIDFlakpv1","UNS_ARMY_BDU_1stIDFlakpv2",
			"UNS_ARMY_BDU_1stIDFlaksfc","UNS_ARMY_BDU_1stIDFlaksgm","UNS_ARMY_BDU_1stIDFlaksgt","UNS_ARMY_BDU_1stIDFlakspc",
			"UNS_ARMY_BDU_1stIDFlakspc5","UNS_ARMY_BDU_1stIDFlakssg",
			
			"UNS_ARMY_BDU_1stIDltcol","UNS_ARMY_BDU_1stIDmaj","UNS_ARMY_BDU_1stIDmsg","UNS_ARMY_BDU_1stIDpfc",
			"UNS_ARMY_BDU_1stIDpv1","UNS_ARMY_BDU_1stIDpv2","UNS_ARMY_BDU_1stIDsfc","UNS_ARMY_BDU_1stIDsgm",
			"UNS_ARMY_BDU_1stIDsgt","UNS_ARMY_BDU_1stIDspc","UNS_ARMY_BDU_1stIDspc5","UNS_ARMY_BDU_1stIDssg",
			
			"UNS_ARMY_BDU_23rdIDSubd1stlt","UNS_ARMY_BDU_23rdIDSubd1stsgt","UNS_ARMY_BDU_23rdIDSubd2ndlt","UNS_ARMY_BDU_23rdIDSubdcol",
			"UNS_ARMY_BDU_23rdIDSubdcpl","UNS_ARMY_BDU_23rdIDSubdcpt",
			
			"UNS_ARMY_BDU_23rdIDSubdFlak1stlt","UNS_ARMY_BDU_23rdIDSubdFlak1stsgt","UNS_ARMY_BDU_23rdIDSubdFlak2ndlt",
			"UNS_ARMY_BDU_23rdIDSubdFlakcol","UNS_ARMY_BDU_23rdIDSubdFlakcpl","UNS_ARMY_BDU_23rdIDSubdFlakcpt",
			"UNS_ARMY_BDU_23rdIDSubdFlakltcol","UNS_ARMY_BDU_23rdIDSubdFlakmaj","UNS_ARMY_BDU_23rdIDSubdFlakmsg",
			"UNS_ARMY_BDU_23rdIDSubdFlakpfc","UNS_ARMY_BDU_23rdIDSubdFlakpv1","UNS_ARMY_BDU_23rdIDSubdFlakpv2",
			"UNS_ARMY_BDU_23rdIDSubdFlaksfc","UNS_ARMY_BDU_23rdIDSubdFlaksgm","UNS_ARMY_BDU_23rdIDSubdFlaksgt",
			"UNS_ARMY_BDU_23rdIDSubdFlakspc","UNS_ARMY_BDU_23rdIDSubdFlakspc5","UNS_ARMY_BDU_23rdIDSubdFlakssg",
			
			"UNS_ARMY_BDU_23rdIDSubdltcol","UNS_ARMY_BDU_23rdIDSubdmaj",
"UNS_ARMY_BDU_23rdIDSubdmsg",
"UNS_ARMY_BDU_23rdIDSubdpfc",
"UNS_ARMY_BDU_23rdIDSubdpv1",
"UNS_ARMY_BDU_23rdIDSubdpv2",
"UNS_ARMY_BDU_23rdIDSubdsfc",
"UNS_ARMY_BDU_23rdIDSubdsgm",
"UNS_ARMY_BDU_23rdIDSubdsgt",
"UNS_ARMY_BDU_23rdIDSubdspc",
"UNS_ARMY_BDU_23rdIDSubdspc5",
"UNS_ARMY_BDU_23rdIDSubdssg",
"UNS_ARMY_BDU_25thID1stlt",
"UNS_ARMY_BDU_25thID1stsgt",
"UNS_ARMY_BDU_25thID2ndlt",
"UNS_ARMY_BDU_25thID661stlt",
"UNS_ARMY_BDU_25thID661stsgt",
"UNS_ARMY_BDU_25thID662ndlt",
"UNS_ARMY_BDU_25thID66col",
"UNS_ARMY_BDU_25thID66cpl",
"UNS_ARMY_BDU_25thID66cpt",
"UNS_ARMY_BDU_25thID66ltcol",
"UNS_ARMY_BDU_25thID66maj",
"UNS_ARMY_BDU_25thID66msg",
"UNS_ARMY_BDU_25thID66OG1071stlt",
"UNS_ARMY_BDU_25thID66OG1071stsgt",
"UNS_ARMY_BDU_25thID66OG1072ndlt",
"UNS_ARMY_BDU_25thID66OG107col",
"UNS_ARMY_BDU_25thID66OG107cpl",
"UNS_ARMY_BDU_25thID66OG107cpt",
"UNS_ARMY_BDU_25thID66OG107ltcol",
"UNS_ARMY_BDU_25thID66OG107maj",
"UNS_ARMY_BDU_25thID66OG107msg",
"UNS_ARMY_BDU_25thID66OG107pfc",
"UNS_ARMY_BDU_25thID66OG107pv1",
"UNS_ARMY_BDU_25thID66OG107pv2",
"UNS_ARMY_BDU_25thID66OG107sfc",
"UNS_ARMY_BDU_25thID66OG107sgm",
"UNS_ARMY_BDU_25thID66OG107sgt",
"UNS_ARMY_BDU_25thID66OG107spc",
"UNS_ARMY_BDU_25thID66OG107spc5",
"UNS_ARMY_BDU_25thID66OG107ssg",
"UNS_ARMY_BDU_25thID66pfc",
"UNS_ARMY_BDU_25thID66pv1",
"UNS_ARMY_BDU_25thID66pv2",
"UNS_ARMY_BDU_25thID66sfc",
"UNS_ARMY_BDU_25thID66sgm",
"UNS_ARMY_BDU_25thID66sgt",
"UNS_ARMY_BDU_25thID66spc",
"UNS_ARMY_BDU_25thID66spc5",
"UNS_ARMY_BDU_25thID66ssg",
"UNS_ARMY_BDU_25thIDcol",
"UNS_ARMY_BDU_25thIDcpl",
"UNS_ARMY_BDU_25thIDcpt",
"UNS_ARMY_BDU_25thIDFlak1stlt",
"UNS_ARMY_BDU_25thIDFlak1stsgt",
"UNS_ARMY_BDU_25thIDFlak2ndlt",
"UNS_ARMY_BDU_25thIDFlakcol",
"UNS_ARMY_BDU_25thIDFlakcpl",
"UNS_ARMY_BDU_25thIDFlakcpt",
"UNS_ARMY_BDU_25thIDFlakltcol",
"UNS_ARMY_BDU_25thIDFlakmaj",
"UNS_ARMY_BDU_25thIDFlakmsg",
"UNS_ARMY_BDU_25thIDFlakpfc",
"UNS_ARMY_BDU_25thIDFlakpv1",
"UNS_ARMY_BDU_25thIDFlakpv2",
"UNS_ARMY_BDU_25thIDFlaksfc",
"UNS_ARMY_BDU_25thIDFlaksgm",
"UNS_ARMY_BDU_25thIDFlaksgt",
"UNS_ARMY_BDU_25thIDFlakspc",
"UNS_ARMY_BDU_25thIDFlakspc5",
"UNS_ARMY_BDU_25thIDFlakssg",
"UNS_ARMY_BDU_25thIDltcol",
"UNS_ARMY_BDU_25thIDmaj",
"UNS_ARMY_BDU_25thIDmsg",
"UNS_ARMY_BDU_25thIDpfc",
"UNS_ARMY_BDU_25thIDpv1",
"UNS_ARMY_BDU_25thIDpv2",
"UNS_ARMY_BDU_25thIDsfc",
"UNS_ARMY_BDU_25thIDsgm",
"UNS_ARMY_BDU_25thIDsgt",
"UNS_ARMY_BDU_25thIDspc",
"UNS_ARMY_BDU_25thIDspc5",
"UNS_ARMY_BDU_25thIDssg",
"UNS_ARMY_BDU_25thIDSubd1stlt",
"UNS_ARMY_BDU_25thIDSubd1stsgt",
"UNS_ARMY_BDU_25thIDSubd2ndlt",
"UNS_ARMY_BDU_25thIDSubdcol",
"UNS_ARMY_BDU_25thIDSubdcpl",
"UNS_ARMY_BDU_25thIDSubdcpt",
"UNS_ARMY_BDU_25thIDSubdFlak1stlt",
"UNS_ARMY_BDU_25thIDSubdFlak1stsgt",
"UNS_ARMY_BDU_25thIDSubdFlak2ndlt",
"UNS_ARMY_BDU_25thIDSubdFlakcol",
"UNS_ARMY_BDU_25thIDSubdFlakcpl",
"UNS_ARMY_BDU_25thIDSubdFlakcpt",
"UNS_ARMY_BDU_25thIDSubdFlakltcol",
"UNS_ARMY_BDU_25thIDSubdFlakmaj",
"UNS_ARMY_BDU_25thIDSubdFlakmsg",
"UNS_ARMY_BDU_25thIDSubdFlakpfc",
"UNS_ARMY_BDU_25thIDSubdFlakpv1",
"UNS_ARMY_BDU_25thIDSubdFlakpv2",
"UNS_ARMY_BDU_25thIDSubdFlaksfc",
"UNS_ARMY_BDU_25thIDSubdFlaksgm",
"UNS_ARMY_BDU_25thIDSubdFlaksgt",
"UNS_ARMY_BDU_25thIDSubdFlakspc",
"UNS_ARMY_BDU_25thIDSubdFlakspc5",
"UNS_ARMY_BDU_25thIDSubdFlakssg",
"UNS_ARMY_BDU_25thIDSubdltcol",
"UNS_ARMY_BDU_25thIDSubdmaj",
"UNS_ARMY_BDU_25thIDSubdmsg",
"UNS_ARMY_BDU_25thIDSubdpfc",
"UNS_ARMY_BDU_25thIDSubdpv1",
"UNS_ARMY_BDU_25thIDSubdpv2",
"UNS_ARMY_BDU_25thIDSubdsfc",
"UNS_ARMY_BDU_25thIDSubdsgm",
"UNS_ARMY_BDU_25thIDSubdsgt",
"UNS_ARMY_BDU_25thIDSubdspc",
"UNS_ARMY_BDU_25thIDSubdspc5",
"UNS_ARMY_BDU_25thIDSubdssg",
"UNS_ARMY_BDU_4thID66OG1071stlt",
"UNS_ARMY_BDU_4thID66OG1071stsgt",
"UNS_ARMY_BDU_4thID66OG1072ndlt",
"UNS_ARMY_BDU_4thID66OG107col",
"UNS_ARMY_BDU_4thID66OG107cpl",
"UNS_ARMY_BDU_4thID66OG107cpt",
"UNS_ARMY_BDU_4thID66OG107ltcol",
"UNS_ARMY_BDU_4thID66OG107maj",
"UNS_ARMY_BDU_4thID66OG107msg",
"UNS_ARMY_BDU_4thID66OG107pfc",
"UNS_ARMY_BDU_4thID66OG107pv1",
"UNS_ARMY_BDU_4thID66OG107pv2",
"UNS_ARMY_BDU_4thID66OG107sfc",
"UNS_ARMY_BDU_4thID66OG107sgm",
"UNS_ARMY_BDU_4thID66OG107sgt",
"UNS_ARMY_BDU_4thID66OG107spc",
"UNS_ARMY_BDU_4thID66OG107spc5",
"UNS_ARMY_BDU_4thID66OG107ssg",
"UNS_ARMY_BDU_4thIDSubd1stlt",
"UNS_ARMY_BDU_4thIDSubd1stsgt",
"UNS_ARMY_BDU_4thIDSubd2ndlt",
"UNS_ARMY_BDU_4thIDSubdcol",
"UNS_ARMY_BDU_4thIDSubdcpl",
"UNS_ARMY_BDU_4thIDSubdcpt",
"UNS_ARMY_BDU_4thIDSubdFlak1stlt",
"UNS_ARMY_BDU_4thIDSubdFlak1stsgt",
"UNS_ARMY_BDU_4thIDSubdFlak2ndlt",
"UNS_ARMY_BDU_4thIDSubdFlakcol",
"UNS_ARMY_BDU_4thIDSubdFlakcpl",
"UNS_ARMY_BDU_4thIDSubdFlakcpt",
"UNS_ARMY_BDU_4thIDSubdFlakltcol",
"UNS_ARMY_BDU_4thIDSubdFlakmaj",
"UNS_ARMY_BDU_4thIDSubdFlakmsg",
"UNS_ARMY_BDU_4thIDSubdFlakpfc",
"UNS_ARMY_BDU_4thIDSubdFlakpv1",
"UNS_ARMY_BDU_4thIDSubdFlakpv2",
"UNS_ARMY_BDU_4thIDSubdFlaksfc",
"UNS_ARMY_BDU_4thIDSubdFlaksgm",
"UNS_ARMY_BDU_4thIDSubdFlaksgt",
"UNS_ARMY_BDU_4thIDSubdFlakspc",
"UNS_ARMY_BDU_4thIDSubdFlakspc5",
"UNS_ARMY_BDU_4thIDSubdFlakssg",
"UNS_ARMY_BDU_4thIDSubdltcol",
"UNS_ARMY_BDU_4thIDSubdmaj",
"UNS_ARMY_BDU_4thIDSubdmsg",
"UNS_ARMY_BDU_4thIDSubdpfc",
"UNS_ARMY_BDU_4thIDSubdpv1",
"UNS_ARMY_BDU_4thIDSubdpv2",
"UNS_ARMY_BDU_4thIDSubdsfc",
"UNS_ARMY_BDU_4thIDSubdsgm",
"UNS_ARMY_BDU_4thIDSubdsgt",
"UNS_ARMY_BDU_4thIDSubdspc",
"UNS_ARMY_BDU_4thIDSubdspc5",
"UNS_ARMY_BDU_4thIDSubdssg",
"UNS_ARMY_BDU_65",
"UNS_ARMY_BDU_68",
"UNS_ARMY_BDU_716thMPBn1stlt",
"UNS_ARMY_BDU_716thMPBn1stsgt",
"UNS_ARMY_BDU_716thMPBn2ndlt",
"UNS_ARMY_BDU_716thMPBn_Flak1stlt",
"UNS_ARMY_BDU_716thMPBn_Flak1stsgt",
"UNS_ARMY_BDU_716thMPBn_Flak2ndlt",
"UNS_ARMY_BDU_716thMPBn_Flakcol",
"UNS_ARMY_BDU_716thMPBn_Flakcpl",
"UNS_ARMY_BDU_716thMPBn_Flakcpt",
"UNS_ARMY_BDU_716thMPBn_Flakltcol",
"UNS_ARMY_BDU_716thMPBn_Flakmaj",
"UNS_ARMY_BDU_716thMPBn_Flakmsg",
"UNS_ARMY_BDU_716thMPBn_Flakpfc",
"UNS_ARMY_BDU_716thMPBn_Flakpv1",
"UNS_ARMY_BDU_716thMPBn_Flakpv2",
"UNS_ARMY_BDU_716thMPBn_Flaksfc",
"UNS_ARMY_BDU_716thMPBn_Flaksgm",
"UNS_ARMY_BDU_716thMPBn_Flaksgt",
"UNS_ARMY_BDU_716thMPBn_Flakspc",
"UNS_ARMY_BDU_716thMPBn_Flakspc5",
"UNS_ARMY_BDU_716thMPBn_Flakssg",
"UNS_ARMY_BDU_716thMPBncol",
"UNS_ARMY_BDU_716thMPBncpl",
"UNS_ARMY_BDU_716thMPBncpt",
"UNS_ARMY_BDU_716thMPBnltcol",
"UNS_ARMY_BDU_716thMPBnmaj",
"UNS_ARMY_BDU_716thMPBnmsg",
"UNS_ARMY_BDU_716thMPBnpfc",
"UNS_ARMY_BDU_716thMPBnpv1",
"UNS_ARMY_BDU_716thMPBnpv2",
"UNS_ARMY_BDU_716thMPBnsfc",
"UNS_ARMY_BDU_716thMPBnsgm",
"UNS_ARMY_BDU_716thMPBnsgt",
"UNS_ARMY_BDU_716thMPBnspc",
"UNS_ARMY_BDU_716thMPBnspc5",
"UNS_ARMY_BDU_716thMPBnssg",
"UNS_ARMY_BDU_82ndAB1stlt",
"UNS_ARMY_BDU_82ndAB1stsgt",
"UNS_ARMY_BDU_82ndAB2ndlt",
"UNS_ARMY_BDU_82ndABcol",
"UNS_ARMY_BDU_82ndABcpl",
"UNS_ARMY_BDU_82ndABcpt",
"UNS_ARMY_BDU_82ndABltcol",
"UNS_ARMY_BDU_82ndABmaj",
"UNS_ARMY_BDU_82ndABmsg",
"UNS_ARMY_BDU_82ndABpfc",
"UNS_ARMY_BDU_82ndABpv1",
"UNS_ARMY_BDU_82ndABpv2",
"UNS_ARMY_BDU_82ndABsfc",
"UNS_ARMY_BDU_82ndABsgm",
"UNS_ARMY_BDU_82ndABsgt",
"UNS_ARMY_BDU_82ndABspc",
"UNS_ARMY_BDU_82ndABspc5",
"UNS_ARMY_BDU_82ndABssg",
"UNS_ARMY_BDU_9thIDSubd1stlt",
"UNS_ARMY_BDU_9thIDSubd1stsgt",
"UNS_ARMY_BDU_9thIDSubd2ndlt",
"UNS_ARMY_BDU_9thIDSubdcol",
"UNS_ARMY_BDU_9thIDSubdcpl",
"UNS_ARMY_BDU_9thIDSubdcpt",
"UNS_ARMY_BDU_9thIDSubdFlak1stlt",
"UNS_ARMY_BDU_9thIDSubdFlak1stsgt",
"UNS_ARMY_BDU_9thIDSubdFlak2ndlt",
"UNS_ARMY_BDU_9thIDSubdFlakcol",
"UNS_ARMY_BDU_9thIDSubdFlakcpl",
"UNS_ARMY_BDU_9thIDSubdFlakcpt",
"UNS_ARMY_BDU_9thIDSubdFlakltcol",
"UNS_ARMY_BDU_9thIDSubdFlakmaj",
"UNS_ARMY_BDU_9thIDSubdFlakmsg",
"UNS_ARMY_BDU_9thIDSubdFlakpfc",
"UNS_ARMY_BDU_9thIDSubdFlakpv1",
"UNS_ARMY_BDU_9thIDSubdFlakpv2",
"UNS_ARMY_BDU_9thIDSubdFlaksfc",
"UNS_ARMY_BDU_9thIDSubdFlaksgm",
"UNS_ARMY_BDU_9thIDSubdFlaksgt",
"UNS_ARMY_BDU_9thIDSubdFlakspc",
"UNS_ARMY_BDU_9thIDSubdFlakspc5",
"UNS_ARMY_BDU_9thIDSubdFlakssg",
"UNS_ARMY_BDU_9thIDSubdltcol",
"UNS_ARMY_BDU_9thIDSubdmaj",
"UNS_ARMY_BDU_9thIDSubdmsg",
"UNS_ARMY_BDU_9thIDSubdpfc",
"UNS_ARMY_BDU_9thIDSubdpv1",
"UNS_ARMY_BDU_9thIDSubdpv2",
"UNS_ARMY_BDU_9thIDSubdsfc",
"UNS_ARMY_BDU_9thIDSubdsgm",
"UNS_ARMY_BDU_9thIDSubdsgt",
"UNS_ARMY_BDU_9thIDSubdspc",
"UNS_ARMY_BDU_9thIDSubdspc5",
"UNS_ARMY_BDU_9thIDSubdssg",
"UNS_ARMY_BDU_ANZAC_ERDLipatch",
"UNS_ARMY_BDU_ANZAC_ODipatch",
"UNS_ARMY_BDU_ARVN1stIDipatch",
"UNS_ARMY_BDU_ARVN22ndIDipatch",
"UNS_ARMY_BDU_ARVN2ndIDipatch",
"UNS_ARMY_BDU_ARVN33rdRangerBNFlakipatch",
"UNS_ARMY_BDU_ARVN33rdRangerBNipatch",
"UNS_ARMY_BDU_ARVN5thIDipatch",
"UNS_ARMY_BDU_ARVNAB2ipatch",
"UNS_ARMY_BDU_ARVNABipatch",
"UNS_ARMY_BDU_ARVNCamoFlak2iiipatch",
"UNS_ARMY_BDU_ARVNCamoFlak2iipatch",
"UNS_ARMY_BDU_ARVNCamoFlak2ipatch",
"UNS_ARMY_BDU_ARVNCamoFlak2ivpatch",
"UNS_ARMY_BDU_ARVNCamoFlakiiipatch",
"UNS_ARMY_BDU_ARVNCamoFlakiipatch",
"UNS_ARMY_BDU_ARVNCamoFlakipatch",
"UNS_ARMY_BDU_ARVNCamoFlakivpatch",
"UNS_ARMY_BDU_ARVNERDLFlakiiipatch",
"UNS_ARMY_BDU_ARVNERDLFlakiipatch",
"UNS_ARMY_BDU_ARVNERDLFlakipatch",
"UNS_ARMY_BDU_ARVNERDLFlakivpatch",
"UNS_ARMY_BDU_ARVNErdliiipatch",
"UNS_ARMY_BDU_ARVNErdliipatch",
"UNS_ARMY_BDU_ARVNErdlipatch",
"UNS_ARMY_BDU_ARVNErdlivpatch",
"UNS_ARMY_BDU_ARVNMCipatch",
"UNS_ARMY_BDU_ERDLipatch",
"UNS_ARMY_BDU_F",
"UNS_ARMY_BDU_ROKArmy9thIDipatch",
"UNS_ARMY_BDU_ROKArmyCMIDFlakipatch",
"UNS_ARMY_BDU_ROKArmyCMIDipatch",
"UNS_ARMY_BDU_ROKMC65Camoipatch",
"UNS_ARMY_BDU_ROKMC65ipatch",
"UNS_ARMY_BDU_SF_DuckHunter",
"UNS_ARMY_BDU_SF_DuckHunter2",
"UNS_ARMY_BDU_SF_EarlyWar1stlt",
"UNS_ARMY_BDU_SF_EarlyWar1stsgt",
"UNS_ARMY_BDU_SF_EarlyWar2ndlt",
"UNS_ARMY_BDU_SF_EarlyWarcol",
"UNS_ARMY_BDU_SF_EarlyWarcpl",
"UNS_ARMY_BDU_SF_EarlyWarcpt",
"UNS_ARMY_BDU_SF_EarlyWarltcol",
"UNS_ARMY_BDU_SF_EarlyWarmaj",
"UNS_ARMY_BDU_SF_EarlyWarmsg",
"UNS_ARMY_BDU_SF_EarlyWarpfc",
"UNS_ARMY_BDU_SF_EarlyWarpv1",
"UNS_ARMY_BDU_SF_EarlyWarpv2",
"UNS_ARMY_BDU_SF_EarlyWarsfc",
"UNS_ARMY_BDU_SF_EarlyWarsgm",
"UNS_ARMY_BDU_SF_EarlyWarsgt",
"UNS_ARMY_BDU_SF_EarlyWarspc",
"UNS_ARMY_BDU_SF_EarlyWarspc5",
"UNS_ARMY_BDU_SF_EarlyWarssg",
"UNS_ARMY_BDU_SF_LateWar1stlt",
"UNS_ARMY_BDU_SF_LateWar1stsgt",
"UNS_ARMY_BDU_SF_LateWar2ndlt",
"UNS_ARMY_BDU_SF_LateWarcol",
"UNS_ARMY_BDU_SF_LateWarcpl",
"UNS_ARMY_BDU_SF_LateWarcpt",
"UNS_ARMY_BDU_SF_LateWarltcol",
"UNS_ARMY_BDU_SF_LateWarmaj",
"UNS_ARMY_BDU_SF_LateWarmsg",
"UNS_ARMY_BDU_SF_LateWarpfc",
"UNS_ARMY_BDU_SF_LateWarpv1",
"UNS_ARMY_BDU_SF_LateWarpv2",
"UNS_ARMY_BDU_SF_LateWarsfc",
"UNS_ARMY_BDU_SF_LateWarsgm",
"UNS_ARMY_BDU_SF_LateWarsgt",
"UNS_ARMY_BDU_SF_LateWarspc",
"UNS_ARMY_BDU_SF_LateWarspc5",
"UNS_ARMY_BDU_SF_LateWarssg",
"UNS_ARMY_BDU_USA_BDU_Early1stlt",
"UNS_ARMY_BDU_USA_BDU_Early1stsgt",
"UNS_ARMY_BDU_USA_BDU_Early2ndlt",
"UNS_ARMY_BDU_USA_BDU_Earlycol",
"UNS_ARMY_BDU_USA_BDU_Earlycpl",
"UNS_ARMY_BDU_USA_BDU_Earlycpt",
"UNS_ARMY_BDU_USA_BDU_Earlyltcol",
"UNS_ARMY_BDU_USA_BDU_Earlymaj",
"UNS_ARMY_BDU_USA_BDU_Earlymsg",
"UNS_ARMY_BDU_USA_BDU_Earlypfc",
"UNS_ARMY_BDU_USA_BDU_Earlypv1",
"UNS_ARMY_BDU_USA_BDU_Earlypv2",
"UNS_ARMY_BDU_USA_BDU_Earlysfc",
"UNS_ARMY_BDU_USA_BDU_Earlysgm",
"UNS_ARMY_BDU_USA_BDU_Earlysgt",
"UNS_ARMY_BDU_USA_BDU_Earlyspc",
"UNS_ARMY_BDU_USA_BDU_Earlyspc5",
"UNS_ARMY_BDU_USA_BDU_Earlyssg",
"UNS_ARMY_BDU_USA_BDU_Late1stlt",
"UNS_ARMY_BDU_USA_BDU_Late1stsgt",
"UNS_ARMY_BDU_USA_BDU_Late2ndlt",
"UNS_ARMY_BDU_USA_BDU_Latecol",
"UNS_ARMY_BDU_USA_BDU_Latecpl",
"UNS_ARMY_BDU_USA_BDU_Latecpt",
"UNS_ARMY_BDU_USA_BDU_Lateltcol",
"UNS_ARMY_BDU_USA_BDU_Latemaj",
"UNS_ARMY_BDU_USA_BDU_Latemsg",
"UNS_ARMY_BDU_USA_BDU_Latepfc",
"UNS_ARMY_BDU_USA_BDU_Latepv1",
"UNS_ARMY_BDU_USA_BDU_Latepv2",
"UNS_ARMY_BDU_USA_BDU_Latesfc",
"UNS_ARMY_BDU_USA_BDU_Latesgm",
"UNS_ARMY_BDU_USA_BDU_Latesgt",
"UNS_ARMY_BDU_USA_BDU_Latespc",
"UNS_ARMY_BDU_USA_BDU_Latespc5",
"UNS_ARMY_BDU_USA_BDU_Latessg",
"UNS_ARMY_BDU_USAFSP_EarlyWar1stlt",
"UNS_ARMY_BDU_USAFSP_EarlyWar1stsgt",
"UNS_ARMY_BDU_USAFSP_EarlyWar1stsgt2",
"UNS_ARMY_BDU_USAFSP_EarlyWar2ndlt",
"UNS_ARMY_BDU_USAFSP_EarlyWara1c",
"UNS_ARMY_BDU_USAFSP_EarlyWaramn",
"UNS_ARMY_BDU_USAFSP_EarlyWarcmsg",
"UNS_ARMY_BDU_USAFSP_EarlyWarcol",
"UNS_ARMY_BDU_USAFSP_EarlyWarcpt",
"UNS_ARMY_BDU_USAFSP_EarlyWarltcol",
"UNS_ARMY_BDU_USAFSP_EarlyWarmaj",
"UNS_ARMY_BDU_USAFSP_EarlyWarmsg",
"UNS_ARMY_BDU_USAFSP_EarlyWarsgt",
"UNS_ARMY_BDU_USAFSP_EarlyWarsmsg",
"UNS_ARMY_BDU_USAFSP_EarlyWarsra",
"UNS_ARMY_BDU_USAFSP_EarlyWartsgt",
"UNS_ARMY_BDU_USAFSP_Flak1stlt",
"UNS_ARMY_BDU_USAFSP_Flak1stsgt",
"UNS_ARMY_BDU_USAFSP_Flak1stsgt2",
"UNS_ARMY_BDU_USAFSP_Flak21stlt",
"UNS_ARMY_BDU_USAFSP_Flak21stsgt",
"UNS_ARMY_BDU_USAFSP_Flak21stsgt2",
"UNS_ARMY_BDU_USAFSP_Flak22ndlt",
"UNS_ARMY_BDU_USAFSP_Flak2a1c",
"UNS_ARMY_BDU_USAFSP_Flak2amn",
"UNS_ARMY_BDU_USAFSP_Flak2cmsg",
"UNS_ARMY_BDU_USAFSP_Flak2col",
"UNS_ARMY_BDU_USAFSP_Flak2cpt",
"UNS_ARMY_BDU_USAFSP_Flak2ltcol",
"UNS_ARMY_BDU_USAFSP_Flak2maj",
"UNS_ARMY_BDU_USAFSP_Flak2msg",
"UNS_ARMY_BDU_USAFSP_Flak2ndlt",
"UNS_ARMY_BDU_USAFSP_Flak2sgt",
"UNS_ARMY_BDU_USAFSP_Flak2smsg",
"UNS_ARMY_BDU_USAFSP_Flak2sra",
"UNS_ARMY_BDU_USAFSP_Flak2tsgt",
"UNS_ARMY_BDU_USAFSP_Flaka1c",
"UNS_ARMY_BDU_USAFSP_Flakamn",
"UNS_ARMY_BDU_USAFSP_Flakcmsg",
"UNS_ARMY_BDU_USAFSP_Flakcol",
"UNS_ARMY_BDU_USAFSP_Flakcpt",
"UNS_ARMY_BDU_USAFSP_Flakltcol",
"UNS_ARMY_BDU_USAFSP_Flakmaj",
"UNS_ARMY_BDU_USAFSP_Flakmsg",
"UNS_ARMY_BDU_USAFSP_Flaksgt",
"UNS_ARMY_BDU_USAFSP_Flaksmsg",
"UNS_ARMY_BDU_USAFSP_Flaksra",
"UNS_ARMY_BDU_USAFSP_Flaktsgt",
"UNS_ARMY_BDU_USAFSP_MidWar1stlt",
"UNS_ARMY_BDU_USAFSP_MidWar1stsgt",
"UNS_ARMY_BDU_USAFSP_MidWar1stsgt2",
"UNS_ARMY_BDU_USAFSP_MidWar2ndlt",
"UNS_ARMY_BDU_USAFSP_MidWara1c",
"UNS_ARMY_BDU_USAFSP_MidWaramn",
"UNS_ARMY_BDU_USAFSP_MidWarcmsg",
"UNS_ARMY_BDU_USAFSP_MidWarcol",
"UNS_ARMY_BDU_USAFSP_MidWarcpt",
"UNS_ARMY_BDU_USAFSP_MidWarltcol",
"UNS_ARMY_BDU_USAFSP_MidWarmaj",
"UNS_ARMY_BDU_USAFSP_MidWarmsg",
"UNS_ARMY_BDU_USAFSP_MidWarsgt",
"UNS_ARMY_BDU_USAFSP_MidWarsmsg",
"UNS_ARMY_BDU_USAFSP_MidWarsra",
"UNS_ARMY_BDU_USAFSP_MidWartsgt",
"UNS_ARMY_BDU_USMC65Flak7ipatch",
"UNS_ARMY_BDU_USMC65Flakipatch",
"UNS_ARMY_BDU_USMC66ipatch",
"UNS_ARMY_BDU_USMC67Dirtyipatch",
"UNS_ARMY_BDU_USMC67ipatch",
"UNS_ARMY_ROKMC65Camo_ipatch",
"uns_army_ROKMC65Camo_ipatch",


"UNS_USMC_BDU",
"UNS_USMC_BDU_65",
"UNS_USMC_BDU_65_2",
"UNS_USMC_BDU_S",
"UNS_USMC_BDU_USMC651stlt",
"UNS_USMC_BDU_USMC651stsgt",
"UNS_USMC_BDU_USMC652ndlt",
"UNS_USMC_BDU_USMC65col",
"UNS_USMC_BDU_USMC65cpl",
"UNS_USMC_BDU_USMC65cpt",
"UNS_USMC_BDU_USMC65Flak2ipatch",
"UNS_USMC_BDU_USMC65Flak3ipatch",
"UNS_USMC_BDU_USMC65Flak4ipatch",
"UNS_USMC_BDU_USMC65Flak5ipatch",
"UNS_USMC_BDU_USMC65Flak6ipatch",
"UNS_USMC_BDU_USMC65gsgt",
"UNS_USMC_BDU_USMC65lcpl",
"UNS_USMC_BDU_USMC65ltcol",
"UNS_USMC_BDU_USMC65maj",
"UNS_USMC_BDU_USMC65mgsgt",
"UNS_USMC_BDU_USMC65msg",
"UNS_USMC_BDU_USMC65pfc",
"UNS_USMC_BDU_USMC65pvt",
"UNS_USMC_BDU_USMC65sgm",
"UNS_USMC_BDU_USMC65sgt",
"UNS_USMC_BDU_USMC65ssg",
"UNS_USMC_Flak",
"UNS_USMC_FLAK2_65",
"UNS_USMC_FLAK_65",
"UNS_USMC_Flak_E",
"UNS_USMC_Flak_ES",
"UNS_USMC_Flak_F",
"UNS_USMC_Flak_S",
"UNS_USMC_LERDL",

"UNS_SEAL_BDU_ED",
"UNS_SEAL_BDU_ET",
"UNS_SEAL_BDU_TD",
"UNS_SEAL_BDU_TS",

"UNS_RAR_ARMY_BDU",

"UNS_NZ_ARMY_BDU",
"UNS_PBR_Flak",
"UNS_PBR_Flak_S",

"UNS_SAS_BDU_E",
"UNS_SAS_BDU_G",
"UNS_SAS_BDU_T",
"UNS_SAS_BDU_T2"


		]	
	],
	[
		"CAMS_U_Guerilla_W",1,true,
		[
			"UNS_TIGER_BDU","UNS_TIGER2_BDU","UNS_TIGER3_BDU",
			"UNS_USMC_Flak","UNS_USMC_Flak_F","UNS_USMC_Flak_S","UNS_USMC_Flak_E","UNS_USMC_Flak_ES",
			"UNS_USMC_LERDL"
		]
	],	
	[
		"CAMS_U_Ghillie_W",1,true,
		[
			"UNS_SOG_BDU_BK","UNS_SOG_BDU_BT","UNS_SOG_BDU_O","UNS_SOG_BDU_OP","UNS_SOG_BDU_TS"
		]
	],
	[
		"CAMS_U_Aviation_W",1,true,
		[
			"UNS_JPilot_BDU","UNS_Pilot_BDU"
		]
	],
	[
		"CAMS_U_Wetsuit_W",1,true,
		[
		]
	],
	[	
		"CAMS_U_All_W",0,true,
		[
			"CAMS_U_Soldier_W","CAMS_U_Guerilla_W","CAMS_U_Ghillie_W","CAMS_U_Wetsuit_W","CAMS_U_Aviation_W"
		]
	],
	
	//////////////////////////////////////// Uniforms - EAST
	
	[
		"CAMS_U_Soldier_E",1,true,
		[
			"UNS_NVA_CC","UNS_NVA_CG","UNS_NVA_CK","UNS_NVA_CP",
			"UNS_NVA_G","UNS_NVA_GS",
			"UNS_NVA_K","UNS_NVA_KS"

		]	
	],
	[
		"CAMS_U_Guerilla_E",1,true,
		[
			"UNS_VC_B","UNS_VC_G","UNS_VC_K",
			"UNS_VC_S","UNS_VC_U"

		]
	],
	[
		"CAMS_U_Ghillie_E",1,true,
		[
			"UNS_DCCR_B","UNS_DCCR_BBS","UNS_DCCR_BTS",
			"UNS_DCCR_G","UNS_DCCR_GTS",
			"UNS_DCCR_TGS"
		]
	],
	[
		"CAMS_U_Aviation_E",1,true,
		[
			"UNS_NVA_CG","UNS_NVA_CK","UNS_NVA_CP"
		]
	],
	[
		"CAMS_U_Wetsuit_E",1,true,
		[
		]
	],
	[	
		"CAMS_U_All_E",0,true,
		[
			"CAMS_U_Soldier_E", "CAMS_U_Guerilla_E", "CAMS_U_Ghillie_E", "CAMS_U_Wetsuit_E", "CAMS_U_Aviation_E"
		]
	],

	//////////////////////////////////////////// Uniforms - Independant
/*	
	[
		"CAMS_U_Soldier_I",1,true,
		[
		]	
	],
	[
		"CAMS_U_Guerilla_I",1,true,
		[
		]
	],
	[
		"CAMS_U_Ghillie_I",1,true,
		[
		]
	],
	[
		"CAMS_U_Aviation_I",1,true,
		[
		]
	],
	[
		"CAMS_U_Wetsuit_I",1,true,
		[
		]
	],
	[	
		"CAMS_U_All_I",0,true,
		[
			"CAMS_U_Soldier_I", "CAMS_U_Guerilla_I", "CAMS_U_Ghillie_I", "CAMS_U_Wetsuit_I", "CAMS_U_Aviation_I"
		]
	],
*/		
	/////////////////////////////////////////////////////// Vest / Chest items
	////////////////////////////////////////////////////// May have to be broken down by EAST, WEST, IND in future or expansion packs
/*
	[
		"CAMS_V_Bandolliers",1,true,
		[
		]
	],
	[
		"CAMS_V_Chestrig",1,true,
		[
		]
	],
*/
	[
		"CAMS_V_Vests_W",1,true,
		[
			// West - CIV?
			"UNS_JP_Vest","UNS_JP_Vest2","UNS_FLAK",
			"UNS_ANZAC_VEST","UNS_ANZAC_VEST_C",
			"UNS_M1956_P1", //Pilot
			"UNS_M1956_T1", //Tanker
			
			//West - Army
			"UNS_M1956_A1","UNS_M1956_A2","UNS_M1956_A3","UNS_M1956_A4","UNS_M1956_A5","UNS_M1956_A6",
			"UNS_M1956_A7","UNS_M1956_A8","UNS_M1956_A9","UNS_M1956_A10","UNS_M1956_A11","UNS_M1956_A12",
			
			//West - USMC
			"UNS_M1956_M1","UNS_M1956_M2","UNS_M1956_M3","UNS_M1956_M4","UNS_M1956_M5","UNS_M1956_M6",
			"UNS_M1956_M7","UNS_M1956_M8","UNS_M1956_M9","UNS_M1956_M10","UNS_M1956_M11","UNS_M1956_M12",
			"UNS_M1956_M13","UNS_M1956_M14","UNS_M1956_M15","UNS_M1956_M16","UNS_M1956_M17","UNS_M1956_M18",
			"UNS_M1956_M19","UNS_M1956_M20","UNS_M1956_M21","UNS_M1956_M22","UNS_M1956_M23","UNS_M1956_M24",
			"UNS_M1956_M25","UNS_M1956_M26","UNS_M1956_M27","UNS_M1956_M28","UNS_M1956_M29","UNS_M1956_M30",
			"UNS_M1956_M31","UNS_M1956_M32","UNS_M1956_M33","UNS_M1956_M34","UNS_M1956_M35","UNS_M1956_M36",
			
			"UNS_M1956_LRRP1",
			
			"UNS_M1956_N1","UNS_M1956_N2","UNS_M1956_N3","UNS_M1956_N4",

			 
			 //West - SOG
			"UNS_M1956_S1","UNS_M1956_S2","UNS_M1956_S3","UNS_M1956_S4"
		]
	],
	[
		"CAMS_V_Vests_E",1,true,
		[			
			//East - VC
			"UNS_VC_A1","UNS_VC_A2","UNS_VC_A3","UNS_VC_S1","UNS_VC_S2",
			"UNS_VC_MG","UNS_VC_SP","UNS_VC_B1",

			//EAST - NVA
			"UNS_NVA_A1","UNS_NVA_A2","UNS_NVA_A3","UNS_NVA_S1","UNS_NVA_S2",
			"UNS_NVA_GR","UNS_NVA_MG","UNS_NVA_SP","UNS_NVA_B1","UNS_NVA_G1",
			
			"uns_sas_web_1","uns_sas_web_1_gl",
			"uns_sas_web_2","uns_sas_web_2_gl",
			"uns_sas_web_3","uns_sas_web_3_ugl",
			"uns_vc_chestrig"
		]
	],
	[
		"CAMS_V_Vests",0,true,
		[
			"CAMS_V_Vests_W","CAMS_V_Vests_E"
		]
	],
	
/*	
	[
		"CAMS_V_Harness",1,true,
		[
		]
	],
	[
		"CAMS_V_Plate",1,true,
		[
		]
	],
	[
		"CAMS_V_Rebreather",1,true,
		[
		]
	],
*/
	[
		"CAMS_V_All",0,true,
		[
			"CAMS_V_Bandolliers", "CAMS_V_Chestrig", "CAMS_V_Vests", "CAMS_V_Harness", "CAMS_V_Plate"
		]
	],
		// Head/Hat items
	[
		"CAMS_H_Caps_W",1,true,
		[
			// West - Headbands
			"UNS_Headband_OD","UNS_Headband_OD2","UNS_Headband_ED","UNS_Headband_BK",
			
			"uns_sas_headband_erdl","uns_sas_headband_green","uns_sas_headband_scrim","uns_sas_headband_tiger",


			// West - Bandanas
			"uns_bandana_od","uns_bandana_od2","uns_bandana_od3",
			
			"uns_sas_bandana_erdl","uns_sas_bandana_green","uns_sas_bandana_tiger",

			// Civ - Hats
			"uns_field_cap"
		]
	],
	[
		"CAMS_H_Caps_E",1,true,
		[
			// East - Basic Hats
			"UNS_Headband_VC","UNS_Conehat_VC",
			
			"uns_vc_headband_blue",

			
			// Civ - Hats
			"uns_field_cap"
		]
	],	[
		"CAMS_H_Caps",0,true,
		[
			"CAMS_H_Caps_W","CAMS_H_Caps_E"
		]
	],	
	[
		"CAMS_H_RegHelmet_W",1,true,////////////////////////////////////////////////////////
		[			
			// West - USMC
			"UNS_M1_1","UNS_M1_10","UNS_M1_10_vkm","UNS_M1_11","UNS_M1_12","UNS_M1_13","UNS_M1_14","UNS_M1_14_dead",
			"UNS_M1_15","UNS_M1_16","UNS_M1_17","UNS_M1_18","UNS_M1_19","UNS_M1_1A","UNS_M1_1B","UNS_M1_1RM",
			
			"UNS_M1_2","UNS_M1_20","UNS_M1_21","UNS_M1_22","UNS_M1_23","UNS_M1_24","UNS_M1_25","UNS_M1_2A","UNS_M1_3",
			"UNS_M1_3_cal","UNS_M1_3_loy","UNS_M1_3A","UNS_M1_4","UNS_M1_4A","UNS_M1_5","UNS_M1_5A","UNS_M1_6",
			"UNS_M1_6_nyg","UNS_M1_6_Outnow","UNS_M1_6A","UNS_M1_7","UNS_M1_7_baby","UNS_M1_7_lbj","UNS_M1_7A","UNS_M1_8",
			"UNS_M1_8A","UNS_M1_9","UNS_M1_9A","UNS_M1_AFT","UNS_M1_MP","UNS_M1_PBR","UNS_M1_SP",
			
			"UNS_USMC_Cover",

			// West - PBR Crew
			"UNS_M1_PBR",
			
			// West - ARVN
			"UNS_M1_1V1","UNS_M1_1V2","UNS_M1_1V1N",
			
			// West - ARVN Ranger
			"UNS_M1_1V3","UNS_M1_1V4","UNS_M1_1V5","UNS_M1_1V6","UNS_M1_1V7","UNS_M1_1V8",
			
			// West - ARVN Marine
			"UNS_M1_1RM"
		]
	],
	[
		"CAMS_H_LightHelmet_W",1,true,///////////////////////////////////////////////////////
		[
			// West - Army
			"UNS_M1_9A","UNS_M1_8A","UNS_M1_7A","UNS_M1_6A","UNS_M1_5A","UNS_M1_4A","UNS_M1_3A","UNS_M1_2A","UNS_M1_1A",
			
			// West - USAF
			"UNS_M1_AFT",
			
			// West - Military Police
			"UNS_M1_MP",
			
			// West - USAF 377th
			"UNS_M1_SP"
		]
	],	
	[
		"CAMS_H_LightHelmet_E",1,true,///////////////////////////////////////////////////////
		[
			// East - PAVN Helmets
			"UNS_NVA_SSH40","UNS_NVA_SSH60","UNS_NVA_CHBG","UNS_PAVN_HN","UNS_PAVN_HC","UNS_PAVN_HG"
		]
	],
	[
		"CAMS_H_LightHelmet",0,true,///////////////////////////////////////////////////////
		[
			"CAMS_H_LightHelmet_W","CAMS_H_LightHelmet_E"
		]
	],	
	[
		"CAMS_H_RegHelmet_E",1,true,/////////////////////////////////////////////////////////
		[
			// East - NVA
			"UNS_NVA_HG","UNS_NVA_HGG","UNS_NVA_HK","UNS_NVA_HKG",
			
			"UNS_NVA_CH","UNS_NVA_CHB","UNS_NVA_CHBG","UNS_NVA_CHG",
			
			"UNS_NVA_PL","UNS_NVA_PLC",
			
			"UNS_NVA_SSH40","UNS_NVA_SSH60"
		]
	],
	[
		"CAMS_H_RegHelmet",0,true,
		[
			"CAMS_H_RegHelmet_W","CAMS_H_RegHelmet_E"
		]
	],
	
	[
		"CAMS_H_Boonie_W",1,true,
		[
			// West - Tiger
			"UNS_Boonie_TIG","UNS_Boonie_TIG1","UNS_Boonie_TIG2","UNS_Boonie_TIGF","UNS_Boonie_TIGF2",
			"UNS_Boonie_TIGF3","UNS_Boonie_TIGF4",
			
			//West - Soldier
			"UNS_Boonie_OD","UNS_Boonie_OD2","UNS_Boonie_ODF","UNS_Boonie_ODP",
			
			//West - Duck Hunter
			"UNS_Boonie_DK","UNS_Boonie_DKF",
			
			//West - LIME
			"UNS_Boonie_ERDL","UNS_Boonie_ERDL2","UNS_Boonie_ERDL3",
			
			// Civ - Boonie
			"UNS_Boonie_4","UNS_Boonie_5","UNS_Boonie_6",
			
			"uns_sas_booniehat_erdl","uns_sas_booniehat_erdl2","uns_sas_booniehat_green","uns_sas_booniehat_green2",
			
			"uns_sas_booniehat_tiger","uns_sas_booniehat_tiger2","uns_sas_booniehat_tiger3","uns_sas_booniehat_tiger4"

		]
	],
	[
		"CAMS_H_Boonie_E",1,true,
		[	
			"uns_sas_booniehat_vc","uns_sas_booniehat_vc_tan",

			
			// East - VC
			"UNS_Boonie_VC","UNS_Boonie2_VC","UNS_Boonie3_VC","UNS_Boonie4_VC",
			"UNS_Boonie5_VC" // PAVN VC
		]
	],	[
		"CAMS_H_Boonie",0,true,
		[
			"CAMS_H_Boonie_W","CAMS_H_Boonie_E"
		]
	],	
	[
		"CAMS_H_Berets_W",1,true,
		[
			"UNS_BERET_22nd",
			
			"UNS_Beret_3","UNS_Beret_4","UNS_Beret_5",

			"UNS_Beret_B","UNS_Beret_MAJ","UNS_BERET_MAJ","UNS_Beret_MRF",

			
			"UNS_Beret_MRF","UNS_Beret_MAJ","UNS_Beret_B",
			
			"UNS_Beret_51LT","UNS_Beret_52LT","UNS_Beret_5COL","UNS_Beret_5CPT","UNS_Beret_5LTCOL",
			
			"UNS_Beret_AVAB","UNS_Beret_AVM","UNS_Beret_AVR"
		]
	],
	[
		"CAMS_H_Berets_E",1,true,
		[
			"UNS_Beret_MRF","UNS_Beret_B",
			
			"UNS_Beret_5","UNS_Beret_51LT","UNS_Beret_52LT","UNS_Beret_5CPT","UNS_Beret_5MAJ","UNS_Beret_5LTCOL","UNS_Beret_5COL",
			
			"UNS_Beret_AVAB","UNS_Beret_AVM","UNS_Beret_AVR"
		]
	],
	/*
	[
		"CAMS_H_Shemags",1,true,
		[
		]
	],
	[
		"CAMS_H_SuperHelmet",1,true,
		[
		]
	],
	[
		"CAMS_H_SpecOps",1,true,
		[
		]
	],
	*/
	[
		"CAMS_H_Aviation_W",1,true,
		[
			// West - Crew 
			"UNS_TC_1","UNS_TC_2",
			
			// West - Heli
			"UNS_HP_Helmet","UNS_HP_Helmet_11AC","UNS_HP_Helmet_17AC","UNS_HP_Helmet_1AC","UNS_HP_Helmet_1MD","UNS_HP_Helmet_AUS",
			"UNS_HP_Helmet_OG","UNS_HP_Helmet_R33","UNS_HP_Helmet_R8",
			"UNS_HP_Helmet_REBEL","UNS_HP_Helmet_TIGER","UNS_HP_Helmet_USA",

			
			// West - Jet
			"UNS_JP_Helmet","UNS_JP_Helmet2","UNS_JP_Helmet_352TFS","UNS_JP_Helmet_366TFW","UNS_JP_Helmet_389TFS"

		]
	],

	[
		"CAMS_H_Aviation_E",1,true,
		[
			// East - Crew 
			"UNS_NVA_CH","UNS_NVA_CHG","UNS_NVA_CHB",
			
			// East - Pilot
			"UNS_NVA_PL","UNS_NVA_PLC"
		]
	],
	[
		"CAMS_H_Aviation",0,true,
		[
			"CAMS_H_Aviation_W","CAMS_H_Aviation_E"
		]
	],
	
	
	[
		"CAMS_H_Civ",0,true,
		[
			"CAMS_H_Caps", "CAMS_H_Beanies", "CAMS_H_Bandannas", "CAMS_H_Hats"
		]
	],
	[
		"CAMS_H_Hunter",0,true,
		[
			"CAMS_H_Caps", "CAMS_H_Boonie", "CAMS_H_Shemags"
		]
	],
	[	
		"CAMS_H_Military",0,true,
		[
			"CAMS_H_Berets", "CAMS_H_LightHelmet", "CAMS_H_RegHelmet", "CAMS_H_SuperHelmet", 
			"CAMS_H_SpecOps"
		]
	],
	[
		"CAMS_H_ALL",0,true,
		[
			"CAMS_H_Military", "CAMS_H_Civ", "CAMS_H_Boonie", "CAMS_H_Shemags", "CAMS_H_Aviation"
		]
	],
	///////////////////////////////////////////////////////////// Glasses
	[
		"CAMS_G_Regular",1,true,
		[
			"UNS_Band_H_gh","UNS_Band_H","UNS_Band_L","UNS_Bandana_A",
			"UNS_Bullets","UNS_Ear","UNS_Finger",
			"UNS_Goggles_NVA",
			"UNS_M17",
			"UNS_Peace",
			"uns_sas_scalf_blue","uns_sas_scalf_red","uns_sas_scrim","uns_sas_scrim2",
			"UNS_Towel","UNS_Towel_Long"

		]
	],	
	[
		"CAMS_G_Tactical",1,true,
		[
		]
	],
	[
		"CAMS_G_Sport",1,true,
		[
		]
	],
	[
		"CAMS_G_Shades",1,true,
		[
		]
	],
	[
		"CAMS_G_Lady",1,true,
		[
		]
	],	
	[
		"CAMS_G_Bandana",1,true,
		[
		]
	],
	[
		"CAMS_G_Balaclava",1,true,
		[
			"UNS_Scarf_1stCav","UNS_Scarf_ARVN",
			"UNS_Scarf_BK","UNS_Scarf_BK_W","UNS_Scarf_Blue",
			"UNS_Scarf_GR","UNS_Scarf_OD","UNS_Scarf_PL","UNS_Scarf_Red"
		]
	],

	[
		"CAMS_G_ALL_Guer",0,true,
		[
			"CAMS_G_Regular","CAMS_G_Tactical","CAMS_G_Sport","CAMS_G_Shades", "CAMS_G_Bandana", "CAMS_G_Balaclava"
		]
	],
	[
		"CAMS_G_ALL_CIV",0,true,
		[
			"CAMS_G_Regular","CAMS_G_Sport","CAMS_G_Shades", "CAMS_G_Lady"
		]
	],	
	[
		"CAMS_G_ALL_Mil",0,true,
		[
			"CAMS_G_Tactical","CAMS_G_Sport","CAMS_G_Shades"
		]
	],
	[
		"CAMS_G_ALL",0,true,
		[
			"CAMS_G_Regular","CAMS_G_Tactical","CAMS_G_Sport","CAMS_G_Shades", "CAMS_G_Lady", "CAMS_G_Bandana", 
			"CAMS_G_Balaclava"
		]
	],
/*	
	/////////////////////////////////////////////////////
	///////////// CAMS AI Models ////////////////////////
	/////////////////////////////////////////////////////
	// This whole section should be rebuilt to your content but keep the global groupings at the end
	// Just swap out your own global names
	
	/////////////// EAST
	[
		"CAMS_AI_FIA_E",1,true,
		[
		]
	],
	[
		"CAMS_AI_CSAT_SOLDIER",1,true,
		[
		]
	],
	[
		"CAMS_AI_CSAT_URBAN",1,true,
		[
		]
	],
	[
		"CAMS_AI_CSAT_SF",1,true,
		[
		]
	],
	[
		"CAMS_AI_ALL_E",0,true,
		[
			"CAMS_AI_FIA_E",
			"CAMS_AI_CSAT_SOLDIER",
			"CAMS_AI_CSAT_URBAN",
			"CAMS_AI_CSAT_SF"
		]
	],				
	//////////////// WEST
	[
		"CAMS_AI_FIA_W",1,true,
		[
		]
	],
	[
		"CAMS_AI_NATO_SOLDIER",1,true,
		[
		]
	],
	[
		"CAMS_AI_NATO_SF",1,true,
		[
		]
	],
	[
		"CAMS_AI_ALL_W",0,true,
		[
			"CAMS_AI_FIA_W","CAMS_AI_NATO_SOLDIER","CAMS_AI_NATO_SF"
		]
	],
	
	//////////////// IND
	[
		"CAMS_AI_FIA_I",1,true,
		[
		]
	],
	[
		"CAMS_AI_AAF",1,true,
		[
		]
	],
	[
		"CAMS_AI_AAF_SF",1,true,
		[
		]
	],
	[
		"CAMS_AI_ALL_I",0,true,
		[
			"CAMS_AI_FIA_I","CAMS_AI_AAF","CAMS_AI_AAF_SF"
		]
	],
	

	//////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Items ///////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////
*/
	// Navigation and Belt Items
	[
		"CAMS_I_Navigation",1,true,
		[
			// West Radio
			"ItemRadio",
			"UNS_ItemRadio_PRC_25","UNS_ItemRadio_PRC_90","UNS_ItemRadio_T_884",
			"UNS_ItemRadio_Transistor_1","UNS_ItemRadio_Transistor_2",
			"UNS_ItemRadio_PRC25_TFAR","UNS_ItemRadio_PRC_90_TFAR","UNS_ItemRadio_T884_TFAR"
		]
	],
	
	[
		"CAMS_I_Misc",1,true,
		[
			"uns_leaflet8","uns_item_ashtray","uns_item_bugjuice","uns_item_bugspray","uns_item_camera",
			"uns_item_P38","uns_item_dong","uns_leaflet2","uns_item_condoms","uns_item_messtin","uns_item_pin",
			"uns_leaflet15","uns_leaflet11","uns_item_LRRPstew","uns_item_messpass","uns_leaflet10","uns_leaflet9",
			"uns_item_map1","uns_item_map2","uns_leaflet13","uns_leaflet1","uns_leaflet6","uns_leaflet12",
			"uns_leaflet5","uns_leaflet3","uns_item_MPC","uns_item_smokes","uns_leaflet4","uns_leaflet7",
			"uns_leaflet16","uns_leaflet14","uns_item_zippo",
			
			"UNS_EAM2Braft","uns_ItemFuelcan","uns_ItemFuelcanEmpty",
			"uns_ItemSiphon","uns_BA1568","uns_ItemM57clacker","UNS_sharkchaser"
		]
	],

	// Meds - Has all vanilla stuff since its more for loot and random AI loot, but break up if you want or if your content has a lot of custom stuff here
	[
		"CAMS_I_Meds",1,true,
		[
			"FirstAidKit","Medikit","ToolKit"
		]
	],	
	
	// Backpacks
	[
		"CAMS_Packs_W",1,true,
		[
			// CIV?
			"uns_civ_r1","uns_civ_r2","uns_civ_r3",
			
			
			// West 
			"UNS_Alice_F1","UNS_Alice_F2","UNS_Alice_F3","UNS_Alice_F4","UNS_Alice_F5","UNS_Alice_F6","UNS_Alice_F7","UNS_Alice_F8","UNS_Alice_F9","UNS_Alice_F10",
			"UNS_Alice_F11",
			"UNS_Alice_FR",
			"UNS_Alice_1","UNS_Alice_2","UNS_Alice_3","UNS_Alice_4","UNS_Alice_5","UNS_Alice_6",
			
			"UNS_Alice_DEM","UNS_Alice_DEM2",
			"UNS_Alice_LRP1","UNS_Alice_LRP2",
			"UNS_Alice_MED","UNS_Alice_MED2",
			"UNS_Alice_SOG","UNS_Alice_SOG2",

			"UNS_ARMY_RTO","UNS_ARMY_RTO2","UNS_SF_RTO","UNS_SF_RTO2","UNS_ARMY_MED","UNS_ARMY_MED2",
			"UNS_USMC_E1","UNS_USMC_E2","UNS_USMC_E3","UNS_USMC_E4","UNS_USMC_E5",
			"UNS_USMC_R1","UNS_USMC_R2","UNS_USMC_R3","UNS_USMC_MED","UNS_USMC_RTO","UNS_USMC_RTO2",

			"uns_sas_alicepack_1","uns_sas_alicepack_2","uns_sas_alicepack_3","uns_sas_alicepack_4","uns_sas_alicepack_RTO"


		]
	],
	[
		"CAMS_Packs_E",1,true,
		[
			// Guer??
			"UNS_TROP_R1","UNS_TROP_R2","UNS_TROP_R3",
			
			// East
			"UNS_NVA_RTO","UNS_NVA_RPG","UNS_NVA_MED","UNS_NVA_R1","UNS_NVA_R3","UNS_NVA_RC","UNS_NVA_RPG2",
			"UNS_VC_r1","UNS_VC_r1_rpg","UNS_NVA_MED","UNS_NVA_MED2"

		]
	],
	[
		"CAMS_Packs_ALL",0,true,
		[
			"CAMS_Packs_W", "CAMS_Packs_E"
		]
	],
	
	// Ammo
	// Setting this in the 'magazine' section of loot configuration (LootData.sqf) will ensure ammo for each weapon specified in the weapon section is also part
	//  of the loot definition.
	/*  MAY REMOVE SINCE THIS IS CORE FUNCTION
		"FuMS_AmmoForEach",1,true,
	[
		"FuMS_AmmoForEach"];
	*/

	// Flares
	[
		"CAMS_Flares_Chemical",1,true,
		[
		]
	],
	[
		"CAMS_Flares_Normal",1,true,
		[
		]
	],
	[
		"CAMS_Flares_1Rnd",1,true,
		[
			"uns_m127a1_flare"
		]
	],
	[
		"CAMS_Flares_3Rnd",1,true,
		[
		]
	],
	[
		"CAMS_Flares_ALL",0,true,
		[
			"CAMS_Flares_Chemical", "CAMS_Flares_Normal", "CAMS_Flares_1Rnd", "CAMS_Flares_3rnd"
		]
	],

	//Smokes
	[
		"CAMS_Smoke_Shell",1,true,
		[
		]
	],
	
	[
		"CAMS_Smoke_W",1,true,
		[
			// West
			"uns_m18Purple","uns_m18Yellow","uns_m18Green","uns_m18red","uns_m18white","uns_m18Orange","uns_m18Blue"

		]
	],
	[
		"CAMS_Smoke_E",1,true,
		[
			// East 
			"uns_rdg2","uns_rdg3"		
		]
	],
	[
		"CAMS_Smoke_ALL",0,true,
		[
			"CAMS_Smoke_W", "CAMS_Smoke_E"
		]
	],
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////// Explosives ///////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////
	

	// Grenades
	[
		"CAMS_Grenade_W",1,true,   ///////////////////////////////////////////////// FIX IN VANILLA
		[
			"uns_v40gren","uns_m61gren","uns_m67gren","uns_m34gren","uns_m14gren","uns_m308gren","uns_mk3a2gren","uns_mk40gren"
		]
	],
	[
		"CAMS_Grenade_E",1,true,   ///////////////////////////////////////////////// FIX IN VANILLA
		[
			"uns_molotov_mag","uns_f1gren","uns_rg42gren","uns_t67gren","uns_rgd33gren","uns_rgd5gren"
		]
	],
	/*
	[
		"CAMS_Grenade_IR_W",1,true,
		[
		]
	],
	[
		"CAMS_Grenade_IR_E",1,true,
		[
		]
	],
	[
		"CAMS_Grenade_IR_I",1,true,
		[
		]
	],	
	[
		"CAMS_Grenade_ALLIR_ALL",0,true,
		[
			"CAMS_Grenade_IR_W","CAMS_Grenade_IR_E","CAMS_Grenade_IR_I"
		]
	],
	*/
	// Explosive Shells
	[
		"CAMS_Shells_1Rnd",1,true,
		[
			"uns_1rnd_30mm_frag","uns_1rnd_22mm_frag","uns_1rnd_22mm_m1a2_frag"
		]
	],
	[
		"CAMS_Shells_3Rnd",1,true,
		[
		]
	],
	// Mines
	[
		"CAMS_Bombs_Mines",1,true,
		[
			// West - Mines
			"Mine",
			
			"uns_mine_M14","uns_mine_M16","uns_mine_M18_remote","uns_mine_M18","uns_mine_md82","uns_mine_m64","uns_mine_AP",
			
			
			"uns_mine_ammo_mag","uns_mine_beer_mag","uns_mine_cigs_mag","uns_mine_fkit_mag","uns_mine_fuel_mag",
			"uns_mine_guitar_mag","uns_mine_radio_mag",
			
			"uns_traps_claymore_mag","uns_traps_claymore_remote_mag","uns_traps_nade_mag7","uns_traps_flare_mag",
			"uns_traps_nade_mag3","uns_traps_m7_mag","uns_traps_nade_mag",
			
			"uns_traps_punj2_mag","uns_traps_punj1_mag","uns_traps_punj4_mag","uns_traps_punj5_mag",
			
			"uns_traps_nade_mag5","uns_traps_nade_mag4","uns_traps_nade_mag6"
		]
	],// IEDs
	[
		"CAMS_Bombs_IED",1,true,
		[
			// SORT 
			"pipebomb","MineE","uns_mine_tm57","Mine ","uns_mine_t59",
			
			// West - M118 C4 Charge
			"uns_M118_mag_remote",
			
			// West - Pipebomb
			"PipeBomb",
			
			// East - RKG3 Anti Tank mine
			"uns_rkg3gren"
		]
	],	
	[
		"CAMS_Grenade_ALL",0,true,
		[
			"CAMS_Grenade_ALL", "CAMS_Grenade_ALLIR_ALL", "CAMS_Shells_1Rnd", "CAMS_Shells_3Rnd", "CAMS_Bombs_Mines", "CAMS_Bombs_IED"
		]
	],


	/////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////// Weapons ////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////
	
	// Weapon attachments
	[
		"CAMS_W_Pointer",1,true,
		[
			// East
			"uns_b_m70_camo","uns_b_m40_camo","uns_b_spike","uns_b_m7","uns_b_m6","uns_b_m30","uns_b_mas49","uns_b_m4",
			"uns_b_m1917","uns_b_m1884","uns_b_6h3","uns_b_1937","uns_b_spike17","uns_b_sks"
		]
	],
	[
		"CAMS_W_Bipod",1,true,
		[
			// East
			"uns_bp_DP28","uns_bp_MG42","uns_bp_PKM","uns_bp_RPD","uns_bp_RPK","uns_bp_RPK40","uns_bp_m60","uns_bp_M63"

		]
	],
	[
		"CAMS_W_Muzzle",1,true,
		[
			// West
			"uns_s_M14","uns_s_M16","uns_s_Mac10","uns_s_M3a1","uns_s_UZI","uns_s_sten","uns_s_M1911","uns_s_PPK",
			
			
			// East
			"uns_s_aps","uns_s_m45","uns_s_m14","uns_s_m16","uns_s_m3a1","uns_s_mac10","uns_s_mat49","uns_s_pbs1",
			"uns_s_ppk","uns_s_sten","uns_s_uzi"
		]
	],
	[
		"CAMS_W_OpticsLv1",1,true,
		[
			// West 
			"uns_o_colt4x","uns_o_RedfieldART","uns_o_Unertl8x","uns_o_LeatherwoodART","uns_o_LetherwoodART_m16","uns_o_colt4x",
			"uns_o_ANPVS2","uns_o_ANPVS2_m16","uns_o_APXSOM","uns_o_M63",
			
			// East
			"uns_o_APXSOM","uns_o_PSO1","uns_o_PSO1_camo","uns_o_PU"
		]
	],
	/*
	[
		"CAMS_W_OpticsLv2",1,true,
		[
		]
	],
	[
		"CAMS_W_OpticsLv3",1,true,
		[
		]
	],
	*/
	[
		"CAMS_W_Optics_ALL",0,true,
		[
			"CAMS_W_OpticsLv1", "CAMS_W_OpticsLv2", "CAMS_W_OpticsLv3"
		]
	],
	[
		"CAMS_W_Attachments_ALL",0,true,
		[
			"CAMS_W_Pointer", "CAMS_W_Bipod", "CAMS_W_Muzzle", "CAMS_W_Optics_ALL"
		]
	],
	
	// ******* WEAPONS - WEST ********************	
	[
		"CAMS_Pistols_W",1,true,
		[
			"uns_mkvFlarePistol",
			
			// West - 1911 pistols with flashlights
			"uns_MX991_m1911","uns_MX991_g","uns_MX991_w","uns_MX991_r",
			// "uns_MX991_m1911SD", // Comes with attachment
			
			// West - S&W Pistols
			"uns_38spec","uns_357m",
			
			// West - Colt Pistols
			"uns_m1911",
			"uns_m1911SD", // Comes with attachment
			"uns_coltcmdr",
			
			// West - Browning HP
			"uns_bhp",
			
			// West - Ruger
			"uns_Ruger",
			
			// West - Walther
			"uns_ppk"
			// "uns_ppkSD"	// Comes with attachment
		]
	],
	[
		"CAMS_SMG_W",1,true,
		[
			// West - Uzi
			"uns_uzi","uns_uzif",
			//"uns_uzi_SD",
			
			// West - MAC-10
			"uns_mac10",
			//"uns_mac10sd",
			
			// West - M/45
			"uns_m45","uns_m45f",
			
			// West - Sten
			"uns_sten",
			//"uns_stensd",
			
			// West - Sterling
			"uns_Sterling",
			//"uns_SterlingSD",
			
			// West - Thompson
			"uns_thompson",
			
			// West - M3A1 Greasegun
			"uns_m3a1"
			//"uns_m3sd",
		]
	],
	[
		"CAMS_Shotgun_W",1,true,   ///////// FIX IN VANILLA
		[
			// West - Ithaca 37
			"uns_ithaca37grip",
			
			// West - Winchester 1997
			"uns_m1897riot","uns_m1897",
			
			// West - Model 12 Trench Gun 
			"uns_model12",
			
			// West - Remington 870
			"uns_m870","uns_m870_mk1"
		]
	],
	[
		"CAMS_GL_W",1,true,
		[
			// West - China Lake 40mm GL
			"uns_ex41",
			
			// West - M-79 40mm GL
			"uns_m79","uns_m79p"
		]
	],	
	[
		"CAMS_LMG_W",1,true,
		[
			// West - Stoner M63
			"uns_M63a_AR","uns_m63a_drum","uns_M63a_LMG","uns_M63asupport",
			
			// West - M-1918 BAR
			"uns_bar",
			
			// West - M60
			"uns_m60shorty","uns_m60","uns_m60support",
			
			//West - RPD
			"uns_rpdsog"
		]
	],
	/*
	[
		"CAMS_MMG_W",1,true,
		[
		]
	],
	*/
	[
		"CAMS_AssaultRifles_W",1,true,
		[
			// West - M16 (Lots of flavors)
			"uns_M16","uns_M16_bayo",
			//"uns_M16_SD",
			
			"uns_M16_M203","uns_M16_XM148","uns_M16_XM148_camo",
			//"uns_M16s","uns_M16_NV","uns_M16_NVsd","uns_M16s_sd",
			
			"uns_M16A1","uns_M16A1_HBAR","uns_M16A1_bayo",
			//"uns_M16a1_SD","uns_M16A1_NV","uns_M16A1_NVsd",
			"uns_m16a1_m203",
			//"uns_M16A1s","uns_M16s","uns_M16A1s_sd",
			
			
			
			
			// West - M-1 Garand
			"uns_m1garand","uns_m1garandbayo",
			
			// West - M-1 Carbine
			"uns_m1carbine",
			//"uns_m1garands",
			
			// West - M-2 Carbine
			"uns_m2carbine",
			
			// West - L1A1 SLR
			"uns_l1a1","uns_l1a1gl",
			
			// West - M-14
			"uns_m14","uns_m14bayo"
			//"uns_m14sd",
			
			
			
		]
	],
	[
		"CAMS_SniperRifles_W",1,true,
		[
			// West - XM-21 Sniper Rifle
			"uns_m21",
			//"uns_m21sd","uns_m21nv","uns_m21nvsd",
			
			// West - Winchester Model 70
			"uns_model70"
			//,"uns_model70sd","uns_model70nv","uns_model70nvsd"
		]
	],
	[
		"CAMS_AA_W",1,true,
		[
		]
	],
	[
		"CAMS_AT_W",1,true,
		[
			"uns_M72","uns_m20_bazooka"
		]
	],
	[
		"CAMS_MG_ALL_W",0,true,
		[
			"CAMS_SMG_W", "CAMS_MMG_W", "CAMS_LMG_W"
		]
	],	
	[
		"CAMS_Rifles_ALL_W",0,true,
		[
			"CAMS_MG_ALL_W", "CAMS_AssaultRifles_W", "CAMS_SniperRifles_W"
		]
	],
	[
		"CAMS_Guns_ALL_W",0,true,
		[
			"CAMS_Rifles_ALL_W", "CAMS_Pistols_W"
		]
	],

	// ******* WEAPONS - EAST ********************	
	[
		"CAMS_Pistols_E",1,true,
		[
			// East - P-64 CZAK
			"uns_p64",
			
			// East - Makarov
			"uns_makarov",
			//"uns_MakarovSD",
			
			// East - Tokarev TT-30
			"uns_Tt33",
			
			// East - Stechkin APS
			"uns_APS",
			//"uns_APS_SD",
			
			// East - PM-63 CZAK
			"uns_pm63p","uns_pm63","uns_pm63f"
		]
	],
	[
		"CAMS_SMG_E",1,true,
		[
			// East - F1 SMG
			"uns_f1_smg",
			
			// East - M1928A1 Thompson (VC)
			"uns_thompsonvc",
			
			// East - MAT-49
			"uns_mat49","uns_mat49_f",
			
			// East - PPS-43
			"uns_PPS43","uns_pps43f",
			
			// East - PPS wz. 52
			"uns_PPS52",
			
			// East - K-50M
			"uns_k50m","uns_k50mdrum",
			
			// East - PPSh-41
			"uns_ppsh41"
		]
	],
	[
		"CAMS_LMG_E",1,true,
		[
			// East - RPK
			"uns_RPK_40","uns_RPK_drum",
			
			// East - DP28
			"uns_DP28",
			
			// East - RPD
			"uns_RPD","uns_RPDsupport","uns_rpdsog",
			
			// East - PK
			"uns_PK","uns_PKsupport",
			
			// East - MG42
			"uns_MG42","uns_MG42support","uns_mg42_bakelite"
		]
	],
	[
		"CAMS_MMG_E",1,true,
		[
		]
	],
	[
		"CAMS_Shotgun_E",1,true,
		[
			// East - Baikai
			"uns_baikal","uns_baikal_sawnoff"
		]
	],
	[
		"CAMS_AssaultRifles_E",1,true,
		[
			// East - StG-44
			"uns_STG_44",
			
			
			// East - AKS-47
			"uns_AKS47","uns_aks47f",
			//"uns_aks47_bayo",
			
			
			// East - AK-47/49
			"uns_AK47","uns_ak47_bayo","uns_AK47_49","uns_AK47_52",
			
			
			// East - Type 56
			"uns_type56",
			
			
			// East - SA-58
			"uns_Sa58P","uns_Sa58V","uns_sa58vf","uns_sa58p_bayo",
			//"uns_sa58v_bayo",
			
			
			// East - AKM
			"uns_AKM","uns_akm_drum",
			//"uns_akm_bayo",
			
			
			// East - AKMS
			"uns_AKMS","uns_AKMS_Drum",
			"uns_AKMSF","uns_akmsf_drum",
			//"uns_AKMS_SD","uns_AKMS_SD_drum",
			
			
			// East - Type 56
			"uns_type56_bayo",
			
			
			// East - SKS-58P
			"uns_SKS"
			//,"uns_sksbayo"
		]
	],
	[
		"CAMS_SniperRifles_E",1,true,
		[
			// East - Mosin
			"uns_mosin","uns_mosins",
			
			
			// East - MAS-36
			"uns_mas36","uns_mas36_gl","uns_mas36bayo","uns_mas36short","uns_mas36short_gl",
			
			
			// East - MAS 49/56
			"uns_mas4956","uns_mas4956_gl","uns_mas4956s",
			
			
			// East - SVD
			"uns_SVD","uns_SVD_camo"
		]
	],
	[
		"CAMS_AA_E",1,true,
		[
			"uns_sa7","uns_sa7b"
		]
	],
	[
		"CAMS_AT_E",1,true,
		[
			"uns_rpg2","uns_B40","uns_rpg7"
		]
	],
	[
		"CAMS_MG_ALL_E",0,true,
		[
			"CAMS_SMG_E", "CAMS_MMG_E", "CAMS_LMG_E"
		]
	],	
	
	[
		"CAMS_Rifles_ALL_E",0,true,
		[
			"CAMS_MG_ALL_E", "CAMS_AssaultRifles_E", "CAMS_SniperRifles_E"
		]
	],
	
	[
		"CAMS_Guns_ALL_E",0,true,
		[
			"CAMS_Rifles_ALL_E", "CAMS_Pistols_E"
		]
	],
	// ******* WEAPONS - EAST ********************	
	[
		"CAMS_Pistols_I",1,true,
		[
			// East - P-64 CZAK
			"uns_p64",
			
			// East - Makarov
			"uns_makarov",
			//"uns_MakarovSD",
			
			// East - Tokarev TT-30
			"uns_Tt33",
			
			// East - Stechkin APS
			"uns_APS",
			//"uns_APS_SD",
			
			// East - PM-63 CZAK
			"uns_pm63p","uns_pm63","uns_pm63f"
		]
	],
	[
		"CAMS_SMG_I",1,true,
		[
			// East - F1 SMG
			"uns_f1_smg",
			
			// East - M1928A1 Thompson (VC)
			"uns_thompsonvc",
			
			// East - MAT-49
			"uns_mat49","uns_mat49_f",
			
			// East - PPS-43
			"uns_PPS43","uns_pps43f",
			
			// East - PPS wz. 52
			"uns_PPS52",
			
			// East - K-50M
			"uns_k50m","uns_k50mdrum",
			
			// East - PPSh-41
			"uns_ppsh41"
		]
	],
	[
		"CAMS_LMG_I",1,true,
		[
			// East - RPK
			"uns_RPK_40","uns_RPK_drum",
			
			// East - DP28
			"uns_DP28",
			
			// East - RPD
			"uns_RPD","uns_RPDsupport","uns_rpdsog",
			
			// East - PK
			"uns_PK","uns_PKsupport",
			
			// East - MG42
			"uns_MG42","uns_MG42support","uns_mg42_bakelite"
		]
	],
	[
		"CAMS_MMG_I",1,true,
		[
		]
	],
	[
		"CAMS_Shotgun_I",1,true,
		[
			// East - Baikai
			"uns_baikal","uns_baikal_sawnoff"
		]
	],
	[
		"CAMS_AssaultRifles_I",1,true,
		[
			// East - StG-44
			"uns_STG_44",
			
			
			// East - AKS-47
			"uns_AKS47","uns_aks47f",
			//"uns_aks47_bayo",
			
			
			// East - AK-47/49
			"uns_AK47","uns_ak47_bayo","uns_AK47_49","uns_AK47_52",
			
			
			// East - Type 56
			"uns_type56",
			
			
			// East - SA-58
			"uns_Sa58P","uns_Sa58V","uns_sa58vf","uns_sa58p_bayo",
			//"uns_sa58v_bayo",
			
			
			// East - AKM
			"uns_AKM","uns_akm_drum",
			//"uns_akm_bayo",
			
			
			// East - AKMS
			"uns_AKMS","uns_AKMS_Drum",
			"uns_AKMSF","uns_akmsf_drum",
			//"uns_AKMS_SD","uns_AKMS_SD_drum",
			
			
			// East - Type 56
			"uns_type56_bayo",
			
			
			// East - SKS-58P
			"uns_SKS"
			//,"uns_sksbayo"
		]
	],
	[
		"CAMS_SniperRifles_I",1,true,
		[
			// East - Mosin
			"uns_mosin","uns_mosins",
			
			
			// East - MAS-36
			"uns_mas36","uns_mas36_gl","uns_mas36bayo","uns_mas36short","uns_mas36short_gl",
			
			
			// East - MAS 49/56
			"uns_mas4956","uns_mas4956_gl","uns_mas4956s",
			
			
			// East - SVD
			"uns_SVD","uns_SVD_camo"
		]
	],
	[
		"CAMS_AA_I",1,true,
		[
			"uns_sa7","uns_sa7b"
		]
	],
	[
		"CAMS_AT_I",1,true,
		[
			"uns_rpg2","uns_B40","uns_rpg7"
		]
	],
	[
		"CAMS_MG_ALL_I",0,true,
		[
			"CAMS_SMG_I", "CAMS_MMG_I", "CAMS_LMG_E"
		]
	],	
	
	[
		"CAMS_Rifles_ALL_I",0,true,
		[
			"CAMS_MG_ALL_I", "CAMS_AssaultRifles_I", "CAMS_SniperRifles_E"
		]
	],
	
	[
		"CAMS_Guns_ALL_I",0,true,
		[
			"CAMS_Rifles_ALL_I", "CAMS_Pistols_E"
		]
	],
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////// VEHICLES //////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//  Water vehicles - Civ / General
	[
		"CAMS_H20_Boats_C",1,true,
		[
			"UNS_VC_sampan_cargo","UNS_VC_sampan_fish1","UNS_VC_sampan_fish2","UNS_VC_sampan_large",
			"UNS_VC_sampan_supply","UNS_VC_Sampan_Transport","UNS_VC_sampan_village",
			
			"UNS_skiff2_C","UNS_skiff_C","UNS_skiff2_cargo_C","UNS_skiff_cargo_C",
			"UNS_sampan_cargo","UNS_sampan_fish1","UNS_sampan_fish2","UNS_sampan_large","UNS_sampan_supply","UNS_Sampan_Transport","UNS_sampan_village"
		]
	],
	[
		"CAMS_H20_RubberDucks_C",1,true,
		[
		]
	],
	[
		"CAMS_H20_Jetski_C",1,true,
		[
		]
	],
	[
		"CAMS_H20_All_C",0,true,
		[
			"CAMS_H20_Boats_C", "CAMS_H20_RubberDucks_C", "CAMS_H20_Jetski_C"
		]
	],
	///////////////////////////////// Water Vehicles - West
	[
		"CAMS_H20_Boats_W",1,true,
		[
			"uns_pbr","uns_pbr_m10","uns_pbr_mk18"
		]
	],
	[
		"CAMS_H20_RubberDucks_W",1,true,
		[
			"UNS_Zodiac_W","uns_Zodiac_w_rescue"
		]
	],
	[
		"CAMS_H20_SDV_W",1,true,
		[
		]
	],
	[
		"CAMS_H20_ALL_W",0,true,
		[
			"CAMS_H20_Boats_W", "CAMS_H20_RubberDucks_W", "CAMS_H20_SDV_W"
		]
	],		
	//////////////////////////////// Water Vehicles - East
	[
		"CAMS_H20_Boats_E",1,true,
		[
			"UNS_ASSAULT_BOAT_NVA","UNS_ASSAULT_BOAT_VC","UNS_PATROL_BOAT_NVA","UNS_PATROL_BOAT_VC"
		]
	],
	[
		"CAMS_H20_RubberDucks_E",1,true,
		[
			"UNS_Zodiac_NVA","UNS_Zodiac_VC"
		]
	],
	[
		"CAMS_H20_SDV_E",1,true,
		[
		]
	],
	[
		"CAMS_H20_ALL_E",0,true,
		[
			"CAMS_H20_Boats_E", "CAMS_H20_RubberDucks_E", "CAMS_H20_SDV_E"
		]
	],	
/*	
	//////////////////////////// Water Vehicles - Ind
	[
		"CAMS_H20_Boats_I",1,true,
		[
		]
	],
	[
		"CAMS_H20_RubberDucks_I",1,true,
		[
		]
	],
	[
		"CAMS_H20_SDV_I",1,true,
		[
		]
	],

	[
		"CAMS_H20_ALL_I",0,true,
		[
			"CAMS_H20_Boats_I", "CAMS_H20_RubberDucks_I", "CAMS_H20_SDV_I"
		]
	],	
	[
		"CAMS_H20_ALL",0,true,
		[
			"CAMS_H20_ALL_W","CAMS_H20_ALL_E","CAMS_H20_ALL_I", "CAMS_H20_ALL_C"
		]
	],	
*/	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////// Air Vehicles /////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	///////////////////////////////////////////////// Helicopters - Civ
	[
		"CAMS_Heli_Unarmed_C",1,true,
		[
			"uns_oh6_transport","uns_oh6_xm8",
			"uns_H13_transport_Army","uns_H13_amphib_Army",
			"uns_H13_transport_CAV","uns_H13_amphib_CAV",
			"uns_H13_transport_usaf","uns_H13_amphib_usaf",
			"uns_H13_transport_USN","uns_H13_amphib_USN"
		]
	],	
	
	///////////////////////////////////////////////// Helicopters - West
	[
		"CAMS_Heli_Unarmed_W",1,true,
		[
			"uns_oh6_transport","uns_oh6_xm8",
			"uns_H13_transport_Army","uns_H13_amphib_Army",
			"uns_H13_transport_CAV","uns_H13_amphib_CAV",
			"uns_H13_transport_usaf","uns_H13_amphib_usaf",
			"uns_H13_transport_USN","uns_H13_amphib_USN"

		]
	],
	[
		"CAMS_Heli_Armed_W",1,true,
		[
			// West - Army
			"UNS_AH1G","UNS_AH1G_M158","UNS_AH1G_M195","UNS_AH1G_M200","UNS_AH1G_SUU11","UNS_AH1G_FFAR",

			"uns_H13_gunship_Army","uns_H13_gunship_USAF",

			
			// West - US Air Cav
			"uns_H13_gunship_CAV",
			
			// West - USMC
			"uns_H13_gunship_USMC","uns_H13_transport_USMC","uns_H13_amphib_USMC",
			
			// West - USAF
			"uns_UH1F_M21_M158_Hornet","uns_UH1F_M6_M158_Hornet",
			
			// West - US Navy
			"uns_H13_gunship_USN",
			
			// West - RAAF
			"uns_UH1D_raaf_m60","uns_UH1D_raaf_m60_light",
			
			// West - Army
			"uns_oh6_m60","uns_oh6_m27r","uns_oh6_m27"
		]
	],
	[
		"CAMS_Heli_Transport_W",1,true,
		[
			// West - Army
			"uns_h21c","uns_ch34_army",
			
			// West - MACV / COG
			"uns_ch34_sog",
			
			// West - USMC
			"uns_ch34_USMC","uns_ch34_USMC_M60",
			"uns_uh34_USMC","uns_ch34","uns_ch34_M60",
			
			"uns_ch47_m60_usmc",
			"uns_ch53a_m60_usmc",
			"uns_ch53d_m2_USMC",
			"uns_ch46d",
			
			// West - USAF
			"uns_hh53b_m134_usaf",

			
			// West - Navy
			"uns_rh53a_m2_usn","uns_H13_transport_USN","uns_H13_amphib_USN"			
		]
	],
	
	[
		"CAMS_Heli_ArmedTransport_W",1,true,
		[
			// West - Army
			"uns_h21c_mg","uns_h21viet",
			"uns_ch34_army_M60","uns_ch34_sog_M60","uns_ch34_USMC_M60",
			"uns_ch47_m60_usmc","uns_ch47_m60_army","uns_ch47_m60_1AC",
			"uns_ch53a_m60_USMC",
			
			
			"uns_UH1C_M21_M158","uns_UH1C_M21_M200","uns_UH1C_M21_M200_1AC","uns_UH1C_M21_M158_M134",
			
			"uns_UH1C_M6_M158","uns_UH1C_M6_M200","uns_UH1C_M6_M200_1AC","uns_UH1C_M6_M200_M134",
			
			"UNS_UH1B_TOW",
			
			"UNS_UH1C_M3_ARA","UNS_UH1C_M3_ARA_AT","UNS_UH1C_M3_ARA_AP",
			
			"uns_uh1h_m60","uns_uh1h_m60_light",
			
			"uns_uh1d_m60","uns_uh1d_m60_light",

			// West - USMC
			"uns_UH1D_USMC_m60","uns_UH1D_USMC_m60_light",
			
			"uns_ach47_m134","uns_ach47_m200"

		]
	],
	
	/////////////////////////////////// Helicopters - East 

	[
		"CAMS_Heli_ArmedTransport_E",1,true,
		[
			"uns_Mi8TV_VPAF_MG"
		]
	],	
	[
		"CAMS_Heli_Transport_E",1,true,
		[
			"uns_Mi8T_VPAF"		
		]
	],

	///////////////////////////////////////////////// Helicopters - Ind
	[
		"CAMS_Heli_Transport_I",1,true,
		[
			"uns_ch34_VNAF"
		]
	],
	[
		"CAMS_Heli_ArmedTransport_I",1,true,
		[
			"uns_ch34_VNAF_M60",
			
			"uns_ch47_m60_arvn"
		]
	],
	[
		"CAMS_Heli_Armed_I",1,true,
		[	
			"uns_UH1D_vnaf_m60","uns_UH1D_vnaf_m60_light"
		]
	],
	
	[
		"CAMS_Plane_CAS_C",1,true,
		[
			"uns_skymast_civ_blue","uns_skymast_civ_gold","uns_skymast_civ_red",
			"uns_skymast_civ_teal","uns_skymast_civ_yellow"
		]
	],
	/////////////////////////////////////// Aircraft - West
	[
		"CAMS_Plane_CAS_W",1,true,
		[
			"uns_KC130_H",

			
			"uns_AC47","uns_AC47_cia","uns_ac47_flare",

			"CSJ_C123","CSJ_C123B","uns_C123C",
			
			"UNS_skymaster_OBS","UNS_skymaster_fac","UNS_skymaster_CAS","UNS_skymaster_CBU",
			"uns_skymaster","uns_skymaster_civ","uns_skymaster_civ_blue","uns_skymaster_civ_gold","uns_skymaster_civ_red","uns_skymaster_civ_yellow",
			"UNS_skymaster_EHCAS","UNS_skymaster_HCAS",
			"UNS_skymaster_MR","UNS_skymaster_VA",

			"uns_A1J","uns_A1J_CAS","uns_A1J_HCAS","uns_A1J_AGM","uns_A1J_CBU","uns_A1J_EHCAS",
			"uns_A1J_CMU","uns_A1J_MR","uns_A1J_BMB","uns_A1J_LBMB","uns_A1J_HBMB",
			
			"uns_A7_CAP","uns_A7_CAS","uns_A7_AGM","uns_A7_MR","uns_A7_LRBMB",
			"uns_A7_BMB","uns_A7_LBMB","uns_A7_MBMB","uns_A7_HBMB","uns_A7_CBU","uns_A7_GBU","uns_A7_SEAD",
			
			"uns_F4J_AGM","uns_F4J_BMB","uns_F4J_CAP","uns_F4J_CAS","uns_F4J_CBU","uns_F4J_GBU",
			"uns_F4J_HBMB","uns_F4J_LBMB","uns_F4J_LRBMB","uns_F4J_MBMB","uns_F4J_MR","uns_F4J_SEAD",
			
			"uns_f100b_CAP","uns_f100b_CAS","uns_f100b_MR","uns_f100b_AGM","uns_f100b_LRBMB","uns_f100b_BMB",
			"uns_f100b_LBMB","uns_f100b_MBMB","uns_f100b_HBMB","uns_f100b_CBU","uns_f100b_SEAD","uns_f100b",

			
			"uns_f105D_CAP","uns_f105D_CAS","uns_f105D_AGM","uns_f105D_MR","uns_f105D_BMB",
			"uns_f105D_CBU","uns_f105D_HCAS","uns_f105D_GBU",
			"uns_f105D_HBMB","uns_f105D_LRBMB","uns_f105D_MBMB","uns_f105D_SEAD",

			
			"uns_f105F_MR","uns_f105F_AGM","uns_f105F_BMB","uns_f105F_GBU","uns_f105F_SEAD","uns_f105F_CBU",

			
			"UNS_F111_CAP","UNS_F111_CAS",
			"UNS_F111_HCAS",
			"UNS_F111_AGM","UNS_F111_MR","UNS_F111_LBMB","UNS_F111_LRBMB",
			"UNS_F111_BMB",
			"UNS_F111_HBMB","UNS_F111_LGB","UNS_F111_SEAD",
			"UNS_F111_CBU",
			
			"UNS_F111_D_CAP",
			
			"UNS_F111_D_CAS","UNS_F111_D_HCAS","UNS_F111_D_AGM","UNS_F111_D_MR","UNS_F111_D_LBMB","UNS_F111_D_BMB",
			"UNS_F111_D_HBMB","UNS_F111_D_LGB","UNS_F111_D_SEAD","UNS_F111_D_CBU","UNS_F111_D_LRBMB",
			
			"uns_F4E_CHICO",
			
			"uns_C130_H",
			
			"uns_ka3b",
			
			"uns_a3bcamo1",
			
			"UNS_Hawkeye",
			
			"uns_c1a","uns_c1a2","uns_c1a3","uns_c1a4","uns_c1a5","uns_c1a6","uns_c1a7",
			
			"uns_c1a2cargo","uns_c1a3cargo","uns_c1a4cargo","uns_c1a5cargo","uns_c1a6cargo","uns_c1a7cargo",
			
			"uns_a3b","uns_a3bcamo1","uns_a3bvah1","uns_a3bvah2","uns_a3bvah4","uns_a3bvah6",
			"uns_a3bvah11",
			"uns_a3a","uns_a3avah1","uns_a3avah2","uns_a3avah4","uns_a3avah6","uns_a3avah11",
			
			"uns_A4B_skyhawk","uns_A4B_skyhawk_CAP","uns_A4B_skyhawk_CAS","uns_A4B_skyhawk_BMB","uns_A4B_skyhawk_MR",
			"uns_A4B_skyhawk_AGM","uns_A4B_skyhawk_CBU","uns_A4B_skyhawk_HBMB","uns_A4B_skyhawk_HCAS",
			"uns_A4B_skyhawk_LRBMB","uns_A4B_skyhawk_MBMB","uns_A4B_skyhawk_SEAD",
			
			"uns_A4E_skyhawk","uns_A4E_skyhawk_CAP","uns_A4E_skyhawk_CAS","uns_A4E_skyhawk_HCAS","uns_A4E_skyhawk_AGM","uns_A4E_skyhawk_MR",
			"uns_A4E_skyhawk_BMB","uns_A4E_skyhawk_HBMB","uns_A4E_skyhawk_LRBMB","uns_A4E_skyhawk_MBMB","uns_A4E_skyhawk_SEAD",
			"uns_A4E_skyhawk_CBU",
			
			"uns_A6_Intruder_LBMB","uns_A6_Intruder_SEAD","uns_A6_Intruder_CAS","uns_A6_Intruder_AGM","uns_A6_Intruder_MR",
			"uns_A6_Intruder_BMB","uns_A6_Intruder_LRBMB","uns_A6_Intruder_MBMB","uns_A6_Intruder_HBMB","uns_A6_Intruder_CBU",
			"uns_A6_Intruder_GBU","uns_A6_Intruder_CAP",
			
			"uns_A7N_CAP","uns_A7N_CAS","uns_A7N_AGM","uns_A7N_MR","uns_A7N_LRBMB","uns_A7N_BMB","uns_A7N_LBMB",
			"uns_A7N_MBMB","uns_A7N_HBMB","uns_A7N_CBU","uns_A7N_GBU","uns_A7N_SEAD",
			
			"uns_F4_CAP","uns_F4_MR","uns_F4_AGM","uns_F4_LRBMB","uns_F4_LBMB",
			
			"uns_A4E_skyhawk_RAN_AGM","uns_A4E_skyhawk_RAN_BMB","uns_A4E_skyhawk_RAN_CAP","uns_A4E_skyhawk_RAN_CAS",
			"uns_A4E_skyhawk_RAN_CBU","uns_A4E_skyhawk_RAN_HBMB","uns_A4E_skyhawk_RAN_HCAS","uns_A4E_skyhawk_RAN_LRBMB",
			"uns_A4E_skyhawk_RAN_MBMB","uns_A4E_skyhawk_RAN_MR","uns_A4E_skyhawk_RAN_SEAD",
			
			"uns_A1J_navy_AGM","uns_A1J_navy_BMB","uns_A1J_navy_LBMB","uns_A1J_navy_CAS","uns_A1J_navy_CBU",
			"uns_A1J_navy_CMU","uns_A1J_navy","uns_A1J_navy_EHCAS","uns_A1J_navy_HBMB","uns_A1J_navy_HCAS",
			"uns_A1J_navy_MR",
			
			"uns_A4E_skyhawk_USMC_AGM","uns_A4E_skyhawk_USMC_BMB","uns_A4E_skyhawk_USMC_CAP","uns_A4E_skyhawk_USMC_CAS",
			"uns_A4E_skyhawk_USMC_CBU","uns_A6_Intruder_USMC_GBU","uns_A4E_skyhawk_USMC_HBMB","uns_A4E_skyhawk_USMC_HCAS","uns_A4E_skyhawk_USMC_LRBMB",
			"uns_A4E_skyhawk_USMC_MBMB","uns_A4E_skyhawk_USMC_MR","uns_A4E_skyhawk_USMC_SEAD",
			
			"uns_A6_Intruder_USMC_AGM","uns_A6_Intruder_USMC_BMB","uns_A6_Intruder_USMC_CAS","uns_A6_Intruder_USMC_CBU",
			"uns_A6_Intruder_USMC_CAP","uns_A6_Intruder_USMC_GBU","uns_A6_Intruder_USMC_HBMB","uns_A6_Intruder_USMC_LBMB",
			"uns_A6_Intruder_USMC_LRBMB","uns_A6_Intruder_USMC_MBMB","uns_A6_Intruder_USMC_MR","uns_A6_Intruder_USMC_SEAD",

			"uns_F4B_AGM","uns_F4B_BMB","uns_F4B_CAP","uns_F4B_CAS","uns_F4B_CBU","uns_F4B_GBU",
			"uns_F4B_HBMB","uns_F4B_LBMB","uns_F4B_LRBMB","uns_F4B_MBMB","uns_F4B_MR","uns_F4B_SEAD",
			
			"uns_ov10_navy","uns_ov10_navy_CAS","uns_ov10_navy_CBU","uns_ov10_navy_FAC","uns_ov10_navy_HCAS","uns_ov10_navy_MR",
			
			"uns_ov10_usmc","uns_ov10_usmc_CAS","uns_ov10_usmc_CBU","uns_ov10_usmc_FAC","uns_ov10_usmc_HCAS","uns_ov10_usmc_MR",

			"uns_ov10_usaf","uns_ov10_usaf_CAS","uns_ov10_usaf_CBU","uns_ov10_usaf_FAC","uns_ov10_usaf_HCAS","uns_ov10_usaf_MR",

			"uns_F4E_AGM","uns_F4E_BMB","uns_F4E_CAP","uns_F4E_CAS","uns_F4E_CBU","uns_F4E_CHICO","uns_F4E_GBU",
			"uns_F4E_HBMB","uns_F4E_LBMB","uns_F4E_LRBMB","uns_F4E_MBMB","uns_F4E_MR","uns_F4E_SEAD"


		]
	],

	///////////////////////////////////// Aircraft - East
	[
		"CAMS_Plane_CAS_E",1,true,
		[
			// East - AN2
			"uns_an2","uns_an2_bmb","uns_an2_cas","uns_an2_transport",
			
			// East - MIG-21
			"uns_Mig21_BMB","uns_Mig21_LGB","uns_mig21_MR","uns_Mig21_SEAD","uns_Mig21_AGM",
			"uns_Mig21_HBMB","uns_Mig21_CAP","uns_Mig21_CAS","uns_Mig21_CBU","uns_Mig21_HCAS"
		]
	],
	[
		"CAMS_Plane_UAV_E",1,true,
		[
		]
	],
	
	///////////////////////////////////// Aircraft - Ind
	[
		"CAMS_Plane_CAS_I",1,true,
		[
			"uns_A1H_AGM","uns_A1H_BMB","uns_A1H_CAS","uns_A1H_CBU","uns_A1H_CMU",
			"uns_A1H","uns_A1H_EHCAS","uns_A1H_HBMB","uns_A1H_HCAS","uns_A1H_LBMB","uns_A1H_MR"
		]
	],
	[
		"CAMS_Plane_UAV_I",1,true,
		[
		]
	],
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Land Vehicles ///////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////

/*	
	////////////////////////////////////// Civilian Vehicles
	[
		"CAMS_Land_Car_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_Offroad_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_Transport_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_SUV_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_Van_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_Utility_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_Quad_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_Kart_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_Work_C",0,true,
		[
			"CAMS_Land_Car_C", "CAMS_Land_Offroad_C", "CAMS_Land_Van_C"
		]
	],	
	[
		"CAMS_Land_Truck_C",0,true,
		[
			"CAMS_Land_Offroad_C", "CAMS_Land_Transport_C", "CAMS_Land_SUV_C", "CAMS_Land_Van_C"
		]
	],
	[
		"CAMS_Land_ALL_C",0,true,
		[
			"CAMS_Land_Work_C", "CAMS_Land_Truck_C"
		]
	],	
*/

	////////////////////////////////////////////////////// West Vehicles
	[
		"CAMS_Land_ArmedOffroad_W",1,true,
		[
			"uns_willysmg50","uns_willysmg","uns_willysm40",
			
			"uns_willys_2_m60","uns_willys_2_m1919",
			
			"uns_m274_m40","uns_m274_m60",
			
			"uns_m37b1_m1919"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_W",1,true,
		[
			"uns_willys","uns_willys_2","uns_willys_2_usmp","uns_willys_2_usmc",
			
			"uns_m274",
			"uns_m37b1"
		]
	],
	[
		"CAMS_Land_UGV_Armed_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_Quad_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_Transport_W",1,true,
		[
			"uns_M113_transport","uns_M577_amb","uns_m43","uns_M35A2","uns_M35A2_Open"
		]
	],
	[
		"CAMS_Land_UtilityVehicle_W",1,true,
		[
			"uns_M113_ENG","uns_M35A2_ammo","uns_M35A2_fueltanker","uns_M35A2_fuel","uns_M35A2_repair",
			
			"uns_truck_reammo","uns_truck_refuel","uns_truck_repair"
		]
	],
	[
		"CAMS_Land_ArmedTransport_W",1,true,
		[
			"uns_M113_M2","uns_M113_M60","uns_M113_XM182","uns_M113_M134","uns_M113_30cal",
			"uns_M113A1_M2","uns_M113A1_M60","uns_M113A1_XM182","uns_M113A1_M134","uns_M113A1_M40",
			
			"uns_xm706e1","uns_xm706e2"
		]
	],
	[
		"CAMS_Land_Tank_W",1,true,
		[
			"uns_M132","uns_m48a3","uns_m551","uns_M67A","uns_sheridan"
		]
	],
	[
		"CAMS_Land_Artillery_W",1,true,
		[
			"uns_M30_107mm_mortar","uns_M1_81mm_mortar","uns_M1_81mm_mortar_arty",
			"uns_M2_60mm_mortar","uns_M102_artillery","uns_m114_artillery",
			"uns_M113_M30","uns_M113_M30_HQ","uns_M1_81mm_mortar_pvp",

			"uns_M2_60mm_mortar_pvp",

			"uns_Type55_mortar","uns_m107sp",
			"uns_m110sp"
		]
	],
	[
		"CAMS_Land_AA_W",1,true,
		[
			"Uns_M55_Quad","uns_m163"
		]
	],		
	[
		"CAMS_Land_Transport_ALL_W",0,true,
		[
			"CAMS_Land_Transport_W", "CAMS_Land_ArmedTransport_W"
		]
	],
	[
		"CAMS_Land_Unarmed_W",0,true,
		[
			"CAMS_Land_UnarmedOffroad_W", "CAMS_Land_Transport_W"
		]
	],
	[
		"CAMS_Land_Armed_W",0,true,
		[
			"CAMS_Land_ArmedOffroads_W", "CAMS_Land_ArmedTransport_W"
		]
	],
	[
		"CAMS_Land_ALL_W",0,true,
		[
			"CAMS_Land_Unarmed_W", "CAMS_Land_Armed_W"
		]
	],

	//////////////////////////////////////// EAST Vehicles
	[
		"CAMS_Land_ArmedOffroad_E",1,true,
		[
			"uns_Type55_twinMG","uns_Type55_RR57","uns_Type55_RR73","uns_Type55_M40"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_E",1,true,
		[
			"uns_Type55_patrol"
		]
	],
	[
		"CAMS_Land_UGV_Armed_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_Quad_E",1,true,
		[
		]
	],

	[
		"CAMS_Land_Transport_E",1,true,
		[
			"uns_Type55",
			
			"uns_nvatruck","uns_nvatruck_camo","uns_nvatruck_open","uns_zil157"
		]
	],
	[
		"CAMS_Land_UtilityVehicle_E",1,true,
		[
			"uns_zil157_refuel","uns_zil157_repair",
			
			"uns_nvatruck_reammo","uns_nvatruck_refuel","uns_nvatruck_repair"
		]
	],
	[
		"CAMS_Land_ArmedTransport_E",1,true,
		[
			"uns_BTR152_DSHK",
			
			"uns_Type55_MG","uns_Type55_LMG",
			
			"uns_nvatruck_mg",
			
			"uns_type63_amb","uns_Type63_mg"
			
		]
	],
	[
		"CAMS_Land_Tank_E",1,true,
		[
			"uns_t34_76_vc","uns_t34_85_nva","uns_t34_76_vc",

			"uns_t54_nva","uns_t55_nva","uns_to55_nva",
			"uns_pt76","uns_ot34_85_nva"
		]
	],
	[
		"CAMS_Land_AA_E",1,true,
		[
			"uns_ZPU4_VC","uns_ZPU4_NVA","uns_ZU23_VC","uns_ZU23_NVA",
			"uns_S60_VC","uns_S60_NVA","uns_Type74_VC","uns_Type74_NVA",
			
			"uns_BTR152_ZPU",
			"pook_P12_NVA","pook_PU12_NVA",
			"POOK_SON50_NVA",
			"uns_Type55_ZU",
			"pook_URAL_UTILITY_NVA","pook_URAL_UTILITY_NVA",
			"uns_nvatruck_s60","uns_nvatruck_type65",
			"uns_nvatruck_zpu","uns_nvatruck_zu23"
		]
	],	
	[
		"CAMS_Land_Artillery_E",1,true,
		[
			"uns_m1941_82mm_mortarNVA","uns_m1941_82mm_mortarNVA_arty","uns_m1941_82mm_mortarNVA_pvp",
			"uns_m1941_82mm_mortarVC","uns_D20_artillery","uns_D30_artillery"
		]
	],
	[
		"CAMS_Land_Transport_ALL_E",0,true,
		[
			"CAMS_Land_Transport_E", "CAMS_Land_ArmedTransport_E"
		]
	],
	[
		"CAMS_Land_Unarmed_E",0,true,
		[
			"CAMS_Land_UnarmedOffroad_E", "CAMS_Land_Transport_E"
		]
	],	
	[
		"CAMS_Land_Armed_E",0,true,
		[
			"CAMS_Land_ArmedOffroad_E", "CAMS_Land_ArmedTransport_E"
		]
	],	
	[
		"CAMS_Land_ALL_E",0,true,
		[
			"CAMS_Land_Unarmed_E", "CAMS_Land_Armed_E"
		]
	],

	/////////////////////////////////////////////////////// Guerilla Vehicles
	[
		"CAMS_Land_ArmedOffroad_I",1,true,
		[
			"uns_willys_2_m60_arvn","uns_willys_2_m1919_arvn","uns_xm706"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_I",1,true,
		[
			"uns_willys_2_arvn"		
		]
	],
	[
		"CAMS_Land_UGV_Armed_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_Quad_I",1,true,
		[
		]
	],
	/*
	[
		"CAMS_Land_Transport_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_UtilityVehicle_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_ArmedTransport_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_Tank_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_Transport_ALL_I",0,true,
		[
			"CAMS_Land_Transport_I", "CAMS_Land_ArmedTransport_I"
		]
	],
	[
		"CAMS_Land_Unarmed_I",0,true,
		[
			"CAMS_Land_UnarmedOffroad_I", "CAMS_Land_Transport_I"
		]
	],	
	[
		"CAMS_Land_Armed_I",0,true,
		[
			"CAMS_Land_ArmedOffroad_I", "CAMS_Land_ArmedTransport_I"
		]
	],	
	[
		"CAMS_Land_ALL_I",0,true,
		[
			"CAMS_Land_Unarmed_I", "CAMS_Land_Armed_I"
		]
	],
*/
	//////////////////////////////////////////// Static Guns - West
	[
		"CAMS_Land_StaticGuns_W",1,true,
		[
			"uns_M2_low","uns_M2_high",
			"uns_M1919_low",
			"uns_m60_high","uns_M60_low",
			"uns_m60_bunker_large","uns_m60_bunker_small",
			"uns_m60_tower_1","uns_m60_tower_2",
			"uns_stabo",
			"uns_US_MK18_low",
			"uns_US_SearchLight",
			"uns_M40_106mm_US"
		]
	],
	[
		"CAMS_Land_StaticGL_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_StaticAA_W",1,true,
		[
			"uns_m163",
			"Uns_M55_Quad"
		]
	],
	[
		"CAMS_Land_StaticAT_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_Mortar_W",1,true,
		[
		]
	],

	//////////////////////////////////////////// Static Guns - East
	[
		"CAMS_Land_StaticGuns_E",1,true,
		[
			// East - VC
			"uns_dshk_high_VC","uns_dshk_low_VC","uns_dshk_armoured_VC","uns_dshk_wheeled_VC","uns_dshk_twin_VC","uns_dshk_bunker_open_VC","uns_dshk_bunker_closed_VC",
			"uns_dshk_twin_bunker_open_VC","uns_dshk_twin_bunker_closed_VC","uns_pk_low_VC","uns_pk_high_VC","uns_pk_bunker_low_VC","uns_pk_bunker_open_VC","uns_pk_bunker_closed_VC",
			"uns_pk_tower_VC","uns_mg42_low_VC","uns_M40_106mm_VC","uns_SPG9_73mm_VC","uns_Type36_57mm_VC",

		
			"uns_sniper_tree2_vclocal","uns_sniper_tree2_vcmf","uns_sniper_tree2_vcreg",

			"uns_sniper_tree_vclocal","uns_sniper_tree_vcmf","uns_sniper_tree_vcreg",

			"uns_spiderhole_leanto_VC","uns_spiderhole_VC","uns_Type36_57mm_VC",



			
			// East - NVA
			"uns_dshk_high_NVA","uns_dshk_low_NVA","uns_dshk_armoured_NVA","uns_dshk_wheeled_NVA","uns_dshk_twin_NVA","uns_dshk_bunker_open_NVA","uns_dshk_bunker_closed_NVA",
			"uns_dshk_twin_bunker_open_NVA","uns_dshk_twin_bunker_closed_NVA","uns_pk_low_NVA","uns_pk_high_NVA","uns_pk_bunker_low_NVA","uns_pk_bunker_open_NVA",
			"uns_pk_bunker_closed_NVA","uns_pk_tower_NVA","uns_mg42_low_NVA","uns_M40_106mm_NVA","uns_SPG9_73mm_NVA","uns_Type36_57mm_NVA",
			"uns_SPG9_73mm_NVA",

			"uns_NVA_SearchLight",
			
			"uns_sniper_tree2_dc","uns_sniper_tree2_nva65","uns_sniper_tree2_nva68","uns_sniper_tree2_nvarc",

			"uns_sniper_tree_dc","uns_sniper_tree_nva65","uns_sniper_tree_nva68","uns_sniper_tree_nvarc",

			"uns_spiderhole_leanto_NVA","uns_spiderhole_NVA","uns_Type36_57mm_NVA"

		]
	],
	[
		"CAMS_Land_StaticGL_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_StaticAA_E",1,true,
		[
			"pook_KS12_NVA","pook_KS19_NVA","pook_PRV11_NVA","pook_PUAZO_NVA",
			"pook_S60_NVA","uns_S60_NVA",
			"pook_SA2_static_NVA","uns_sa2_static_NVA",
			"pook_SNR75_radar_NVA","uns_snr75_radar_NVA",
			"pook_SON9_NVA",
			"uns_Type74_NVA",
			"uns_ZPU2_NVA",
			"uns_ZPU4_NVA",
			"pook_ZU23_NVA","uns_ZU23_NVA",
			
			"uns_S60_VC","uns_Type74_VC","uns_ZPU2_VC","uns_ZPU4_VC","uns_ZU23_VC"
		]
	],
	[
		"CAMS_Land_StaticAT_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_Mortar_E",1,true,
		[
		]
	],

	//////////////////////////////////////////// Static Guns - Ind
	[
		"CAMS_Land_StaticGuns_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_StaticGL_I",1,true,
		[
		]
	],
			
	[
		"CAMS_Land_StaticAA_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_StaticAT_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_Mortar_I",1,true,
		[
		]
	],


	////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////// Misc Content ////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////
	// If it doesnt have a classname, I suggest you use the ImmersionFX files just for continuity  //
	// but it doesn't really matter where they are unless you are going to distribute the files   //
	////////////////////////////////////////////////////////////////////////////////////////////////
/*
	[
		"CAMS_Wreck_Hist",1,true,
		[
		]
	],
	[
		"CAMS_Wreck_Car",1,true,
		[
		]
	],
	[
		"CAMS_Wreck_Truck",1,true,
		[
		]
	],
*/
	[
		"CAMS_Wreck_Mil",1,false,
		[
			"m113ruin2"
		]
	],
	[
		"CAMS_Wreck_Tank",1,true,
		[
			"m113ruin2"
		]
	],
	[
		"CAMS_Wreck_Heli",1,true,
		[
			"uns_ah1g_Wreck","uns_ah1g_Wreck_2","uns_ch47_wreck","uns_mi8_wreck","OH6_Wreck","uns_oh6_wreck","uns_uh1c_wreck",
			"UH1_Wreck","UH1_Wreck_Inv","uns_uh1d_wreck","uns_uh1_Wreck","uns_uh1h_wreck","uns_ov10_wreck"

		]
	],
	[
		"CAMS_Wreck_Plane",1,true,
		[
			"uns_a1j_Wreck","uns_a3b_Wreck","uns_A4_Wreck","uns_A6_Wreck","uns_A7_wreck","uns_an2_wreck",
			"b52_wreck","uns_c1a_wreck","uns_E2A_Wreck","uns_f100_Wreck","UNS_F111_wreck","uns_h21c_wreck",
			"uns_mig21_dragchute","uns_mig21_wreck","uns_F4_Wreck","uns_mig21_canopy","uns_mig21_ejection_seat"

		]
	],
	[
		"CAMS_Wreck_Boat",1,false,
		[
		]
	],
	[
		"CAMS_Wreck_ALL",0,true,
		[
			"CAMS_Wreck_Car", "CAMS_Wreck_Truck", "CAMS_Wreck_Mil", "CAMS_Wreck_Heli", "CAMS_Wreck_Plane", 
			"CAMS_Wreck_Hist"
		]
	]
];

// Global Collections

// Admin ATTENTION!
// Any new global arrays you want to have available on the headless client need to be defined in this file.
// Define the array below, then place the name of the array in the 'FuMS_ListofCustomGlobalItems' variable below.
// At initialization your global variable will be passed onto the HC prior to it attempting to initialize any missions.
CAMS_MyExampleGlobalVariable = ["Chemlight_blue","Chemlight_green","Chemlight_red"];

CAMS_ListofCustomGlobalItems =
[
	"CAMS_MyExampleGlobalVariable"
];


/////////////////////////////
// Cart processing //////////
/////////////////////////////

_hold = [_cartName,_cartContents,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): assets.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};

//diag_log format ["[CAMS] CART System: %1 assets loaded",_cartName];

/*


// Assault Rifles  

"Uns_Rifle",
"uns_speargun_F",
"uns_speargun",
"Uns_Shotgun",
"uns_ithaca37",
"uns_ithaca37_grip",
"uns_m1897",
"uns_m1897riot",
"uns_model12",
"uns_baikal",
"uns_baikal_sawnoff",
"uns_m870",
"uns_m870_mk1",
"uns_t233",
"uns_m16",
"uns_m16_camo",
"uns_m16_bc",
"uns_M16A1",
"uns_M16A1_HBAR",
"uns_m16A1_camo",
"uns_M16_dm",
"uns_xm177e1",
"uns_xm177e1_dm",
"uns_xm177e1_30",
"uns_xm177e2",
"uns_xm177e2_grip",
"uns_xm177e2_short",
"uns_xm177e2_stock",
"uns_M63a_AR_base",
"uns_M63a_drum",
"uns_M63a_LMG",
"uns_m63asupport",
"uns_m79",
"uns_ex41",


// Assault Rifles with GL 

"uns_m16a1_m203",
"uns_m16a1_xm148",
"uns_m16_m203",
"uns_m16_xm148",
"uns_m16_xm148_camo",
"uns_xm177e1_m203",
"uns_xm177e1_xm148",
"uns_xm177e2_m203",
"uns_xm177e2_xm148",


// LMGs 

"Uns_LMG",
"Uns_HMG",
"uns_bar",
"uns_m1919a6",
"uns_m60",
"uns_m60_base",
"uns_m60support",
"uns_m60grip",
"uns_m60shorty",
"uns_RPK_40",
"uns_RPK_drum",
"uns_rpd",
"uns_RPDsupport",
"uns_rpdsog",
"uns_DP28_base",
"uns_PK",
"uns_PKsupport",
"uns_ukvz59",
"uns_MG42",
"uns_mg42_bakelite",
"uns_MG42support",


//  SMGs  

"Uns_SMG",
"uns_uzif",
"uns_uzi",
"uns_mac10",
"uns_sten",
"uns_owen",
"uns_Sterling",
"uns_Sterling_f",
"uns_SterlingSD",
"uns_SterlingSD_f",
"uns_f1_smg",
"uns_m50",
"uns_m50f",
"uns_m45",
"uns_m45f",
"uns_mp40",
"uns_thompson",
"uns_thompsonvc",
"uns_m3a1",
"uns_pm63f",
"uns_pm63",
"uns_sa61f",
"uns_sa61",
"uns_mat49",
"uns_type100",
"uns_PPS43",
"uns_PPS43f",
"uns_PPS52",
"uns_k50m",
"uns_k50mdrum",
"uns_ppsh41",
"uns_type50",


// Snipers  

"Uns_Rifle762",
"uns_STG_44",
"uns_m1carbine",
"uns_m1carbine_pouch",
"uns_m1carbine_gl",
"uns_m1carbine_pouch_gl",
"uns_m2carbine",
"uns_m2carbine_shorty",
"uns_m2carbine_gl",
"uns_m3carbine",
"uns_m1garand",
"uns_m1garand_gl",
"uns_m1903",
"uns_m14",
"uns_model70_iron",
"uns_M40_base",
"uns_l1a1",
"uns_l1a1_enfield",
"uns_l1a1_blk",
"uns_l2a1",
"uns_l2a1_shorty",
"uns_l1a1gl",
"uns_sks",
"uns_mosin",
"uns_kar98k",
"uns_svt",
"uns_svd_base",
"uns_SVD_CAMO_base",
"uns_smle",
"uns_smle_sniper",
"uns_mas36",
"uns_mas36_gl",
"uns_mas36short",
"uns_mas36short_gl",
"uns_type99",
"uns_type99_gl",
"uns_mas4956_muzzle",
"uns_mas4956",
"uns_mas4956_gl",
"uns_ak47",
"uns_aks47",
"uns_aks47f",
"uns_type56",
"uns_sa58p",
"uns_sa58p_camo",
"uns_sa58v",
"uns_sa58vf",
"uns_ak47_49",
"uns_ak47_52",
"uns_akm",
"uns_akm_drum",
"uns_akms",
"uns_akmsf",
"uns_akms_drum",
"uns_akmsf_drum",


// DMRs  



// Launchers  

"uns_m127a1_flare",
"uns_m72",
"uns_m72used",
"uns_rpg2",
"uns_B40",
"uns_rpg7",
"uns_m20_bazooka",
"uns_sa7",
"uns_sa7b",


// Handguns  

"Uns_Pistol",
"uns_ppk",
"uns_Ruger",
"uns_38spec",
"uns_sw_m10",
"uns_357m",
"uns_nagant_m1895",
"uns_m2carbine_shorty_p",
"uns_coltcmdr",
"uns_bhp",
"uns_m1911",
"uns_MX991_m1911",
"uns_MX991_m1911SD_base",
"uns_MX991_w",
"uns_MX991_r",
"uns_MX991_g",
"uns_mkvFlarePistol",
"uns_makarov",
"uns_p64",
"uns_tt30",
"uns_Tt33",
"uns_APS",
"uns_pm63p",
"uns_mat49p",
"uns_sa61_p",
"uns_m79p",


// Shotguns  



// Throwables  



// Magazines  

"uns_ppkmag",
"uns_Rugermag",
"uns_38specmag",
"uns_357mag",
"uns_nagant_m1895mag",
"uns_m2carbinemag",
"uns_m2carbinemag_T",
"uns_m2carbinemag_NT",
"uns_m1carbinemag",
"uns_m1carbinemag_T",
"uns_m1carbinemag_NT",
"uns_coltcmdrmag",
"uns_m1911mag",
"uns_13Rnd_hp",
"uns_40mm_mkv_White",
"uns_40mm_mkv_red",
"uns_40mm_mkv_green",
"uns_40mm_mkv_yellow",
"uns_1Rnd_Smoke_MKV",
"uns_1Rnd_SmokeRed_MKV",
"uns_1Rnd_SmokeGreen_MKV",
"uns_1Rnd_SmokeYellow_MKV",
"uns_40mm_white",
"uns_40mm_green",
"uns_40mm_red",
"uns_40mm_yellow",
"uns_1Rnd_Smoke_40mm",
"uns_1Rnd_SmokeRed_40mm",
"uns_1Rnd_SmokeGreen_40mm",
"uns_1Rnd_SmokeYellow_40mm",
"uns_spear_mag",
"uns_makarovmag",
"uns_6Rnd_czak",
"uns_tokarevmag",
"uns_20Rnd_APS",
"uns_25Rnd_pm_pa",
"uns_25Rnd_pm",
"uns_mat49_20_mag",
"uns_mat49mag",
"uns_mat49mag_T",
"uns_mat49mag_NT",
"uns_20Rnd_sa61_pa",
"uns_20Rnd_sa61",
"uns_32Rnd_uzi",
"uns_32Rnd_uzi_pa",
"uns_mac10mag",
"uns_stenmag",
"uns_stenmag_T",
"uns_owenmag",
"uns_owenmag_T",
"uns_mk4mag",
"uns_mk4mag_T",
"uns_f1_smg_mag",
"uns_m50mag",
"uns_m45mag",
"uns_m45mag_T",
"uns_m45mag_NT",
"uns_m45mag_SD",
"uns_mp40mag",
"uns_thompsonmag_30",
"uns_thompsonmag_30_T",
"uns_thompsonmag_30_NT",
"uns_thompsonmag_20",
"uns_thompsonmag_20_T",
"uns_thompsonmag_20_NT",
"uns_m3a1mag",
"uns_m3a1mag_T",
"uns_type100mag",
"uns_type100_NT",
"uns_type100_T",
"uns_k50mag",
"uns_k50mag_NT",
"uns_k50mag_T",
"uns_ppshmag",
"uns_ppshmag_T",
"uns_ppshmag_NT",
"uns_12gaugemag_4",
"uns_12gaugemag_4f",
"uns_12gaugemag_2",
"uns_12gaugemag_6",
"uns_12gaugemag_6f",
"uns_m870mag",
"uns_30Rnd_Kurtz_STG",
"uns_m1garandmag",
"uns_m1garandmag_T",
"uns_springfieldmag_T",
"uns_springfieldmag",
"uns_m14mag",
"uns_m14mag_T",
"uns_m14mag_NT",
"uns_model70mag",
"uns_model70mag_T",
"uns_m40mag_T",
"uns_m40mag",
"uns_l1a1mag",
"uns_l1a1mag_T",
"uns_l1a1mag_NT",
"uns_sksmag",
"uns_sksmag_T",
"uns_sksmag_NT",
"uns_mosinmag",
"uns_mosinmag_T",
"uns_kar98kmag",
"uns_kar98kmag_T",
"uns_svtmag",
"uns_svtmag_T",
"uns_svdmag",
"uns_svdmag_T",
"uns_smlemag",
"uns_smlemag_T",
"uns_mas36mag",
"uns_mas36mag_T",
"uns_type99mag",
"uns_type99mag_T",
"uns_mas4956mag",
"uns_mas4956mag_T",
"uns_40Rnd_556x45_t223",
"uns_40Rnd_556x45_t223_T",
"uns_20Rnd_556x45_Stanag",
"uns_20Rnd_556x45_Stanag_T",
"uns_20Rnd_556x45_Stanag_NT",
"uns_30Rnd_556x45_Stanag",
"uns_30Rnd_556x45_Stanag_T",
"uns_30Rnd_556x45_Stanag_NT",
"uns_40Rnd_556x45_Stanag",
"uns_40Rnd_556x45_Stanag_T",
"uns_40Rnd_556x45_Stanag_NT",
"uns_30Rnd_556x45_Stanag_xm177",
"uns_30Rnd_556x45_Stanag_xm177_T",
"uns_30Rnd_556x45_Stanag_xm177_NT",
"uns_ak47mag",
"uns_ak47mag_T",
"uns_ak47mag_NT",
"uns_sa58mag",
"uns_sa58mag_T",
"uns_sa58mag_NT",
"uns_75Rnd_akdr",
"uns_m63amag",
"uns_m63abox",
"uns_barmag",
"uns_barmag_T",
"uns_barmag_NT",
"uns_100Rnd_m1919",
"uns_250Rnd_m1919",
"uns_m60mag",
"uns_m60mag_200",
"uns_rpkmag",
"uns_rpdmag",
"uns_rpdsogmag",
"uns_47Rnd_DP28",
"uns_100Rnd_762x54_PK",
"uns_100Rnd_762x54_ukvz59",
"uns_50Rnd_792x57_Mg42",
"uns_250Rnd_792x57_Mg42",
"Uns_1Rnd_HE_M381",
"Uns_1Rnd_HE_M406",
"uns_1Rnd_AB_M397",
"uns_m406vest",
"uns_1Rnd_M127_mag",
"uns_m72rocket",
"uns_M72_fakemag",
"uns_rpg2grenade",
"uns_B40grenade",
"uns_rpg7grenade",
"uns_M28A2_mag",
"uns_M30_smoke_mag",
"uns_sa7mag",
"uns_sa7bmag",


// Optics  

"uns_o_M84",
"uns_o_Unertl8x",
"uns_o_LeatherwoodART_m14",
"uns_o_LeatherwoodART_m14_custom",
"uns_o_ANPVS2_M14",
"uns_o_Unertl8x_m70",
"uns_o_RedfieldART_m70",
"uns_o_RedfieldART",
"uns_o_ANPVS2",
"uns_o_PU",
"uns_o_zf41",
"uns_o_PSO1",
"uns_o_PSO1_camo",
"uns_o_Akatihi4x",
"uns_o_APXSOM",
"uns_o_colt4x",
"uns_o_LeatherwoodART_m16",
"uns_o_ANPVS2_M16",


// Muzzles  

"uns_s_M14",
"uns_s_M16",
"uns_s_MAC10",
"uns_s_M3a1",
"uns_s_M45",
"uns_s_UZI",
"uns_s_Sten",
"uns_s_M1911",
"uns_s_PPK",
"uns_s_PBS1",
"uns_s_APS",
"uns_s_mat49",
"uns_s_ppk",
"uns_s_sten",


// Pointers  

"uns_b_spike17",
"uns_b_sks",
"uns_b_6H3",
"uns_b_spike",
"uns_b_mas49",
"uns_b_m4",
"uns_b_m6",
"uns_b_m7",
"uns_b_m1917",
"uns_b_type30",
"uns_BA30",
"uns_BA30_red",
"uns_BA30_green",
"uns_b_m40_camo",
"uns_b_svd_camo",
"uns_b_smle_camo",
"uns_b_m70_camo",
"uns_b_m1",
"uns_b_6h3",


// Underbarrel  

"uns_bp_M60",
"uns_bp_DP28",


// Unknown  



// Cars

"uns_BTR152_DSHK",
"uns_BTR152_ZPU",
"uns_m274",
"uns_m274_m40",
"uns_m274_m60",
"uns_M35A2",
"uns_M35A2_ammo",
"uns_M35A2_fuel",
"uns_M35A2_fueltanker",
"uns_M35A2_Open",
"uns_M35A2_repair",
"uns_m37b1",
"uns_m37b1_m1919",
"uns_M43",
"uns_nvatruck",
"uns_nvatruck_camo",
"uns_nvatruck_mg",
"uns_nvatruck_open",
"uns_nvatruck_reammo",
"uns_nvatruck_refuel",
"uns_nvatruck_repair",
"uns_nvatruck_s60",
"uns_nvatruck_type65",
"uns_nvatruck_zpu",
"uns_nvatruck_zu23",
"uns_Type55",
"uns_Type55_LMG",
"uns_Type55_M40",
"uns_Type55_MG",
"uns_Type55_mortar",
"uns_Type55_patrol",
"uns_Type55_RR57",
"uns_Type55_RR73",
"uns_Type55_twinMG",
"uns_Type55_ZU",
"uns_Type63_amb",
"uns_Type63_mg",
"uns_willys",
"uns_willys_2",
"uns_willys_2_arvn",
"uns_willys_2_m1919",
"uns_willys_2_m1919_arvn",
"uns_willys_2_m60",
"uns_willys_2_m60_arvn",
"uns_willys_2_usmc",
"uns_willys_2_usmp",
"uns_willysm40",
"uns_willysmg",
"uns_willysmg50",
"uns_xm706",
"uns_xm706e1",
"uns_xm706e2",
"uns_zil157",
"uns_Zil157_refuel",
"uns_zil157_repair",


// Tanks

"uns_m107sp",
"uns_m110sp",
"uns_M113_30cal",
"uns_M113_ENG",
"uns_M113_M134",
"uns_M113_M2",
"uns_M113_M30",
"uns_M113_M30_HQ",
"uns_M113_M60",
"uns_M113_transport",
"uns_M113_XM182",
"uns_M113A1_M134",
"uns_M113A1_M2",
"uns_M113A1_M40",
"uns_M113A1_M60",
"uns_M113A1_XM182",
"uns_M132",
"uns_m163",
"uns_m48a3",
"uns_m551",
"uns_M577_amb",
"uns_M67A",
"uns_ot34_85_nva",
"uns_pt76",
"uns_sheridan",
"uns_t34_76_vc",
"uns_t34_85_nva",
"uns_t54_nva",
"uns_t55_nva",
"uns_Tank",
"uns_to55_nva",


// Boats

"UNS_ASSAULT_BOAT_NVA",
"UNS_ASSAULT_BOAT_VC",
"UNS_floatraft_3",
"UNS_freighter1",
"UNS_freighter1_empty",
"UNS_PATROL_BOAT_NVA",
"UNS_PATROL_BOAT_VC",
"uns_pbr",
"uns_PBR_M10",
"uns_pbr_mk18",
"UNS_sampan_cargo",
"UNS_sampan_fish1",
"UNS_sampan_fish2",
"UNS_sampan_large",
"UNS_sampan_supply",
"UNS_Sampan_Transport",
"UNS_sampan_village",
"UNS_skiff2_C",
"UNS_skiff2_cargo_C",
"UNS_skiff_C",
"UNS_skiff_cargo_C",
"uns_stokesBasket",
"UNS_VC_sampan_cargo",
"UNS_VC_sampan_fish1",
"UNS_VC_sampan_fish2",
"UNS_VC_sampan_large",
"UNS_VC_sampan_supply",
"UNS_VC_Sampan_Transport",
"UNS_VC_sampan_village",
"UNS_Zodiac_NVA",
"UNS_Zodiac_VC",
"UNS_Zodiac_W",
"UNS_Zodiac_W_rescue",


// Helis

"uns_ach47_m134",
"uns_ach47_m200",
"UNS_AH1G",
"UNS_AH1G_FFAR",
"UNS_AH1G_M158",
"UNS_AH1G_M195",
"UNS_AH1G_M200",
"UNS_AH1G_SUU11",
"uns_brakechute",
"uns_ch34",
"uns_ch34_army",
"uns_ch34_army_M60",
"uns_ch34_M60",
"uns_ch34_sog",
"uns_ch34_sog_M60",
"uns_ch34_USMC",
"uns_ch34_USMC_M60",
"uns_ch34_VNAF",
"uns_ch34_VNAF_M60",
"uns_ch46d",
"uns_ch47_m60_1AC",
"uns_ch47_m60_army",
"uns_ch47_m60_arvn",
"uns_ch47_m60_usmc",
"uns_ch47a_medevac",
"uns_ch53a_m60_usmc",
"uns_ch53a_med_usmc",
"uns_ch53d_m2_usmc",
"uns_H13_amphib_Army",
"uns_H13_amphib_CAV",
"uns_H13_amphib_USAF",
"uns_H13_amphib_USMC",
"uns_H13_amphib_USN",
"uns_H13_gunship_Army",
"uns_H13_gunship_CAV",
"uns_H13_gunship_USAF",
"uns_H13_gunship_USMC",
"uns_H13_gunship_USN",
"uns_H13_medevac_Army",
"uns_H13_medevac_CAV",
"uns_H13_medevac_USAF",
"uns_H13_medevac_USMC",
"uns_H13_medevac_USN",
"uns_H13_transport_Army",
"uns_H13_transport_CAV",
"uns_H13_transport_USAF",
"uns_H13_transport_USMC",
"uns_H13_transport_USN",
"uns_h21c",
"uns_h21c_mg",
"uns_h21viet",
"uns_hh53b_m134_usaf",
"uns_Mi8MB_VPAF_medevac",
"uns_Mi8T_VPAF",
"uns_Mi8TV_VPAF_MG",
"uns_oh6_m27",
"uns_oh6_m27r",
"uns_oh6_m60",
"uns_oh6_transport",
"uns_oh6_xm8",
"uns_rh53a_m2_usn",
"UNS_UH1B_TOW",
"uns_UH1C_M21_M158",
"uns_UH1C_M21_M158_M134",
"uns_UH1C_M21_M200",
"uns_UH1C_M21_M200_1AC",
"UNS_UH1C_M3_ARA",
"UNS_UH1C_M3_ARA_AP",
"UNS_UH1C_M3_ARA_AT",
"uns_UH1C_M6_M158",
"uns_UH1C_M6_M200",
"uns_UH1C_M6_M200_1AC",
"uns_UH1C_M6_M200_M134",
"uns_UH1D_m60",
"uns_UH1D_m60_light",
"uns_uh1D_med",
"uns_uh1D_med_light",
"uns_UH1D_raaf_m60",
"uns_UH1D_raaf_m60_light",
"uns_UH1D_USMC_m60",
"uns_UH1D_USMC_m60_light",
"uns_UH1D_vnaf_m60",
"uns_UH1D_vnaf_m60_light",
"uns_UH1F_M21_M158_Hornet",
"uns_UH1F_M6_M158_Hornet",
"uns_UH1H_m60",
"uns_UH1H_m60_light",
"uns_uh1H_med",
"uns_uh1H_med_light",
"uns_uh34_USMC",


// Planes

"uns_A1H",
"uns_A1H_AGM",
"uns_A1H_BMB",
"uns_A1H_CAS",
"uns_A1H_CBU",
"uns_A1H_CMU",
"uns_A1H_EHCAS",
"uns_A1H_HBMB",
"uns_A1H_HCAS",
"uns_A1H_LBMB",
"uns_A1H_MR",
"uns_A1J",
"uns_A1J_AGM",
"uns_A1J_BMB",
"uns_A1J_CAS",
"uns_A1J_CBU",
"uns_A1J_CMU",
"uns_A1J_EHCAS",
"uns_A1J_HBMB",
"uns_A1J_HCAS",
"uns_A1J_LBMB",
"uns_A1J_MR",
"uns_A1J_navy",
"uns_A1J_navy_AGM",
"uns_A1J_navy_BMB",
"uns_A1J_navy_CAS",
"uns_A1J_navy_CBU",
"uns_A1J_navy_CMU",
"uns_A1J_navy_EHCAS",
"uns_A1J_navy_HBMB",
"uns_A1J_navy_HCAS",
"uns_A1J_navy_LBMB",
"uns_A1J_navy_MR",
"uns_a3a",
"uns_a3avah1",
"uns_a3avah11",
"uns_a3avah2",
"uns_a3avah4",
"uns_a3avah6",
"uns_a3b",
"uns_a3bcamo1",
"uns_a3bvah1",
"uns_a3bvah11",
"uns_a3bvah2",
"uns_a3bvah4",
"uns_a3bvah6",
"uns_A4B_skyhawk",
"uns_A4B_skyhawk_AGM",
"uns_A4B_skyhawk_BMB",
"uns_A4B_skyhawk_CAP",
"uns_A4B_skyhawk_CAS",
"uns_A4B_skyhawk_CBU",
"uns_A4B_skyhawk_HBMB",
"uns_A4B_skyhawk_HCAS",
"uns_A4B_skyhawk_LRBMB",
"uns_A4B_skyhawk_MBMB",
"uns_A4B_skyhawk_MR",
"uns_A4B_skyhawk_SEAD",
"uns_A4E_skyhawk",
"uns_A4E_skyhawk_AGM",
"uns_A4E_skyhawk_BMB",
"uns_A4E_skyhawk_CAP",
"uns_A4E_skyhawk_CAS",
"uns_A4E_skyhawk_CBU",
"uns_A4E_skyhawk_HBMB",
"uns_A4E_skyhawk_HCAS",
"uns_A4E_skyhawk_LRBMB",
"uns_A4E_skyhawk_MBMB",
"uns_A4E_skyhawk_MR",
"uns_A4E_skyhawk_RAN_AGM",
"uns_A4E_skyhawk_RAN_BMB",
"uns_A4E_skyhawk_RAN_CAP",
"uns_A4E_skyhawk_RAN_CAS",
"uns_A4E_skyhawk_RAN_CBU",
"uns_A4E_skyhawk_RAN_HBMB",
"uns_A4E_skyhawk_RAN_HCAS",
"uns_A4E_skyhawk_RAN_LRBMB",
"uns_A4E_skyhawk_RAN_MBMB",
"uns_A4E_skyhawk_RAN_MR",
"uns_A4E_skyhawk_RAN_SEAD",
"uns_A4E_skyhawk_SEAD",
"uns_A4E_skyhawk_USMC_AGM",
"uns_A4E_skyhawk_USMC_BMB",
"uns_A4E_skyhawk_USMC_CAP",
"uns_A4E_skyhawk_USMC_CAS",
"uns_A4E_skyhawk_USMC_CBU",
"uns_A4E_skyhawk_USMC_HBMB",
"uns_A4E_skyhawk_USMC_HCAS",
"uns_A4E_skyhawk_USMC_LRBMB",
"uns_A4E_skyhawk_USMC_MBMB",
"uns_A4E_skyhawk_USMC_MR",
"uns_A4E_skyhawk_USMC_SEAD",
"uns_A6_Intruder_AGM",
"uns_A6_Intruder_BMB",
"uns_A6_Intruder_CAP",
"uns_A6_Intruder_CAS",
"uns_A6_Intruder_CBU",
"uns_A6_Intruder_GBU",
"uns_A6_Intruder_HBMB",
"uns_A6_Intruder_LBMB",
"uns_A6_Intruder_LRBMB",
"uns_A6_Intruder_MBMB",
"uns_A6_Intruder_MR",
"uns_A6_Intruder_SEAD",
"uns_A6_Intruder_USMC_AGM",
"uns_A6_Intruder_USMC_BMB",
"uns_A6_Intruder_USMC_CAP",
"uns_A6_Intruder_USMC_CAS",
"uns_A6_Intruder_USMC_CBU",
"uns_A6_Intruder_USMC_GBU",
"uns_A6_Intruder_USMC_HBMB",
"uns_A6_Intruder_USMC_LBMB",
"uns_A6_Intruder_USMC_LRBMB",
"uns_A6_Intruder_USMC_MBMB",
"uns_A6_Intruder_USMC_MR",
"uns_A6_Intruder_USMC_SEAD",
"uns_A7_AGM",
"uns_A7_BMB",
"uns_A7_CAP",
"uns_A7_CAS",
"uns_A7_CBU",
"uns_A7_GBU",
"uns_A7_HBMB",
"uns_A7_LBMB",
"uns_A7_LRBMB",
"uns_A7_MBMB",
"uns_A7_MR",
"uns_A7_SEAD",
"uns_A7N_AGM",
"uns_A7N_BMB",
"uns_A7N_CAP",
"uns_A7N_CAS",
"uns_A7N_CBU",
"uns_A7N_GBU",
"uns_A7N_HBMB",
"uns_A7N_LBMB",
"uns_A7N_LRBMB",
"uns_A7N_MBMB",
"uns_A7N_MR",
"uns_A7N_SEAD",
"uns_AC47",
"uns_AC47_cia",
"uns_ac47_flare",
"uns_an2",
"uns_an2_bmb",
"uns_an2_cas",
"uns_an2_transport",
"uns_C130_H",
"uns_c1a",
"uns_c1a2",
"uns_c1a2cargo",
"uns_c1a3",
"uns_c1a3cargo",
"uns_c1a4",
"uns_c1a4cargo",
"uns_c1a5",
"uns_c1a5cargo",
"uns_c1a6",
"uns_c1a6cargo",
"uns_c1a7",
"uns_c1a7cargo",
"uns_f100b",
"uns_f100b_AGM",
"uns_f100b_BMB",
"uns_f100b_CAP",
"uns_f100b_CAS",
"uns_f100b_CBU",
"uns_f100b_HBMB",
"uns_f100b_LBMB",
"uns_f100b_LRBMB",
"uns_f100b_MBMB",
"uns_f100b_MR",
"uns_f100b_SEAD",
"uns_f105D_AGM",
"uns_f105D_BMB",
"uns_f105D_CAP",
"uns_f105D_CAS",
"uns_f105D_CBU",
"uns_f105D_GBU",
"uns_f105D_HBMB",
"uns_f105D_HCAS",
"uns_f105D_LRBMB",
"uns_f105D_MBMB",
"uns_f105D_MR",
"uns_f105D_SEAD",
"uns_f105F_AGM",
"uns_f105F_BMB",
"uns_f105F_CBU",
"uns_f105F_GBU",
"uns_f105F_MR",
"uns_f105F_SEAD",
"UNS_F111_AGM",
"UNS_F111_BMB",
"UNS_F111_CAP",
"UNS_F111_CAS",
"UNS_F111_CBU",
"UNS_F111_D_AGM",
"UNS_F111_D_BMB",
"UNS_F111_D_CAP",
"UNS_F111_D_CAS",
"UNS_F111_D_CBU",
"UNS_F111_D_HBMB",
"UNS_F111_D_HCAS",
"UNS_F111_D_LBMB",
"UNS_F111_D_LGB",
"UNS_F111_D_LRBMB",
"UNS_F111_D_MR",
"UNS_F111_D_SEAD",
"UNS_F111_HBMB",
"UNS_F111_HCAS",
"UNS_F111_LBMB",
"UNS_F111_LGB",
"UNS_F111_LRBMB",
"UNS_F111_MR",
"UNS_F111_SEAD",
"uns_F4B_AGM",
"uns_F4B_BMB",
"uns_F4B_CAP",
"uns_F4B_CAS",
"uns_F4B_CBU",
"uns_F4B_GBU",
"uns_F4B_HBMB",
"uns_F4B_LBMB",
"uns_F4B_LRBMB",
"uns_F4B_MBMB",
"uns_F4B_MR",
"uns_F4B_SEAD",
"uns_F4E_AGM",
"uns_F4E_BMB",
"uns_F4E_CAP",
"uns_F4E_CAS",
"uns_F4E_CBU",
"uns_F4E_CHICO",
"uns_F4E_GBU",
"uns_F4E_HBMB",
"uns_F4E_LBMB",
"uns_F4E_LRBMB",
"uns_F4E_MBMB",
"uns_F4E_MR",
"uns_F4E_SEAD",
"uns_F4J_AGM",
"uns_F4J_BMB",
"uns_F4J_CAP",
"uns_F4J_CAS",
"uns_F4J_CBU",
"uns_F4J_GBU",
"uns_F4J_HBMB",
"uns_F4J_LBMB",
"uns_F4J_LRBMB",
"uns_F4J_MBMB",
"uns_F4J_MR",
"uns_F4J_SEAD",
"UNS_Hawkeye",
"uns_ka3b",
"uns_KC130_H",
"uns_Mig21_AGM",
"uns_Mig21_BMB",
"uns_Mig21_CAP",
"uns_Mig21_CAS",
"uns_Mig21_CBU",
"uns_Mig21_HBMB",
"uns_Mig21_HCAS",
"uns_Mig21_LGB",
"uns_mig21_MR",
"uns_Mig21_SEAD",
"uns_ov10_navy",
"uns_ov10_navy_CAS",
"uns_ov10_navy_CBU",
"uns_ov10_navy_FAC",
"uns_ov10_navy_HCAS",
"uns_ov10_navy_MR",
"uns_ov10_usaf",
"uns_ov10_usaf_CAS",
"uns_ov10_usaf_CBU",
"uns_ov10_usaf_FAC",
"uns_ov10_usaf_HCAS",
"uns_ov10_usaf_MR",
"uns_ov10_usmc",
"uns_ov10_usmc_CAS",
"uns_ov10_usmc_CBU",
"uns_ov10_usmc_FAC",
"uns_ov10_usmc_HCAS",
"uns_ov10_usmc_MR",
"uns_plane",
"uns_skymaster",
"UNS_skymaster_CAS",
"UNS_skymaster_CBU",
"uns_skymaster_civ",
"uns_skymaster_civ_blue",
"uns_skymaster_civ_gold",
"uns_skymaster_civ_red",
"uns_skymaster_civ_yellow",
"UNS_skymaster_EHCAS",
"UNS_skymaster_FAC",
"UNS_skymaster_HCAS",
"UNS_skymaster_MR",
"UNS_skymaster_OBS",
"UNS_skymaster_VA",


// Other Air


*/
