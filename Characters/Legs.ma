//Maya ASCII 2022 scene
//Name: Legs.ma
//Last modified: Mon, Dec 08, 2025 04:43:59 PM
//Codeset: 1252
requires maya "2022";
requires "stereoCamera" "10.0";
requires "mtoa" "5.0.0.1";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202110272215-ad32f8f1e6";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 26200)";
fileInfo "UUID" "D4727D9E-43E4-E21C-E2DB-6CADA1E4E0DD";
createNode transform -n "character_grp";
	rename -uid "46CB9D68-413C-991C-F3D4-1CB5C6123530";
	addAttr -ci true -sn "moduleMaintenanceVisibility" -ln "moduleMaintenanceVisibility" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "animationControlVisibility" -ln "animationControlVisibility" 
		-dv 1 -min 0 -max 1 -at "bool";
	setAttr -k on ".animationControlVisibility";
createNode transform -n "LegFoot__instance_1:module_grp" -p "character_grp";
	rename -uid "6B544EE1-4835-E5BD-3537-27A8E6D9E951";
	addAttr -ci true -sn "hierarchicalScale" -ln "hierarchicalScale" -at "float";
createNode transform -n "LegFoot__instance_1:HOOK_IN" -p "LegFoot__instance_1:module_grp";
	rename -uid "76606352-4BA7-DB46-8D96-84807A9BC878";
createNode transform -n "LegFoot__instance_1:blueprint_joints_grp" -p "LegFoot__instance_1:HOOK_IN";
	rename -uid "15DC2194-4DCF-CBFE-2183-8A8CA530F2C4";
	addAttr -ci true -sn "controlModulesInstalled" -ln "controlModulesInstalled" -min 
		0 -max 1 -at "bool";
	setAttr ".ove" yes;
createNode joint -n "LegFoot__instance_1:blueprint_hip_joint" -p "LegFoot__instance_1:blueprint_joints_grp";
	rename -uid "584EC6D1-4E15-8F4F-00D9-348E6DFEA1CD";
	setAttr ".t" -type "double3" 4 9.4862448550724405 0 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.00019086311864750411 -14.036330504968731 -89.999999999560899 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 -50 0 ;
createNode joint -n "LegFoot__instance_1:blueprint_knee_joint" -p "LegFoot__instance_1:blueprint_hip_joint";
	rename -uid "1C3F6D7C-41DD-CA6E-05B4-2BA47AB8E471";
	setAttr ".t" -type "double3" 4.123105525970459 -4.4408920985006262e-16 8.8817841970012523e-16 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 28.072661010087046 0 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 50 0 ;
createNode joint -n "LegFoot__instance_1:blueprint_ankle_joint" -p "LegFoot__instance_1:blueprint_knee_joint";
	rename -uid "3E2CC849-40AF-8206-AF2A-63814981B160";
	setAttr ".t" -type "double3" 4.123105525970459 8.8817841970012523e-16 2.7755575615628914e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99780418055013 -85.601378290609148 -0.0020995338536330915 ;
	setAttr ".ssc" no;
createNode joint -n "LegFoot__instance_1:blueprint_ball_joint" -p "LegFoot__instance_1:blueprint_ankle_joint";
	rename -uid "17664354-41CD-73DF-DB26-5A8E264F0104";
	setAttr ".t" -type "double3" 3.1622786521911621 -6.463433035897026e-06 2.8786743304642926e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 18.434952356144713 0 ;
	setAttr ".ssc" no;
createNode joint -n "LegFoot__instance_1:blueprint_toe_joint" -p "LegFoot__instance_1:blueprint_ball_joint";
	rename -uid "05DCE93B-4E3C-B974-5000-82AE5FE7C1B0";
	setAttr ".t" -type "double3" 3 -3.5527136788005009e-15 -8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode transform -n "LegFoot__instance_1:creationPose_joints_grp" -p "LegFoot__instance_1:HOOK_IN";
	rename -uid "44F9B6FC-4FD0-2750-47C9-1BADC7C41FCF";
createNode joint -n "LegFoot__instance_1:creationPose_hip_joint" -p "LegFoot__instance_1:creationPose_joints_grp";
	rename -uid "C231211B-4E56-CC5C-70EB-FB8CA7FCB003";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 4 9.4862448550724405 0 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.00019086311864750411 -14.036330504968731 -89.999999999560899 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 -50 0 ;
createNode joint -n "LegFoot__instance_1:creationPose_knee_joint" -p "LegFoot__instance_1:creationPose_hip_joint";
	rename -uid "2424F2BB-4E86-193F-55DE-B2BC916DD649";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 4.1231055259704581 -4.4408920985006262e-16 8.8817841970012523e-16 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 28.072661010087046 0 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 50 0 ;
createNode joint -n "LegFoot__instance_1:creationPose_ankle_joint" -p "LegFoot__instance_1:creationPose_knee_joint";
	rename -uid "DA6B2D39-4441-2994-9DF5-808758BE0ADE";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 4.123105525970459 8.8817841970012523e-16 2.7755575615628914e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99780418055013 -85.601378290609148 -0.0020995338536330815 ;
	setAttr ".ssc" no;
createNode joint -n "LegFoot__instance_1:creationPose_ball_joint" -p "LegFoot__instance_1:creationPose_ankle_joint";
	rename -uid "87E0C496-4572-E023-7F29-04BFD3DC4D04";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.1622787060286575 -6.463433035897026e-06 2.8786743304642926e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 18.434952356144713 0 ;
	setAttr ".ssc" no;
createNode joint -n "LegFoot__instance_1:creationPose_toe_joint" -p "LegFoot__instance_1:creationPose_ball_joint";
	rename -uid "F62F7D93-47C7-AAE8-DD5D-9280D4F9E4A2";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3 -3.5527136788005009e-15 -8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode parentConstraint -n "LegFoot__instance_1:hook_parent_constraint" -p "LegFoot__instance_1:HOOK_IN";
	rename -uid "184582E4-4779-F1D7-2475-8699A42AF6B7";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_jointW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode scaleConstraint -n "LegFoot__instance_1:hook_scale_constraint" -p "LegFoot__instance_1:HOOK_IN";
	rename -uid "5619BD1F-4227-DF67-6BE1-E9ADFE5F8880";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_jointW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:SETTINGS" -p "LegFoot__instance_1:module_grp";
	rename -uid "3EDDE0B7-4719-FF9E-B232-A5B8CE235AEC";
	addAttr -ci true -sn "activeModule" -ln "activeModule" -min 0 -max 0 -en "None" 
		-at "enum";
	addAttr -ci true -sn "creationPoseWeight" -ln "creationPoseWeight" -dv 1 -at "float";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:SETTINGSShape" -p "LegFoot__instance_1:SETTINGS";
	rename -uid "2714592F-4E9A-3EF5-E706-B1A11D4AAB80";
	setAttr -k off ".v";
createNode transform -n "LegFoot__instance_1_mirror:module_grp" -p "character_grp";
	rename -uid "804EC573-44C0-1072-CFC1-D0B67BA3362D";
	addAttr -ci true -sn "mirrorInfo" -ln "mirrorInfo" -min 0 -max 3 -en "node:x:y:z" 
		-at "enum";
	addAttr -ci true -sn "hierarchicalScale" -ln "hierarchicalScale" -at "float";
	setAttr ".mirrorInfo" 1;
createNode transform -n "LegFoot__instance_1_mirror:HOOK_IN" -p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "80F840CC-44D4-1709-0C9F-36920E5F100C";
createNode transform -n "LegFoot__instance_1_mirror:blueprint_joints_grp" -p "LegFoot__instance_1_mirror:HOOK_IN";
	rename -uid "27F0D715-4A64-A874-EB35-8D959EF008D2";
	addAttr -ci true -sn "controlModulesInstalled" -ln "controlModulesInstalled" -min 
		0 -max 1 -at "bool";
	setAttr ".ove" yes;
createNode joint -n "LegFoot__instance_1_mirror:blueprint_hip_joint" -p "LegFoot__instance_1_mirror:blueprint_joints_grp";
	rename -uid "435F6FAF-41F5-6D2B-82AE-55A09D1F99C6";
	setAttr ".t" -type "double3" -4 9.4862448550724405 0 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99986840073447 14.036434201675045 90.000005967299998 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 -50 0 ;
createNode joint -n "LegFoot__instance_1_mirror:blueprint_knee_joint" -p "LegFoot__instance_1_mirror:blueprint_hip_joint";
	rename -uid "2C88E8FF-47F6-1F17-8177-68BFEF958B3E";
	setAttr ".t" -type "double3" -4.123105525970459 5.0186521605155576e-11 -5.8633763537763173e-06 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 6.4260578637344092e-06 28.072902106787719 -1.3671492275299273e-06 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 50 0 ;
createNode joint -n "LegFoot__instance_1_mirror:blueprint_ankle_joint" -p "LegFoot__instance_1_mirror:blueprint_knee_joint";
	rename -uid "CFBE238D-499D-210A-6305-EFB78A5DFAA4";
	setAttr ".t" -type "double3" -4.123105525970459 3.5365222457173218e-06 3.4380144935397539e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.0016251007509712305 85.601515691984616 -179.99843462000436 ;
	setAttr ".ssc" no;
createNode joint -n "LegFoot__instance_1_mirror:blueprint_ball_joint" -p "LegFoot__instance_1_mirror:blueprint_ankle_joint";
	rename -uid "31451682-4908-1475-40C1-A386F3F52409";
	setAttr ".t" -type "double3" 3.1622810363769531 -8.0788709055923391e-12 9.0108891983575745e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 18.434953796075256 0 ;
	setAttr ".ssc" no;
createNode joint -n "LegFoot__instance_1_mirror:blueprint_toe_joint" -p "LegFoot__instance_1_mirror:blueprint_ball_joint";
	rename -uid "3905679F-46A6-25A7-CCBB-44AEE0F23623";
	setAttr ".t" -type "double3" 2.9999997615814209 -1.7763568394002505e-15 4.9960036108132044e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode transform -n "LegFoot__instance_1_mirror:creationPose_joints_grp" -p "LegFoot__instance_1_mirror:HOOK_IN";
	rename -uid "2FCED6EB-492B-D75D-4F67-DD92753CBD2A";
createNode joint -n "LegFoot__instance_1_mirror:creationPose_hip_joint" -p "LegFoot__instance_1_mirror:creationPose_joints_grp";
	rename -uid "6D65F60E-42AD-F448-CBA7-C98EF1A3EC47";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -4 9.4862448550724405 0 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99986840073447 14.036434201675045 90.000005967299998 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 -50 0 ;
createNode joint -n "LegFoot__instance_1_mirror:creationPose_knee_joint" -p "LegFoot__instance_1_mirror:creationPose_hip_joint";
	rename -uid "843E1919-4F6C-C598-63C0-E191FA197900";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -4.123105525970459 5.0186521605155576e-11 -5.8633763537763173e-06 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 6.4260578637344135e-06 28.072902106787719 -1.3671492275299271e-06 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 50 0 ;
createNode joint -n "LegFoot__instance_1_mirror:creationPose_ankle_joint" -p "LegFoot__instance_1_mirror:creationPose_knee_joint";
	rename -uid "686CFAA7-416F-7781-90D1-919B5772EE97";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -4.1231055259704599 3.5365222457173218e-06 3.4380144935397539e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.0016251007509712474 85.601515691984645 -179.99843462000436 ;
	setAttr ".ssc" no;
createNode joint -n "LegFoot__instance_1_mirror:creationPose_ball_joint" -p "LegFoot__instance_1_mirror:creationPose_ankle_joint";
	rename -uid "22845D4F-4C06-1986-DE9C-65A9627BD0DE";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.1622809885192615 -8.0788709055923391e-12 9.0108891983575745e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 18.434953796075256 0 ;
	setAttr ".ssc" no;
createNode joint -n "LegFoot__instance_1_mirror:creationPose_toe_joint" -p "LegFoot__instance_1_mirror:creationPose_ball_joint";
	rename -uid "C579B426-48A5-467E-0F87-BD8F2A223406";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.9999997615814213 -1.7763568394002505e-15 4.9960036108132044e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode parentConstraint -n "LegFoot__instance_1_mirror:hook_parent_constraint" 
		-p "LegFoot__instance_1_mirror:HOOK_IN";
	rename -uid "1DA1B2ED-4950-3CAA-B298-85B5FD13ACDA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_jointW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode scaleConstraint -n "LegFoot__instance_1_mirror:hook_scale_constraint" 
		-p "LegFoot__instance_1_mirror:HOOK_IN";
	rename -uid "52C02B5F-4349-D751-07F0-3A9406D999D2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_jointW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:SETTINGS" -p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "F1027A01-4BC7-8CD7-DAD1-438F0CE7E34C";
	addAttr -ci true -sn "activeModule" -ln "activeModule" -min 0 -max 0 -en "None" 
		-at "enum";
	addAttr -ci true -sn "creationPoseWeight" -ln "creationPoseWeight" -dv 1 -at "float";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:SETTINGSShape" -p "LegFoot__instance_1_mirror:SETTINGS";
	rename -uid "A3EB52AA-4C0C-F8C5-4DB3-D380CC178F29";
	setAttr -k off ".v";
createNode transform -n "RootTransform__instance_2:module_grp" -p "character_grp";
	rename -uid "4D9D8DB2-48B5-6671-C4F6-E8A4D1DF769A";
	addAttr -ci true -sn "hierarchicalScale" -ln "hierarchicalScale" -at "float";
createNode transform -n "RootTransform__instance_2:HOOK_IN" -p "RootTransform__instance_2:module_grp";
	rename -uid "A99F83E4-458B-9EDD-9120-E2B343D134C1";
createNode transform -n "RootTransform__instance_2:blueprint_joints_grp" -p "RootTransform__instance_2:HOOK_IN";
	rename -uid "DAFE3560-4BA9-EFC2-2664-339160A6054A";
	addAttr -ci true -sn "controlModulesInstalled" -ln "controlModulesInstalled" -min 
		0 -max 1 -at "bool";
	setAttr ".ove" yes;
createNode joint -n "RootTransform__instance_2:blueprint_joint" -p "RootTransform__instance_2:blueprint_joints_grp";
	rename -uid "65DF3440-4E38-F0FF-E1EF-FCB1EEE29C87";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".radi" 1.5;
createNode transform -n "RootTransform__instance_2:creationPose_joints_grp" -p "RootTransform__instance_2:HOOK_IN";
	rename -uid "F618FD42-476A-A741-45BC-3DA674D592AB";
createNode joint -n "RootTransform__instance_2:creationPose_joint" -p "RootTransform__instance_2:creationPose_joints_grp";
	rename -uid "2084ECBD-4CEE-B3D1-47DD-29927C86BCDD";
	setAttr ".v" no;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".radi" 1.5;
createNode transform -n "RootTransform__instance_2:SETTINGS" -p "RootTransform__instance_2:module_grp";
	rename -uid "D702C6A0-417C-1577-5346-7AA3880A3258";
	addAttr -ci true -sn "activeModule" -ln "activeModule" -min 0 -max 0 -en "None" 
		-at "enum";
	addAttr -ci true -sn "creationPoseWeight" -ln "creationPoseWeight" -dv 1 -at "float";
	setAttr ".v" no;
createNode locator -n "RootTransform__instance_2:SETTINGSShape" -p "RootTransform__instance_2:SETTINGS";
	rename -uid "7C528D3B-4284-94E2-6497-508480A352D5";
	setAttr -k off ".v";
createNode transform -n "non_blueprint_grp" -p "character_grp";
	rename -uid "F2BF7D97-4C0B-3D86-351E-87A6D9317D49";
	addAttr -ci true -k true -sn "display" -ln "display" -dv 1 -min 0 -max 1 -at "bool";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" 1.7423673019933972e-06 4.6487818297787138 2.2746311746534946 ;
	setAttr ".sp" -type "double3" 1.7423673019933972e-06 4.6487818297787138 2.2746311746534946 ;
	setAttr -k on ".display";
createNode transform -n "group" -p "non_blueprint_grp";
	rename -uid "3C9B4D6B-4E1D-F7D2-D3F8-43BE981E8647";
	setAttr ".t" -type "double3" 0 9.3 0 ;
createNode transform -n "blueprint_toe_joint_geoAttach_parentGrp1" -p "group";
	rename -uid "1A25C233-4AB5-A970-56B0-83A70CA27260";
createNode parentConstraint -n "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint" 
		-p "blueprint_toe_joint_geoAttach_parentGrp1";
	rename -uid "8064011B-441E-B475-03EB-B085A8573F22";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_toe_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 89.999999999999972 -89.999998415348244 0 ;
	setAttr ".rst" -type "double3" -3.9999999999999991 -8.8137551600614952 6.0000000558996636 ;
	setAttr ".rsrr" -type "double3" 89.999999999999972 -89.999998415348244 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "blueprint_toe_joint_geoAttach_parentGrp1_scaleConstraint" 
		-p "blueprint_toe_joint_geoAttach_parentGrp1";
	rename -uid "4754560A-4E0B-FF6E-76D8-528CB4A8316F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_toe_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "R_Toe" -p "blueprint_toe_joint_geoAttach_parentGrp1";
	rename -uid "45202897-4EE8-638E-F1FD-459C5E7EBD32";
	setAttr ".t" -type "double3" -5.9999999452701029 -4.00000016594434 -8.8137551600614934 ;
	setAttr ".r" -type "double3" -90 0 -89.999998415348244 ;
	setAttr ".s" -type "double3" 1 0.99999999999999978 1 ;
	setAttr ".rp" -type "double3" -4 -8.626378878927996 6.5049043292477773 ;
	setAttr ".rpt" -type "double3" 10.504904218618211 12.626379058836674 2.1214745496802188 ;
	setAttr ".sp" -type "double3" -4 -8.6263788789279978 6.5049043292477773 ;
	setAttr ".spt" -type "double3" 0 1.7763568394002497e-15 0 ;
createNode mesh -n "R_ToeShape" -p "R_Toe";
	rename -uid "70D2A695-4311-EAFD-4BC8-CABC3CCB240C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  -2.602066 -8.8014402 6.541224 
		-5.397934 -8.8014402 6.541224 -2.602066 -9.3124447 6.541224 -5.397934 -9.3124447 
		6.541224 -2.3903334 -8.8940363 6.5086145 -5.6096663 -8.8940363 6.5086145 -2.3903334 
		-8.8014402 6.5086145 -5.6096663 -8.8014402 6.5086145;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 4 1 -6 -1
		mu 0 4 0 2 3 1
		f 4 6 2 -8 -2
		mu 0 4 2 4 5 3
		f 4 8 3 -10 -3
		mu 0 4 4 6 7 5
		f 4 10 0 -12 -4
		mu 0 4 6 8 9 7
		f 4 5 7 9 11
		mu 0 4 1 3 11 10
		f 4 -9 -7 -5 -11
		mu 0 4 12 13 2 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "blueprint_ball_joint_geoAttach_parentGrp1" -p "group";
	rename -uid "53139758-43E6-50D7-BFB4-77AD70C5D846";
createNode parentConstraint -n "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint" 
		-p "blueprint_ball_joint_geoAttach_parentGrp1";
	rename -uid "AF3578D9-4F20-837A-722C-D793E0FF8AAD";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_ball_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 89.999999999999972 -89.999998415348244 0 ;
	setAttr ".rst" -type "double3" -4 -8.8137552430336594 3.0000002943182436 ;
	setAttr ".rsrr" -type "double3" 89.999999999999972 -89.999998415348244 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "blueprint_ball_joint_geoAttach_parentGrp1_scaleConstraint" 
		-p "blueprint_ball_joint_geoAttach_parentGrp1";
	rename -uid "B314572C-4716-4777-05C4-8E8B8D02763D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_ball_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "blueprint_ball_joint_geoAttach_scaleGrp1" -p "blueprint_ball_joint_geoAttach_parentGrp1";
	rename -uid "D7E455F9-4BF5-BA19-A6DC-6D8B46429C0E";
createNode transform -n "R_Ball" -p "blueprint_ball_joint_geoAttach_scaleGrp1";
	rename -uid "1C6E69F0-4C77-B169-62CA-6688C1534DCF";
	setAttr ".t" -type "double3" -3.0000001836886803 -4.000000082972174 -8.813755243033663 ;
	setAttr ".r" -type "double3" -90 0 -89.999998415348244 ;
	setAttr ".s" -type "double3" 0.99999999999999978 1.0000000000000002 0.99999999999999989 ;
	setAttr ".rp" -type "double3" -3.9999999999999991 -8.6263788789279996 4.4425302472505503 ;
	setAttr ".rpt" -type "double3" 8.4425301366209862 12.62637900179679 4.1838486316774492 ;
	setAttr ".sp" -type "double3" -4 -8.6263788789279978 4.4425302472505512 ;
	setAttr ".spt" -type "double3" 8.8817841970012484e-16 -1.7763568394002513e-15 -8.8817841970012504e-16 ;
createNode mesh -n "R_BallShape" -p "R_Ball";
	rename -uid "8C0ED4EF-4159-060F-8075-36AF266E85EE";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  -2.362057 -8.8014402 5.5 
		-5.6379428 -8.8014402 5.5 -2.362057 -8.8697262 5.5 -5.6379428 -8.8697262 5.5 -2.0937302 
		-8.4513168 3.5013087 -5.9062696 -8.4513168 3.5013087 -2.0937302 -8.8014402 3.5013087 
		-5.9062696 -8.8014402 3.5013087;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 4 1 -6 -1
		mu 0 4 0 2 3 1
		f 4 6 2 -8 -2
		mu 0 4 2 4 5 3
		f 4 8 3 -10 -3
		mu 0 4 4 6 7 5
		f 4 10 0 -12 -4
		mu 0 4 6 8 9 7
		f 4 5 7 9 11
		mu 0 4 1 3 11 10
		f 4 -9 -7 -5 -11
		mu 0 4 12 13 2 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "blueprint_ankle_joint_geoAttach_parentGrp1" -p "group";
	rename -uid "1930786F-490C-9E4A-FEDA-A8B8740C7B8E";
createNode parentConstraint -n "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint" 
		-p "blueprint_ankle_joint_geoAttach_parentGrp1";
	rename -uid "71AED87B-4E15-B21A-5B34-7A93931DA020";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_ankle_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 5.0888874903416268e-14 -108.43495221142349 89.999999999999915 ;
	setAttr ".rst" -type "double3" -4.000000000008078 -7.8137454494811402 1.3322676295501878e-15 ;
	setAttr ".rsrr" -type "double3" 5.0888874903416268e-14 -108.43495221142349 89.999999999999915 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "blueprint_ankle_joint_geoAttach_parentGrp1_scaleConstraint" 
		-p "blueprint_ankle_joint_geoAttach_parentGrp1";
	rename -uid "8CC944E1-4B1E-8886-85F8-ED9E683753EC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_ankle_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "blueprint_ankle_joint_geoAttach_scaleGrp1" -p "blueprint_ankle_joint_geoAttach_parentGrp1";
	rename -uid "1A7147F2-4650-E883-6DAF-FB9EA8D6246E";
createNode transform -n "R_Ankle" -p "blueprint_ankle_joint_geoAttach_scaleGrp1";
	rename -uid "E3538861-47BB-4BE6-B00F-1BB8FFD987ED";
	setAttr ".t" -type "double3" -2.4709237061086204 -4.0000000000080629 -7.4127696570092958 ;
	setAttr ".r" -type "double3" -108.43495221142346 -3.1805546814635176e-15 -90.000000000000028 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999989 0.99999999999999956 ;
	setAttr ".rp" -type "double3" -4.0000000000000009 -8.9888979720626274 0.0081663131713867153 ;
	setAttr ".rpt" -type "double3" 6.8502868737458842 12.988897972062629 8.5168684772663923 ;
	setAttr ".sp" -type "double3" -4 -8.9888979720626292 0.0081663131713867188 ;
	setAttr ".spt" -type "double3" -8.8817841970012563e-16 1.7763568394002501e-15 -3.4694469519536111e-18 ;
createNode mesh -n "R_AnkleShape" -p "R_Ankle";
	rename -uid "7F68B210-4914-D1FE-D9BB-6EBDECC0B5D0";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 18 ".uvst[0].uvsp[0:17]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 12 ".pt[0:11]" -type "float3"  -2.5140343 -9.0589285 0.4941321 
		-5.4859657 -9.0589285 0.4941321 -2.5140343 -7.8061543 0.4941321 -5.4859657 -7.8061543 
		0.4941321 -2.5140343 -7.8061543 -0.47779945 -5.4859657 -7.8061543 -0.47779945 -2.5140343 
		-9.0589285 -0.47779945 -5.4859657 -9.0589285 -0.47779945 -1.8569912 -9.0589285 1.4827902 
		-6.1430082 -9.0589285 1.4827902 -6.1430082 -8.4551764 1.4827902 -1.8569912 -8.4551764 
		1.4827902;
	setAttr -s 12 ".vt[0:11]"  -0.5 -0.24706554 0.5 0.5 -0.24706554 0.5
		 -0.5 0.5 0.5 0.5 0.5 0.5 -0.5 0.5 -0.49999997 0.5 0.5 -0.49999997 -0.5 -0.24706554 -0.49999997
		 0.5 -0.24706554 -0.49999997 -0.72108281 -0.24706554 1.51720953 0.72108269 -0.24706554 1.51720953
		 0.72108269 0.5 1.51720953 -0.72108281 0.5 1.51720953;
	setAttr -s 20 ".ed[0:19]"  0 1 1 2 3 1 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 0 8 0 1 9 0 8 9 0 3 10 0 9 10 0 2 11 0 11 10 0 8 11 0;
	setAttr -s 10 -ch 40 ".fc[0:9]" -type "polyFaces" 
		f 4 19 18 -17 -15
		mu 0 4 14 17 16 15
		f 4 6 2 -8 -2
		mu 0 4 2 4 5 3
		f 4 8 3 -10 -3
		mu 0 4 4 6 7 5
		f 4 10 0 -12 -4
		mu 0 4 6 8 9 7
		f 4 5 7 9 11
		mu 0 4 1 3 11 10
		f 4 -9 -7 -5 -11
		mu 0 4 12 13 2 0
		f 4 12 14 -14 -1
		mu 0 4 0 14 15 1
		f 4 13 16 -16 -6
		mu 0 4 1 15 16 3
		f 4 15 -19 -18 1
		mu 0 4 3 16 17 2
		f 4 17 -20 -13 4
		mu 0 4 2 17 14 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "blueprint_knee_joint_geoAttach_parentGrp1" -p "group";
	rename -uid "E59012FE-413F-848B-FAD1-B09963AC8A9C";
createNode parentConstraint -n "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint" 
		-p "blueprint_knee_joint_geoAttach_parentGrp1";
	rename -uid "6ECFCBF1-4758-A11B-F9A3-9DB0A160B854";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_knee_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -179.99986163286505 -14.036467905044328 89.999943374780329 ;
	setAttr ".rst" -type "double3" -3.9999995833407209 -3.8137502972049777 1.0000189798596304 ;
	setAttr ".rsrr" -type "double3" -179.99986163286505 -14.036467905044328 89.999943374780329 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "blueprint_knee_joint_geoAttach_parentGrp1_scaleConstraint" 
		-p "blueprint_knee_joint_geoAttach_parentGrp1";
	rename -uid "91C545B8-4175-789E-12AB-1CB69FD74323";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_knee_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "blueprint_knee_joint_geoAttach_scaleGrp1" -p "blueprint_knee_joint_geoAttach_parentGrp1";
	rename -uid "2E51377E-443D-2ECD-4468-9C8E7E2BC1B1";
createNode transform -n "R_LowerLeg" -p "blueprint_knee_joint_geoAttach_scaleGrp1";
	rename -uid "9DD4BAE0-474D-377A-2AA1-F1B12977C9F2";
	setAttr ".t" -type "double3" 3.4573374315084688 4.0000003909160169 1.8951360673045727 ;
	setAttr ".r" -type "double3" 165.96353209482959 0.00012463328672200535 89.999945065521629 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999989 ;
	setAttr ".rp" -type "double3" -3.9999999999999991 -5.9718481145604372 0.47720594822667878 ;
	setAttr ".rpt" -type "double3" -1.677800565475541 1.9718494006522238 -2.3885631748643985 ;
	setAttr ".sp" -type "double3" -4 -5.9718481145604381 0.47720594822667894 ;
	setAttr ".spt" -type "double3" 8.8817841970012484e-16 8.8817841970012484e-16 -1.6653345369377346e-16 ;
createNode mesh -n "R_LowerLegShape" -p "R_LowerLeg";
	rename -uid "B835200E-4BB6-F920-7524-C5A913205C43";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.16007369756698608 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 44 ".uvst[0].uvsp[0:43]" -type "float2" 0.62640893 0.064408526
		 0.54828387 0.0076473951 0.45171607 0.00764741 0.37359107 0.064408556 0.34375 0.15625
		 0.37359107 0.24809146 0.4517161 0.3048526 0.54828393 0.3048526 0.62640893 0.24809146
		 0.65625 0.15625 0.375 0.3125 0.40000001 0.3125 0.42500001 0.3125 0.45000002 0.3125
		 0.47500002 0.3125 0.5 0.3125 0.52499998 0.3125 0.54999995 0.3125 0.57499993 0.3125
		 0.5999999 0.3125 0.62499988 0.3125 0.375 0.68843985 0.40000001 0.68843985 0.42500001
		 0.68843985 0.45000002 0.68843985 0.47500002 0.68843985 0.5 0.68843985 0.52499998
		 0.68843985 0.54999995 0.68843985 0.57499993 0.68843985 0.5999999 0.68843985 0.62499988
		 0.68843985 0.62640893 0.75190854 0.54828387 0.6951474 0.45171607 0.6951474 0.37359107
		 0.75190854 0.34375 0.84375 0.37359107 0.93559146 0.4517161 0.9923526 0.54828393 0.9923526
		 0.62640893 0.93559146 0.65625 0.84375 0.5 0.15000001 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 22 ".pt[0:21]" -type "float3"  -5.2110667 -6.9377723 0.31133226 
		-4.4625859 -6.8971615 0.49869913 -3.5374136 -6.8971615 0.49869907 -2.7889335 -6.9377723 
		0.31133217 -2.5030394 -7.0034819 0.008166248 -2.7889335 -7.0691915 -0.29499969 -3.5374138 
		-7.1098022 -0.4823665 -4.4625864 -7.1098022 -0.48236647 -5.2110662 -7.0691915 -0.2949996 
		-5.4969606 -7.0034819 0.0081662796 -5.5716825 -5.2278242 0.89894676 -4.6003289 -5.1507878 
		0.92853719 -3.3996706 -5.1507878 0.92853719 -2.4283173 -5.2278242 0.89894676 -2.0572937 
		-5.3524718 0.85106844 -2.4283175 -5.477119 0.80319017 -3.3996708 -5.5541553 0.77359974 
		-4.6003294 -5.5541553 0.77359974 -5.5716825 -5.477119 0.80319017 -5.9427061 -5.3524718 
		0.85106844 -4 -7.0034819 0.0081662796 -4 -5.3524718 0.85106844;
	setAttr -s 22 ".vt[0:21]"  0.80901706 -1 -0.58778542 0.30901694 -1 -0.95105672
		 -0.30901715 -1 -0.9510566 -0.80901718 -1 -0.58778524 -1.000000119209 -1 5.9604645e-08
		 -0.80901706 -1 0.58778536 -0.30901697 -1 0.9510566 0.30901703 -1 0.95105654 0.809017 -1 0.58778524
		 1 -1 0 0.80901706 1 -0.58778542 0.30901694 1 -0.95105672 -0.30901715 1 -0.9510566
		 -0.80901718 1 -0.58778524 -1.000000119209 1 5.9604645e-08 -0.80901706 1 0.58778536
		 -0.30901697 1 0.9510566 0.30901703 1 0.95105654 0.809017 1 0.58778524 1 1 0 0 -1 0
		 0 1 0;
	setAttr -s 50 ".ed[0:49]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 0 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 10 0 0 10 0 1 11 0 2 12 0 3 13 0 4 14 0 5 15 0 6 16 0 7 17 0 8 18 0 9 19 0
		 20 0 1 20 1 1 20 2 1 20 3 1 20 4 1 20 5 1 20 6 1 20 7 1 20 8 1 20 9 1 10 21 1 11 21 1
		 12 21 1 13 21 1 14 21 1 15 21 1 16 21 1 17 21 1 18 21 1 19 21 1;
	setAttr -s 30 -ch 100 ".fc[0:29]" -type "polyFaces" 
		f 4 20 10 -22 -1
		mu 0 4 10 21 22 11
		f 4 21 11 -23 -2
		mu 0 4 11 22 23 12
		f 4 22 12 -24 -3
		mu 0 4 12 23 24 13
		f 4 23 13 -25 -4
		mu 0 4 13 24 25 14
		f 4 24 14 -26 -5
		mu 0 4 14 25 26 15
		f 4 25 15 -27 -6
		mu 0 4 15 26 27 16
		f 4 26 16 -28 -7
		mu 0 4 16 27 28 17
		f 4 27 17 -29 -8
		mu 0 4 17 28 29 18
		f 4 28 18 -30 -9
		mu 0 4 18 29 30 19
		f 4 29 19 -21 -10
		mu 0 4 19 30 31 20
		f 3 -32 30 0
		mu 0 3 1 42 0
		f 3 -33 31 1
		mu 0 3 2 42 1
		f 3 -34 32 2
		mu 0 3 3 42 2
		f 3 -35 33 3
		mu 0 3 4 42 3
		f 3 -36 34 4
		mu 0 3 5 42 4
		f 3 -37 35 5
		mu 0 3 6 42 5
		f 3 -38 36 6
		mu 0 3 7 42 6
		f 3 -39 37 7
		mu 0 3 8 42 7
		f 3 -40 38 8
		mu 0 3 9 42 8
		f 3 -31 39 9
		mu 0 3 0 42 9
		f 3 40 -42 -11
		mu 0 3 40 43 39
		f 3 41 -43 -12
		mu 0 3 39 43 38
		f 3 42 -44 -13
		mu 0 3 38 43 37
		f 3 43 -45 -14
		mu 0 3 37 43 36
		f 3 44 -46 -15
		mu 0 3 36 43 35
		f 3 45 -47 -16
		mu 0 3 35 43 34
		f 3 46 -48 -17
		mu 0 3 34 43 33
		f 3 47 -49 -18
		mu 0 3 33 43 32
		f 3 48 -50 -19
		mu 0 3 32 43 41
		f 3 49 -41 -20
		mu 0 3 41 43 40;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "blueprint_hip_joint_geoAttach_parentGrp1" -p "group";
	rename -uid "B9F6F48A-4F21-F5DD-2587-E4A6B7A6F160";
createNode parentConstraint -n "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint" 
		-p "blueprint_hip_joint_geoAttach_parentGrp1";
	rename -uid "96881B35-43AB-83A8-654F-F29D122BF4DE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_hip_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -179.99986840073447 14.036434201675045 90.000005967299998 ;
	setAttr ".rst" -type "double3" -4 0.18624485507243982 0 ;
	setAttr ".rsrr" -type "double3" -179.99986840073447 14.036434201675045 90.000005967299998 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "blueprint_hip_joint_geoAttach_parentGrp1_scaleConstraint" 
		-p "blueprint_hip_joint_geoAttach_parentGrp1";
	rename -uid "F6AA47A1-47F9-7543-0C8C-3F937A5C121C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_hip_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "blueprint_hip_joint_geoAttach_scaleGrp1" -p "blueprint_hip_joint_geoAttach_parentGrp1";
	rename -uid "2A5ECD9B-4EE7-C2D0-0770-0BB693F2FC0A";
createNode transform -n "R_UpperLeg" -p "blueprint_hip_joint_geoAttach_scaleGrp1";
	rename -uid "9252C55D-405A-72B7-ECF3-4DAFF5177781";
	setAttr ".t" -type "double3" -0.18068430312423089 4.0000000843444328 0.045162527498207261 ;
	setAttr ".r" -type "double3" -165.96356579831172 0.00013015196343873391 90.000005789126547 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999967 1 ;
	setAttr ".rp" -type "double3" -4.0000000000000009 -1.9127738204846905 0.44159863196763305 ;
	setAttr ".rpt" -type "double3" 2.0372339457155313 -2.0872262971606323 -0.40608081850347399 ;
	setAttr ".sp" -type "double3" -4 -1.9127738204846916 0.44159863196763305 ;
	setAttr ".spt" -type "double3" -8.8817841970012563e-16 1.1102230246251559e-15 0 ;
createNode mesh -n "R_UpperLegShape" -p "R_UpperLeg";
	rename -uid "E6AB2C9F-4C1B-522C-E0D4-BD9593ABEE52";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.8403962254524231 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 44 ".uvst[0].uvsp[0:43]" -type "float2" 0.62640893 0.064408526
		 0.54828387 0.0076473951 0.45171607 0.00764741 0.37359107 0.064408556 0.34375 0.15625
		 0.37359107 0.24809146 0.4517161 0.3048526 0.54828393 0.3048526 0.62640893 0.24809146
		 0.65625 0.15625 0.375 0.3125 0.40000001 0.3125 0.42500001 0.3125 0.45000002 0.3125
		 0.47500002 0.3125 0.5 0.3125 0.52499998 0.3125 0.54999995 0.3125 0.57499993 0.3125
		 0.5999999 0.3125 0.62499988 0.3125 0.375 0.68843985 0.40000001 0.68843985 0.42500001
		 0.68843985 0.45000002 0.68843985 0.47500002 0.68843985 0.5 0.68843985 0.52499998
		 0.68843985 0.54999995 0.68843985 0.57499993 0.68843985 0.5999999 0.68843985 0.62499988
		 0.68843985 0.62640893 0.75190854 0.54828387 0.6951474 0.45171607 0.6951474 0.37359107
		 0.75190854 0.34375 0.84375 0.37359107 0.93559146 0.4517161 0.9923526 0.54828393 0.9923526
		 0.62640893 0.93559146 0.65625 0.84375 0.5 0.15000001 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 22 ".pt[0:21]" -type "float3"  -9.6180344 0 0 -8.6180344 
		0 0 -7.3819656 0 0 -6.3819656 0 0 -6 0 0 -6.3819656 0 0 -7.3819661 0 0 -8.6180344 
		0 0 -9.6180344 0 0 -10 0 0 -10.422646 0 0 -8.9253683 0 0 -7.0746317 0 0 -5.577354 
		0 0 -5.0054455 0 0 -5.5773544 0 0 -7.0746322 0 0 -8.9253683 0 0 -10.422646 0 0 -10.994555 
		0 0 -8 0 0 -8 0 0;
	setAttr -s 22 ".vt[0:21]"  4.80901718 -4.069829464 0.33634755 4.30901718 -4.15154743 -0.017613143
		 3.69098282 -4.15154743 -0.017613024 3.19098282 -4.069829464 0.33634773 3 -3.93760657 0.90906811
		 3.19098282 -3.80538368 1.48178864 3.69098306 -3.72366524 1.83574915 4.30901718 -3.72366524 1.83574915
		 4.80901718 -3.80538368 1.4817884 5 -3.93760657 0.90906811 5.21132278 -0.085915565 -0.8833921
		 4.46268415 -0.20827031 -1.41336894 3.53731585 -0.20827031 -1.41336882 2.78867698 -0.085915446 -0.88339162
		 2.50272274 0.11205888 -0.025870711 2.78867722 0.31003332 0.8316505 3.53731608 0.43238807 1.36162734
		 4.46268415 0.43238807 1.36162722 5.21132278 0.31003332 0.83165038 5.49727726 0.11205888 -0.0258708
		 4 -3.93760657 0.90906811 4 0.11205888 -0.0258708;
	setAttr -s 50 ".ed[0:49]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 0 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 10 0 0 10 0 1 11 0 2 12 0 3 13 0 4 14 0 5 15 0 6 16 0 7 17 0 8 18 0 9 19 0
		 20 0 1 20 1 1 20 2 1 20 3 1 20 4 1 20 5 1 20 6 1 20 7 1 20 8 1 20 9 1 10 21 1 11 21 1
		 12 21 1 13 21 1 14 21 1 15 21 1 16 21 1 17 21 1 18 21 1 19 21 1;
	setAttr -s 30 -ch 100 ".fc[0:29]" -type "polyFaces" 
		f 4 20 10 -22 -1
		mu 0 4 10 21 22 11
		f 4 21 11 -23 -2
		mu 0 4 11 22 23 12
		f 4 22 12 -24 -3
		mu 0 4 12 23 24 13
		f 4 23 13 -25 -4
		mu 0 4 13 24 25 14
		f 4 24 14 -26 -5
		mu 0 4 14 25 26 15
		f 4 25 15 -27 -6
		mu 0 4 15 26 27 16
		f 4 26 16 -28 -7
		mu 0 4 16 27 28 17
		f 4 27 17 -29 -8
		mu 0 4 17 28 29 18
		f 4 28 18 -30 -9
		mu 0 4 18 29 30 19
		f 4 29 19 -21 -10
		mu 0 4 19 30 31 20
		f 3 -32 30 0
		mu 0 3 1 42 0
		f 3 -33 31 1
		mu 0 3 2 42 1
		f 3 -34 32 2
		mu 0 3 3 42 2
		f 3 -35 33 3
		mu 0 3 4 42 3
		f 3 -36 34 4
		mu 0 3 5 42 4
		f 3 -37 35 5
		mu 0 3 6 42 5
		f 3 -38 36 6
		mu 0 3 7 42 6
		f 3 -39 37 7
		mu 0 3 8 42 7
		f 3 -40 38 8
		mu 0 3 9 42 8
		f 3 -31 39 9
		mu 0 3 0 42 9
		f 3 40 -42 -11
		mu 0 3 40 43 39
		f 3 41 -43 -12
		mu 0 3 39 43 38
		f 3 42 -44 -13
		mu 0 3 38 43 37
		f 3 43 -45 -14
		mu 0 3 37 43 36
		f 3 44 -46 -15
		mu 0 3 36 43 35
		f 3 45 -47 -16
		mu 0 3 35 43 34
		f 3 46 -48 -17
		mu 0 3 34 43 33
		f 3 47 -49 -18
		mu 0 3 33 43 32
		f 3 48 -50 -19
		mu 0 3 32 43 41
		f 3 49 -41 -20
		mu 0 3 41 43 40;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "blueprint_toe_joint_geoAttach_parentGrp2" -p "group";
	rename -uid "8F1A0E5E-46EB-196B-EDD6-3BBDF547C079";
createNode parentConstraint -n "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint" 
		-p "blueprint_toe_joint_geoAttach_parentGrp2";
	rename -uid "6A5DE0A7-4474-DC45-B0BA-379C72FF7D3A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_toe_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 90.000000000000199 -89.999999855278901 0 ;
	setAttr ".rst" -type "double3" 4.0000000000000009 -8.8137551279026471 5.9999999716579993 ;
	setAttr ".rsrr" -type "double3" 90.000000000000199 -89.999999855278901 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "blueprint_toe_joint_geoAttach_parentGrp2_scaleConstraint" 
		-p "blueprint_toe_joint_geoAttach_parentGrp2";
	rename -uid "598A792B-4D19-A317-E586-3DBF378CDC4E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_toe_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "L_Toe" -p "blueprint_toe_joint_geoAttach_parentGrp2";
	rename -uid "5184B967-4A94-6B92-02FC-5087E5EFDFC7";
	setAttr ".t" -type "double3" -5.9999999817614356 3.9999999848448153 -8.8137551279026596 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 -89.999999855278915 ;
	setAttr ".s" -type "double3" 1 1 1.0000000000000004 ;
	setAttr ".rp" -type "double3" 4 -8.6263788789279978 6.5049043292477799 ;
	setAttr ".rpt" -type "double3" 2.5049043393512216 4.6263788953584681 2.1214745496802183 ;
	setAttr ".sp" -type "double3" 4 -8.6263788789279978 6.5049043292477773 ;
	setAttr ".spt" -type "double3" 0 0 2.6645352591003781e-15 ;
createNode mesh -n "L_ToeShape" -p "L_Toe";
	rename -uid "6069AF15-4482-BFF3-B958-EC90D6E22490";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  3.602066 -8.8014402 6.5412245 
		4.397934 -8.8014402 6.5412245 3.602066 -9.3124447 6.5412245 4.397934 -9.3124447 6.5412245 
		3.3903334 -8.8940363 6.508615 4.6096663 -8.8940363 6.508615 3.3903334 -8.8014402 
		6.508615 4.6096663 -8.8014402 6.508615;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "blueprint_ball_joint_geoAttach_parentGrp2" -p "group";
	rename -uid "0F5AFE66-4BE2-7D53-2682-26AD6788BAC1";
createNode parentConstraint -n "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint" 
		-p "blueprint_ball_joint_geoAttach_parentGrp2";
	rename -uid "C679599B-410B-B82B-283B-A29937E051B4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_ball_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 90.000000000000213 -89.999999855278915 0 ;
	setAttr ".rst" -type "double3" 4.0000000000000009 -8.8137551354802284 2.9999999716579997 ;
	setAttr ".rsrr" -type "double3" 90.000000000000213 -89.999999855278915 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "blueprint_ball_joint_geoAttach_parentGrp2_scaleConstraint" 
		-p "blueprint_ball_joint_geoAttach_parentGrp2";
	rename -uid "CF179526-4227-DBF5-C90A-27BF2FDC2DCE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_ball_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "blueprint_ball_joint_geoAttach_scaleGrp2" -p "blueprint_ball_joint_geoAttach_parentGrp2";
	rename -uid "7767A5E3-42FE-ACF5-CAFD-A3B040D6BB26";
createNode transform -n "L_Ball" -p "blueprint_ball_joint_geoAttach_scaleGrp2";
	rename -uid "78170008-4060-02D4-8EE5-8A998DD52E79";
	setAttr ".t" -type "double3" 1.4425302755925533 3.6436285100194254e-09 -0.1873762565522305 ;
	setAttr ".r" -type "double3" -90 0 -89.999999855278915 ;
	setAttr ".s" -type "double3" 2.812539537089306 1.3501234284377621 2.8824430131552834 ;
createNode mesh -n "L_BallShape" -p "L_Ball";
	rename -uid "245CB0F0-4990-A48D-1447-F981A7CAB153";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.095403738 0 0.040329766 
		-0.095403738 0 0.040329766 0.095403731 -0.30990389 0.040329766 -0.095403731 -0.30990389 
		0.040329766;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "blueprint_ankle_joint_geoAttach_parentGrp2" -p "group";
	rename -uid "1DEF6C1B-4BF4-E3A1-55DF-D9B719540166";
createNode parentConstraint -n "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint" 
		-p "blueprint_ankle_joint_geoAttach_parentGrp2";
	rename -uid "813DE71D-4631-811B-D84B-7098B5E21A45";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_ankle_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 2.0355549961366507e-13 -108.43495221142359 90 ;
	setAttr ".rst" -type "double3" 3.999993536566965 -7.8137519134032924 2.2204460492503131e-15 ;
	setAttr ".rsrr" -type "double3" 2.0355549961366507e-13 -108.43495221142359 90 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "blueprint_ankle_joint_geoAttach_parentGrp2_scaleConstraint" 
		-p "blueprint_ankle_joint_geoAttach_parentGrp2";
	rename -uid "2E22EFF5-4867-45A7-D2AD-69BA360E740F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_ankle_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "blueprint_ankle_joint_geoAttach_scaleGrp2" -p "blueprint_ankle_joint_geoAttach_parentGrp2";
	rename -uid "638A269B-4869-1D0F-646C-58BCA3A5A616";
createNode transform -n "L_Ankle" -p "blueprint_ankle_joint_geoAttach_scaleGrp2";
	rename -uid "8D1CCCE4-46F9-3AD4-D518-05842CC5FD45";
	setAttr ".t" -type "double3" 0.37936112356524121 -6.4634330341206692e-06 1.1122590012136131 ;
	setAttr ".r" -type "double3" -108.43495221142361 0 -90 ;
	setAttr ".s" -type "double3" 1.971931592614649 1.971931592614649 1.9719315926146486 ;
createNode mesh -n "L_AnkleShape" -p "L_Ankle";
	rename -uid "447E499B-4CE7-62CD-B078-F28A8C542E3C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 18 ".uvst[0].uvsp[0:17]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 12 ".pt[0:11]" -type "float3"  0 0.086260974 0 0 0.086260974 
		0 0 0.35334769 0 0 0.35334769 0 0 0.35334769 0 0 0.35334769 0 0 0.086260974 0 0 0.086260974 
		0 0 0.086260974 0 0 0.086260974 0 0 0.024217904 0 0 0.024217904 0;
	setAttr -s 12 ".vt[0:11]"  -0.5 -0.24706554 0.5 0.5 -0.24706554 0.5
		 -0.5 0.5 0.5 0.5 0.5 0.5 -0.5 0.5 -0.49999997 0.5 0.5 -0.49999997 -0.5 -0.24706554 -0.49999997
		 0.5 -0.24706554 -0.49999997 -0.72108281 -0.24706554 1.51720953 0.72108269 -0.24706554 1.51720953
		 0.72108269 0.5 1.51720953 -0.72108281 0.5 1.51720953;
	setAttr -s 20 ".ed[0:19]"  0 1 1 2 3 1 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 0 8 0 1 9 0 8 9 0 3 10 0 9 10 0 2 11 0 11 10 0 8 11 0;
	setAttr -s 10 -ch 40 ".fc[0:9]" -type "polyFaces" 
		f 4 14 16 -19 -20
		mu 0 4 14 15 16 17
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 0 13 -15 -13
		mu 0 4 0 1 15 14
		f 4 5 15 -17 -14
		mu 0 4 1 3 16 15
		f 4 -2 17 18 -16
		mu 0 4 3 2 17 16
		f 4 -5 12 19 -18
		mu 0 4 2 0 14 17;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "blueprint_knee_joint_geoAttach_parentGrp2" -p "group";
	rename -uid "99F2CC33-4FCF-183C-B862-6186A5A92878";
createNode parentConstraint -n "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint" 
		-p "blueprint_knee_joint_geoAttach_parentGrp2";
	rename -uid "0594F840-4E77-22BF-7B06-8B9EEE41EED6";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_knee_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -0.00019086311864668454 14.036330504968715 -90.000092582335014 ;
	setAttr ".rst" -type "double3" 4.0000000000306546 -3.8137535291680376 1.0000060521625378 ;
	setAttr ".rsrr" -type "double3" -0.00019086311864668454 14.036330504968715 -90.000092582335014 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "blueprint_knee_joint_geoAttach_parentGrp2_scaleConstraint" 
		-p "blueprint_knee_joint_geoAttach_parentGrp2";
	rename -uid "1D4D73AC-4741-84A9-9BBD-5A945E6A0C1D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_knee_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "blueprint_knee_joint_geoAttach_scaleGrp2" -p "blueprint_knee_joint_geoAttach_parentGrp2";
	rename -uid "F08C3E02-41FA-0F82-1E7B-E5ADB6AC6134";
createNode transform -n "L_LowerLeg" -p "blueprint_knee_joint_geoAttach_scaleGrp2";
	rename -uid "E062B46D-426B-AE71-6B66-48A647EECDBB";
	setAttr ".t" -type "double3" 2.2204569019486025 3.4331050606795088e-06 0.016227592316199302 ;
	setAttr ".r" -type "double3" -1.0363305052503153 -0.00016840846771678687 90.000089818023852 ;
	setAttr ".s" -type "double3" 0.94270608178104298 1.6619727280702545 0.94270608178104298 ;
createNode mesh -n "L_LowerLegShape" -p "L_LowerLeg";
	rename -uid "CC40D098-4E91-676A-E8D6-D58AB202A267";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.16007369756698608 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 44 ".uvst[0].uvsp[0:43]" -type "float2" 0.62640893 0.064408526
		 0.54828387 0.0076473951 0.45171607 0.00764741 0.37359107 0.064408556 0.34375 0.15625
		 0.37359107 0.24809146 0.4517161 0.3048526 0.54828393 0.3048526 0.62640893 0.24809146
		 0.65625 0.15625 0.375 0.3125 0.40000001 0.3125 0.42500001 0.3125 0.45000002 0.3125
		 0.47500002 0.3125 0.5 0.3125 0.52499998 0.3125 0.54999995 0.3125 0.57499993 0.3125
		 0.5999999 0.3125 0.62499988 0.3125 0.375 0.68843985 0.40000001 0.68843985 0.42500001
		 0.68843985 0.45000002 0.68843985 0.47500002 0.68843985 0.5 0.68843985 0.52499998
		 0.68843985 0.54999995 0.68843985 0.57499993 0.68843985 0.5999999 0.68843985 0.62499988
		 0.68843985 0.62640893 0.75190854 0.54828387 0.6951474 0.45171607 0.6951474 0.37359107
		 0.75190854 0.34375 0.84375 0.37359107 0.93559146 0.4517161 0.9923526 0.54828393 0.9923526
		 0.62640893 0.93559146 0.65625 0.84375 0.5 0.15000001 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 11 ".pt";
	setAttr ".pt[0]" -type "float3" -0.38253286 -0.25457785 0.27792624 ;
	setAttr ".pt[1]" -type "float3" -0.14611442 -0.25457785 0.44969413 ;
	setAttr ".pt[2]" -type "float3" 0.14611445 -0.25457785 0.44969407 ;
	setAttr ".pt[3]" -type "float3" 0.38253286 -0.25457785 0.27792618 ;
	setAttr ".pt[4]" -type "float3" 0.47283629 -0.25457785 -5.6366474e-08 ;
	setAttr ".pt[5]" -type "float3" 0.38253275 -0.25457785 -0.2779263 ;
	setAttr ".pt[6]" -type "float3" 0.14611441 -0.25457785 -0.44969413 ;
	setAttr ".pt[7]" -type "float3" -0.14611445 -0.25457785 -0.4496941 ;
	setAttr ".pt[8]" -type "float3" -0.38253281 -0.25457785 -0.27792621 ;
	setAttr ".pt[9]" -type "float3" -0.47283629 -0.25457785 -2.8183237e-08 ;
	setAttr ".pt[20]" -type "float3" -2.8183239e-08 -0.25457785 -2.8183237e-08 ;
	setAttr -s 22 ".vt[0:21]"  0.80901706 -1 -0.58778542 0.30901694 -1 -0.95105672
		 -0.30901715 -1 -0.9510566 -0.80901718 -1 -0.58778524 -1.000000119209 -1 5.9604645e-08
		 -0.80901706 -1 0.58778536 -0.30901697 -1 0.9510566 0.30901703 -1 0.95105654 0.809017 -1 0.58778524
		 1 -1 0 0.80901706 1 -0.58778542 0.30901694 1 -0.95105672 -0.30901715 1 -0.9510566
		 -0.80901718 1 -0.58778524 -1.000000119209 1 5.9604645e-08 -0.80901706 1 0.58778536
		 -0.30901697 1 0.9510566 0.30901703 1 0.95105654 0.809017 1 0.58778524 1 1 0 0 -1 0
		 0 1 0;
	setAttr -s 50 ".ed[0:49]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 0 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 10 0 0 10 0 1 11 0 2 12 0 3 13 0 4 14 0 5 15 0 6 16 0 7 17 0 8 18 0 9 19 0
		 20 0 1 20 1 1 20 2 1 20 3 1 20 4 1 20 5 1 20 6 1 20 7 1 20 8 1 20 9 1 10 21 1 11 21 1
		 12 21 1 13 21 1 14 21 1 15 21 1 16 21 1 17 21 1 18 21 1 19 21 1;
	setAttr -s 30 -ch 100 ".fc[0:29]" -type "polyFaces" 
		f 4 0 21 -11 -21
		mu 0 4 10 11 22 21
		f 4 1 22 -12 -22
		mu 0 4 11 12 23 22
		f 4 2 23 -13 -23
		mu 0 4 12 13 24 23
		f 4 3 24 -14 -24
		mu 0 4 13 14 25 24
		f 4 4 25 -15 -25
		mu 0 4 14 15 26 25
		f 4 5 26 -16 -26
		mu 0 4 15 16 27 26
		f 4 6 27 -17 -27
		mu 0 4 16 17 28 27
		f 4 7 28 -18 -28
		mu 0 4 17 18 29 28
		f 4 8 29 -19 -29
		mu 0 4 18 19 30 29
		f 4 9 20 -20 -30
		mu 0 4 19 20 31 30
		f 3 -1 -31 31
		mu 0 3 1 0 42
		f 3 -2 -32 32
		mu 0 3 2 1 42
		f 3 -3 -33 33
		mu 0 3 3 2 42
		f 3 -4 -34 34
		mu 0 3 4 3 42
		f 3 -5 -35 35
		mu 0 3 5 4 42
		f 3 -6 -36 36
		mu 0 3 6 5 42
		f 3 -7 -37 37
		mu 0 3 7 6 42
		f 3 -8 -38 38
		mu 0 3 8 7 42
		f 3 -9 -39 39
		mu 0 3 9 8 42
		f 3 -10 -40 30
		mu 0 3 0 9 42
		f 3 10 41 -41
		mu 0 3 40 39 43
		f 3 11 42 -42
		mu 0 3 39 38 43
		f 3 12 43 -43
		mu 0 3 38 37 43
		f 3 13 44 -44
		mu 0 3 37 36 43
		f 3 14 45 -45
		mu 0 3 36 35 43
		f 3 15 46 -46
		mu 0 3 35 34 43
		f 3 16 47 -47
		mu 0 3 34 33 43
		f 3 17 48 -48
		mu 0 3 33 32 43
		f 3 18 49 -49
		mu 0 3 32 41 43
		f 3 19 40 -50
		mu 0 3 41 40 43;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "blueprint_hip_joint_geoAttach_parentGrp2" -p "group";
	rename -uid "B5E2755F-4ADD-BB13-3B29-ACBABA3A8F2D";
createNode parentConstraint -n "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint" 
		-p "blueprint_hip_joint_geoAttach_parentGrp2";
	rename -uid "005DF165-4BD8-5DD9-4A18-0BB6B1308B51";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_hip_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -0.00019086311864750411 -14.036330504968731 -89.999999999560899 ;
	setAttr ".rst" -type "double3" 4 0.18624485507243982 0 ;
	setAttr ".rsrr" -type "double3" -0.00019086311864750411 -14.036330504968731 -89.999999999560899 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "blueprint_hip_joint_geoAttach_parentGrp2_scaleConstraint" 
		-p "blueprint_hip_joint_geoAttach_parentGrp2";
	rename -uid "0DC91509-4313-6524-75C7-1E8A88DCCAA5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_hip_jointW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "blueprint_hip_joint_geoAttach_scaleGrp2" -p "blueprint_hip_joint_geoAttach_parentGrp2";
	rename -uid "4A4542D3-4057-2C2A-854E-0FA5B56F1AF6";
createNode transform -n "L_UpperLeg" -p "blueprint_hip_joint_geoAttach_scaleGrp2";
	rename -uid "8AAF4D84-4406-E28B-3527-B293A6D3321D";
	setAttr ".t" -type "double3" 0.18068398069071989 -3.9999998495051008 -0.045184611560481702 ;
	setAttr ".r" -type "double3" 14.036330504968729 -0.00019086301214957301 89.999999999574015 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1 ;
	setAttr ".rp" -type "double3" 4.0000000000000009 -1.9127738204846916 0.44159863196763305 ;
	setAttr ".rpt" -type "double3" -2.0372334772662861 5.912773938722319 -0.47709048204727555 ;
	setAttr ".sp" -type "double3" 4 -1.9127738204846916 0.44159863196763305 ;
	setAttr ".spt" -type "double3" 8.8817841970012563e-16 0 0 ;
createNode mesh -n "L_UpperLegShape" -p "L_UpperLeg";
	rename -uid "29D52961-4500-F86A-76DD-ACB93102F481";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.8403962254524231 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 44 ".uvst[0].uvsp[0:43]" -type "float2" 0.62640893 0.064408526
		 0.54828387 0.0076473951 0.45171607 0.00764741 0.37359107 0.064408556 0.34375 0.15625
		 0.37359107 0.24809146 0.4517161 0.3048526 0.54828393 0.3048526 0.62640893 0.24809146
		 0.65625 0.15625 0.375 0.3125 0.40000001 0.3125 0.42500001 0.3125 0.45000002 0.3125
		 0.47500002 0.3125 0.5 0.3125 0.52499998 0.3125 0.54999995 0.3125 0.57499993 0.3125
		 0.5999999 0.3125 0.62499988 0.3125 0.375 0.68843985 0.40000001 0.68843985 0.42500001
		 0.68843985 0.45000002 0.68843985 0.47500002 0.68843985 0.5 0.68843985 0.52499998
		 0.68843985 0.54999995 0.68843985 0.57499993 0.68843985 0.5999999 0.68843985 0.62499988
		 0.68843985 0.62640893 0.75190854 0.54828387 0.6951474 0.45171607 0.6951474 0.37359107
		 0.75190854 0.34375 0.84375 0.37359107 0.93559146 0.4517161 0.9923526 0.54828393 0.9923526
		 0.62640893 0.93559146 0.65625 0.84375 0.5 0.15000001 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 22 ".vt[0:21]"  4.80901718 -4.069829464 0.33634755 4.30901718 -4.15154743 -0.017613143
		 3.69098282 -4.15154743 -0.017613024 3.19098282 -4.069829464 0.33634773 3 -3.93760657 0.90906811
		 3.19098282 -3.80538368 1.48178864 3.69098306 -3.72366524 1.83574915 4.30901718 -3.72366524 1.83574915
		 4.80901718 -3.80538368 1.4817884 5 -3.93760657 0.90906811 5.21132278 -0.085915565 -0.8833921
		 4.46268415 -0.20827031 -1.41336894 3.53731585 -0.20827031 -1.41336882 2.78867698 -0.085915446 -0.88339162
		 2.50272274 0.11205888 -0.025870711 2.78867722 0.31003332 0.8316505 3.53731608 0.43238807 1.36162734
		 4.46268415 0.43238807 1.36162722 5.21132278 0.31003332 0.83165038 5.49727726 0.11205888 -0.0258708
		 4 -3.93760657 0.90906811 4 0.11205888 -0.0258708;
	setAttr -s 50 ".ed[0:49]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 0 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 10 0 0 10 0 1 11 0 2 12 0 3 13 0 4 14 0 5 15 0 6 16 0 7 17 0 8 18 0 9 19 0
		 20 0 1 20 1 1 20 2 1 20 3 1 20 4 1 20 5 1 20 6 1 20 7 1 20 8 1 20 9 1 10 21 1 11 21 1
		 12 21 1 13 21 1 14 21 1 15 21 1 16 21 1 17 21 1 18 21 1 19 21 1;
	setAttr -s 30 -ch 100 ".fc[0:29]" -type "polyFaces" 
		f 4 0 21 -11 -21
		mu 0 4 10 11 22 21
		f 4 1 22 -12 -22
		mu 0 4 11 12 23 22
		f 4 2 23 -13 -23
		mu 0 4 12 13 24 23
		f 4 3 24 -14 -24
		mu 0 4 13 14 25 24
		f 4 4 25 -15 -25
		mu 0 4 14 15 26 25
		f 4 5 26 -16 -26
		mu 0 4 15 16 27 26
		f 4 6 27 -17 -27
		mu 0 4 16 17 28 27
		f 4 7 28 -18 -28
		mu 0 4 17 18 29 28
		f 4 8 29 -19 -29
		mu 0 4 18 19 30 29
		f 4 9 20 -20 -30
		mu 0 4 19 20 31 30
		f 3 -1 -31 31
		mu 0 3 1 0 42
		f 3 -2 -32 32
		mu 0 3 2 1 42
		f 3 -3 -33 33
		mu 0 3 3 2 42
		f 3 -4 -34 34
		mu 0 3 4 3 42
		f 3 -5 -35 35
		mu 0 3 5 4 42
		f 3 -6 -36 36
		mu 0 3 6 5 42
		f 3 -7 -37 37
		mu 0 3 7 6 42
		f 3 -8 -38 38
		mu 0 3 8 7 42
		f 3 -9 -39 39
		mu 0 3 9 8 42
		f 3 -10 -40 30
		mu 0 3 0 9 42
		f 3 10 41 -41
		mu 0 3 40 39 43
		f 3 11 42 -42
		mu 0 3 39 38 43
		f 3 12 43 -43
		mu 0 3 38 37 43
		f 3 13 44 -44
		mu 0 3 37 36 43
		f 3 14 45 -45
		mu 0 3 36 35 43
		f 3 15 46 -46
		mu 0 3 35 34 43
		f 3 16 47 -47
		mu 0 3 34 33 43
		f 3 17 48 -48
		mu 0 3 33 32 43
		f 3 18 49 -49
		mu 0 3 32 41 43
		f 3 19 40 -50
		mu 0 3 41 40 43;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode container -n "character_container";
	rename -uid "CCBDCB9F-4B27-E472-B994-CEB4D0F27696";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 8 ".boc";
	setAttr -s 7 ".ish[1:7]" yes yes yes yes yes yes yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/12/08 16:43:59";
	setAttr ".aal" -type "attributeAlias" {"animControlVis","borderConnections[0]","instance_1_activeModule"
		,"borderConnections[1]","instance_1_creationPoseWeight","borderConnections[2]","instance_1_mirror_activeModule"
		,"borderConnections[3]","instance_1_mirror_creationPoseWeight","borderConnections[4]"
		,"instance_2_activeModule","borderConnections[5]","instance_2_creationPoseWeight"
		,"borderConnections[6]","displayNonBlueprintNodes","borderConnections[7]"} ;
createNode hyperLayout -n "hyperLayout42";
	rename -uid "FE4E3E43-4869-4B77-6556-F9A0CE112E95";
	setAttr ".ihi" 0;
	setAttr -s 7 ".hyp";
createNode reverse -n "reverse_moduleMaintenanceVisibility";
	rename -uid "F7746E40-4048-C646-696E-268A9A50A7D8";
createNode container -n "non_blueprint_container";
	rename -uid "1BB475C0-48E0-45C2-58B8-C69571847F28";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/12/08 16:43:59";
	setAttr ".aal" -type "attributeAlias" {"displayNonBlueprintNodes","borderConnections[0]"
		} ;
createNode container -n "LegFoot__instance_1_mirror:module_container";
	rename -uid "B150F978-4E9D-22D5-FC66-119225F38703";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 2 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/12/08 16:42:00";
	setAttr ".aal" -type "attributeAlias" {"activeModule","borderConnections[0]","creationPoseWeight"
		,"borderConnections[1]"} ;
createNode container -n "RootTransform__instance_2:module_container";
	rename -uid "B084F281-4D10-8D8D-0285-4A8DB1DE3432";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 2 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/12/08 16:42:00";
	setAttr ".aal" -type "attributeAlias" {"activeModule","borderConnections[0]","creationPoseWeight"
		,"borderConnections[1]"} ;
createNode container -n "LegFoot__instance_1:module_container";
	rename -uid "A4740746-47B2-28D3-8687-229DEC8F3333";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 2 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/12/08 16:42:00";
	setAttr ".aal" -type "attributeAlias" {"activeModule","borderConnections[0]","creationPoseWeight"
		,"borderConnections[1]"} ;
createNode multiplyDivide -n "moduleVisibilityMultiply";
	rename -uid "7EEC718F-4A18-E893-B9FD-64B4F23B2A9A";
createNode hyperLayout -n "hyperLayout43";
	rename -uid "F6726243-4F4B-ACBB-2962-8CB24845C8E9";
	setAttr ".ihi" 0;
	setAttr -s 69 ".hyp";
createNode multiplyDivide -n "blueprint_ankle_joint_geoAttach_scaleGrp1_scaleFactor";
	rename -uid "33DFED56-4912-5295-52A4-F283D8B690E3";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 3.162281 1 1 ;
createNode multiplyDivide -n "blueprint_ball_joint_geoAttach_scaleGrp1_scaleFactor";
	rename -uid "EA0DB292-41B9-F317-A90B-2C8A0B0C9BCC";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 2.9999998 1 1 ;
createNode multiplyDivide -n "blueprint_hip_joint_geoAttach_scaleGrp1_scaleFactor";
	rename -uid "CE72A345-4E1F-83F3-9C18-8389A4DF44C1";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" -4.1231055 1 1 ;
createNode multiplyDivide -n "blueprint_hip_joint_geoAttach_scaleGrp2_scaleFactor";
	rename -uid "F4A37D03-46DD-9069-DF97-20BE3CAAC52F";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 4.1231055 1 1 ;
createNode multiplyDivide -n "blueprint_knee_joint_geoAttach_scaleGrp2_scaleFactor";
	rename -uid "1DCA8BD1-4A57-B7C1-B0F5-B7A381F34C96";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 4.1231055 1 1 ;
createNode multiplyDivide -n "non_blueprint_visibilityMultiply";
	rename -uid "1B06BE6E-47D8-B0F8-AA66-C4A2D8C5701D";
createNode multiplyDivide -n "blueprint_knee_joint_geoAttach_scaleGrp1_scaleFactor";
	rename -uid "AE66435D-4F55-E462-8797-F89F48693D9D";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" -4.1231055 1 1 ;
createNode multiplyDivide -n "blueprint_ball_joint_geoAttach_scaleGrp2_scaleFactor";
	rename -uid "2CE284D3-4A3D-4C3E-4D52-428B4AD204DE";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 3 1 1 ;
createNode multiplyDivide -n "blueprint_ankle_joint_geoAttach_scaleGrp2_scaleFactor";
	rename -uid "494B3712-48AF-C532-DF9A-3A9EC1BEA86C";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 3.1622787 1 1 ;
createNode unitConversion -n "unitConversion6";
	rename -uid "F10C7070-4B44-FF2D-EB93-5B93236B2DE2";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "LegFoot__instance_1_mirror:blueprint_hip_joint_addRotations";
	rename -uid "B258BC6E-421A-77F6-3C49-38B5FADAED8E";
createNode multiplyDivide -n "LegFoot__instance_1_mirror:blueprint_hip_joint_dummyRotationsMultiply";
	rename -uid "F09F3E25-4689-DB90-E483-7EB5116D3972";
createNode unitConversion -n "unitConversion11";
	rename -uid "16D08509-44DD-F1AB-B2C3-9BB8F675DD34";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "RootTransform__instance_2:blueprint_joint_addRotations";
	rename -uid "98891DAE-4E74-3875-162F-A2849AA959F5";
createNode multiplyDivide -n "RootTransform__instance_2:blueprint_joint_dummyRotationsMultiply";
	rename -uid "43531537-45C4-88C9-5BD5-5CBAC4C64314";
createNode plusMinusAverage -n "RootTransform__instance_2:blueprint_joint_addTranslate";
	rename -uid "D6C10D51-45C8-9CBE-9809-D88A5BA5D882";
createNode multiplyDivide -n "RootTransform__instance_2:blueprint_joint_original_Translate";
	rename -uid "6D37F2B1-4342-9D73-5512-98BAD3383E01";
createNode plusMinusAverage -n "RootTransform__instance_2:blueprint_joint_addScale";
	rename -uid "16606E83-446B-875D-C291-8C8EA1618624";
createNode multiplyDivide -n "RootTransform__instance_2:blueprint_joint_original_Scale";
	rename -uid "0CFF3084-4419-517A-5097-E896455A71BE";
	setAttr ".i1" -type "float3" 1 1 1 ;
createNode unitConversion -n "unitConversion7";
	rename -uid "64829768-40E8-3F91-BCFA-C7BFC31B48C2";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "LegFoot__instance_1_mirror:blueprint_knee_joint_addRotations";
	rename -uid "575AF230-409F-1BE0-EA14-F6847D0C9318";
createNode multiplyDivide -n "LegFoot__instance_1_mirror:blueprint_knee_joint_dummyRotationsMultiply";
	rename -uid "425BD632-49AA-E78F-7E7A-2DABD5C4DA30";
createNode plusMinusAverage -n "LegFoot__instance_1_mirror:blueprint_knee_joint_addTx";
	rename -uid "EE24C5EB-4416-6DD4-4352-BB9192F09CF1";
createNode multiplyDivide -n "LegFoot__instance_1_mirror:blueprint_knee_joint_original_Tx";
	rename -uid "4288612B-4473-7527-1EC0-DF89CE3EC52F";
	setAttr ".i1" -type "float3" -4.1231055 0 0 ;
	setAttr -l on ".i1x";
createNode unitConversion -n "unitConversion8";
	rename -uid "83A87BD9-4151-EA24-7A03-45B3C1F07907";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "LegFoot__instance_1_mirror:blueprint_ankle_joint_addRotations";
	rename -uid "2FCA1FA2-4A84-2E91-C6F5-07AFF5C1FCA7";
createNode multiplyDivide -n "LegFoot__instance_1_mirror:blueprint_ankle_joint_dummyRotationsMultiply";
	rename -uid "36539FB0-4A9F-DEDF-A6AE-02AB47FFFD50";
createNode plusMinusAverage -n "LegFoot__instance_1_mirror:blueprint_ankle_joint_addTx";
	rename -uid "6221110E-457E-1887-524E-91BB361418D2";
createNode multiplyDivide -n "LegFoot__instance_1_mirror:blueprint_ankle_joint_original_Tx";
	rename -uid "F65EA736-4993-0F1A-AD7A-BDA7266850DF";
	setAttr ".i1" -type "float3" -4.1231055 0 0 ;
	setAttr -l on ".i1x";
createNode unitConversion -n "unitConversion9";
	rename -uid "F54BF6A9-4AD8-B213-8D72-12ACAABEEE0F";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "LegFoot__instance_1_mirror:blueprint_ball_joint_addRotations";
	rename -uid "6E30506D-46F8-9DCA-0EC4-669374E930A1";
createNode multiplyDivide -n "LegFoot__instance_1_mirror:blueprint_ball_joint_dummyRotationsMultiply";
	rename -uid "11991C99-4C72-FF82-FBF6-08859BCE5FA1";
createNode plusMinusAverage -n "LegFoot__instance_1_mirror:blueprint_ball_joint_addTx";
	rename -uid "5D4C55F3-4429-849E-528E-E7A527C568B6";
createNode multiplyDivide -n "LegFoot__instance_1_mirror:blueprint_ball_joint_original_Tx";
	rename -uid "E81C1A72-4A1F-CDEA-7985-709C04E7F759";
	setAttr ".i1" -type "float3" 3.162281 0 0 ;
	setAttr -l on ".i1x";
createNode unitConversion -n "unitConversion10";
	rename -uid "6DBEFFA0-41B5-9103-58C3-DCA157D708B5";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "LegFoot__instance_1_mirror:blueprint_toe_joint_addRotations";
	rename -uid "D0CF911E-4B49-328C-7E28-F794D7708C20";
createNode multiplyDivide -n "LegFoot__instance_1_mirror:blueprint_toe_joint_dummyRotationsMultiply";
	rename -uid "D0999DE8-4312-4A8D-DE3F-FBAAB2AF5F20";
createNode plusMinusAverage -n "LegFoot__instance_1_mirror:blueprint_toe_joint_addTx";
	rename -uid "AD4865E4-498A-A6EB-05DF-1C8DA12269B8";
createNode multiplyDivide -n "LegFoot__instance_1_mirror:blueprint_toe_joint_original_Tx";
	rename -uid "309B37AF-46AE-E50A-16F3-C68D9C85655C";
	setAttr ".i1" -type "float3" 2.9999998 0 0 ;
	setAttr -l on ".i1x";
createNode unitConversion -n "unitConversion1";
	rename -uid "CEB915D6-4345-A4D4-EA12-00B05ED7DE60";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "LegFoot__instance_1:blueprint_hip_joint_addRotations";
	rename -uid "24488584-4A98-720A-B02B-9981F5A7F765";
createNode multiplyDivide -n "LegFoot__instance_1:blueprint_hip_joint_dummyRotationsMultiply";
	rename -uid "86188E8D-4CC5-0301-025C-0BB4764DE689";
createNode unitConversion -n "unitConversion3";
	rename -uid "BA242365-46BD-5E55-2DCE-0EBB7288F570";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "LegFoot__instance_1:blueprint_ankle_joint_addRotations";
	rename -uid "94D5A34E-441D-DDF6-C75B-23B6FE8AAF81";
createNode multiplyDivide -n "LegFoot__instance_1:blueprint_ankle_joint_dummyRotationsMultiply";
	rename -uid "554C2870-4A65-5D92-C814-53B87A273194";
createNode plusMinusAverage -n "LegFoot__instance_1:blueprint_ankle_joint_addTx";
	rename -uid "D6167B5B-4E05-FDAF-BA58-7D98B0657C8E";
createNode multiplyDivide -n "LegFoot__instance_1:blueprint_ankle_joint_original_Tx";
	rename -uid "2B4F4160-4AFF-FF75-F20E-25BBFB9CC0A5";
	setAttr ".i1" -type "float3" 4.1231055 0 0 ;
	setAttr -l on ".i1x";
createNode unitConversion -n "unitConversion4";
	rename -uid "54316601-4624-4C30-DA3D-C88C8453BC93";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "LegFoot__instance_1:blueprint_ball_joint_addRotations";
	rename -uid "772001A7-4680-DB6E-8311-B49D144B1592";
createNode multiplyDivide -n "LegFoot__instance_1:blueprint_ball_joint_dummyRotationsMultiply";
	rename -uid "0D652AB2-4C3E-6614-7B12-E99B889A7441";
createNode plusMinusAverage -n "LegFoot__instance_1:blueprint_ball_joint_addTx";
	rename -uid "0A381B2E-4772-A887-3612-CE8F311D44BD";
createNode multiplyDivide -n "LegFoot__instance_1:blueprint_ball_joint_original_Tx";
	rename -uid "18FB374C-4932-14FF-865A-269CC21B3C03";
	setAttr ".i1" -type "float3" 3.1622787 0 0 ;
	setAttr -l on ".i1x";
createNode unitConversion -n "unitConversion5";
	rename -uid "31747415-4AC0-54A5-669E-9BBB9D433982";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "LegFoot__instance_1:blueprint_toe_joint_addRotations";
	rename -uid "06D9C4FA-4DD8-352C-5280-83A69594CF55";
createNode multiplyDivide -n "LegFoot__instance_1:blueprint_toe_joint_dummyRotationsMultiply";
	rename -uid "1671ED25-4D92-6204-43DC-7E8C5174E71C";
createNode plusMinusAverage -n "LegFoot__instance_1:blueprint_toe_joint_addTx";
	rename -uid "51D88EB3-4D55-3870-08B6-6C9556C0E37A";
createNode multiplyDivide -n "LegFoot__instance_1:blueprint_toe_joint_original_Tx";
	rename -uid "E1F8F667-4784-7403-CD5A-A3A42A077B73";
	setAttr ".i1" -type "float3" 3 0 0 ;
	setAttr -l on ".i1x";
createNode unitConversion -n "unitConversion2";
	rename -uid "8AEC2888-4987-9BD3-9B35-489FDD977E2B";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "LegFoot__instance_1:blueprint_knee_joint_addRotations";
	rename -uid "5D69790D-494F-9C08-0A2A-5A829E5FBBFA";
createNode multiplyDivide -n "LegFoot__instance_1:blueprint_knee_joint_dummyRotationsMultiply";
	rename -uid "652EE22D-4350-8204-C01D-A48382C222C0";
createNode plusMinusAverage -n "LegFoot__instance_1:blueprint_knee_joint_addTx";
	rename -uid "ADC76F8D-4468-01CC-99FB-3DAD8E4CBABF";
createNode multiplyDivide -n "LegFoot__instance_1:blueprint_knee_joint_original_Tx";
	rename -uid "5F86A897-4F8B-938B-D720-EC8973DCDB02";
	setAttr ".i1" -type "float3" 4.1231055 0 0 ;
	setAttr -l on ".i1x";
createNode hyperLayout -n "hyperLayout39";
	rename -uid "69CF50BE-444C-04C7-C8AB-9DAA2DA8E1F6";
	setAttr ".ihi" 0;
	setAttr -s 7 ".hyp";
createNode container -n "LegFoot__instance_1_mirror:blueprint_container";
	rename -uid "D025DD68-4E0D-60B3-08D0-E29DC16FAAF5";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/12/08 16:42:00";
createNode hyperLayout -n "hyperLayout38";
	rename -uid "870FBA0B-42A1-8ADB-646A-8888ABCF2B2F";
	setAttr ".ihi" 0;
	setAttr -s 35 ".hyp";
createNode hyperLayout -n "hyperLayout41";
	rename -uid "0A442C34-4EBA-3BAF-7D7D-E4B9C1EE2463";
	setAttr ".ihi" 0;
	setAttr -s 5 ".hyp";
createNode container -n "RootTransform__instance_2:blueprint_container";
	rename -uid "EAF92087-47CE-F69E-6C1A-1BA4F51B2078";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/12/08 16:42:00";
createNode hyperLayout -n "hyperLayout40";
	rename -uid "79B2D360-4CD6-E2C1-9E34-349B2214291B";
	setAttr ".ihi" 0;
	setAttr -s 11 ".hyp";
createNode hyperLayout -n "hyperLayout37";
	rename -uid "859F649A-4973-6A08-152C-F887F1E44187";
	setAttr ".ihi" 0;
	setAttr -s 7 ".hyp";
createNode container -n "LegFoot__instance_1:blueprint_container";
	rename -uid "A94686D0-4AD9-7E4F-C994-2AAF396397B3";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/12/08 16:42:00";
createNode hyperLayout -n "hyperLayout36";
	rename -uid "6F66DF45-4462-280A-7665-A99833EC66E4";
	setAttr ".ihi" 0;
	setAttr -s 35 ".hyp";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 53 ".u";
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
	setAttr -s 10 ".dsm";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".ren" -type "string" "arnold";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".vn" -type "string" "ACES 1.0 SDR-video";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".potn" -type "string" "ACES 1.0 SDR-video (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "LegFoot__instance_1:HOOK_IN.sy" "LegFoot__instance_1:module_grp.hierarchicalScale"
		;
connectAttr "LegFoot__instance_1:hook_scale_constraint.csy" "LegFoot__instance_1:HOOK_IN.sy"
		;
connectAttr "LegFoot__instance_1:hook_scale_constraint.csx" "LegFoot__instance_1:HOOK_IN.sx"
		;
connectAttr "LegFoot__instance_1:hook_scale_constraint.csz" "LegFoot__instance_1:HOOK_IN.sz"
		;
connectAttr "LegFoot__instance_1:hook_parent_constraint.ctx" "LegFoot__instance_1:HOOK_IN.tx"
		;
connectAttr "LegFoot__instance_1:hook_parent_constraint.cty" "LegFoot__instance_1:HOOK_IN.ty"
		;
connectAttr "LegFoot__instance_1:hook_parent_constraint.ctz" "LegFoot__instance_1:HOOK_IN.tz"
		;
connectAttr "LegFoot__instance_1:hook_parent_constraint.crx" "LegFoot__instance_1:HOOK_IN.rx"
		;
connectAttr "LegFoot__instance_1:hook_parent_constraint.cry" "LegFoot__instance_1:HOOK_IN.ry"
		;
connectAttr "LegFoot__instance_1:hook_parent_constraint.crz" "LegFoot__instance_1:HOOK_IN.rz"
		;
connectAttr "character_grp.moduleMaintenanceVisibility" "LegFoot__instance_1:blueprint_joints_grp.v"
		;
connectAttr "unitConversion1.o" "LegFoot__instance_1:blueprint_hip_joint.r";
connectAttr "LegFoot__instance_1:blueprint_hip_joint.s" "LegFoot__instance_1:blueprint_knee_joint.is"
		;
connectAttr "unitConversion2.o" "LegFoot__instance_1:blueprint_knee_joint.r";
connectAttr "LegFoot__instance_1:blueprint_knee_joint_addTx.o1" "LegFoot__instance_1:blueprint_knee_joint.tx"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.s" "LegFoot__instance_1:blueprint_ankle_joint.is"
		;
connectAttr "unitConversion3.o" "LegFoot__instance_1:blueprint_ankle_joint.r";
connectAttr "LegFoot__instance_1:blueprint_ankle_joint_addTx.o1" "LegFoot__instance_1:blueprint_ankle_joint.tx"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.s" "LegFoot__instance_1:blueprint_ball_joint.is"
		;
connectAttr "unitConversion4.o" "LegFoot__instance_1:blueprint_ball_joint.r";
connectAttr "LegFoot__instance_1:blueprint_ball_joint_addTx.o1" "LegFoot__instance_1:blueprint_ball_joint.tx"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.s" "LegFoot__instance_1:blueprint_toe_joint.is"
		;
connectAttr "unitConversion5.o" "LegFoot__instance_1:blueprint_toe_joint.r";
connectAttr "LegFoot__instance_1:blueprint_toe_joint_addTx.o1" "LegFoot__instance_1:blueprint_toe_joint.tx"
		;
connectAttr "LegFoot__instance_1:creationPose_hip_joint.s" "LegFoot__instance_1:creationPose_knee_joint.is"
		;
connectAttr "LegFoot__instance_1:creationPose_knee_joint.s" "LegFoot__instance_1:creationPose_ankle_joint.is"
		;
connectAttr "LegFoot__instance_1:creationPose_ankle_joint.s" "LegFoot__instance_1:creationPose_ball_joint.is"
		;
connectAttr "LegFoot__instance_1:creationPose_ball_joint.s" "LegFoot__instance_1:creationPose_toe_joint.is"
		;
connectAttr "LegFoot__instance_1:HOOK_IN.ro" "LegFoot__instance_1:hook_parent_constraint.cro"
		;
connectAttr "LegFoot__instance_1:HOOK_IN.pim" "LegFoot__instance_1:hook_parent_constraint.cpim"
		;
connectAttr "LegFoot__instance_1:HOOK_IN.rp" "LegFoot__instance_1:hook_parent_constraint.crp"
		;
connectAttr "LegFoot__instance_1:HOOK_IN.rpt" "LegFoot__instance_1:hook_parent_constraint.crt"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.t" "LegFoot__instance_1:hook_parent_constraint.tg[0].tt"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.rp" "LegFoot__instance_1:hook_parent_constraint.tg[0].trp"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.rpt" "LegFoot__instance_1:hook_parent_constraint.tg[0].trt"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.r" "LegFoot__instance_1:hook_parent_constraint.tg[0].tr"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.ro" "LegFoot__instance_1:hook_parent_constraint.tg[0].tro"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.s" "LegFoot__instance_1:hook_parent_constraint.tg[0].ts"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.pm" "LegFoot__instance_1:hook_parent_constraint.tg[0].tpm"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.jo" "LegFoot__instance_1:hook_parent_constraint.tg[0].tjo"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.ssc" "LegFoot__instance_1:hook_parent_constraint.tg[0].tsc"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.is" "LegFoot__instance_1:hook_parent_constraint.tg[0].tis"
		;
connectAttr "LegFoot__instance_1:hook_parent_constraint.w0" "LegFoot__instance_1:hook_parent_constraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:HOOK_IN.pim" "LegFoot__instance_1:hook_scale_constraint.cpim"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.s" "LegFoot__instance_1:hook_scale_constraint.tg[0].ts"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.pm" "LegFoot__instance_1:hook_scale_constraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:hook_scale_constraint.w0" "LegFoot__instance_1:hook_scale_constraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:HOOK_IN.sy" "LegFoot__instance_1_mirror:module_grp.hierarchicalScale"
		;
connectAttr "LegFoot__instance_1_mirror:hook_scale_constraint.csy" "LegFoot__instance_1_mirror:HOOK_IN.sy"
		;
connectAttr "LegFoot__instance_1_mirror:hook_scale_constraint.csx" "LegFoot__instance_1_mirror:HOOK_IN.sx"
		;
connectAttr "LegFoot__instance_1_mirror:hook_scale_constraint.csz" "LegFoot__instance_1_mirror:HOOK_IN.sz"
		;
connectAttr "LegFoot__instance_1_mirror:hook_parent_constraint.ctx" "LegFoot__instance_1_mirror:HOOK_IN.tx"
		;
connectAttr "LegFoot__instance_1_mirror:hook_parent_constraint.cty" "LegFoot__instance_1_mirror:HOOK_IN.ty"
		;
connectAttr "LegFoot__instance_1_mirror:hook_parent_constraint.ctz" "LegFoot__instance_1_mirror:HOOK_IN.tz"
		;
connectAttr "LegFoot__instance_1_mirror:hook_parent_constraint.crx" "LegFoot__instance_1_mirror:HOOK_IN.rx"
		;
connectAttr "LegFoot__instance_1_mirror:hook_parent_constraint.cry" "LegFoot__instance_1_mirror:HOOK_IN.ry"
		;
connectAttr "LegFoot__instance_1_mirror:hook_parent_constraint.crz" "LegFoot__instance_1_mirror:HOOK_IN.rz"
		;
connectAttr "character_grp.moduleMaintenanceVisibility" "LegFoot__instance_1_mirror:blueprint_joints_grp.v"
		;
connectAttr "unitConversion6.o" "LegFoot__instance_1_mirror:blueprint_hip_joint.r"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.s" "LegFoot__instance_1_mirror:blueprint_knee_joint.is"
		;
connectAttr "unitConversion7.o" "LegFoot__instance_1_mirror:blueprint_knee_joint.r"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint_addTx.o1" "LegFoot__instance_1_mirror:blueprint_knee_joint.tx"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.s" "LegFoot__instance_1_mirror:blueprint_ankle_joint.is"
		;
connectAttr "unitConversion8.o" "LegFoot__instance_1_mirror:blueprint_ankle_joint.r"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint_addTx.o1" "LegFoot__instance_1_mirror:blueprint_ankle_joint.tx"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.s" "LegFoot__instance_1_mirror:blueprint_ball_joint.is"
		;
connectAttr "unitConversion9.o" "LegFoot__instance_1_mirror:blueprint_ball_joint.r"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint_addTx.o1" "LegFoot__instance_1_mirror:blueprint_ball_joint.tx"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.s" "LegFoot__instance_1_mirror:blueprint_toe_joint.is"
		;
connectAttr "unitConversion10.o" "LegFoot__instance_1_mirror:blueprint_toe_joint.r"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint_addTx.o1" "LegFoot__instance_1_mirror:blueprint_toe_joint.tx"
		;
connectAttr "LegFoot__instance_1_mirror:creationPose_hip_joint.s" "LegFoot__instance_1_mirror:creationPose_knee_joint.is"
		;
connectAttr "LegFoot__instance_1_mirror:creationPose_knee_joint.s" "LegFoot__instance_1_mirror:creationPose_ankle_joint.is"
		;
connectAttr "LegFoot__instance_1_mirror:creationPose_ankle_joint.s" "LegFoot__instance_1_mirror:creationPose_ball_joint.is"
		;
connectAttr "LegFoot__instance_1_mirror:creationPose_ball_joint.s" "LegFoot__instance_1_mirror:creationPose_toe_joint.is"
		;
connectAttr "LegFoot__instance_1_mirror:HOOK_IN.ro" "LegFoot__instance_1_mirror:hook_parent_constraint.cro"
		;
connectAttr "LegFoot__instance_1_mirror:HOOK_IN.pim" "LegFoot__instance_1_mirror:hook_parent_constraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:HOOK_IN.rp" "LegFoot__instance_1_mirror:hook_parent_constraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:HOOK_IN.rpt" "LegFoot__instance_1_mirror:hook_parent_constraint.crt"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.t" "LegFoot__instance_1_mirror:hook_parent_constraint.tg[0].tt"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.rp" "LegFoot__instance_1_mirror:hook_parent_constraint.tg[0].trp"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.rpt" "LegFoot__instance_1_mirror:hook_parent_constraint.tg[0].trt"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.r" "LegFoot__instance_1_mirror:hook_parent_constraint.tg[0].tr"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.ro" "LegFoot__instance_1_mirror:hook_parent_constraint.tg[0].tro"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.s" "LegFoot__instance_1_mirror:hook_parent_constraint.tg[0].ts"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.pm" "LegFoot__instance_1_mirror:hook_parent_constraint.tg[0].tpm"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.jo" "LegFoot__instance_1_mirror:hook_parent_constraint.tg[0].tjo"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.ssc" "LegFoot__instance_1_mirror:hook_parent_constraint.tg[0].tsc"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.is" "LegFoot__instance_1_mirror:hook_parent_constraint.tg[0].tis"
		;
connectAttr "LegFoot__instance_1_mirror:hook_parent_constraint.w0" "LegFoot__instance_1_mirror:hook_parent_constraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:HOOK_IN.pim" "LegFoot__instance_1_mirror:hook_scale_constraint.cpim"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.s" "LegFoot__instance_1_mirror:hook_scale_constraint.tg[0].ts"
		;
connectAttr "RootTransform__instance_2:blueprint_joint.pm" "LegFoot__instance_1_mirror:hook_scale_constraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:hook_scale_constraint.w0" "LegFoot__instance_1_mirror:hook_scale_constraint.tg[0].tw"
		;
connectAttr "RootTransform__instance_2:HOOK_IN.sy" "RootTransform__instance_2:module_grp.hierarchicalScale"
		;
connectAttr "character_grp.moduleMaintenanceVisibility" "RootTransform__instance_2:blueprint_joints_grp.v"
		;
connectAttr "unitConversion11.o" "RootTransform__instance_2:blueprint_joint.r";
connectAttr "RootTransform__instance_2:blueprint_joint_addTranslate.o3" "RootTransform__instance_2:blueprint_joint.t"
		;
connectAttr "RootTransform__instance_2:blueprint_joint_addScale.o3" "RootTransform__instance_2:blueprint_joint.s"
		;
connectAttr "non_blueprint_visibilityMultiply.ox" "non_blueprint_grp.v";
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.ctx" "blueprint_toe_joint_geoAttach_parentGrp1.tx"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.cty" "blueprint_toe_joint_geoAttach_parentGrp1.ty"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.ctz" "blueprint_toe_joint_geoAttach_parentGrp1.tz"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.crx" "blueprint_toe_joint_geoAttach_parentGrp1.rx"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.cry" "blueprint_toe_joint_geoAttach_parentGrp1.ry"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.crz" "blueprint_toe_joint_geoAttach_parentGrp1.rz"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1_scaleConstraint.csx" "blueprint_toe_joint_geoAttach_parentGrp1.sx"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1_scaleConstraint.csy" "blueprint_toe_joint_geoAttach_parentGrp1.sy"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1_scaleConstraint.csz" "blueprint_toe_joint_geoAttach_parentGrp1.sz"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1.ro" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.cro"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1.pim" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.cpim"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1.rp" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.crp"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1.rpt" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.t" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.rp" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.rpt" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.r" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.ro" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.s" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.pm" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.jo" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.ssc" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.is" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tis"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.w0" "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tw"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1.pim" "blueprint_toe_joint_geoAttach_parentGrp1_scaleConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.s" "blueprint_toe_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.pm" "blueprint_toe_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tpm"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1_scaleConstraint.w0" "blueprint_toe_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tw"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.ctx" "blueprint_ball_joint_geoAttach_parentGrp1.tx"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.cty" "blueprint_ball_joint_geoAttach_parentGrp1.ty"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.ctz" "blueprint_ball_joint_geoAttach_parentGrp1.tz"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.crx" "blueprint_ball_joint_geoAttach_parentGrp1.rx"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.cry" "blueprint_ball_joint_geoAttach_parentGrp1.ry"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.crz" "blueprint_ball_joint_geoAttach_parentGrp1.rz"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1_scaleConstraint.csx" "blueprint_ball_joint_geoAttach_parentGrp1.sx"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1_scaleConstraint.csy" "blueprint_ball_joint_geoAttach_parentGrp1.sy"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1_scaleConstraint.csz" "blueprint_ball_joint_geoAttach_parentGrp1.sz"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1.ro" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.cro"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1.pim" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.cpim"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1.rp" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.crp"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1.rpt" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.t" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.rp" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.rpt" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.r" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.ro" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.s" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.pm" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.jo" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.ssc" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.is" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tis"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.w0" "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tw"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1.pim" "blueprint_ball_joint_geoAttach_parentGrp1_scaleConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.s" "blueprint_ball_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.pm" "blueprint_ball_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tpm"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1_scaleConstraint.w0" "blueprint_ball_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tw"
		;
connectAttr "blueprint_ball_joint_geoAttach_scaleGrp1_scaleFactor.ox" "blueprint_ball_joint_geoAttach_scaleGrp1.sx"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.ctx" "blueprint_ankle_joint_geoAttach_parentGrp1.tx"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.cty" "blueprint_ankle_joint_geoAttach_parentGrp1.ty"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.ctz" "blueprint_ankle_joint_geoAttach_parentGrp1.tz"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.crx" "blueprint_ankle_joint_geoAttach_parentGrp1.rx"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.cry" "blueprint_ankle_joint_geoAttach_parentGrp1.ry"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.crz" "blueprint_ankle_joint_geoAttach_parentGrp1.rz"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1_scaleConstraint.csx" "blueprint_ankle_joint_geoAttach_parentGrp1.sx"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1_scaleConstraint.csy" "blueprint_ankle_joint_geoAttach_parentGrp1.sy"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1_scaleConstraint.csz" "blueprint_ankle_joint_geoAttach_parentGrp1.sz"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1.ro" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.cro"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1.pim" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.cpim"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1.rp" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.crp"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1.rpt" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.t" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.rp" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.rpt" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.r" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.ro" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.s" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.pm" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.jo" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.ssc" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.is" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tis"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.w0" "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tw"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1.pim" "blueprint_ankle_joint_geoAttach_parentGrp1_scaleConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.s" "blueprint_ankle_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.pm" "blueprint_ankle_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tpm"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1_scaleConstraint.w0" "blueprint_ankle_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tw"
		;
connectAttr "blueprint_ankle_joint_geoAttach_scaleGrp1_scaleFactor.ox" "blueprint_ankle_joint_geoAttach_scaleGrp1.sx"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.ctx" "blueprint_knee_joint_geoAttach_parentGrp1.tx"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.cty" "blueprint_knee_joint_geoAttach_parentGrp1.ty"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.ctz" "blueprint_knee_joint_geoAttach_parentGrp1.tz"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.crx" "blueprint_knee_joint_geoAttach_parentGrp1.rx"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.cry" "blueprint_knee_joint_geoAttach_parentGrp1.ry"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.crz" "blueprint_knee_joint_geoAttach_parentGrp1.rz"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1_scaleConstraint.csx" "blueprint_knee_joint_geoAttach_parentGrp1.sx"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1_scaleConstraint.csy" "blueprint_knee_joint_geoAttach_parentGrp1.sy"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1_scaleConstraint.csz" "blueprint_knee_joint_geoAttach_parentGrp1.sz"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1.ro" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.cro"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1.pim" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.cpim"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1.rp" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.crp"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1.rpt" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.t" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.rp" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.rpt" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.r" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.ro" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.s" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.pm" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.jo" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.ssc" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.is" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tis"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.w0" "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tw"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1.pim" "blueprint_knee_joint_geoAttach_parentGrp1_scaleConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.s" "blueprint_knee_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.pm" "blueprint_knee_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tpm"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1_scaleConstraint.w0" "blueprint_knee_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tw"
		;
connectAttr "blueprint_knee_joint_geoAttach_scaleGrp1_scaleFactor.ox" "blueprint_knee_joint_geoAttach_scaleGrp1.sx"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.ctx" "blueprint_hip_joint_geoAttach_parentGrp1.tx"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.cty" "blueprint_hip_joint_geoAttach_parentGrp1.ty"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.ctz" "blueprint_hip_joint_geoAttach_parentGrp1.tz"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.crx" "blueprint_hip_joint_geoAttach_parentGrp1.rx"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.cry" "blueprint_hip_joint_geoAttach_parentGrp1.ry"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.crz" "blueprint_hip_joint_geoAttach_parentGrp1.rz"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1_scaleConstraint.csx" "blueprint_hip_joint_geoAttach_parentGrp1.sx"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1_scaleConstraint.csy" "blueprint_hip_joint_geoAttach_parentGrp1.sy"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1_scaleConstraint.csz" "blueprint_hip_joint_geoAttach_parentGrp1.sz"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1.ro" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.cro"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1.pim" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.cpim"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1.rp" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.crp"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1.rpt" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.t" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.rp" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.rpt" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.r" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.ro" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.s" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.pm" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.jo" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.ssc" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.is" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tis"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.w0" "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tw"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1.pim" "blueprint_hip_joint_geoAttach_parentGrp1_scaleConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.s" "blueprint_hip_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.pm" "blueprint_hip_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tpm"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1_scaleConstraint.w0" "blueprint_hip_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tw"
		;
connectAttr "blueprint_hip_joint_geoAttach_scaleGrp1_scaleFactor.ox" "blueprint_hip_joint_geoAttach_scaleGrp1.sx"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.ctx" "blueprint_toe_joint_geoAttach_parentGrp2.tx"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.cty" "blueprint_toe_joint_geoAttach_parentGrp2.ty"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.ctz" "blueprint_toe_joint_geoAttach_parentGrp2.tz"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.crx" "blueprint_toe_joint_geoAttach_parentGrp2.rx"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.cry" "blueprint_toe_joint_geoAttach_parentGrp2.ry"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.crz" "blueprint_toe_joint_geoAttach_parentGrp2.rz"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2_scaleConstraint.csx" "blueprint_toe_joint_geoAttach_parentGrp2.sx"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2_scaleConstraint.csy" "blueprint_toe_joint_geoAttach_parentGrp2.sy"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2_scaleConstraint.csz" "blueprint_toe_joint_geoAttach_parentGrp2.sz"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2.ro" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.cro"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2.pim" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.cpim"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2.rp" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.crp"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2.rpt" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.crt"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.t" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.rp" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.rpt" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.r" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.ro" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.s" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.pm" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.jo" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.ssc" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.is" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tis"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.w0" "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tw"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2.pim" "blueprint_toe_joint_geoAttach_parentGrp2_scaleConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.s" "blueprint_toe_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.pm" "blueprint_toe_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].tpm"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2_scaleConstraint.w0" "blueprint_toe_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].tw"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.ctx" "blueprint_ball_joint_geoAttach_parentGrp2.tx"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.cty" "blueprint_ball_joint_geoAttach_parentGrp2.ty"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.ctz" "blueprint_ball_joint_geoAttach_parentGrp2.tz"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.crx" "blueprint_ball_joint_geoAttach_parentGrp2.rx"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.cry" "blueprint_ball_joint_geoAttach_parentGrp2.ry"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.crz" "blueprint_ball_joint_geoAttach_parentGrp2.rz"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2_scaleConstraint.csx" "blueprint_ball_joint_geoAttach_parentGrp2.sx"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2_scaleConstraint.csy" "blueprint_ball_joint_geoAttach_parentGrp2.sy"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2_scaleConstraint.csz" "blueprint_ball_joint_geoAttach_parentGrp2.sz"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2.ro" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.cro"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2.pim" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.cpim"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2.rp" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.crp"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2.rpt" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.crt"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.t" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.rp" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.rpt" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.r" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.ro" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.s" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.pm" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.jo" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.ssc" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.is" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tis"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.w0" "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tw"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2.pim" "blueprint_ball_joint_geoAttach_parentGrp2_scaleConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.s" "blueprint_ball_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.pm" "blueprint_ball_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].tpm"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2_scaleConstraint.w0" "blueprint_ball_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].tw"
		;
connectAttr "blueprint_ball_joint_geoAttach_scaleGrp2_scaleFactor.ox" "blueprint_ball_joint_geoAttach_scaleGrp2.sx"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.ctx" "blueprint_ankle_joint_geoAttach_parentGrp2.tx"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.cty" "blueprint_ankle_joint_geoAttach_parentGrp2.ty"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.ctz" "blueprint_ankle_joint_geoAttach_parentGrp2.tz"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.crx" "blueprint_ankle_joint_geoAttach_parentGrp2.rx"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.cry" "blueprint_ankle_joint_geoAttach_parentGrp2.ry"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.crz" "blueprint_ankle_joint_geoAttach_parentGrp2.rz"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2_scaleConstraint.csx" "blueprint_ankle_joint_geoAttach_parentGrp2.sx"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2_scaleConstraint.csy" "blueprint_ankle_joint_geoAttach_parentGrp2.sy"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2_scaleConstraint.csz" "blueprint_ankle_joint_geoAttach_parentGrp2.sz"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2.ro" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.cro"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2.pim" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.cpim"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2.rp" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.crp"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2.rpt" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.crt"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.t" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.rp" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.rpt" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.r" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.ro" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.s" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.pm" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.jo" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.ssc" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.is" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tis"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.w0" "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tw"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2.pim" "blueprint_ankle_joint_geoAttach_parentGrp2_scaleConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.s" "blueprint_ankle_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.pm" "blueprint_ankle_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].tpm"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2_scaleConstraint.w0" "blueprint_ankle_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].tw"
		;
connectAttr "blueprint_ankle_joint_geoAttach_scaleGrp2_scaleFactor.ox" "blueprint_ankle_joint_geoAttach_scaleGrp2.sx"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.ctx" "blueprint_knee_joint_geoAttach_parentGrp2.tx"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.cty" "blueprint_knee_joint_geoAttach_parentGrp2.ty"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.ctz" "blueprint_knee_joint_geoAttach_parentGrp2.tz"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.crx" "blueprint_knee_joint_geoAttach_parentGrp2.rx"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.cry" "blueprint_knee_joint_geoAttach_parentGrp2.ry"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.crz" "blueprint_knee_joint_geoAttach_parentGrp2.rz"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2_scaleConstraint.csx" "blueprint_knee_joint_geoAttach_parentGrp2.sx"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2_scaleConstraint.csy" "blueprint_knee_joint_geoAttach_parentGrp2.sy"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2_scaleConstraint.csz" "blueprint_knee_joint_geoAttach_parentGrp2.sz"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2.ro" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.cro"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2.pim" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.cpim"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2.rp" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.crp"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2.rpt" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.crt"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.t" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.rp" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.rpt" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.r" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.ro" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.s" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.pm" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.jo" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.ssc" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.is" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tis"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.w0" "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tw"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2.pim" "blueprint_knee_joint_geoAttach_parentGrp2_scaleConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.s" "blueprint_knee_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.pm" "blueprint_knee_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].tpm"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2_scaleConstraint.w0" "blueprint_knee_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].tw"
		;
connectAttr "blueprint_knee_joint_geoAttach_scaleGrp2_scaleFactor.ox" "blueprint_knee_joint_geoAttach_scaleGrp2.sx"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.ctx" "blueprint_hip_joint_geoAttach_parentGrp2.tx"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.cty" "blueprint_hip_joint_geoAttach_parentGrp2.ty"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.ctz" "blueprint_hip_joint_geoAttach_parentGrp2.tz"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.crx" "blueprint_hip_joint_geoAttach_parentGrp2.rx"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.cry" "blueprint_hip_joint_geoAttach_parentGrp2.ry"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.crz" "blueprint_hip_joint_geoAttach_parentGrp2.rz"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2_scaleConstraint.csx" "blueprint_hip_joint_geoAttach_parentGrp2.sx"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2_scaleConstraint.csy" "blueprint_hip_joint_geoAttach_parentGrp2.sy"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2_scaleConstraint.csz" "blueprint_hip_joint_geoAttach_parentGrp2.sz"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2.ro" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.cro"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2.pim" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.cpim"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2.rp" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.crp"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2.rpt" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.crt"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint.t" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint.rp" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint.rpt" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint.r" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint.ro" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint.s" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint.pm" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint.jo" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint.ssc" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint.is" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tis"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.w0" "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.tg[0].tw"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2.pim" "blueprint_hip_joint_geoAttach_parentGrp2_scaleConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint.s" "blueprint_hip_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint.pm" "blueprint_hip_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].tpm"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2_scaleConstraint.w0" "blueprint_hip_joint_geoAttach_parentGrp2_scaleConstraint.tg[0].tw"
		;
connectAttr "blueprint_hip_joint_geoAttach_scaleGrp2_scaleFactor.ox" "blueprint_hip_joint_geoAttach_scaleGrp2.sx"
		;
connectAttr "character_grp.animationControlVisibility" "character_container.boc[0]"
		;
connectAttr "LegFoot__instance_1:module_container.boc[0]" "character_container.boc[1]"
		;
connectAttr "LegFoot__instance_1:module_container.boc[1]" "character_container.boc[2]"
		;
connectAttr "LegFoot__instance_1_mirror:module_container.boc[0]" "character_container.boc[3]"
		;
connectAttr "LegFoot__instance_1_mirror:module_container.boc[1]" "character_container.boc[4]"
		;
connectAttr "RootTransform__instance_2:module_container.boc[0]" "character_container.boc[5]"
		;
connectAttr "RootTransform__instance_2:module_container.boc[1]" "character_container.boc[6]"
		;
connectAttr "non_blueprint_container.boc[0]" "character_container.boc[7]";
connectAttr "hyperLayout42.msg" "character_container.hl";
connectAttr "LegFoot__instance_1:module_container.msg" "hyperLayout42.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1_mirror:module_container.msg" "hyperLayout42.hyp[1].dn"
		;
connectAttr "RootTransform__instance_2:module_container.msg" "hyperLayout42.hyp[2].dn"
		;
connectAttr "character_grp.msg" "hyperLayout42.hyp[3].dn";
connectAttr "reverse_moduleMaintenanceVisibility.msg" "hyperLayout42.hyp[4].dn";
connectAttr "moduleVisibilityMultiply.msg" "hyperLayout42.hyp[5].dn";
connectAttr "non_blueprint_container.msg" "hyperLayout42.hyp[6].dn";
connectAttr "character_grp.moduleMaintenanceVisibility" "reverse_moduleMaintenanceVisibility.ix"
		;
connectAttr "non_blueprint_grp.display" "non_blueprint_container.boc[0]";
connectAttr "hyperLayout43.msg" "non_blueprint_container.hl";
connectAttr "LegFoot__instance_1_mirror:SETTINGS.activeModule" "LegFoot__instance_1_mirror:module_container.boc[0]"
		;
connectAttr "LegFoot__instance_1_mirror:SETTINGS.creationPoseWeight" "LegFoot__instance_1_mirror:module_container.boc[1]"
		;
connectAttr "hyperLayout39.msg" "LegFoot__instance_1_mirror:module_container.hl"
		;
connectAttr "RootTransform__instance_2:SETTINGS.activeModule" "RootTransform__instance_2:module_container.boc[0]"
		;
connectAttr "RootTransform__instance_2:SETTINGS.creationPoseWeight" "RootTransform__instance_2:module_container.boc[1]"
		;
connectAttr "hyperLayout41.msg" "RootTransform__instance_2:module_container.hl";
connectAttr "LegFoot__instance_1:SETTINGS.activeModule" "LegFoot__instance_1:module_container.boc[0]"
		;
connectAttr "LegFoot__instance_1:SETTINGS.creationPoseWeight" "LegFoot__instance_1:module_container.boc[1]"
		;
connectAttr "hyperLayout37.msg" "LegFoot__instance_1:module_container.hl";
connectAttr "reverse_moduleMaintenanceVisibility.ox" "moduleVisibilityMultiply.i1x"
		;
connectAttr "character_grp.animationControlVisibility" "moduleVisibilityMultiply.i2x"
		;
connectAttr "non_blueprint_grp.msg" "hyperLayout43.hyp[0].dn";
connectAttr "group.msg" "hyperLayout43.hyp[1].dn";
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1.msg" "hyperLayout43.hyp[2].dn"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1_parentConstraint.msg" "hyperLayout43.hyp[3].dn"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp1_scaleConstraint.msg" "hyperLayout43.hyp[4].dn"
		;
connectAttr "R_Toe.msg" "hyperLayout43.hyp[5].dn";
connectAttr "R_ToeShape.msg" "hyperLayout43.hyp[6].dn";
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1.msg" "hyperLayout43.hyp[7].dn"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1_parentConstraint.msg" "hyperLayout43.hyp[8].dn"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp1_scaleConstraint.msg" "hyperLayout43.hyp[9].dn"
		;
connectAttr "blueprint_ball_joint_geoAttach_scaleGrp1.msg" "hyperLayout43.hyp[10].dn"
		;
connectAttr "R_Ball.msg" "hyperLayout43.hyp[11].dn";
connectAttr "R_BallShape.msg" "hyperLayout43.hyp[12].dn";
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1.msg" "hyperLayout43.hyp[13].dn"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1_parentConstraint.msg" "hyperLayout43.hyp[14].dn"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp1_scaleConstraint.msg" "hyperLayout43.hyp[15].dn"
		;
connectAttr "blueprint_ankle_joint_geoAttach_scaleGrp1.msg" "hyperLayout43.hyp[16].dn"
		;
connectAttr "R_Ankle.msg" "hyperLayout43.hyp[17].dn";
connectAttr "R_AnkleShape.msg" "hyperLayout43.hyp[18].dn";
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1.msg" "hyperLayout43.hyp[19].dn"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1_parentConstraint.msg" "hyperLayout43.hyp[20].dn"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp1_scaleConstraint.msg" "hyperLayout43.hyp[21].dn"
		;
connectAttr "blueprint_knee_joint_geoAttach_scaleGrp1.msg" "hyperLayout43.hyp[22].dn"
		;
connectAttr "R_LowerLeg.msg" "hyperLayout43.hyp[23].dn";
connectAttr "R_LowerLegShape.msg" "hyperLayout43.hyp[24].dn";
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1.msg" "hyperLayout43.hyp[25].dn"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1_parentConstraint.msg" "hyperLayout43.hyp[26].dn"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp1_scaleConstraint.msg" "hyperLayout43.hyp[27].dn"
		;
connectAttr "blueprint_hip_joint_geoAttach_scaleGrp1.msg" "hyperLayout43.hyp[28].dn"
		;
connectAttr "R_UpperLeg.msg" "hyperLayout43.hyp[29].dn";
connectAttr "R_UpperLegShape.msg" "hyperLayout43.hyp[30].dn";
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2.msg" "hyperLayout43.hyp[31].dn"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2_parentConstraint.msg" "hyperLayout43.hyp[32].dn"
		;
connectAttr "blueprint_toe_joint_geoAttach_parentGrp2_scaleConstraint.msg" "hyperLayout43.hyp[33].dn"
		;
connectAttr "L_Toe.msg" "hyperLayout43.hyp[34].dn";
connectAttr "L_ToeShape.msg" "hyperLayout43.hyp[35].dn";
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2.msg" "hyperLayout43.hyp[36].dn"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2_parentConstraint.msg" "hyperLayout43.hyp[37].dn"
		;
connectAttr "blueprint_ball_joint_geoAttach_parentGrp2_scaleConstraint.msg" "hyperLayout43.hyp[38].dn"
		;
connectAttr "blueprint_ball_joint_geoAttach_scaleGrp2.msg" "hyperLayout43.hyp[39].dn"
		;
connectAttr "L_Ball.msg" "hyperLayout43.hyp[40].dn";
connectAttr "L_BallShape.msg" "hyperLayout43.hyp[41].dn";
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2.msg" "hyperLayout43.hyp[42].dn"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2_parentConstraint.msg" "hyperLayout43.hyp[43].dn"
		;
connectAttr "blueprint_ankle_joint_geoAttach_parentGrp2_scaleConstraint.msg" "hyperLayout43.hyp[44].dn"
		;
connectAttr "blueprint_ankle_joint_geoAttach_scaleGrp2.msg" "hyperLayout43.hyp[45].dn"
		;
connectAttr "L_Ankle.msg" "hyperLayout43.hyp[46].dn";
connectAttr "L_AnkleShape.msg" "hyperLayout43.hyp[47].dn";
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2.msg" "hyperLayout43.hyp[48].dn"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2_parentConstraint.msg" "hyperLayout43.hyp[49].dn"
		;
connectAttr "blueprint_knee_joint_geoAttach_parentGrp2_scaleConstraint.msg" "hyperLayout43.hyp[50].dn"
		;
connectAttr "blueprint_knee_joint_geoAttach_scaleGrp2.msg" "hyperLayout43.hyp[51].dn"
		;
connectAttr "L_LowerLeg.msg" "hyperLayout43.hyp[52].dn";
connectAttr "L_LowerLegShape.msg" "hyperLayout43.hyp[53].dn";
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2.msg" "hyperLayout43.hyp[54].dn"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2_parentConstraint.msg" "hyperLayout43.hyp[55].dn"
		;
connectAttr "blueprint_hip_joint_geoAttach_parentGrp2_scaleConstraint.msg" "hyperLayout43.hyp[56].dn"
		;
connectAttr "blueprint_hip_joint_geoAttach_scaleGrp2.msg" "hyperLayout43.hyp[57].dn"
		;
connectAttr "L_UpperLeg.msg" "hyperLayout43.hyp[58].dn";
connectAttr "L_UpperLegShape.msg" "hyperLayout43.hyp[59].dn";
connectAttr "blueprint_ankle_joint_geoAttach_scaleGrp1_scaleFactor.msg" "hyperLayout43.hyp[60].dn"
		;
connectAttr "blueprint_ball_joint_geoAttach_scaleGrp1_scaleFactor.msg" "hyperLayout43.hyp[61].dn"
		;
connectAttr "blueprint_hip_joint_geoAttach_scaleGrp1_scaleFactor.msg" "hyperLayout43.hyp[62].dn"
		;
connectAttr "blueprint_hip_joint_geoAttach_scaleGrp2_scaleFactor.msg" "hyperLayout43.hyp[63].dn"
		;
connectAttr "blueprint_knee_joint_geoAttach_scaleGrp2_scaleFactor.msg" "hyperLayout43.hyp[64].dn"
		;
connectAttr "non_blueprint_visibilityMultiply.msg" "hyperLayout43.hyp[65].dn";
connectAttr "blueprint_knee_joint_geoAttach_scaleGrp1_scaleFactor.msg" "hyperLayout43.hyp[66].dn"
		;
connectAttr "blueprint_ball_joint_geoAttach_scaleGrp2_scaleFactor.msg" "hyperLayout43.hyp[67].dn"
		;
connectAttr "blueprint_ankle_joint_geoAttach_scaleGrp2_scaleFactor.msg" "hyperLayout43.hyp[68].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.tx" "blueprint_ankle_joint_geoAttach_scaleGrp1_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.tx" "blueprint_ball_joint_geoAttach_scaleGrp1_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.tx" "blueprint_hip_joint_geoAttach_scaleGrp1_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.tx" "blueprint_hip_joint_geoAttach_scaleGrp2_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.tx" "blueprint_knee_joint_geoAttach_scaleGrp2_scaleFactor.i1x"
		;
connectAttr "reverse_moduleMaintenanceVisibility.ox" "non_blueprint_visibilityMultiply.i1x"
		;
connectAttr "non_blueprint_grp.display" "non_blueprint_visibilityMultiply.i2x";
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.tx" "blueprint_knee_joint_geoAttach_scaleGrp1_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.tx" "blueprint_ball_joint_geoAttach_scaleGrp2_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.tx" "blueprint_ankle_joint_geoAttach_scaleGrp2_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint_addRotations.o3" "unitConversion6.i"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint_dummyRotationsMultiply.o" "LegFoot__instance_1_mirror:blueprint_hip_joint_addRotations.i3[0]"
		;
connectAttr "RootTransform__instance_2:blueprint_joint_addRotations.o3" "unitConversion11.i"
		;
connectAttr "RootTransform__instance_2:blueprint_joint_dummyRotationsMultiply.o" "RootTransform__instance_2:blueprint_joint_addRotations.i3[0]"
		;
connectAttr "RootTransform__instance_2:blueprint_joint_original_Translate.o" "RootTransform__instance_2:blueprint_joint_addTranslate.i3[0]"
		;
connectAttr "RootTransform__instance_2:SETTINGS.creationPoseWeight" "RootTransform__instance_2:blueprint_joint_original_Translate.i2x"
		;
connectAttr "RootTransform__instance_2:SETTINGS.creationPoseWeight" "RootTransform__instance_2:blueprint_joint_original_Translate.i2y"
		;
connectAttr "RootTransform__instance_2:SETTINGS.creationPoseWeight" "RootTransform__instance_2:blueprint_joint_original_Translate.i2z"
		;
connectAttr "RootTransform__instance_2:blueprint_joint_original_Scale.o" "RootTransform__instance_2:blueprint_joint_addScale.i3[0]"
		;
connectAttr "RootTransform__instance_2:SETTINGS.creationPoseWeight" "RootTransform__instance_2:blueprint_joint_original_Scale.i2x"
		;
connectAttr "RootTransform__instance_2:SETTINGS.creationPoseWeight" "RootTransform__instance_2:blueprint_joint_original_Scale.i2y"
		;
connectAttr "RootTransform__instance_2:SETTINGS.creationPoseWeight" "RootTransform__instance_2:blueprint_joint_original_Scale.i2z"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint_addRotations.o3" "unitConversion7.i"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint_dummyRotationsMultiply.o" "LegFoot__instance_1_mirror:blueprint_knee_joint_addRotations.i3[0]"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint_original_Tx.ox" "LegFoot__instance_1_mirror:blueprint_knee_joint_addTx.i1[0]"
		;
connectAttr "LegFoot__instance_1_mirror:SETTINGS.creationPoseWeight" "LegFoot__instance_1_mirror:blueprint_knee_joint_original_Tx.i2x"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint_addRotations.o3" "unitConversion8.i"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint_dummyRotationsMultiply.o" "LegFoot__instance_1_mirror:blueprint_ankle_joint_addRotations.i3[0]"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint_original_Tx.ox" "LegFoot__instance_1_mirror:blueprint_ankle_joint_addTx.i1[0]"
		;
connectAttr "LegFoot__instance_1_mirror:SETTINGS.creationPoseWeight" "LegFoot__instance_1_mirror:blueprint_ankle_joint_original_Tx.i2x"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint_addRotations.o3" "unitConversion9.i"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint_dummyRotationsMultiply.o" "LegFoot__instance_1_mirror:blueprint_ball_joint_addRotations.i3[0]"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint_original_Tx.ox" "LegFoot__instance_1_mirror:blueprint_ball_joint_addTx.i1[0]"
		;
connectAttr "LegFoot__instance_1_mirror:SETTINGS.creationPoseWeight" "LegFoot__instance_1_mirror:blueprint_ball_joint_original_Tx.i2x"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint_addRotations.o3" "unitConversion10.i"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint_dummyRotationsMultiply.o" "LegFoot__instance_1_mirror:blueprint_toe_joint_addRotations.i3[0]"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint_original_Tx.ox" "LegFoot__instance_1_mirror:blueprint_toe_joint_addTx.i1[0]"
		;
connectAttr "LegFoot__instance_1_mirror:SETTINGS.creationPoseWeight" "LegFoot__instance_1_mirror:blueprint_toe_joint_original_Tx.i2x"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint_addRotations.o3" "unitConversion1.i"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint_dummyRotationsMultiply.o" "LegFoot__instance_1:blueprint_hip_joint_addRotations.i3[0]"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint_addRotations.o3" "unitConversion3.i"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint_dummyRotationsMultiply.o" "LegFoot__instance_1:blueprint_ankle_joint_addRotations.i3[0]"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint_original_Tx.ox" "LegFoot__instance_1:blueprint_ankle_joint_addTx.i1[0]"
		;
connectAttr "LegFoot__instance_1:SETTINGS.creationPoseWeight" "LegFoot__instance_1:blueprint_ankle_joint_original_Tx.i2x"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint_addRotations.o3" "unitConversion4.i"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint_dummyRotationsMultiply.o" "LegFoot__instance_1:blueprint_ball_joint_addRotations.i3[0]"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint_original_Tx.ox" "LegFoot__instance_1:blueprint_ball_joint_addTx.i1[0]"
		;
connectAttr "LegFoot__instance_1:SETTINGS.creationPoseWeight" "LegFoot__instance_1:blueprint_ball_joint_original_Tx.i2x"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint_addRotations.o3" "unitConversion5.i"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint_dummyRotationsMultiply.o" "LegFoot__instance_1:blueprint_toe_joint_addRotations.i3[0]"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint_original_Tx.ox" "LegFoot__instance_1:blueprint_toe_joint_addTx.i1[0]"
		;
connectAttr "LegFoot__instance_1:SETTINGS.creationPoseWeight" "LegFoot__instance_1:blueprint_toe_joint_original_Tx.i2x"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint_addRotations.o3" "unitConversion2.i"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint_dummyRotationsMultiply.o" "LegFoot__instance_1:blueprint_knee_joint_addRotations.i3[0]"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint_original_Tx.ox" "LegFoot__instance_1:blueprint_knee_joint_addTx.i1[0]"
		;
connectAttr "LegFoot__instance_1:SETTINGS.creationPoseWeight" "LegFoot__instance_1:blueprint_knee_joint_original_Tx.i2x"
		;
connectAttr "LegFoot__instance_1_mirror:module_grp.msg" "hyperLayout39.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1_mirror:HOOK_IN.msg" "hyperLayout39.hyp[1].dn";
connectAttr "LegFoot__instance_1_mirror:SETTINGS.msg" "hyperLayout39.hyp[2].dn";
connectAttr "LegFoot__instance_1_mirror:blueprint_container.msg" "hyperLayout39.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:SETTINGSShape.msg" "hyperLayout39.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_parent_constraint.msg" "hyperLayout39.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_scale_constraint.msg" "hyperLayout39.hyp[6].dn"
		;
connectAttr "hyperLayout38.msg" "LegFoot__instance_1_mirror:blueprint_container.hl"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint_addRotations.msg" "hyperLayout38.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint_dummyRotationsMultiply.msg" "hyperLayout38.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint_addRotations.msg" "hyperLayout38.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint_dummyRotationsMultiply.msg" "hyperLayout38.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint_addTx.msg" "hyperLayout38.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint_original_Tx.msg" "hyperLayout38.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint_addRotations.msg" "hyperLayout38.hyp[6].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint_dummyRotationsMultiply.msg" "hyperLayout38.hyp[7].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint_addTx.msg" "hyperLayout38.hyp[8].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint_original_Tx.msg" "hyperLayout38.hyp[9].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint_addRotations.msg" "hyperLayout38.hyp[10].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint_dummyRotationsMultiply.msg" "hyperLayout38.hyp[11].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint_addTx.msg" "hyperLayout38.hyp[12].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint_original_Tx.msg" "hyperLayout38.hyp[13].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint_addRotations.msg" "hyperLayout38.hyp[14].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint_dummyRotationsMultiply.msg" "hyperLayout38.hyp[15].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint_addTx.msg" "hyperLayout38.hyp[16].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint_original_Tx.msg" "hyperLayout38.hyp[17].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_joints_grp.msg" "hyperLayout38.hyp[18].dn"
		;
connectAttr "LegFoot__instance_1_mirror:creationPose_joints_grp.msg" "hyperLayout38.hyp[19].dn"
		;
connectAttr "unitConversion6.msg" "hyperLayout38.hyp[20].dn";
connectAttr "unitConversion7.msg" "hyperLayout38.hyp[21].dn";
connectAttr "unitConversion8.msg" "hyperLayout38.hyp[22].dn";
connectAttr "unitConversion9.msg" "hyperLayout38.hyp[23].dn";
connectAttr "unitConversion10.msg" "hyperLayout38.hyp[24].dn";
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint.msg" "hyperLayout38.hyp[25].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint.msg" "hyperLayout38.hyp[26].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint.msg" "hyperLayout38.hyp[27].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint.msg" "hyperLayout38.hyp[28].dn"
		;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint.msg" "hyperLayout38.hyp[29].dn"
		;
connectAttr "LegFoot__instance_1_mirror:creationPose_hip_joint.msg" "hyperLayout38.hyp[30].dn"
		;
connectAttr "LegFoot__instance_1_mirror:creationPose_knee_joint.msg" "hyperLayout38.hyp[31].dn"
		;
connectAttr "LegFoot__instance_1_mirror:creationPose_ankle_joint.msg" "hyperLayout38.hyp[32].dn"
		;
connectAttr "LegFoot__instance_1_mirror:creationPose_ball_joint.msg" "hyperLayout38.hyp[33].dn"
		;
connectAttr "LegFoot__instance_1_mirror:creationPose_toe_joint.msg" "hyperLayout38.hyp[34].dn"
		;
connectAttr "RootTransform__instance_2:module_grp.msg" "hyperLayout41.hyp[0].dn"
		;
connectAttr "RootTransform__instance_2:HOOK_IN.msg" "hyperLayout41.hyp[1].dn";
connectAttr "RootTransform__instance_2:SETTINGS.msg" "hyperLayout41.hyp[2].dn";
connectAttr "RootTransform__instance_2:blueprint_container.msg" "hyperLayout41.hyp[3].dn"
		;
connectAttr "RootTransform__instance_2:SETTINGSShape.msg" "hyperLayout41.hyp[4].dn"
		;
connectAttr "hyperLayout40.msg" "RootTransform__instance_2:blueprint_container.hl"
		;
connectAttr "RootTransform__instance_2:blueprint_joint_addRotations.msg" "hyperLayout40.hyp[0].dn"
		;
connectAttr "RootTransform__instance_2:blueprint_joint_dummyRotationsMultiply.msg" "hyperLayout40.hyp[1].dn"
		;
connectAttr "RootTransform__instance_2:blueprint_joint_addTranslate.msg" "hyperLayout40.hyp[2].dn"
		;
connectAttr "RootTransform__instance_2:blueprint_joint_original_Translate.msg" "hyperLayout40.hyp[3].dn"
		;
connectAttr "RootTransform__instance_2:blueprint_joint_addScale.msg" "hyperLayout40.hyp[4].dn"
		;
connectAttr "RootTransform__instance_2:blueprint_joint_original_Scale.msg" "hyperLayout40.hyp[5].dn"
		;
connectAttr "RootTransform__instance_2:blueprint_joints_grp.msg" "hyperLayout40.hyp[6].dn"
		;
connectAttr "RootTransform__instance_2:creationPose_joints_grp.msg" "hyperLayout40.hyp[7].dn"
		;
connectAttr "unitConversion11.msg" "hyperLayout40.hyp[8].dn";
connectAttr "RootTransform__instance_2:blueprint_joint.msg" "hyperLayout40.hyp[9].dn"
		;
connectAttr "RootTransform__instance_2:creationPose_joint.msg" "hyperLayout40.hyp[10].dn"
		;
connectAttr "LegFoot__instance_1:module_grp.msg" "hyperLayout37.hyp[0].dn";
connectAttr "LegFoot__instance_1:HOOK_IN.msg" "hyperLayout37.hyp[1].dn";
connectAttr "LegFoot__instance_1:SETTINGS.msg" "hyperLayout37.hyp[2].dn";
connectAttr "LegFoot__instance_1:blueprint_container.msg" "hyperLayout37.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:SETTINGSShape.msg" "hyperLayout37.hyp[4].dn";
connectAttr "LegFoot__instance_1:hook_parent_constraint.msg" "hyperLayout37.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1:hook_scale_constraint.msg" "hyperLayout37.hyp[6].dn"
		;
connectAttr "hyperLayout36.msg" "LegFoot__instance_1:blueprint_container.hl";
connectAttr "LegFoot__instance_1:blueprint_hip_joint_addRotations.msg" "hyperLayout36.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint_dummyRotationsMultiply.msg" "hyperLayout36.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint_addRotations.msg" "hyperLayout36.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint_dummyRotationsMultiply.msg" "hyperLayout36.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint_addTx.msg" "hyperLayout36.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint_original_Tx.msg" "hyperLayout36.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint_addRotations.msg" "hyperLayout36.hyp[6].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint_dummyRotationsMultiply.msg" "hyperLayout36.hyp[7].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint_addTx.msg" "hyperLayout36.hyp[8].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint_original_Tx.msg" "hyperLayout36.hyp[9].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint_addRotations.msg" "hyperLayout36.hyp[10].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint_dummyRotationsMultiply.msg" "hyperLayout36.hyp[11].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint_addTx.msg" "hyperLayout36.hyp[12].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint_original_Tx.msg" "hyperLayout36.hyp[13].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint_addRotations.msg" "hyperLayout36.hyp[14].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint_dummyRotationsMultiply.msg" "hyperLayout36.hyp[15].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint_addTx.msg" "hyperLayout36.hyp[16].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint_original_Tx.msg" "hyperLayout36.hyp[17].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_joints_grp.msg" "hyperLayout36.hyp[18].dn"
		;
connectAttr "LegFoot__instance_1:creationPose_joints_grp.msg" "hyperLayout36.hyp[19].dn"
		;
connectAttr "unitConversion1.msg" "hyperLayout36.hyp[20].dn";
connectAttr "unitConversion2.msg" "hyperLayout36.hyp[21].dn";
connectAttr "unitConversion3.msg" "hyperLayout36.hyp[22].dn";
connectAttr "unitConversion4.msg" "hyperLayout36.hyp[23].dn";
connectAttr "unitConversion5.msg" "hyperLayout36.hyp[24].dn";
connectAttr "LegFoot__instance_1:blueprint_hip_joint.msg" "hyperLayout36.hyp[25].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_knee_joint.msg" "hyperLayout36.hyp[26].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint.msg" "hyperLayout36.hyp[27].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_ball_joint.msg" "hyperLayout36.hyp[28].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_toe_joint.msg" "hyperLayout36.hyp[29].dn"
		;
connectAttr "LegFoot__instance_1:creationPose_hip_joint.msg" "hyperLayout36.hyp[30].dn"
		;
connectAttr "LegFoot__instance_1:creationPose_knee_joint.msg" "hyperLayout36.hyp[31].dn"
		;
connectAttr "LegFoot__instance_1:creationPose_ankle_joint.msg" "hyperLayout36.hyp[32].dn"
		;
connectAttr "LegFoot__instance_1:creationPose_ball_joint.msg" "hyperLayout36.hyp[33].dn"
		;
connectAttr "LegFoot__instance_1:creationPose_toe_joint.msg" "hyperLayout36.hyp[34].dn"
		;
connectAttr "LegFoot__instance_1:blueprint_hip_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_hip_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_knee_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_knee_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_knee_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_knee_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_ankle_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_ball_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_ball_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_ball_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_ball_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_toe_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_toe_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_toe_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:blueprint_toe_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_hip_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_knee_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_ankle_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_ball_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:blueprint_toe_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "RootTransform__instance_2:blueprint_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "RootTransform__instance_2:blueprint_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "RootTransform__instance_2:blueprint_joint_addTranslate.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "RootTransform__instance_2:blueprint_joint_original_Translate.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "RootTransform__instance_2:blueprint_joint_addScale.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "RootTransform__instance_2:blueprint_joint_original_Scale.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "blueprint_ball_joint_geoAttach_scaleGrp1_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "blueprint_ankle_joint_geoAttach_scaleGrp1_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "blueprint_knee_joint_geoAttach_scaleGrp1_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "blueprint_hip_joint_geoAttach_scaleGrp1_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "blueprint_ball_joint_geoAttach_scaleGrp2_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "blueprint_ankle_joint_geoAttach_scaleGrp2_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "blueprint_knee_joint_geoAttach_scaleGrp2_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "blueprint_hip_joint_geoAttach_scaleGrp2_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "reverse_moduleMaintenanceVisibility.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "moduleVisibilityMultiply.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "non_blueprint_visibilityMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "L_BallShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "L_ToeShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "L_AnkleShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "L_LowerLegShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "L_UpperLegShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "R_UpperLegShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "R_LowerLegShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "R_AnkleShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "R_BallShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "R_ToeShape.iog" ":initialShadingGroup.dsm" -na;
// End of Legs.ma
