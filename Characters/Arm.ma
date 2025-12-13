//Maya ASCII 2022 scene
//Name: Arm.ma
//Last modified: Wed, Nov 26, 2025 01:23:24 PM
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
fileInfo "UUID" "D59583FF-4911-466C-2EF9-F5A62A09ABB8";
createNode transform -n "character_grp";
	rename -uid "E34C1BE8-446C-D710-8B57-DFB99AFF4A1A";
	addAttr -ci true -sn "moduleMaintenanceVisibility" -ln "moduleMaintenanceVisibility" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "animationControlVisibility" -ln "animationControlVisibility" 
		-dv 1 -min 0 -max 1 -at "bool";
	setAttr -k on ".animationControlVisibility";
createNode transform -n "Finger__instance_3:module_grp" -p "character_grp";
	rename -uid "B19F05A8-4F46-0E21-8D89-198C5E80F291";
	addAttr -ci true -sn "hierarchicalScale" -ln "hierarchicalScale" -at "float";
createNode transform -n "Finger__instance_3:HOOK_IN" -p "Finger__instance_3:module_grp";
	rename -uid "375827CD-4A1B-3916-44E0-3CB56EE94DC0";
createNode transform -n "Finger__instance_3:blueprint_joints_grp" -p "Finger__instance_3:HOOK_IN";
	rename -uid "669B017A-4049-9C59-CC00-D5A28376BA31";
	addAttr -ci true -sn "controlModulesInstalled" -ln "controlModulesInstalled" -min 
		0 -max 1 -at "bool";
	setAttr ".ove" yes;
createNode joint -n "Finger__instance_3:blueprint_root_joint" -p "Finger__instance_3:blueprint_joints_grp";
	rename -uid "C091FE86-4762-757D-4DC9-37B7E7785BA4";
	setAttr ".t" -type "double3" 5 6.7978657159107971 -0.60598623302614429 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_3:blueprint_knuckle_1_joint" -p "Finger__instance_3:blueprint_root_joint";
	rename -uid "207BB431-4894-CF8F-8386-908679433055";
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_3:blueprint_knuckle_2_joint" -p "Finger__instance_3:blueprint_knuckle_1_joint";
	rename -uid "FBC10E96-4086-F68F-42A9-F280AE22ABCA";
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_3:blueprint_knuckle_3_joint" -p "Finger__instance_3:blueprint_knuckle_2_joint";
	rename -uid "0BD60355-4AA3-75CB-4A60-1E8CBF78693B";
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_3:blueprint_end_joint" -p "Finger__instance_3:blueprint_knuckle_3_joint";
	rename -uid "858DBE7B-4EB6-148F-0087-F49382B7058F";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode transform -n "Finger__instance_3:creationPose_joints_grp" -p "Finger__instance_3:HOOK_IN";
	rename -uid "410E51CB-4BD0-1B40-0E69-50B74D5DDC33";
createNode joint -n "Finger__instance_3:creationPose_root_joint" -p "Finger__instance_3:creationPose_joints_grp";
	rename -uid "30497F1B-49B8-B838-604C-FE979E2C5048";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 5 6.7978657159107971 -0.60598623302614429 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_3:creationPose_knuckle_1_joint" -p "Finger__instance_3:creationPose_root_joint";
	rename -uid "A1308F29-477C-FE1F-4678-B581E3427E98";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.4083993136882782 0 0 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_3:creationPose_knuckle_2_joint" -p "Finger__instance_3:creationPose_knuckle_1_joint";
	rename -uid "79389094-4DC2-756A-9FC8-57B09B16DF48";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839931368827731 0 0 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_3:creationPose_knuckle_3_joint" -p "Finger__instance_3:creationPose_knuckle_2_joint";
	rename -uid "A21E67B6-488B-BBDF-F0C8-D3BCA889A7B8";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839934349060059 0 0 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_3:creationPose_end_joint" -p "Finger__instance_3:creationPose_knuckle_3_joint";
	rename -uid "F7AFB71F-4F04-FAB6-C2A4-E09E0449479E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839931368827909 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode parentConstraint -n "Finger__instance_3:hook_parent_constraint" -p "Finger__instance_3:HOOK_IN";
	rename -uid "87591D8B-4E2B-0AD7-4882-C6974620E16D";
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
	setAttr ".tg[0].tot" -type "double3" -4 -6.7978657159107971 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "Finger__instance_3:hook_scale_constraint" -p "Finger__instance_3:HOOK_IN";
	rename -uid "F11F9E83-451E-08A0-FFE5-B5AB1B615B71";
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
createNode transform -n "Finger__instance_3:SETTINGS" -p "Finger__instance_3:module_grp";
	rename -uid "BB18C6FC-440A-A785-A3E5-87AD090CB89F";
	addAttr -ci true -sn "activeModule" -ln "activeModule" -min 0 -max 0 -en "None" 
		-at "enum";
	addAttr -ci true -sn "creationPoseWeight" -ln "creationPoseWeight" -dv 1 -at "float";
	setAttr ".v" no;
createNode locator -n "Finger__instance_3:SETTINGSShape" -p "Finger__instance_3:SETTINGS";
	rename -uid "C50D02B3-4935-E3CB-425D-C38B71E7661D";
	setAttr -k off ".v";
createNode transform -n "Finger__instance_4:module_grp" -p "character_grp";
	rename -uid "6515D171-4C06-DD6E-F66E-0AA8BCA385F4";
	addAttr -ci true -sn "hierarchicalScale" -ln "hierarchicalScale" -at "float";
createNode transform -n "Finger__instance_4:HOOK_IN" -p "Finger__instance_4:module_grp";
	rename -uid "DE8EB0BD-44D4-E6B3-DA35-9194A966FB8F";
createNode transform -n "Finger__instance_4:blueprint_joints_grp" -p "Finger__instance_4:HOOK_IN";
	rename -uid "3741DFAA-4718-36D9-E9BA-FA943C77A9D3";
	addAttr -ci true -sn "controlModulesInstalled" -ln "controlModulesInstalled" -min 
		0 -max 1 -at "bool";
	setAttr ".ove" yes;
createNode joint -n "Finger__instance_4:blueprint_root_joint" -p "Finger__instance_4:blueprint_joints_grp";
	rename -uid "0DB7E574-455B-F515-748F-1ABDEB82274F";
	setAttr ".t" -type "double3" 5 6.7978657159107971 -0.19758691226337427 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_4:blueprint_knuckle_1_joint" -p "Finger__instance_4:blueprint_root_joint";
	rename -uid "D46801B5-4550-72F3-CB90-909636B4BB1F";
	setAttr ".t" -type "double3" 0.4083993136882782 0 2.7755575615628914e-17 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_4:blueprint_knuckle_2_joint" -p "Finger__instance_4:blueprint_knuckle_1_joint";
	rename -uid "7934B625-4F68-8FB6-90D5-15A6EC2A4892";
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_4:blueprint_knuckle_3_joint" -p "Finger__instance_4:blueprint_knuckle_2_joint";
	rename -uid "FAAABF01-48DF-9247-54FC-49BF350EFA0D";
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_4:blueprint_end_joint" -p "Finger__instance_4:blueprint_knuckle_3_joint";
	rename -uid "7C04C950-414B-4FBD-F2B6-95BB16C9AD36";
	setAttr ".t" -type "double3" 0.4083993136882782 0 -2.7755575615628914e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode transform -n "Finger__instance_4:creationPose_joints_grp" -p "Finger__instance_4:HOOK_IN";
	rename -uid "2570DC23-473C-8D4C-F35D-64BED3E13800";
createNode joint -n "Finger__instance_4:creationPose_root_joint" -p "Finger__instance_4:creationPose_joints_grp";
	rename -uid "61D19DB9-42D8-97A9-6BD2-DD93C70B86AB";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 5 6.7978657159107971 -0.19758691226337427 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_4:creationPose_knuckle_1_joint" -p "Finger__instance_4:creationPose_root_joint";
	rename -uid "4A6274F2-4A43-946B-6C31-53973322C001";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.4083993136882782 0 2.7755575615628914e-17 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_4:creationPose_knuckle_2_joint" -p "Finger__instance_4:creationPose_knuckle_1_joint";
	rename -uid "28053B99-4915-41AE-2614-4D8AA4310DDC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839931368827731 0 0 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_4:creationPose_knuckle_3_joint" -p "Finger__instance_4:creationPose_knuckle_2_joint";
	rename -uid "EA3B329C-44DF-1F9D-50DB-52B812510E27";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839934349060059 0 0 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_4:creationPose_end_joint" -p "Finger__instance_4:creationPose_knuckle_3_joint";
	rename -uid "7A807473-4C6B-AF8A-97B2-9E8E1EEAC5B5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839931368827909 0 -2.7755575615628914e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode parentConstraint -n "Finger__instance_4:hook_parent_constraint" -p "Finger__instance_4:HOOK_IN";
	rename -uid "486960B9-4937-56B3-8F92-3CBCEE089D96";
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
	setAttr ".tg[0].tot" -type "double3" -4 -6.7978657159107971 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "Finger__instance_4:hook_scale_constraint" -p "Finger__instance_4:HOOK_IN";
	rename -uid "FA011EE4-4090-581F-9F97-F18428FCC0B0";
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
createNode transform -n "Finger__instance_4:SETTINGS" -p "Finger__instance_4:module_grp";
	rename -uid "2F1453DE-40AA-3969-56D5-B0A221F36FA2";
	addAttr -ci true -sn "activeModule" -ln "activeModule" -min 0 -max 0 -en "None" 
		-at "enum";
	addAttr -ci true -sn "creationPoseWeight" -ln "creationPoseWeight" -dv 1 -at "float";
	setAttr ".v" no;
createNode locator -n "Finger__instance_4:SETTINGSShape" -p "Finger__instance_4:SETTINGS";
	rename -uid "64E09991-4639-ADE1-79C3-9F9744FD8F51";
	setAttr -k off ".v";
createNode transform -n "Finger__instance_5:module_grp" -p "character_grp";
	rename -uid "4A028498-4135-6001-95F3-338A15535109";
	addAttr -ci true -sn "hierarchicalScale" -ln "hierarchicalScale" -at "float";
createNode transform -n "Finger__instance_5:HOOK_IN" -p "Finger__instance_5:module_grp";
	rename -uid "C664813F-4EB5-9AAA-312A-FABA88817CFD";
createNode transform -n "Finger__instance_5:blueprint_joints_grp" -p "Finger__instance_5:HOOK_IN";
	rename -uid "AB40AEB4-4C04-96C1-3079-1B8291080B26";
	addAttr -ci true -sn "controlModulesInstalled" -ln "controlModulesInstalled" -min 
		0 -max 1 -at "bool";
	setAttr ".ove" yes;
createNode joint -n "Finger__instance_5:blueprint_root_joint" -p "Finger__instance_5:blueprint_joints_grp";
	rename -uid "28566124-415E-D53A-D103-2AB2B4B1FAC3";
	setAttr ".t" -type "double3" 5 6.7978657159107971 0.21081240849939575 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_5:blueprint_knuckle_1_joint" -p "Finger__instance_5:blueprint_root_joint";
	rename -uid "84DA8D66-47A6-9493-E2F0-2B9B9FA55578";
	setAttr ".t" -type "double3" 0.4083993136882782 0 -2.7755575615628914e-17 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_5:blueprint_knuckle_2_joint" -p "Finger__instance_5:blueprint_knuckle_1_joint";
	rename -uid "69880798-48BB-8F1E-601F-2F92F06F2916";
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_5:blueprint_knuckle_3_joint" -p "Finger__instance_5:blueprint_knuckle_2_joint";
	rename -uid "88F6E97A-4D20-0EE4-81B2-33B78B61FE42";
	setAttr ".t" -type "double3" 0.40839934349060059 0 5.5511151231257827e-17 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_5:blueprint_end_joint" -p "Finger__instance_5:blueprint_knuckle_3_joint";
	rename -uid "002341FA-4158-84B3-7B1E-93B98F60D2F3";
	setAttr ".t" -type "double3" 0.4083993136882782 0 -2.7755575615628914e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode transform -n "Finger__instance_5:creationPose_joints_grp" -p "Finger__instance_5:HOOK_IN";
	rename -uid "FE02816F-4861-DFCF-DA26-B9B5549F7CEC";
createNode joint -n "Finger__instance_5:creationPose_root_joint" -p "Finger__instance_5:creationPose_joints_grp";
	rename -uid "1E6B650E-4AEC-A1A2-9143-3091DF8FB544";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 5 6.7978657159107971 0.21081240849939575 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_5:creationPose_knuckle_1_joint" -p "Finger__instance_5:creationPose_root_joint";
	rename -uid "16884E11-4444-4FD9-4C22-B7999E16DE55";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.4083993136882782 0 -2.7755575615628914e-17 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_5:creationPose_knuckle_2_joint" -p "Finger__instance_5:creationPose_knuckle_1_joint";
	rename -uid "C645C6CE-4646-8826-3A13-B69258512BA5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839931368827731 0 0 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_5:creationPose_knuckle_3_joint" -p "Finger__instance_5:creationPose_knuckle_2_joint";
	rename -uid "59F28229-462E-6098-A8A8-4F94606E2A85";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839934349060059 0 5.5511151231257827e-17 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_5:creationPose_end_joint" -p "Finger__instance_5:creationPose_knuckle_3_joint";
	rename -uid "2087ABA6-473E-BA5D-49B8-E78B68B13673";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839931368827909 0 -2.7755575615628914e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode parentConstraint -n "Finger__instance_5:hook_parent_constraint" -p "Finger__instance_5:HOOK_IN";
	rename -uid "49AB17F7-460A-21CF-B473-FC8F19158C5E";
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
	setAttr ".tg[0].tot" -type "double3" -4 -6.7978657159107971 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "Finger__instance_5:hook_scale_constraint" -p "Finger__instance_5:HOOK_IN";
	rename -uid "25CA49C8-4750-9435-7994-B1AEF53B2E54";
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
createNode transform -n "Finger__instance_5:SETTINGS" -p "Finger__instance_5:module_grp";
	rename -uid "1D7D3F2B-44FF-98E3-6CD4-478FE47AC9AE";
	addAttr -ci true -sn "activeModule" -ln "activeModule" -min 0 -max 0 -en "None" 
		-at "enum";
	addAttr -ci true -sn "creationPoseWeight" -ln "creationPoseWeight" -dv 1 -at "float";
	setAttr ".v" no;
createNode locator -n "Finger__instance_5:SETTINGSShape" -p "Finger__instance_5:SETTINGS";
	rename -uid "9B2A6F94-45C6-6B3A-CB56-65B4C7868015";
	setAttr -k off ".v";
createNode transform -n "Finger__instance_6:module_grp" -p "character_grp";
	rename -uid "DBF0CBB9-499C-6E81-ACAC-19868F17925B";
	addAttr -ci true -sn "hierarchicalScale" -ln "hierarchicalScale" -at "float";
createNode transform -n "Finger__instance_6:HOOK_IN" -p "Finger__instance_6:module_grp";
	rename -uid "E7371C47-4C2A-22C4-9932-BA9D839930DA";
createNode transform -n "Finger__instance_6:blueprint_joints_grp" -p "Finger__instance_6:HOOK_IN";
	rename -uid "A1E4B89E-49F6-80FC-892C-0EA5BB23E431";
	addAttr -ci true -sn "controlModulesInstalled" -ln "controlModulesInstalled" -min 
		0 -max 1 -at "bool";
	setAttr ".ove" yes;
createNode joint -n "Finger__instance_6:blueprint_root_joint" -p "Finger__instance_6:blueprint_joints_grp";
	rename -uid "60E00CD3-40D9-0A0D-4270-73A34EB944A2";
	setAttr ".t" -type "double3" 5 6.7978657159107971 0.61921172926216572 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_6:blueprint_knuckle_1_joint" -p "Finger__instance_6:blueprint_root_joint";
	rename -uid "81261FE1-4BAF-8581-4ACC-B29C010170F2";
	setAttr ".t" -type "double3" 0.4083993136882782 0 1.1102230246251565e-16 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_6:blueprint_knuckle_2_joint" -p "Finger__instance_6:blueprint_knuckle_1_joint";
	rename -uid "B63BEF75-4F92-444E-7F23-A1AF331FF22D";
	setAttr ".t" -type "double3" 0.4083993136882782 0 -1.1102230246251565e-16 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_6:blueprint_knuckle_3_joint" -p "Finger__instance_6:blueprint_knuckle_2_joint";
	rename -uid "CACC5021-4B5D-1C44-E829-88A981147146";
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_6:blueprint_end_joint" -p "Finger__instance_6:blueprint_knuckle_3_joint";
	rename -uid "0C61867E-45A5-B906-0B8A-FAB72A958871";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode transform -n "Finger__instance_6:creationPose_joints_grp" -p "Finger__instance_6:HOOK_IN";
	rename -uid "1E0AE3C8-4B87-E6AC-79BF-399553F0C88F";
createNode joint -n "Finger__instance_6:creationPose_root_joint" -p "Finger__instance_6:creationPose_joints_grp";
	rename -uid "6D279779-4292-5792-6BD5-0BB20A013408";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 5 6.7978657159107971 0.61921172926216572 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_6:creationPose_knuckle_1_joint" -p "Finger__instance_6:creationPose_root_joint";
	rename -uid "E92D854B-4C00-EAFE-D575-3EA1F5652113";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.4083993136882782 0 1.1102230246251565e-16 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_6:creationPose_knuckle_2_joint" -p "Finger__instance_6:creationPose_knuckle_1_joint";
	rename -uid "38CD74CD-495B-8165-47BA-3891FA880037";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839931368827731 0 -1.1102230246251565e-16 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_6:creationPose_knuckle_3_joint" -p "Finger__instance_6:creationPose_knuckle_2_joint";
	rename -uid "EAC83DDB-4E88-1056-2E79-34B51EE288C0";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839934349060059 0 0 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Finger__instance_6:creationPose_end_joint" -p "Finger__instance_6:creationPose_knuckle_3_joint";
	rename -uid "A4DD2A1B-4C3B-8292-7A7F-CA91D9E40D07";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839931368827909 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode parentConstraint -n "Finger__instance_6:hook_parent_constraint" -p "Finger__instance_6:HOOK_IN";
	rename -uid "B2ED36FC-497E-70AE-9156-E295511595F2";
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
	setAttr ".tg[0].tot" -type "double3" -4 -6.7978657159107971 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "Finger__instance_6:hook_scale_constraint" -p "Finger__instance_6:HOOK_IN";
	rename -uid "D5314626-4C05-46F3-8111-FDBF74A8B54E";
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
createNode transform -n "Finger__instance_6:SETTINGS" -p "Finger__instance_6:module_grp";
	rename -uid "514369D7-40A6-11B6-8D81-D6914C743ED7";
	addAttr -ci true -sn "activeModule" -ln "activeModule" -min 0 -max 0 -en "None" 
		-at "enum";
	addAttr -ci true -sn "creationPoseWeight" -ln "creationPoseWeight" -dv 1 -at "float";
	setAttr ".v" no;
createNode locator -n "Finger__instance_6:SETTINGSShape" -p "Finger__instance_6:SETTINGS";
	rename -uid "315BFB5D-4736-4B9B-AC3E-3FB6F2DADF51";
	setAttr -k off ".v";
createNode transform -n "HingeJoint__instance_1:module_grp" -p "character_grp";
	rename -uid "0702D243-4569-65A3-259A-67863A2B94E1";
	addAttr -ci true -sn "hierarchicalScale" -ln "hierarchicalScale" -at "float";
createNode transform -n "HingeJoint__instance_1:HOOK_IN" -p "HingeJoint__instance_1:module_grp";
	rename -uid "6487A8BC-45AE-2C6D-8A18-1380893B3287";
createNode transform -n "HingeJoint__instance_1:blueprint_joints_grp" -p "HingeJoint__instance_1:HOOK_IN";
	rename -uid "F6807252-4AEF-FF2D-D589-E7BD93C5621D";
	addAttr -ci true -sn "controlModulesInstalled" -ln "controlModulesInstalled" -min 
		0 -max 1 -at "bool";
	setAttr ".ove" yes;
createNode joint -n "HingeJoint__instance_1:blueprint_root_joint" -p "HingeJoint__instance_1:blueprint_joints_grp";
	rename -uid "B14CE1E1-4304-59E7-5188-C6A5D05F0F1D";
	setAttr ".t" -type "double3" 0 6.7978657159107971 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999917171789 14.036522448795163 0 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 -50 0 ;
createNode joint -n "HingeJoint__instance_1:blueprint_hinge_joint" -p "HingeJoint__instance_1:blueprint_root_joint";
	rename -uid "F16881FE-4F5B-0EB8-1621-3CA3F5E05B6A";
	setAttr ".t" -type "double3" 2.0398736000061035 0 3.19268634797656e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 28.073044897590417 0 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 50 0 ;
createNode joint -n "HingeJoint__instance_1:blueprint_end_joint" -p "HingeJoint__instance_1:blueprint_hinge_joint";
	rename -uid "D94DA539-40DB-770C-AE79-AEA8457F044C";
	setAttr ".t" -type "double3" 2.0398736000061035 -1.7763568394002505e-15 4.4408920985006262e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode transform -n "HingeJoint__instance_1:creationPose_joints_grp" -p "HingeJoint__instance_1:HOOK_IN";
	rename -uid "356E272D-4B94-2185-D35A-31BE680C4A41";
createNode joint -n "HingeJoint__instance_1:creationPose_root_joint" -p "HingeJoint__instance_1:creationPose_joints_grp";
	rename -uid "3C26B5D3-456A-A989-3D2B-27975EB88D0A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 6.7978657159107971 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999917171789 14.036522448795163 0 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 -50 0 ;
createNode joint -n "HingeJoint__instance_1:creationPose_hinge_joint" -p "HingeJoint__instance_1:creationPose_root_joint";
	rename -uid "08668F3F-4900-72EA-F216-D0845E84D45F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.0398736000061035 0 3.19268634797656e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 28.073044897590417 0 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 50 0 ;
createNode joint -n "HingeJoint__instance_1:creationPose_end_joint" -p "HingeJoint__instance_1:creationPose_hinge_joint";
	rename -uid "8E9CD396-4779-1791-EBCC-9E8081CD617C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.0398736000061035 -1.7763568394002505e-15 4.4408920985006262e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode transform -n "HingeJoint__instance_1:SETTINGS" -p "HingeJoint__instance_1:module_grp";
	rename -uid "0CBCE025-4386-C7B4-FD83-C98DF365BC20";
	addAttr -ci true -sn "activeModule" -ln "activeModule" -min 0 -max 0 -en "None" 
		-at "enum";
	addAttr -ci true -sn "creationPoseWeight" -ln "creationPoseWeight" -dv 1 -at "float";
	setAttr ".v" no;
createNode locator -n "HingeJoint__instance_1:SETTINGSShape" -p "HingeJoint__instance_1:SETTINGS";
	rename -uid "887E0E51-4AF9-4F05-1C6D-20A166AA474D";
	setAttr -k off ".v";
createNode transform -n "RootTransform__instance_8:module_grp" -p "character_grp";
	rename -uid "6D655F31-4B3F-E526-AB98-029771A211FC";
	addAttr -ci true -sn "hierarchicalScale" -ln "hierarchicalScale" -at "float";
createNode transform -n "RootTransform__instance_8:HOOK_IN" -p "RootTransform__instance_8:module_grp";
	rename -uid "D3DE52DC-4E98-7A45-A8CC-05AAFF27711C";
createNode transform -n "RootTransform__instance_8:blueprint_joints_grp" -p "RootTransform__instance_8:HOOK_IN";
	rename -uid "85629E02-4529-4F4E-A0D5-B688753746F9";
	addAttr -ci true -sn "controlModulesInstalled" -ln "controlModulesInstalled" -min 
		0 -max 1 -at "bool";
	setAttr ".ove" yes;
createNode joint -n "RootTransform__instance_8:blueprint_joint" -p "RootTransform__instance_8:blueprint_joints_grp";
	rename -uid "915C1A52-4CC1-BE22-CCC1-27AC73057141";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".radi" 1.5;
createNode transform -n "RootTransform__instance_8:creationPose_joints_grp" -p "RootTransform__instance_8:HOOK_IN";
	rename -uid "CCA9D94A-4A90-350F-1215-BD8CE8D7F698";
createNode joint -n "RootTransform__instance_8:creationPose_joint" -p "RootTransform__instance_8:creationPose_joints_grp";
	rename -uid "764244D6-43E5-EDC8-2722-F2AF33416D03";
	setAttr ".v" no;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".radi" 1.5;
createNode transform -n "RootTransform__instance_8:SETTINGS" -p "RootTransform__instance_8:module_grp";
	rename -uid "7BBC121B-4FB1-0042-944F-EFA0ED5F10D5";
	addAttr -ci true -sn "activeModule" -ln "activeModule" -min 0 -max 0 -en "None" 
		-at "enum";
	addAttr -ci true -sn "creationPoseWeight" -ln "creationPoseWeight" -dv 1 -at "float";
	setAttr ".v" no;
createNode locator -n "RootTransform__instance_8:SETTINGSShape" -p "RootTransform__instance_8:SETTINGS";
	rename -uid "C2E4E078-42D0-5E7B-8E3C-11A23F33C65C";
	setAttr -k off ".v";
createNode transform -n "SingleOrientableJoint__instance_2:module_grp" -p "character_grp";
	rename -uid "B660F9B5-4C16-3F7A-055F-47BAB8EAEE18";
	addAttr -ci true -sn "hierarchicalScale" -ln "hierarchicalScale" -at "float";
createNode transform -n "SingleOrientableJoint__instance_2:HOOK_IN" -p "SingleOrientableJoint__instance_2:module_grp";
	rename -uid "2EB9E691-461E-8A4B-067F-19B44236A9AB";
createNode transform -n "SingleOrientableJoint__instance_2:blueprint_joints_grp" 
		-p "SingleOrientableJoint__instance_2:HOOK_IN";
	rename -uid "85BBE7A8-484E-BD23-3B7A-D9864153F3B4";
	addAttr -ci true -sn "controlModulesInstalled" -ln "controlModulesInstalled" -min 
		0 -max 1 -at "bool";
	setAttr ".ove" yes;
createNode joint -n "SingleOrientableJoint__instance_2:blueprint_joint" -p "SingleOrientableJoint__instance_2:blueprint_joints_grp";
	rename -uid "16AD95DA-4383-1356-8945-D2831D840415";
	setAttr ".t" -type "double3" 4 6.7978657159107971 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".radi" 1.5;
createNode transform -n "SingleOrientableJoint__instance_2:creationPose_joints_grp" 
		-p "SingleOrientableJoint__instance_2:HOOK_IN";
	rename -uid "3AB1EAA1-487B-3992-E3D9-879587E13A37";
createNode joint -n "SingleOrientableJoint__instance_2:creationPose_joint" -p "SingleOrientableJoint__instance_2:creationPose_joints_grp";
	rename -uid "EFABE426-407E-19E3-C6A0-EF9DA2C0712C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 4 6.7978657159107971 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".radi" 1.5;
createNode parentConstraint -n "SingleOrientableJoint__instance_2:hook_parent_constraint" 
		-p "SingleOrientableJoint__instance_2:HOOK_IN";
	rename -uid "92595240-4F3F-0DAF-E39E-FEBD4B662185";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_end_jointW0" -dv 1 -min 
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
	setAttr ".tg[0].tot" -type "double3" -3.8397527686013166 6.7978657159107989 -0.95995795869343847 ;
	setAttr ".tg[0].tor" -type "double3" -179.99999914622532 -14.036522448795253 -2.0707481462672125e-07 ;
	setAttr ".lr" -type "double3" 5.02239897099144e-08 -6.2730610853659912e-15 -2.0089183383406908e-07 ;
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -1.7763568394002505e-15 3.3306690738754696e-16 ;
	setAttr ".rsrr" -type "double3" 5.02239897099144e-08 -6.2730610853659912e-15 -2.0089183383406908e-07 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "SingleOrientableJoint__instance_2:hook_scale_constraint" 
		-p "SingleOrientableJoint__instance_2:HOOK_IN";
	rename -uid "944F1D4D-4E97-FD80-7890-D3BB27C34FAD";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_end_jointW0" -dv 1 -min 
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
createNode transform -n "SingleOrientableJoint__instance_2:SETTINGS" -p "SingleOrientableJoint__instance_2:module_grp";
	rename -uid "DE6EC566-4C07-BA48-F377-60812C820C08";
	addAttr -ci true -sn "activeModule" -ln "activeModule" -min 0 -max 0 -en "None" 
		-at "enum";
	addAttr -ci true -sn "creationPoseWeight" -ln "creationPoseWeight" -dv 1 -at "float";
	setAttr ".v" no;
createNode locator -n "SingleOrientableJoint__instance_2:SETTINGSShape" -p "SingleOrientableJoint__instance_2:SETTINGS";
	rename -uid "4FF301D2-48E3-56C9-E894-C5BC22257E39";
	setAttr -k off ".v";
createNode transform -n "Thumb__instance_7:module_grp" -p "character_grp";
	rename -uid "0A48D591-4212-1D16-81C2-C981083ADAEF";
	addAttr -ci true -sn "hierarchicalScale" -ln "hierarchicalScale" -at "float";
createNode transform -n "Thumb__instance_7:HOOK_IN" -p "Thumb__instance_7:module_grp";
	rename -uid "49B2D8F0-4D81-3A73-CD30-6FB097BD5B78";
createNode transform -n "Thumb__instance_7:blueprint_joints_grp" -p "Thumb__instance_7:HOOK_IN";
	rename -uid "2EC364B1-4C36-49DA-64B3-7E896FE825B0";
	addAttr -ci true -sn "controlModulesInstalled" -ln "controlModulesInstalled" -min 
		0 -max 1 -at "bool";
	setAttr ".ove" yes;
createNode joint -n "Thumb__instance_7:blueprint_root_joint" -p "Thumb__instance_7:blueprint_joints_grp";
	rename -uid "05811BB6-4CF1-E569-6ECB-668731FA37DE";
	setAttr ".t" -type "double3" 5 6.7978657159107971 1.0276110500249358 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -45.000000000000014 0 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Thumb__instance_7:blueprint_knuckle_1_joint" -p "Thumb__instance_7:blueprint_root_joint";
	rename -uid "0DD997D9-4CF3-F257-7D6F-3BB32C75C46F";
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 1.2722218725854067e-14 0 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Thumb__instance_7:blueprint_knuckle_2_joint" -p "Thumb__instance_7:blueprint_knuckle_1_joint";
	rename -uid "0783847E-4B73-D00B-05DB-74BB0D335A64";
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 1.2722218725854067e-14 0 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Thumb__instance_7:blueprint_end_joint" -p "Thumb__instance_7:blueprint_knuckle_2_joint";
	rename -uid "284201A7-4D7A-82B0-D67E-E69ABF82B8D5";
	setAttr ".t" -type "double3" 0.40839934349060059 -8.8817841970012523e-16 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode transform -n "Thumb__instance_7:creationPose_joints_grp" -p "Thumb__instance_7:HOOK_IN";
	rename -uid "187AE0CD-4460-C70F-AC5D-C0A228FE04E0";
createNode joint -n "Thumb__instance_7:creationPose_root_joint" -p "Thumb__instance_7:creationPose_joints_grp";
	rename -uid "1CE51585-466D-546E-8615-6CBF211D5F40";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 5 6.7978657159107971 1.0276110500249358 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -45.000000000000014 0 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Thumb__instance_7:creationPose_knuckle_1_joint" -p "Thumb__instance_7:creationPose_root_joint";
	rename -uid "EFCF5B82-4F9F-2C4B-ADB6-CE8E3D75636C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839931368827909 0 0 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Thumb__instance_7:creationPose_knuckle_2_joint" -p "Thumb__instance_7:creationPose_knuckle_1_joint";
	rename -uid "2D8C500B-46BB-EE03-10B6-778A40B5B2AB";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839931368827731 0 0 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 -50 ;
createNode joint -n "Thumb__instance_7:creationPose_end_joint" -p "Thumb__instance_7:creationPose_knuckle_2_joint";
	rename -uid "090C7B45-44B0-7940-BA77-009DF7768AFA";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.40839934349060059 -8.8817841970012523e-16 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".ssc" no;
createNode parentConstraint -n "Thumb__instance_7:hook_parent_constraint" -p "Thumb__instance_7:HOOK_IN";
	rename -uid "0F030E3F-44BB-3398-6241-40BDB48F3BE8";
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
	setAttr ".tg[0].tot" -type "double3" -4 -6.7978657159107962 -3.3306690738754696e-16 ;
	setAttr ".rst" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "Thumb__instance_7:hook_scale_constraint" -p "Thumb__instance_7:HOOK_IN";
	rename -uid "F175ACEB-4D43-67A3-659E-92A3937746E2";
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
createNode transform -n "Thumb__instance_7:SETTINGS" -p "Thumb__instance_7:module_grp";
	rename -uid "A666538B-42CE-D3A9-8370-12BF6E647275";
	addAttr -ci true -sn "activeModule" -ln "activeModule" -min 0 -max 0 -en "None" 
		-at "enum";
	addAttr -ci true -sn "creationPoseWeight" -ln "creationPoseWeight" -dv 1 -at "float";
	setAttr ".v" no;
createNode locator -n "Thumb__instance_7:SETTINGSShape" -p "Thumb__instance_7:SETTINGS";
	rename -uid "4BFFA258-431C-6B26-FDC0-95B8BA7F76EE";
	setAttr -k off ".v";
createNode transform -n "non_blueprint_grp" -p "character_grp";
	rename -uid "C91FA923-4AFD-F7D4-720A-D19162CFF397";
	addAttr -ci true -k true -sn "display" -ln "display" -dv 1 -min 0 -max 1 -at "bool";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" 2.6011620467898346 3.8989330004069438 -0.21455872669858422 ;
	setAttr ".sp" -type "double3" 2.6011620467898346 3.8989330004069438 -0.21455872669858422 ;
	setAttr -k on ".display";
createNode transform -n "group" -p "non_blueprint_grp";
	rename -uid "3B10469A-4377-C22C-2893-E8B1ED60938C";
	setAttr ".rp" -type "double3" 0.5 0.11492803692817688 0.11492803692817688 ;
	setAttr ".sp" -type "double3" 0.5 0.11492803692817688 0.11492803692817688 ;
createNode transform -n "blueprint_root_joint_geoAttach_parentGrp1" -p "non_blueprint_grp";
	rename -uid "39D568CC-4213-8C9A-C00A-56998093AAEF";
createNode parentConstraint -n "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint" 
		-p "blueprint_root_joint_geoAttach_parentGrp1";
	rename -uid "B26F0036-4226-44E7-7E94-78AB7811DF9E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_root_jointW0" -dv 1 -min 
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
	setAttr ".lr" -type "double3" 179.99999917171789 14.036522448795163 0 ;
	setAttr ".rst" -type "double3" 0 6.7978657159107971 0 ;
	setAttr ".rsrr" -type "double3" 179.99999917171789 14.036522448795163 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "blueprint_root_joint_geoAttach_parentGrp1_scaleConstraint" 
		-p "blueprint_root_joint_geoAttach_parentGrp1";
	rename -uid "36A29838-4EA0-2291-3D3D-CAB67F7A1071";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_root_jointW0" -dv 1 -min 
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
createNode transform -n "blueprint_root_joint_geoAttach_scaleGrp1" -p "blueprint_root_joint_geoAttach_parentGrp1";
	rename -uid "0D2584E5-4527-E313-9A97-E3979526F3AA";
createNode transform -n "pCylinder1" -p "blueprint_root_joint_geoAttach_scaleGrp1";
	rename -uid "1AD511C7-4AF6-D3BA-7F12-17968EE36995";
	setAttr ".t" -type "double3" 0.99985860331461762 -1.5194703273380128e-07 0.016815064905456076 ;
	setAttr ".r" -type "double3" 179.03652244879515 0 90.000000000000028 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 8.8817841970012494e-16 -0.99999998651501609 2.0953695976236886e-09 ;
	setAttr ".rpt" -type "double3" -0.99985860331461862 0.99999998651501654 -0.016815067000827903 ;
	setAttr ".sp" -type "double3" 8.8817841970012523e-16 -0.99999998651501609 2.095369597623689e-09 ;
	setAttr ".spt" -type "double3" -2.9582283945787938e-31 0 -4.1359030627651375e-25 ;
createNode mesh -n "pCylinderShape1" -p "pCylinder1";
	rename -uid "66B6ACF0-4050-4DDC-FCE1-918E53F5C69C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.8403962254524231 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 11 ".pt";
	setAttr ".pt[10]" -type "float3" -0.33412361 0 0.24275494 ;
	setAttr ".pt[11]" -type "float3" -0.12762381 0 0.39278582 ;
	setAttr ".pt[12]" -type "float3" 0.12762389 0 0.39278573 ;
	setAttr ".pt[13]" -type "float3" 0.33412361 0 0.24275482 ;
	setAttr ".pt[14]" -type "float3" 0.41299927 0 -4.9233343e-08 ;
	setAttr ".pt[15]" -type "float3" 0.33412358 0 -0.242755 ;
	setAttr ".pt[16]" -type "float3" 0.12762377 0 -0.39278582 ;
	setAttr ".pt[17]" -type "float3" -0.12762389 0 -0.39278579 ;
	setAttr ".pt[18]" -type "float3" -0.33412361 0 -0.24275488 ;
	setAttr ".pt[19]" -type "float3" -0.41299927 0 -2.4616671e-08 ;
	setAttr ".pt[21]" -type "float3" -2.4616671e-08 0 -2.4616671e-08 ;
createNode transform -n "blueprint_hinge_joint_geoAttach_parentGrp1" -p "non_blueprint_grp";
	rename -uid "48901E6D-4B0A-FCEB-D61E-A4958BAF9612";
createNode parentConstraint -n "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint" 
		-p "blueprint_hinge_joint_geoAttach_parentGrp1";
	rename -uid "30834844-4F8E-4D25-A6DF-28B53FFD1497";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_hinge_jointW0" -dv 1 -min 
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
	setAttr ".lr" -type "double3" 179.99999917171789 -14.036522448795253 4.01783667668137e-07 ;
	setAttr ".rst" -type "double3" 1.9789656653013863 6.7978657159107971 -0.4947516544288682 ;
	setAttr ".rsrr" -type "double3" 179.99999917171789 -14.036522448795253 4.01783667668137e-07 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "blueprint_hinge_joint_geoAttach_parentGrp1_scaleConstraint" 
		-p "blueprint_hinge_joint_geoAttach_parentGrp1";
	rename -uid "3017F1DF-4EC7-7C46-4E37-5B87500A7946";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "blueprint_hinge_jointW0" -dv 1 -min 
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
createNode transform -n "blueprint_hinge_joint_geoAttach_scaleGrp1" -p "blueprint_hinge_joint_geoAttach_parentGrp1";
	rename -uid "6A972A14-4584-F874-F168-ED8A5708E2D9";
createNode transform -n "pCylinder2" -p "blueprint_hinge_joint_geoAttach_scaleGrp1";
	rename -uid "FBB75ACA-47FC-429A-42AC-88B8D9BC7F3C";
	setAttr ".t" -type "double3" 1.0593353550364668 -1.5144640652664521e-07 -0.017815308759522752 ;
	setAttr ".r" -type "double3" -179.03652244879524 0 90 ;
	setAttr ".s" -type "double3" 0.58016437503349572 1.0594851747259979 0.58016437503349583 ;
	setAttr ".rp" -type "double3" 0 -1.0594851747259979 0 ;
	setAttr ".rpt" -type "double3" -1.0593353813565298 1.0594851747259979 0.017815309999927087 ;
	setAttr ".sp" -type "double3" 0 -1 0 ;
	setAttr ".spt" -type "double3" 0 -0.059485174725997916 0 ;
createNode mesh -n "pCylinderShape2" -p "pCylinder2";
	rename -uid "99F851D2-4CD5-FBBF-F674-4EBAA693219C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.8403962254524231 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 11 ".pt";
	setAttr ".pt[10]" -type "float3" -0.24426898 0 0.17747174 ;
	setAttr ".pt[11]" -type "float3" -0.093302436 0 0.28715533 ;
	setAttr ".pt[12]" -type "float3" 0.093302451 0 0.28715524 ;
	setAttr ".pt[13]" -type "float3" 0.24426898 0 0.1774717 ;
	setAttr ".pt[14]" -type "float3" 0.30193296 0 -3.5993207e-08 ;
	setAttr ".pt[15]" -type "float3" 0.24426895 0 -0.1774718 ;
	setAttr ".pt[16]" -type "float3" 0.093302406 0 -0.28715533 ;
	setAttr ".pt[17]" -type "float3" -0.093302451 0 -0.28715527 ;
	setAttr ".pt[18]" -type "float3" -0.24426895 0 -0.17747168 ;
	setAttr ".pt[19]" -type "float3" -0.30193296 0 -1.7996603e-08 ;
	setAttr ".pt[21]" -type "float3" -1.7996602e-08 0 -1.7996603e-08 ;
createNode transform -n "blueprint_joint_geoAttach_parentGrp1" -p "non_blueprint_grp";
	rename -uid "AD1A8DD0-4C5C-A019-0113-64BEF026DAA3";
createNode parentConstraint -n "blueprint_joint_geoAttach_parentGrp1_parentConstraint" 
		-p "blueprint_joint_geoAttach_parentGrp1";
	rename -uid "0F8A718B-4F1F-0DA9-B09C-78915E7123BB";
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
	setAttr ".rst" -type "double3" 4 6.7978657159107954 3.3306690738754696e-16 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "blueprint_joint_geoAttach_parentGrp1_scaleConstraint" 
		-p "blueprint_joint_geoAttach_parentGrp1";
	rename -uid "0DDC3029-4F35-8CA6-496C-10BE80A2CD37";
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
createNode transform -n "pCube1" -p "blueprint_joint_geoAttach_parentGrp1";
	rename -uid "13A6617B-4FD3-6925-0A70-84B518680473";
	setAttr ".t" -type "double3" 0.49118315636020604 1.5170395073482723e-07 0.053678229451179171 ;
	setAttr ".s" -type "double3" 1.9308984172125987 0.938022997408266 1.174218582760755 ;
	setAttr ".rp" -type "double3" -0.96544920860629935 0 0 ;
	setAttr ".sp" -type "double3" -0.5 0 0 ;
	setAttr ".spt" -type "double3" -0.46544920860629935 0 0 ;
createNode mesh -n "pCubeShape1" -p "pCube1";
	rename -uid "DCFEC907-46A9-E20B-E301-26BCB9BE077C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.75 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt";
	setAttr ".pt[1]" -type "float3" 0 0.17079718 0.31862959 ;
	setAttr ".pt[3]" -type "float3" 0 -0.17079718 0.31862959 ;
	setAttr ".pt[5]" -type "float3" 0 -0.17079718 -0.31862959 ;
	setAttr ".pt[7]" -type "float3" 0 0.17079718 -0.31862959 ;
createNode container -n "character_container";
	rename -uid "6DB3CBF2-429D-065F-8FD1-EF9EFEC68CE6";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 18 ".boc";
	setAttr -s 17 ".ish[1:17]" yes yes yes yes yes yes yes yes yes yes 
		yes yes yes yes yes yes yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:23:24";
	setAttr ".aal" -type "attributeAlias" {"animControlVis","borderConnections[0]","instance_1_creationPoseWeight"
		,"borderConnections[10]","instance_8_activeModule","borderConnections[11]","instance_8_creationPoseWeight"
		,"borderConnections[12]","instance_2_activeModule","borderConnections[13]","instance_2_creationPoseWeight"
		,"borderConnections[14]","instance_7_activeModule","borderConnections[15]","instance_7_creationPoseWeight"
		,"borderConnections[16]","displayNonBlueprintNodes","borderConnections[17]","instance_3_activeModule"
		,"borderConnections[1]","instance_3_creationPoseWeight","borderConnections[2]","instance_4_activeModule"
		,"borderConnections[3]","instance_4_creationPoseWeight","borderConnections[4]","instance_5_activeModule"
		,"borderConnections[5]","instance_5_creationPoseWeight","borderConnections[6]","instance_6_activeModule"
		,"borderConnections[7]","instance_6_creationPoseWeight","borderConnections[8]","instance_1_activeModule"
		,"borderConnections[9]"} ;
createNode container -n "non_blueprint_container";
	rename -uid "FD3C46A2-4ABC-A0B9-22FD-5CB79F1D2E63";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:23:24";
	setAttr ".aal" -type "attributeAlias" {"displayNonBlueprintNodes","borderConnections[0]"
		} ;
createNode container -n "Thumb__instance_7:module_container";
	rename -uid "F153F127-4072-EEA8-0B89-BD8B1AD33450";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 2 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
	setAttr ".aal" -type "attributeAlias" {"activeModule","borderConnections[0]","creationPoseWeight"
		,"borderConnections[1]"} ;
createNode container -n "SingleOrientableJoint__instance_2:module_container";
	rename -uid "88A12D32-4723-58D5-DA9C-A090C91041F2";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 2 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
	setAttr ".aal" -type "attributeAlias" {"activeModule","borderConnections[0]","creationPoseWeight"
		,"borderConnections[1]"} ;
createNode container -n "HingeJoint__instance_1:module_container";
	rename -uid "B9F1509F-4A8A-D657-891E-0BAD7B252B15";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 2 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
	setAttr ".aal" -type "attributeAlias" {"activeModule","borderConnections[0]","creationPoseWeight"
		,"borderConnections[1]"} ;
createNode container -n "RootTransform__instance_8:module_container";
	rename -uid "892D05B6-4F85-78BC-44D3-68831C4550D6";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 2 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
	setAttr ".aal" -type "attributeAlias" {"activeModule","borderConnections[0]","creationPoseWeight"
		,"borderConnections[1]"} ;
createNode reverse -n "reverse_moduleMaintenanceVisibility";
	rename -uid "92D37B4A-4302-1167-2997-1988F43FE501";
createNode hyperLayout -n "hyperLayout131";
	rename -uid "35D31561-4829-82F6-C47A-34BEB814C479";
	setAttr ".ihi" 0;
	setAttr -s 12 ".hyp";
createNode container -n "Finger__instance_3:module_container";
	rename -uid "6E98FD13-4703-E6EA-278F-44BD798B50F3";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 2 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
	setAttr ".aal" -type "attributeAlias" {"activeModule","borderConnections[0]","creationPoseWeight"
		,"borderConnections[1]"} ;
createNode container -n "Finger__instance_5:module_container";
	rename -uid "F42F917B-447F-8861-6209-DCA30D462532";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 2 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
	setAttr ".aal" -type "attributeAlias" {"activeModule","borderConnections[0]","creationPoseWeight"
		,"borderConnections[1]"} ;
createNode container -n "Finger__instance_6:module_container";
	rename -uid "A177096E-4053-67DF-8A83-A6951B2B7CF5";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 2 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
	setAttr ".aal" -type "attributeAlias" {"activeModule","borderConnections[0]","creationPoseWeight"
		,"borderConnections[1]"} ;
createNode container -n "Finger__instance_4:module_container";
	rename -uid "B033D11B-4A90-6F4F-366B-B8BB8BF602AE";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 2 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
	setAttr ".aal" -type "attributeAlias" {"activeModule","borderConnections[0]","creationPoseWeight"
		,"borderConnections[1]"} ;
createNode multiplyDivide -n "moduleVisibilityMultiply";
	rename -uid "2EFCC496-48B3-0D4A-26D7-2CA90ECC12F1";
createNode hyperLayout -n "hyperLayout132";
	rename -uid "5E94F54C-45A3-EBEA-7AF2-7F90D19E1E23";
	setAttr ".ihi" 0;
	setAttr -s 25 ".hyp";
createNode multiplyDivide -n "blueprint_root_joint_geoAttach_scaleGrp1_scaleFactor";
	rename -uid "8745AA0C-415A-D779-C453-2E9183D1B71D";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 2.0398736 1 1 ;
createNode multiplyDivide -n "blueprint_hinge_joint_geoAttach_scaleGrp1_scaleFactor";
	rename -uid "3A231D20-4C12-93C5-8C28-A7A3BDBE6F18";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 2.0398736 1 1 ;
createNode multiplyDivide -n "non_blueprint_visibilityMultiply";
	rename -uid "FB86CA3E-41E5-4DCB-36F3-B993C336B722";
createNode polyCylinder -n "polyCylinder1";
	rename -uid "D558B327-40F0-6C31-6274-E6AF5C049CE6";
	setAttr ".sa" 10;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyCylinder -n "polyCylinder2";
	rename -uid "D31B86CE-43AF-72A1-3762-A2A3DB521796";
	setAttr ".sa" 10;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyCube -n "polyCube1";
	rename -uid "450A4529-41E4-1EFD-4973-65833429D684";
	setAttr ".cuv" 4;
createNode unitConversion -n "unitConversion21";
	rename -uid "B3A6E337-4560-D65B-8489-B2ACB94AD5B7";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "HingeJoint__instance_1:blueprint_root_joint_addRotations";
	rename -uid "E4DF5BEB-4932-2530-799E-42B1EE0C6AA0";
createNode multiplyDivide -n "HingeJoint__instance_1:blueprint_root_joint_dummyRotationsMultiply";
	rename -uid "38F09A97-4A0D-C789-AB4A-9BB4A92E524D";
createNode unitConversion -n "unitConversion22";
	rename -uid "66EB9EDB-4396-1762-BB0B-B7ABDCB55106";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "HingeJoint__instance_1:blueprint_hinge_joint_addRotations";
	rename -uid "20FFFB10-41A1-7E69-F3E9-DB9C351D3604";
createNode multiplyDivide -n "HingeJoint__instance_1:blueprint_hinge_joint_dummyRotationsMultiply";
	rename -uid "44DF7EFB-47FB-EFA7-59CE-A394D51438B3";
createNode plusMinusAverage -n "HingeJoint__instance_1:blueprint_hinge_joint_addTx";
	rename -uid "88157AE1-4608-BA54-3C68-5BBE2D544840";
createNode multiplyDivide -n "HingeJoint__instance_1:blueprint_hinge_joint_original_Tx";
	rename -uid "E60CFB0D-4277-09ED-8AE1-7EB6EF33192A";
	setAttr ".i1" -type "float3" 2.0398736 0 0 ;
	setAttr -l on ".i1x";
createNode unitConversion -n "unitConversion23";
	rename -uid "2222405A-4D7C-9042-516C-E69B9417B661";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "HingeJoint__instance_1:blueprint_end_joint_addRotations";
	rename -uid "3BF30AAE-441B-8B07-E8C2-F098098D51ED";
createNode multiplyDivide -n "HingeJoint__instance_1:blueprint_end_joint_dummyRotationsMultiply";
	rename -uid "41C06F94-4D9B-0B4A-BEA3-349D8016B14F";
createNode plusMinusAverage -n "HingeJoint__instance_1:blueprint_end_joint_addTx";
	rename -uid "129CB6C5-4627-85F2-9D05-7781D38C67CE";
createNode multiplyDivide -n "HingeJoint__instance_1:blueprint_end_joint_original_Tx";
	rename -uid "82D1CE4B-4033-4FB4-DD75-76874064555C";
	setAttr ".i1" -type "float3" 2.0398736 0 0 ;
	setAttr -l on ".i1x";
createNode unitConversion -n "unitConversion25";
	rename -uid "F3BEFFF3-4985-7DD0-376B-0984353E669C";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "SingleOrientableJoint__instance_2:blueprint_joint_addRotations";
	rename -uid "5B2BBAA6-4DD3-7B46-17E7-89982E8A541C";
createNode multiplyDivide -n "SingleOrientableJoint__instance_2:blueprint_joint_dummyRotationsMultiply";
	rename -uid "31634DE4-4A92-E2A5-2E8E-D58FF4B03BF5";
createNode container -n "Thumb__instance_7:blueprint_container";
	rename -uid "863C1D9E-40A1-BCD8-E066-E09ED49083A6";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
createNode hyperLayout -n "hyperLayout130";
	rename -uid "54CF3053-42DD-9A49-17CC-C3A3C90DF062";
	setAttr ".ihi" 0;
	setAttr -s 7 ".hyp";
createNode hyperLayout -n "hyperLayout129";
	rename -uid "E98BE323-41D1-8E76-867D-FB88DAEBDD51";
	setAttr ".ihi" 0;
	setAttr -s 28 ".hyp";
createNode multiplyDivide -n "Thumb__instance_7:blueprint_knuckle_1_joint_original_Tx";
	rename -uid "57670D10-4829-48F5-30DF-9A9E8B513FC5";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode plusMinusAverage -n "Thumb__instance_7:blueprint_knuckle_2_joint_addRotations";
	rename -uid "737B8480-4FDE-5A0D-455F-A28B1D6381CD";
createNode plusMinusAverage -n "Thumb__instance_7:blueprint_knuckle_1_joint_addRotations";
	rename -uid "62CC3710-40EF-FC5B-FAE9-BE8167B4DD1B";
createNode multiplyDivide -n "Thumb__instance_7:blueprint_knuckle_1_joint_dummyRotationsMultiply";
	rename -uid "CB773E26-4253-489C-4DEB-2CA28B38BEE5";
createNode plusMinusAverage -n "Thumb__instance_7:blueprint_end_joint_addRotations";
	rename -uid "6D90699E-42E0-9358-B478-0CB33DB3F572";
createNode multiplyDivide -n "Thumb__instance_7:blueprint_root_joint_dummyRotationsMultiply";
	rename -uid "C52183EF-4BF3-75D5-C018-FD9E590F5B16";
createNode multiplyDivide -n "Thumb__instance_7:blueprint_knuckle_2_joint_dummyRotationsMultiply";
	rename -uid "FA9E5F82-4180-8C98-5BF7-7999EFAF7836";
createNode multiplyDivide -n "Thumb__instance_7:blueprint_knuckle_2_joint_original_Tx";
	rename -uid "6B8F32EA-4858-5DCE-4A47-528040F196C8";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode plusMinusAverage -n "Thumb__instance_7:blueprint_end_joint_addTx";
	rename -uid "7718C451-4A22-CF72-1775-CDA343593295";
createNode multiplyDivide -n "Thumb__instance_7:blueprint_end_joint_original_Tx";
	rename -uid "9509BAD0-40CF-C634-933F-E59D164F097F";
	setAttr ".i1" -type "float3" 0.40839934 0 0 ;
	setAttr -l on ".i1x";
createNode plusMinusAverage -n "Thumb__instance_7:blueprint_root_joint_addRotations";
	rename -uid "FF1A0368-475D-333A-49E6-39B738E91F9D";
createNode plusMinusAverage -n "Thumb__instance_7:blueprint_knuckle_2_joint_addTx";
	rename -uid "A7C56F73-4CCB-B6D6-5127-DC8ED35BE618";
createNode multiplyDivide -n "Thumb__instance_7:blueprint_end_joint_dummyRotationsMultiply";
	rename -uid "054DAD6B-4A65-1426-E1E2-6D8392EA8E4F";
createNode plusMinusAverage -n "Thumb__instance_7:blueprint_knuckle_1_joint_addTx";
	rename -uid "06FC255A-46DA-1DD1-26AB-FBB88A36DA69";
createNode unitConversion -n "unitConversion26";
	rename -uid "DF749B9A-46F8-AA03-3F30-989F9EC1CE04";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion27";
	rename -uid "2E379AC9-4E5F-933B-9B4A-A5812130CAD9";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion28";
	rename -uid "AD52C07B-4716-5DC9-32D6-B095E4B7FACA";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion29";
	rename -uid "11432C94-4DDE-9E31-A5C3-50A1E17DB6DA";
	setAttr ".cf" 0.017453292519943295;
createNode container -n "SingleOrientableJoint__instance_2:blueprint_container";
	rename -uid "433C6379-4763-0A62-B2CD-FA9147F62634";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
createNode hyperLayout -n "hyperLayout128";
	rename -uid "71AD71BB-4678-9ACB-2704-1A84702A5ABE";
	setAttr ".ihi" 0;
	setAttr -s 7 ".hyp";
createNode hyperLayout -n "hyperLayout127";
	rename -uid "D7ECBBC3-40CC-FE9C-C21B-67A67E652EEA";
	setAttr ".ihi" 0;
	setAttr -s 7 ".hyp";
createNode hyperLayout -n "hyperLayout124";
	rename -uid "CED13356-469F-AFEB-0941-74ABF52F93BE";
	setAttr ".ihi" 0;
	setAttr -s 5 ".hyp";
createNode container -n "HingeJoint__instance_1:blueprint_container";
	rename -uid "0E050B8E-409A-C2C5-6ED6-3E9743EC833E";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
createNode hyperLayout -n "hyperLayout123";
	rename -uid "EEE647D0-45D5-C2E0-10DF-3F813EF5B2E1";
	setAttr ".ihi" 0;
	setAttr -s 21 ".hyp";
createNode container -n "RootTransform__instance_8:blueprint_container";
	rename -uid "C3ADE929-4A8C-1D32-A268-3AACAA7E200A";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
createNode hyperLayout -n "hyperLayout126";
	rename -uid "DCB430FD-4CE2-E77B-4433-ACA0433DB274";
	setAttr ".ihi" 0;
	setAttr -s 5 ".hyp";
createNode hyperLayout -n "hyperLayout125";
	rename -uid "1FC8D631-45B8-06FE-34C3-418A37AF0137";
	setAttr ".ihi" 0;
	setAttr -s 11 ".hyp";
createNode unitConversion -n "unitConversion24";
	rename -uid "25C9C9A5-49CD-3A15-4921-4590C698562F";
	setAttr ".cf" 0.017453292519943295;
createNode multiplyDivide -n "RootTransform__instance_8:blueprint_joint_dummyRotationsMultiply";
	rename -uid "27E846AB-464A-ACAA-981C-88983C028277";
createNode plusMinusAverage -n "RootTransform__instance_8:blueprint_joint_addTranslate";
	rename -uid "98440982-44E9-2FB7-4AB5-0A9524FD1FA3";
createNode plusMinusAverage -n "RootTransform__instance_8:blueprint_joint_addRotations";
	rename -uid "CAF9FB15-4E39-AB76-7298-D9B2D29C7C6A";
createNode multiplyDivide -n "RootTransform__instance_8:blueprint_joint_original_Translate";
	rename -uid "B6BD8111-4150-A3C6-75B0-229C2049F8AF";
createNode plusMinusAverage -n "RootTransform__instance_8:blueprint_joint_addScale";
	rename -uid "45BE4F02-4D20-5008-A91A-14AD81A3F69C";
createNode multiplyDivide -n "RootTransform__instance_8:blueprint_joint_original_Scale";
	rename -uid "425502D6-49B9-B757-485E-F0B302A80F5B";
	setAttr ".i1" -type "float3" 1 1 1 ;
createNode hyperLayout -n "hyperLayout116";
	rename -uid "92D3B442-4ED6-1CE7-B888-2C83F9D4EC1B";
	setAttr ".ihi" 0;
	setAttr -s 7 ".hyp";
createNode container -n "Finger__instance_3:blueprint_container";
	rename -uid "A96D88D0-48EF-8F92-73F7-A0A76D48745C";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
createNode plusMinusAverage -n "Finger__instance_3:blueprint_root_joint_addRotations";
	rename -uid "C6E68805-4D2A-7915-0773-95ABC69F4657";
createNode multiplyDivide -n "Finger__instance_3:blueprint_knuckle_2_joint_original_Tx";
	rename -uid "A8AAA847-4F28-E065-95EF-9B933797FD81";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode multiplyDivide -n "Finger__instance_3:blueprint_end_joint_original_Tx";
	rename -uid "9BE3E0D5-4222-C749-B340-5A8B6256FB32";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode plusMinusAverage -n "Finger__instance_3:blueprint_knuckle_3_joint_addRotations";
	rename -uid "72E0304C-4AC0-DA86-078D-3087A01D1FF4";
createNode plusMinusAverage -n "Finger__instance_3:blueprint_knuckle_1_joint_addRotations";
	rename -uid "81309DB8-4640-521A-9737-A08CE92AE9A4";
createNode multiplyDivide -n "Finger__instance_3:blueprint_knuckle_1_joint_original_Tx";
	rename -uid "DD8532B6-4919-E7BE-02ED-38BAA7CBD227";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode multiplyDivide -n "Finger__instance_3:blueprint_knuckle_2_joint_dummyRotationsMultiply";
	rename -uid "F81F6971-4442-D5F4-50D6-CEAE207B69FB";
createNode plusMinusAverage -n "Finger__instance_3:blueprint_knuckle_3_joint_addTx";
	rename -uid "8241162C-48FA-AF87-BDF7-A593969FACE5";
createNode multiplyDivide -n "Finger__instance_3:blueprint_root_joint_dummyRotationsMultiply";
	rename -uid "B64A4878-4971-93F4-F4AE-1683DC500BC9";
createNode multiplyDivide -n "Finger__instance_3:blueprint_knuckle_3_joint_dummyRotationsMultiply";
	rename -uid "D65B5167-44FC-2E19-9E8A-C8B91C621840";
createNode multiplyDivide -n "Finger__instance_3:blueprint_knuckle_1_joint_dummyRotationsMultiply";
	rename -uid "BD7285E2-4698-635C-183D-918C86EA4A04";
createNode plusMinusAverage -n "Finger__instance_3:blueprint_end_joint_addRotations";
	rename -uid "B684DC73-4F6B-3885-09B1-0089DEB6E1EE";
createNode plusMinusAverage -n "Finger__instance_3:blueprint_knuckle_1_joint_addTx";
	rename -uid "C05AFD71-48B1-BE4D-786E-19BDEA187ADC";
createNode plusMinusAverage -n "Finger__instance_3:blueprint_knuckle_2_joint_addRotations";
	rename -uid "78852A66-417F-5B62-A0F1-3B958B744C03";
createNode plusMinusAverage -n "Finger__instance_3:blueprint_knuckle_2_joint_addTx";
	rename -uid "7083CE33-4281-B292-E72F-5192F46E1B1A";
createNode multiplyDivide -n "Finger__instance_3:blueprint_end_joint_dummyRotationsMultiply";
	rename -uid "FE1236DE-4084-3CF4-3E4C-67AB83835103";
createNode plusMinusAverage -n "Finger__instance_3:blueprint_end_joint_addTx";
	rename -uid "3AB359D2-4131-60CC-9803-09AD7F4515BA";
createNode multiplyDivide -n "Finger__instance_3:blueprint_knuckle_3_joint_original_Tx";
	rename -uid "6CF25267-4655-4534-AED4-3891BB3580BA";
	setAttr ".i1" -type "float3" 0.40839934 0 0 ;
	setAttr -l on ".i1x";
createNode unitConversion -n "unitConversion5";
	rename -uid "2D07E967-4F11-0625-2413-1DAD5644180A";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion2";
	rename -uid "D2D4AEE7-40EE-C3A8-E168-74993200E64E";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion3";
	rename -uid "95D31C42-4F5B-FB1B-65F6-2190D11FD880";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1";
	rename -uid "E102A332-4F2B-CF82-DDB0-B68F60AE8BBF";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion4";
	rename -uid "46FE63CB-4686-EAC0-273C-BF9D50EF341D";
	setAttr ".cf" 0.017453292519943295;
createNode hyperLayout -n "hyperLayout115";
	rename -uid "C0990801-4C73-797B-CA64-2EBDBBD89FCB";
	setAttr ".ihi" 0;
	setAttr -s 35 ".hyp";
createNode hyperLayout -n "hyperLayout120";
	rename -uid "1AEDD502-42A4-F9D9-5DCB-C791ED4B0AFB";
	setAttr ".ihi" 0;
	setAttr -s 7 ".hyp";
createNode container -n "Finger__instance_5:blueprint_container";
	rename -uid "7C994157-44B6-4E19-1B30-7D955D1F6047";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
createNode multiplyDivide -n "Finger__instance_5:blueprint_knuckle_1_joint_dummyRotationsMultiply";
	rename -uid "BFF04C44-46A9-2BE5-711E-D6AA1EAB9DAD";
createNode plusMinusAverage -n "Finger__instance_5:blueprint_root_joint_addRotations";
	rename -uid "410BBBE1-4B9C-6E02-153E-11B31CE14484";
createNode plusMinusAverage -n "Finger__instance_5:blueprint_knuckle_1_joint_addRotations";
	rename -uid "843655A0-4022-6E00-7D57-7587DE7133C5";
createNode multiplyDivide -n "Finger__instance_5:blueprint_root_joint_dummyRotationsMultiply";
	rename -uid "904561F5-48D4-DC02-1574-7E8013519F24";
createNode hyperLayout -n "hyperLayout119";
	rename -uid "1706FECD-4936-867F-701A-EEBD8760886E";
	setAttr ".ihi" 0;
	setAttr -s 35 ".hyp";
createNode unitConversion -n "unitConversion11";
	rename -uid "28075927-4D6B-E1E4-0138-95AB39B04CA4";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion12";
	rename -uid "BF763254-440D-D3A0-A47D-05A9B2BB4763";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion15";
	rename -uid "92A16849-4656-2EDB-C1AE-D2ACA89E712B";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion13";
	rename -uid "D6DB9430-45E0-CF26-09D5-D88EDC81851F";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion14";
	rename -uid "52B38D6E-4857-71F0-FFBD-84BE811643E6";
	setAttr ".cf" 0.017453292519943295;
createNode multiplyDivide -n "Finger__instance_5:blueprint_knuckle_2_joint_original_Tx";
	rename -uid "2D5C4FE6-4688-6E7E-543A-C4A7B177E310";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode plusMinusAverage -n "Finger__instance_5:blueprint_end_joint_addTx";
	rename -uid "4F639145-499A-81F5-3BA8-41A87DE22965";
createNode plusMinusAverage -n "Finger__instance_5:blueprint_knuckle_2_joint_addTx";
	rename -uid "4A6CBD03-4586-1164-FCC3-57BFBCC81FCE";
createNode plusMinusAverage -n "Finger__instance_5:blueprint_knuckle_2_joint_addRotations";
	rename -uid "6BFDBE4C-49F9-9ED5-4CEE-88BF8C790B03";
createNode multiplyDivide -n "Finger__instance_5:blueprint_end_joint_original_Tx";
	rename -uid "7EEB0AEF-4232-F077-F023-528E0900EA69";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode plusMinusAverage -n "Finger__instance_5:blueprint_end_joint_addRotations";
	rename -uid "52C538AF-49BC-E398-A5EC-64B6592FA110";
createNode multiplyDivide -n "Finger__instance_5:blueprint_knuckle_1_joint_original_Tx";
	rename -uid "2D1D7701-4DB1-04D0-6320-66881CBFABC9";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode plusMinusAverage -n "Finger__instance_5:blueprint_knuckle_3_joint_addRotations";
	rename -uid "924D040E-4FC5-3305-50CD-90BA5F2AFD21";
createNode multiplyDivide -n "Finger__instance_5:blueprint_knuckle_2_joint_dummyRotationsMultiply";
	rename -uid "C5A57737-46A4-5CDB-860D-6FAEDAD5652F";
createNode multiplyDivide -n "Finger__instance_5:blueprint_knuckle_3_joint_dummyRotationsMultiply";
	rename -uid "5B595200-441C-805F-0C1B-F3AFCE776749";
createNode plusMinusAverage -n "Finger__instance_5:blueprint_knuckle_1_joint_addTx";
	rename -uid "7AF8FFE9-4FB4-A434-487F-DCA75110A6EE";
createNode plusMinusAverage -n "Finger__instance_5:blueprint_knuckle_3_joint_addTx";
	rename -uid "D054AA83-4E63-167A-B80B-F5996A32F470";
createNode multiplyDivide -n "Finger__instance_5:blueprint_knuckle_3_joint_original_Tx";
	rename -uid "5FD0CD90-4436-0DB5-D180-59B01ABD26E4";
	setAttr ".i1" -type "float3" 0.40839934 0 0 ;
	setAttr -l on ".i1x";
createNode multiplyDivide -n "Finger__instance_5:blueprint_end_joint_dummyRotationsMultiply";
	rename -uid "1BE4EC4F-4857-2714-E5BC-E4B0713667F6";
createNode hyperLayout -n "hyperLayout122";
	rename -uid "ED2DF105-470A-26BB-E23D-ABA8241BE74A";
	setAttr ".ihi" 0;
	setAttr -s 7 ".hyp";
createNode container -n "Finger__instance_6:blueprint_container";
	rename -uid "3C4478FA-4072-ED2D-D226-31A7DC28DEF6";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
createNode hyperLayout -n "hyperLayout121";
	rename -uid "A257341A-46A9-D31F-5AE5-5CA1CD00B26A";
	setAttr ".ihi" 0;
	setAttr -s 35 ".hyp";
createNode unitConversion -n "unitConversion17";
	rename -uid "F6FFC697-43CC-FF45-9B3B-1BBE9C6DA195";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion19";
	rename -uid "F4FD5B10-45A5-A773-3422-93AADBAECE4C";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion16";
	rename -uid "C93CD1CA-48AF-7364-C4FF-3AB5F717902F";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion18";
	rename -uid "8C90BE09-4A87-102D-0739-AAB88531DB15";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion20";
	rename -uid "2AA98C59-4BDE-5ABC-5FF7-9FA6F83034DB";
	setAttr ".cf" 0.017453292519943295;
createNode multiplyDivide -n "Finger__instance_6:blueprint_knuckle_2_joint_dummyRotationsMultiply";
	rename -uid "764DFE15-40EA-C2D9-20E7-D8BC69C020A0";
createNode plusMinusAverage -n "Finger__instance_6:blueprint_knuckle_3_joint_addRotations";
	rename -uid "193C979A-4273-BCE5-A998-2B9529ACB3EB";
createNode plusMinusAverage -n "Finger__instance_6:blueprint_knuckle_2_joint_addTx";
	rename -uid "59AD4CA6-407B-F889-A0AB-6FAED4C09DA4";
createNode multiplyDivide -n "Finger__instance_6:blueprint_knuckle_3_joint_original_Tx";
	rename -uid "D108282B-4995-FE19-D508-A1A07EC1D108";
	setAttr ".i1" -type "float3" 0.40839934 0 0 ;
	setAttr -l on ".i1x";
createNode multiplyDivide -n "Finger__instance_6:blueprint_end_joint_dummyRotationsMultiply";
	rename -uid "4B29FEAB-4879-4E3C-745F-739750422206";
createNode multiplyDivide -n "Finger__instance_6:blueprint_end_joint_original_Tx";
	rename -uid "ACB98FD7-43B3-CD71-4F81-BF9230F68DCC";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode plusMinusAverage -n "Finger__instance_6:blueprint_knuckle_1_joint_addRotations";
	rename -uid "FC4529FB-455D-7BFC-B8AE-5D82D216D2D3";
createNode multiplyDivide -n "Finger__instance_6:blueprint_knuckle_1_joint_dummyRotationsMultiply";
	rename -uid "B5AE86EA-4FF8-7E38-DB4D-DBACA40712FA";
createNode plusMinusAverage -n "Finger__instance_6:blueprint_knuckle_1_joint_addTx";
	rename -uid "7DDA043F-4E1B-BBA3-4BD8-93AD594BA777";
createNode multiplyDivide -n "Finger__instance_6:blueprint_knuckle_1_joint_original_Tx";
	rename -uid "6877292F-4EC2-A985-A2DF-4D9966C96288";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode plusMinusAverage -n "Finger__instance_6:blueprint_root_joint_addRotations";
	rename -uid "E2448496-4790-7D81-4432-AB9E40831FD9";
createNode multiplyDivide -n "Finger__instance_6:blueprint_root_joint_dummyRotationsMultiply";
	rename -uid "6DF656D0-498C-4022-B4B1-67BEEADCC1B4";
createNode plusMinusAverage -n "Finger__instance_6:blueprint_knuckle_2_joint_addRotations";
	rename -uid "7A8003AD-49B6-BE79-CB66-CAA2091C53C6";
createNode multiplyDivide -n "Finger__instance_6:blueprint_knuckle_2_joint_original_Tx";
	rename -uid "23929D1E-4348-A619-F6F3-97A50C4A467B";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode multiplyDivide -n "Finger__instance_6:blueprint_knuckle_3_joint_dummyRotationsMultiply";
	rename -uid "64E4E741-462D-3F54-380F-AEB10790C70B";
createNode plusMinusAverage -n "Finger__instance_6:blueprint_knuckle_3_joint_addTx";
	rename -uid "29455460-41CD-9BF2-55F1-B989D22C60BD";
createNode plusMinusAverage -n "Finger__instance_6:blueprint_end_joint_addRotations";
	rename -uid "AA4BF667-454F-29C6-77F9-859E47F8A35F";
createNode plusMinusAverage -n "Finger__instance_6:blueprint_end_joint_addTx";
	rename -uid "07212152-4A9C-9FE6-AB4C-2095393D462C";
createNode hyperLayout -n "hyperLayout118";
	rename -uid "D61D2DB9-4871-A45D-B74B-D1B805BCF3BC";
	setAttr ".ihi" 0;
	setAttr -s 7 ".hyp";
createNode container -n "Finger__instance_4:blueprint_container";
	rename -uid "15A563BC-4AE5-E469-0B6A-E685D26B65B4";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2025/11/26 13:12:56";
createNode multiplyDivide -n "Finger__instance_4:blueprint_root_joint_dummyRotationsMultiply";
	rename -uid "3CCE0E71-4E98-D626-45D4-04920E53B758";
createNode plusMinusAverage -n "Finger__instance_4:blueprint_root_joint_addRotations";
	rename -uid "08D940F7-4D18-1007-900F-7FBF87287D41";
createNode multiplyDivide -n "Finger__instance_4:blueprint_knuckle_1_joint_original_Tx";
	rename -uid "32C2113A-4257-3F4C-409A-A59E40812244";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode multiplyDivide -n "Finger__instance_4:blueprint_knuckle_2_joint_dummyRotationsMultiply";
	rename -uid "FC84C47A-4DC7-5BBB-DF48-6C98D071DDB9";
createNode multiplyDivide -n "Finger__instance_4:blueprint_knuckle_2_joint_original_Tx";
	rename -uid "B1AE36FD-4EC3-85D2-D67B-609FFA772C09";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode multiplyDivide -n "Finger__instance_4:blueprint_knuckle_3_joint_original_Tx";
	rename -uid "B6A255C5-4226-0120-243E-78A9CB64E658";
	setAttr ".i1" -type "float3" 0.40839934 0 0 ;
	setAttr -l on ".i1x";
createNode plusMinusAverage -n "Finger__instance_4:blueprint_knuckle_1_joint_addTx";
	rename -uid "EC0F631D-4F1A-37F8-3574-A7A237EB983B";
createNode plusMinusAverage -n "Finger__instance_4:blueprint_end_joint_addRotations";
	rename -uid "3B3DEB64-45EC-4F61-B2E0-138AB06F0FE1";
createNode plusMinusAverage -n "Finger__instance_4:blueprint_end_joint_addTx";
	rename -uid "8B18BD2F-4B96-EFD8-7A39-EB98F2CAC8CB";
createNode plusMinusAverage -n "Finger__instance_4:blueprint_knuckle_1_joint_addRotations";
	rename -uid "EFDF4660-4929-8B6E-23D1-4FB1F395E2CF";
createNode multiplyDivide -n "Finger__instance_4:blueprint_knuckle_3_joint_dummyRotationsMultiply";
	rename -uid "80637C0A-4FC7-EF56-E7D3-0CA51642373C";
createNode plusMinusAverage -n "Finger__instance_4:blueprint_knuckle_3_joint_addRotations";
	rename -uid "678E6D45-4202-98A4-FE46-A4A74E656414";
createNode plusMinusAverage -n "Finger__instance_4:blueprint_knuckle_2_joint_addTx";
	rename -uid "2CA16C12-4E1B-27A0-0F41-81A9647FF333";
createNode plusMinusAverage -n "Finger__instance_4:blueprint_knuckle_3_joint_addTx";
	rename -uid "D84321AB-46AE-DE07-BF87-D7A2FCF766F6";
createNode multiplyDivide -n "Finger__instance_4:blueprint_end_joint_original_Tx";
	rename -uid "5CAE1EF3-4063-C1CA-509F-2E827EC16539";
	setAttr ".i1" -type "float3" 0.40839931 0 0 ;
	setAttr -l on ".i1x";
createNode plusMinusAverage -n "Finger__instance_4:blueprint_knuckle_2_joint_addRotations";
	rename -uid "1FE519AB-4AA1-415E-3004-5E92AFDB43D9";
createNode multiplyDivide -n "Finger__instance_4:blueprint_end_joint_dummyRotationsMultiply";
	rename -uid "0D47079E-480F-D319-95D9-6B97E002BD31";
createNode multiplyDivide -n "Finger__instance_4:blueprint_knuckle_1_joint_dummyRotationsMultiply";
	rename -uid "3CFB48FF-4E5E-B145-1EDF-CC904B053E90";
createNode hyperLayout -n "hyperLayout117";
	rename -uid "3425A87E-4CDF-4FF0-BB2B-21AE0A689A0E";
	setAttr ".ihi" 0;
	setAttr -s 35 ".hyp";
createNode unitConversion -n "unitConversion7";
	rename -uid "07176244-457E-546E-5056-6EBBB202E869";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion6";
	rename -uid "29DE6DDE-4742-D07A-0000-96AC7DB1D446";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion8";
	rename -uid "8DA33370-4E6D-92B2-37EB-8B9CA7C23994";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion9";
	rename -uid "C46E1512-459B-9DB3-4A8A-519531A28544";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion10";
	rename -uid "282E38D6-44B3-BEEA-E8D9-42B4AEE28303";
	setAttr ".cf" 0.017453292519943295;
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
	setAttr -s 109 ".u";
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
	setAttr -s 3 ".dsm";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".ren" -type "string" "arnold";
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
connectAttr "Finger__instance_3:HOOK_IN.sy" "Finger__instance_3:module_grp.hierarchicalScale"
		;
connectAttr "Finger__instance_3:hook_scale_constraint.csy" "Finger__instance_3:HOOK_IN.sy"
		;
connectAttr "Finger__instance_3:hook_scale_constraint.csx" "Finger__instance_3:HOOK_IN.sx"
		;
connectAttr "Finger__instance_3:hook_scale_constraint.csz" "Finger__instance_3:HOOK_IN.sz"
		;
connectAttr "Finger__instance_3:hook_parent_constraint.ctx" "Finger__instance_3:HOOK_IN.tx"
		;
connectAttr "Finger__instance_3:hook_parent_constraint.cty" "Finger__instance_3:HOOK_IN.ty"
		;
connectAttr "Finger__instance_3:hook_parent_constraint.ctz" "Finger__instance_3:HOOK_IN.tz"
		;
connectAttr "Finger__instance_3:hook_parent_constraint.crx" "Finger__instance_3:HOOK_IN.rx"
		;
connectAttr "Finger__instance_3:hook_parent_constraint.cry" "Finger__instance_3:HOOK_IN.ry"
		;
connectAttr "Finger__instance_3:hook_parent_constraint.crz" "Finger__instance_3:HOOK_IN.rz"
		;
connectAttr "character_grp.moduleMaintenanceVisibility" "Finger__instance_3:blueprint_joints_grp.v"
		;
connectAttr "unitConversion1.o" "Finger__instance_3:blueprint_root_joint.r";
connectAttr "Finger__instance_3:blueprint_root_joint.s" "Finger__instance_3:blueprint_knuckle_1_joint.is"
		;
connectAttr "unitConversion2.o" "Finger__instance_3:blueprint_knuckle_1_joint.r"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint_addTx.o1" "Finger__instance_3:blueprint_knuckle_1_joint.tx"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint.s" "Finger__instance_3:blueprint_knuckle_2_joint.is"
		;
connectAttr "unitConversion3.o" "Finger__instance_3:blueprint_knuckle_2_joint.r"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint_addTx.o1" "Finger__instance_3:blueprint_knuckle_2_joint.tx"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint.s" "Finger__instance_3:blueprint_knuckle_3_joint.is"
		;
connectAttr "unitConversion4.o" "Finger__instance_3:blueprint_knuckle_3_joint.r"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint_addTx.o1" "Finger__instance_3:blueprint_knuckle_3_joint.tx"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint.s" "Finger__instance_3:blueprint_end_joint.is"
		;
connectAttr "unitConversion5.o" "Finger__instance_3:blueprint_end_joint.r";
connectAttr "Finger__instance_3:blueprint_end_joint_addTx.o1" "Finger__instance_3:blueprint_end_joint.tx"
		;
connectAttr "Finger__instance_3:creationPose_root_joint.s" "Finger__instance_3:creationPose_knuckle_1_joint.is"
		;
connectAttr "Finger__instance_3:creationPose_knuckle_1_joint.s" "Finger__instance_3:creationPose_knuckle_2_joint.is"
		;
connectAttr "Finger__instance_3:creationPose_knuckle_2_joint.s" "Finger__instance_3:creationPose_knuckle_3_joint.is"
		;
connectAttr "Finger__instance_3:creationPose_knuckle_3_joint.s" "Finger__instance_3:creationPose_end_joint.is"
		;
connectAttr "Finger__instance_3:HOOK_IN.ro" "Finger__instance_3:hook_parent_constraint.cro"
		;
connectAttr "Finger__instance_3:HOOK_IN.pim" "Finger__instance_3:hook_parent_constraint.cpim"
		;
connectAttr "Finger__instance_3:HOOK_IN.rp" "Finger__instance_3:hook_parent_constraint.crp"
		;
connectAttr "Finger__instance_3:HOOK_IN.rpt" "Finger__instance_3:hook_parent_constraint.crt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.t" "Finger__instance_3:hook_parent_constraint.tg[0].tt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.rp" "Finger__instance_3:hook_parent_constraint.tg[0].trp"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.rpt" "Finger__instance_3:hook_parent_constraint.tg[0].trt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.r" "Finger__instance_3:hook_parent_constraint.tg[0].tr"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.ro" "Finger__instance_3:hook_parent_constraint.tg[0].tro"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.s" "Finger__instance_3:hook_parent_constraint.tg[0].ts"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.pm" "Finger__instance_3:hook_parent_constraint.tg[0].tpm"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.jo" "Finger__instance_3:hook_parent_constraint.tg[0].tjo"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.ssc" "Finger__instance_3:hook_parent_constraint.tg[0].tsc"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.is" "Finger__instance_3:hook_parent_constraint.tg[0].tis"
		;
connectAttr "Finger__instance_3:hook_parent_constraint.w0" "Finger__instance_3:hook_parent_constraint.tg[0].tw"
		;
connectAttr "Finger__instance_3:HOOK_IN.pim" "Finger__instance_3:hook_scale_constraint.cpim"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.s" "Finger__instance_3:hook_scale_constraint.tg[0].ts"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.pm" "Finger__instance_3:hook_scale_constraint.tg[0].tpm"
		;
connectAttr "Finger__instance_3:hook_scale_constraint.w0" "Finger__instance_3:hook_scale_constraint.tg[0].tw"
		;
connectAttr "Finger__instance_4:HOOK_IN.sy" "Finger__instance_4:module_grp.hierarchicalScale"
		;
connectAttr "Finger__instance_4:hook_scale_constraint.csy" "Finger__instance_4:HOOK_IN.sy"
		;
connectAttr "Finger__instance_4:hook_scale_constraint.csx" "Finger__instance_4:HOOK_IN.sx"
		;
connectAttr "Finger__instance_4:hook_scale_constraint.csz" "Finger__instance_4:HOOK_IN.sz"
		;
connectAttr "Finger__instance_4:hook_parent_constraint.ctx" "Finger__instance_4:HOOK_IN.tx"
		;
connectAttr "Finger__instance_4:hook_parent_constraint.cty" "Finger__instance_4:HOOK_IN.ty"
		;
connectAttr "Finger__instance_4:hook_parent_constraint.ctz" "Finger__instance_4:HOOK_IN.tz"
		;
connectAttr "Finger__instance_4:hook_parent_constraint.crx" "Finger__instance_4:HOOK_IN.rx"
		;
connectAttr "Finger__instance_4:hook_parent_constraint.cry" "Finger__instance_4:HOOK_IN.ry"
		;
connectAttr "Finger__instance_4:hook_parent_constraint.crz" "Finger__instance_4:HOOK_IN.rz"
		;
connectAttr "character_grp.moduleMaintenanceVisibility" "Finger__instance_4:blueprint_joints_grp.v"
		;
connectAttr "unitConversion6.o" "Finger__instance_4:blueprint_root_joint.r";
connectAttr "Finger__instance_4:blueprint_root_joint.s" "Finger__instance_4:blueprint_knuckle_1_joint.is"
		;
connectAttr "unitConversion7.o" "Finger__instance_4:blueprint_knuckle_1_joint.r"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint_addTx.o1" "Finger__instance_4:blueprint_knuckle_1_joint.tx"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint.s" "Finger__instance_4:blueprint_knuckle_2_joint.is"
		;
connectAttr "unitConversion8.o" "Finger__instance_4:blueprint_knuckle_2_joint.r"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint_addTx.o1" "Finger__instance_4:blueprint_knuckle_2_joint.tx"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint.s" "Finger__instance_4:blueprint_knuckle_3_joint.is"
		;
connectAttr "unitConversion9.o" "Finger__instance_4:blueprint_knuckle_3_joint.r"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint_addTx.o1" "Finger__instance_4:blueprint_knuckle_3_joint.tx"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint.s" "Finger__instance_4:blueprint_end_joint.is"
		;
connectAttr "unitConversion10.o" "Finger__instance_4:blueprint_end_joint.r";
connectAttr "Finger__instance_4:blueprint_end_joint_addTx.o1" "Finger__instance_4:blueprint_end_joint.tx"
		;
connectAttr "Finger__instance_4:creationPose_root_joint.s" "Finger__instance_4:creationPose_knuckle_1_joint.is"
		;
connectAttr "Finger__instance_4:creationPose_knuckle_1_joint.s" "Finger__instance_4:creationPose_knuckle_2_joint.is"
		;
connectAttr "Finger__instance_4:creationPose_knuckle_2_joint.s" "Finger__instance_4:creationPose_knuckle_3_joint.is"
		;
connectAttr "Finger__instance_4:creationPose_knuckle_3_joint.s" "Finger__instance_4:creationPose_end_joint.is"
		;
connectAttr "Finger__instance_4:HOOK_IN.ro" "Finger__instance_4:hook_parent_constraint.cro"
		;
connectAttr "Finger__instance_4:HOOK_IN.pim" "Finger__instance_4:hook_parent_constraint.cpim"
		;
connectAttr "Finger__instance_4:HOOK_IN.rp" "Finger__instance_4:hook_parent_constraint.crp"
		;
connectAttr "Finger__instance_4:HOOK_IN.rpt" "Finger__instance_4:hook_parent_constraint.crt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.t" "Finger__instance_4:hook_parent_constraint.tg[0].tt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.rp" "Finger__instance_4:hook_parent_constraint.tg[0].trp"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.rpt" "Finger__instance_4:hook_parent_constraint.tg[0].trt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.r" "Finger__instance_4:hook_parent_constraint.tg[0].tr"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.ro" "Finger__instance_4:hook_parent_constraint.tg[0].tro"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.s" "Finger__instance_4:hook_parent_constraint.tg[0].ts"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.pm" "Finger__instance_4:hook_parent_constraint.tg[0].tpm"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.jo" "Finger__instance_4:hook_parent_constraint.tg[0].tjo"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.ssc" "Finger__instance_4:hook_parent_constraint.tg[0].tsc"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.is" "Finger__instance_4:hook_parent_constraint.tg[0].tis"
		;
connectAttr "Finger__instance_4:hook_parent_constraint.w0" "Finger__instance_4:hook_parent_constraint.tg[0].tw"
		;
connectAttr "Finger__instance_4:HOOK_IN.pim" "Finger__instance_4:hook_scale_constraint.cpim"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.s" "Finger__instance_4:hook_scale_constraint.tg[0].ts"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.pm" "Finger__instance_4:hook_scale_constraint.tg[0].tpm"
		;
connectAttr "Finger__instance_4:hook_scale_constraint.w0" "Finger__instance_4:hook_scale_constraint.tg[0].tw"
		;
connectAttr "Finger__instance_5:HOOK_IN.sy" "Finger__instance_5:module_grp.hierarchicalScale"
		;
connectAttr "Finger__instance_5:hook_scale_constraint.csy" "Finger__instance_5:HOOK_IN.sy"
		;
connectAttr "Finger__instance_5:hook_scale_constraint.csx" "Finger__instance_5:HOOK_IN.sx"
		;
connectAttr "Finger__instance_5:hook_scale_constraint.csz" "Finger__instance_5:HOOK_IN.sz"
		;
connectAttr "Finger__instance_5:hook_parent_constraint.ctx" "Finger__instance_5:HOOK_IN.tx"
		;
connectAttr "Finger__instance_5:hook_parent_constraint.cty" "Finger__instance_5:HOOK_IN.ty"
		;
connectAttr "Finger__instance_5:hook_parent_constraint.ctz" "Finger__instance_5:HOOK_IN.tz"
		;
connectAttr "Finger__instance_5:hook_parent_constraint.crx" "Finger__instance_5:HOOK_IN.rx"
		;
connectAttr "Finger__instance_5:hook_parent_constraint.cry" "Finger__instance_5:HOOK_IN.ry"
		;
connectAttr "Finger__instance_5:hook_parent_constraint.crz" "Finger__instance_5:HOOK_IN.rz"
		;
connectAttr "character_grp.moduleMaintenanceVisibility" "Finger__instance_5:blueprint_joints_grp.v"
		;
connectAttr "unitConversion11.o" "Finger__instance_5:blueprint_root_joint.r";
connectAttr "Finger__instance_5:blueprint_root_joint.s" "Finger__instance_5:blueprint_knuckle_1_joint.is"
		;
connectAttr "unitConversion12.o" "Finger__instance_5:blueprint_knuckle_1_joint.r"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint_addTx.o1" "Finger__instance_5:blueprint_knuckle_1_joint.tx"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint.s" "Finger__instance_5:blueprint_knuckle_2_joint.is"
		;
connectAttr "unitConversion13.o" "Finger__instance_5:blueprint_knuckle_2_joint.r"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint_addTx.o1" "Finger__instance_5:blueprint_knuckle_2_joint.tx"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint.s" "Finger__instance_5:blueprint_knuckle_3_joint.is"
		;
connectAttr "unitConversion14.o" "Finger__instance_5:blueprint_knuckle_3_joint.r"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint_addTx.o1" "Finger__instance_5:blueprint_knuckle_3_joint.tx"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint.s" "Finger__instance_5:blueprint_end_joint.is"
		;
connectAttr "unitConversion15.o" "Finger__instance_5:blueprint_end_joint.r";
connectAttr "Finger__instance_5:blueprint_end_joint_addTx.o1" "Finger__instance_5:blueprint_end_joint.tx"
		;
connectAttr "Finger__instance_5:creationPose_root_joint.s" "Finger__instance_5:creationPose_knuckle_1_joint.is"
		;
connectAttr "Finger__instance_5:creationPose_knuckle_1_joint.s" "Finger__instance_5:creationPose_knuckle_2_joint.is"
		;
connectAttr "Finger__instance_5:creationPose_knuckle_2_joint.s" "Finger__instance_5:creationPose_knuckle_3_joint.is"
		;
connectAttr "Finger__instance_5:creationPose_knuckle_3_joint.s" "Finger__instance_5:creationPose_end_joint.is"
		;
connectAttr "Finger__instance_5:HOOK_IN.ro" "Finger__instance_5:hook_parent_constraint.cro"
		;
connectAttr "Finger__instance_5:HOOK_IN.pim" "Finger__instance_5:hook_parent_constraint.cpim"
		;
connectAttr "Finger__instance_5:HOOK_IN.rp" "Finger__instance_5:hook_parent_constraint.crp"
		;
connectAttr "Finger__instance_5:HOOK_IN.rpt" "Finger__instance_5:hook_parent_constraint.crt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.t" "Finger__instance_5:hook_parent_constraint.tg[0].tt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.rp" "Finger__instance_5:hook_parent_constraint.tg[0].trp"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.rpt" "Finger__instance_5:hook_parent_constraint.tg[0].trt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.r" "Finger__instance_5:hook_parent_constraint.tg[0].tr"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.ro" "Finger__instance_5:hook_parent_constraint.tg[0].tro"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.s" "Finger__instance_5:hook_parent_constraint.tg[0].ts"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.pm" "Finger__instance_5:hook_parent_constraint.tg[0].tpm"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.jo" "Finger__instance_5:hook_parent_constraint.tg[0].tjo"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.ssc" "Finger__instance_5:hook_parent_constraint.tg[0].tsc"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.is" "Finger__instance_5:hook_parent_constraint.tg[0].tis"
		;
connectAttr "Finger__instance_5:hook_parent_constraint.w0" "Finger__instance_5:hook_parent_constraint.tg[0].tw"
		;
connectAttr "Finger__instance_5:HOOK_IN.pim" "Finger__instance_5:hook_scale_constraint.cpim"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.s" "Finger__instance_5:hook_scale_constraint.tg[0].ts"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.pm" "Finger__instance_5:hook_scale_constraint.tg[0].tpm"
		;
connectAttr "Finger__instance_5:hook_scale_constraint.w0" "Finger__instance_5:hook_scale_constraint.tg[0].tw"
		;
connectAttr "Finger__instance_6:HOOK_IN.sy" "Finger__instance_6:module_grp.hierarchicalScale"
		;
connectAttr "Finger__instance_6:hook_scale_constraint.csy" "Finger__instance_6:HOOK_IN.sy"
		;
connectAttr "Finger__instance_6:hook_scale_constraint.csx" "Finger__instance_6:HOOK_IN.sx"
		;
connectAttr "Finger__instance_6:hook_scale_constraint.csz" "Finger__instance_6:HOOK_IN.sz"
		;
connectAttr "Finger__instance_6:hook_parent_constraint.ctx" "Finger__instance_6:HOOK_IN.tx"
		;
connectAttr "Finger__instance_6:hook_parent_constraint.cty" "Finger__instance_6:HOOK_IN.ty"
		;
connectAttr "Finger__instance_6:hook_parent_constraint.ctz" "Finger__instance_6:HOOK_IN.tz"
		;
connectAttr "Finger__instance_6:hook_parent_constraint.crx" "Finger__instance_6:HOOK_IN.rx"
		;
connectAttr "Finger__instance_6:hook_parent_constraint.cry" "Finger__instance_6:HOOK_IN.ry"
		;
connectAttr "Finger__instance_6:hook_parent_constraint.crz" "Finger__instance_6:HOOK_IN.rz"
		;
connectAttr "character_grp.moduleMaintenanceVisibility" "Finger__instance_6:blueprint_joints_grp.v"
		;
connectAttr "unitConversion16.o" "Finger__instance_6:blueprint_root_joint.r";
connectAttr "Finger__instance_6:blueprint_root_joint.s" "Finger__instance_6:blueprint_knuckle_1_joint.is"
		;
connectAttr "unitConversion17.o" "Finger__instance_6:blueprint_knuckle_1_joint.r"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint_addTx.o1" "Finger__instance_6:blueprint_knuckle_1_joint.tx"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint.s" "Finger__instance_6:blueprint_knuckle_2_joint.is"
		;
connectAttr "unitConversion18.o" "Finger__instance_6:blueprint_knuckle_2_joint.r"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint_addTx.o1" "Finger__instance_6:blueprint_knuckle_2_joint.tx"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint.s" "Finger__instance_6:blueprint_knuckle_3_joint.is"
		;
connectAttr "unitConversion19.o" "Finger__instance_6:blueprint_knuckle_3_joint.r"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint_addTx.o1" "Finger__instance_6:blueprint_knuckle_3_joint.tx"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint.s" "Finger__instance_6:blueprint_end_joint.is"
		;
connectAttr "unitConversion20.o" "Finger__instance_6:blueprint_end_joint.r";
connectAttr "Finger__instance_6:blueprint_end_joint_addTx.o1" "Finger__instance_6:blueprint_end_joint.tx"
		;
connectAttr "Finger__instance_6:creationPose_root_joint.s" "Finger__instance_6:creationPose_knuckle_1_joint.is"
		;
connectAttr "Finger__instance_6:creationPose_knuckle_1_joint.s" "Finger__instance_6:creationPose_knuckle_2_joint.is"
		;
connectAttr "Finger__instance_6:creationPose_knuckle_2_joint.s" "Finger__instance_6:creationPose_knuckle_3_joint.is"
		;
connectAttr "Finger__instance_6:creationPose_knuckle_3_joint.s" "Finger__instance_6:creationPose_end_joint.is"
		;
connectAttr "Finger__instance_6:HOOK_IN.ro" "Finger__instance_6:hook_parent_constraint.cro"
		;
connectAttr "Finger__instance_6:HOOK_IN.pim" "Finger__instance_6:hook_parent_constraint.cpim"
		;
connectAttr "Finger__instance_6:HOOK_IN.rp" "Finger__instance_6:hook_parent_constraint.crp"
		;
connectAttr "Finger__instance_6:HOOK_IN.rpt" "Finger__instance_6:hook_parent_constraint.crt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.t" "Finger__instance_6:hook_parent_constraint.tg[0].tt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.rp" "Finger__instance_6:hook_parent_constraint.tg[0].trp"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.rpt" "Finger__instance_6:hook_parent_constraint.tg[0].trt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.r" "Finger__instance_6:hook_parent_constraint.tg[0].tr"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.ro" "Finger__instance_6:hook_parent_constraint.tg[0].tro"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.s" "Finger__instance_6:hook_parent_constraint.tg[0].ts"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.pm" "Finger__instance_6:hook_parent_constraint.tg[0].tpm"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.jo" "Finger__instance_6:hook_parent_constraint.tg[0].tjo"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.ssc" "Finger__instance_6:hook_parent_constraint.tg[0].tsc"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.is" "Finger__instance_6:hook_parent_constraint.tg[0].tis"
		;
connectAttr "Finger__instance_6:hook_parent_constraint.w0" "Finger__instance_6:hook_parent_constraint.tg[0].tw"
		;
connectAttr "Finger__instance_6:HOOK_IN.pim" "Finger__instance_6:hook_scale_constraint.cpim"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.s" "Finger__instance_6:hook_scale_constraint.tg[0].ts"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.pm" "Finger__instance_6:hook_scale_constraint.tg[0].tpm"
		;
connectAttr "Finger__instance_6:hook_scale_constraint.w0" "Finger__instance_6:hook_scale_constraint.tg[0].tw"
		;
connectAttr "HingeJoint__instance_1:HOOK_IN.sy" "HingeJoint__instance_1:module_grp.hierarchicalScale"
		;
connectAttr "character_grp.moduleMaintenanceVisibility" "HingeJoint__instance_1:blueprint_joints_grp.v"
		;
connectAttr "unitConversion21.o" "HingeJoint__instance_1:blueprint_root_joint.r"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint.s" "HingeJoint__instance_1:blueprint_hinge_joint.is"
		;
connectAttr "unitConversion22.o" "HingeJoint__instance_1:blueprint_hinge_joint.r"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint_addTx.o1" "HingeJoint__instance_1:blueprint_hinge_joint.tx"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.s" "HingeJoint__instance_1:blueprint_end_joint.is"
		;
connectAttr "unitConversion23.o" "HingeJoint__instance_1:blueprint_end_joint.r";
connectAttr "HingeJoint__instance_1:blueprint_end_joint_addTx.o1" "HingeJoint__instance_1:blueprint_end_joint.tx"
		;
connectAttr "HingeJoint__instance_1:creationPose_root_joint.s" "HingeJoint__instance_1:creationPose_hinge_joint.is"
		;
connectAttr "HingeJoint__instance_1:creationPose_hinge_joint.s" "HingeJoint__instance_1:creationPose_end_joint.is"
		;
connectAttr "RootTransform__instance_8:HOOK_IN.sy" "RootTransform__instance_8:module_grp.hierarchicalScale"
		;
connectAttr "character_grp.moduleMaintenanceVisibility" "RootTransform__instance_8:blueprint_joints_grp.v"
		;
connectAttr "unitConversion24.o" "RootTransform__instance_8:blueprint_joint.r";
connectAttr "RootTransform__instance_8:blueprint_joint_addTranslate.o3" "RootTransform__instance_8:blueprint_joint.t"
		;
connectAttr "RootTransform__instance_8:blueprint_joint_addScale.o3" "RootTransform__instance_8:blueprint_joint.s"
		;
connectAttr "SingleOrientableJoint__instance_2:HOOK_IN.sy" "SingleOrientableJoint__instance_2:module_grp.hierarchicalScale"
		;
connectAttr "SingleOrientableJoint__instance_2:hook_scale_constraint.csy" "SingleOrientableJoint__instance_2:HOOK_IN.sy"
		;
connectAttr "SingleOrientableJoint__instance_2:hook_scale_constraint.csx" "SingleOrientableJoint__instance_2:HOOK_IN.sx"
		;
connectAttr "SingleOrientableJoint__instance_2:hook_scale_constraint.csz" "SingleOrientableJoint__instance_2:HOOK_IN.sz"
		;
connectAttr "SingleOrientableJoint__instance_2:hook_parent_constraint.ctx" "SingleOrientableJoint__instance_2:HOOK_IN.tx"
		;
connectAttr "SingleOrientableJoint__instance_2:hook_parent_constraint.cty" "SingleOrientableJoint__instance_2:HOOK_IN.ty"
		;
connectAttr "SingleOrientableJoint__instance_2:hook_parent_constraint.ctz" "SingleOrientableJoint__instance_2:HOOK_IN.tz"
		;
connectAttr "SingleOrientableJoint__instance_2:hook_parent_constraint.crx" "SingleOrientableJoint__instance_2:HOOK_IN.rx"
		;
connectAttr "SingleOrientableJoint__instance_2:hook_parent_constraint.cry" "SingleOrientableJoint__instance_2:HOOK_IN.ry"
		;
connectAttr "SingleOrientableJoint__instance_2:hook_parent_constraint.crz" "SingleOrientableJoint__instance_2:HOOK_IN.rz"
		;
connectAttr "character_grp.moduleMaintenanceVisibility" "SingleOrientableJoint__instance_2:blueprint_joints_grp.v"
		;
connectAttr "unitConversion25.o" "SingleOrientableJoint__instance_2:blueprint_joint.r"
		;
connectAttr "SingleOrientableJoint__instance_2:HOOK_IN.ro" "SingleOrientableJoint__instance_2:hook_parent_constraint.cro"
		;
connectAttr "SingleOrientableJoint__instance_2:HOOK_IN.pim" "SingleOrientableJoint__instance_2:hook_parent_constraint.cpim"
		;
connectAttr "SingleOrientableJoint__instance_2:HOOK_IN.rp" "SingleOrientableJoint__instance_2:hook_parent_constraint.crp"
		;
connectAttr "SingleOrientableJoint__instance_2:HOOK_IN.rpt" "SingleOrientableJoint__instance_2:hook_parent_constraint.crt"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.t" "SingleOrientableJoint__instance_2:hook_parent_constraint.tg[0].tt"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.rp" "SingleOrientableJoint__instance_2:hook_parent_constraint.tg[0].trp"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.rpt" "SingleOrientableJoint__instance_2:hook_parent_constraint.tg[0].trt"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.r" "SingleOrientableJoint__instance_2:hook_parent_constraint.tg[0].tr"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.ro" "SingleOrientableJoint__instance_2:hook_parent_constraint.tg[0].tro"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.s" "SingleOrientableJoint__instance_2:hook_parent_constraint.tg[0].ts"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.pm" "SingleOrientableJoint__instance_2:hook_parent_constraint.tg[0].tpm"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.jo" "SingleOrientableJoint__instance_2:hook_parent_constraint.tg[0].tjo"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.ssc" "SingleOrientableJoint__instance_2:hook_parent_constraint.tg[0].tsc"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.is" "SingleOrientableJoint__instance_2:hook_parent_constraint.tg[0].tis"
		;
connectAttr "SingleOrientableJoint__instance_2:hook_parent_constraint.w0" "SingleOrientableJoint__instance_2:hook_parent_constraint.tg[0].tw"
		;
connectAttr "SingleOrientableJoint__instance_2:HOOK_IN.pim" "SingleOrientableJoint__instance_2:hook_scale_constraint.cpim"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.s" "SingleOrientableJoint__instance_2:hook_scale_constraint.tg[0].ts"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.pm" "SingleOrientableJoint__instance_2:hook_scale_constraint.tg[0].tpm"
		;
connectAttr "SingleOrientableJoint__instance_2:hook_scale_constraint.w0" "SingleOrientableJoint__instance_2:hook_scale_constraint.tg[0].tw"
		;
connectAttr "Thumb__instance_7:HOOK_IN.sy" "Thumb__instance_7:module_grp.hierarchicalScale"
		;
connectAttr "Thumb__instance_7:hook_scale_constraint.csy" "Thumb__instance_7:HOOK_IN.sy"
		;
connectAttr "Thumb__instance_7:hook_scale_constraint.csx" "Thumb__instance_7:HOOK_IN.sx"
		;
connectAttr "Thumb__instance_7:hook_scale_constraint.csz" "Thumb__instance_7:HOOK_IN.sz"
		;
connectAttr "Thumb__instance_7:hook_parent_constraint.ctx" "Thumb__instance_7:HOOK_IN.tx"
		;
connectAttr "Thumb__instance_7:hook_parent_constraint.cty" "Thumb__instance_7:HOOK_IN.ty"
		;
connectAttr "Thumb__instance_7:hook_parent_constraint.ctz" "Thumb__instance_7:HOOK_IN.tz"
		;
connectAttr "Thumb__instance_7:hook_parent_constraint.crx" "Thumb__instance_7:HOOK_IN.rx"
		;
connectAttr "Thumb__instance_7:hook_parent_constraint.cry" "Thumb__instance_7:HOOK_IN.ry"
		;
connectAttr "Thumb__instance_7:hook_parent_constraint.crz" "Thumb__instance_7:HOOK_IN.rz"
		;
connectAttr "character_grp.moduleMaintenanceVisibility" "Thumb__instance_7:blueprint_joints_grp.v"
		;
connectAttr "unitConversion26.o" "Thumb__instance_7:blueprint_root_joint.r";
connectAttr "Thumb__instance_7:blueprint_root_joint.s" "Thumb__instance_7:blueprint_knuckle_1_joint.is"
		;
connectAttr "unitConversion27.o" "Thumb__instance_7:blueprint_knuckle_1_joint.r"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint_addTx.o1" "Thumb__instance_7:blueprint_knuckle_1_joint.tx"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint.s" "Thumb__instance_7:blueprint_knuckle_2_joint.is"
		;
connectAttr "unitConversion28.o" "Thumb__instance_7:blueprint_knuckle_2_joint.r"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint_addTx.o1" "Thumb__instance_7:blueprint_knuckle_2_joint.tx"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint.s" "Thumb__instance_7:blueprint_end_joint.is"
		;
connectAttr "unitConversion29.o" "Thumb__instance_7:blueprint_end_joint.r";
connectAttr "Thumb__instance_7:blueprint_end_joint_addTx.o1" "Thumb__instance_7:blueprint_end_joint.tx"
		;
connectAttr "Thumb__instance_7:creationPose_root_joint.s" "Thumb__instance_7:creationPose_knuckle_1_joint.is"
		;
connectAttr "Thumb__instance_7:creationPose_knuckle_1_joint.s" "Thumb__instance_7:creationPose_knuckle_2_joint.is"
		;
connectAttr "Thumb__instance_7:creationPose_knuckle_2_joint.s" "Thumb__instance_7:creationPose_end_joint.is"
		;
connectAttr "Thumb__instance_7:HOOK_IN.ro" "Thumb__instance_7:hook_parent_constraint.cro"
		;
connectAttr "Thumb__instance_7:HOOK_IN.pim" "Thumb__instance_7:hook_parent_constraint.cpim"
		;
connectAttr "Thumb__instance_7:HOOK_IN.rp" "Thumb__instance_7:hook_parent_constraint.crp"
		;
connectAttr "Thumb__instance_7:HOOK_IN.rpt" "Thumb__instance_7:hook_parent_constraint.crt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.t" "Thumb__instance_7:hook_parent_constraint.tg[0].tt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.rp" "Thumb__instance_7:hook_parent_constraint.tg[0].trp"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.rpt" "Thumb__instance_7:hook_parent_constraint.tg[0].trt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.r" "Thumb__instance_7:hook_parent_constraint.tg[0].tr"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.ro" "Thumb__instance_7:hook_parent_constraint.tg[0].tro"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.s" "Thumb__instance_7:hook_parent_constraint.tg[0].ts"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.pm" "Thumb__instance_7:hook_parent_constraint.tg[0].tpm"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.jo" "Thumb__instance_7:hook_parent_constraint.tg[0].tjo"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.ssc" "Thumb__instance_7:hook_parent_constraint.tg[0].tsc"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.is" "Thumb__instance_7:hook_parent_constraint.tg[0].tis"
		;
connectAttr "Thumb__instance_7:hook_parent_constraint.w0" "Thumb__instance_7:hook_parent_constraint.tg[0].tw"
		;
connectAttr "Thumb__instance_7:HOOK_IN.pim" "Thumb__instance_7:hook_scale_constraint.cpim"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.s" "Thumb__instance_7:hook_scale_constraint.tg[0].ts"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.pm" "Thumb__instance_7:hook_scale_constraint.tg[0].tpm"
		;
connectAttr "Thumb__instance_7:hook_scale_constraint.w0" "Thumb__instance_7:hook_scale_constraint.tg[0].tw"
		;
connectAttr "non_blueprint_visibilityMultiply.ox" "non_blueprint_grp.v";
connectAttr "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.ctx" "blueprint_root_joint_geoAttach_parentGrp1.tx"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.cty" "blueprint_root_joint_geoAttach_parentGrp1.ty"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.ctz" "blueprint_root_joint_geoAttach_parentGrp1.tz"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.crx" "blueprint_root_joint_geoAttach_parentGrp1.rx"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.cry" "blueprint_root_joint_geoAttach_parentGrp1.ry"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.crz" "blueprint_root_joint_geoAttach_parentGrp1.rz"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1_scaleConstraint.csx" "blueprint_root_joint_geoAttach_parentGrp1.sx"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1_scaleConstraint.csy" "blueprint_root_joint_geoAttach_parentGrp1.sy"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1_scaleConstraint.csz" "blueprint_root_joint_geoAttach_parentGrp1.sz"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1.ro" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.cro"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1.pim" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.cpim"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1.rp" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.crp"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1.rpt" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.crt"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint.t" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tt"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint.rp" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trp"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint.rpt" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trt"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint.r" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tr"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint.ro" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tro"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint.s" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.tg[0].ts"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint.pm" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tpm"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint.jo" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tjo"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint.ssc" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tsc"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint.is" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tis"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.w0" "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tw"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1.pim" "blueprint_root_joint_geoAttach_parentGrp1_scaleConstraint.cpim"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint.s" "blueprint_root_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].ts"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint.pm" "blueprint_root_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tpm"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1_scaleConstraint.w0" "blueprint_root_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tw"
		;
connectAttr "blueprint_root_joint_geoAttach_scaleGrp1_scaleFactor.ox" "blueprint_root_joint_geoAttach_scaleGrp1.sx"
		;
connectAttr "polyCylinder1.out" "pCylinderShape1.i";
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.ctx" "blueprint_hinge_joint_geoAttach_parentGrp1.tx"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.cty" "blueprint_hinge_joint_geoAttach_parentGrp1.ty"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.ctz" "blueprint_hinge_joint_geoAttach_parentGrp1.tz"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.crx" "blueprint_hinge_joint_geoAttach_parentGrp1.rx"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.cry" "blueprint_hinge_joint_geoAttach_parentGrp1.ry"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.crz" "blueprint_hinge_joint_geoAttach_parentGrp1.rz"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1_scaleConstraint.csx" "blueprint_hinge_joint_geoAttach_parentGrp1.sx"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1_scaleConstraint.csy" "blueprint_hinge_joint_geoAttach_parentGrp1.sy"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1_scaleConstraint.csz" "blueprint_hinge_joint_geoAttach_parentGrp1.sz"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1.ro" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.cro"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1.pim" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.cpim"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1.rp" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.crp"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1.rpt" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.crt"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.t" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tt"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.rp" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trp"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.rpt" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trt"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.r" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tr"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.ro" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tro"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.s" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.tg[0].ts"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.pm" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tpm"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.jo" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tjo"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.ssc" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tsc"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.is" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tis"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.w0" "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tw"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1.pim" "blueprint_hinge_joint_geoAttach_parentGrp1_scaleConstraint.cpim"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.s" "blueprint_hinge_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].ts"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.pm" "blueprint_hinge_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tpm"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1_scaleConstraint.w0" "blueprint_hinge_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tw"
		;
connectAttr "blueprint_hinge_joint_geoAttach_scaleGrp1_scaleFactor.ox" "blueprint_hinge_joint_geoAttach_scaleGrp1.sx"
		;
connectAttr "polyCylinder2.out" "pCylinderShape2.i";
connectAttr "blueprint_joint_geoAttach_parentGrp1_parentConstraint.ctx" "blueprint_joint_geoAttach_parentGrp1.tx"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1_parentConstraint.cty" "blueprint_joint_geoAttach_parentGrp1.ty"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1_parentConstraint.ctz" "blueprint_joint_geoAttach_parentGrp1.tz"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1_parentConstraint.crx" "blueprint_joint_geoAttach_parentGrp1.rx"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1_parentConstraint.cry" "blueprint_joint_geoAttach_parentGrp1.ry"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1_parentConstraint.crz" "blueprint_joint_geoAttach_parentGrp1.rz"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1_scaleConstraint.csx" "blueprint_joint_geoAttach_parentGrp1.sx"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1_scaleConstraint.csy" "blueprint_joint_geoAttach_parentGrp1.sy"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1_scaleConstraint.csz" "blueprint_joint_geoAttach_parentGrp1.sz"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1.ro" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.cro"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1.pim" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.cpim"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1.rp" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.crp"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1.rpt" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.crt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.t" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.rp" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trp"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.rpt" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.tg[0].trt"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.r" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tr"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.ro" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tro"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.s" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.tg[0].ts"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.pm" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tpm"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.jo" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tjo"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.ssc" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tsc"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.is" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tis"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1_parentConstraint.w0" "blueprint_joint_geoAttach_parentGrp1_parentConstraint.tg[0].tw"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1.pim" "blueprint_joint_geoAttach_parentGrp1_scaleConstraint.cpim"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.s" "blueprint_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].ts"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.pm" "blueprint_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tpm"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1_scaleConstraint.w0" "blueprint_joint_geoAttach_parentGrp1_scaleConstraint.tg[0].tw"
		;
connectAttr "polyCube1.out" "pCubeShape1.i";
connectAttr "character_grp.animationControlVisibility" "character_container.boc[0]"
		;
connectAttr "Finger__instance_3:module_container.boc[0]" "character_container.boc[1]"
		;
connectAttr "Finger__instance_3:module_container.boc[1]" "character_container.boc[2]"
		;
connectAttr "Finger__instance_4:module_container.boc[0]" "character_container.boc[3]"
		;
connectAttr "Finger__instance_4:module_container.boc[1]" "character_container.boc[4]"
		;
connectAttr "Finger__instance_5:module_container.boc[0]" "character_container.boc[5]"
		;
connectAttr "Finger__instance_5:module_container.boc[1]" "character_container.boc[6]"
		;
connectAttr "Finger__instance_6:module_container.boc[0]" "character_container.boc[7]"
		;
connectAttr "Finger__instance_6:module_container.boc[1]" "character_container.boc[8]"
		;
connectAttr "HingeJoint__instance_1:module_container.boc[0]" "character_container.boc[9]"
		;
connectAttr "HingeJoint__instance_1:module_container.boc[1]" "character_container.boc[10]"
		;
connectAttr "RootTransform__instance_8:module_container.boc[0]" "character_container.boc[11]"
		;
connectAttr "RootTransform__instance_8:module_container.boc[1]" "character_container.boc[12]"
		;
connectAttr "SingleOrientableJoint__instance_2:module_container.boc[0]" "character_container.boc[13]"
		;
connectAttr "SingleOrientableJoint__instance_2:module_container.boc[1]" "character_container.boc[14]"
		;
connectAttr "Thumb__instance_7:module_container.boc[0]" "character_container.boc[15]"
		;
connectAttr "Thumb__instance_7:module_container.boc[1]" "character_container.boc[16]"
		;
connectAttr "non_blueprint_container.boc[0]" "character_container.boc[17]";
connectAttr "hyperLayout131.msg" "character_container.hl";
connectAttr "non_blueprint_grp.display" "non_blueprint_container.boc[0]";
connectAttr "hyperLayout132.msg" "non_blueprint_container.hl";
connectAttr "Thumb__instance_7:SETTINGS.activeModule" "Thumb__instance_7:module_container.boc[0]"
		;
connectAttr "Thumb__instance_7:SETTINGS.creationPoseWeight" "Thumb__instance_7:module_container.boc[1]"
		;
connectAttr "hyperLayout130.msg" "Thumb__instance_7:module_container.hl";
connectAttr "SingleOrientableJoint__instance_2:SETTINGS.activeModule" "SingleOrientableJoint__instance_2:module_container.boc[0]"
		;
connectAttr "SingleOrientableJoint__instance_2:SETTINGS.creationPoseWeight" "SingleOrientableJoint__instance_2:module_container.boc[1]"
		;
connectAttr "hyperLayout128.msg" "SingleOrientableJoint__instance_2:module_container.hl"
		;
connectAttr "HingeJoint__instance_1:SETTINGS.activeModule" "HingeJoint__instance_1:module_container.boc[0]"
		;
connectAttr "HingeJoint__instance_1:SETTINGS.creationPoseWeight" "HingeJoint__instance_1:module_container.boc[1]"
		;
connectAttr "hyperLayout124.msg" "HingeJoint__instance_1:module_container.hl";
connectAttr "RootTransform__instance_8:SETTINGS.activeModule" "RootTransform__instance_8:module_container.boc[0]"
		;
connectAttr "RootTransform__instance_8:SETTINGS.creationPoseWeight" "RootTransform__instance_8:module_container.boc[1]"
		;
connectAttr "hyperLayout126.msg" "RootTransform__instance_8:module_container.hl"
		;
connectAttr "character_grp.moduleMaintenanceVisibility" "reverse_moduleMaintenanceVisibility.ix"
		;
connectAttr "Finger__instance_3:module_container.msg" "hyperLayout131.hyp[0].dn"
		;
connectAttr "Finger__instance_4:module_container.msg" "hyperLayout131.hyp[1].dn"
		;
connectAttr "Finger__instance_5:module_container.msg" "hyperLayout131.hyp[2].dn"
		;
connectAttr "Finger__instance_6:module_container.msg" "hyperLayout131.hyp[3].dn"
		;
connectAttr "HingeJoint__instance_1:module_container.msg" "hyperLayout131.hyp[4].dn"
		;
connectAttr "RootTransform__instance_8:module_container.msg" "hyperLayout131.hyp[5].dn"
		;
connectAttr "SingleOrientableJoint__instance_2:module_container.msg" "hyperLayout131.hyp[6].dn"
		;
connectAttr "Thumb__instance_7:module_container.msg" "hyperLayout131.hyp[7].dn";
connectAttr "character_grp.msg" "hyperLayout131.hyp[8].dn";
connectAttr "reverse_moduleMaintenanceVisibility.msg" "hyperLayout131.hyp[9].dn"
		;
connectAttr "moduleVisibilityMultiply.msg" "hyperLayout131.hyp[10].dn";
connectAttr "non_blueprint_container.msg" "hyperLayout131.hyp[11].dn";
connectAttr "Finger__instance_3:SETTINGS.activeModule" "Finger__instance_3:module_container.boc[0]"
		;
connectAttr "Finger__instance_3:SETTINGS.creationPoseWeight" "Finger__instance_3:module_container.boc[1]"
		;
connectAttr "hyperLayout116.msg" "Finger__instance_3:module_container.hl";
connectAttr "Finger__instance_5:SETTINGS.activeModule" "Finger__instance_5:module_container.boc[0]"
		;
connectAttr "Finger__instance_5:SETTINGS.creationPoseWeight" "Finger__instance_5:module_container.boc[1]"
		;
connectAttr "hyperLayout120.msg" "Finger__instance_5:module_container.hl";
connectAttr "Finger__instance_6:SETTINGS.activeModule" "Finger__instance_6:module_container.boc[0]"
		;
connectAttr "Finger__instance_6:SETTINGS.creationPoseWeight" "Finger__instance_6:module_container.boc[1]"
		;
connectAttr "hyperLayout122.msg" "Finger__instance_6:module_container.hl";
connectAttr "Finger__instance_4:SETTINGS.activeModule" "Finger__instance_4:module_container.boc[0]"
		;
connectAttr "Finger__instance_4:SETTINGS.creationPoseWeight" "Finger__instance_4:module_container.boc[1]"
		;
connectAttr "hyperLayout118.msg" "Finger__instance_4:module_container.hl";
connectAttr "reverse_moduleMaintenanceVisibility.ox" "moduleVisibilityMultiply.i1x"
		;
connectAttr "character_grp.animationControlVisibility" "moduleVisibilityMultiply.i2x"
		;
connectAttr "non_blueprint_grp.msg" "hyperLayout132.hyp[0].dn";
connectAttr "group.msg" "hyperLayout132.hyp[1].dn";
connectAttr "blueprint_root_joint_geoAttach_parentGrp1.msg" "hyperLayout132.hyp[2].dn"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1_parentConstraint.msg" "hyperLayout132.hyp[3].dn"
		;
connectAttr "blueprint_root_joint_geoAttach_parentGrp1_scaleConstraint.msg" "hyperLayout132.hyp[4].dn"
		;
connectAttr "blueprint_root_joint_geoAttach_scaleGrp1.msg" "hyperLayout132.hyp[5].dn"
		;
connectAttr "pCylinder1.msg" "hyperLayout132.hyp[6].dn";
connectAttr "pCylinderShape1.msg" "hyperLayout132.hyp[7].dn";
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1.msg" "hyperLayout132.hyp[8].dn"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1_parentConstraint.msg" "hyperLayout132.hyp[9].dn"
		;
connectAttr "blueprint_hinge_joint_geoAttach_parentGrp1_scaleConstraint.msg" "hyperLayout132.hyp[10].dn"
		;
connectAttr "blueprint_hinge_joint_geoAttach_scaleGrp1.msg" "hyperLayout132.hyp[11].dn"
		;
connectAttr "pCylinder2.msg" "hyperLayout132.hyp[12].dn";
connectAttr "pCylinderShape2.msg" "hyperLayout132.hyp[13].dn";
connectAttr "blueprint_joint_geoAttach_parentGrp1.msg" "hyperLayout132.hyp[14].dn"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1_parentConstraint.msg" "hyperLayout132.hyp[15].dn"
		;
connectAttr "blueprint_joint_geoAttach_parentGrp1_scaleConstraint.msg" "hyperLayout132.hyp[16].dn"
		;
connectAttr "pCube1.msg" "hyperLayout132.hyp[17].dn";
connectAttr "pCubeShape1.msg" "hyperLayout132.hyp[18].dn";
connectAttr "blueprint_root_joint_geoAttach_scaleGrp1_scaleFactor.msg" "hyperLayout132.hyp[19].dn"
		;
connectAttr "blueprint_hinge_joint_geoAttach_scaleGrp1_scaleFactor.msg" "hyperLayout132.hyp[20].dn"
		;
connectAttr "non_blueprint_visibilityMultiply.msg" "hyperLayout132.hyp[21].dn";
connectAttr "polyCylinder1.msg" "hyperLayout132.hyp[22].dn";
connectAttr "polyCylinder2.msg" "hyperLayout132.hyp[23].dn";
connectAttr "polyCube1.msg" "hyperLayout132.hyp[24].dn";
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.tx" "blueprint_root_joint_geoAttach_scaleGrp1_scaleFactor.i1x"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.tx" "blueprint_hinge_joint_geoAttach_scaleGrp1_scaleFactor.i1x"
		;
connectAttr "reverse_moduleMaintenanceVisibility.ox" "non_blueprint_visibilityMultiply.i1x"
		;
connectAttr "non_blueprint_grp.display" "non_blueprint_visibilityMultiply.i2x";
connectAttr "HingeJoint__instance_1:blueprint_root_joint_addRotations.o3" "unitConversion21.i"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint_dummyRotationsMultiply.o" "HingeJoint__instance_1:blueprint_root_joint_addRotations.i3[0]"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint_addRotations.o3" "unitConversion22.i"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint_dummyRotationsMultiply.o" "HingeJoint__instance_1:blueprint_hinge_joint_addRotations.i3[0]"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint_original_Tx.ox" "HingeJoint__instance_1:blueprint_hinge_joint_addTx.i1[0]"
		;
connectAttr "HingeJoint__instance_1:SETTINGS.creationPoseWeight" "HingeJoint__instance_1:blueprint_hinge_joint_original_Tx.i2x"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint_addRotations.o3" "unitConversion23.i"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint_dummyRotationsMultiply.o" "HingeJoint__instance_1:blueprint_end_joint_addRotations.i3[0]"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint_original_Tx.ox" "HingeJoint__instance_1:blueprint_end_joint_addTx.i1[0]"
		;
connectAttr "HingeJoint__instance_1:SETTINGS.creationPoseWeight" "HingeJoint__instance_1:blueprint_end_joint_original_Tx.i2x"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint_addRotations.o3" "unitConversion25.i"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint_dummyRotationsMultiply.o" "SingleOrientableJoint__instance_2:blueprint_joint_addRotations.i3[0]"
		;
connectAttr "hyperLayout129.msg" "Thumb__instance_7:blueprint_container.hl";
connectAttr "Thumb__instance_7:module_grp.msg" "hyperLayout130.hyp[0].dn";
connectAttr "Thumb__instance_7:HOOK_IN.msg" "hyperLayout130.hyp[1].dn";
connectAttr "Thumb__instance_7:SETTINGS.msg" "hyperLayout130.hyp[2].dn";
connectAttr "Thumb__instance_7:blueprint_container.msg" "hyperLayout130.hyp[3].dn"
		;
connectAttr "Thumb__instance_7:SETTINGSShape.msg" "hyperLayout130.hyp[4].dn";
connectAttr "Thumb__instance_7:hook_parent_constraint.msg" "hyperLayout130.hyp[5].dn"
		;
connectAttr "Thumb__instance_7:hook_scale_constraint.msg" "hyperLayout130.hyp[6].dn"
		;
connectAttr "Thumb__instance_7:blueprint_root_joint_addRotations.msg" "hyperLayout129.hyp[0].dn"
		;
connectAttr "Thumb__instance_7:blueprint_root_joint_dummyRotationsMultiply.msg" "hyperLayout129.hyp[1].dn"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint_addRotations.msg" "hyperLayout129.hyp[2].dn"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint_dummyRotationsMultiply.msg" "hyperLayout129.hyp[3].dn"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint_addTx.msg" "hyperLayout129.hyp[4].dn"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint_original_Tx.msg" "hyperLayout129.hyp[5].dn"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint_addRotations.msg" "hyperLayout129.hyp[6].dn"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint_dummyRotationsMultiply.msg" "hyperLayout129.hyp[7].dn"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint_addTx.msg" "hyperLayout129.hyp[8].dn"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint_original_Tx.msg" "hyperLayout129.hyp[9].dn"
		;
connectAttr "Thumb__instance_7:blueprint_end_joint_addRotations.msg" "hyperLayout129.hyp[10].dn"
		;
connectAttr "Thumb__instance_7:blueprint_end_joint_dummyRotationsMultiply.msg" "hyperLayout129.hyp[11].dn"
		;
connectAttr "Thumb__instance_7:blueprint_end_joint_addTx.msg" "hyperLayout129.hyp[12].dn"
		;
connectAttr "Thumb__instance_7:blueprint_end_joint_original_Tx.msg" "hyperLayout129.hyp[13].dn"
		;
connectAttr "Thumb__instance_7:blueprint_joints_grp.msg" "hyperLayout129.hyp[14].dn"
		;
connectAttr "Thumb__instance_7:creationPose_joints_grp.msg" "hyperLayout129.hyp[15].dn"
		;
connectAttr "unitConversion26.msg" "hyperLayout129.hyp[16].dn";
connectAttr "unitConversion27.msg" "hyperLayout129.hyp[17].dn";
connectAttr "unitConversion28.msg" "hyperLayout129.hyp[18].dn";
connectAttr "unitConversion29.msg" "hyperLayout129.hyp[19].dn";
connectAttr "Thumb__instance_7:blueprint_root_joint.msg" "hyperLayout129.hyp[20].dn"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint.msg" "hyperLayout129.hyp[21].dn"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint.msg" "hyperLayout129.hyp[22].dn"
		;
connectAttr "Thumb__instance_7:blueprint_end_joint.msg" "hyperLayout129.hyp[23].dn"
		;
connectAttr "Thumb__instance_7:creationPose_root_joint.msg" "hyperLayout129.hyp[24].dn"
		;
connectAttr "Thumb__instance_7:creationPose_knuckle_1_joint.msg" "hyperLayout129.hyp[25].dn"
		;
connectAttr "Thumb__instance_7:creationPose_knuckle_2_joint.msg" "hyperLayout129.hyp[26].dn"
		;
connectAttr "Thumb__instance_7:creationPose_end_joint.msg" "hyperLayout129.hyp[27].dn"
		;
connectAttr "Thumb__instance_7:SETTINGS.creationPoseWeight" "Thumb__instance_7:blueprint_knuckle_1_joint_original_Tx.i2x"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint_dummyRotationsMultiply.o" "Thumb__instance_7:blueprint_knuckle_2_joint_addRotations.i3[0]"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint_dummyRotationsMultiply.o" "Thumb__instance_7:blueprint_knuckle_1_joint_addRotations.i3[0]"
		;
connectAttr "Thumb__instance_7:blueprint_end_joint_dummyRotationsMultiply.o" "Thumb__instance_7:blueprint_end_joint_addRotations.i3[0]"
		;
connectAttr "Thumb__instance_7:SETTINGS.creationPoseWeight" "Thumb__instance_7:blueprint_knuckle_2_joint_original_Tx.i2x"
		;
connectAttr "Thumb__instance_7:blueprint_end_joint_original_Tx.ox" "Thumb__instance_7:blueprint_end_joint_addTx.i1[0]"
		;
connectAttr "Thumb__instance_7:SETTINGS.creationPoseWeight" "Thumb__instance_7:blueprint_end_joint_original_Tx.i2x"
		;
connectAttr "Thumb__instance_7:blueprint_root_joint_dummyRotationsMultiply.o" "Thumb__instance_7:blueprint_root_joint_addRotations.i3[0]"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint_original_Tx.ox" "Thumb__instance_7:blueprint_knuckle_2_joint_addTx.i1[0]"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint_original_Tx.ox" "Thumb__instance_7:blueprint_knuckle_1_joint_addTx.i1[0]"
		;
connectAttr "Thumb__instance_7:blueprint_root_joint_addRotations.o3" "unitConversion26.i"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint_addRotations.o3" "unitConversion27.i"
		;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint_addRotations.o3" "unitConversion28.i"
		;
connectAttr "Thumb__instance_7:blueprint_end_joint_addRotations.o3" "unitConversion29.i"
		;
connectAttr "hyperLayout127.msg" "SingleOrientableJoint__instance_2:blueprint_container.hl"
		;
connectAttr "SingleOrientableJoint__instance_2:module_grp.msg" "hyperLayout128.hyp[0].dn"
		;
connectAttr "SingleOrientableJoint__instance_2:HOOK_IN.msg" "hyperLayout128.hyp[1].dn"
		;
connectAttr "SingleOrientableJoint__instance_2:SETTINGS.msg" "hyperLayout128.hyp[2].dn"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_container.msg" "hyperLayout128.hyp[3].dn"
		;
connectAttr "SingleOrientableJoint__instance_2:SETTINGSShape.msg" "hyperLayout128.hyp[4].dn"
		;
connectAttr "SingleOrientableJoint__instance_2:hook_parent_constraint.msg" "hyperLayout128.hyp[5].dn"
		;
connectAttr "SingleOrientableJoint__instance_2:hook_scale_constraint.msg" "hyperLayout128.hyp[6].dn"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint_addRotations.msg" "hyperLayout127.hyp[0].dn"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint_dummyRotationsMultiply.msg" "hyperLayout127.hyp[1].dn"
		;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joints_grp.msg" "hyperLayout127.hyp[2].dn"
		;
connectAttr "SingleOrientableJoint__instance_2:creationPose_joints_grp.msg" "hyperLayout127.hyp[3].dn"
		;
connectAttr "unitConversion25.msg" "hyperLayout127.hyp[4].dn";
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint.msg" "hyperLayout127.hyp[5].dn"
		;
connectAttr "SingleOrientableJoint__instance_2:creationPose_joint.msg" "hyperLayout127.hyp[6].dn"
		;
connectAttr "HingeJoint__instance_1:module_grp.msg" "hyperLayout124.hyp[0].dn";
connectAttr "HingeJoint__instance_1:HOOK_IN.msg" "hyperLayout124.hyp[1].dn";
connectAttr "HingeJoint__instance_1:SETTINGS.msg" "hyperLayout124.hyp[2].dn";
connectAttr "HingeJoint__instance_1:blueprint_container.msg" "hyperLayout124.hyp[3].dn"
		;
connectAttr "HingeJoint__instance_1:SETTINGSShape.msg" "hyperLayout124.hyp[4].dn"
		;
connectAttr "hyperLayout123.msg" "HingeJoint__instance_1:blueprint_container.hl"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint_addRotations.msg" "hyperLayout123.hyp[0].dn"
		;
connectAttr "HingeJoint__instance_1:blueprint_root_joint_dummyRotationsMultiply.msg" "hyperLayout123.hyp[1].dn"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint_addRotations.msg" "hyperLayout123.hyp[2].dn"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint_dummyRotationsMultiply.msg" "hyperLayout123.hyp[3].dn"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint_addTx.msg" "hyperLayout123.hyp[4].dn"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint_original_Tx.msg" "hyperLayout123.hyp[5].dn"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint_addRotations.msg" "hyperLayout123.hyp[6].dn"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint_dummyRotationsMultiply.msg" "hyperLayout123.hyp[7].dn"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint_addTx.msg" "hyperLayout123.hyp[8].dn"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint_original_Tx.msg" "hyperLayout123.hyp[9].dn"
		;
connectAttr "HingeJoint__instance_1:blueprint_joints_grp.msg" "hyperLayout123.hyp[10].dn"
		;
connectAttr "HingeJoint__instance_1:creationPose_joints_grp.msg" "hyperLayout123.hyp[11].dn"
		;
connectAttr "unitConversion21.msg" "hyperLayout123.hyp[12].dn";
connectAttr "unitConversion22.msg" "hyperLayout123.hyp[13].dn";
connectAttr "unitConversion23.msg" "hyperLayout123.hyp[14].dn";
connectAttr "HingeJoint__instance_1:blueprint_root_joint.msg" "hyperLayout123.hyp[15].dn"
		;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint.msg" "hyperLayout123.hyp[16].dn"
		;
connectAttr "HingeJoint__instance_1:blueprint_end_joint.msg" "hyperLayout123.hyp[17].dn"
		;
connectAttr "HingeJoint__instance_1:creationPose_root_joint.msg" "hyperLayout123.hyp[18].dn"
		;
connectAttr "HingeJoint__instance_1:creationPose_hinge_joint.msg" "hyperLayout123.hyp[19].dn"
		;
connectAttr "HingeJoint__instance_1:creationPose_end_joint.msg" "hyperLayout123.hyp[20].dn"
		;
connectAttr "hyperLayout125.msg" "RootTransform__instance_8:blueprint_container.hl"
		;
connectAttr "RootTransform__instance_8:module_grp.msg" "hyperLayout126.hyp[0].dn"
		;
connectAttr "RootTransform__instance_8:HOOK_IN.msg" "hyperLayout126.hyp[1].dn";
connectAttr "RootTransform__instance_8:SETTINGS.msg" "hyperLayout126.hyp[2].dn";
connectAttr "RootTransform__instance_8:blueprint_container.msg" "hyperLayout126.hyp[3].dn"
		;
connectAttr "RootTransform__instance_8:SETTINGSShape.msg" "hyperLayout126.hyp[4].dn"
		;
connectAttr "RootTransform__instance_8:blueprint_joint_addRotations.msg" "hyperLayout125.hyp[0].dn"
		;
connectAttr "RootTransform__instance_8:blueprint_joint_dummyRotationsMultiply.msg" "hyperLayout125.hyp[1].dn"
		;
connectAttr "RootTransform__instance_8:blueprint_joint_addTranslate.msg" "hyperLayout125.hyp[2].dn"
		;
connectAttr "RootTransform__instance_8:blueprint_joint_original_Translate.msg" "hyperLayout125.hyp[3].dn"
		;
connectAttr "RootTransform__instance_8:blueprint_joint_addScale.msg" "hyperLayout125.hyp[4].dn"
		;
connectAttr "RootTransform__instance_8:blueprint_joint_original_Scale.msg" "hyperLayout125.hyp[5].dn"
		;
connectAttr "RootTransform__instance_8:blueprint_joints_grp.msg" "hyperLayout125.hyp[6].dn"
		;
connectAttr "RootTransform__instance_8:creationPose_joints_grp.msg" "hyperLayout125.hyp[7].dn"
		;
connectAttr "unitConversion24.msg" "hyperLayout125.hyp[8].dn";
connectAttr "RootTransform__instance_8:blueprint_joint.msg" "hyperLayout125.hyp[9].dn"
		;
connectAttr "RootTransform__instance_8:creationPose_joint.msg" "hyperLayout125.hyp[10].dn"
		;
connectAttr "RootTransform__instance_8:blueprint_joint_addRotations.o3" "unitConversion24.i"
		;
connectAttr "RootTransform__instance_8:blueprint_joint_original_Translate.o" "RootTransform__instance_8:blueprint_joint_addTranslate.i3[0]"
		;
connectAttr "RootTransform__instance_8:blueprint_joint_dummyRotationsMultiply.o" "RootTransform__instance_8:blueprint_joint_addRotations.i3[0]"
		;
connectAttr "RootTransform__instance_8:SETTINGS.creationPoseWeight" "RootTransform__instance_8:blueprint_joint_original_Translate.i2x"
		;
connectAttr "RootTransform__instance_8:SETTINGS.creationPoseWeight" "RootTransform__instance_8:blueprint_joint_original_Translate.i2y"
		;
connectAttr "RootTransform__instance_8:SETTINGS.creationPoseWeight" "RootTransform__instance_8:blueprint_joint_original_Translate.i2z"
		;
connectAttr "RootTransform__instance_8:blueprint_joint_original_Scale.o" "RootTransform__instance_8:blueprint_joint_addScale.i3[0]"
		;
connectAttr "RootTransform__instance_8:SETTINGS.creationPoseWeight" "RootTransform__instance_8:blueprint_joint_original_Scale.i2x"
		;
connectAttr "RootTransform__instance_8:SETTINGS.creationPoseWeight" "RootTransform__instance_8:blueprint_joint_original_Scale.i2y"
		;
connectAttr "RootTransform__instance_8:SETTINGS.creationPoseWeight" "RootTransform__instance_8:blueprint_joint_original_Scale.i2z"
		;
connectAttr "Finger__instance_3:module_grp.msg" "hyperLayout116.hyp[0].dn";
connectAttr "Finger__instance_3:HOOK_IN.msg" "hyperLayout116.hyp[1].dn";
connectAttr "Finger__instance_3:SETTINGS.msg" "hyperLayout116.hyp[2].dn";
connectAttr "Finger__instance_3:blueprint_container.msg" "hyperLayout116.hyp[3].dn"
		;
connectAttr "Finger__instance_3:SETTINGSShape.msg" "hyperLayout116.hyp[4].dn";
connectAttr "Finger__instance_3:hook_parent_constraint.msg" "hyperLayout116.hyp[5].dn"
		;
connectAttr "Finger__instance_3:hook_scale_constraint.msg" "hyperLayout116.hyp[6].dn"
		;
connectAttr "hyperLayout115.msg" "Finger__instance_3:blueprint_container.hl";
connectAttr "Finger__instance_3:blueprint_root_joint_dummyRotationsMultiply.o" "Finger__instance_3:blueprint_root_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_3:SETTINGS.creationPoseWeight" "Finger__instance_3:blueprint_knuckle_2_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_3:SETTINGS.creationPoseWeight" "Finger__instance_3:blueprint_end_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint_dummyRotationsMultiply.o" "Finger__instance_3:blueprint_knuckle_3_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint_dummyRotationsMultiply.o" "Finger__instance_3:blueprint_knuckle_1_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_3:SETTINGS.creationPoseWeight" "Finger__instance_3:blueprint_knuckle_1_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint_original_Tx.ox" "Finger__instance_3:blueprint_knuckle_3_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_3:blueprint_end_joint_dummyRotationsMultiply.o" "Finger__instance_3:blueprint_end_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint_original_Tx.ox" "Finger__instance_3:blueprint_knuckle_1_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint_dummyRotationsMultiply.o" "Finger__instance_3:blueprint_knuckle_2_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint_original_Tx.ox" "Finger__instance_3:blueprint_knuckle_2_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_3:blueprint_end_joint_original_Tx.ox" "Finger__instance_3:blueprint_end_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_3:SETTINGS.creationPoseWeight" "Finger__instance_3:blueprint_knuckle_3_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_3:blueprint_end_joint_addRotations.o3" "unitConversion5.i"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint_addRotations.o3" "unitConversion2.i"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint_addRotations.o3" "unitConversion3.i"
		;
connectAttr "Finger__instance_3:blueprint_root_joint_addRotations.o3" "unitConversion1.i"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint_addRotations.o3" "unitConversion4.i"
		;
connectAttr "Finger__instance_3:blueprint_root_joint_addRotations.msg" "hyperLayout115.hyp[0].dn"
		;
connectAttr "Finger__instance_3:blueprint_root_joint_dummyRotationsMultiply.msg" "hyperLayout115.hyp[1].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint_addRotations.msg" "hyperLayout115.hyp[2].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint_dummyRotationsMultiply.msg" "hyperLayout115.hyp[3].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint_addTx.msg" "hyperLayout115.hyp[4].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint_original_Tx.msg" "hyperLayout115.hyp[5].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint_addRotations.msg" "hyperLayout115.hyp[6].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint_dummyRotationsMultiply.msg" "hyperLayout115.hyp[7].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint_addTx.msg" "hyperLayout115.hyp[8].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint_original_Tx.msg" "hyperLayout115.hyp[9].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint_addRotations.msg" "hyperLayout115.hyp[10].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint_dummyRotationsMultiply.msg" "hyperLayout115.hyp[11].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint_addTx.msg" "hyperLayout115.hyp[12].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint_original_Tx.msg" "hyperLayout115.hyp[13].dn"
		;
connectAttr "Finger__instance_3:blueprint_end_joint_addRotations.msg" "hyperLayout115.hyp[14].dn"
		;
connectAttr "Finger__instance_3:blueprint_end_joint_dummyRotationsMultiply.msg" "hyperLayout115.hyp[15].dn"
		;
connectAttr "Finger__instance_3:blueprint_end_joint_addTx.msg" "hyperLayout115.hyp[16].dn"
		;
connectAttr "Finger__instance_3:blueprint_end_joint_original_Tx.msg" "hyperLayout115.hyp[17].dn"
		;
connectAttr "Finger__instance_3:blueprint_joints_grp.msg" "hyperLayout115.hyp[18].dn"
		;
connectAttr "Finger__instance_3:creationPose_joints_grp.msg" "hyperLayout115.hyp[19].dn"
		;
connectAttr "unitConversion1.msg" "hyperLayout115.hyp[20].dn";
connectAttr "unitConversion2.msg" "hyperLayout115.hyp[21].dn";
connectAttr "unitConversion3.msg" "hyperLayout115.hyp[22].dn";
connectAttr "unitConversion4.msg" "hyperLayout115.hyp[23].dn";
connectAttr "unitConversion5.msg" "hyperLayout115.hyp[24].dn";
connectAttr "Finger__instance_3:blueprint_root_joint.msg" "hyperLayout115.hyp[25].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint.msg" "hyperLayout115.hyp[26].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint.msg" "hyperLayout115.hyp[27].dn"
		;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint.msg" "hyperLayout115.hyp[28].dn"
		;
connectAttr "Finger__instance_3:blueprint_end_joint.msg" "hyperLayout115.hyp[29].dn"
		;
connectAttr "Finger__instance_3:creationPose_root_joint.msg" "hyperLayout115.hyp[30].dn"
		;
connectAttr "Finger__instance_3:creationPose_knuckle_1_joint.msg" "hyperLayout115.hyp[31].dn"
		;
connectAttr "Finger__instance_3:creationPose_knuckle_2_joint.msg" "hyperLayout115.hyp[32].dn"
		;
connectAttr "Finger__instance_3:creationPose_knuckle_3_joint.msg" "hyperLayout115.hyp[33].dn"
		;
connectAttr "Finger__instance_3:creationPose_end_joint.msg" "hyperLayout115.hyp[34].dn"
		;
connectAttr "Finger__instance_5:module_grp.msg" "hyperLayout120.hyp[0].dn";
connectAttr "Finger__instance_5:HOOK_IN.msg" "hyperLayout120.hyp[1].dn";
connectAttr "Finger__instance_5:SETTINGS.msg" "hyperLayout120.hyp[2].dn";
connectAttr "Finger__instance_5:blueprint_container.msg" "hyperLayout120.hyp[3].dn"
		;
connectAttr "Finger__instance_5:SETTINGSShape.msg" "hyperLayout120.hyp[4].dn";
connectAttr "Finger__instance_5:hook_parent_constraint.msg" "hyperLayout120.hyp[5].dn"
		;
connectAttr "Finger__instance_5:hook_scale_constraint.msg" "hyperLayout120.hyp[6].dn"
		;
connectAttr "hyperLayout119.msg" "Finger__instance_5:blueprint_container.hl";
connectAttr "Finger__instance_5:blueprint_root_joint_dummyRotationsMultiply.o" "Finger__instance_5:blueprint_root_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint_dummyRotationsMultiply.o" "Finger__instance_5:blueprint_knuckle_1_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_5:blueprint_root_joint_addRotations.msg" "hyperLayout119.hyp[0].dn"
		;
connectAttr "Finger__instance_5:blueprint_root_joint_dummyRotationsMultiply.msg" "hyperLayout119.hyp[1].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint_addRotations.msg" "hyperLayout119.hyp[2].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint_dummyRotationsMultiply.msg" "hyperLayout119.hyp[3].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint_addTx.msg" "hyperLayout119.hyp[4].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint_original_Tx.msg" "hyperLayout119.hyp[5].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint_addRotations.msg" "hyperLayout119.hyp[6].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint_dummyRotationsMultiply.msg" "hyperLayout119.hyp[7].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint_addTx.msg" "hyperLayout119.hyp[8].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint_original_Tx.msg" "hyperLayout119.hyp[9].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint_addRotations.msg" "hyperLayout119.hyp[10].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint_dummyRotationsMultiply.msg" "hyperLayout119.hyp[11].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint_addTx.msg" "hyperLayout119.hyp[12].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint_original_Tx.msg" "hyperLayout119.hyp[13].dn"
		;
connectAttr "Finger__instance_5:blueprint_end_joint_addRotations.msg" "hyperLayout119.hyp[14].dn"
		;
connectAttr "Finger__instance_5:blueprint_end_joint_dummyRotationsMultiply.msg" "hyperLayout119.hyp[15].dn"
		;
connectAttr "Finger__instance_5:blueprint_end_joint_addTx.msg" "hyperLayout119.hyp[16].dn"
		;
connectAttr "Finger__instance_5:blueprint_end_joint_original_Tx.msg" "hyperLayout119.hyp[17].dn"
		;
connectAttr "Finger__instance_5:blueprint_joints_grp.msg" "hyperLayout119.hyp[18].dn"
		;
connectAttr "Finger__instance_5:creationPose_joints_grp.msg" "hyperLayout119.hyp[19].dn"
		;
connectAttr "unitConversion11.msg" "hyperLayout119.hyp[20].dn";
connectAttr "unitConversion12.msg" "hyperLayout119.hyp[21].dn";
connectAttr "unitConversion13.msg" "hyperLayout119.hyp[22].dn";
connectAttr "unitConversion14.msg" "hyperLayout119.hyp[23].dn";
connectAttr "unitConversion15.msg" "hyperLayout119.hyp[24].dn";
connectAttr "Finger__instance_5:blueprint_root_joint.msg" "hyperLayout119.hyp[25].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint.msg" "hyperLayout119.hyp[26].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint.msg" "hyperLayout119.hyp[27].dn"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint.msg" "hyperLayout119.hyp[28].dn"
		;
connectAttr "Finger__instance_5:blueprint_end_joint.msg" "hyperLayout119.hyp[29].dn"
		;
connectAttr "Finger__instance_5:creationPose_root_joint.msg" "hyperLayout119.hyp[30].dn"
		;
connectAttr "Finger__instance_5:creationPose_knuckle_1_joint.msg" "hyperLayout119.hyp[31].dn"
		;
connectAttr "Finger__instance_5:creationPose_knuckle_2_joint.msg" "hyperLayout119.hyp[32].dn"
		;
connectAttr "Finger__instance_5:creationPose_knuckle_3_joint.msg" "hyperLayout119.hyp[33].dn"
		;
connectAttr "Finger__instance_5:creationPose_end_joint.msg" "hyperLayout119.hyp[34].dn"
		;
connectAttr "Finger__instance_5:blueprint_root_joint_addRotations.o3" "unitConversion11.i"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint_addRotations.o3" "unitConversion12.i"
		;
connectAttr "Finger__instance_5:blueprint_end_joint_addRotations.o3" "unitConversion15.i"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint_addRotations.o3" "unitConversion13.i"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint_addRotations.o3" "unitConversion14.i"
		;
connectAttr "Finger__instance_5:SETTINGS.creationPoseWeight" "Finger__instance_5:blueprint_knuckle_2_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_5:blueprint_end_joint_original_Tx.ox" "Finger__instance_5:blueprint_end_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint_original_Tx.ox" "Finger__instance_5:blueprint_knuckle_2_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint_dummyRotationsMultiply.o" "Finger__instance_5:blueprint_knuckle_2_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_5:SETTINGS.creationPoseWeight" "Finger__instance_5:blueprint_end_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_5:blueprint_end_joint_dummyRotationsMultiply.o" "Finger__instance_5:blueprint_end_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_5:SETTINGS.creationPoseWeight" "Finger__instance_5:blueprint_knuckle_1_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint_dummyRotationsMultiply.o" "Finger__instance_5:blueprint_knuckle_3_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint_original_Tx.ox" "Finger__instance_5:blueprint_knuckle_1_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint_original_Tx.ox" "Finger__instance_5:blueprint_knuckle_3_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_5:SETTINGS.creationPoseWeight" "Finger__instance_5:blueprint_knuckle_3_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_6:module_grp.msg" "hyperLayout122.hyp[0].dn";
connectAttr "Finger__instance_6:HOOK_IN.msg" "hyperLayout122.hyp[1].dn";
connectAttr "Finger__instance_6:SETTINGS.msg" "hyperLayout122.hyp[2].dn";
connectAttr "Finger__instance_6:blueprint_container.msg" "hyperLayout122.hyp[3].dn"
		;
connectAttr "Finger__instance_6:SETTINGSShape.msg" "hyperLayout122.hyp[4].dn";
connectAttr "Finger__instance_6:hook_parent_constraint.msg" "hyperLayout122.hyp[5].dn"
		;
connectAttr "Finger__instance_6:hook_scale_constraint.msg" "hyperLayout122.hyp[6].dn"
		;
connectAttr "hyperLayout121.msg" "Finger__instance_6:blueprint_container.hl";
connectAttr "Finger__instance_6:blueprint_root_joint_addRotations.msg" "hyperLayout121.hyp[0].dn"
		;
connectAttr "Finger__instance_6:blueprint_root_joint_dummyRotationsMultiply.msg" "hyperLayout121.hyp[1].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint_addRotations.msg" "hyperLayout121.hyp[2].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint_dummyRotationsMultiply.msg" "hyperLayout121.hyp[3].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint_addTx.msg" "hyperLayout121.hyp[4].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint_original_Tx.msg" "hyperLayout121.hyp[5].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint_addRotations.msg" "hyperLayout121.hyp[6].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint_dummyRotationsMultiply.msg" "hyperLayout121.hyp[7].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint_addTx.msg" "hyperLayout121.hyp[8].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint_original_Tx.msg" "hyperLayout121.hyp[9].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint_addRotations.msg" "hyperLayout121.hyp[10].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint_dummyRotationsMultiply.msg" "hyperLayout121.hyp[11].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint_addTx.msg" "hyperLayout121.hyp[12].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint_original_Tx.msg" "hyperLayout121.hyp[13].dn"
		;
connectAttr "Finger__instance_6:blueprint_end_joint_addRotations.msg" "hyperLayout121.hyp[14].dn"
		;
connectAttr "Finger__instance_6:blueprint_end_joint_dummyRotationsMultiply.msg" "hyperLayout121.hyp[15].dn"
		;
connectAttr "Finger__instance_6:blueprint_end_joint_addTx.msg" "hyperLayout121.hyp[16].dn"
		;
connectAttr "Finger__instance_6:blueprint_end_joint_original_Tx.msg" "hyperLayout121.hyp[17].dn"
		;
connectAttr "Finger__instance_6:blueprint_joints_grp.msg" "hyperLayout121.hyp[18].dn"
		;
connectAttr "Finger__instance_6:creationPose_joints_grp.msg" "hyperLayout121.hyp[19].dn"
		;
connectAttr "unitConversion16.msg" "hyperLayout121.hyp[20].dn";
connectAttr "unitConversion17.msg" "hyperLayout121.hyp[21].dn";
connectAttr "unitConversion18.msg" "hyperLayout121.hyp[22].dn";
connectAttr "unitConversion19.msg" "hyperLayout121.hyp[23].dn";
connectAttr "unitConversion20.msg" "hyperLayout121.hyp[24].dn";
connectAttr "Finger__instance_6:blueprint_root_joint.msg" "hyperLayout121.hyp[25].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint.msg" "hyperLayout121.hyp[26].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint.msg" "hyperLayout121.hyp[27].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint.msg" "hyperLayout121.hyp[28].dn"
		;
connectAttr "Finger__instance_6:blueprint_end_joint.msg" "hyperLayout121.hyp[29].dn"
		;
connectAttr "Finger__instance_6:creationPose_root_joint.msg" "hyperLayout121.hyp[30].dn"
		;
connectAttr "Finger__instance_6:creationPose_knuckle_1_joint.msg" "hyperLayout121.hyp[31].dn"
		;
connectAttr "Finger__instance_6:creationPose_knuckle_2_joint.msg" "hyperLayout121.hyp[32].dn"
		;
connectAttr "Finger__instance_6:creationPose_knuckle_3_joint.msg" "hyperLayout121.hyp[33].dn"
		;
connectAttr "Finger__instance_6:creationPose_end_joint.msg" "hyperLayout121.hyp[34].dn"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint_addRotations.o3" "unitConversion17.i"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint_addRotations.o3" "unitConversion19.i"
		;
connectAttr "Finger__instance_6:blueprint_root_joint_addRotations.o3" "unitConversion16.i"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint_addRotations.o3" "unitConversion18.i"
		;
connectAttr "Finger__instance_6:blueprint_end_joint_addRotations.o3" "unitConversion20.i"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint_dummyRotationsMultiply.o" "Finger__instance_6:blueprint_knuckle_3_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint_original_Tx.ox" "Finger__instance_6:blueprint_knuckle_2_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_6:SETTINGS.creationPoseWeight" "Finger__instance_6:blueprint_knuckle_3_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_6:SETTINGS.creationPoseWeight" "Finger__instance_6:blueprint_end_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint_dummyRotationsMultiply.o" "Finger__instance_6:blueprint_knuckle_1_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint_original_Tx.ox" "Finger__instance_6:blueprint_knuckle_1_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_6:SETTINGS.creationPoseWeight" "Finger__instance_6:blueprint_knuckle_1_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_6:blueprint_root_joint_dummyRotationsMultiply.o" "Finger__instance_6:blueprint_root_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint_dummyRotationsMultiply.o" "Finger__instance_6:blueprint_knuckle_2_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_6:SETTINGS.creationPoseWeight" "Finger__instance_6:blueprint_knuckle_2_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint_original_Tx.ox" "Finger__instance_6:blueprint_knuckle_3_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_6:blueprint_end_joint_dummyRotationsMultiply.o" "Finger__instance_6:blueprint_end_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_6:blueprint_end_joint_original_Tx.ox" "Finger__instance_6:blueprint_end_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_4:module_grp.msg" "hyperLayout118.hyp[0].dn";
connectAttr "Finger__instance_4:HOOK_IN.msg" "hyperLayout118.hyp[1].dn";
connectAttr "Finger__instance_4:SETTINGS.msg" "hyperLayout118.hyp[2].dn";
connectAttr "Finger__instance_4:blueprint_container.msg" "hyperLayout118.hyp[3].dn"
		;
connectAttr "Finger__instance_4:SETTINGSShape.msg" "hyperLayout118.hyp[4].dn";
connectAttr "Finger__instance_4:hook_parent_constraint.msg" "hyperLayout118.hyp[5].dn"
		;
connectAttr "Finger__instance_4:hook_scale_constraint.msg" "hyperLayout118.hyp[6].dn"
		;
connectAttr "hyperLayout117.msg" "Finger__instance_4:blueprint_container.hl";
connectAttr "Finger__instance_4:blueprint_root_joint_dummyRotationsMultiply.o" "Finger__instance_4:blueprint_root_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_4:SETTINGS.creationPoseWeight" "Finger__instance_4:blueprint_knuckle_1_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_4:SETTINGS.creationPoseWeight" "Finger__instance_4:blueprint_knuckle_2_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_4:SETTINGS.creationPoseWeight" "Finger__instance_4:blueprint_knuckle_3_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint_original_Tx.ox" "Finger__instance_4:blueprint_knuckle_1_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_4:blueprint_end_joint_dummyRotationsMultiply.o" "Finger__instance_4:blueprint_end_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_4:blueprint_end_joint_original_Tx.ox" "Finger__instance_4:blueprint_end_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint_dummyRotationsMultiply.o" "Finger__instance_4:blueprint_knuckle_1_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint_dummyRotationsMultiply.o" "Finger__instance_4:blueprint_knuckle_3_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint_original_Tx.ox" "Finger__instance_4:blueprint_knuckle_2_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint_original_Tx.ox" "Finger__instance_4:blueprint_knuckle_3_joint_addTx.i1[0]"
		;
connectAttr "Finger__instance_4:SETTINGS.creationPoseWeight" "Finger__instance_4:blueprint_end_joint_original_Tx.i2x"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint_dummyRotationsMultiply.o" "Finger__instance_4:blueprint_knuckle_2_joint_addRotations.i3[0]"
		;
connectAttr "Finger__instance_4:blueprint_root_joint_addRotations.msg" "hyperLayout117.hyp[0].dn"
		;
connectAttr "Finger__instance_4:blueprint_root_joint_dummyRotationsMultiply.msg" "hyperLayout117.hyp[1].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint_addRotations.msg" "hyperLayout117.hyp[2].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint_dummyRotationsMultiply.msg" "hyperLayout117.hyp[3].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint_addTx.msg" "hyperLayout117.hyp[4].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint_original_Tx.msg" "hyperLayout117.hyp[5].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint_addRotations.msg" "hyperLayout117.hyp[6].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint_dummyRotationsMultiply.msg" "hyperLayout117.hyp[7].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint_addTx.msg" "hyperLayout117.hyp[8].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint_original_Tx.msg" "hyperLayout117.hyp[9].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint_addRotations.msg" "hyperLayout117.hyp[10].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint_dummyRotationsMultiply.msg" "hyperLayout117.hyp[11].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint_addTx.msg" "hyperLayout117.hyp[12].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint_original_Tx.msg" "hyperLayout117.hyp[13].dn"
		;
connectAttr "Finger__instance_4:blueprint_end_joint_addRotations.msg" "hyperLayout117.hyp[14].dn"
		;
connectAttr "Finger__instance_4:blueprint_end_joint_dummyRotationsMultiply.msg" "hyperLayout117.hyp[15].dn"
		;
connectAttr "Finger__instance_4:blueprint_end_joint_addTx.msg" "hyperLayout117.hyp[16].dn"
		;
connectAttr "Finger__instance_4:blueprint_end_joint_original_Tx.msg" "hyperLayout117.hyp[17].dn"
		;
connectAttr "Finger__instance_4:blueprint_joints_grp.msg" "hyperLayout117.hyp[18].dn"
		;
connectAttr "Finger__instance_4:creationPose_joints_grp.msg" "hyperLayout117.hyp[19].dn"
		;
connectAttr "unitConversion6.msg" "hyperLayout117.hyp[20].dn";
connectAttr "unitConversion7.msg" "hyperLayout117.hyp[21].dn";
connectAttr "unitConversion8.msg" "hyperLayout117.hyp[22].dn";
connectAttr "unitConversion9.msg" "hyperLayout117.hyp[23].dn";
connectAttr "unitConversion10.msg" "hyperLayout117.hyp[24].dn";
connectAttr "Finger__instance_4:blueprint_root_joint.msg" "hyperLayout117.hyp[25].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint.msg" "hyperLayout117.hyp[26].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint.msg" "hyperLayout117.hyp[27].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint.msg" "hyperLayout117.hyp[28].dn"
		;
connectAttr "Finger__instance_4:blueprint_end_joint.msg" "hyperLayout117.hyp[29].dn"
		;
connectAttr "Finger__instance_4:creationPose_root_joint.msg" "hyperLayout117.hyp[30].dn"
		;
connectAttr "Finger__instance_4:creationPose_knuckle_1_joint.msg" "hyperLayout117.hyp[31].dn"
		;
connectAttr "Finger__instance_4:creationPose_knuckle_2_joint.msg" "hyperLayout117.hyp[32].dn"
		;
connectAttr "Finger__instance_4:creationPose_knuckle_3_joint.msg" "hyperLayout117.hyp[33].dn"
		;
connectAttr "Finger__instance_4:creationPose_end_joint.msg" "hyperLayout117.hyp[34].dn"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint_addRotations.o3" "unitConversion7.i"
		;
connectAttr "Finger__instance_4:blueprint_root_joint_addRotations.o3" "unitConversion6.i"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint_addRotations.o3" "unitConversion8.i"
		;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint_addRotations.o3" "unitConversion9.i"
		;
connectAttr "Finger__instance_4:blueprint_end_joint_addRotations.o3" "unitConversion10.i"
		;
connectAttr "Finger__instance_3:blueprint_root_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_root_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_knuckle_1_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_knuckle_2_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_knuckle_3_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_end_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_end_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_end_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_3:blueprint_end_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_root_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_root_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_knuckle_1_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_knuckle_2_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_knuckle_3_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_end_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_end_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_end_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_4:blueprint_end_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_root_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_root_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_knuckle_1_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_knuckle_2_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_knuckle_3_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_end_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_end_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_end_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_5:blueprint_end_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_root_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_root_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_knuckle_1_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_knuckle_2_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_knuckle_3_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_end_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_end_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_end_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Finger__instance_6:blueprint_end_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "HingeJoint__instance_1:blueprint_root_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "HingeJoint__instance_1:blueprint_root_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "HingeJoint__instance_1:blueprint_hinge_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "HingeJoint__instance_1:blueprint_end_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "HingeJoint__instance_1:blueprint_end_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "HingeJoint__instance_1:blueprint_end_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "HingeJoint__instance_1:blueprint_end_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "RootTransform__instance_8:blueprint_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "RootTransform__instance_8:blueprint_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "RootTransform__instance_8:blueprint_joint_addTranslate.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "RootTransform__instance_8:blueprint_joint_original_Translate.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "RootTransform__instance_8:blueprint_joint_addScale.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "RootTransform__instance_8:blueprint_joint_original_Scale.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "SingleOrientableJoint__instance_2:blueprint_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_root_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_root_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_knuckle_1_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_knuckle_2_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_end_joint_addRotations.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_end_joint_dummyRotationsMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_end_joint_addTx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Thumb__instance_7:blueprint_end_joint_original_Tx.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "blueprint_root_joint_geoAttach_scaleGrp1_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "blueprint_hinge_joint_geoAttach_scaleGrp1_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "reverse_moduleMaintenanceVisibility.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "moduleVisibilityMultiply.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "non_blueprint_visibilityMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "pCylinderShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinderShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape1.iog" ":initialShadingGroup.dsm" -na;
// End of Arm.ma
