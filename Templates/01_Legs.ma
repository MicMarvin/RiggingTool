//Maya ASCII 2022 scene
//Name: 01_Legs.ma
//Last modified: Wed, Dec 11, 2024 07:31:05 PM
//Codeset: 1252
requires maya "2022";
requires "stereoCamera" "10.0";
requires "mtoa" "5.0.0.1";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202110272215-ad32f8f1e6";
fileInfo "osv" "Windows 10 Pro for Workstations v2009 (Build: 19045)";
fileInfo "UUID" "BD17F5B9-481A-ACAD-EB3E-9AA08A241CA7";
createNode transform -n "LegFoot__instance_1:module_grp";
	rename -uid "1B9B3EE1-45E6-8399-6FA3-98AAC98ECBD1";
	addAttr -ci true -sn "mirrorLinks" -ln "mirrorLinks" -dt "string";
	setAttr ".mirrorLinks" -type "string" "LegFoot__instance_1_mirror__X";
createNode transform -n "LegFoot__instance_1:joints_grp" -p "LegFoot__instance_1:module_grp";
	rename -uid "C87E66BC-4362-72E5-1D24-1585A76F5EB7";
createNode joint -n "LegFoot__instance_1:hip_joint" -p "LegFoot__instance_1:joints_grp";
	rename -uid "48F47C3B-4D5C-66BA-D76A-D2B8C73644F2";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 89.999999999999929 -104.03624346792657 -75.963756532073504 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 14.036243467926484 0 ;
createNode joint -n "LegFoot__instance_1:knee_joint" -p "LegFoot__instance_1:hip_joint";
	rename -uid "8F761810-4B24-46D1-CC11-E7BD6910B111";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.2053368091583252 0 3.3306690738754696e-16 ;
	setAttr ".r" -type "double3" 180 -3.166472612658624e-14 1.9389052748400701e-30 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -28.072486935852961 0 ;
createNode joint -n "LegFoot__instance_1:ankle_joint" -p "LegFoot__instance_1:knee_joint";
	rename -uid "5045B888-43C3-9434-3012-BA8AA2598378";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.2053366899490356 0 3.3306690738754696e-16 ;
	setAttr ".r" -type "double3" 90.000000000000071 59.806417898519662 46.48887222312122 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 153.4273414719969 -23.00936329637852 -128.00775720672615 ;
createNode joint -n "LegFoot__instance_1:ball_joint" -p "LegFoot__instance_1:ankle_joint";
	rename -uid "C6384923-46A5-7DD5-84DB-40A6B49B0270";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.92445111274719238 -1.3322676295501878e-15 -8.8817841970012523e-16 ;
	setAttr ".r" -type "double3" 51.432560808574024 -55.722094138537642 -56.620290040644072 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -7.2465789628297293e-14 69.443954780416533 46.488872223121135 ;
createNode joint -n "LegFoot__instance_1:toe_joint" -p "LegFoot__instance_1:ball_joint";
	rename -uid "C41E365A-4384-BE6B-E800-E39BCC5F6FE6";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.87701129913330078 2.7755575615628914e-15 -1.6653345369377669e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 89.999999999999957 0 ;
createNode ikEffector -n "LegFoot__instance_1:ball_jointikEffector" -p "LegFoot__instance_1:ball_joint";
	rename -uid "A2053B88-4F2B-08C4-3FD6-F5B75F89A85A";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "LegFoot__instance_1:ankle_jointikEffector" -p "LegFoot__instance_1:ankle_joint";
	rename -uid "38971617-46B8-9278-C77C-799280DD0100";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "LegFoot__instance_1:knee_jointikEffector" -p "LegFoot__instance_1:knee_joint";
	rename -uid "CEAF4A4C-46F9-3A5D-15E9-E7A30722D9F1";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode pointConstraint -n "LegFoot__instance_1:hip_joint_pointConstraint" -p "LegFoot__instance_1:hip_joint";
	rename -uid "64031C50-4592-D81D-7673-B6B9715552A1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
createNode ikEffector -n "LegFoot__instance_1:hip_jointikEffector" -p "LegFoot__instance_1:hip_joint";
	rename -uid "CCC79976-446C-1625-C81C-2FA21A91E50F";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikHandle -n "LegFoot__instance_1:hip_joint_ikHandle" -p "LegFoot__instance_1:joints_grp";
	rename -uid "78A088D5-4983-53D0-F773-DE977DAC40DF";
	setAttr ".v" no;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "hip_joint_ikHandle_poleVectorConstraint1" -p "LegFoot__instance_1:hip_joint_ikHandle";
	rename -uid "1FF12861-4CC8-BD56-9692-E4A629897A9F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_joint_translation_control_poleVectorLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 -0.5 0 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint" 
		-p "LegFoot__instance_1:hip_joint_ikHandle";
	rename -uid "85AA827E-4DD2-D128-5AA4-C2B8235B8E33";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_joint_endPosLocatorW0" -dv 1 
		-min 0 -at "double";
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
	setAttr ".rst" -type "double3" 4 0 -1.0000000000000002 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:hip_joint_rootPosLocator" -p "LegFoot__instance_1:joints_grp";
	rename -uid "3F2FB3F4-4802-2919-9980-B8BB11AEF4F1";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:hip_joint_rootPosLocatorShape" -p "LegFoot__instance_1:hip_joint_rootPosLocator";
	rename -uid "84B44E69-4FB3-07E7-5651-4590C58E8074";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint" 
		-p "LegFoot__instance_1:hip_joint_rootPosLocator";
	rename -uid "95C17DB0-4D71-DC00-ACB8-99943529B894";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_jointW0" -dv 1 -min 0 -at "double";
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
createNode transform -n "LegFoot__instance_1:knee_joint_endPosLocator" -p "LegFoot__instance_1:joints_grp";
	rename -uid "4004B82C-4E97-63E7-8097-938E85EFCD87";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:knee_joint_endPosLocatorShape" -p "LegFoot__instance_1:knee_joint_endPosLocator";
	rename -uid "649885FE-4C0A-90C9-6C72-5EBB4B6AE230";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint" 
		-p "LegFoot__instance_1:knee_joint_endPosLocator";
	rename -uid "531590B4-4689-53B4-0CC4-0DBE936DA6C1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 4 0 -1.0000000000000002 ;
	setAttr -k on ".w0";
createNode ikHandle -n "LegFoot__instance_1:knee_joint_ikHandle" -p "LegFoot__instance_1:joints_grp";
	rename -uid "03BBE6D2-4205-D85A-4B1E-9E8EB2086486";
	setAttr ".v" no;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "knee_joint_ikHandle_poleVectorConstraint1" -p
		 "LegFoot__instance_1:knee_joint_ikHandle";
	rename -uid "6854883B-4D53-FD2E-65C6-C09A5F32697B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_joint_translation_control_poleVectorLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 9.6671985527763127e-08 -0.49999999999999967 -2.4167996159896177e-08 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint" 
		-p "LegFoot__instance_1:knee_joint_ikHandle";
	rename -uid "0B2E345B-4F39-833E-78BE-1F9BC1EAE4F2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_joint_endPosLocatorW0" -dv 
		1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 7.5294116680338963 -1.9402850002906642 -1.8823529170084747 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:knee_joint_rootPosLocator" -p "LegFoot__instance_1:joints_grp";
	rename -uid "02F2BE05-4B52-2E53-53F2-FE8A0F54EC1D";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:knee_joint_rootPosLocatorShape" -p "LegFoot__instance_1:knee_joint_rootPosLocator";
	rename -uid "D533A3B7-4D04-EAC4-E573-A4A47E1860B1";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint" 
		-p "LegFoot__instance_1:knee_joint_rootPosLocator";
	rename -uid "A2D43FE7-4EAB-7A00-DC61-62B603236813";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 3.9999999033280145 -3.3306690738754696e-16 -0.99999997583200406 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:ankle_joint_endPosLocator" -p "LegFoot__instance_1:joints_grp";
	rename -uid "FB570F35-4D8B-2120-3CEF-43A7A3657FB7";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:ankle_joint_endPosLocatorShape" -p "LegFoot__instance_1:ankle_joint_endPosLocator";
	rename -uid "BBDF0234-4891-7787-41B0-42BCB5A52745";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint" 
		-p "LegFoot__instance_1:ankle_joint_endPosLocator";
	rename -uid "4FD05014-4E5F-27B6-420C-32B9B2890308";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 8 0 -2.2204460492503131e-16 ;
	setAttr -k on ".w0";
createNode ikHandle -n "LegFoot__instance_1:ankle_joint_ikHandle" -p "LegFoot__instance_1:joints_grp";
	rename -uid "846B8294-4A39-8792-128E-7E934A23288D";
	setAttr ".v" no;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ankle_joint_ikHandle_poleVectorConstraint1" -p
		 "LegFoot__instance_1:ankle_joint_ikHandle";
	rename -uid "208200EE-4F7D-B063-1D19-D0B233BB34A4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_joint_translation_control_poleVectorLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 1.8197079754145307e-07 -0.50000000000000044 4.5492696276738798e-08 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint" 
		-p "LegFoot__instance_1:ankle_joint_ikHandle";
	rename -uid "D4FD2B77-4188-DA1F-231F-58B6DEB6BE86";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ball_joint_endPosLocatorW0" -dv 1 
		-min 0 -at "double";
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
	setAttr ".rst" -type "double3" 3.3592910232237818 -4.8507116566562551 -10.437165288306224 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:ankle_joint_rootPosLocator" -p "LegFoot__instance_1:joints_grp";
	rename -uid "8DE4F698-4E88-7AD4-5D5F-05AFC3A4CA78";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:ankle_joint_rootPosLocatorShape" -p "LegFoot__instance_1:ankle_joint_rootPosLocator";
	rename -uid "340C6D09-46BB-BB85-A715-52B2CBDDDDC5";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint" 
		-p "LegFoot__instance_1:ankle_joint_rootPosLocator";
	rename -uid "93E79CD8-426E-5520-F5A8-65943DBE482B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 7.9999998180292025 4.6421107194575482e-16 -4.5492696498783403e-08 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:ball_joint_endPosLocator" -p "LegFoot__instance_1:joints_grp";
	rename -uid "980A69C6-49AD-E24D-D6CB-D8AB72259B98";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:ball_joint_endPosLocatorShape" -p "LegFoot__instance_1:ball_joint_endPosLocator";
	rename -uid "6FF71111-4459-7835-C5CB-43917F058543";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint" 
		-p "LegFoot__instance_1:ball_joint_endPosLocator";
	rename -uid "C458ADF2-4196-C45D-6B02-D5994FF56ECD";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ball_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 -9.0000000000000018 2.9999999999999991 ;
	setAttr -k on ".w0";
createNode ikHandle -n "LegFoot__instance_1:ball_joint_ikHandle" -p "LegFoot__instance_1:joints_grp";
	rename -uid "7943F704-4CAE-1F0F-DF82-07B051EBA932";
	setAttr ".v" no;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ball_joint_ikHandle_poleVectorConstraint1" -p
		 "LegFoot__instance_1:ball_joint_ikHandle";
	rename -uid "CE04B03C-4FB9-3EAB-96E0-CE96BD1F5188";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ball_joint_translation_control_poleVectorLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 9.7418398681270446e-08 -0.4999998904042986 -3.653190727703759e-08 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint" 
		-p "LegFoot__instance_1:ball_joint_ikHandle";
	rename -uid "63A20B35-467F-D677-6F69-8DACB4DDCBEA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "toe_joint_endPosLocatorW0" -dv 1 
		-min 0 -at "double";
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
	setAttr ".rst" -type "double3" -7.3306962250496752e-07 -8.9999995208414063 6.000000036531782 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:ball_joint_rootPosLocator" -p "LegFoot__instance_1:joints_grp";
	rename -uid "E2E1FECB-46D4-D3A9-29D9-8BA860A49B7B";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:ball_joint_rootPosLocatorShape" -p "LegFoot__instance_1:ball_joint_rootPosLocator";
	rename -uid "18B9DAE5-4D29-5542-40C7-01A726CF2817";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint" 
		-p "LegFoot__instance_1:ball_joint_rootPosLocator";
	rename -uid "B9034FA0-4202-BCE3-4A1F-52BCF5ADF5BA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ball_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -9.7418398681270446e-08 -9.0000001095957032 3.0000000365319064 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:toe_joint_endPosLocator" -p "LegFoot__instance_1:joints_grp";
	rename -uid "B6214327-4FB2-5140-B7D1-598E13977065";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:toe_joint_endPosLocatorShape" -p "LegFoot__instance_1:toe_joint_endPosLocator";
	rename -uid "79DC2A4F-4E3C-B2C5-EAF4-BDB92BB151E1";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint" 
		-p "LegFoot__instance_1:toe_joint_endPosLocator";
	rename -uid "F11D1F1D-4328-9CDE-D722-D18629C5ECF7";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "toe_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 2.2186712959340957e-31 -9.0000000000000018 6 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:hierarchyRepresentations_grp" -p "LegFoot__instance_1:module_grp";
	rename -uid "E87A9FD2-4B54-C8A4-C4A8-268930801DB1";
createNode transform -n "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp" 
		-p "LegFoot__instance_1:hierarchyRepresentations_grp";
	rename -uid "88D6637A-40B5-4C5B-DEA1-E8AAC19A3DA2";
createNode transform -n "LegFoot__instance_1:hip_joint_hierarchy_representation" 
		-p "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp";
	rename -uid "04D5A312-47C5-9B72-2140-7486E332DAB2";
createNode nurbsSurface -n "LegFoot__instance_1:hip_joint_hierarchy_representationShape" 
		-p "LegFoot__instance_1:hip_joint_hierarchy_representation";
	rename -uid "F3546602-478C-2232-7B44-A6A5FAE9DE6E";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		6 0 0 0 10 10 10
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		44
		0 -0.15672232497824501 -0.15672232497824506
		0 -0.22163883751087782 -3.5945998741709007e-17
		0 -0.15672232497824509 0.15672232497824481
		0 -2.862699950697759e-16 0.22163883751087754
		0 0.15672232497824459 0.15672232497824484
		0 0.22163883751087743 5.5517673144427339e-18
		0 0.15672232497824468 -0.15672232497824484
		0 -1.030019529394196e-16 -0.22163883751087765
		0 -0.15672232497824501 -0.15672232497824506
		0 -0.22163883751087782 -3.5945998741709007e-17
		0 -0.15672232497824509 0.15672232497824481
		0.33333333333333337 -0.15672232497824487 -0.15672232497824504
		0.33333333333333337 -0.22163883751087768 4.8755612298694312e-18
		0.33333333333333337 -0.15672232497824495 0.15672232497824484
		0.33333333333333331 -1.3824025845308839e-16 0.22163883751087757
		0.33333333333333326 0.15672232497824473 0.15672232497824487
		0.33333333333333326 0.22163883751087757 4.6373327286021172e-17
		0.33333333333333326 0.15672232497824481 -0.15672232497824481
		0.33333333333333331 4.502778367726793e-17 -0.22163883751087762
		0.33333333333333337 -0.15672232497824487 -0.15672232497824504
		0.33333333333333337 -0.22163883751087768 4.8755612298694312e-18
		0.33333333333333337 -0.15672232497824495 0.15672232497824484
		0.66666666666666674 -0.1567223249782447 -0.15672232497824498
		0.66666666666666674 -0.22163883751087751 4.5697121201447876e-17
		0.66666666666666674 -0.15672232497824479 0.1567223249782449
		0.66666666666666674 9.7894781635991762e-18 0.22163883751087762
		0.66666666666666663 0.1567223249782449 0.15672232497824493
		0.66666666666666663 0.22163883751087773 8.719488725759961e-17
		0.66666666666666663 0.15672232497824498 -0.15672232497824476
		0.66666666666666674 1.9305752029395549e-16 -0.22163883751087757
		0.66666666666666674 -0.1567223249782447 -0.15672232497824498
		0.66666666666666674 -0.22163883751087751 4.5697121201447876e-17
		0.66666666666666674 -0.15672232497824479 0.1567223249782449
		1 -0.15672232497824456 -0.15672232497824495
		1 -0.22163883751087737 8.651868117302632e-17
		1 -0.15672232497824465 0.15672232497824493
		1 1.5781921478028672e-16 0.22163883751087765
		1 0.15672232497824504 0.15672232497824495
		1 0.22163883751087787 1.2801644722917804e-16
		1 0.15672232497824512 -0.15672232497824473
		1 3.4108725691064299e-16 -0.22163883751087754
		1 -0.15672232497824456 -0.15672232497824495
		1 -0.22163883751087737 8.651868117302632e-17
		1 -0.15672232497824465 0.15672232497824493
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "LegFoot__instance_1:hip_joint_hierarchy_arrow_representation" 
		-p "LegFoot__instance_1:hip_joint_hierarchy_representation";
	rename -uid "44231C53-40BD-D2DC-014D-C0844B8B01CE";
	setAttr ".r" -type "double3" 0 0 -90 ;
	setAttr ".s" -type "double3" 0.46739519169468152 0.46739519169468152 0.46739519169468152 ;
	setAttr ".rp" -type "double3" 1.1102230246251565e-16 0.5 0 ;
	setAttr ".rpt" -type "double3" 0.49999999999999989 -0.5 0 ;
	setAttr ".sp" -type "double3" 2.3753411339122038e-16 1.0697585445564812 0 ;
	setAttr ".spt" -type "double3" -1.2651181092870475e-16 -0.56975854455648134 0 ;
createNode mesh -n "LegFoot__instance_1:hip_joint_hierarchy_arrow_representationShape" 
		-p "LegFoot__instance_1:hip_joint_hierarchy_arrow_representation";
	rename -uid "4507634D-456A-490C-C087-2A895B43CA9C";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 18 ".uvst[0].uvsp[0:17]" -type "float2" 0.67677665 0.073223323
		 0.5 2.9802322e-08 0.32322332 0.073223323 0.25000003 0.25 0.32322332 0.42677668 0.5
		 0.5 0.67677671 0.42677671 0.75 0.25 0.25 0.5 0.3125 0.5 0.375 0.5 0.4375 0.5 0.5
		 0.5 0.5625 0.5 0.625 0.5 0.6875 0.5 0.75 0.5 0.5 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 9 ".pt[0:8]" -type "float3"  0.33249366 1.0697585 -0.33249369 
		-2.8027111e-08 1.0697585 -0.4702169 -0.33249369 1.0697585 -0.33249369 -0.4702169 
		1.0697585 -1.4013556e-08 -0.33249369 1.0697585 0.33249366 -2.8027111e-08 1.0697585 
		0.4702169 0.33249369 1.0697585 0.33249369 0.4702169 1.0697585 -1.4013556e-08 2.3753411e-16 
		1.0697585 0;
	setAttr -s 9 ".vt[0:8]"  0.70710671 -0.25 -0.70710671 0 -0.25 -0.99999988
		 -0.70710671 -0.25 -0.70710671 -0.99999988 -0.25 0 -0.70710671 -0.25 0.70710671 0 -0.25 0.99999994
		 0.70710677 -0.25 0.70710677 1 -0.25 0 0 0.25 0;
	setAttr -s 16 ".ed[0:15]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 0 0 0 8 0 1 8 0 2 8 0 3 8 0 4 8 0 5 8 0 6 8 0 7 8 0;
	setAttr -s 9 -ch 32 ".fc[0:8]" -type "polyFaces" 
		f 8 -8 -7 -6 -5 -4 -3 -2 -1
		mu 0 8 0 7 6 5 4 3 2 1
		f 3 0 9 -9
		mu 0 3 8 9 17
		f 3 1 10 -10
		mu 0 3 9 10 17
		f 3 2 11 -11
		mu 0 3 10 11 17
		f 3 3 12 -12
		mu 0 3 11 12 17
		f 3 4 13 -13
		mu 0 3 12 13 17
		f 3 5 14 -14
		mu 0 3 13 14 17
		f 3 6 15 -15
		mu 0 3 14 15 17
		f 3 7 8 -16
		mu 0 3 15 16 17;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode parentConstraint -n "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1" 
		-p "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp";
	rename -uid "20E4F13F-4C38-5800-52BB-16A174B7CFAF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 0 194.03624346792651 89.999999999999986 ;
	setAttr ".rsrr" -type "double3" 90 14.036243467926484 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1" 
		-p "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp";
	rename -uid "60551487-4562-3B1B-035C-4FAD2A48115E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "module_transformW0" -dv 1 -min 0 
		-at "double";
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
createNode transform -n "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp" 
		-p "LegFoot__instance_1:hierarchyRepresentations_grp";
	rename -uid "54C71EF2-40E7-0EBB-CEA6-10A91494FE57";
createNode transform -n "LegFoot__instance_1:knee_joint_hierarchy_representation" 
		-p "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp";
	rename -uid "4B8CE0FB-49D1-9D77-09FA-FE92ECD847D4";
createNode nurbsSurface -n "LegFoot__instance_1:knee_joint_hierarchy_representationShape" 
		-p "LegFoot__instance_1:knee_joint_hierarchy_representation";
	rename -uid "8879AD52-4465-FA3F-83E6-50B4D8ED9744";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		6 0 0 0 10 10 10
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		44
		0 -0.15672232497824501 -0.15672232497824506
		0 -0.22163883751087782 -3.5945998741709007e-17
		0 -0.15672232497824509 0.15672232497824481
		0 -2.862699950697759e-16 0.22163883751087754
		0 0.15672232497824459 0.15672232497824484
		0 0.22163883751087743 5.5517673144427339e-18
		0 0.15672232497824468 -0.15672232497824484
		0 -1.030019529394196e-16 -0.22163883751087765
		0 -0.15672232497824501 -0.15672232497824506
		0 -0.22163883751087782 -3.5945998741709007e-17
		0 -0.15672232497824509 0.15672232497824481
		0.33333333333333337 -0.15672232497824487 -0.15672232497824504
		0.33333333333333337 -0.22163883751087768 4.8755612298694312e-18
		0.33333333333333337 -0.15672232497824495 0.15672232497824484
		0.33333333333333331 -1.3824025845308839e-16 0.22163883751087757
		0.33333333333333326 0.15672232497824473 0.15672232497824487
		0.33333333333333326 0.22163883751087757 4.6373327286021172e-17
		0.33333333333333326 0.15672232497824481 -0.15672232497824481
		0.33333333333333331 4.502778367726793e-17 -0.22163883751087762
		0.33333333333333337 -0.15672232497824487 -0.15672232497824504
		0.33333333333333337 -0.22163883751087768 4.8755612298694312e-18
		0.33333333333333337 -0.15672232497824495 0.15672232497824484
		0.66666666666666674 -0.1567223249782447 -0.15672232497824498
		0.66666666666666674 -0.22163883751087751 4.5697121201447876e-17
		0.66666666666666674 -0.15672232497824479 0.1567223249782449
		0.66666666666666674 9.7894781635991762e-18 0.22163883751087762
		0.66666666666666663 0.1567223249782449 0.15672232497824493
		0.66666666666666663 0.22163883751087773 8.719488725759961e-17
		0.66666666666666663 0.15672232497824498 -0.15672232497824476
		0.66666666666666674 1.9305752029395549e-16 -0.22163883751087757
		0.66666666666666674 -0.1567223249782447 -0.15672232497824498
		0.66666666666666674 -0.22163883751087751 4.5697121201447876e-17
		0.66666666666666674 -0.15672232497824479 0.1567223249782449
		1 -0.15672232497824456 -0.15672232497824495
		1 -0.22163883751087737 8.651868117302632e-17
		1 -0.15672232497824465 0.15672232497824493
		1 1.5781921478028672e-16 0.22163883751087765
		1 0.15672232497824504 0.15672232497824495
		1 0.22163883751087787 1.2801644722917804e-16
		1 0.15672232497824512 -0.15672232497824473
		1 3.4108725691064299e-16 -0.22163883751087754
		1 -0.15672232497824456 -0.15672232497824495
		1 -0.22163883751087737 8.651868117302632e-17
		1 -0.15672232497824465 0.15672232497824493
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "LegFoot__instance_1:knee_joint_hierarchy_arrow_representation" 
		-p "LegFoot__instance_1:knee_joint_hierarchy_representation";
	rename -uid "782ABE92-4BDC-840C-32FC-A69632750626";
	setAttr ".r" -type "double3" 0 0 -90 ;
	setAttr ".s" -type "double3" 0.46739519169468152 0.46739519169468152 0.46739519169468152 ;
	setAttr ".rp" -type "double3" 1.1102230246251565e-16 0.5 0 ;
	setAttr ".rpt" -type "double3" 0.49999999999999989 -0.5 0 ;
	setAttr ".sp" -type "double3" 2.3753411339122038e-16 1.0697585445564812 0 ;
	setAttr ".spt" -type "double3" -1.2651181092870475e-16 -0.56975854455648134 0 ;
createNode mesh -n "LegFoot__instance_1:knee_joint_hierarchy_arrow_representationShape" 
		-p "LegFoot__instance_1:knee_joint_hierarchy_arrow_representation";
	rename -uid "0402878D-40F7-FDC3-CEDF-AF8696DD45F5";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 18 ".uvst[0].uvsp[0:17]" -type "float2" 0.67677665 0.073223323
		 0.5 2.9802322e-08 0.32322332 0.073223323 0.25000003 0.25 0.32322332 0.42677668 0.5
		 0.5 0.67677671 0.42677671 0.75 0.25 0.25 0.5 0.3125 0.5 0.375 0.5 0.4375 0.5 0.5
		 0.5 0.5625 0.5 0.625 0.5 0.6875 0.5 0.75 0.5 0.5 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 9 ".pt[0:8]" -type "float3"  0.33249366 1.0697585 -0.33249369 
		-2.8027111e-08 1.0697585 -0.4702169 -0.33249369 1.0697585 -0.33249369 -0.4702169 
		1.0697585 -1.4013556e-08 -0.33249369 1.0697585 0.33249366 -2.8027111e-08 1.0697585 
		0.4702169 0.33249369 1.0697585 0.33249369 0.4702169 1.0697585 -1.4013556e-08 2.3753411e-16 
		1.0697585 0;
	setAttr -s 9 ".vt[0:8]"  0.70710671 -0.25 -0.70710671 0 -0.25 -0.99999988
		 -0.70710671 -0.25 -0.70710671 -0.99999988 -0.25 0 -0.70710671 -0.25 0.70710671 0 -0.25 0.99999994
		 0.70710677 -0.25 0.70710677 1 -0.25 0 0 0.25 0;
	setAttr -s 16 ".ed[0:15]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 0 0 0 8 0 1 8 0 2 8 0 3 8 0 4 8 0 5 8 0 6 8 0 7 8 0;
	setAttr -s 9 -ch 32 ".fc[0:8]" -type "polyFaces" 
		f 8 -8 -7 -6 -5 -4 -3 -2 -1
		mu 0 8 0 7 6 5 4 3 2 1
		f 3 0 9 -9
		mu 0 3 8 9 17
		f 3 1 10 -10
		mu 0 3 9 10 17
		f 3 2 11 -11
		mu 0 3 10 11 17
		f 3 3 12 -12
		mu 0 3 11 12 17
		f 3 4 13 -13
		mu 0 3 12 13 17
		f 3 5 14 -14
		mu 0 3 13 14 17
		f 3 6 15 -15
		mu 0 3 14 15 17
		f 3 7 8 -16
		mu 0 3 15 16 17;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode parentConstraint -n "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1" 
		-p "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp";
	rename -uid "645B4B33-4C08-E2F5-2BEC-038B7784FEE2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" -6.5568814498634063e-15 14.036243467926461 -90.000000000000028 ;
	setAttr ".rst" -type "double3" 3.9999999033280145 -3.3306690738754696e-16 -0.99999997583200406 ;
	setAttr ".rsrr" -type "double3" 90.00000537351896 -14.036242816291594 1.8031423935855737e-14 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1" 
		-p "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp";
	rename -uid "8E5EB4A4-4587-CB26-C0D9-0AA3589D8FF2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "module_transformW0" -dv 1 -min 0 
		-at "double";
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
createNode transform -n "LegFoot__instance_1:orientationControls_grp" -p "LegFoot__instance_1:module_grp";
	rename -uid "E8A3F3D2-4CEA-7262-49E2-C6A89619C85E";
createNode transform -n "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp" 
		-p "LegFoot__instance_1:orientationControls_grp";
	rename -uid "11535FFC-4FE8-10D7-964D-CE989457567D";
createNode transform -n "LegFoot__instance_1:ankle_joint_orientation_control" -p
		 "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp";
	rename -uid "C3F13C05-4231-35EA-ACF1-FD8C53FAF8CC";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" -90 0 0 ;
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "LegFoot__instance_1:ankle_joint_orientation_controlShape" -p "LegFoot__instance_1:ankle_joint_orientation_control";
	rename -uid "6CAD352E-426F-4C19-5DBA-CBAD3A9D094C";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr -s 2 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 2 "f[0:10]" "f[28:33]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 1 "f[11:27]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 72 ".uvst[0].uvsp[0:71]" -type "float2" 0.62640893 0.064408526
		 0.54828387 0.0076473951 0.45171607 0.00764741 0.37359107 0.064408556 0.34375 0.15625001
		 0.37359107 0.24809146 0.4517161 0.3048526 0.54828393 0.3048526 0.62640893 0.24809144
		 0.65625 0.15625 0.375 0.3125 0.40000001 0.3125 0.42500001 0.3125 0.45000002 0.3125
		 0.47500002 0.3125 0.5 0.3125 0.52499998 0.3125 0.54999995 0.3125 0.57499993 0.3125
		 0.5999999 0.3125 0.62499988 0.3125 0.5 0.68843985 0.375 0.3125 0.40000001 0.3125
		 0.5 0.68843985 0.42500001 0.3125 0.45000002 0.3125 0.47500002 0.3125 0.5 0.3125 0.52499998
		 0.3125 0.54999995 0.3125 0.57499993 0.3125 0.5999999 0.3125 0.62499988 0.3125 0.62640893
		 0.064408526 0.65625 0.15625 0.62640893 0.24809144 0.54828393 0.3048526 0.4517161
		 0.3048526 0.37359107 0.24809146 0.34375 0.15625001 0.37359107 0.064408556 0.45171607
		 0.00764741 0.54828387 0.0076473951 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5
		 0.375 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125
		 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375 0.5 0.625 0.75 0.375 0.75
		 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 38 ".pt[0:37]" -type "float3"  0.5 0 0 0.5 0 0 0.5 0 0 0.5 
		0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 
		0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 
		0 0 0.5 0 0 0.5 0 0 0.5 0 0;
	setAttr -s 38 ".vt[0:37]"  0.095147073 0.49463958 -0.069128409 0.036342937 0.49463958 -0.11185211
		 -0.036342964 0.49463958 -0.11185209 -0.095147088 0.49463958 -0.069128387 -0.11760826 0.49463958 7.0099975e-09
		 -0.095147073 0.49463958 0.069128402 -0.036342941 0.49463958 0.11185209 0.036342949 0.49463958 0.11185209
		 0.095147066 0.49463958 0.069128387 0.11760824 0.49463958 0 -4.5564983e-09 0.72985607 -4.205998e-10
		 0.095147073 0.069128409 0.49463958 0.036342937 0.11185211 0.49463958 -0.036342964 0.11185209 0.49463958
		 -0.095147088 0.069128387 0.49463958 -0.11760826 -7.0099975e-09 0.49463958 -0.095147073 -0.069128402 0.49463958
		 -0.036342941 -0.11185209 0.49463958 0.036342949 -0.11185209 0.49463958 0.095147066 -0.069128387 0.49463958
		 0.11760824 1.0983205e-16 0.49463958 -4.5564983e-09 4.2059997e-10 0.72985607 -0.5 -0.075000018 -0.5
		 0.5 -0.075000018 -0.5 -0.5 -0.074999988 0.5 0.5 -0.074999988 0.5 -0.5 0.075000018 0.5
		 0.5 0.075000018 0.5 -0.5 0.074999988 -0.5 0.5 0.074999988 -0.5 -0.5 -0.5 -0.074999988
		 0.5 -0.5 -0.074999988 -0.5 -0.5 0.075000018 0.5 -0.5 0.075000018 -0.5 0.5 0.074999988
		 0.5 0.5 0.074999988 -0.5 0.5 -0.075000018 0.5 0.5 -0.075000018;
	setAttr -s 64 ".ed[0:63]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 0 0 0 10 0 1 10 0 2 10 0 3 10 0 4 10 0 5 10 0 6 10 0 7 10 0 8 10 0
		 9 10 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0 18 19 0 19 20 0 20 11 0
		 11 21 0 12 21 0 13 21 0 14 21 0 15 21 0 16 21 0 17 21 0 18 21 0 19 21 0 20 21 0 22 23 0
		 24 25 0 26 27 0 28 29 0 22 24 0 23 25 0 24 26 0 25 27 0 26 28 0 27 29 0 28 22 0 29 23 0
		 30 31 0 32 33 0 34 35 0 36 37 0 30 32 0 31 33 0 32 34 0 33 35 0 34 36 0 35 37 0 36 30 0
		 37 31 0;
	setAttr -s 34 -ch 128 ".fc[0:33]" -type "polyFaces" 
		f 3 0 11 -11
		mu 0 3 10 11 21
		f 3 1 12 -12
		mu 0 3 11 12 21
		f 3 2 13 -13
		mu 0 3 12 13 21
		f 3 3 14 -14
		mu 0 3 13 14 21
		f 3 4 15 -15
		mu 0 3 14 15 21
		f 3 5 16 -16
		mu 0 3 15 16 21
		f 3 6 17 -17
		mu 0 3 16 17 21
		f 3 7 18 -18
		mu 0 3 17 18 21
		f 3 8 19 -19
		mu 0 3 18 19 21
		f 3 9 10 -20
		mu 0 3 19 20 21
		f 10 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1
		mu 0 10 0 9 8 7 6 5 4 3 2 1
		f 3 20 31 -31
		mu 0 3 22 23 24
		f 3 21 32 -32
		mu 0 3 23 25 24
		f 3 22 33 -33
		mu 0 3 25 26 24
		f 3 23 34 -34
		mu 0 3 26 27 24
		f 3 24 35 -35
		mu 0 3 27 28 24
		f 3 25 36 -36
		mu 0 3 28 29 24
		f 3 26 37 -37
		mu 0 3 29 30 24
		f 3 27 38 -38
		mu 0 3 30 31 24
		f 3 28 39 -39
		mu 0 3 31 32 24
		f 3 29 30 -40
		mu 0 3 32 33 24
		f 10 -30 -29 -28 -27 -26 -25 -24 -23 -22 -21
		mu 0 10 34 35 36 37 38 39 40 41 42 43
		f 4 40 45 -42 -45
		mu 0 4 44 45 46 47
		f 4 41 47 -43 -47
		mu 0 4 47 46 48 49
		f 4 42 49 -44 -49
		mu 0 4 49 48 50 51
		f 4 43 51 -41 -51
		mu 0 4 51 50 52 53
		f 4 -52 -50 -48 -46
		mu 0 4 45 54 55 46
		f 4 50 44 46 48
		mu 0 4 56 44 47 57
		f 4 52 57 -54 -57
		mu 0 4 58 59 60 61
		f 4 53 59 -55 -59
		mu 0 4 61 60 62 63
		f 4 54 61 -56 -61
		mu 0 4 63 62 64 65
		f 4 55 63 -53 -63
		mu 0 4 65 64 66 67
		f 4 -64 -62 -60 -58
		mu 0 4 59 68 69 60
		f 4 62 56 58 60
		mu 0 4 70 58 61 71;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode parentConstraint -n "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1" 
		-p "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp";
	rename -uid "A6242B1F-4737-6B02-F650-15B9DE74BB0F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 90 -71.565049946043942 -89.999999999999986 ;
	setAttr ".rst" -type "double3" 7.9999998180292025 4.6421107194575482e-16 -4.5492696498783403e-08 ;
	setAttr ".rsrr" -type "double3" 164.78554420631559 -13.989666476620616 228.36646131057068 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint1" 
		-p "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp";
	rename -uid "55E8E78E-40E8-084C-40E0-779B6D337780";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "module_transformW0" -dv 1 -min 0 
		-at "double";
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
createNode transform -n "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp" 
		-p "LegFoot__instance_1:orientationControls_grp";
	rename -uid "90C1EA83-4486-FE08-BB55-EBBE374A030E";
createNode transform -n "LegFoot__instance_1:ball_joint_orientation_control" -p "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp";
	rename -uid "3BAAAEFA-4BA9-8B64-EAC2-4DBBCABEA419";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" -90 0 0 ;
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "LegFoot__instance_1:ball_joint_orientation_controlShape" -p "LegFoot__instance_1:ball_joint_orientation_control";
	rename -uid "3BA3971F-4EDE-2E80-4082-C49E95977693";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr -s 2 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 2 "f[0:10]" "f[28:33]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 1 "f[11:27]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 72 ".uvst[0].uvsp[0:71]" -type "float2" 0.62640893 0.064408526
		 0.54828387 0.0076473951 0.45171607 0.00764741 0.37359107 0.064408556 0.34375 0.15625001
		 0.37359107 0.24809146 0.4517161 0.3048526 0.54828393 0.3048526 0.62640893 0.24809144
		 0.65625 0.15625 0.375 0.3125 0.40000001 0.3125 0.42500001 0.3125 0.45000002 0.3125
		 0.47500002 0.3125 0.5 0.3125 0.52499998 0.3125 0.54999995 0.3125 0.57499993 0.3125
		 0.5999999 0.3125 0.62499988 0.3125 0.5 0.68843985 0.375 0.3125 0.40000001 0.3125
		 0.5 0.68843985 0.42500001 0.3125 0.45000002 0.3125 0.47500002 0.3125 0.5 0.3125 0.52499998
		 0.3125 0.54999995 0.3125 0.57499993 0.3125 0.5999999 0.3125 0.62499988 0.3125 0.62640893
		 0.064408526 0.65625 0.15625 0.62640893 0.24809144 0.54828393 0.3048526 0.4517161
		 0.3048526 0.37359107 0.24809146 0.34375 0.15625001 0.37359107 0.064408556 0.45171607
		 0.00764741 0.54828387 0.0076473951 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5
		 0.375 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125
		 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375 0.5 0.625 0.75 0.375 0.75
		 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 38 ".pt[0:37]" -type "float3"  0.5 0 0 0.5 0 0 0.5 0 0 0.5 
		0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 
		0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 
		0 0 0.5 0 0 0.5 0 0 0.5 0 0;
	setAttr -s 38 ".vt[0:37]"  0.095147073 0.49463958 -0.069128409 0.036342937 0.49463958 -0.11185211
		 -0.036342964 0.49463958 -0.11185209 -0.095147088 0.49463958 -0.069128387 -0.11760826 0.49463958 7.0099975e-09
		 -0.095147073 0.49463958 0.069128402 -0.036342941 0.49463958 0.11185209 0.036342949 0.49463958 0.11185209
		 0.095147066 0.49463958 0.069128387 0.11760824 0.49463958 0 -4.5564983e-09 0.72985607 -4.205998e-10
		 0.095147073 0.069128409 0.49463958 0.036342937 0.11185211 0.49463958 -0.036342964 0.11185209 0.49463958
		 -0.095147088 0.069128387 0.49463958 -0.11760826 -7.0099975e-09 0.49463958 -0.095147073 -0.069128402 0.49463958
		 -0.036342941 -0.11185209 0.49463958 0.036342949 -0.11185209 0.49463958 0.095147066 -0.069128387 0.49463958
		 0.11760824 1.0983205e-16 0.49463958 -4.5564983e-09 4.2059997e-10 0.72985607 -0.5 -0.075000018 -0.5
		 0.5 -0.075000018 -0.5 -0.5 -0.074999988 0.5 0.5 -0.074999988 0.5 -0.5 0.075000018 0.5
		 0.5 0.075000018 0.5 -0.5 0.074999988 -0.5 0.5 0.074999988 -0.5 -0.5 -0.5 -0.074999988
		 0.5 -0.5 -0.074999988 -0.5 -0.5 0.075000018 0.5 -0.5 0.075000018 -0.5 0.5 0.074999988
		 0.5 0.5 0.074999988 -0.5 0.5 -0.075000018 0.5 0.5 -0.075000018;
	setAttr -s 64 ".ed[0:63]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 0 0 0 10 0 1 10 0 2 10 0 3 10 0 4 10 0 5 10 0 6 10 0 7 10 0 8 10 0
		 9 10 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0 18 19 0 19 20 0 20 11 0
		 11 21 0 12 21 0 13 21 0 14 21 0 15 21 0 16 21 0 17 21 0 18 21 0 19 21 0 20 21 0 22 23 0
		 24 25 0 26 27 0 28 29 0 22 24 0 23 25 0 24 26 0 25 27 0 26 28 0 27 29 0 28 22 0 29 23 0
		 30 31 0 32 33 0 34 35 0 36 37 0 30 32 0 31 33 0 32 34 0 33 35 0 34 36 0 35 37 0 36 30 0
		 37 31 0;
	setAttr -s 34 -ch 128 ".fc[0:33]" -type "polyFaces" 
		f 3 0 11 -11
		mu 0 3 10 11 21
		f 3 1 12 -12
		mu 0 3 11 12 21
		f 3 2 13 -13
		mu 0 3 12 13 21
		f 3 3 14 -14
		mu 0 3 13 14 21
		f 3 4 15 -15
		mu 0 3 14 15 21
		f 3 5 16 -16
		mu 0 3 15 16 21
		f 3 6 17 -17
		mu 0 3 16 17 21
		f 3 7 18 -18
		mu 0 3 17 18 21
		f 3 8 19 -19
		mu 0 3 18 19 21
		f 3 9 10 -20
		mu 0 3 19 20 21
		f 10 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1
		mu 0 10 0 9 8 7 6 5 4 3 2 1
		f 3 20 31 -31
		mu 0 3 22 23 24
		f 3 21 32 -32
		mu 0 3 23 25 24
		f 3 22 33 -33
		mu 0 3 25 26 24
		f 3 23 34 -34
		mu 0 3 26 27 24
		f 3 24 35 -35
		mu 0 3 27 28 24
		f 3 25 36 -36
		mu 0 3 28 29 24
		f 3 26 37 -37
		mu 0 3 29 30 24
		f 3 27 38 -38
		mu 0 3 30 31 24
		f 3 28 39 -39
		mu 0 3 31 32 24
		f 3 29 30 -40
		mu 0 3 32 33 24
		f 10 -30 -29 -28 -27 -26 -25 -24 -23 -22 -21
		mu 0 10 34 35 36 37 38 39 40 41 42 43
		f 4 40 45 -42 -45
		mu 0 4 44 45 46 47
		f 4 41 47 -43 -47
		mu 0 4 47 46 48 49
		f 4 42 49 -44 -49
		mu 0 4 49 48 50 51
		f 4 43 51 -41 -51
		mu 0 4 51 50 52 53
		f 4 -52 -50 -48 -46
		mu 0 4 45 54 55 46
		f 4 50 44 46 48
		mu 0 4 56 44 47 57
		f 4 52 57 -54 -57
		mu 0 4 58 59 60 61
		f 4 53 59 -55 -59
		mu 0 4 61 60 62 63
		f 4 54 61 -56 -61
		mu 0 4 63 62 64 65
		f 4 55 63 -53 -63
		mu 0 4 65 64 66 67
		f 4 -64 -62 -60 -58
		mu 0 4 59 68 69 60
		f 4 62 56 58 60
		mu 0 4 70 58 61 71;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode parentConstraint -n "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1" 
		-p "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp";
	rename -uid "15D58B86-4AB1-F327-2EB9-79BCF7DB6A9A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ball_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" -7.0669094840732261e-14 -89.999999060872895 0 ;
	setAttr ".rst" -type "double3" -9.7418398681270446e-08 -9.0000001095957032 3.0000000365319064 ;
	setAttr ".rsrr" -type "double3" 1.1214690361206528e-05 -89.999983452591593 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint1" 
		-p "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp";
	rename -uid "4F8CEFE2-412A-AE33-A665-5291C1105CBB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "module_transformW0" -dv 1 -min 0 
		-at "double";
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
createNode transform -n "LegFoot__instance_1:preferredAngleRepresentation_grp" -p
		 "LegFoot__instance_1:module_grp";
	rename -uid "3A0B8094-4DD5-6B93-AA5C-F8B21028645F";
createNode transform -n "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp" 
		-p "LegFoot__instance_1:preferredAngleRepresentation_grp";
	rename -uid "1753D6B8-46F0-0D41-C0A5-A38FC0B8B6F7";
	setAttr ".rp" -type "double3" -1.1920928955078125e-07 0.00014042854309082031 0.11461406946182251 ;
	setAttr ".sp" -type "double3" -1.1920928955078125e-07 0.00014042854309082031 0.11461406946182251 ;
createNode transform -n "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation" 
		-p "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp";
	rename -uid "68453C01-4F0C-2854-F1C3-60BB986AF95D";
	addAttr -ci true -sn "axis" -ln "axis" -min 0 -max 3 -en "+Y:-Y:+Z:-Z" -at "enum";
	setAttr -l on -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on -k on ".axis";
createNode mesh -n "LegFoot__instance_1:IK_knee_joint_preferredAngle_representationShape" 
		-p "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation";
	rename -uid "45B1BF3C-48A3-BC44-E6EB-9CBCB5007667";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 1070 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.64860266 0.10796607 0.62640899
		 0.064408496 0.59184152 0.029841021 0.54828393 0.0076473355 0.5 -7.4505806e-08 0.45171607
		 0.0076473504 0.40815851 0.029841051 0.37359107 0.064408526 0.3513974 0.10796608 0.34374997
		 0.15625 0.3513974 0.20453392 0.37359107 0.24809146 0.40815854 0.28265893 0.4517161
		 0.3048526 0.5 0.3125 0.54828387 0.3048526 0.59184146 0.28265893 0.62640893 0.24809146
		 0.6486026 0.2045339 0.65625 0.15625 0.375 0.3125 0.38749999 0.3125 0.39999998 0.3125
		 0.41249996 0.3125 0.42499995 0.3125 0.43749994 0.3125 0.44999993 0.3125 0.46249992
		 0.3125 0.4749999 0.3125 0.48749989 0.3125 0.49999988 0.3125 0.51249987 0.3125 0.52499986
		 0.3125 0.53749985 0.3125 0.54999983 0.3125 0.56249982 0.3125 0.57499981 0.3125 0.5874998
		 0.3125 0.59999979 0.3125 0.61249977 0.3125 0.62499976 0.3125 0.375 0.68843985 0.38749999
		 0.68843985 0.39999998 0.68843985 0.41249996 0.68843985 0.42499995 0.68843985 0.43749994
		 0.68843985 0.44999993 0.68843985 0.46249992 0.68843985 0.4749999 0.68843985 0.48749989
		 0.68843985 0.49999988 0.68843985 0.51249987 0.68843985 0.52499986 0.68843985 0.53749985
		 0.68843985 0.54999983 0.68843985 0.56249982 0.68843985 0.57499981 0.68843985 0.5874998
		 0.68843985 0.59999979 0.68843985 0.61249977 0.68843985 0.62499976 0.68843985 0.64860266
		 0.79546607 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5
		 0.68749994 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974
		 0.79546607 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854
		 0.97015893 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893
		 0.93559146 0.6486026 0.89203393 0.65625 0.84375 0.7377643 0.1727457 0.75 0.25 0.73776412
		 0.32725424 0.70225424 0.39694631 0.64694631 0.45225427 0.57725424 0.48776415 0.5
		 0.5 0.42274573 0.48776418 0.35305366 0.4522543 0.2977457 0.39694634 0.26223582 0.32725427
		 0.24999994 0.25 0.26223582 0.17274573 0.2977457 0.10305364 0.35305363 0.047745675
		 0.4227457 0.012235761 0.5 -1.1920929e-07 0.5772543 0.012235746 0.64694643 0.04774563
		 0.70225441 0.1030536 0.25 0.5 0.27500001 0.5 0.49981534 0.99958968 0.49979484 0.99958968
		 0.30000001 0.5 0.49983585 0.99958968 0.32500002 0.5 0.49985638 0.99958968 0.35000002
		 0.5 0.49987689 0.99958968 0.37500003 0.5 0.49989742 0.99958968 0.40000004 0.5 0.49991792
		 0.99958968 0.42500004 0.5 0.49993846 0.99958968 0.45000005 0.5 0.49995896 0.99958968
		 0.47500005 0.5 0.4999795 0.99958968 0.50000006 0.5 0.5 0.99958968 0.52500004 0.5
		 0.5000205 0.99958968 0.55000001 0.5 0.50004101 0.99958968 0.57499999 0.5 0.50006157
		 0.99958968 0.59999996 0.5 0.50008208 0.99958968 0.62499994 0.5 0.50010258 0.99958968
		 0.64999992 0.5 0.50012308 0.99958968 0.67499989 0.5 0.50014365 0.99958968 0.69999987
		 0.5 0.50016415 0.99958968 0.72499985 0.5 0.50018466 0.99958968 0.74999982 0.5 0.50020516
		 0.99958968 0.5 1 0.050000001 1 0 1 0 0.94999999 0.050000001 0.94999999 0.1 1 0.1
		 0.94999999 0.15000001 1 0.15000001 0.94999999 0.2 1 0.2 0.94999999 0.25 1 0.25 0.94999999
		 0.30000001 1 0.30000001 0.94999999 0.35000002 1 0.35000002 0.94999999 0.40000004
		 1 0.40000004 0.94999999 0.45000005 1 0.45000005 0.94999999 0.50000006 1 0.50000006
		 0.94999999 0.55000007 1 0.55000007 0.94999999 0.60000008 1 0.60000008 0.94999999
		 0.6500001 1 0.6500001 0.94999999 0.70000011 1 0.70000011 0.94999999 1.000000119209
		 1 0.95000017 1 0.95000017 0.94999999 1.000000119209 0.94999999 0 0.89999998 0.050000001
		 0.89999998 0.1 0.89999998 0.15000001 0.89999998 0.2 0.89999998 0.25 0.89999998 0.30000001
		 0.89999998 0.35000002 0.89999998 0.40000004 0.89999998 0.45000005 0.89999998 0.50000006
		 0.89999998 0.55000007 0.89999998 0.60000008 0.89999998 0.6500001 0.89999998 0.70000011
		 0.89999998 0.95000017 0.89999998 1.000000119209 0.89999998 0 0.84999996 0.050000001
		 0.84999996 0.1 0.84999996 0.15000001 0.84999996 0.2 0.84999996 0.25 0.84999996 0.30000001
		 0.84999996 0.35000002 0.84999996 0.40000004 0.84999996 0.45000005 0.84999996 0.50000006
		 0.84999996 0.55000007 0.84999996 0.60000008 0.84999996 0.6500001 0.84999996 0.70000011
		 0.84999996 0.95000017 0.84999996 1.000000119209 0.84999996 0 0.79999995 0.050000001
		 0.79999995 0.1 0.79999995 0.15000001 0.79999995 0.2 0.79999995 0.25 0.79999995 0.30000001
		 0.79999995 0.35000002 0.79999995 0.40000004 0.79999995 0.45000005 0.79999995 0.50000006
		 0.79999995 0.55000007 0.79999995 0.60000008 0.79999995 0.6500001 0.79999995 0.70000011
		 0.79999995 0.95000017 0.79999995 1.000000119209 0.79999995 0 0.74999994 0.050000001
		 0.74999994 0.1 0.74999994 0.15000001 0.74999994 0.2 0.74999994 0.25 0.74999994 0.30000001
		 0.74999994 0.35000002 0.74999994 0.40000004 0.74999994 0.45000005 0.74999994 0.50000006
		 0.74999994 0.55000007 0.74999994 0.60000008 0.74999994 0.6500001 0.74999994 0.70000011
		 0.74999994 0.95000017 0.74999994 1.000000119209 0.74999994 0 0.69999993 0.050000001
		 0.69999993 0.1 0.69999993;
	setAttr ".uvst[0].uvsp[250:499]" 0.15000001 0.69999993 0.2 0.69999993 0.25
		 0.69999993 0.30000001 0.69999993 0.35000002 0.69999993 0.40000004 0.69999993 0.45000005
		 0.69999993 0.50000006 0.69999993 0.55000007 0.69999993 0.60000008 0.69999993 0.6500001
		 0.69999993 0.70000011 0.69999993 0.95000017 0.69999993 1.000000119209 0.69999993
		 0 0.64999992 0.050000001 0.64999992 0.1 0.64999992 0.15000001 0.64999992 0.2 0.64999992
		 0.25 0.64999992 0.30000001 0.64999992 0.35000002 0.64999992 0.40000004 0.64999992
		 0.45000005 0.64999992 0.50000006 0.64999992 0.55000007 0.64999992 0.60000008 0.64999992
		 0.6500001 0.64999992 0.70000011 0.64999992 0.95000017 0.64999992 1.000000119209 0.64999992
		 0 0.5999999 0.050000001 0.5999999 0.1 0.5999999 0.15000001 0.5999999 0.2 0.5999999
		 0.25 0.5999999 0.30000001 0.5999999 0.35000002 0.5999999 0.40000004 0.5999999 0.45000005
		 0.5999999 0.50000006 0.5999999 0.55000007 0.5999999 0.60000008 0.5999999 0.6500001
		 0.5999999 0.70000011 0.5999999 0.95000017 0.5999999 1.000000119209 0.5999999 0 0.54999989
		 0.050000001 0.54999989 0.1 0.54999989 0.15000001 0.54999989 0.2 0.54999989 0.25 0.54999989
		 0.30000001 0.54999989 0.35000002 0.54999989 0.40000004 0.54999989 0.45000005 0.54999989
		 0.50000006 0.54999989 0.55000007 0.54999989 0.60000008 0.54999989 0.6500001 0.54999989
		 0.70000011 0.54999989 0.95000017 0.54999989 1.000000119209 0.54999989 0 0.49999988
		 0.050000001 0.49999988 0.1 0.49999988 0.15000001 0.49999988 0.2 0.49999988 0.25 0.49999988
		 0.30000001 0.49999988 0.35000002 0.49999988 0.40000004 0.49999988 0.45000005 0.49999988
		 0.50000006 0.49999988 0.55000007 0.49999988 0.60000008 0.49999988 0.6500001 0.49999988
		 0.70000011 0.49999988 0.95000017 0.49999988 1.000000119209 0.49999988 0 0.44999987
		 0.050000001 0.44999987 0.1 0.44999987 0.15000001 0.44999987 0.2 0.44999987 0.25 0.44999987
		 0.30000001 0.44999987 0.35000002 0.44999987 0.40000004 0.44999987 0.45000005 0.44999987
		 0.50000006 0.44999987 0.55000007 0.44999987 0.60000008 0.44999987 0.6500001 0.44999987
		 0.70000011 0.44999987 0.95000017 0.44999987 1.000000119209 0.44999987 0 0.39999986
		 0.050000001 0.39999986 0.1 0.39999986 0.15000001 0.39999986 0.2 0.39999986 0.25 0.39999986
		 0.30000001 0.39999986 0.35000002 0.39999986 0.40000004 0.39999986 0.45000005 0.39999986
		 0.50000006 0.39999986 0.55000007 0.39999986 0.60000008 0.39999986 0.6500001 0.39999986
		 0.70000011 0.39999986 0.95000017 0.39999986 1.000000119209 0.39999986 0 0.34999985
		 0.050000001 0.34999985 0.1 0.34999985 0.15000001 0.34999985 0.2 0.34999985 0.25 0.34999985
		 0.30000001 0.34999985 0.35000002 0.34999985 0.40000004 0.34999985 0.45000005 0.34999985
		 0.50000006 0.34999985 0.55000007 0.34999985 0.60000008 0.34999985 0.6500001 0.34999985
		 0.70000011 0.34999985 0.95000017 0.34999985 1.000000119209 0.34999985 0 0.29999983
		 0.050000001 0.29999983 0.1 0.29999983 0.15000001 0.29999983 0.2 0.29999983 0.25 0.29999983
		 0.30000001 0.29999983 0.35000002 0.29999983 0.40000004 0.29999983 0.45000005 0.29999983
		 0.50000006 0.29999983 0.55000007 0.29999983 0.60000008 0.29999983 0.6500001 0.29999983
		 0.70000011 0.29999983 0.95000017 0.29999983 1.000000119209 0.29999983 0 0.24999984
		 0.050000001 0.24999984 0.1 0.24999984 0.15000001 0.24999984 0.2 0.24999984 0.25 0.24999984
		 0.30000001 0.24999984 0.35000002 0.24999984 0.40000004 0.24999984 0.45000005 0.24999984
		 0.50000006 0.24999984 0.55000007 0.24999984 0.60000008 0.24999984 0.6500001 0.24999984
		 0.70000011 0.24999984 0.95000017 0.24999984 1.000000119209 0.24999984 0 0.19999984
		 0.050000001 0.19999984 0.1 0.19999984 0.15000001 0.19999984 0.2 0.19999984 0.25 0.19999984
		 0.30000001 0.19999984 0.35000002 0.19999984 0.40000004 0.19999984 0.45000005 0.19999984
		 0.50000006 0.19999984 0.55000007 0.19999984 0.60000008 0.19999984 0.6500001 0.19999984
		 0.70000011 0.19999984 0.95000017 0.19999984 1.000000119209 0.19999984 0 0.14999984
		 0.050000001 0.14999984 0.1 0.14999984 0.15000001 0.14999984 0.2 0.14999984 0.25 0.14999984
		 0.30000001 0.14999984 0.35000002 0.14999984 0.40000004 0.14999984 0.45000005 0.14999984
		 0.50000006 0.14999984 0.55000007 0.14999984 0.60000008 0.14999984 0.6500001 0.14999984
		 0.70000011 0.14999984 0.95000017 0.14999984 1.000000119209 0.14999984 0 0.099999845
		 0.050000001 0.099999845 0.1 0.099999845 0.15000001 0.099999845 0.2 0.099999845 0.25
		 0.099999845 0.30000001 0.099999845 0.35000002 0.099999845 0.40000004 0.099999845
		 0.45000005 0.099999845 0.50000006 0.099999845 0.55000007 0.099999845 0.60000008 0.099999845
		 0.6500001 0.099999845 0.70000011 0.099999845 0.95000017 0.099999845 1.000000119209
		 0.099999845 0 0.049999844 0.050000001 0.049999844 0.1 0.049999844 0.15000001 0.049999844
		 0.2 0.049999844 0.25 0.049999844 0.30000001 0.049999844 0.35000002 0.049999844 0.40000004
		 0.049999844 0.45000005 0.049999844 0.50000006 0.049999844 0.55000007 0.049999844
		 0.60000008 0.049999844 0.6500001 0.049999844 0.70000011 0.049999844 0.95000017 0.049999844
		 1.000000119209 0.049999844 0 -1.5646219e-07 0.050000001 -1.5646219e-07 0.1 -1.5646219e-07
		 0.15000001 -1.5646219e-07 0.2 -1.5646219e-07 0.25 -1.5646219e-07 0.30000001 -1.5646219e-07
		 0.35000002 -1.5646219e-07 0.40000004 -1.5646219e-07 0.45000005 -1.5646219e-07 0.50000006
		 -1.5646219e-07 0.55000007 -1.5646219e-07 0.60000008 -1.5646219e-07 0.6500001 -1.5646219e-07
		 0.70000011 -1.5646219e-07;
	setAttr ".uvst[0].uvsp[500:749]" 0.95000017 -1.5646219e-07 1.000000119209 -1.5646219e-07
		 0 0 0.15838426 1.4050773e-16 0.30901742 0.95105654 0.15838476 1 0.15063262 0 0.30901688
		 0 0.15063237 1 0 0.95105654 0 0 0.18460587 0 0.61803406 0.85065073 0.50952542 1 0.72654116
		 0 0.99999857 0 4.1442365e-07 1 0 0.72654247 0 0 0.29869798 0 0.82442909 0.26787239
		 1 0.50952357 0.48745704 0 1 0 0 0.15838529 0 0 0.18460587 0 0.61803424 0.85065079
		 0.50952554 0.99999994 0.72654277 0 1.000000119209 0 0 0.99999946 2.7628249e-07 0.72654223
		 0 0 0.29869834 0 0.82442951 0.26787299 0.99999994 0.50952518 0.48745716 0 1 0 0 0.15838429
		 0 2.9547712e-16 0.16653505 0 0.4596495 0.90211302 0.32491958 1 4.9568939e-07 1.4050772e-16
		 0.15838474 0 0.15838425 1 0 0.99999994 0 0 0.21701717 0 0.79360449 0.79360431 0.72654229
		 1 0.72654295 0 1 0 0 0.72654068 0.084503144 0.46646726 0 0 0.36230886 0 0.70688558
		 0.11195894 1 0.32491878 0 0 0.16653535 0 0.45964921 0.90211308 0.32491925 1 0.57658839
		 0 0.79360545 0 0.06706205 1 0 0.79360431 0 0 0.27345735 0 0.91549689 0.46646893 1
		 0.72654241 0.63769084 0 1 0 0 0.32492003 0.29311422 0.11195964 0.7377643 0.1727457
		 0.75 0.25 0.73776412 0.32725424 0.70225424 0.39694631 0.64694631 0.45225427 0.57725424
		 0.48776415 0.5 0.5 0.42274573 0.48776418 0.35305366 0.4522543 0.2977457 0.39694634
		 0.26223582 0.32725427 0.24999994 0.25 0.26223582 0.17274573 0.2977457 0.10305364
		 0.35305363 0.047745675 0.4227457 0.012235761 0.5 -1.1920929e-07 0.5772543 0.012235746
		 0.64694643 0.04774563 0.70225441 0.1030536 0.25 0.5 0.27500001 0.5 0.49981534 0.99958968
		 0.49979484 0.99958968 0.30000001 0.5 0.49983585 0.99958968 0.32500002 0.5 0.49985638
		 0.99958968 0.35000002 0.5 0.49987689 0.99958968 0.37500003 0.5 0.49989742 0.99958968
		 0.40000004 0.5 0.49991792 0.99958968 0.42500004 0.5 0.49993846 0.99958968 0.45000005
		 0.5 0.49995896 0.99958968 0.47500005 0.5 0.4999795 0.99958968 0.50000006 0.5 0.5
		 0.99958968 0.52500004 0.5 0.5000205 0.99958968 0.55000001 0.5 0.50004101 0.99958968
		 0.57499999 0.5 0.50006157 0.99958968 0.59999996 0.5 0.50008208 0.99958968 0.62499994
		 0.5 0.50010258 0.99958968 0.64999992 0.5 0.50012308 0.99958968 0.67499989 0.5 0.50014365
		 0.99958968 0.69999987 0.5 0.50016415 0.99958968 0.72499985 0.5 0.50018466 0.99958968
		 0.74999982 0.5 0.50020516 0.99958968 0.5 1 0.050000001 1 0 1 0 0.94999999 0.050000001
		 0.94999999 0.1 1 0.1 0.94999999 0.15000001 1 0.15000001 0.94999999 0.2 1 0.2 0.94999999
		 0.25 1 0.25 0.94999999 0.30000001 1 0.30000001 0.94999999 0.35000002 1 0.35000002
		 0.94999999 0.40000004 1 0.40000004 0.94999999 0.45000005 1 0.45000005 0.94999999
		 0.50000006 1 0.50000006 0.94999999 0.55000007 1 0.55000007 0.94999999 0.60000008
		 1 0.60000008 0.94999999 0.6500001 1 0.6500001 0.94999999 0.70000011 1 0.70000011
		 0.94999999 1.000000119209 1 0.95000017 1 0.95000017 0.94999999 1.000000119209 0.94999999
		 0 0.89999998 0.050000001 0.89999998 0.1 0.89999998 0.15000001 0.89999998 0.2 0.89999998
		 0.25 0.89999998 0.30000001 0.89999998 0.35000002 0.89999998 0.40000004 0.89999998
		 0.45000005 0.89999998 0.50000006 0.89999998 0.55000007 0.89999998 0.60000008 0.89999998
		 0.6500001 0.89999998 0.70000011 0.89999998 0.95000017 0.89999998 1.000000119209 0.89999998
		 0 0.84999996 0.050000001 0.84999996 0.1 0.84999996 0.15000001 0.84999996 0.2 0.84999996
		 0.25 0.84999996 0.30000001 0.84999996 0.35000002 0.84999996 0.40000004 0.84999996
		 0.45000005 0.84999996 0.50000006 0.84999996 0.55000007 0.84999996 0.60000008 0.84999996
		 0.6500001 0.84999996 0.70000011 0.84999996 0.95000017 0.84999996 1.000000119209 0.84999996
		 0 0.79999995 0.050000001 0.79999995 0.1 0.79999995 0.15000001 0.79999995 0.2 0.79999995
		 0.25 0.79999995 0.30000001 0.79999995 0.35000002 0.79999995 0.40000004 0.79999995
		 0.45000005 0.79999995 0.50000006 0.79999995 0.55000007 0.79999995 0.60000008 0.79999995
		 0.6500001 0.79999995 0.70000011 0.79999995 0.95000017 0.79999995 1.000000119209 0.79999995
		 0 0.74999994 0.050000001 0.74999994 0.1 0.74999994 0.15000001 0.74999994 0.2 0.74999994
		 0.25 0.74999994 0.30000001 0.74999994 0.35000002 0.74999994 0.40000004 0.74999994
		 0.45000005 0.74999994 0.50000006 0.74999994 0.55000007 0.74999994 0.60000008 0.74999994
		 0.6500001 0.74999994 0.70000011 0.74999994 0.95000017 0.74999994 1.000000119209 0.74999994
		 0 0.69999993 0.050000001 0.69999993 0.1 0.69999993 0.15000001 0.69999993 0.2 0.69999993
		 0.25 0.69999993 0.30000001 0.69999993 0.35000002 0.69999993 0.40000004 0.69999993;
	setAttr ".uvst[0].uvsp[750:999]" 0.45000005 0.69999993 0.50000006 0.69999993
		 0.55000007 0.69999993 0.60000008 0.69999993 0.6500001 0.69999993 0.70000011 0.69999993
		 0.95000017 0.69999993 1.000000119209 0.69999993 0 0.64999992 0.050000001 0.64999992
		 0.1 0.64999992 0.15000001 0.64999992 0.2 0.64999992 0.25 0.64999992 0.30000001 0.64999992
		 0.35000002 0.64999992 0.40000004 0.64999992 0.45000005 0.64999992 0.50000006 0.64999992
		 0.55000007 0.64999992 0.60000008 0.64999992 0.6500001 0.64999992 0.70000011 0.64999992
		 0.95000017 0.64999992 1.000000119209 0.64999992 0 0.5999999 0.050000001 0.5999999
		 0.1 0.5999999 0.15000001 0.5999999 0.2 0.5999999 0.25 0.5999999 0.30000001 0.5999999
		 0.35000002 0.5999999 0.40000004 0.5999999 0.45000005 0.5999999 0.50000006 0.5999999
		 0.55000007 0.5999999 0.60000008 0.5999999 0.6500001 0.5999999 0.70000011 0.5999999
		 0.95000017 0.5999999 1.000000119209 0.5999999 0 0.54999989 0.050000001 0.54999989
		 0.1 0.54999989 0.15000001 0.54999989 0.2 0.54999989 0.25 0.54999989 0.30000001 0.54999989
		 0.35000002 0.54999989 0.40000004 0.54999989 0.45000005 0.54999989 0.50000006 0.54999989
		 0.55000007 0.54999989 0.60000008 0.54999989 0.6500001 0.54999989 0.70000011 0.54999989
		 0.95000017 0.54999989 1.000000119209 0.54999989 0 0.49999988 0.050000001 0.49999988
		 0.1 0.49999988 0.15000001 0.49999988 0.2 0.49999988 0.25 0.49999988 0.30000001 0.49999988
		 0.35000002 0.49999988 0.40000004 0.49999988 0.45000005 0.49999988 0.50000006 0.49999988
		 0.55000007 0.49999988 0.60000008 0.49999988 0.6500001 0.49999988 0.70000011 0.49999988
		 0.95000017 0.49999988 1.000000119209 0.49999988 0 0.44999987 0.050000001 0.44999987
		 0.1 0.44999987 0.15000001 0.44999987 0.2 0.44999987 0.25 0.44999987 0.30000001 0.44999987
		 0.35000002 0.44999987 0.40000004 0.44999987 0.45000005 0.44999987 0.50000006 0.44999987
		 0.55000007 0.44999987 0.60000008 0.44999987 0.6500001 0.44999987 0.70000011 0.44999987
		 0.95000017 0.44999987 1.000000119209 0.44999987 0 0.39999986 0.050000001 0.39999986
		 0.1 0.39999986 0.15000001 0.39999986 0.2 0.39999986 0.25 0.39999986 0.30000001 0.39999986
		 0.35000002 0.39999986 0.40000004 0.39999986 0.45000005 0.39999986 0.50000006 0.39999986
		 0.55000007 0.39999986 0.60000008 0.39999986 0.6500001 0.39999986 0.70000011 0.39999986
		 0.95000017 0.39999986 1.000000119209 0.39999986 0 0.34999985 0.050000001 0.34999985
		 0.1 0.34999985 0.15000001 0.34999985 0.2 0.34999985 0.25 0.34999985 0.30000001 0.34999985
		 0.35000002 0.34999985 0.40000004 0.34999985 0.45000005 0.34999985 0.50000006 0.34999985
		 0.55000007 0.34999985 0.60000008 0.34999985 0.6500001 0.34999985 0.70000011 0.34999985
		 0.95000017 0.34999985 1.000000119209 0.34999985 0 0.29999983 0.050000001 0.29999983
		 0.1 0.29999983 0.15000001 0.29999983 0.2 0.29999983 0.25 0.29999983 0.30000001 0.29999983
		 0.35000002 0.29999983 0.40000004 0.29999983 0.45000005 0.29999983 0.50000006 0.29999983
		 0.55000007 0.29999983 0.60000008 0.29999983 0.6500001 0.29999983 0.70000011 0.29999983
		 0.95000017 0.29999983 1.000000119209 0.29999983 0 0.24999984 0.050000001 0.24999984
		 0.1 0.24999984 0.15000001 0.24999984 0.2 0.24999984 0.25 0.24999984 0.30000001 0.24999984
		 0.35000002 0.24999984 0.40000004 0.24999984 0.45000005 0.24999984 0.50000006 0.24999984
		 0.55000007 0.24999984 0.60000008 0.24999984 0.6500001 0.24999984 0.70000011 0.24999984
		 0.95000017 0.24999984 1.000000119209 0.24999984 0 0.19999984 0.050000001 0.19999984
		 0.1 0.19999984 0.15000001 0.19999984 0.2 0.19999984 0.25 0.19999984 0.30000001 0.19999984
		 0.35000002 0.19999984 0.40000004 0.19999984 0.45000005 0.19999984 0.50000006 0.19999984
		 0.55000007 0.19999984 0.60000008 0.19999984 0.6500001 0.19999984 0.70000011 0.19999984
		 0.95000017 0.19999984 1.000000119209 0.19999984 0 0.14999984 0.050000001 0.14999984
		 0.1 0.14999984 0.15000001 0.14999984 0.2 0.14999984 0.25 0.14999984 0.30000001 0.14999984
		 0.35000002 0.14999984 0.40000004 0.14999984 0.45000005 0.14999984 0.50000006 0.14999984
		 0.55000007 0.14999984 0.60000008 0.14999984 0.6500001 0.14999984 0.70000011 0.14999984
		 0.95000017 0.14999984 1.000000119209 0.14999984 0 0.099999845 0.050000001 0.099999845
		 0.1 0.099999845 0.15000001 0.099999845 0.2 0.099999845 0.25 0.099999845 0.30000001
		 0.099999845 0.35000002 0.099999845 0.40000004 0.099999845 0.45000005 0.099999845
		 0.50000006 0.099999845 0.55000007 0.099999845 0.60000008 0.099999845 0.6500001 0.099999845
		 0.70000011 0.099999845 0.95000017 0.099999845 1.000000119209 0.099999845 0 0.049999844
		 0.050000001 0.049999844 0.1 0.049999844 0.15000001 0.049999844 0.2 0.049999844 0.25
		 0.049999844 0.30000001 0.049999844 0.35000002 0.049999844 0.40000004 0.049999844
		 0.45000005 0.049999844 0.50000006 0.049999844 0.55000007 0.049999844 0.60000008 0.049999844
		 0.6500001 0.049999844 0.70000011 0.049999844 0.95000017 0.049999844 1.000000119209
		 0.049999844 0 -1.5646219e-07 0.050000001 -1.5646219e-07 0.1 -1.5646219e-07 0.15000001
		 -1.5646219e-07 0.2 -1.5646219e-07 0.25 -1.5646219e-07 0.30000001 -1.5646219e-07 0.35000002
		 -1.5646219e-07 0.40000004 -1.5646219e-07 0.45000005 -1.5646219e-07 0.50000006 -1.5646219e-07
		 0.55000007 -1.5646219e-07 0.60000008 -1.5646219e-07 0.6500001 -1.5646219e-07 0.70000011
		 -1.5646219e-07 0.95000017 -1.5646219e-07 1.000000119209 -1.5646219e-07 0 0 0.15838426
		 1.4050773e-16 0.30901742 0.95105654 0.15838476 1;
	setAttr ".uvst[0].uvsp[1000:1069]" 0.15063262 0 0.30901688 0 0.15063237 1 0 0.95105654
		 0 0 0.18460587 0 0.61803406 0.85065073 0.50952542 1 0.72654116 0 0.99999857 0 4.1442365e-07
		 1 0 0.72654247 0 0 0.29869798 0 0.82442909 0.26787239 1 0.50952357 0.48745704 0 1
		 0 0 0.15838529 0 0 0.18460587 0 0.61803424 0.85065079 0.50952554 0.99999994 0.72654277
		 0 1.000000119209 0 0 0.99999946 2.7628249e-07 0.72654223 0 0 0.29869834 0 0.82442951
		 0.26787299 0.99999994 0.50952518 0.48745716 0 1 0 0 0.15838429 0 2.9547712e-16 0.16653505
		 0 0.4596495 0.90211302 0.32491958 1 4.9568939e-07 1.4050772e-16 0.15838474 0 0.15838425
		 1 0 0.99999994 0 0 0.21701717 0 0.79360449 0.79360431 0.72654229 1 0.72654295 0 1
		 0 0 0.72654068 0.084503144 0.46646726 0 0 0.36230886 0 0.70688558 0.11195894 1 0.32491878
		 0 0 0.16653535 0 0.45964921 0.90211308 0.32491925 1 0.57658839 0 0.79360545 0 0.06706205
		 1 0 0.79360431 0 0 0.27345735 0 0.91549689 0.46646893 1 0.72654241 0.63769084 0 1
		 0 0 0.32492003 0.29311422 0.11195964;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 762 ".vt";
	setAttr ".vt[0:165]"  0.14265858 -2 -0.04635258 0.12135264 -2 -0.088167846
		 0.088167846 -2 -0.12135263 0.046352573 -2 -0.14265856 0 -2 -0.15000008 -0.046352573 -2 -0.14265855
		 -0.088167824 -2 -0.1213526 -0.12135259 -2 -0.088167816 -0.14265852 -2 -0.046352562
		 -0.15000004 -2 0 -0.14265852 -2 0.046352562 -0.12135258 -2 0.088167809 -0.088167809 -2 0.12135258
		 -0.046352562 -2 0.1426585 -4.4703485e-09 -2 0.15000002 0.046352547 -2 0.1426585 0.088167787 -2 0.12135256
		 0.12135255 -2 0.088167801 0.14265849 -2 0.04635255 0.15000001 -2 0 0.14265858 2 -0.04635258
		 0.12135264 2 -0.088167846 0.088167846 2 -0.12135263 0.046352573 2 -0.14265856 0 2 -0.15000008
		 -0.046352573 2 -0.14265855 -0.088167824 2 -0.1213526 -0.12135259 2 -0.088167816 -0.14265852 2 -0.046352562
		 -0.15000004 2 0 -0.14265852 2 0.046352562 -0.12135258 2 0.088167809 -0.088167809 2 0.12135258
		 -0.046352562 2 0.1426585 -4.4703485e-09 2 0.15000002 0.046352547 2 0.1426585 0.088167787 2 0.12135256
		 0.12135255 2 0.088167801 0.14265849 2 0.04635255 0.15000001 2 0 -0.0027888119 1.46116579 0.89826292
		 -0.0027888119 1.50792933 0.8064844 -0.0027888119 1.58076513 0.7336486 -0.0027888119 1.67254364 0.68688512
		 -0.0027888119 1.77428091 0.67077154 -0.0027888119 1.87601817 0.68688512 -0.0027888119 1.96779668 0.73364866
		 -0.0027888119 2.040632486 0.80648446 -0.0027888119 2.087395906 0.89826298 -0.0027888119 2.10350943 1.000000119209
		 -0.0027888119 2.087395906 1.10173738 -0.0027888119 2.040632486 1.19351578 -0.0027888119 1.96779656 1.26635158
		 -0.0027888119 1.87601817 1.31311512 -0.0027888119 1.77428091 1.32922864 -0.0027888119 1.67254376 1.313115
		 -0.0027888119 1.58076525 1.26635158 -0.0027888119 1.50792944 1.19351578 -0.0027888119 1.4611659 1.10173738
		 -0.0027888119 1.44505239 1.000000119209 0.45642692 1.77428091 1.000000119209 0.45642692 1.77402389 0.99991667
		 0.45642692 1.77406228 0.99984133 0.45642692 1.77412212 0.99978161 0.45642692 1.77419746 0.99974322
		 0.45642692 1.77428091 0.99972999 0.45642692 1.77436435 0.99974322 0.45642692 1.77443969 0.99978161
		 0.45642692 1.77449954 0.99984133 0.45642692 1.77453792 0.99991667 0.45642692 1.77455115 1.000000119209
		 0.45642692 1.77453792 1.000083565712 0.45642692 1.77449954 1.00015890598 0.45642692 1.77443969 1.00021874905
		 0.45642692 1.77436435 1.00025713444 0.45642692 1.77428091 1.00027036667 0.45642692 1.77419746 1.00025713444
		 0.45642692 1.77412212 1.00021874905 0.45642692 1.77406228 1.00015890598 0.45642692 1.77402389 1.000083565712
		 0.45642692 1.77401066 1.000000119209 0.85595143 1.77428091 -0.27811545 0.72811574 1.77428091 -0.52900702
		 0.52900702 1.77428091 -0.72811574 0.27811542 1.77428091 -0.85595131 0 1.77428091 -0.90000039
		 -0.27811542 1.77428091 -0.85595125 -0.5290069 1.77428091 -0.72811556 -0.7281155 1.77428091 -0.52900684
		 -0.85595107 1.77428091 -0.27811536 -0.90000021 1.77428091 0 -0.85595107 1.77428091 0.27811536
		 -0.72811544 1.77428091 0.52900684 -0.52900684 1.77428091 0.72811538 -0.27811536 1.77428091 0.85595095
		 -2.6822089e-08 1.77428091 0.9000001 0.89999998 1.77428091 0 0.86060625 1.80518258 -0.27962789
		 0.73207539 1.80518258 -0.5318839 0.5318839 1.80518258 -0.73207533 0.27962789 1.80518258 -0.86060613
		 0 1.80518258 -0.90489477 -0.27962789 1.80518258 -0.86060607 -0.53188378 1.80518258 -0.73207521
		 -0.73207515 1.80518258 -0.53188372 -0.8606059 1.80518258 -0.2796278 -0.90489459 1.80518258 0
		 -0.8606059 1.80518258 0.2796278 -0.7320751 1.80518258 0.53188366 -0.53188366 1.80518258 0.73207504
		 -0.2796278 1.80518258 0.86060578 -2.6967953e-08 1.80518258 0.90489447 0.90489435 1.80518258 0
		 0.87411499 1.83305943 -0.28401718 0.74356663 1.83305943 -0.54023278 0.54023278 1.83305943 -0.74356663
		 0.28401715 1.83305943 -0.87411493 0 1.83305943 -0.91909873 -0.28401715 1.83305943 -0.87411487
		 -0.54023266 1.83305943 -0.74356645 -0.74356639 1.83305943 -0.5402326 -0.87411469 1.83305943 -0.28401706
		 -0.91909856 1.83305943 0 -0.87411469 1.83305943 0.28401706 -0.74356633 1.83305943 0.54023254
		 -0.54023254 1.83305943 0.74356627 -0.28401706 1.83305943 0.87411457 -2.7391264e-08 1.83305943 0.91909844
		 0.91909832 1.83305943 0 0.89515543 1.85518265 -0.29085362 0.76146466 1.85518265 -0.55323642
		 0.55323642 1.85518265 -0.76146466 0.29085359 1.85518265 -0.89515531 0 1.85518265 -0.94122195
		 -0.29085359 1.85518265 -0.89515525 -0.55323631 1.85518265 -0.76146448 -0.76146442 1.85518265 -0.55323625
		 -0.89515507 1.85518265 -0.2908535 -0.94122171 1.85518265 0 -0.89515507 1.85518265 0.2908535
		 -0.76146436 1.85518265 0.55323619 -0.55323619 1.85518265 0.7614643 -0.2908535 1.85518265 0.89515495
		 -2.8050586e-08 1.85518265 0.94122159 0.94122148 1.85518265 0 0.92166787 1.86938655 -0.29946804
		 0.78401756 1.86938655 -0.56962204 0.56962204 1.86938655 -0.7840175 0.29946801 1.86938655 -0.92166775
		 0 1.86938655 -0.96909881 -0.29946801 1.86938655 -0.9216677 -0.56962192 1.86938655 -0.78401732
		 -0.78401726 1.86938655 -0.56962186 -0.92166752 1.86938655 -0.29946792 -0.96909857 1.86938655 0
		 -0.92166752 1.86938655 0.29946792 -0.78401721 1.86938655 0.5696218 -0.5696218 1.86938655 0.78401715
		 -0.29946792 1.86938655 0.9216674 -2.8881381e-08 1.86938655 0.96909845 0.96909833 1.86938655 0
		 0.95105714 1.87428093 -0.30901718 0.80901754 1.87428093 -0.5877856 0.5877856 1.87428093 -0.80901748
		 0.30901715 1.87428093 -0.95105702 0 1.87428093 -1.000000476837;
	setAttr ".vt[166:331]" -0.30901715 1.87428093 -0.95105696 -0.58778548 1.87428093 -0.8090173
		 -0.80901724 1.87428093 -0.58778542 -0.95105678 1.87428093 -0.30901706 -1.000000238419 1.87428093 0
		 -0.95105678 1.87428093 0.30901706 -0.80901718 1.87428093 0.58778536 -0.58778536 1.87428093 0.80901712
		 -0.30901706 1.87428093 0.95105666 -2.9802322e-08 1.87428093 1.000000119209 1 1.87428093 0
		 0.9804464 1.86938655 -0.31856632 0.83401752 1.86938655 -0.60594916 0.60594916 1.86938655 -0.83401746
		 0.31856629 1.86938655 -0.98044628 0 1.86938655 -1.030902147 -0.31856629 1.86938655 -0.98044622
		 -0.60594904 1.86938655 -0.83401728 -0.83401722 1.86938655 -0.60594898 -0.98044604 1.86938655 -0.3185662
		 -1.030901909 1.86938655 0 -0.98044604 1.86938655 0.3185662 -0.83401716 1.86938655 0.60594893
		 -0.60594893 1.86938655 0.8340171 -0.3185662 1.86938655 0.98044592 -3.0723264e-08 1.86938655 1.03090179
		 1.03090167 1.86938655 0 1.0069588423 1.85518265 -0.32718074 0.85657042 1.85518265 -0.62233478
		 0.62233478 1.85518265 -0.8565703 0.32718071 1.85518265 -1.0069587231 0 1.85518265 -1.058779001
		 -0.32718071 1.85518265 -1.0069587231 -0.62233466 1.85518265 -0.85657012 -0.85657007 1.85518265 -0.6223346
		 -1.0069584846 1.85518265 -0.32718062 -1.058778763 1.85518265 0 -1.0069584846 1.85518265 0.32718062
		 -0.85657001 1.85518265 0.62233454 -0.62233454 1.85518265 0.85656995 -0.32718062 1.85518265 1.0069583654
		 -3.1554059e-08 1.85518265 1.058778644 1.058778524 1.85518265 0 1.027999282 1.83305943 -0.33401722
		 0.87446845 1.83305943 -0.63533849 0.63533849 1.83305943 -0.87446839 0.33401719 1.83305943 -1.027999163
		 0 1.83305943 -1.080902219 -0.33401719 1.83305943 -1.027999163 -0.63533837 1.83305943 -0.87446821
		 -0.87446815 1.83305943 -0.63533831 -1.027998924 1.83305943 -0.33401707 -1.08090198 1.83305943 0
		 -1.027998924 1.83305943 0.33401707 -0.87446809 1.83305943 0.63533825 -0.63533825 1.83305943 0.87446803
		 -0.33401707 1.83305943 1.027998805 -3.2213382e-08 1.83305943 1.080901861 1.080901742 1.83305943 0
		 1.041508079 1.80518258 -0.33840647 0.88595968 1.80518258 -0.64368731 0.64368731 1.80518258 -0.88595963
		 0.33840641 1.80518258 -1.041507959 0 1.80518258 -1.095106125 -0.33840641 1.80518258 -1.04150784
		 -0.64368719 1.80518258 -0.88595939 -0.88595933 1.80518258 -0.64368713 -1.041507602 1.80518258 -0.33840632
		 -1.095105886 1.80518258 0 -1.041507602 1.80518258 0.33840632 -0.88595927 1.80518258 0.64368707
		 -0.64368707 1.80518258 0.88595921 -0.33840632 1.80518258 1.041507483 -3.2636692e-08 1.80518258 1.095105767
		 1.095105648 1.80518258 0 1.046162844 1.77428091 -0.33991891 0.88991934 1.77428091 -0.64656419
		 0.64656419 1.77428091 -0.88991922 0.33991888 1.77428091 -1.046162724 0 1.77428091 -1.1000005
		 -0.33991888 1.77428091 -1.046162724 -0.64656407 1.77428091 -0.88991904 -0.88991898 1.77428091 -0.64656401
		 -1.046162486 1.77428091 -0.33991876 -1.10000026 1.77428091 0 -1.046162486 1.77428091 0.33991876
		 -0.88991892 1.77428091 0.64656389 -0.64656389 1.77428091 0.88991886 -0.33991876 1.77428091 1.046162367
		 -3.2782555e-08 1.77428091 1.10000014 1.10000002 1.77428091 0 1.041508079 1.74337924 -0.33840647
		 0.88595968 1.74337924 -0.64368731 0.64368731 1.74337924 -0.88595963 0.33840641 1.74337924 -1.041507959
		 0 1.74337924 -1.095106125 -0.33840641 1.74337924 -1.04150784 -0.64368719 1.74337924 -0.88595939
		 -0.88595933 1.74337924 -0.64368713 -1.041507602 1.74337924 -0.33840632 -1.095105886 1.74337924 0
		 -1.041507602 1.74337924 0.33840632 -0.88595927 1.74337924 0.64368707 -0.64368707 1.74337924 0.88595921
		 -0.33840632 1.74337924 1.041507483 -3.2636692e-08 1.74337924 1.095105767 1.095105648 1.74337924 0
		 1.027999282 1.71550238 -0.33401722 0.87446845 1.71550238 -0.63533849 0.63533849 1.71550238 -0.87446839
		 0.33401719 1.71550238 -1.027999163 0 1.71550238 -1.080902219 -0.33401719 1.71550238 -1.027999163
		 -0.63533837 1.71550238 -0.87446821 -0.87446815 1.71550238 -0.63533831 -1.027998924 1.71550238 -0.33401707
		 -1.08090198 1.71550238 0 -1.027998924 1.71550238 0.33401707 -0.87446809 1.71550238 0.63533825
		 -0.63533825 1.71550238 0.87446803 -0.33401707 1.71550238 1.027998805 -3.2213382e-08 1.71550238 1.080901861
		 1.080901742 1.71550238 0 1.0069588423 1.69337916 -0.32718074 0.85657042 1.69337916 -0.62233478
		 0.62233478 1.69337916 -0.8565703 0.32718071 1.69337916 -1.0069587231 0 1.69337916 -1.058779001
		 -0.32718071 1.69337916 -1.0069587231 -0.62233466 1.69337916 -0.85657012 -0.85657007 1.69337916 -0.6223346
		 -1.0069584846 1.69337916 -0.32718062 -1.058778763 1.69337916 0 -1.0069584846 1.69337916 0.32718062
		 -0.85657001 1.69337916 0.62233454 -0.62233454 1.69337916 0.85656995 -0.32718062 1.69337916 1.0069583654
		 -3.1554059e-08 1.69337916 1.058778644 1.058778524 1.69337916 0 0.9804464 1.67917526 -0.31856632
		 0.83401752 1.67917526 -0.60594916 0.60594916 1.67917526 -0.83401746 0.31856629 1.67917526 -0.98044628
		 0 1.67917526 -1.030902147 -0.31856629 1.67917526 -0.98044622 -0.60594904 1.67917526 -0.83401728
		 -0.83401722 1.67917526 -0.60594898 -0.98044604 1.67917526 -0.3185662 -1.030901909 1.67917526 0
		 -0.98044604 1.67917526 0.3185662 -0.83401716 1.67917526 0.60594893 -0.60594893 1.67917526 0.8340171
		 -0.3185662 1.67917526 0.98044592 -3.0723264e-08 1.67917526 1.03090179 1.03090167 1.67917526 0
		 0.95105714 1.67428088 -0.30901718 0.80901754 1.67428088 -0.5877856 0.5877856 1.67428088 -0.80901748
		 0.30901715 1.67428088 -0.95105702 0 1.67428088 -1.000000476837 -0.30901715 1.67428088 -0.95105696
		 -0.58778548 1.67428088 -0.8090173 -0.80901724 1.67428088 -0.58778542 -0.95105678 1.67428088 -0.30901706
		 -1.000000238419 1.67428088 0 -0.95105678 1.67428088 0.30901706;
	setAttr ".vt[332:497]" -0.80901718 1.67428088 0.58778536 -0.58778536 1.67428088 0.80901712
		 -0.30901706 1.67428088 0.95105666 -2.9802322e-08 1.67428088 1.000000119209 1 1.67428088 0
		 0.92166781 1.67917526 -0.29946801 0.7840175 1.67917526 -0.56962198 0.56962198 1.67917526 -0.78401744
		 0.29946798 1.67917526 -0.9216677 0 1.67917526 -0.96909875 -0.29946798 1.67917526 -0.92166764
		 -0.56962192 1.67917526 -0.78401726 -0.78401721 1.67917526 -0.56962186 -0.92166746 1.67917526 -0.29946789
		 -0.96909851 1.67917526 0 -0.92166746 1.67917526 0.29946789 -0.78401715 1.67917526 0.5696218
		 -0.5696218 1.67917526 0.78401709 -0.29946789 1.67917526 0.92166734 -2.8881379e-08 1.67917526 0.96909839
		 0.96909827 1.67917526 0 0.89515537 1.69337916 -0.29085359 0.76146466 1.69337916 -0.55323642
		 0.55323642 1.69337916 -0.7614646 0.29085356 1.69337916 -0.89515525 0 1.69337916 -0.94122189
		 -0.29085356 1.69337916 -0.89515519 -0.55323631 1.69337916 -0.76146442 -0.76146436 1.69337916 -0.55323625
		 -0.89515501 1.69337916 -0.29085347 -0.94122165 1.69337916 0 -0.89515501 1.69337916 0.29085347
		 -0.7614643 1.69337916 0.55323619 -0.55323619 1.69337916 0.76146424 -0.29085347 1.69337916 0.89515489
		 -2.8050584e-08 1.69337916 0.94122154 0.94122142 1.69337916 0 0.87411493 1.71550238 -0.28401715
		 0.74356663 1.71550238 -0.54023272 0.54023272 1.71550238 -0.74356657 0.28401712 1.71550238 -0.87411487
		 0 1.71550238 -0.91909868 -0.28401712 1.71550238 -0.87411481 -0.5402326 1.71550238 -0.74356639
		 -0.74356633 1.71550238 -0.54023254 -0.87411463 1.71550238 -0.28401706 -0.9190985 1.71550238 0
		 -0.87411463 1.71550238 0.28401706 -0.74356627 1.71550238 0.54023248 -0.54023248 1.71550238 0.74356622
		 -0.28401706 1.71550238 0.87411451 -2.7391263e-08 1.71550238 0.91909838 0.91909826 1.71550238 0
		 0.86060619 1.74337924 -0.27962789 0.73207533 1.74337924 -0.53188384 0.53188384 1.74337924 -0.73207527
		 0.27962786 1.74337924 -0.86060607 0 1.74337924 -0.90489471 -0.27962786 1.74337924 -0.86060601
		 -0.53188372 1.74337924 -0.73207515 -0.7320751 1.74337924 -0.53188366 -0.86060584 1.74337924 -0.27962777
		 -0.90489453 1.74337924 0 -0.86060584 1.74337924 0.27962777 -0.73207504 1.74337924 0.5318836
		 -0.5318836 1.74337924 0.73207498 -0.27962777 1.74337924 0.86060572 -2.6967951e-08 1.74337924 0.90489441
		 0.90489429 1.74337924 0 -0.0027888119 -2.087115288 0.89826292 -0.0027888119 -2.040351629 0.8064844
		 -0.0027888119 -1.96751583 0.7336486 -0.0027888119 -1.87573731 0.68688512 -0.0027888119 -1.77400005 0.67077154
		 -0.0027888119 -1.67226279 0.68688512 -0.0027888119 -1.58048427 0.73364866 -0.0027888119 -1.50764847 0.80648446
		 -0.0027888119 -1.46088505 0.89826298 -0.0027888119 -1.44477141 1.000000119209 -0.0027888119 -1.46088505 1.10173738
		 -0.0027888119 -1.50764859 1.19351578 -0.0027888119 -1.58048439 1.26635158 -0.0027888119 -1.67226279 1.31311512
		 -0.0027888119 -1.77400005 1.32922864 -0.0027888119 -1.87573719 1.313115 -0.0027888119 -1.96751571 1.26635158
		 -0.0027888119 -2.040351391 1.19351578 -0.0027888119 -2.087115049 1.10173738 -0.0027888119 -2.10322857 1.000000119209
		 0.45642692 -1.77400005 1.000000119209 0.45642692 -1.77425706 0.99991667 0.45642692 -1.77421868 0.99984133
		 0.45642692 -1.77415884 0.99978161 0.45642692 -1.7740835 0.99974322 0.45642692 -1.77400005 0.99972999
		 0.45642692 -1.7739166 0.99974322 0.45642692 -1.77384126 0.99978161 0.45642692 -1.77378142 0.99984133
		 0.45642692 -1.77374303 0.99991667 0.45642692 -1.7737298 1.000000119209 0.45642692 -1.77374303 1.000083565712
		 0.45642692 -1.77378142 1.00015890598 0.45642692 -1.77384126 1.00021874905 0.45642692 -1.7739166 1.00025713444
		 0.45642692 -1.77400005 1.00027036667 0.45642692 -1.7740835 1.00025713444 0.45642692 -1.77415884 1.00021874905
		 0.45642692 -1.77421868 1.00015890598 0.45642692 -1.77425706 1.000083565712 0.45642692 -1.7742703 1.000000119209
		 0.85595143 -1.77400005 -0.27811545 0.72811574 -1.77400005 -0.52900702 0.52900702 -1.77400005 -0.72811574
		 0.27811542 -1.77400005 -0.85595131 0 -1.77400005 -0.90000039 -0.27811542 -1.77400005 -0.85595125
		 -0.5290069 -1.77400005 -0.72811556 -0.7281155 -1.77400005 -0.52900684 -0.85595107 -1.77400005 -0.27811536
		 -0.90000021 -1.77400005 0 -0.85595107 -1.77400005 0.27811536 -0.72811544 -1.77400005 0.52900684
		 -0.52900684 -1.77400005 0.72811538 -0.27811536 -1.77400005 0.85595095 -2.6822089e-08 -1.77400005 0.9000001
		 0.89999998 -1.77400005 0 0.86060625 -1.74309838 -0.27962789 0.73207539 -1.74309838 -0.5318839
		 0.5318839 -1.74309838 -0.73207533 0.27962789 -1.74309838 -0.86060613 0 -1.74309838 -0.90489477
		 -0.27962789 -1.74309838 -0.86060607 -0.53188378 -1.74309838 -0.73207521 -0.73207515 -1.74309838 -0.53188372
		 -0.8606059 -1.74309838 -0.2796278 -0.90489459 -1.74309838 0 -0.8606059 -1.74309838 0.2796278
		 -0.7320751 -1.74309838 0.53188366 -0.53188366 -1.74309838 0.73207504 -0.2796278 -1.74309838 0.86060578
		 -2.6967953e-08 -1.74309838 0.90489447 0.90489435 -1.74309838 0 0.87411499 -1.71522152 -0.28401718
		 0.74356663 -1.71522152 -0.54023278 0.54023278 -1.71522152 -0.74356663 0.28401715 -1.71522152 -0.87411493
		 0 -1.71522152 -0.91909873 -0.28401715 -1.71522152 -0.87411487 -0.54023266 -1.71522152 -0.74356645
		 -0.74356639 -1.71522152 -0.5402326 -0.87411469 -1.71522152 -0.28401706 -0.91909856 -1.71522152 0
		 -0.87411469 -1.71522152 0.28401706 -0.74356633 -1.71522152 0.54023254 -0.54023254 -1.71522152 0.74356627
		 -0.28401706 -1.71522152 0.87411457 -2.7391264e-08 -1.71522152 0.91909844 0.91909832 -1.71522152 0
		 0.89515543 -1.69309831 -0.29085362 0.76146466 -1.69309831 -0.55323642 0.55323642 -1.69309831 -0.76146466
		 0.29085359 -1.69309831 -0.89515531 0 -1.69309831 -0.94122195 -0.29085359 -1.69309831 -0.89515525
		 -0.55323631 -1.69309831 -0.76146448 -0.76146442 -1.69309831 -0.55323625;
	setAttr ".vt[498:663]" -0.89515507 -1.69309831 -0.2908535 -0.94122171 -1.69309831 0
		 -0.89515507 -1.69309831 0.2908535 -0.76146436 -1.69309831 0.55323619 -0.55323619 -1.69309831 0.7614643
		 -0.2908535 -1.69309831 0.89515495 -2.8050586e-08 -1.69309831 0.94122159 0.94122148 -1.69309831 0
		 0.92166787 -1.6788944 -0.29946804 0.78401756 -1.6788944 -0.56962204 0.56962204 -1.6788944 -0.7840175
		 0.29946801 -1.6788944 -0.92166775 0 -1.6788944 -0.96909881 -0.29946801 -1.6788944 -0.9216677
		 -0.56962192 -1.6788944 -0.78401732 -0.78401726 -1.6788944 -0.56962186 -0.92166752 -1.6788944 -0.29946792
		 -0.96909857 -1.6788944 0 -0.92166752 -1.6788944 0.29946792 -0.78401721 -1.6788944 0.5696218
		 -0.5696218 -1.6788944 0.78401715 -0.29946792 -1.6788944 0.9216674 -2.8881381e-08 -1.6788944 0.96909845
		 0.96909833 -1.6788944 0 0.95105714 -1.67400002 -0.30901718 0.80901754 -1.67400002 -0.5877856
		 0.5877856 -1.67400002 -0.80901748 0.30901715 -1.67400002 -0.95105702 0 -1.67400002 -1.000000476837
		 -0.30901715 -1.67400002 -0.95105696 -0.58778548 -1.67400002 -0.8090173 -0.80901724 -1.67400002 -0.58778542
		 -0.95105678 -1.67400002 -0.30901706 -1.000000238419 -1.67400002 0 -0.95105678 -1.67400002 0.30901706
		 -0.80901718 -1.67400002 0.58778536 -0.58778536 -1.67400002 0.80901712 -0.30901706 -1.67400002 0.95105666
		 -2.9802322e-08 -1.67400002 1.000000119209 1 -1.67400002 0 0.9804464 -1.6788944 -0.31856632
		 0.83401752 -1.6788944 -0.60594916 0.60594916 -1.6788944 -0.83401746 0.31856629 -1.6788944 -0.98044628
		 0 -1.6788944 -1.030902147 -0.31856629 -1.6788944 -0.98044622 -0.60594904 -1.6788944 -0.83401728
		 -0.83401722 -1.6788944 -0.60594898 -0.98044604 -1.6788944 -0.3185662 -1.030901909 -1.6788944 0
		 -0.98044604 -1.6788944 0.3185662 -0.83401716 -1.6788944 0.60594893 -0.60594893 -1.6788944 0.8340171
		 -0.3185662 -1.6788944 0.98044592 -3.0723264e-08 -1.6788944 1.03090179 1.03090167 -1.6788944 0
		 1.0069588423 -1.69309831 -0.32718074 0.85657042 -1.69309831 -0.62233478 0.62233478 -1.69309831 -0.8565703
		 0.32718071 -1.69309831 -1.0069587231 0 -1.69309831 -1.058779001 -0.32718071 -1.69309831 -1.0069587231
		 -0.62233466 -1.69309831 -0.85657012 -0.85657007 -1.69309831 -0.6223346 -1.0069584846 -1.69309831 -0.32718062
		 -1.058778763 -1.69309831 0 -1.0069584846 -1.69309831 0.32718062 -0.85657001 -1.69309831 0.62233454
		 -0.62233454 -1.69309831 0.85656995 -0.32718062 -1.69309831 1.0069583654 -3.1554059e-08 -1.69309831 1.058778644
		 1.058778524 -1.69309831 0 1.027999282 -1.71522152 -0.33401722 0.87446845 -1.71522152 -0.63533849
		 0.63533849 -1.71522152 -0.87446839 0.33401719 -1.71522152 -1.027999163 0 -1.71522152 -1.080902219
		 -0.33401719 -1.71522152 -1.027999163 -0.63533837 -1.71522152 -0.87446821 -0.87446815 -1.71522152 -0.63533831
		 -1.027998924 -1.71522152 -0.33401707 -1.08090198 -1.71522152 0 -1.027998924 -1.71522152 0.33401707
		 -0.87446809 -1.71522152 0.63533825 -0.63533825 -1.71522152 0.87446803 -0.33401707 -1.71522152 1.027998805
		 -3.2213382e-08 -1.71522152 1.080901861 1.080901742 -1.71522152 0 1.041508079 -1.74309838 -0.33840647
		 0.88595968 -1.74309838 -0.64368731 0.64368731 -1.74309838 -0.88595963 0.33840641 -1.74309838 -1.041507959
		 0 -1.74309838 -1.095106125 -0.33840641 -1.74309838 -1.04150784 -0.64368719 -1.74309838 -0.88595939
		 -0.88595933 -1.74309838 -0.64368713 -1.041507602 -1.74309838 -0.33840632 -1.095105886 -1.74309838 0
		 -1.041507602 -1.74309838 0.33840632 -0.88595927 -1.74309838 0.64368707 -0.64368707 -1.74309838 0.88595921
		 -0.33840632 -1.74309838 1.041507483 -3.2636692e-08 -1.74309838 1.095105767 1.095105648 -1.74309838 0
		 1.046162844 -1.77400005 -0.33991891 0.88991934 -1.77400005 -0.64656419 0.64656419 -1.77400005 -0.88991922
		 0.33991888 -1.77400005 -1.046162724 0 -1.77400005 -1.1000005 -0.33991888 -1.77400005 -1.046162724
		 -0.64656407 -1.77400005 -0.88991904 -0.88991898 -1.77400005 -0.64656401 -1.046162486 -1.77400005 -0.33991876
		 -1.10000026 -1.77400005 0 -1.046162486 -1.77400005 0.33991876 -0.88991892 -1.77400005 0.64656389
		 -0.64656389 -1.77400005 0.88991886 -0.33991876 -1.77400005 1.046162367 -3.2782555e-08 -1.77400005 1.10000014
		 1.10000002 -1.77400005 0 1.041508079 -1.80490172 -0.33840647 0.88595968 -1.80490172 -0.64368731
		 0.64368731 -1.80490172 -0.88595963 0.33840641 -1.80490172 -1.041507959 0 -1.80490172 -1.095106125
		 -0.33840641 -1.80490172 -1.04150784 -0.64368719 -1.80490172 -0.88595939 -0.88595933 -1.80490172 -0.64368713
		 -1.041507602 -1.80490172 -0.33840632 -1.095105886 -1.80490172 0 -1.041507602 -1.80490172 0.33840632
		 -0.88595927 -1.80490172 0.64368707 -0.64368707 -1.80490172 0.88595921 -0.33840632 -1.80490172 1.041507483
		 -3.2636692e-08 -1.80490172 1.095105767 1.095105648 -1.80490172 0 1.027999282 -1.83277857 -0.33401722
		 0.87446845 -1.83277857 -0.63533849 0.63533849 -1.83277857 -0.87446839 0.33401719 -1.83277857 -1.027999163
		 0 -1.83277857 -1.080902219 -0.33401719 -1.83277857 -1.027999163 -0.63533837 -1.83277857 -0.87446821
		 -0.87446815 -1.83277857 -0.63533831 -1.027998924 -1.83277857 -0.33401707 -1.08090198 -1.83277857 0
		 -1.027998924 -1.83277857 0.33401707 -0.87446809 -1.83277857 0.63533825 -0.63533825 -1.83277857 0.87446803
		 -0.33401707 -1.83277857 1.027998805 -3.2213382e-08 -1.83277857 1.080901861 1.080901742 -1.83277857 0
		 1.0069588423 -1.85490179 -0.32718074 0.85657042 -1.85490179 -0.62233478 0.62233478 -1.85490179 -0.8565703
		 0.32718071 -1.85490179 -1.0069587231 0 -1.85490179 -1.058779001 -0.32718071 -1.85490179 -1.0069587231
		 -0.62233466 -1.85490179 -0.85657012 -0.85657007 -1.85490179 -0.6223346 -1.0069584846 -1.85490179 -0.32718062
		 -1.058778763 -1.85490179 0 -1.0069584846 -1.85490179 0.32718062 -0.85657001 -1.85490179 0.62233454
		 -0.62233454 -1.85490179 0.85656995 -0.32718062 -1.85490179 1.0069583654;
	setAttr ".vt[664:761]" -3.1554059e-08 -1.85490179 1.058778644 1.058778524 -1.85490179 0
		 0.9804464 -1.8691057 -0.31856632 0.83401752 -1.8691057 -0.60594916 0.60594916 -1.8691057 -0.83401746
		 0.31856629 -1.8691057 -0.98044628 0 -1.8691057 -1.030902147 -0.31856629 -1.8691057 -0.98044622
		 -0.60594904 -1.8691057 -0.83401728 -0.83401722 -1.8691057 -0.60594898 -0.98044604 -1.8691057 -0.3185662
		 -1.030901909 -1.8691057 0 -0.98044604 -1.8691057 0.3185662 -0.83401716 -1.8691057 0.60594893
		 -0.60594893 -1.8691057 0.8340171 -0.3185662 -1.8691057 0.98044592 -3.0723264e-08 -1.8691057 1.03090179
		 1.03090167 -1.8691057 0 0.95105714 -1.87400007 -0.30901718 0.80901754 -1.87400007 -0.5877856
		 0.5877856 -1.87400007 -0.80901748 0.30901715 -1.87400007 -0.95105702 0 -1.87400007 -1.000000476837
		 -0.30901715 -1.87400007 -0.95105696 -0.58778548 -1.87400007 -0.8090173 -0.80901724 -1.87400007 -0.58778542
		 -0.95105678 -1.87400007 -0.30901706 -1.000000238419 -1.87400007 0 -0.95105678 -1.87400007 0.30901706
		 -0.80901718 -1.87400007 0.58778536 -0.58778536 -1.87400007 0.80901712 -0.30901706 -1.87400007 0.95105666
		 -2.9802322e-08 -1.87400007 1.000000119209 1 -1.87400007 0 0.92166781 -1.8691057 -0.29946801
		 0.7840175 -1.8691057 -0.56962198 0.56962198 -1.8691057 -0.78401744 0.29946798 -1.8691057 -0.9216677
		 0 -1.8691057 -0.96909875 -0.29946798 -1.8691057 -0.92166764 -0.56962192 -1.8691057 -0.78401726
		 -0.78401721 -1.8691057 -0.56962186 -0.92166746 -1.8691057 -0.29946789 -0.96909851 -1.8691057 0
		 -0.92166746 -1.8691057 0.29946789 -0.78401715 -1.8691057 0.5696218 -0.5696218 -1.8691057 0.78401709
		 -0.29946789 -1.8691057 0.92166734 -2.8881379e-08 -1.8691057 0.96909839 0.96909827 -1.8691057 0
		 0.89515537 -1.85490179 -0.29085359 0.76146466 -1.85490179 -0.55323642 0.55323642 -1.85490179 -0.7614646
		 0.29085356 -1.85490179 -0.89515525 0 -1.85490179 -0.94122189 -0.29085356 -1.85490179 -0.89515519
		 -0.55323631 -1.85490179 -0.76146442 -0.76146436 -1.85490179 -0.55323625 -0.89515501 -1.85490179 -0.29085347
		 -0.94122165 -1.85490179 0 -0.89515501 -1.85490179 0.29085347 -0.7614643 -1.85490179 0.55323619
		 -0.55323619 -1.85490179 0.76146424 -0.29085347 -1.85490179 0.89515489 -2.8050584e-08 -1.85490179 0.94122154
		 0.94122142 -1.85490179 0 0.87411493 -1.83277857 -0.28401715 0.74356663 -1.83277857 -0.54023272
		 0.54023272 -1.83277857 -0.74356657 0.28401712 -1.83277857 -0.87411487 0 -1.83277857 -0.91909868
		 -0.28401712 -1.83277857 -0.87411481 -0.5402326 -1.83277857 -0.74356639 -0.74356633 -1.83277857 -0.54023254
		 -0.87411463 -1.83277857 -0.28401706 -0.9190985 -1.83277857 0 -0.87411463 -1.83277857 0.28401706
		 -0.74356627 -1.83277857 0.54023248 -0.54023248 -1.83277857 0.74356622 -0.28401706 -1.83277857 0.87411451
		 -2.7391263e-08 -1.83277857 0.91909838 0.91909826 -1.83277857 0 0.86060619 -1.80490172 -0.27962789
		 0.73207533 -1.80490172 -0.53188384 0.53188384 -1.80490172 -0.73207527 0.27962786 -1.80490172 -0.86060607
		 0 -1.80490172 -0.90489471 -0.27962786 -1.80490172 -0.86060601 -0.53188372 -1.80490172 -0.73207515
		 -0.7320751 -1.80490172 -0.53188366 -0.86060584 -1.80490172 -0.27962777 -0.90489453 -1.80490172 0
		 -0.86060584 -1.80490172 0.27962777 -0.73207504 -1.80490172 0.5318836 -0.5318836 -1.80490172 0.73207498
		 -0.27962777 -1.80490172 0.86060572 -2.6967951e-08 -1.80490172 0.90489441 0.90489429 -1.80490172 0;
	setAttr -s 1494 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0 7 8 0 8 9 0
		 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0 18 19 0 19 0 0
		 20 21 0 21 22 0 22 23 0 23 24 0 24 25 0 25 26 0 26 27 0 27 28 0 28 29 0 29 30 0 30 31 0
		 31 32 0 32 33 0 33 34 0 34 35 0 35 36 0 36 37 0 37 38 0 38 39 0 39 20 0 0 20 1 1 21 1
		 2 22 1 3 23 1 4 24 1 5 25 1 6 26 1 7 27 1 8 28 1 9 29 1 10 30 1 11 31 1 12 32 1 13 33 1
		 14 34 1 15 35 1 16 36 1 17 37 1 18 38 1 19 39 1 40 41 0 41 42 0 42 43 0 43 44 0 44 45 0
		 45 46 0 46 47 0 47 48 0 48 49 0 49 50 0 50 51 0 51 52 0 52 53 0 53 54 0 54 55 0 55 56 0
		 56 57 0 57 58 0 58 59 0 59 40 0 40 61 1 41 62 1 42 63 1 43 64 1 44 65 1 45 66 1 46 67 1
		 47 68 1 48 69 1 49 70 1 50 71 1 51 72 1 52 73 1 53 74 1 54 75 1 55 76 1 56 77 1 57 78 1
		 58 79 1 59 80 1 61 60 0 62 60 0 63 60 0 64 60 0 65 60 0 66 60 0 67 60 0 68 60 0 69 60 0
		 70 60 0 71 60 0 72 60 0 73 60 0 74 60 0 75 60 0 76 60 0 77 60 0 78 60 0 79 60 0 80 60 0
		 62 61 0 63 62 0 64 63 0 65 64 0 66 65 0 67 66 0 68 67 0 69 68 0 70 69 0 71 70 0 72 71 0
		 73 72 0 74 73 0 75 74 0 76 75 0 77 76 0 78 77 0 79 78 0 80 79 0 61 80 0 81 82 1 82 83 1
		 83 84 1 84 85 1 85 86 1 86 87 1 87 88 1 88 89 1 89 90 1 90 91 1 91 92 1 92 93 1 93 94 1
		 94 95 1 96 81 1 97 98 1 98 99 1 99 100 1 100 101 1 101 102 1 102 103 1 103 104 1
		 104 105 1 105 106 1 106 107 1 107 108 1;
	setAttr ".ed[166:331]" 108 109 1 109 110 1 110 111 1 112 97 1 113 114 1 114 115 1
		 115 116 1 116 117 1 117 118 1 118 119 1 119 120 1 120 121 1 121 122 1 122 123 1 123 124 1
		 124 125 1 125 126 1 126 127 1 128 113 1 129 130 1 130 131 1 131 132 1 132 133 1 133 134 1
		 134 135 1 135 136 1 136 137 1 137 138 1 138 139 1 139 140 1 140 141 1 141 142 1 142 143 1
		 144 129 1 145 146 1 146 147 1 147 148 1 148 149 1 149 150 1 150 151 1 151 152 1 152 153 1
		 153 154 1 154 155 1 155 156 1 156 157 1 157 158 1 158 159 1 160 145 1 161 162 1 162 163 1
		 163 164 1 164 165 1 165 166 1 166 167 1 167 168 1 168 169 1 169 170 1 170 171 1 171 172 1
		 172 173 1 173 174 1 174 175 1 176 161 1 177 178 1 178 179 1 179 180 1 180 181 1 181 182 1
		 182 183 1 183 184 1 184 185 1 185 186 1 186 187 1 187 188 1 188 189 1 189 190 1 190 191 1
		 192 177 1 193 194 1 194 195 1 195 196 1 196 197 1 197 198 1 198 199 1 199 200 1 200 201 1
		 201 202 1 202 203 1 203 204 1 204 205 1 205 206 1 206 207 1 208 193 1 209 210 1 210 211 1
		 211 212 1 212 213 1 213 214 1 214 215 1 215 216 1 216 217 1 217 218 1 218 219 1 219 220 1
		 220 221 1 221 222 1 222 223 1 224 209 1 225 226 1 226 227 1 227 228 1 228 229 1 229 230 1
		 230 231 1 231 232 1 232 233 1 233 234 1 234 235 1 235 236 1 236 237 1 237 238 1 238 239 1
		 240 225 1 241 242 1 242 243 1 243 244 1 244 245 1 245 246 1 246 247 1 247 248 1 248 249 1
		 249 250 1 250 251 1 251 252 1 252 253 1 253 254 1 254 255 1 256 241 1 257 258 1 258 259 1
		 259 260 1 260 261 1 261 262 1 262 263 1 263 264 1 264 265 1 265 266 1 266 267 1 267 268 1
		 268 269 1 269 270 1 270 271 1 272 257 1 273 274 1 274 275 1 275 276 1 276 277 1 277 278 1
		 278 279 1 279 280 1 280 281 1 281 282 1 282 283 1 283 284 1 284 285 1;
	setAttr ".ed[332:497]" 285 286 1 286 287 1 288 273 1 289 290 1 290 291 1 291 292 1
		 292 293 1 293 294 1 294 295 1 295 296 1 296 297 1 297 298 1 298 299 1 299 300 1 300 301 1
		 301 302 1 302 303 1 304 289 1 305 306 1 306 307 1 307 308 1 308 309 1 309 310 1 310 311 1
		 311 312 1 312 313 1 313 314 1 314 315 1 315 316 1 316 317 1 317 318 1 318 319 1 320 305 1
		 321 322 1 322 323 1 323 324 1 324 325 1 325 326 1 326 327 1 327 328 1 328 329 1 329 330 1
		 330 331 1 331 332 1 332 333 1 333 334 1 334 335 1 336 321 1 337 338 1 338 339 1 339 340 1
		 340 341 1 341 342 1 342 343 1 343 344 1 344 345 1 345 346 1 346 347 1 347 348 1 348 349 1
		 349 350 1 350 351 1 352 337 1 353 354 1 354 355 1 355 356 1 356 357 1 357 358 1 358 359 1
		 359 360 1 360 361 1 361 362 1 362 363 1 363 364 1 364 365 1 365 366 1 366 367 1 368 353 1
		 369 370 1 370 371 1 371 372 1 372 373 1 373 374 1 374 375 1 375 376 1 376 377 1 377 378 1
		 378 379 1 379 380 1 380 381 1 381 382 1 382 383 1 384 369 1 385 386 1 386 387 1 387 388 1
		 388 389 1 389 390 1 390 391 1 391 392 1 392 393 1 393 394 1 394 395 1 395 396 1 396 397 1
		 397 398 1 398 399 1 400 385 1 81 97 1 82 98 1 83 99 1 84 100 1 85 101 1 86 102 1
		 87 103 1 88 104 1 89 105 1 90 106 1 91 107 1 92 108 1 93 109 1 94 110 1 95 111 0
		 96 112 0 97 113 1 98 114 1 99 115 1 100 116 1 101 117 1 102 118 1 103 119 1 104 120 1
		 105 121 1 106 122 1 107 123 1 108 124 1 109 125 1 110 126 1 111 127 0 112 128 0 113 129 1
		 114 130 1 115 131 1 116 132 1 117 133 1 118 134 1 119 135 1 120 136 1 121 137 1 122 138 1
		 123 139 1 124 140 1 125 141 1 126 142 1 127 143 0 128 144 0 129 145 1 130 146 1 131 147 1
		 132 148 1 133 149 1 134 150 1 135 151 1 136 152 1 137 153 1 138 154 1;
	setAttr ".ed[498:663]" 139 155 1 140 156 1 141 157 1 142 158 1 143 159 0 144 160 0
		 145 161 1 146 162 1 147 163 1 148 164 1 149 165 1 150 166 1 151 167 1 152 168 1 153 169 1
		 154 170 1 155 171 1 156 172 1 157 173 1 158 174 1 159 175 0 160 176 0 161 177 1 162 178 1
		 163 179 1 164 180 1 165 181 1 166 182 1 167 183 1 168 184 1 169 185 1 170 186 1 171 187 1
		 172 188 1 173 189 1 174 190 1 175 191 0 176 192 0 177 193 1 178 194 1 179 195 1 180 196 1
		 181 197 1 182 198 1 183 199 1 184 200 1 185 201 1 186 202 1 187 203 1 188 204 1 189 205 1
		 190 206 1 191 207 0 192 208 0 193 209 1 194 210 1 195 211 1 196 212 1 197 213 1 198 214 1
		 199 215 1 200 216 1 201 217 1 202 218 1 203 219 1 204 220 1 205 221 1 206 222 1 207 223 0
		 208 224 0 209 225 1 210 226 1 211 227 1 212 228 1 213 229 1 214 230 1 215 231 1 216 232 1
		 217 233 1 218 234 1 219 235 1 220 236 1 221 237 1 222 238 1 223 239 0 224 240 0 225 241 1
		 226 242 1 227 243 1 228 244 1 229 245 1 230 246 1 231 247 1 232 248 1 233 249 1 234 250 1
		 235 251 1 236 252 1 237 253 1 238 254 1 239 255 0 240 256 0 241 257 1 242 258 1 243 259 1
		 244 260 1 245 261 1 246 262 1 247 263 1 248 264 1 249 265 1 250 266 1 251 267 1 252 268 1
		 253 269 1 254 270 1 255 271 0 256 272 0 257 273 1 258 274 1 259 275 1 260 276 1 261 277 1
		 262 278 1 263 279 1 264 280 1 265 281 1 266 282 1 267 283 1 268 284 1 269 285 1 270 286 1
		 271 287 0 272 288 0 273 289 1 274 290 1 275 291 1 276 292 1 277 293 1 278 294 1 279 295 1
		 280 296 1 281 297 1 282 298 1 283 299 1 284 300 1 285 301 1 286 302 1 287 303 0 288 304 0
		 289 305 1 290 306 1 291 307 1 292 308 1 293 309 1 294 310 1 295 311 1 296 312 1 297 313 1
		 298 314 1 299 315 1 300 316 1 301 317 1 302 318 1 303 319 0 304 320 0;
	setAttr ".ed[664:829]" 305 321 1 306 322 1 307 323 1 308 324 1 309 325 1 310 326 1
		 311 327 1 312 328 1 313 329 1 314 330 1 315 331 1 316 332 1 317 333 1 318 334 1 319 335 0
		 320 336 0 321 337 1 322 338 1 323 339 1 324 340 1 325 341 1 326 342 1 327 343 1 328 344 1
		 329 345 1 330 346 1 331 347 1 332 348 1 333 349 1 334 350 1 335 351 0 336 352 0 337 353 1
		 338 354 1 339 355 1 340 356 1 341 357 1 342 358 1 343 359 1 344 360 1 345 361 1 346 362 1
		 347 363 1 348 364 1 349 365 1 350 366 1 351 367 0 352 368 0 353 369 1 354 370 1 355 371 1
		 356 372 1 357 373 1 358 374 1 359 375 1 360 376 1 361 377 1 362 378 1 363 379 1 364 380 1
		 365 381 1 366 382 1 367 383 0 368 384 0 369 385 1 370 386 1 371 387 1 372 388 1 373 389 1
		 374 390 1 375 391 1 376 392 1 377 393 1 378 394 1 379 395 1 380 396 1 381 397 1 382 398 1
		 383 399 0 384 400 0 385 81 1 386 82 1 387 83 1 388 84 1 389 85 1 390 86 1 391 87 1
		 392 88 1 393 89 1 394 90 1 395 91 1 396 92 1 397 93 1 398 94 1 399 95 0 400 96 0
		 160 352 0 336 176 0 320 192 0 304 208 0 288 224 0 272 240 0 144 368 0 128 384 0 112 400 0
		 191 303 0 319 175 0 335 159 0 207 287 0 223 271 0 351 143 0 367 127 0 383 111 0 401 402 0
		 402 403 0 403 404 0 404 405 0 405 406 0 406 407 0 407 408 0 408 409 0 409 410 0 410 411 0
		 411 412 0 412 413 0 413 414 0 414 415 0 415 416 0 416 417 0 417 418 0 418 419 0 419 420 0
		 420 401 0 401 422 1 402 423 1 403 424 1 404 425 1 405 426 1 406 427 1 407 428 1 408 429 1
		 409 430 1 410 431 1 411 432 1 412 433 1 413 434 1 414 435 1 415 436 1 416 437 1 417 438 1
		 418 439 1 419 440 1 420 441 1 422 421 0 423 421 0 424 421 0 425 421 0 426 421 0 427 421 0
		 428 421 0 429 421 0 430 421 0 431 421 0 432 421 0 433 421 0 434 421 0;
	setAttr ".ed[830:995]" 435 421 0 436 421 0 437 421 0 438 421 0 439 421 0 440 421 0
		 441 421 0 423 422 0 424 423 0 425 424 0 426 425 0 427 426 0 428 427 0 429 428 0 430 429 0
		 431 430 0 432 431 0 433 432 0 434 433 0 435 434 0 436 435 0 437 436 0 438 437 0 439 438 0
		 440 439 0 441 440 0 422 441 0 442 443 1 443 444 1 444 445 1 445 446 1 446 447 1 447 448 1
		 448 449 1 449 450 1 450 451 1 451 452 1 452 453 1 453 454 1 454 455 1 455 456 1 457 442 1
		 458 459 1 459 460 1 460 461 1 461 462 1 462 463 1 463 464 1 464 465 1 465 466 1 466 467 1
		 467 468 1 468 469 1 469 470 1 470 471 1 471 472 1 473 458 1 474 475 1 475 476 1 476 477 1
		 477 478 1 478 479 1 479 480 1 480 481 1 481 482 1 482 483 1 483 484 1 484 485 1 485 486 1
		 486 487 1 487 488 1 489 474 1 490 491 1 491 492 1 492 493 1 493 494 1 494 495 1 495 496 1
		 496 497 1 497 498 1 498 499 1 499 500 1 500 501 1 501 502 1 502 503 1 503 504 1 505 490 1
		 506 507 1 507 508 1 508 509 1 509 510 1 510 511 1 511 512 1 512 513 1 513 514 1 514 515 1
		 515 516 1 516 517 1 517 518 1 518 519 1 519 520 1 521 506 1 522 523 1 523 524 1 524 525 1
		 525 526 1 526 527 1 527 528 1 528 529 1 529 530 1 530 531 1 531 532 1 532 533 1 533 534 1
		 534 535 1 535 536 1 537 522 1 538 539 1 539 540 1 540 541 1 541 542 1 542 543 1 543 544 1
		 544 545 1 545 546 1 546 547 1 547 548 1 548 549 1 549 550 1 550 551 1 551 552 1 553 538 1
		 554 555 1 555 556 1 556 557 1 557 558 1 558 559 1 559 560 1 560 561 1 561 562 1 562 563 1
		 563 564 1 564 565 1 565 566 1 566 567 1 567 568 1 569 554 1 570 571 1 571 572 1 572 573 1
		 573 574 1 574 575 1 575 576 1 576 577 1 577 578 1 578 579 1 579 580 1 580 581 1 581 582 1
		 582 583 1 583 584 1 585 570 1 586 587 1 587 588 1 588 589 1 589 590 1;
	setAttr ".ed[996:1161]" 590 591 1 591 592 1 592 593 1 593 594 1 594 595 1 595 596 1
		 596 597 1 597 598 1 598 599 1 599 600 1 601 586 1 602 603 1 603 604 1 604 605 1 605 606 1
		 606 607 1 607 608 1 608 609 1 609 610 1 610 611 1 611 612 1 612 613 1 613 614 1 614 615 1
		 615 616 1 617 602 1 618 619 1 619 620 1 620 621 1 621 622 1 622 623 1 623 624 1 624 625 1
		 625 626 1 626 627 1 627 628 1 628 629 1 629 630 1 630 631 1 631 632 1 633 618 1 634 635 1
		 635 636 1 636 637 1 637 638 1 638 639 1 639 640 1 640 641 1 641 642 1 642 643 1 643 644 1
		 644 645 1 645 646 1 646 647 1 647 648 1 649 634 1 650 651 1 651 652 1 652 653 1 653 654 1
		 654 655 1 655 656 1 656 657 1 657 658 1 658 659 1 659 660 1 660 661 1 661 662 1 662 663 1
		 663 664 1 665 650 1 666 667 1 667 668 1 668 669 1 669 670 1 670 671 1 671 672 1 672 673 1
		 673 674 1 674 675 1 675 676 1 676 677 1 677 678 1 678 679 1 679 680 1 681 666 1 682 683 1
		 683 684 1 684 685 1 685 686 1 686 687 1 687 688 1 688 689 1 689 690 1 690 691 1 691 692 1
		 692 693 1 693 694 1 694 695 1 695 696 1 697 682 1 698 699 1 699 700 1 700 701 1 701 702 1
		 702 703 1 703 704 1 704 705 1 705 706 1 706 707 1 707 708 1 708 709 1 709 710 1 710 711 1
		 711 712 1 713 698 1 714 715 1 715 716 1 716 717 1 717 718 1 718 719 1 719 720 1 720 721 1
		 721 722 1 722 723 1 723 724 1 724 725 1 725 726 1 726 727 1 727 728 1 729 714 1 730 731 1
		 731 732 1 732 733 1 733 734 1 734 735 1 735 736 1 736 737 1 737 738 1 738 739 1 739 740 1
		 740 741 1 741 742 1 742 743 1 743 744 1 745 730 1 746 747 1 747 748 1 748 749 1 749 750 1
		 750 751 1 751 752 1 752 753 1 753 754 1 754 755 1 755 756 1 756 757 1 757 758 1 758 759 1
		 759 760 1 761 746 1 442 458 1 443 459 1 444 460 1 445 461 1 446 462 1;
	setAttr ".ed[1162:1327]" 447 463 1 448 464 1 449 465 1 450 466 1 451 467 1 452 468 1
		 453 469 1 454 470 1 455 471 1 456 472 0 457 473 0 458 474 1 459 475 1 460 476 1 461 477 1
		 462 478 1 463 479 1 464 480 1 465 481 1 466 482 1 467 483 1 468 484 1 469 485 1 470 486 1
		 471 487 1 472 488 0 473 489 0 474 490 1 475 491 1 476 492 1 477 493 1 478 494 1 479 495 1
		 480 496 1 481 497 1 482 498 1 483 499 1 484 500 1 485 501 1 486 502 1 487 503 1 488 504 0
		 489 505 0 490 506 1 491 507 1 492 508 1 493 509 1 494 510 1 495 511 1 496 512 1 497 513 1
		 498 514 1 499 515 1 500 516 1 501 517 1 502 518 1 503 519 1 504 520 0 505 521 0 506 522 1
		 507 523 1 508 524 1 509 525 1 510 526 1 511 527 1 512 528 1 513 529 1 514 530 1 515 531 1
		 516 532 1 517 533 1 518 534 1 519 535 1 520 536 0 521 537 0 522 538 1 523 539 1 524 540 1
		 525 541 1 526 542 1 527 543 1 528 544 1 529 545 1 530 546 1 531 547 1 532 548 1 533 549 1
		 534 550 1 535 551 1 536 552 0 537 553 0 538 554 1 539 555 1 540 556 1 541 557 1 542 558 1
		 543 559 1 544 560 1 545 561 1 546 562 1 547 563 1 548 564 1 549 565 1 550 566 1 551 567 1
		 552 568 0 553 569 0 554 570 1 555 571 1 556 572 1 557 573 1 558 574 1 559 575 1 560 576 1
		 561 577 1 562 578 1 563 579 1 564 580 1 565 581 1 566 582 1 567 583 1 568 584 0 569 585 0
		 570 586 1 571 587 1 572 588 1 573 589 1 574 590 1 575 591 1 576 592 1 577 593 1 578 594 1
		 579 595 1 580 596 1 581 597 1 582 598 1 583 599 1 584 600 0 585 601 0 586 602 1 587 603 1
		 588 604 1 589 605 1 590 606 1 591 607 1 592 608 1 593 609 1 594 610 1 595 611 1 596 612 1
		 597 613 1 598 614 1 599 615 1 600 616 0 601 617 0 602 618 1 603 619 1 604 620 1 605 621 1
		 606 622 1 607 623 1 608 624 1 609 625 1 610 626 1 611 627 1 612 628 1;
	setAttr ".ed[1328:1493]" 613 629 1 614 630 1 615 631 1 616 632 0 617 633 0 618 634 1
		 619 635 1 620 636 1 621 637 1 622 638 1 623 639 1 624 640 1 625 641 1 626 642 1 627 643 1
		 628 644 1 629 645 1 630 646 1 631 647 1 632 648 0 633 649 0 634 650 1 635 651 1 636 652 1
		 637 653 1 638 654 1 639 655 1 640 656 1 641 657 1 642 658 1 643 659 1 644 660 1 645 661 1
		 646 662 1 647 663 1 648 664 0 649 665 0 650 666 1 651 667 1 652 668 1 653 669 1 654 670 1
		 655 671 1 656 672 1 657 673 1 658 674 1 659 675 1 660 676 1 661 677 1 662 678 1 663 679 1
		 664 680 0 665 681 0 666 682 1 667 683 1 668 684 1 669 685 1 670 686 1 671 687 1 672 688 1
		 673 689 1 674 690 1 675 691 1 676 692 1 677 693 1 678 694 1 679 695 1 680 696 0 681 697 0
		 682 698 1 683 699 1 684 700 1 685 701 1 686 702 1 687 703 1 688 704 1 689 705 1 690 706 1
		 691 707 1 692 708 1 693 709 1 694 710 1 695 711 1 696 712 0 697 713 0 698 714 1 699 715 1
		 700 716 1 701 717 1 702 718 1 703 719 1 704 720 1 705 721 1 706 722 1 707 723 1 708 724 1
		 709 725 1 710 726 1 711 727 1 712 728 0 713 729 0 714 730 1 715 731 1 716 732 1 717 733 1
		 718 734 1 719 735 1 720 736 1 721 737 1 722 738 1 723 739 1 724 740 1 725 741 1 726 742 1
		 727 743 1 728 744 0 729 745 0 730 746 1 731 747 1 732 748 1 733 749 1 734 750 1 735 751 1
		 736 752 1 737 753 1 738 754 1 739 755 1 740 756 1 741 757 1 742 758 1 743 759 1 744 760 0
		 745 761 0 746 442 1 747 443 1 748 444 1 749 445 1 750 446 1 751 447 1 752 448 1 753 449 1
		 754 450 1 755 451 1 756 452 1 757 453 1 758 454 1 759 455 1 760 456 0 761 457 0 521 713 0
		 697 537 0 681 553 0 665 569 0 649 585 0 633 601 0 505 729 0 489 745 0 473 761 0 552 664 0
		 680 536 0 696 520 0 568 648 0 584 632 0 712 504 0 728 488 0 744 472 0;
	setAttr -s 742 -ch 2988 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces" 
		f 4 0 41 -21 -41
		mu 0 4 20 21 42 41
		f 4 1 42 -22 -42
		mu 0 4 21 22 43 42
		f 4 2 43 -23 -43
		mu 0 4 22 23 44 43
		f 4 3 44 -24 -44
		mu 0 4 23 24 45 44
		f 4 4 45 -25 -45
		mu 0 4 24 25 46 45
		f 4 5 46 -26 -46
		mu 0 4 25 26 47 46
		f 4 6 47 -27 -47
		mu 0 4 26 27 48 47
		f 4 7 48 -28 -48
		mu 0 4 27 28 49 48
		f 4 8 49 -29 -49
		mu 0 4 28 29 50 49
		f 4 9 50 -30 -50
		mu 0 4 29 30 51 50
		f 4 10 51 -31 -51
		mu 0 4 30 31 52 51
		f 4 11 52 -32 -52
		mu 0 4 31 32 53 52
		f 4 12 53 -33 -53
		mu 0 4 32 33 54 53
		f 4 13 54 -34 -54
		mu 0 4 33 34 55 54
		f 4 14 55 -35 -55
		mu 0 4 34 35 56 55
		f 4 15 56 -36 -56
		mu 0 4 35 36 57 56
		f 4 16 57 -37 -57
		mu 0 4 36 37 58 57
		f 4 17 58 -38 -58
		mu 0 4 37 38 59 58
		f 4 18 59 -39 -59
		mu 0 4 38 39 60 59
		f 4 19 40 -40 -60
		mu 0 4 39 40 61 60
		f 20 -20 -19 -18 -17 -16 -15 -14 -13 -12 -11 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1
		mu 0 20 0 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1
		f 20 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39
		mu 0 20 80 79 78 77 76 75 74 73 72 71 70 69 68 67 66 65 64 63 62 81
		f 20 -80 -79 -78 -77 -76 -75 -74 -73 -72 -71 -70 -69 -68 -67 -66 -65 -64 -63 -62 -61
		mu 0 20 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101
		f 4 60 81 120 -81
		mu 0 4 102 103 104 105
		f 4 61 82 121 -82
		mu 0 4 103 106 107 104
		f 4 62 83 122 -83
		mu 0 4 106 108 109 107
		f 4 63 84 123 -84
		mu 0 4 108 110 111 109
		f 4 64 85 124 -85
		mu 0 4 110 112 113 111
		f 4 65 86 125 -86
		mu 0 4 112 114 115 113
		f 4 66 87 126 -87
		mu 0 4 114 116 117 115
		f 4 67 88 127 -88
		mu 0 4 116 118 119 117
		f 4 68 89 128 -89
		mu 0 4 118 120 121 119
		f 4 69 90 129 -90
		mu 0 4 120 122 123 121
		f 4 70 91 130 -91
		mu 0 4 122 124 125 123
		f 4 71 92 131 -92
		mu 0 4 124 126 127 125
		f 4 72 93 132 -93
		mu 0 4 126 128 129 127
		f 4 73 94 133 -94
		mu 0 4 128 130 131 129
		f 4 74 95 134 -95
		mu 0 4 130 132 133 131
		f 4 75 96 135 -96
		mu 0 4 132 134 135 133
		f 4 76 97 136 -97
		mu 0 4 134 136 137 135
		f 4 77 98 137 -98
		mu 0 4 136 138 139 137
		f 4 78 99 138 -99
		mu 0 4 138 140 141 139
		f 4 79 80 139 -100
		mu 0 4 140 142 143 141
		f 3 -121 101 -101
		mu 0 3 105 104 144
		f 3 -122 102 -102
		mu 0 3 104 107 144
		f 3 -123 103 -103
		mu 0 3 107 109 144
		f 3 -124 104 -104
		mu 0 3 109 111 144
		f 3 -125 105 -105
		mu 0 3 111 113 144
		f 3 -126 106 -106
		mu 0 3 113 115 144
		f 3 -127 107 -107
		mu 0 3 115 117 144
		f 3 -128 108 -108
		mu 0 3 117 119 144
		f 3 -129 109 -109
		mu 0 3 119 121 144
		f 3 -130 110 -110
		mu 0 3 121 123 144
		f 3 -131 111 -111
		mu 0 3 123 125 144
		f 3 -132 112 -112
		mu 0 3 125 127 144
		f 3 -133 113 -113
		mu 0 3 127 129 144
		f 3 -134 114 -114
		mu 0 3 129 131 144
		f 3 -135 115 -115
		mu 0 3 131 133 144
		f 3 -136 116 -116
		mu 0 3 133 135 144
		f 3 -137 117 -117
		mu 0 3 135 137 144
		f 3 -138 118 -118
		mu 0 3 137 139 144
		f 3 -139 119 -119
		mu 0 3 139 141 144
		f 3 -140 100 -120
		mu 0 3 141 143 144
		f 4 -141 440 155 -442
		mu 0 4 145 146 147 148
		f 4 -142 441 156 -443
		mu 0 4 149 145 148 150
		f 4 -143 442 157 -444
		mu 0 4 151 149 150 152
		f 4 -144 443 158 -445
		mu 0 4 153 151 152 154
		f 4 -145 444 159 -446
		mu 0 4 155 153 154 156
		f 4 -146 445 160 -447
		mu 0 4 157 155 156 158
		f 4 -147 446 161 -448
		mu 0 4 159 157 158 160
		f 4 -148 447 162 -449
		mu 0 4 161 159 160 162
		f 4 -149 448 163 -450
		mu 0 4 163 161 162 164
		f 4 -150 449 164 -451
		mu 0 4 165 163 164 166
		f 4 -151 450 165 -452
		mu 0 4 167 165 166 168
		f 4 -152 451 166 -453
		mu 0 4 169 167 168 170
		f 4 -153 452 167 -454
		mu 0 4 171 169 170 172
		f 4 -154 453 168 -455
		mu 0 4 173 171 172 174
		f 4 -155 455 169 -441
		mu 0 4 175 176 177 178
		f 4 -156 456 170 -458
		mu 0 4 148 147 179 180
		f 4 -157 457 171 -459
		mu 0 4 150 148 180 181
		f 4 -158 458 172 -460
		mu 0 4 152 150 181 182
		f 4 -159 459 173 -461
		mu 0 4 154 152 182 183
		f 4 -160 460 174 -462
		mu 0 4 156 154 183 184
		f 4 -161 461 175 -463
		mu 0 4 158 156 184 185
		f 4 -162 462 176 -464
		mu 0 4 160 158 185 186
		f 4 -163 463 177 -465
		mu 0 4 162 160 186 187
		f 4 -164 464 178 -466
		mu 0 4 164 162 187 188
		f 4 -165 465 179 -467
		mu 0 4 166 164 188 189
		f 4 -166 466 180 -468
		mu 0 4 168 166 189 190
		f 4 -167 467 181 -469
		mu 0 4 170 168 190 191
		f 4 -168 468 182 -470
		mu 0 4 172 170 191 192
		f 4 -169 469 183 -471
		mu 0 4 174 172 192 193
		f 4 -170 471 184 -457
		mu 0 4 178 177 194 195
		f 4 -171 472 185 -474
		mu 0 4 180 179 196 197
		f 4 -172 473 186 -475
		mu 0 4 181 180 197 198
		f 4 -173 474 187 -476
		mu 0 4 182 181 198 199
		f 4 -174 475 188 -477
		mu 0 4 183 182 199 200
		f 4 -175 476 189 -478
		mu 0 4 184 183 200 201
		f 4 -176 477 190 -479
		mu 0 4 185 184 201 202
		f 4 -177 478 191 -480
		mu 0 4 186 185 202 203
		f 4 -178 479 192 -481
		mu 0 4 187 186 203 204
		f 4 -179 480 193 -482
		mu 0 4 188 187 204 205
		f 4 -180 481 194 -483
		mu 0 4 189 188 205 206
		f 4 -181 482 195 -484
		mu 0 4 190 189 206 207
		f 4 -182 483 196 -485
		mu 0 4 191 190 207 208
		f 4 -183 484 197 -486
		mu 0 4 192 191 208 209
		f 4 -184 485 198 -487
		mu 0 4 193 192 209 210
		f 4 -185 487 199 -473
		mu 0 4 195 194 211 212
		f 4 -186 488 200 -490
		mu 0 4 197 196 213 214
		f 4 -187 489 201 -491
		mu 0 4 198 197 214 215
		f 4 -188 490 202 -492
		mu 0 4 199 198 215 216
		f 4 -189 491 203 -493
		mu 0 4 200 199 216 217
		f 4 -190 492 204 -494
		mu 0 4 201 200 217 218
		f 4 -191 493 205 -495
		mu 0 4 202 201 218 219
		f 4 -192 494 206 -496
		mu 0 4 203 202 219 220
		f 4 -193 495 207 -497
		mu 0 4 204 203 220 221
		f 4 -194 496 208 -498
		mu 0 4 205 204 221 222
		f 4 -195 497 209 -499
		mu 0 4 206 205 222 223
		f 4 -196 498 210 -500
		mu 0 4 207 206 223 224
		f 4 -197 499 211 -501
		mu 0 4 208 207 224 225
		f 4 -198 500 212 -502
		mu 0 4 209 208 225 226
		f 4 -199 501 213 -503
		mu 0 4 210 209 226 227
		f 4 -200 503 214 -489
		mu 0 4 212 211 228 229
		f 4 -201 504 215 -506
		mu 0 4 214 213 230 231
		f 4 -202 505 216 -507
		mu 0 4 215 214 231 232
		f 4 -203 506 217 -508
		mu 0 4 216 215 232 233
		f 4 -204 507 218 -509
		mu 0 4 217 216 233 234
		f 4 -205 508 219 -510
		mu 0 4 218 217 234 235
		f 4 -206 509 220 -511
		mu 0 4 219 218 235 236
		f 4 -207 510 221 -512
		mu 0 4 220 219 236 237
		f 4 -208 511 222 -513
		mu 0 4 221 220 237 238
		f 4 -209 512 223 -514
		mu 0 4 222 221 238 239
		f 4 -210 513 224 -515
		mu 0 4 223 222 239 240
		f 4 -211 514 225 -516
		mu 0 4 224 223 240 241
		f 4 -212 515 226 -517
		mu 0 4 225 224 241 242
		f 4 -213 516 227 -518
		mu 0 4 226 225 242 243
		f 4 -214 517 228 -519
		mu 0 4 227 226 243 244
		f 4 -215 519 229 -505
		mu 0 4 229 228 245 246
		f 4 -216 520 230 -522
		mu 0 4 231 230 247 248
		f 4 -217 521 231 -523
		mu 0 4 232 231 248 249
		f 4 -218 522 232 -524
		mu 0 4 233 232 249 250
		f 4 -219 523 233 -525
		mu 0 4 234 233 250 251
		f 4 -220 524 234 -526
		mu 0 4 235 234 251 252
		f 4 -221 525 235 -527
		mu 0 4 236 235 252 253
		f 4 -222 526 236 -528
		mu 0 4 237 236 253 254
		f 4 -223 527 237 -529
		mu 0 4 238 237 254 255
		f 4 -224 528 238 -530
		mu 0 4 239 238 255 256
		f 4 -225 529 239 -531
		mu 0 4 240 239 256 257
		f 4 -226 530 240 -532
		mu 0 4 241 240 257 258
		f 4 -227 531 241 -533
		mu 0 4 242 241 258 259
		f 4 -228 532 242 -534
		mu 0 4 243 242 259 260
		f 4 -229 533 243 -535
		mu 0 4 244 243 260 261
		f 4 -230 535 244 -521
		mu 0 4 246 245 262 263
		f 4 -231 536 245 -538
		mu 0 4 248 247 264 265
		f 4 -232 537 246 -539
		mu 0 4 249 248 265 266
		f 4 -233 538 247 -540
		mu 0 4 250 249 266 267
		f 4 -234 539 248 -541
		mu 0 4 251 250 267 268
		f 4 -235 540 249 -542
		mu 0 4 252 251 268 269
		f 4 -236 541 250 -543
		mu 0 4 253 252 269 270
		f 4 -237 542 251 -544
		mu 0 4 254 253 270 271
		f 4 -238 543 252 -545
		mu 0 4 255 254 271 272
		f 4 -239 544 253 -546
		mu 0 4 256 255 272 273
		f 4 -240 545 254 -547
		mu 0 4 257 256 273 274
		f 4 -241 546 255 -548
		mu 0 4 258 257 274 275
		f 4 -242 547 256 -549
		mu 0 4 259 258 275 276
		f 4 -243 548 257 -550
		mu 0 4 260 259 276 277
		f 4 -244 549 258 -551
		mu 0 4 261 260 277 278
		f 4 -245 551 259 -537
		mu 0 4 263 262 279 280
		f 4 -246 552 260 -554
		mu 0 4 265 264 281 282
		f 4 -247 553 261 -555
		mu 0 4 266 265 282 283
		f 4 -248 554 262 -556
		mu 0 4 267 266 283 284
		f 4 -249 555 263 -557
		mu 0 4 268 267 284 285
		f 4 -250 556 264 -558
		mu 0 4 269 268 285 286
		f 4 -251 557 265 -559
		mu 0 4 270 269 286 287
		f 4 -252 558 266 -560
		mu 0 4 271 270 287 288
		f 4 -253 559 267 -561
		mu 0 4 272 271 288 289
		f 4 -254 560 268 -562
		mu 0 4 273 272 289 290
		f 4 -255 561 269 -563
		mu 0 4 274 273 290 291
		f 4 -256 562 270 -564
		mu 0 4 275 274 291 292
		f 4 -257 563 271 -565
		mu 0 4 276 275 292 293
		f 4 -258 564 272 -566
		mu 0 4 277 276 293 294
		f 4 -259 565 273 -567
		mu 0 4 278 277 294 295
		f 4 -260 567 274 -553
		mu 0 4 280 279 296 297
		f 4 -261 568 275 -570
		mu 0 4 282 281 298 299
		f 4 -262 569 276 -571
		mu 0 4 283 282 299 300
		f 4 -263 570 277 -572
		mu 0 4 284 283 300 301
		f 4 -264 571 278 -573
		mu 0 4 285 284 301 302
		f 4 -265 572 279 -574
		mu 0 4 286 285 302 303
		f 4 -266 573 280 -575
		mu 0 4 287 286 303 304
		f 4 -267 574 281 -576
		mu 0 4 288 287 304 305
		f 4 -268 575 282 -577
		mu 0 4 289 288 305 306
		f 4 -269 576 283 -578
		mu 0 4 290 289 306 307
		f 4 -270 577 284 -579
		mu 0 4 291 290 307 308
		f 4 -271 578 285 -580
		mu 0 4 292 291 308 309
		f 4 -272 579 286 -581
		mu 0 4 293 292 309 310
		f 4 -273 580 287 -582
		mu 0 4 294 293 310 311
		f 4 -274 581 288 -583
		mu 0 4 295 294 311 312
		f 4 -275 583 289 -569
		mu 0 4 297 296 313 314
		f 4 -276 584 290 -586
		mu 0 4 299 298 315 316
		f 4 -277 585 291 -587
		mu 0 4 300 299 316 317
		f 4 -278 586 292 -588
		mu 0 4 301 300 317 318
		f 4 -279 587 293 -589
		mu 0 4 302 301 318 319
		f 4 -280 588 294 -590
		mu 0 4 303 302 319 320
		f 4 -281 589 295 -591
		mu 0 4 304 303 320 321
		f 4 -282 590 296 -592
		mu 0 4 305 304 321 322
		f 4 -283 591 297 -593
		mu 0 4 306 305 322 323
		f 4 -284 592 298 -594
		mu 0 4 307 306 323 324
		f 4 -285 593 299 -595
		mu 0 4 308 307 324 325
		f 4 -286 594 300 -596
		mu 0 4 309 308 325 326
		f 4 -287 595 301 -597
		mu 0 4 310 309 326 327
		f 4 -288 596 302 -598
		mu 0 4 311 310 327 328
		f 4 -289 597 303 -599
		mu 0 4 312 311 328 329
		f 4 -290 599 304 -585
		mu 0 4 314 313 330 331
		f 4 -291 600 305 -602
		mu 0 4 316 315 332 333
		f 4 -292 601 306 -603
		mu 0 4 317 316 333 334
		f 4 -293 602 307 -604
		mu 0 4 318 317 334 335
		f 4 -294 603 308 -605
		mu 0 4 319 318 335 336
		f 4 -295 604 309 -606
		mu 0 4 320 319 336 337
		f 4 -296 605 310 -607
		mu 0 4 321 320 337 338
		f 4 -297 606 311 -608
		mu 0 4 322 321 338 339
		f 4 -298 607 312 -609
		mu 0 4 323 322 339 340
		f 4 -299 608 313 -610
		mu 0 4 324 323 340 341
		f 4 -300 609 314 -611
		mu 0 4 325 324 341 342
		f 4 -301 610 315 -612
		mu 0 4 326 325 342 343
		f 4 -302 611 316 -613
		mu 0 4 327 326 343 344
		f 4 -303 612 317 -614
		mu 0 4 328 327 344 345
		f 4 -304 613 318 -615
		mu 0 4 329 328 345 346
		f 4 -305 615 319 -601
		mu 0 4 331 330 347 348
		f 4 -306 616 320 -618
		mu 0 4 333 332 349 350
		f 4 -307 617 321 -619
		mu 0 4 334 333 350 351
		f 4 -308 618 322 -620
		mu 0 4 335 334 351 352
		f 4 -309 619 323 -621
		mu 0 4 336 335 352 353
		f 4 -310 620 324 -622
		mu 0 4 337 336 353 354
		f 4 -311 621 325 -623
		mu 0 4 338 337 354 355
		f 4 -312 622 326 -624
		mu 0 4 339 338 355 356
		f 4 -313 623 327 -625
		mu 0 4 340 339 356 357
		f 4 -314 624 328 -626
		mu 0 4 341 340 357 358
		f 4 -315 625 329 -627
		mu 0 4 342 341 358 359
		f 4 -316 626 330 -628
		mu 0 4 343 342 359 360
		f 4 -317 627 331 -629
		mu 0 4 344 343 360 361
		f 4 -318 628 332 -630
		mu 0 4 345 344 361 362
		f 4 -319 629 333 -631
		mu 0 4 346 345 362 363
		f 4 -320 631 334 -617
		mu 0 4 348 347 364 365
		f 4 -321 632 335 -634
		mu 0 4 350 349 366 367
		f 4 -322 633 336 -635
		mu 0 4 351 350 367 368
		f 4 -323 634 337 -636
		mu 0 4 352 351 368 369
		f 4 -324 635 338 -637
		mu 0 4 353 352 369 370
		f 4 -325 636 339 -638
		mu 0 4 354 353 370 371
		f 4 -326 637 340 -639
		mu 0 4 355 354 371 372
		f 4 -327 638 341 -640
		mu 0 4 356 355 372 373
		f 4 -328 639 342 -641
		mu 0 4 357 356 373 374
		f 4 -329 640 343 -642
		mu 0 4 358 357 374 375
		f 4 -330 641 344 -643
		mu 0 4 359 358 375 376
		f 4 -331 642 345 -644
		mu 0 4 360 359 376 377
		f 4 -332 643 346 -645
		mu 0 4 361 360 377 378
		f 4 -333 644 347 -646
		mu 0 4 362 361 378 379
		f 4 -334 645 348 -647
		mu 0 4 363 362 379 380
		f 4 -335 647 349 -633
		mu 0 4 365 364 381 382
		f 4 -336 648 350 -650
		mu 0 4 367 366 383 384
		f 4 -337 649 351 -651
		mu 0 4 368 367 384 385
		f 4 -338 650 352 -652
		mu 0 4 369 368 385 386
		f 4 -339 651 353 -653
		mu 0 4 370 369 386 387
		f 4 -340 652 354 -654
		mu 0 4 371 370 387 388
		f 4 -341 653 355 -655
		mu 0 4 372 371 388 389
		f 4 -342 654 356 -656
		mu 0 4 373 372 389 390
		f 4 -343 655 357 -657
		mu 0 4 374 373 390 391
		f 4 -344 656 358 -658
		mu 0 4 375 374 391 392
		f 4 -345 657 359 -659
		mu 0 4 376 375 392 393
		f 4 -346 658 360 -660
		mu 0 4 377 376 393 394
		f 4 -347 659 361 -661
		mu 0 4 378 377 394 395
		f 4 -348 660 362 -662
		mu 0 4 379 378 395 396
		f 4 -349 661 363 -663
		mu 0 4 380 379 396 397
		f 4 -350 663 364 -649
		mu 0 4 382 381 398 399
		f 4 -351 664 365 -666
		mu 0 4 384 383 400 401
		f 4 -352 665 366 -667
		mu 0 4 385 384 401 402
		f 4 -353 666 367 -668
		mu 0 4 386 385 402 403
		f 4 -354 667 368 -669
		mu 0 4 387 386 403 404
		f 4 -355 668 369 -670
		mu 0 4 388 387 404 405
		f 4 -356 669 370 -671
		mu 0 4 389 388 405 406
		f 4 -357 670 371 -672
		mu 0 4 390 389 406 407
		f 4 -358 671 372 -673
		mu 0 4 391 390 407 408
		f 4 -359 672 373 -674
		mu 0 4 392 391 408 409
		f 4 -360 673 374 -675
		mu 0 4 393 392 409 410
		f 4 -361 674 375 -676
		mu 0 4 394 393 410 411
		f 4 -362 675 376 -677
		mu 0 4 395 394 411 412
		f 4 -363 676 377 -678
		mu 0 4 396 395 412 413
		f 4 -364 677 378 -679
		mu 0 4 397 396 413 414
		f 4 -365 679 379 -665
		mu 0 4 399 398 415 416
		f 4 -366 680 380 -682
		mu 0 4 401 400 417 418
		f 4 -367 681 381 -683
		mu 0 4 402 401 418 419
		f 4 -368 682 382 -684
		mu 0 4 403 402 419 420
		f 4 -369 683 383 -685
		mu 0 4 404 403 420 421
		f 4 -370 684 384 -686
		mu 0 4 405 404 421 422
		f 4 -371 685 385 -687
		mu 0 4 406 405 422 423
		f 4 -372 686 386 -688
		mu 0 4 407 406 423 424
		f 4 -373 687 387 -689
		mu 0 4 408 407 424 425
		f 4 -374 688 388 -690
		mu 0 4 409 408 425 426
		f 4 -375 689 389 -691
		mu 0 4 410 409 426 427
		f 4 -376 690 390 -692
		mu 0 4 411 410 427 428
		f 4 -377 691 391 -693
		mu 0 4 412 411 428 429
		f 4 -378 692 392 -694
		mu 0 4 413 412 429 430
		f 4 -379 693 393 -695
		mu 0 4 414 413 430 431
		f 4 -380 695 394 -681
		mu 0 4 416 415 432 433
		f 4 -381 696 395 -698
		mu 0 4 418 417 434 435
		f 4 -382 697 396 -699
		mu 0 4 419 418 435 436
		f 4 -383 698 397 -700
		mu 0 4 420 419 436 437
		f 4 -384 699 398 -701
		mu 0 4 421 420 437 438
		f 4 -385 700 399 -702
		mu 0 4 422 421 438 439
		f 4 -386 701 400 -703
		mu 0 4 423 422 439 440
		f 4 -387 702 401 -704
		mu 0 4 424 423 440 441
		f 4 -388 703 402 -705
		mu 0 4 425 424 441 442
		f 4 -389 704 403 -706
		mu 0 4 426 425 442 443
		f 4 -390 705 404 -707
		mu 0 4 427 426 443 444
		f 4 -391 706 405 -708
		mu 0 4 428 427 444 445
		f 4 -392 707 406 -709
		mu 0 4 429 428 445 446
		f 4 -393 708 407 -710
		mu 0 4 430 429 446 447
		f 4 -394 709 408 -711
		mu 0 4 431 430 447 448
		f 4 -395 711 409 -697
		mu 0 4 433 432 449 450
		f 4 -396 712 410 -714
		mu 0 4 435 434 451 452
		f 4 -397 713 411 -715
		mu 0 4 436 435 452 453
		f 4 -398 714 412 -716
		mu 0 4 437 436 453 454
		f 4 -399 715 413 -717
		mu 0 4 438 437 454 455
		f 4 -400 716 414 -718
		mu 0 4 439 438 455 456
		f 4 -401 717 415 -719
		mu 0 4 440 439 456 457
		f 4 -402 718 416 -720
		mu 0 4 441 440 457 458
		f 4 -403 719 417 -721
		mu 0 4 442 441 458 459
		f 4 -404 720 418 -722
		mu 0 4 443 442 459 460
		f 4 -405 721 419 -723
		mu 0 4 444 443 460 461
		f 4 -406 722 420 -724
		mu 0 4 445 444 461 462
		f 4 -407 723 421 -725
		mu 0 4 446 445 462 463
		f 4 -408 724 422 -726
		mu 0 4 447 446 463 464
		f 4 -409 725 423 -727
		mu 0 4 448 447 464 465
		f 4 -410 727 424 -713
		mu 0 4 450 449 466 467
		f 4 -411 728 425 -730
		mu 0 4 452 451 468 469
		f 4 -412 729 426 -731
		mu 0 4 453 452 469 470
		f 4 -413 730 427 -732
		mu 0 4 454 453 470 471
		f 4 -414 731 428 -733
		mu 0 4 455 454 471 472
		f 4 -415 732 429 -734
		mu 0 4 456 455 472 473
		f 4 -416 733 430 -735
		mu 0 4 457 456 473 474
		f 4 -417 734 431 -736
		mu 0 4 458 457 474 475
		f 4 -418 735 432 -737
		mu 0 4 459 458 475 476
		f 4 -419 736 433 -738
		mu 0 4 460 459 476 477
		f 4 -420 737 434 -739
		mu 0 4 461 460 477 478
		f 4 -421 738 435 -740
		mu 0 4 462 461 478 479
		f 4 -422 739 436 -741
		mu 0 4 463 462 479 480
		f 4 -423 740 437 -742
		mu 0 4 464 463 480 481
		f 4 -424 741 438 -743
		mu 0 4 465 464 481 482
		f 4 -425 743 439 -729
		mu 0 4 467 466 483 484
		f 4 -426 744 140 -746
		mu 0 4 469 468 485 486
		f 4 -427 745 141 -747
		mu 0 4 470 469 486 487
		f 4 -428 746 142 -748
		mu 0 4 471 470 487 488
		f 4 -429 747 143 -749
		mu 0 4 472 471 488 489
		f 4 -430 748 144 -750
		mu 0 4 473 472 489 490
		f 4 -431 749 145 -751
		mu 0 4 474 473 490 491
		f 4 -432 750 146 -752
		mu 0 4 475 474 491 492
		f 4 -433 751 147 -753
		mu 0 4 476 475 492 493
		f 4 -434 752 148 -754
		mu 0 4 477 476 493 494
		f 4 -435 753 149 -755
		mu 0 4 478 477 494 495
		f 4 -436 754 150 -756
		mu 0 4 479 478 495 496
		f 4 -437 755 151 -757
		mu 0 4 480 479 496 497
		f 4 -438 756 152 -758
		mu 0 4 481 480 497 498
		f 4 -439 757 153 -759
		mu 0 4 482 481 498 499
		f 4 -440 759 154 -745
		mu 0 4 484 483 500 501
		f 4 -520 760 -696 761
		mu 0 4 502 503 504 505
		f 4 -536 -762 -680 762
		mu 0 4 506 507 508 509
		f 4 -664 763 -552 -763
		mu 0 4 510 511 512 513
		f 4 -568 -764 -648 764
		mu 0 4 514 515 516 517
		f 4 -632 765 -584 -765
		mu 0 4 518 519 520 521
		f 3 -600 -766 -616
		mu 0 3 522 523 524
		f 4 -504 766 -712 -761
		mu 0 4 525 526 527 528
		f 4 -728 -767 -488 767
		mu 0 4 529 530 531 532
		f 4 -472 768 -744 -768
		mu 0 4 533 534 535 536
		f 3 -760 -769 -456
		mu 0 3 537 538 539
		f 4 534 769 662 770
		mu 0 4 540 541 542 543
		f 4 518 -771 678 771
		mu 0 4 544 545 546 547
		f 4 550 772 646 -770
		mu 0 4 548 549 550 551
		f 4 630 -773 566 773
		mu 0 4 552 553 554 555
		f 4 582 598 614 -774
		mu 0 4 556 557 558 559
		f 4 694 774 502 -772
		mu 0 4 560 561 562 563
		f 4 486 -775 710 775
		mu 0 4 564 565 566 567
		f 4 726 776 470 -776
		mu 0 4 568 569 570 571
		f 4 454 -777 742 758
		mu 0 4 572 573 574 575
		f 20 -797 -796 -795 -794 -793 -792 -791 -790 -789 -788 -787 -786 -785 -784 -783 -782
		 -781 -780 -779 -778
		mu 0 20 576 577 578 579 580 581 582 583 584 585 586 587 588 589 590 591 592 593 594 595
		f 4 777 798 837 -798
		mu 0 4 596 597 598 599
		f 4 778 799 838 -799
		mu 0 4 597 600 601 598
		f 4 779 800 839 -800
		mu 0 4 600 602 603 601
		f 4 780 801 840 -801
		mu 0 4 602 604 605 603
		f 4 781 802 841 -802
		mu 0 4 604 606 607 605
		f 4 782 803 842 -803
		mu 0 4 606 608 609 607
		f 4 783 804 843 -804
		mu 0 4 608 610 611 609
		f 4 784 805 844 -805
		mu 0 4 610 612 613 611
		f 4 785 806 845 -806
		mu 0 4 612 614 615 613
		f 4 786 807 846 -807
		mu 0 4 614 616 617 615
		f 4 787 808 847 -808
		mu 0 4 616 618 619 617
		f 4 788 809 848 -809
		mu 0 4 618 620 621 619
		f 4 789 810 849 -810
		mu 0 4 620 622 623 621
		f 4 790 811 850 -811
		mu 0 4 622 624 625 623
		f 4 791 812 851 -812
		mu 0 4 624 626 627 625
		f 4 792 813 852 -813
		mu 0 4 626 628 629 627
		f 4 793 814 853 -814
		mu 0 4 628 630 631 629
		f 4 794 815 854 -815
		mu 0 4 630 632 633 631
		f 4 795 816 855 -816
		mu 0 4 632 634 635 633
		f 4 796 797 856 -817
		mu 0 4 634 636 637 635
		f 3 -838 818 -818
		mu 0 3 599 598 638
		f 3 -839 819 -819
		mu 0 3 598 601 638
		f 3 -840 820 -820
		mu 0 3 601 603 638
		f 3 -841 821 -821
		mu 0 3 603 605 638
		f 3 -842 822 -822
		mu 0 3 605 607 638
		f 3 -843 823 -823
		mu 0 3 607 609 638
		f 3 -844 824 -824
		mu 0 3 609 611 638
		f 3 -845 825 -825
		mu 0 3 611 613 638
		f 3 -846 826 -826
		mu 0 3 613 615 638
		f 3 -847 827 -827
		mu 0 3 615 617 638
		f 3 -848 828 -828
		mu 0 3 617 619 638
		f 3 -849 829 -829
		mu 0 3 619 621 638
		f 3 -850 830 -830
		mu 0 3 621 623 638
		f 3 -851 831 -831
		mu 0 3 623 625 638
		f 3 -852 832 -832
		mu 0 3 625 627 638
		f 3 -853 833 -833
		mu 0 3 627 629 638
		f 3 -854 834 -834
		mu 0 3 629 631 638
		f 3 -855 835 -835
		mu 0 3 631 633 638
		f 3 -856 836 -836
		mu 0 3 633 635 638
		f 3 -857 817 -837
		mu 0 3 635 637 638
		f 4 -858 1157 872 -1159
		mu 0 4 639 640 641 642
		f 4 -859 1158 873 -1160
		mu 0 4 643 639 642 644
		f 4 -860 1159 874 -1161
		mu 0 4 645 643 644 646
		f 4 -861 1160 875 -1162
		mu 0 4 647 645 646 648
		f 4 -862 1161 876 -1163
		mu 0 4 649 647 648 650
		f 4 -863 1162 877 -1164
		mu 0 4 651 649 650 652
		f 4 -864 1163 878 -1165
		mu 0 4 653 651 652 654
		f 4 -865 1164 879 -1166
		mu 0 4 655 653 654 656
		f 4 -866 1165 880 -1167
		mu 0 4 657 655 656 658
		f 4 -867 1166 881 -1168
		mu 0 4 659 657 658 660
		f 4 -868 1167 882 -1169
		mu 0 4 661 659 660 662
		f 4 -869 1168 883 -1170
		mu 0 4 663 661 662 664
		f 4 -870 1169 884 -1171
		mu 0 4 665 663 664 666
		f 4 -871 1170 885 -1172
		mu 0 4 667 665 666 668
		f 4 -872 1172 886 -1158
		mu 0 4 669 670 671 672
		f 4 -873 1173 887 -1175
		mu 0 4 642 641 673 674
		f 4 -874 1174 888 -1176
		mu 0 4 644 642 674 675
		f 4 -875 1175 889 -1177
		mu 0 4 646 644 675 676
		f 4 -876 1176 890 -1178
		mu 0 4 648 646 676 677
		f 4 -877 1177 891 -1179
		mu 0 4 650 648 677 678
		f 4 -878 1178 892 -1180
		mu 0 4 652 650 678 679
		f 4 -879 1179 893 -1181
		mu 0 4 654 652 679 680
		f 4 -880 1180 894 -1182
		mu 0 4 656 654 680 681
		f 4 -881 1181 895 -1183
		mu 0 4 658 656 681 682
		f 4 -882 1182 896 -1184
		mu 0 4 660 658 682 683
		f 4 -883 1183 897 -1185
		mu 0 4 662 660 683 684
		f 4 -884 1184 898 -1186
		mu 0 4 664 662 684 685
		f 4 -885 1185 899 -1187
		mu 0 4 666 664 685 686
		f 4 -886 1186 900 -1188
		mu 0 4 668 666 686 687
		f 4 -887 1188 901 -1174
		mu 0 4 672 671 688 689
		f 4 -888 1189 902 -1191
		mu 0 4 674 673 690 691
		f 4 -889 1190 903 -1192
		mu 0 4 675 674 691 692
		f 4 -890 1191 904 -1193
		mu 0 4 676 675 692 693
		f 4 -891 1192 905 -1194
		mu 0 4 677 676 693 694
		f 4 -892 1193 906 -1195
		mu 0 4 678 677 694 695
		f 4 -893 1194 907 -1196
		mu 0 4 679 678 695 696
		f 4 -894 1195 908 -1197
		mu 0 4 680 679 696 697
		f 4 -895 1196 909 -1198
		mu 0 4 681 680 697 698
		f 4 -896 1197 910 -1199
		mu 0 4 682 681 698 699
		f 4 -897 1198 911 -1200
		mu 0 4 683 682 699 700
		f 4 -898 1199 912 -1201
		mu 0 4 684 683 700 701
		f 4 -899 1200 913 -1202
		mu 0 4 685 684 701 702
		f 4 -900 1201 914 -1203
		mu 0 4 686 685 702 703
		f 4 -901 1202 915 -1204
		mu 0 4 687 686 703 704
		f 4 -902 1204 916 -1190
		mu 0 4 689 688 705 706
		f 4 -903 1205 917 -1207
		mu 0 4 691 690 707 708
		f 4 -904 1206 918 -1208
		mu 0 4 692 691 708 709
		f 4 -905 1207 919 -1209
		mu 0 4 693 692 709 710
		f 4 -906 1208 920 -1210
		mu 0 4 694 693 710 711
		f 4 -907 1209 921 -1211
		mu 0 4 695 694 711 712
		f 4 -908 1210 922 -1212
		mu 0 4 696 695 712 713
		f 4 -909 1211 923 -1213
		mu 0 4 697 696 713 714
		f 4 -910 1212 924 -1214
		mu 0 4 698 697 714 715
		f 4 -911 1213 925 -1215
		mu 0 4 699 698 715 716
		f 4 -912 1214 926 -1216
		mu 0 4 700 699 716 717
		f 4 -913 1215 927 -1217
		mu 0 4 701 700 717 718
		f 4 -914 1216 928 -1218
		mu 0 4 702 701 718 719
		f 4 -915 1217 929 -1219
		mu 0 4 703 702 719 720
		f 4 -916 1218 930 -1220
		mu 0 4 704 703 720 721
		f 4 -917 1220 931 -1206
		mu 0 4 706 705 722 723
		f 4 -918 1221 932 -1223
		mu 0 4 708 707 724 725
		f 4 -919 1222 933 -1224
		mu 0 4 709 708 725 726
		f 4 -920 1223 934 -1225
		mu 0 4 710 709 726 727
		f 4 -921 1224 935 -1226
		mu 0 4 711 710 727 728
		f 4 -922 1225 936 -1227
		mu 0 4 712 711 728 729
		f 4 -923 1226 937 -1228
		mu 0 4 713 712 729 730
		f 4 -924 1227 938 -1229
		mu 0 4 714 713 730 731
		f 4 -925 1228 939 -1230
		mu 0 4 715 714 731 732
		f 4 -926 1229 940 -1231
		mu 0 4 716 715 732 733
		f 4 -927 1230 941 -1232
		mu 0 4 717 716 733 734
		f 4 -928 1231 942 -1233
		mu 0 4 718 717 734 735
		f 4 -929 1232 943 -1234
		mu 0 4 719 718 735 736
		f 4 -930 1233 944 -1235
		mu 0 4 720 719 736 737
		f 4 -931 1234 945 -1236
		mu 0 4 721 720 737 738
		f 4 -932 1236 946 -1222
		mu 0 4 723 722 739 740
		f 4 -933 1237 947 -1239
		mu 0 4 725 724 741 742
		f 4 -934 1238 948 -1240
		mu 0 4 726 725 742 743;
	setAttr ".fc[500:741]"
		f 4 -935 1239 949 -1241
		mu 0 4 727 726 743 744
		f 4 -936 1240 950 -1242
		mu 0 4 728 727 744 745
		f 4 -937 1241 951 -1243
		mu 0 4 729 728 745 746
		f 4 -938 1242 952 -1244
		mu 0 4 730 729 746 747
		f 4 -939 1243 953 -1245
		mu 0 4 731 730 747 748
		f 4 -940 1244 954 -1246
		mu 0 4 732 731 748 749
		f 4 -941 1245 955 -1247
		mu 0 4 733 732 749 750
		f 4 -942 1246 956 -1248
		mu 0 4 734 733 750 751
		f 4 -943 1247 957 -1249
		mu 0 4 735 734 751 752
		f 4 -944 1248 958 -1250
		mu 0 4 736 735 752 753
		f 4 -945 1249 959 -1251
		mu 0 4 737 736 753 754
		f 4 -946 1250 960 -1252
		mu 0 4 738 737 754 755
		f 4 -947 1252 961 -1238
		mu 0 4 740 739 756 757
		f 4 -948 1253 962 -1255
		mu 0 4 742 741 758 759
		f 4 -949 1254 963 -1256
		mu 0 4 743 742 759 760
		f 4 -950 1255 964 -1257
		mu 0 4 744 743 760 761
		f 4 -951 1256 965 -1258
		mu 0 4 745 744 761 762
		f 4 -952 1257 966 -1259
		mu 0 4 746 745 762 763
		f 4 -953 1258 967 -1260
		mu 0 4 747 746 763 764
		f 4 -954 1259 968 -1261
		mu 0 4 748 747 764 765
		f 4 -955 1260 969 -1262
		mu 0 4 749 748 765 766
		f 4 -956 1261 970 -1263
		mu 0 4 750 749 766 767
		f 4 -957 1262 971 -1264
		mu 0 4 751 750 767 768
		f 4 -958 1263 972 -1265
		mu 0 4 752 751 768 769
		f 4 -959 1264 973 -1266
		mu 0 4 753 752 769 770
		f 4 -960 1265 974 -1267
		mu 0 4 754 753 770 771
		f 4 -961 1266 975 -1268
		mu 0 4 755 754 771 772
		f 4 -962 1268 976 -1254
		mu 0 4 757 756 773 774
		f 4 -963 1269 977 -1271
		mu 0 4 759 758 775 776
		f 4 -964 1270 978 -1272
		mu 0 4 760 759 776 777
		f 4 -965 1271 979 -1273
		mu 0 4 761 760 777 778
		f 4 -966 1272 980 -1274
		mu 0 4 762 761 778 779
		f 4 -967 1273 981 -1275
		mu 0 4 763 762 779 780
		f 4 -968 1274 982 -1276
		mu 0 4 764 763 780 781
		f 4 -969 1275 983 -1277
		mu 0 4 765 764 781 782
		f 4 -970 1276 984 -1278
		mu 0 4 766 765 782 783
		f 4 -971 1277 985 -1279
		mu 0 4 767 766 783 784
		f 4 -972 1278 986 -1280
		mu 0 4 768 767 784 785
		f 4 -973 1279 987 -1281
		mu 0 4 769 768 785 786
		f 4 -974 1280 988 -1282
		mu 0 4 770 769 786 787
		f 4 -975 1281 989 -1283
		mu 0 4 771 770 787 788
		f 4 -976 1282 990 -1284
		mu 0 4 772 771 788 789
		f 4 -977 1284 991 -1270
		mu 0 4 774 773 790 791
		f 4 -978 1285 992 -1287
		mu 0 4 776 775 792 793
		f 4 -979 1286 993 -1288
		mu 0 4 777 776 793 794
		f 4 -980 1287 994 -1289
		mu 0 4 778 777 794 795
		f 4 -981 1288 995 -1290
		mu 0 4 779 778 795 796
		f 4 -982 1289 996 -1291
		mu 0 4 780 779 796 797
		f 4 -983 1290 997 -1292
		mu 0 4 781 780 797 798
		f 4 -984 1291 998 -1293
		mu 0 4 782 781 798 799
		f 4 -985 1292 999 -1294
		mu 0 4 783 782 799 800
		f 4 -986 1293 1000 -1295
		mu 0 4 784 783 800 801
		f 4 -987 1294 1001 -1296
		mu 0 4 785 784 801 802
		f 4 -988 1295 1002 -1297
		mu 0 4 786 785 802 803
		f 4 -989 1296 1003 -1298
		mu 0 4 787 786 803 804
		f 4 -990 1297 1004 -1299
		mu 0 4 788 787 804 805
		f 4 -991 1298 1005 -1300
		mu 0 4 789 788 805 806
		f 4 -992 1300 1006 -1286
		mu 0 4 791 790 807 808
		f 4 -993 1301 1007 -1303
		mu 0 4 793 792 809 810
		f 4 -994 1302 1008 -1304
		mu 0 4 794 793 810 811
		f 4 -995 1303 1009 -1305
		mu 0 4 795 794 811 812
		f 4 -996 1304 1010 -1306
		mu 0 4 796 795 812 813
		f 4 -997 1305 1011 -1307
		mu 0 4 797 796 813 814
		f 4 -998 1306 1012 -1308
		mu 0 4 798 797 814 815
		f 4 -999 1307 1013 -1309
		mu 0 4 799 798 815 816
		f 4 -1000 1308 1014 -1310
		mu 0 4 800 799 816 817
		f 4 -1001 1309 1015 -1311
		mu 0 4 801 800 817 818
		f 4 -1002 1310 1016 -1312
		mu 0 4 802 801 818 819
		f 4 -1003 1311 1017 -1313
		mu 0 4 803 802 819 820
		f 4 -1004 1312 1018 -1314
		mu 0 4 804 803 820 821
		f 4 -1005 1313 1019 -1315
		mu 0 4 805 804 821 822
		f 4 -1006 1314 1020 -1316
		mu 0 4 806 805 822 823
		f 4 -1007 1316 1021 -1302
		mu 0 4 808 807 824 825
		f 4 -1008 1317 1022 -1319
		mu 0 4 810 809 826 827
		f 4 -1009 1318 1023 -1320
		mu 0 4 811 810 827 828
		f 4 -1010 1319 1024 -1321
		mu 0 4 812 811 828 829
		f 4 -1011 1320 1025 -1322
		mu 0 4 813 812 829 830
		f 4 -1012 1321 1026 -1323
		mu 0 4 814 813 830 831
		f 4 -1013 1322 1027 -1324
		mu 0 4 815 814 831 832
		f 4 -1014 1323 1028 -1325
		mu 0 4 816 815 832 833
		f 4 -1015 1324 1029 -1326
		mu 0 4 817 816 833 834
		f 4 -1016 1325 1030 -1327
		mu 0 4 818 817 834 835
		f 4 -1017 1326 1031 -1328
		mu 0 4 819 818 835 836
		f 4 -1018 1327 1032 -1329
		mu 0 4 820 819 836 837
		f 4 -1019 1328 1033 -1330
		mu 0 4 821 820 837 838
		f 4 -1020 1329 1034 -1331
		mu 0 4 822 821 838 839
		f 4 -1021 1330 1035 -1332
		mu 0 4 823 822 839 840
		f 4 -1022 1332 1036 -1318
		mu 0 4 825 824 841 842
		f 4 -1023 1333 1037 -1335
		mu 0 4 827 826 843 844
		f 4 -1024 1334 1038 -1336
		mu 0 4 828 827 844 845
		f 4 -1025 1335 1039 -1337
		mu 0 4 829 828 845 846
		f 4 -1026 1336 1040 -1338
		mu 0 4 830 829 846 847
		f 4 -1027 1337 1041 -1339
		mu 0 4 831 830 847 848
		f 4 -1028 1338 1042 -1340
		mu 0 4 832 831 848 849
		f 4 -1029 1339 1043 -1341
		mu 0 4 833 832 849 850
		f 4 -1030 1340 1044 -1342
		mu 0 4 834 833 850 851
		f 4 -1031 1341 1045 -1343
		mu 0 4 835 834 851 852
		f 4 -1032 1342 1046 -1344
		mu 0 4 836 835 852 853
		f 4 -1033 1343 1047 -1345
		mu 0 4 837 836 853 854
		f 4 -1034 1344 1048 -1346
		mu 0 4 838 837 854 855
		f 4 -1035 1345 1049 -1347
		mu 0 4 839 838 855 856
		f 4 -1036 1346 1050 -1348
		mu 0 4 840 839 856 857
		f 4 -1037 1348 1051 -1334
		mu 0 4 842 841 858 859
		f 4 -1038 1349 1052 -1351
		mu 0 4 844 843 860 861
		f 4 -1039 1350 1053 -1352
		mu 0 4 845 844 861 862
		f 4 -1040 1351 1054 -1353
		mu 0 4 846 845 862 863
		f 4 -1041 1352 1055 -1354
		mu 0 4 847 846 863 864
		f 4 -1042 1353 1056 -1355
		mu 0 4 848 847 864 865
		f 4 -1043 1354 1057 -1356
		mu 0 4 849 848 865 866
		f 4 -1044 1355 1058 -1357
		mu 0 4 850 849 866 867
		f 4 -1045 1356 1059 -1358
		mu 0 4 851 850 867 868
		f 4 -1046 1357 1060 -1359
		mu 0 4 852 851 868 869
		f 4 -1047 1358 1061 -1360
		mu 0 4 853 852 869 870
		f 4 -1048 1359 1062 -1361
		mu 0 4 854 853 870 871
		f 4 -1049 1360 1063 -1362
		mu 0 4 855 854 871 872
		f 4 -1050 1361 1064 -1363
		mu 0 4 856 855 872 873
		f 4 -1051 1362 1065 -1364
		mu 0 4 857 856 873 874
		f 4 -1052 1364 1066 -1350
		mu 0 4 859 858 875 876
		f 4 -1053 1365 1067 -1367
		mu 0 4 861 860 877 878
		f 4 -1054 1366 1068 -1368
		mu 0 4 862 861 878 879
		f 4 -1055 1367 1069 -1369
		mu 0 4 863 862 879 880
		f 4 -1056 1368 1070 -1370
		mu 0 4 864 863 880 881
		f 4 -1057 1369 1071 -1371
		mu 0 4 865 864 881 882
		f 4 -1058 1370 1072 -1372
		mu 0 4 866 865 882 883
		f 4 -1059 1371 1073 -1373
		mu 0 4 867 866 883 884
		f 4 -1060 1372 1074 -1374
		mu 0 4 868 867 884 885
		f 4 -1061 1373 1075 -1375
		mu 0 4 869 868 885 886
		f 4 -1062 1374 1076 -1376
		mu 0 4 870 869 886 887
		f 4 -1063 1375 1077 -1377
		mu 0 4 871 870 887 888
		f 4 -1064 1376 1078 -1378
		mu 0 4 872 871 888 889
		f 4 -1065 1377 1079 -1379
		mu 0 4 873 872 889 890
		f 4 -1066 1378 1080 -1380
		mu 0 4 874 873 890 891
		f 4 -1067 1380 1081 -1366
		mu 0 4 876 875 892 893
		f 4 -1068 1381 1082 -1383
		mu 0 4 878 877 894 895
		f 4 -1069 1382 1083 -1384
		mu 0 4 879 878 895 896
		f 4 -1070 1383 1084 -1385
		mu 0 4 880 879 896 897
		f 4 -1071 1384 1085 -1386
		mu 0 4 881 880 897 898
		f 4 -1072 1385 1086 -1387
		mu 0 4 882 881 898 899
		f 4 -1073 1386 1087 -1388
		mu 0 4 883 882 899 900
		f 4 -1074 1387 1088 -1389
		mu 0 4 884 883 900 901
		f 4 -1075 1388 1089 -1390
		mu 0 4 885 884 901 902
		f 4 -1076 1389 1090 -1391
		mu 0 4 886 885 902 903
		f 4 -1077 1390 1091 -1392
		mu 0 4 887 886 903 904
		f 4 -1078 1391 1092 -1393
		mu 0 4 888 887 904 905
		f 4 -1079 1392 1093 -1394
		mu 0 4 889 888 905 906
		f 4 -1080 1393 1094 -1395
		mu 0 4 890 889 906 907
		f 4 -1081 1394 1095 -1396
		mu 0 4 891 890 907 908
		f 4 -1082 1396 1096 -1382
		mu 0 4 893 892 909 910
		f 4 -1083 1397 1097 -1399
		mu 0 4 895 894 911 912
		f 4 -1084 1398 1098 -1400
		mu 0 4 896 895 912 913
		f 4 -1085 1399 1099 -1401
		mu 0 4 897 896 913 914
		f 4 -1086 1400 1100 -1402
		mu 0 4 898 897 914 915
		f 4 -1087 1401 1101 -1403
		mu 0 4 899 898 915 916
		f 4 -1088 1402 1102 -1404
		mu 0 4 900 899 916 917
		f 4 -1089 1403 1103 -1405
		mu 0 4 901 900 917 918
		f 4 -1090 1404 1104 -1406
		mu 0 4 902 901 918 919
		f 4 -1091 1405 1105 -1407
		mu 0 4 903 902 919 920
		f 4 -1092 1406 1106 -1408
		mu 0 4 904 903 920 921
		f 4 -1093 1407 1107 -1409
		mu 0 4 905 904 921 922
		f 4 -1094 1408 1108 -1410
		mu 0 4 906 905 922 923
		f 4 -1095 1409 1109 -1411
		mu 0 4 907 906 923 924
		f 4 -1096 1410 1110 -1412
		mu 0 4 908 907 924 925
		f 4 -1097 1412 1111 -1398
		mu 0 4 910 909 926 927
		f 4 -1098 1413 1112 -1415
		mu 0 4 912 911 928 929
		f 4 -1099 1414 1113 -1416
		mu 0 4 913 912 929 930
		f 4 -1100 1415 1114 -1417
		mu 0 4 914 913 930 931
		f 4 -1101 1416 1115 -1418
		mu 0 4 915 914 931 932
		f 4 -1102 1417 1116 -1419
		mu 0 4 916 915 932 933
		f 4 -1103 1418 1117 -1420
		mu 0 4 917 916 933 934
		f 4 -1104 1419 1118 -1421
		mu 0 4 918 917 934 935
		f 4 -1105 1420 1119 -1422
		mu 0 4 919 918 935 936
		f 4 -1106 1421 1120 -1423
		mu 0 4 920 919 936 937
		f 4 -1107 1422 1121 -1424
		mu 0 4 921 920 937 938
		f 4 -1108 1423 1122 -1425
		mu 0 4 922 921 938 939
		f 4 -1109 1424 1123 -1426
		mu 0 4 923 922 939 940
		f 4 -1110 1425 1124 -1427
		mu 0 4 924 923 940 941
		f 4 -1111 1426 1125 -1428
		mu 0 4 925 924 941 942
		f 4 -1112 1428 1126 -1414
		mu 0 4 927 926 943 944
		f 4 -1113 1429 1127 -1431
		mu 0 4 929 928 945 946
		f 4 -1114 1430 1128 -1432
		mu 0 4 930 929 946 947
		f 4 -1115 1431 1129 -1433
		mu 0 4 931 930 947 948
		f 4 -1116 1432 1130 -1434
		mu 0 4 932 931 948 949
		f 4 -1117 1433 1131 -1435
		mu 0 4 933 932 949 950
		f 4 -1118 1434 1132 -1436
		mu 0 4 934 933 950 951
		f 4 -1119 1435 1133 -1437
		mu 0 4 935 934 951 952
		f 4 -1120 1436 1134 -1438
		mu 0 4 936 935 952 953
		f 4 -1121 1437 1135 -1439
		mu 0 4 937 936 953 954
		f 4 -1122 1438 1136 -1440
		mu 0 4 938 937 954 955
		f 4 -1123 1439 1137 -1441
		mu 0 4 939 938 955 956
		f 4 -1124 1440 1138 -1442
		mu 0 4 940 939 956 957
		f 4 -1125 1441 1139 -1443
		mu 0 4 941 940 957 958
		f 4 -1126 1442 1140 -1444
		mu 0 4 942 941 958 959
		f 4 -1127 1444 1141 -1430
		mu 0 4 944 943 960 961
		f 4 -1128 1445 1142 -1447
		mu 0 4 946 945 962 963
		f 4 -1129 1446 1143 -1448
		mu 0 4 947 946 963 964
		f 4 -1130 1447 1144 -1449
		mu 0 4 948 947 964 965
		f 4 -1131 1448 1145 -1450
		mu 0 4 949 948 965 966
		f 4 -1132 1449 1146 -1451
		mu 0 4 950 949 966 967
		f 4 -1133 1450 1147 -1452
		mu 0 4 951 950 967 968
		f 4 -1134 1451 1148 -1453
		mu 0 4 952 951 968 969
		f 4 -1135 1452 1149 -1454
		mu 0 4 953 952 969 970
		f 4 -1136 1453 1150 -1455
		mu 0 4 954 953 970 971
		f 4 -1137 1454 1151 -1456
		mu 0 4 955 954 971 972
		f 4 -1138 1455 1152 -1457
		mu 0 4 956 955 972 973
		f 4 -1139 1456 1153 -1458
		mu 0 4 957 956 973 974
		f 4 -1140 1457 1154 -1459
		mu 0 4 958 957 974 975
		f 4 -1141 1458 1155 -1460
		mu 0 4 959 958 975 976
		f 4 -1142 1460 1156 -1446
		mu 0 4 961 960 977 978
		f 4 -1143 1461 857 -1463
		mu 0 4 963 962 979 980
		f 4 -1144 1462 858 -1464
		mu 0 4 964 963 980 981
		f 4 -1145 1463 859 -1465
		mu 0 4 965 964 981 982
		f 4 -1146 1464 860 -1466
		mu 0 4 966 965 982 983
		f 4 -1147 1465 861 -1467
		mu 0 4 967 966 983 984
		f 4 -1148 1466 862 -1468
		mu 0 4 968 967 984 985
		f 4 -1149 1467 863 -1469
		mu 0 4 969 968 985 986
		f 4 -1150 1468 864 -1470
		mu 0 4 970 969 986 987
		f 4 -1151 1469 865 -1471
		mu 0 4 971 970 987 988
		f 4 -1152 1470 866 -1472
		mu 0 4 972 971 988 989
		f 4 -1153 1471 867 -1473
		mu 0 4 973 972 989 990
		f 4 -1154 1472 868 -1474
		mu 0 4 974 973 990 991
		f 4 -1155 1473 869 -1475
		mu 0 4 975 974 991 992
		f 4 -1156 1474 870 -1476
		mu 0 4 976 975 992 993
		f 4 -1157 1476 871 -1462
		mu 0 4 978 977 994 995
		f 4 -1237 1477 -1413 1478
		mu 0 4 996 997 998 999
		f 4 -1253 -1479 -1397 1479
		mu 0 4 1000 1001 1002 1003
		f 4 -1381 1480 -1269 -1480
		mu 0 4 1004 1005 1006 1007
		f 4 -1285 -1481 -1365 1481
		mu 0 4 1008 1009 1010 1011
		f 4 -1349 1482 -1301 -1482
		mu 0 4 1012 1013 1014 1015
		f 3 -1317 -1483 -1333
		mu 0 3 1016 1017 1018
		f 4 -1221 1483 -1429 -1478
		mu 0 4 1019 1020 1021 1022
		f 4 -1445 -1484 -1205 1484
		mu 0 4 1023 1024 1025 1026
		f 4 -1189 1485 -1461 -1485
		mu 0 4 1027 1028 1029 1030
		f 3 -1477 -1486 -1173
		mu 0 3 1031 1032 1033
		f 4 1251 1486 1379 1487
		mu 0 4 1034 1035 1036 1037
		f 4 1235 -1488 1395 1488
		mu 0 4 1038 1039 1040 1041
		f 4 1267 1489 1363 -1487
		mu 0 4 1042 1043 1044 1045
		f 4 1347 -1490 1283 1490
		mu 0 4 1046 1047 1048 1049
		f 4 1299 1315 1331 -1491
		mu 0 4 1050 1051 1052 1053
		f 4 1411 1491 1219 -1489
		mu 0 4 1054 1055 1056 1057
		f 4 1203 -1492 1427 1492
		mu 0 4 1058 1059 1060 1061
		f 4 1443 1493 1187 -1493
		mu 0 4 1062 1063 1064 1065
		f 4 1171 -1494 1459 1475
		mu 0 4 1066 1067 1068 1069;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode parentConstraint -n "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1" 
		-p "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp";
	rename -uid "EC13DA4D-4447-2534-9350-B78D4CA65725";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "IK_knee_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" -0.00032642846615167496 14.036346271858047 -90.000158341596844 ;
	setAttr ".rst" -type "double3" 3.9999968874998624 -0.00014042854309082031 -1.1146265853600541 ;
	setAttr ".rsrr" -type "double3" 180 -14.036423091218692 3.4036466322568074e-15 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint1" 
		-p "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp";
	rename -uid "EF5EFA72-469F-D0E8-B386-B493AAF8EDD8";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
createNode transform -n "LegFoot__instance_1:hook_grp" -p "LegFoot__instance_1:module_grp";
	rename -uid "1B788312-4DB7-99F9-B510-AAB6811A4489";
createNode joint -n "LegFoot__instance_1:hook_root_joint" -p "LegFoot__instance_1:hook_grp";
	rename -uid "F5A2242D-4F87-7CA8-F30D-D8BFA86FA75C";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 180 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 90 ;
createNode joint -n "LegFoot__instance_1:hook_target_joint" -p "LegFoot__instance_1:hook_root_joint";
	rename -uid "A3E959C1-4D6E-F665-11A1-F890151B1C2E";
	setAttr ".v" no;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -90 ;
createNode ikEffector -n "LegFoot__instance_1:hook_root_jointikEffector" -p "LegFoot__instance_1:hook_root_joint";
	rename -uid "2FCDB501-4F55-5B8E-85AF-BD853E5B770C";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode pointConstraint -n "LegFoot__instance_1:hook_root_joint_pointConstraint" 
		-p "LegFoot__instance_1:hook_root_joint";
	rename -uid "76FE9E59-48B1-CECC-68A7-0F9A714AC895";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
createNode transform -n "LegFoot__instance_1:unhookedTarget" -p "LegFoot__instance_1:hook_grp";
	rename -uid "7B4465F9-499B-5432-8428-3EBE27EF4823";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:unhookedTargetShape" -p "LegFoot__instance_1:unhookedTarget";
	rename -uid "619A42EA-45D5-8745-21F5-A2805A5B5613";
	setAttr -k off ".v";
createNode pointConstraint -n "unhookedTarget_pointConstraint1" -p "LegFoot__instance_1:unhookedTarget";
	rename -uid "3A7C8FB5-4427-2BD0-C9C3-DF9298A9EA74";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 0 0.001 0 ;
	setAttr ".rst" -type "double3" 0 0.001 0 ;
	setAttr -k on ".w0";
createNode ikHandle -n "LegFoot__instance_1:hook_root_joint_ikHandle" -p "LegFoot__instance_1:hook_grp";
	rename -uid "4433F2FD-4B7B-05BB-67E3-7A9D68F917BA";
	setAttr ".v" no;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "hook_root_joint_ikHandle_poleVectorConstraint1" 
		-p "LegFoot__instance_1:hook_root_joint_ikHandle";
	rename -uid "8148BFA2-43CD-0715-D977-0CAFA201F8AF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hook_root_joint_ikHandle_poleVectorLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 1 0 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint" 
		-p "LegFoot__instance_1:hook_root_joint_ikHandle";
	rename -uid "F7CD7BC6-40B5-8116-907D-FE9B6F303A8E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hook_target_joint_endPosLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 0.001 0 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:hook_root_joint_rootPosLocator" -p "LegFoot__instance_1:hook_grp";
	rename -uid "B327B416-4C0D-8438-C3EB-CB9C3383C1B6";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:hook_root_joint_rootPosLocatorShape" -p
		 "LegFoot__instance_1:hook_root_joint_rootPosLocator";
	rename -uid "75FE6CC6-4F61-5EB9-840A-BCBDF35BD226";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint" 
		-p "LegFoot__instance_1:hook_root_joint_rootPosLocator";
	rename -uid "A712F156-4E0E-3EF7-7B89-99870C478FA7";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hook_root_jointW0" -dv 1 -min 0 -at "double";
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
createNode transform -n "LegFoot__instance_1:hook_target_joint_endPosLocator" -p "LegFoot__instance_1:hook_grp";
	rename -uid "BB9FF9B2-44B8-3E50-7842-48AB1032A182";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:hook_target_joint_endPosLocatorShape" 
		-p "LegFoot__instance_1:hook_target_joint_endPosLocator";
	rename -uid "B729D250-48BF-898E-4FBC-43B4AD69CDE9";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1:hook_pointConstraint" -p "LegFoot__instance_1:hook_target_joint_endPosLocator";
	rename -uid "43F8FC8A-48FB-B175-2522-5787FAD4B819";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "unhookedTargetW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 0.001 0 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:hook_root_joint_ikHandle_poleVectorLocator" 
		-p "LegFoot__instance_1:hook_grp";
	rename -uid "761E471F-4A5D-15B4-02D5-349B20629D2B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1 0 ;
createNode locator -n "LegFoot__instance_1:hook_root_joint_ikHandle_poleVectorLocatorShape" 
		-p "LegFoot__instance_1:hook_root_joint_ikHandle_poleVectorLocator";
	rename -uid "3F22F20A-4262-8140-0C84-3088982CB988";
	setAttr -k off ".v";
createNode transform -n "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp" 
		-p "LegFoot__instance_1:hook_grp";
	rename -uid "CB25BF8D-46CE-2E2D-2704-7396F03EC1E0";
createNode transform -n "LegFoot__instance_1:hook_root_joint_hook_representation" 
		-p "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp";
	rename -uid "BD592D38-4959-46EE-086F-4893788205F0";
createNode nurbsSurface -n "LegFoot__instance_1:hook_root_joint_hook_representationShape" 
		-p "LegFoot__instance_1:hook_root_joint_hook_representation";
	rename -uid "0F71F42E-4EBE-2463-4C93-CCA5AE7C2672";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		6 0 0 0 10 10 10
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		44
		0 -0.15672232497824501 -0.15672232497824506
		0 -0.22163883751087782 -3.5945998741709007e-17
		0 -0.15672232497824509 0.15672232497824481
		0 -2.862699950697759e-16 0.22163883751087754
		0 0.15672232497824459 0.15672232497824484
		0 0.22163883751087743 5.5517673144427339e-18
		0 0.15672232497824468 -0.15672232497824484
		0 -1.030019529394196e-16 -0.22163883751087765
		0 -0.15672232497824501 -0.15672232497824506
		0 -0.22163883751087782 -3.5945998741709007e-17
		0 -0.15672232497824509 0.15672232497824481
		0.33333333333333337 -0.15672232497824487 -0.15672232497824504
		0.33333333333333337 -0.22163883751087768 4.8755612298694312e-18
		0.33333333333333337 -0.15672232497824495 0.15672232497824484
		0.33333333333333331 -1.3824025845308839e-16 0.22163883751087757
		0.33333333333333326 0.15672232497824473 0.15672232497824487
		0.33333333333333326 0.22163883751087757 4.6373327286021172e-17
		0.33333333333333326 0.15672232497824481 -0.15672232497824481
		0.33333333333333331 4.502778367726793e-17 -0.22163883751087762
		0.33333333333333337 -0.15672232497824487 -0.15672232497824504
		0.33333333333333337 -0.22163883751087768 4.8755612298694312e-18
		0.33333333333333337 -0.15672232497824495 0.15672232497824484
		0.66666666666666674 -0.1567223249782447 -0.15672232497824498
		0.66666666666666674 -0.22163883751087751 4.5697121201447876e-17
		0.66666666666666674 -0.15672232497824479 0.1567223249782449
		0.66666666666666674 9.7894781635991762e-18 0.22163883751087762
		0.66666666666666663 0.1567223249782449 0.15672232497824493
		0.66666666666666663 0.22163883751087773 8.719488725759961e-17
		0.66666666666666663 0.15672232497824498 -0.15672232497824476
		0.66666666666666674 1.9305752029395549e-16 -0.22163883751087757
		0.66666666666666674 -0.1567223249782447 -0.15672232497824498
		0.66666666666666674 -0.22163883751087751 4.5697121201447876e-17
		0.66666666666666674 -0.15672232497824479 0.1567223249782449
		1 -0.15672232497824456 -0.15672232497824495
		1 -0.22163883751087737 8.651868117302632e-17
		1 -0.15672232497824465 0.15672232497824493
		1 1.5781921478028672e-16 0.22163883751087765
		1 0.15672232497824504 0.15672232497824495
		1 0.22163883751087787 1.2801644722917804e-16
		1 0.15672232497824512 -0.15672232497824473
		1 3.4108725691064299e-16 -0.22163883751087754
		1 -0.15672232497824456 -0.15672232497824495
		1 -0.22163883751087737 8.651868117302632e-17
		1 -0.15672232497824465 0.15672232497824493
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode parentConstraint -n "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1" 
		-p "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp";
	rename -uid "E614F5AB-45E5-4388-6D76-ECAEAE2E9327";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hook_root_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 180 0 90 ;
	setAttr ".rsrr" -type "double3" 0 0 90 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint1" 
		-p "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp";
	rename -uid "18560CAD-444C-516B-E0DE-47B39A54A045";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "module_transformW0" -dv 1 -min 0 
		-at "double";
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
createNode transform -n "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp" 
		-p "LegFoot__instance_1:module_grp";
	rename -uid "B1B78F40-4147-3049-D886-F8B818275CAB";
createNode transform -n "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator" 
		-p "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "A11C4663-4224-BE13-F2B4-3E9C7692EB96";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 -0.5 0 ;
createNode locator -n "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocatorShape" 
		-p "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator";
	rename -uid "DE2A484F-433B-0A42-C054-7EBCBA2DB2BB";
	setAttr -k off ".v";
createNode parentConstraint -n "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1" 
		-p "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "23E6BABD-4846-8FEB-5194-65A773ED2457";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
createNode transform -n "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp" 
		-p "LegFoot__instance_1:module_grp";
	rename -uid "6B845CBE-4D0A-663D-C606-78A3DF1442C5";
createNode transform -n "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator" 
		-p "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "C2D66EA2-406E-777F-8D9A-DAB3516A4FF0";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 -0.5 0 ;
createNode locator -n "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocatorShape" 
		-p "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator";
	rename -uid "55156C72-4B39-FAF9-9CD2-929CA99C5C5D";
	setAttr -k off ".v";
createNode parentConstraint -n "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1" 
		-p "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "DFC85575-4DAF-47C9-2F16-6C93E004FE3F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 4 0 -1.0000000000000002 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp" 
		-p "LegFoot__instance_1:module_grp";
	rename -uid "35959802-4359-B083-AF65-68BC11E3A109";
createNode transform -n "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator" 
		-p "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "4B39CCDF-40C4-EE16-B66C-78A3A4D30B65";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 -0.5 0 ;
createNode locator -n "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocatorShape" 
		-p "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator";
	rename -uid "E5563AB1-4D34-CCDA-E76A-AA89C5BAC686";
	setAttr -k off ".v";
createNode parentConstraint -n "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1" 
		-p "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "E9BA7CFC-4585-5CD0-802A-23976380E3D9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 8 0 -2.2204460492503131e-16 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp" 
		-p "LegFoot__instance_1:module_grp";
	rename -uid "6607F4D4-4608-3356-BD91-2BB61B203043";
createNode transform -n "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator" 
		-p "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "6F64DD4D-4A90-9810-AAB9-D5BFDFF2DFC0";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 -0.5 0 ;
createNode locator -n "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocatorShape" 
		-p "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator";
	rename -uid "84560312-4B9F-27B2-5C8E-5CB0CEF6DF12";
	setAttr -k off ".v";
createNode parentConstraint -n "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1" 
		-p "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "DA1C8B4F-477E-54DC-1967-25B001B8CA51";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ball_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 -9.0000000000000018 2.9999999999999991 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:IK_hip_joint_positionLocator" -p "LegFoot__instance_1:module_grp";
	rename -uid "F3D3B420-407D-FAD1-088A-AB8AC1C74E53";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:IK_hip_joint_positionLocatorShape" -p "LegFoot__instance_1:IK_hip_joint_positionLocator";
	rename -uid "4DD37007-4DC8-68B6-1690-909F06886A77";
	setAttr -k off ".v";
createNode joint -n "LegFoot__instance_1:IK_hip_joint" -p "LegFoot__instance_1:IK_hip_joint_positionLocator";
	rename -uid "FD3D31C3-4B98-C2C2-7870-C3B72A57C887";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 14.450074065641065 -13.609060182559508 -93.469845250244262 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 14.036243467926484 0 ;
	setAttr ".pa" -type "double3" 0 -50 0 ;
createNode joint -n "LegFoot__instance_1:IK_knee_joint" -p "LegFoot__instance_1:IK_hip_joint";
	rename -uid "2F304A3C-473A-0D3F-D334-F58DF27CE6AF";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.2053368091583252 0 3.3306690738754696e-16 ;
	setAttr ".r" -type "double3" 0 56.145179480006725 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -28.072486935852961 0 ;
	setAttr ".pa" -type "double3" 0 50 0 ;
createNode joint -n "LegFoot__instance_1:IK_ankle_joint" -p "LegFoot__instance_1:IK_knee_joint";
	rename -uid "50F6BC04-41BF-9A04-EA01-5995D8A619AA";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.2053368091583252 0 3.3306690738754696e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 153.4273414719969 -23.00936329637852 -128.00775720672615 ;
createNode joint -n "LegFoot__instance_1:IK_ball_joint" -p "LegFoot__instance_1:IK_ankle_joint";
	rename -uid "4B838962-497C-F8D7-3975-4D8B84F98D40";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 12.409673645990857 -1.3322676295501878e-15 -8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -7.2465789628297293e-14 69.443954780416533 46.488872223121135 ;
createNode joint -n "LegFoot__instance_1:IK_toe_joint" -p "LegFoot__instance_1:IK_ball_joint";
	rename -uid "E1A7708D-40EC-2327-D9CD-47B8C7C99438";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.0000000000000009 2.7755575615628914e-15 -1.6653345369377669e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 89.999999999999957 0 ;
createNode ikEffector -n "LegFoot__instance_1:IK_hip_joint_ikEffector" -p "LegFoot__instance_1:IK_knee_joint";
	rename -uid "F208C669-4276-8499-32D2-46931B722350";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode pointConstraint -n "IK_hip_joint_positionLocator_pointConstraint1" -p "LegFoot__instance_1:IK_hip_joint_positionLocator";
	rename -uid "FD616C44-4739-EA0D-0FF7-04968792728C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
createNode transform -n "LegFoot__instance_1:IK_knee_joint_positionLocator" -p "LegFoot__instance_1:module_grp";
	rename -uid "CCC0D280-4907-004A-FF89-F080E247E87A";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:IK_knee_joint_positionLocatorShape" -p
		 "LegFoot__instance_1:IK_knee_joint_positionLocator";
	rename -uid "5DAD7230-4788-1875-5320-6BAA1749AAEC";
	setAttr -k off ".v";
createNode pointConstraint -n "IK_knee_joint_positionLocator_pointConstraint1" -p
		 "LegFoot__instance_1:IK_knee_joint_positionLocator";
	rename -uid "B6100A63-466B-7E2A-BDB0-24BE2564F35A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 4 0 -1.0000000000000002 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocator" 
		-p "LegFoot__instance_1:module_grp";
	rename -uid "86B51F54-4018-B63D-B749-29AC4E98C79E";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocatorShape" 
		-p "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocator";
	rename -uid "0C646862-4B32-D687-38E2-E6A530F1CC51";
	setAttr -k off ".v";
createNode ikHandle -n "LegFoot__instance_1:IK_hip_joint_ikHandle" -p "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocator";
	rename -uid "275E432C-4C2A-B1B2-0D93-2C880AA31963";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -3.2315781481884187e-06 0 1.7763568394002505e-15 ;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "IK_hip_joint_ikHandle_poleVectorConstraint1" 
		-p "LegFoot__instance_1:IK_hip_joint_ikHandle";
	rename -uid "400AB5E6-4E4F-8E12-1166-B0ADA0A5FDE9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "IK_knee_joint_positionLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 4 0 -1.0000000000000002 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "IK_hip_joint_ikHandle_positionLocator_pointConstraint1" 
		-p "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocator";
	rename -uid "BD848C6E-42BD-8A89-10AE-C386E87884E4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 8 0 -2.2204460492503131e-16 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:module_grp";
	rename -uid "C98E4685-4DAF-2BFA-02C2-698F0B14D179";
	addAttr -ci true -k true -sn "mirrorInfo" -ln "mirrorInfo" -min 0 -max 3 -en "none:x:y:z" 
		-at "enum";
	addAttr -ci true -sn "mirrorLinks" -ln "mirrorLinks" -dt "string";
	setAttr -k on ".mirrorInfo" 1;
	setAttr ".mirrorLinks" -type "string" "LegFoot__instance_1__X";
createNode transform -n "LegFoot__instance_1_mirror:joints_grp" -p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "F3E61201-4DF8-7C8B-E5A2-7E8A689C5EB7";
createNode joint -n "LegFoot__instance_1_mirror:hip_joint" -p "LegFoot__instance_1_mirror:joints_grp";
	rename -uid "E93BC9D9-43A4-0F81-C369-F48766E2865F";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 90.000000000000057 -104.03624346792641 -75.963756532073504 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 -14.036243467926482 0 ;
createNode joint -n "LegFoot__instance_1_mirror:knee_joint" -p "LegFoot__instance_1_mirror:hip_joint";
	rename -uid "D1D35307-49DD-836C-6F41-63B446725B4B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.2053368091583252 -2.4651903288156619e-32 -2.2204460492503131e-16 ;
	setAttr ".r" -type "double3" -180 -6.3329452253172479e-14 2.259022879976033e-14 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -9.3556123980464918e-16 -28.072486935852947 3.7422449592185975e-15 ;
createNode joint -n "LegFoot__instance_1_mirror:ankle_joint" -p "LegFoot__instance_1_mirror:knee_joint";
	rename -uid "4BBD1074-4431-67D8-D084-A19B07D4E2E3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.2053366899490356 -2.376163815039583e-16 -6.6613381477509392e-16 ;
	setAttr ".r" -type "double3" 89.999999999999872 59.806417898519932 46.488872223121078 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 153.42734147199693 -23.00936329637851 -128.00775720672615 ;
createNode joint -n "LegFoot__instance_1_mirror:ball_joint" -p "LegFoot__instance_1_mirror:ankle_joint";
	rename -uid "4485E7D2-41E4-72E7-E793-018458A07DE5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.92445111274719238 -2.6645352591003757e-15 4.4408920985006262e-16 ;
	setAttr ".r" -type "double3" 141.43256080857378 -55.722094138537599 -56.620290040643546 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 69.443954780416519 46.488872223121142 ;
createNode joint -n "LegFoot__instance_1_mirror:toe_joint" -p "LegFoot__instance_1_mirror:ball_joint";
	rename -uid "84BD563D-4D64-913D-C121-5FBBB6082E90";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.87701129913330078 -1.7763568394002505e-15 3.7747583763379879e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.7834538482102502e-15 89.999999999999986 0 ;
createNode ikEffector -n "LegFoot__instance_1_mirror:ball_jointikEffector" -p "LegFoot__instance_1_mirror:ball_joint";
	rename -uid "6A291018-4ED2-1F74-F55E-DBAD0F8D3C24";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "LegFoot__instance_1_mirror:ankle_jointikEffector" -p "LegFoot__instance_1_mirror:ankle_joint";
	rename -uid "8DA8F4D4-4C74-612E-2E6D-D4822FDD281A";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "LegFoot__instance_1_mirror:knee_jointikEffector" -p "LegFoot__instance_1_mirror:knee_joint";
	rename -uid "D0F73CE9-4FAE-0943-18CF-778422CD3AD7";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode pointConstraint -n "LegFoot__instance_1_mirror:hip_joint_pointConstraint" 
		-p "LegFoot__instance_1_mirror:hip_joint";
	rename -uid "45220A93-4E12-4F2E-A967-53842FD34A06";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
createNode ikEffector -n "LegFoot__instance_1_mirror:hip_jointikEffector" -p "LegFoot__instance_1_mirror:hip_joint";
	rename -uid "3860973B-4E1C-BA09-F8B2-B38AD7093FE2";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikHandle -n "LegFoot__instance_1_mirror:hip_joint_ikHandle" -p "LegFoot__instance_1_mirror:joints_grp";
	rename -uid "49A305B4-4213-82F0-26B8-30BB63399F86";
	setAttr ".v" no;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "hip_joint_ikHandle_poleVectorConstraint2" -p "LegFoot__instance_1_mirror:hip_joint_ikHandle";
	rename -uid "FDCFBA3A-4283-4D25-733A-BDA2C82D3F16";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_joint_translation_control_poleVectorLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 0.5 -6.123233995736766e-17 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint" 
		-p "LegFoot__instance_1_mirror:hip_joint_ikHandle";
	rename -uid "74BCFB89-4511-7B4E-E6DB-59AE1B4C59AF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_joint_endPosLocatorW0" -dv 1 
		-min 0 -at "double";
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
	setAttr ".rst" -type "double3" -4 -1.5246018321978835e-32 -1 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:hip_joint_rootPosLocator" -p "LegFoot__instance_1_mirror:joints_grp";
	rename -uid "19D1158B-417F-96E8-5C4E-8297E239891B";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:hip_joint_rootPosLocatorShape" 
		-p "LegFoot__instance_1_mirror:hip_joint_rootPosLocator";
	rename -uid "9FD1C3B0-47C2-BC07-E082-7986BC879C8C";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint" 
		-p "LegFoot__instance_1_mirror:hip_joint_rootPosLocator";
	rename -uid "08B47331-4507-3C51-3F6F-A5B17D5EF0FD";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_jointW0" -dv 1 -min 0 -at "double";
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
createNode transform -n "LegFoot__instance_1_mirror:knee_joint_endPosLocator" -p "LegFoot__instance_1_mirror:joints_grp";
	rename -uid "7A2C3D63-4436-EB91-2B8E-F4A537F43A08";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:knee_joint_endPosLocatorShape" 
		-p "LegFoot__instance_1_mirror:knee_joint_endPosLocator";
	rename -uid "93A6A5B0-410C-499E-386D-8A92FC568E3A";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint" 
		-p "LegFoot__instance_1_mirror:knee_joint_endPosLocator";
	rename -uid "029A8D0B-4F83-ECF9-15AB-F2AA35E8C582";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -4 2.4651903288156619e-32 -1 ;
	setAttr -k on ".w0";
createNode ikHandle -n "LegFoot__instance_1_mirror:knee_joint_ikHandle" -p "LegFoot__instance_1_mirror:joints_grp";
	rename -uid "3C866553-4008-9E4A-7F83-EC8B4EFC1C24";
	setAttr ".v" no;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "knee_joint_ikHandle_poleVectorConstraint2" -p
		 "LegFoot__instance_1_mirror:knee_joint_ikHandle";
	rename -uid "F43DDF32-4EB7-2BAD-81B9-2EBA40C65758";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_joint_translation_control_poleVectorLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -9.6671985527763127e-08 0.49999999999999978 -2.4167996048873874e-08 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint" 
		-p "LegFoot__instance_1_mirror:knee_joint_ikHandle";
	rename -uid "F16AE496-44EC-9D4E-714F-A39F94C40AAF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_joint_endPosLocatorW0" -dv 
		1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -7.5294116680338963 1.940285000290664 -1.8823529170084752 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:knee_joint_rootPosLocator" -p
		 "LegFoot__instance_1_mirror:joints_grp";
	rename -uid "421D07B9-49AA-74F9-ED93-BA909301333E";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:knee_joint_rootPosLocatorShape" 
		-p "LegFoot__instance_1_mirror:knee_joint_rootPosLocator";
	rename -uid "8B0CF3AE-4188-08D5-FDA7-6CA3F30D3EED";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint" 
		-p "LegFoot__instance_1_mirror:knee_joint_rootPosLocator";
	rename -uid "76B25448-49C9-35AC-2B2C-368BDE809CF6";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -3.9999999033280145 2.2204460492503131e-16 -0.99999997583200395 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:ankle_joint_endPosLocator" -p
		 "LegFoot__instance_1_mirror:joints_grp";
	rename -uid "3D26F626-4B0A-55DB-1331-91AAFA8A7899";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:ankle_joint_endPosLocatorShape" 
		-p "LegFoot__instance_1_mirror:ankle_joint_endPosLocator";
	rename -uid "ED081650-4154-DB51-3B64-1A9555B6E904";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint" 
		-p "LegFoot__instance_1_mirror:ankle_joint_endPosLocator";
	rename -uid "FB2BE989-4638-3451-C396-DBAE63DE3CE3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -8 6.0684932812713713e-32 -2.2204460492503131e-16 ;
	setAttr -k on ".w0";
createNode ikHandle -n "LegFoot__instance_1_mirror:ankle_joint_ikHandle" -p "LegFoot__instance_1_mirror:joints_grp";
	rename -uid "5B23849B-44E9-C8B7-0914-4FB478E86B54";
	setAttr ".v" no;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ankle_joint_ikHandle_poleVectorConstraint2" -p
		 "LegFoot__instance_1_mirror:ankle_joint_ikHandle";
	rename -uid "3F2DD4CB-4EA3-1DDF-983A-848016748BB5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_joint_translation_control_poleVectorLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -1.8197079665327465e-07 0.49999999999999989 4.5492697103684875e-08 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint" 
		-p "LegFoot__instance_1_mirror:ankle_joint_ikHandle";
	rename -uid "8E0BB900-4245-841C-EC20-629BEB036FAB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ball_joint_endPosLocatorW0" -dv 1 
		-min 0 -at "double";
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
	setAttr ".rst" -type "double3" 1.0063500288253939 4.8507133447970316 7.0253997639608672 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator" -p
		 "LegFoot__instance_1_mirror:joints_grp";
	rename -uid "1A12535A-4EB3-11B9-3BD5-FD83F2622561";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:ankle_joint_rootPosLocatorShape" 
		-p "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator";
	rename -uid "5CC9929D-40D3-3B38-A4E4-D78F9DEC1DA1";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint" 
		-p "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator";
	rename -uid "1210DAF9-4B46-BE38-7577-72B3DB180461";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -7.9999998180292033 8.4270625105581905e-17 -4.5492697386961822e-08 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:ball_joint_endPosLocator" -p "LegFoot__instance_1_mirror:joints_grp";
	rename -uid "D75744F8-491B-A531-7B99-7095C063E3FE";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:ball_joint_endPosLocatorShape" 
		-p "LegFoot__instance_1_mirror:ball_joint_endPosLocator";
	rename -uid "46D8B41C-4C31-E871-FD7C-2891A2BA4EE1";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint" 
		-p "LegFoot__instance_1_mirror:ball_joint_endPosLocator";
	rename -uid "771F4D97-4418-0764-5D8E-6293F5EEE5C2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ball_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 1.9984014443252818e-15 -9 3 ;
	setAttr -k on ".w0";
createNode ikHandle -n "LegFoot__instance_1_mirror:ball_joint_ikHandle" -p "LegFoot__instance_1_mirror:joints_grp";
	rename -uid "7268D7FD-4CE6-ADEA-5537-58B63D83D972";
	setAttr ".v" no;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "ball_joint_ikHandle_poleVectorConstraint2" -p
		 "LegFoot__instance_1_mirror:ball_joint_ikHandle";
	rename -uid "000291CD-4170-950E-EAEA-978F51D9271B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ball_joint_translation_control_poleVectorLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -9.7418399347404261e-08 0.5000001095957014 -3.6531901059788652e-08 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint" 
		-p "LegFoot__instance_1_mirror:ball_joint_ikHandle";
	rename -uid "3DCF7247-41DD-E1E5-B21F-D883850C4451";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "toe_joint_endPosLocatorW0" -dv 1 
		-min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0.93506572965868351 -10.051947562789579 0.35064939550266994 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:ball_joint_rootPosLocator" -p
		 "LegFoot__instance_1_mirror:joints_grp";
	rename -uid "4B2832C0-48A4-2AEC-EF47-378313B01F7B";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:ball_joint_rootPosLocatorShape" 
		-p "LegFoot__instance_1_mirror:ball_joint_rootPosLocator";
	rename -uid "2597E0B7-4888-1885-80EC-009770DEFCDA";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint" 
		-p "LegFoot__instance_1_mirror:ball_joint_rootPosLocator";
	rename -uid "CC2232C0-4057-4E31-21ED-0A9DE2B0422F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ball_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 9.7418401345805705e-08 -9.0000001095957014 3.0000000365319011 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:toe_joint_endPosLocator" -p "LegFoot__instance_1_mirror:joints_grp";
	rename -uid "5D9736AD-4B8A-8030-796A-3ABEC181C90D";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:toe_joint_endPosLocatorShape" -p
		 "LegFoot__instance_1_mirror:toe_joint_endPosLocator";
	rename -uid "6A3DE63F-42B5-DF08-000D-8F8D2456B82C";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint" 
		-p "LegFoot__instance_1_mirror:toe_joint_endPosLocator";
	rename -uid "589B59D0-4892-A288-2A4C-30B9D5356E9F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "toe_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -2.2204460492503131e-16 -9.0000000000000018 6 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:hierarchyRepresentations_grp" 
		-p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "87B79B21-415D-E2BA-5E5D-FBAB4E389626";
createNode transform -n "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp" 
		-p "LegFoot__instance_1_mirror:hierarchyRepresentations_grp";
	rename -uid "4F2B3028-4E4B-D8EB-8D67-DD95A56FB47F";
createNode transform -n "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation" 
		-p "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp";
	rename -uid "E2013CDB-4F0B-46F1-4364-63A74FA51DC9";
createNode nurbsSurface -n "LegFoot__instance_1_mirror:hip_joint_hierarchy_representationShape" 
		-p "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation";
	rename -uid "3858C6BA-4CA5-55D9-33FC-1FB1791917E8";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		6 0 0 0 10 10 10
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		44
		0 -0.15672232497824501 -0.15672232497824506
		0 -0.22163883751087782 -3.5945998741709007e-17
		0 -0.15672232497824509 0.15672232497824481
		0 -2.862699950697759e-16 0.22163883751087754
		0 0.15672232497824459 0.15672232497824484
		0 0.22163883751087743 5.5517673144427339e-18
		0 0.15672232497824468 -0.15672232497824484
		0 -1.030019529394196e-16 -0.22163883751087765
		0 -0.15672232497824501 -0.15672232497824506
		0 -0.22163883751087782 -3.5945998741709007e-17
		0 -0.15672232497824509 0.15672232497824481
		0.33333333333333337 -0.15672232497824487 -0.15672232497824504
		0.33333333333333337 -0.22163883751087768 4.8755612298694312e-18
		0.33333333333333337 -0.15672232497824495 0.15672232497824484
		0.33333333333333331 -1.3824025845308839e-16 0.22163883751087757
		0.33333333333333326 0.15672232497824473 0.15672232497824487
		0.33333333333333326 0.22163883751087757 4.6373327286021172e-17
		0.33333333333333326 0.15672232497824481 -0.15672232497824481
		0.33333333333333331 4.502778367726793e-17 -0.22163883751087762
		0.33333333333333337 -0.15672232497824487 -0.15672232497824504
		0.33333333333333337 -0.22163883751087768 4.8755612298694312e-18
		0.33333333333333337 -0.15672232497824495 0.15672232497824484
		0.66666666666666674 -0.1567223249782447 -0.15672232497824498
		0.66666666666666674 -0.22163883751087751 4.5697121201447876e-17
		0.66666666666666674 -0.15672232497824479 0.1567223249782449
		0.66666666666666674 9.7894781635991762e-18 0.22163883751087762
		0.66666666666666663 0.1567223249782449 0.15672232497824493
		0.66666666666666663 0.22163883751087773 8.719488725759961e-17
		0.66666666666666663 0.15672232497824498 -0.15672232497824476
		0.66666666666666674 1.9305752029395549e-16 -0.22163883751087757
		0.66666666666666674 -0.1567223249782447 -0.15672232497824498
		0.66666666666666674 -0.22163883751087751 4.5697121201447876e-17
		0.66666666666666674 -0.15672232497824479 0.1567223249782449
		1 -0.15672232497824456 -0.15672232497824495
		1 -0.22163883751087737 8.651868117302632e-17
		1 -0.15672232497824465 0.15672232497824493
		1 1.5781921478028672e-16 0.22163883751087765
		1 0.15672232497824504 0.15672232497824495
		1 0.22163883751087787 1.2801644722917804e-16
		1 0.15672232497824512 -0.15672232497824473
		1 3.4108725691064299e-16 -0.22163883751087754
		1 -0.15672232497824456 -0.15672232497824495
		1 -0.22163883751087737 8.651868117302632e-17
		1 -0.15672232497824465 0.15672232497824493
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "LegFoot__instance_1_mirror:hip_joint_hierarchy_arrow_representation" 
		-p "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation";
	rename -uid "0BEEB657-4F4F-46D4-1BA9-3AA57B0CFD1D";
	setAttr ".r" -type "double3" 0 0 -90 ;
	setAttr ".s" -type "double3" 0.46739519169468152 0.46739519169468152 0.46739519169468152 ;
	setAttr ".rp" -type "double3" 1.1102230246251565e-16 0.5 0 ;
	setAttr ".rpt" -type "double3" 0.49999999999999989 -0.5 0 ;
	setAttr ".sp" -type "double3" 2.3753411339122038e-16 1.0697585445564812 0 ;
	setAttr ".spt" -type "double3" -1.2651181092870475e-16 -0.56975854455648134 0 ;
createNode mesh -n "LegFoot__instance_1_mirror:hip_joint_hierarchy_arrow_representationShape" 
		-p "LegFoot__instance_1_mirror:hip_joint_hierarchy_arrow_representation";
	rename -uid "CFD625B2-4B39-2198-A472-288DABE865A3";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 18 ".uvst[0].uvsp[0:17]" -type "float2" 0.67677665 0.073223323
		 0.5 2.9802322e-08 0.32322332 0.073223323 0.25000003 0.25 0.32322332 0.42677668 0.5
		 0.5 0.67677671 0.42677671 0.75 0.25 0.25 0.5 0.3125 0.5 0.375 0.5 0.4375 0.5 0.5
		 0.5 0.5625 0.5 0.625 0.5 0.6875 0.5 0.75 0.5 0.5 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 9 ".pt[0:8]" -type "float3"  0.33249366 1.0697585 -0.33249369 
		-2.8027111e-08 1.0697585 -0.4702169 -0.33249369 1.0697585 -0.33249369 -0.4702169 
		1.0697585 -1.4013556e-08 -0.33249369 1.0697585 0.33249366 -2.8027111e-08 1.0697585 
		0.4702169 0.33249369 1.0697585 0.33249369 0.4702169 1.0697585 -1.4013556e-08 2.3753411e-16 
		1.0697585 0;
	setAttr -s 9 ".vt[0:8]"  0.70710671 -0.25 -0.70710671 0 -0.25 -0.99999988
		 -0.70710671 -0.25 -0.70710671 -0.99999988 -0.25 0 -0.70710671 -0.25 0.70710671 0 -0.25 0.99999994
		 0.70710677 -0.25 0.70710677 1 -0.25 0 0 0.25 0;
	setAttr -s 16 ".ed[0:15]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 0 0 0 8 0 1 8 0 2 8 0 3 8 0 4 8 0 5 8 0 6 8 0 7 8 0;
	setAttr -s 9 -ch 32 ".fc[0:8]" -type "polyFaces" 
		f 8 -8 -7 -6 -5 -4 -3 -2 -1
		mu 0 8 0 7 6 5 4 3 2 1
		f 3 0 9 -9
		mu 0 3 8 9 17
		f 3 1 10 -10
		mu 0 3 9 10 17
		f 3 2 11 -11
		mu 0 3 10 11 17
		f 3 3 12 -12
		mu 0 3 11 12 17
		f 3 4 13 -13
		mu 0 3 12 13 17
		f 3 5 14 -14
		mu 0 3 13 14 17
		f 3 6 15 -15
		mu 0 3 14 15 17
		f 3 7 8 -16
		mu 0 3 15 16 17;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode parentConstraint -n "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2" 
		-p "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp";
	rename -uid "943DDB0B-4B29-D191-7591-6EA69EF70F00";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" -2.8686356343152407e-14 14.036243467926491 90 ;
	setAttr ".rsrr" -type "double3" 90 -14.036243467926482 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2" 
		-p "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp";
	rename -uid "0512D13C-4DA7-80C7-D23A-829D4A048FDE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "module_transformW0" -dv 1 -min 0 
		-at "double";
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
createNode transform -n "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp" 
		-p "LegFoot__instance_1_mirror:hierarchyRepresentations_grp";
	rename -uid "8C63C9E3-40E5-C000-14BA-809537A93CAF";
createNode transform -n "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation" 
		-p "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp";
	rename -uid "F46E9FE1-4C87-B147-BD60-12B62F374866";
createNode nurbsSurface -n "LegFoot__instance_1_mirror:knee_joint_hierarchy_representationShape" 
		-p "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation";
	rename -uid "0ECA16FF-4D8F-A2AA-6063-E2B4A49A1CFE";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		6 0 0 0 10 10 10
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		44
		0 -0.15672232497824501 -0.15672232497824506
		0 -0.22163883751087782 -3.5945998741709007e-17
		0 -0.15672232497824509 0.15672232497824481
		0 -2.862699950697759e-16 0.22163883751087754
		0 0.15672232497824459 0.15672232497824484
		0 0.22163883751087743 5.5517673144427339e-18
		0 0.15672232497824468 -0.15672232497824484
		0 -1.030019529394196e-16 -0.22163883751087765
		0 -0.15672232497824501 -0.15672232497824506
		0 -0.22163883751087782 -3.5945998741709007e-17
		0 -0.15672232497824509 0.15672232497824481
		0.33333333333333337 -0.15672232497824487 -0.15672232497824504
		0.33333333333333337 -0.22163883751087768 4.8755612298694312e-18
		0.33333333333333337 -0.15672232497824495 0.15672232497824484
		0.33333333333333331 -1.3824025845308839e-16 0.22163883751087757
		0.33333333333333326 0.15672232497824473 0.15672232497824487
		0.33333333333333326 0.22163883751087757 4.6373327286021172e-17
		0.33333333333333326 0.15672232497824481 -0.15672232497824481
		0.33333333333333331 4.502778367726793e-17 -0.22163883751087762
		0.33333333333333337 -0.15672232497824487 -0.15672232497824504
		0.33333333333333337 -0.22163883751087768 4.8755612298694312e-18
		0.33333333333333337 -0.15672232497824495 0.15672232497824484
		0.66666666666666674 -0.1567223249782447 -0.15672232497824498
		0.66666666666666674 -0.22163883751087751 4.5697121201447876e-17
		0.66666666666666674 -0.15672232497824479 0.1567223249782449
		0.66666666666666674 9.7894781635991762e-18 0.22163883751087762
		0.66666666666666663 0.1567223249782449 0.15672232497824493
		0.66666666666666663 0.22163883751087773 8.719488725759961e-17
		0.66666666666666663 0.15672232497824498 -0.15672232497824476
		0.66666666666666674 1.9305752029395549e-16 -0.22163883751087757
		0.66666666666666674 -0.1567223249782447 -0.15672232497824498
		0.66666666666666674 -0.22163883751087751 4.5697121201447876e-17
		0.66666666666666674 -0.15672232497824479 0.1567223249782449
		1 -0.15672232497824456 -0.15672232497824495
		1 -0.22163883751087737 8.651868117302632e-17
		1 -0.15672232497824465 0.15672232497824493
		1 1.5781921478028672e-16 0.22163883751087765
		1 0.15672232497824504 0.15672232497824495
		1 0.22163883751087787 1.2801644722917804e-16
		1 0.15672232497824512 -0.15672232497824473
		1 3.4108725691064299e-16 -0.22163883751087754
		1 -0.15672232497824456 -0.15672232497824495
		1 -0.22163883751087737 8.651868117302632e-17
		1 -0.15672232497824465 0.15672232497824493
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "LegFoot__instance_1_mirror:knee_joint_hierarchy_arrow_representation" 
		-p "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation";
	rename -uid "D5272809-4ED7-F4BC-0834-728374543873";
	setAttr ".r" -type "double3" 0 0 -90 ;
	setAttr ".s" -type "double3" 0.46739519169468152 0.46739519169468152 0.46739519169468152 ;
	setAttr ".rp" -type "double3" 1.1102230246251565e-16 0.5 0 ;
	setAttr ".rpt" -type "double3" 0.49999999999999989 -0.5 0 ;
	setAttr ".sp" -type "double3" 2.3753411339122038e-16 1.0697585445564812 0 ;
	setAttr ".spt" -type "double3" -1.2651181092870475e-16 -0.56975854455648134 0 ;
createNode mesh -n "LegFoot__instance_1_mirror:knee_joint_hierarchy_arrow_representationShape" 
		-p "LegFoot__instance_1_mirror:knee_joint_hierarchy_arrow_representation";
	rename -uid "E9146B32-493A-2AAB-9058-9C879A665C9D";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 18 ".uvst[0].uvsp[0:17]" -type "float2" 0.67677665 0.073223323
		 0.5 2.9802322e-08 0.32322332 0.073223323 0.25000003 0.25 0.32322332 0.42677668 0.5
		 0.5 0.67677671 0.42677671 0.75 0.25 0.25 0.5 0.3125 0.5 0.375 0.5 0.4375 0.5 0.5
		 0.5 0.5625 0.5 0.625 0.5 0.6875 0.5 0.75 0.5 0.5 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 9 ".pt[0:8]" -type "float3"  0.33249366 1.0697585 -0.33249369 
		-2.8027111e-08 1.0697585 -0.4702169 -0.33249369 1.0697585 -0.33249369 -0.4702169 
		1.0697585 -1.4013556e-08 -0.33249369 1.0697585 0.33249366 -2.8027111e-08 1.0697585 
		0.4702169 0.33249369 1.0697585 0.33249369 0.4702169 1.0697585 -1.4013556e-08 2.3753411e-16 
		1.0697585 0;
	setAttr -s 9 ".vt[0:8]"  0.70710671 -0.25 -0.70710671 0 -0.25 -0.99999988
		 -0.70710671 -0.25 -0.70710671 -0.99999988 -0.25 0 -0.70710671 -0.25 0.70710671 0 -0.25 0.99999994
		 0.70710677 -0.25 0.70710677 1 -0.25 0 0 0.25 0;
	setAttr -s 16 ".ed[0:15]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 0 0 0 8 0 1 8 0 2 8 0 3 8 0 4 8 0 5 8 0 6 8 0 7 8 0;
	setAttr -s 9 -ch 32 ".fc[0:8]" -type "polyFaces" 
		f 8 -8 -7 -6 -5 -4 -3 -2 -1
		mu 0 8 0 7 6 5 4 3 2 1
		f 3 0 9 -9
		mu 0 3 8 9 17
		f 3 1 10 -10
		mu 0 3 9 10 17
		f 3 2 11 -11
		mu 0 3 10 11 17
		f 3 3 12 -12
		mu 0 3 11 12 17
		f 3 4 13 -13
		mu 0 3 12 13 17
		f 3 5 14 -14
		mu 0 3 13 14 17
		f 3 6 15 -15
		mu 0 3 14 15 17
		f 3 7 8 -16
		mu 0 3 15 16 17;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode parentConstraint -n "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2" 
		-p "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp";
	rename -uid "018007A3-41D8-9BF6-B9B4-81AD716CFCFF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" -180 -14.036243467926456 90 ;
	setAttr ".rst" -type "double3" -3.9999999033280145 2.2204460492503131e-16 -0.99999997583200395 ;
	setAttr ".rsrr" -type "double3" 89.999994626480984 14.036242816291578 1.2294152683537999e-14 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2" 
		-p "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp";
	rename -uid "79AA6D05-4DA1-C3FE-5B3E-6CB497678D60";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "module_transformW0" -dv 1 -min 0 
		-at "double";
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
createNode transform -n "LegFoot__instance_1_mirror:orientationControls_grp" -p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "7A384D0C-4B31-8BE0-86A4-1BB535FE9628";
createNode transform -n "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp" 
		-p "LegFoot__instance_1_mirror:orientationControls_grp";
	rename -uid "11237C6C-4930-7B3A-1D81-6ABE2114ECB9";
createNode transform -n "LegFoot__instance_1_mirror:ankle_joint_orientation_control" 
		-p "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp";
	rename -uid "557E1454-4762-E324-99BC-7FAB68C2EADA";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" -90 0 0 ;
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "LegFoot__instance_1_mirror:ankle_joint_orientation_controlShape" 
		-p "LegFoot__instance_1_mirror:ankle_joint_orientation_control";
	rename -uid "C9A293B7-4103-155D-A096-D59B8CAEA471";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr -s 2 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 2 "f[0:10]" "f[28:33]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 1 "f[11:27]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 72 ".uvst[0].uvsp[0:71]" -type "float2" 0.62640893 0.064408526
		 0.54828387 0.0076473951 0.45171607 0.00764741 0.37359107 0.064408556 0.34375 0.15625001
		 0.37359107 0.24809146 0.4517161 0.3048526 0.54828393 0.3048526 0.62640893 0.24809144
		 0.65625 0.15625 0.375 0.3125 0.40000001 0.3125 0.42500001 0.3125 0.45000002 0.3125
		 0.47500002 0.3125 0.5 0.3125 0.52499998 0.3125 0.54999995 0.3125 0.57499993 0.3125
		 0.5999999 0.3125 0.62499988 0.3125 0.5 0.68843985 0.375 0.3125 0.40000001 0.3125
		 0.5 0.68843985 0.42500001 0.3125 0.45000002 0.3125 0.47500002 0.3125 0.5 0.3125 0.52499998
		 0.3125 0.54999995 0.3125 0.57499993 0.3125 0.5999999 0.3125 0.62499988 0.3125 0.62640893
		 0.064408526 0.65625 0.15625 0.62640893 0.24809144 0.54828393 0.3048526 0.4517161
		 0.3048526 0.37359107 0.24809146 0.34375 0.15625001 0.37359107 0.064408556 0.45171607
		 0.00764741 0.54828387 0.0076473951 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5
		 0.375 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125
		 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375 0.5 0.625 0.75 0.375 0.75
		 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 38 ".pt[0:37]" -type "float3"  0.5 0 0 0.5 0 0 0.5 0 0 0.5 
		0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 
		0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 
		0 0 0.5 0 0 0.5 0 0 0.5 0 0;
	setAttr -s 38 ".vt[0:37]"  0.095147073 0.49463958 -0.069128409 0.036342937 0.49463958 -0.11185211
		 -0.036342964 0.49463958 -0.11185209 -0.095147088 0.49463958 -0.069128387 -0.11760826 0.49463958 7.0099975e-09
		 -0.095147073 0.49463958 0.069128402 -0.036342941 0.49463958 0.11185209 0.036342949 0.49463958 0.11185209
		 0.095147066 0.49463958 0.069128387 0.11760824 0.49463958 0 -4.5564983e-09 0.72985607 -4.205998e-10
		 0.095147073 0.069128409 0.49463958 0.036342937 0.11185211 0.49463958 -0.036342964 0.11185209 0.49463958
		 -0.095147088 0.069128387 0.49463958 -0.11760826 -7.0099975e-09 0.49463958 -0.095147073 -0.069128402 0.49463958
		 -0.036342941 -0.11185209 0.49463958 0.036342949 -0.11185209 0.49463958 0.095147066 -0.069128387 0.49463958
		 0.11760824 1.0983205e-16 0.49463958 -4.5564983e-09 4.2059997e-10 0.72985607 -0.5 -0.075000018 -0.5
		 0.5 -0.075000018 -0.5 -0.5 -0.074999988 0.5 0.5 -0.074999988 0.5 -0.5 0.075000018 0.5
		 0.5 0.075000018 0.5 -0.5 0.074999988 -0.5 0.5 0.074999988 -0.5 -0.5 -0.5 -0.074999988
		 0.5 -0.5 -0.074999988 -0.5 -0.5 0.075000018 0.5 -0.5 0.075000018 -0.5 0.5 0.074999988
		 0.5 0.5 0.074999988 -0.5 0.5 -0.075000018 0.5 0.5 -0.075000018;
	setAttr -s 64 ".ed[0:63]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 0 0 0 10 0 1 10 0 2 10 0 3 10 0 4 10 0 5 10 0 6 10 0 7 10 0 8 10 0
		 9 10 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0 18 19 0 19 20 0 20 11 0
		 11 21 0 12 21 0 13 21 0 14 21 0 15 21 0 16 21 0 17 21 0 18 21 0 19 21 0 20 21 0 22 23 0
		 24 25 0 26 27 0 28 29 0 22 24 0 23 25 0 24 26 0 25 27 0 26 28 0 27 29 0 28 22 0 29 23 0
		 30 31 0 32 33 0 34 35 0 36 37 0 30 32 0 31 33 0 32 34 0 33 35 0 34 36 0 35 37 0 36 30 0
		 37 31 0;
	setAttr -s 34 -ch 128 ".fc[0:33]" -type "polyFaces" 
		f 3 0 11 -11
		mu 0 3 10 11 21
		f 3 1 12 -12
		mu 0 3 11 12 21
		f 3 2 13 -13
		mu 0 3 12 13 21
		f 3 3 14 -14
		mu 0 3 13 14 21
		f 3 4 15 -15
		mu 0 3 14 15 21
		f 3 5 16 -16
		mu 0 3 15 16 21
		f 3 6 17 -17
		mu 0 3 16 17 21
		f 3 7 18 -18
		mu 0 3 17 18 21
		f 3 8 19 -19
		mu 0 3 18 19 21
		f 3 9 10 -20
		mu 0 3 19 20 21
		f 10 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1
		mu 0 10 0 9 8 7 6 5 4 3 2 1
		f 3 20 31 -31
		mu 0 3 22 23 24
		f 3 21 32 -32
		mu 0 3 23 25 24
		f 3 22 33 -33
		mu 0 3 25 26 24
		f 3 23 34 -34
		mu 0 3 26 27 24
		f 3 24 35 -35
		mu 0 3 27 28 24
		f 3 25 36 -36
		mu 0 3 28 29 24
		f 3 26 37 -37
		mu 0 3 29 30 24
		f 3 27 38 -38
		mu 0 3 30 31 24
		f 3 28 39 -39
		mu 0 3 31 32 24
		f 3 29 30 -40
		mu 0 3 32 33 24
		f 10 -30 -29 -28 -27 -26 -25 -24 -23 -22 -21
		mu 0 10 34 35 36 37 38 39 40 41 42 43
		f 4 40 45 -42 -45
		mu 0 4 44 45 46 47
		f 4 41 47 -43 -47
		mu 0 4 47 46 48 49
		f 4 42 49 -44 -49
		mu 0 4 49 48 50 51
		f 4 43 51 -41 -51
		mu 0 4 51 50 52 53
		f 4 -52 -50 -48 -46
		mu 0 4 45 54 55 46
		f 4 50 44 46 48
		mu 0 4 56 44 47 57
		f 4 52 57 -54 -57
		mu 0 4 58 59 60 61
		f 4 53 59 -55 -59
		mu 0 4 61 60 62 63
		f 4 54 61 -56 -61
		mu 0 4 63 62 64 65
		f 4 55 63 -53 -63
		mu 0 4 65 64 66 67
		f 4 -64 -62 -60 -58
		mu 0 4 59 68 69 60
		f 4 62 56 58 60
		mu 0 4 70 58 61 71;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode parentConstraint -n "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2" 
		-p "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp";
	rename -uid "F845771C-4CA8-85C0-6F50-01B2F2369B96";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 90.000000000000114 108.4349500539563 -89.999999999999844 ;
	setAttr ".rst" -type "double3" -7.9999998180292033 8.4270625105581905e-17 -4.5492697386961822e-08 ;
	setAttr ".rsrr" -type "double3" 164.7855087583082 13.989666476620593 131.63353868942932 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint2" 
		-p "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp";
	rename -uid "B1FF8BEA-4544-50E3-112C-21AFB1CFF903";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "module_transformW0" -dv 1 -min 0 
		-at "double";
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
createNode transform -n "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp" 
		-p "LegFoot__instance_1_mirror:orientationControls_grp";
	rename -uid "8E7048E7-46E0-1625-4061-27A6FFC9C246";
createNode transform -n "LegFoot__instance_1_mirror:ball_joint_orientation_control" 
		-p "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp";
	rename -uid "1103D6C2-49CA-6E9B-36C2-E4A6B04E8FF8";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" -90 0 0 ;
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "LegFoot__instance_1_mirror:ball_joint_orientation_controlShape" 
		-p "LegFoot__instance_1_mirror:ball_joint_orientation_control";
	rename -uid "68CD3F44-4020-B14E-A221-E6AF028165DE";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr -s 2 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 2 "f[0:10]" "f[28:33]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 1 "f[11:27]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 72 ".uvst[0].uvsp[0:71]" -type "float2" 0.62640893 0.064408526
		 0.54828387 0.0076473951 0.45171607 0.00764741 0.37359107 0.064408556 0.34375 0.15625001
		 0.37359107 0.24809146 0.4517161 0.3048526 0.54828393 0.3048526 0.62640893 0.24809144
		 0.65625 0.15625 0.375 0.3125 0.40000001 0.3125 0.42500001 0.3125 0.45000002 0.3125
		 0.47500002 0.3125 0.5 0.3125 0.52499998 0.3125 0.54999995 0.3125 0.57499993 0.3125
		 0.5999999 0.3125 0.62499988 0.3125 0.5 0.68843985 0.375 0.3125 0.40000001 0.3125
		 0.5 0.68843985 0.42500001 0.3125 0.45000002 0.3125 0.47500002 0.3125 0.5 0.3125 0.52499998
		 0.3125 0.54999995 0.3125 0.57499993 0.3125 0.5999999 0.3125 0.62499988 0.3125 0.62640893
		 0.064408526 0.65625 0.15625 0.62640893 0.24809144 0.54828393 0.3048526 0.4517161
		 0.3048526 0.37359107 0.24809146 0.34375 0.15625001 0.37359107 0.064408556 0.45171607
		 0.00764741 0.54828387 0.0076473951 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5
		 0.375 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125
		 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375 0.5 0.625 0.75 0.375 0.75
		 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 38 ".pt[0:37]" -type "float3"  0.5 0 0 0.5 0 0 0.5 0 0 0.5 
		0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 
		0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 
		0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 0 0 0.5 
		0 0 0.5 0 0 0.5 0 0 0.5 0 0;
	setAttr -s 38 ".vt[0:37]"  0.095147073 0.49463958 -0.069128409 0.036342937 0.49463958 -0.11185211
		 -0.036342964 0.49463958 -0.11185209 -0.095147088 0.49463958 -0.069128387 -0.11760826 0.49463958 7.0099975e-09
		 -0.095147073 0.49463958 0.069128402 -0.036342941 0.49463958 0.11185209 0.036342949 0.49463958 0.11185209
		 0.095147066 0.49463958 0.069128387 0.11760824 0.49463958 0 -4.5564983e-09 0.72985607 -4.205998e-10
		 0.095147073 0.069128409 0.49463958 0.036342937 0.11185211 0.49463958 -0.036342964 0.11185209 0.49463958
		 -0.095147088 0.069128387 0.49463958 -0.11760826 -7.0099975e-09 0.49463958 -0.095147073 -0.069128402 0.49463958
		 -0.036342941 -0.11185209 0.49463958 0.036342949 -0.11185209 0.49463958 0.095147066 -0.069128387 0.49463958
		 0.11760824 1.0983205e-16 0.49463958 -4.5564983e-09 4.2059997e-10 0.72985607 -0.5 -0.075000018 -0.5
		 0.5 -0.075000018 -0.5 -0.5 -0.074999988 0.5 0.5 -0.074999988 0.5 -0.5 0.075000018 0.5
		 0.5 0.075000018 0.5 -0.5 0.074999988 -0.5 0.5 0.074999988 -0.5 -0.5 -0.5 -0.074999988
		 0.5 -0.5 -0.074999988 -0.5 -0.5 0.075000018 0.5 -0.5 0.075000018 -0.5 0.5 0.074999988
		 0.5 0.5 0.074999988 -0.5 0.5 -0.075000018 0.5 0.5 -0.075000018;
	setAttr -s 64 ".ed[0:63]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 0 0 0 10 0 1 10 0 2 10 0 3 10 0 4 10 0 5 10 0 6 10 0 7 10 0 8 10 0
		 9 10 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0 18 19 0 19 20 0 20 11 0
		 11 21 0 12 21 0 13 21 0 14 21 0 15 21 0 16 21 0 17 21 0 18 21 0 19 21 0 20 21 0 22 23 0
		 24 25 0 26 27 0 28 29 0 22 24 0 23 25 0 24 26 0 25 27 0 26 28 0 27 29 0 28 22 0 29 23 0
		 30 31 0 32 33 0 34 35 0 36 37 0 30 32 0 31 33 0 32 34 0 33 35 0 34 36 0 35 37 0 36 30 0
		 37 31 0;
	setAttr -s 34 -ch 128 ".fc[0:33]" -type "polyFaces" 
		f 3 0 11 -11
		mu 0 3 10 11 21
		f 3 1 12 -12
		mu 0 3 11 12 21
		f 3 2 13 -13
		mu 0 3 12 13 21
		f 3 3 14 -14
		mu 0 3 13 14 21
		f 3 4 15 -15
		mu 0 3 14 15 21
		f 3 5 16 -16
		mu 0 3 15 16 21
		f 3 6 17 -17
		mu 0 3 16 17 21
		f 3 7 18 -18
		mu 0 3 17 18 21
		f 3 8 19 -19
		mu 0 3 18 19 21
		f 3 9 10 -20
		mu 0 3 19 20 21
		f 10 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1
		mu 0 10 0 9 8 7 6 5 4 3 2 1
		f 3 20 31 -31
		mu 0 3 22 23 24
		f 3 21 32 -32
		mu 0 3 23 25 24
		f 3 22 33 -33
		mu 0 3 25 26 24
		f 3 23 34 -34
		mu 0 3 26 27 24
		f 3 24 35 -35
		mu 0 3 27 28 24
		f 3 25 36 -36
		mu 0 3 28 29 24
		f 3 26 37 -37
		mu 0 3 29 30 24
		f 3 27 38 -38
		mu 0 3 30 31 24
		f 3 28 39 -39
		mu 0 3 31 32 24
		f 3 29 30 -40
		mu 0 3 32 33 24
		f 10 -30 -29 -28 -27 -26 -25 -24 -23 -22 -21
		mu 0 10 34 35 36 37 38 39 40 41 42 43
		f 4 40 45 -42 -45
		mu 0 4 44 45 46 47
		f 4 41 47 -43 -47
		mu 0 4 47 46 48 49
		f 4 42 49 -44 -49
		mu 0 4 49 48 50 51
		f 4 43 51 -41 -51
		mu 0 4 51 50 52 53
		f 4 -52 -50 -48 -46
		mu 0 4 45 54 55 46
		f 4 50 44 46 48
		mu 0 4 56 44 47 57
		f 4 52 57 -54 -57
		mu 0 4 58 59 60 61
		f 4 53 59 -55 -59
		mu 0 4 61 60 62 63
		f 4 54 61 -56 -61
		mu 0 4 63 62 64 65
		f 4 55 63 -53 -63
		mu 0 4 65 64 66 67
		f 4 -64 -62 -60 -58
		mu 0 4 59 68 69 60
		f 4 62 56 58 60
		mu 0 4 70 58 61 71;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode parentConstraint -n "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2" 
		-p "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp";
	rename -uid "CFADFCE4-4125-F906-BE1D-659AC740257A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ball_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 270.00000000000006 89.999999060872995 0 ;
	setAttr ".rst" -type "double3" 9.7418401345805705e-08 -9.0000001095957014 3.0000000365319011 ;
	setAttr ".rsrr" -type "double3" 89.999988836676067 89.9999971994947 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint2" 
		-p "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp";
	rename -uid "71B92404-4BB2-78E7-0472-63B80008EDF6";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "module_transformW0" -dv 1 -min 0 
		-at "double";
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
createNode transform -n "LegFoot__instance_1_mirror:preferredAngleRepresentation_grp" 
		-p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "E0E68A20-4C30-0A3A-4721-E5BC26625B27";
createNode transform -n "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp" 
		-p "LegFoot__instance_1_mirror:preferredAngleRepresentation_grp";
	rename -uid "3583D548-459D-63C9-3AFE-6F81AF307D41";
	setAttr ".rp" -type "double3" -1.1920928955078125e-07 0.00014042854309082031 0.11461406946182251 ;
	setAttr ".sp" -type "double3" -1.1920928955078125e-07 0.00014042854309082031 0.11461406946182251 ;
createNode transform -n "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation" 
		-p "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp";
	rename -uid "7594C7B6-4AB7-61EA-C2AF-CCA9FB87CF14";
	addAttr -ci true -sn "axis" -ln "axis" -min 0 -max 3 -en "+Y:-Y:+Z:-Z" -at "enum";
	setAttr -l on -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on -k on ".axis";
createNode mesh -n "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representationShape" 
		-p "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation";
	rename -uid "6E9BA044-42C4-5DE6-B655-C08BF766E1E3";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 1070 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.64860266 0.10796607 0.62640899
		 0.064408496 0.59184152 0.029841021 0.54828393 0.0076473355 0.5 -7.4505806e-08 0.45171607
		 0.0076473504 0.40815851 0.029841051 0.37359107 0.064408526 0.3513974 0.10796608 0.34374997
		 0.15625 0.3513974 0.20453392 0.37359107 0.24809146 0.40815854 0.28265893 0.4517161
		 0.3048526 0.5 0.3125 0.54828387 0.3048526 0.59184146 0.28265893 0.62640893 0.24809146
		 0.6486026 0.2045339 0.65625 0.15625 0.375 0.3125 0.38749999 0.3125 0.39999998 0.3125
		 0.41249996 0.3125 0.42499995 0.3125 0.43749994 0.3125 0.44999993 0.3125 0.46249992
		 0.3125 0.4749999 0.3125 0.48749989 0.3125 0.49999988 0.3125 0.51249987 0.3125 0.52499986
		 0.3125 0.53749985 0.3125 0.54999983 0.3125 0.56249982 0.3125 0.57499981 0.3125 0.5874998
		 0.3125 0.59999979 0.3125 0.61249977 0.3125 0.62499976 0.3125 0.375 0.68843985 0.38749999
		 0.68843985 0.39999998 0.68843985 0.41249996 0.68843985 0.42499995 0.68843985 0.43749994
		 0.68843985 0.44999993 0.68843985 0.46249992 0.68843985 0.4749999 0.68843985 0.48749989
		 0.68843985 0.49999988 0.68843985 0.51249987 0.68843985 0.52499986 0.68843985 0.53749985
		 0.68843985 0.54999983 0.68843985 0.56249982 0.68843985 0.57499981 0.68843985 0.5874998
		 0.68843985 0.59999979 0.68843985 0.61249977 0.68843985 0.62499976 0.68843985 0.64860266
		 0.79546607 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5
		 0.68749994 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974
		 0.79546607 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854
		 0.97015893 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893
		 0.93559146 0.6486026 0.89203393 0.65625 0.84375 0.7377643 0.1727457 0.75 0.25 0.73776412
		 0.32725424 0.70225424 0.39694631 0.64694631 0.45225427 0.57725424 0.48776415 0.5
		 0.5 0.42274573 0.48776418 0.35305366 0.4522543 0.2977457 0.39694634 0.26223582 0.32725427
		 0.24999994 0.25 0.26223582 0.17274573 0.2977457 0.10305364 0.35305363 0.047745675
		 0.4227457 0.012235761 0.5 -1.1920929e-07 0.5772543 0.012235746 0.64694643 0.04774563
		 0.70225441 0.1030536 0.25 0.5 0.27500001 0.5 0.49981534 0.99958968 0.49979484 0.99958968
		 0.30000001 0.5 0.49983585 0.99958968 0.32500002 0.5 0.49985638 0.99958968 0.35000002
		 0.5 0.49987689 0.99958968 0.37500003 0.5 0.49989742 0.99958968 0.40000004 0.5 0.49991792
		 0.99958968 0.42500004 0.5 0.49993846 0.99958968 0.45000005 0.5 0.49995896 0.99958968
		 0.47500005 0.5 0.4999795 0.99958968 0.50000006 0.5 0.5 0.99958968 0.52500004 0.5
		 0.5000205 0.99958968 0.55000001 0.5 0.50004101 0.99958968 0.57499999 0.5 0.50006157
		 0.99958968 0.59999996 0.5 0.50008208 0.99958968 0.62499994 0.5 0.50010258 0.99958968
		 0.64999992 0.5 0.50012308 0.99958968 0.67499989 0.5 0.50014365 0.99958968 0.69999987
		 0.5 0.50016415 0.99958968 0.72499985 0.5 0.50018466 0.99958968 0.74999982 0.5 0.50020516
		 0.99958968 0.5 1 0.050000001 1 0 1 0 0.94999999 0.050000001 0.94999999 0.1 1 0.1
		 0.94999999 0.15000001 1 0.15000001 0.94999999 0.2 1 0.2 0.94999999 0.25 1 0.25 0.94999999
		 0.30000001 1 0.30000001 0.94999999 0.35000002 1 0.35000002 0.94999999 0.40000004
		 1 0.40000004 0.94999999 0.45000005 1 0.45000005 0.94999999 0.50000006 1 0.50000006
		 0.94999999 0.55000007 1 0.55000007 0.94999999 0.60000008 1 0.60000008 0.94999999
		 0.6500001 1 0.6500001 0.94999999 0.70000011 1 0.70000011 0.94999999 1.000000119209
		 1 0.95000017 1 0.95000017 0.94999999 1.000000119209 0.94999999 0 0.89999998 0.050000001
		 0.89999998 0.1 0.89999998 0.15000001 0.89999998 0.2 0.89999998 0.25 0.89999998 0.30000001
		 0.89999998 0.35000002 0.89999998 0.40000004 0.89999998 0.45000005 0.89999998 0.50000006
		 0.89999998 0.55000007 0.89999998 0.60000008 0.89999998 0.6500001 0.89999998 0.70000011
		 0.89999998 0.95000017 0.89999998 1.000000119209 0.89999998 0 0.84999996 0.050000001
		 0.84999996 0.1 0.84999996 0.15000001 0.84999996 0.2 0.84999996 0.25 0.84999996 0.30000001
		 0.84999996 0.35000002 0.84999996 0.40000004 0.84999996 0.45000005 0.84999996 0.50000006
		 0.84999996 0.55000007 0.84999996 0.60000008 0.84999996 0.6500001 0.84999996 0.70000011
		 0.84999996 0.95000017 0.84999996 1.000000119209 0.84999996 0 0.79999995 0.050000001
		 0.79999995 0.1 0.79999995 0.15000001 0.79999995 0.2 0.79999995 0.25 0.79999995 0.30000001
		 0.79999995 0.35000002 0.79999995 0.40000004 0.79999995 0.45000005 0.79999995 0.50000006
		 0.79999995 0.55000007 0.79999995 0.60000008 0.79999995 0.6500001 0.79999995 0.70000011
		 0.79999995 0.95000017 0.79999995 1.000000119209 0.79999995 0 0.74999994 0.050000001
		 0.74999994 0.1 0.74999994 0.15000001 0.74999994 0.2 0.74999994 0.25 0.74999994 0.30000001
		 0.74999994 0.35000002 0.74999994 0.40000004 0.74999994 0.45000005 0.74999994 0.50000006
		 0.74999994 0.55000007 0.74999994 0.60000008 0.74999994 0.6500001 0.74999994 0.70000011
		 0.74999994 0.95000017 0.74999994 1.000000119209 0.74999994 0 0.69999993 0.050000001
		 0.69999993 0.1 0.69999993;
	setAttr ".uvst[0].uvsp[250:499]" 0.15000001 0.69999993 0.2 0.69999993 0.25
		 0.69999993 0.30000001 0.69999993 0.35000002 0.69999993 0.40000004 0.69999993 0.45000005
		 0.69999993 0.50000006 0.69999993 0.55000007 0.69999993 0.60000008 0.69999993 0.6500001
		 0.69999993 0.70000011 0.69999993 0.95000017 0.69999993 1.000000119209 0.69999993
		 0 0.64999992 0.050000001 0.64999992 0.1 0.64999992 0.15000001 0.64999992 0.2 0.64999992
		 0.25 0.64999992 0.30000001 0.64999992 0.35000002 0.64999992 0.40000004 0.64999992
		 0.45000005 0.64999992 0.50000006 0.64999992 0.55000007 0.64999992 0.60000008 0.64999992
		 0.6500001 0.64999992 0.70000011 0.64999992 0.95000017 0.64999992 1.000000119209 0.64999992
		 0 0.5999999 0.050000001 0.5999999 0.1 0.5999999 0.15000001 0.5999999 0.2 0.5999999
		 0.25 0.5999999 0.30000001 0.5999999 0.35000002 0.5999999 0.40000004 0.5999999 0.45000005
		 0.5999999 0.50000006 0.5999999 0.55000007 0.5999999 0.60000008 0.5999999 0.6500001
		 0.5999999 0.70000011 0.5999999 0.95000017 0.5999999 1.000000119209 0.5999999 0 0.54999989
		 0.050000001 0.54999989 0.1 0.54999989 0.15000001 0.54999989 0.2 0.54999989 0.25 0.54999989
		 0.30000001 0.54999989 0.35000002 0.54999989 0.40000004 0.54999989 0.45000005 0.54999989
		 0.50000006 0.54999989 0.55000007 0.54999989 0.60000008 0.54999989 0.6500001 0.54999989
		 0.70000011 0.54999989 0.95000017 0.54999989 1.000000119209 0.54999989 0 0.49999988
		 0.050000001 0.49999988 0.1 0.49999988 0.15000001 0.49999988 0.2 0.49999988 0.25 0.49999988
		 0.30000001 0.49999988 0.35000002 0.49999988 0.40000004 0.49999988 0.45000005 0.49999988
		 0.50000006 0.49999988 0.55000007 0.49999988 0.60000008 0.49999988 0.6500001 0.49999988
		 0.70000011 0.49999988 0.95000017 0.49999988 1.000000119209 0.49999988 0 0.44999987
		 0.050000001 0.44999987 0.1 0.44999987 0.15000001 0.44999987 0.2 0.44999987 0.25 0.44999987
		 0.30000001 0.44999987 0.35000002 0.44999987 0.40000004 0.44999987 0.45000005 0.44999987
		 0.50000006 0.44999987 0.55000007 0.44999987 0.60000008 0.44999987 0.6500001 0.44999987
		 0.70000011 0.44999987 0.95000017 0.44999987 1.000000119209 0.44999987 0 0.39999986
		 0.050000001 0.39999986 0.1 0.39999986 0.15000001 0.39999986 0.2 0.39999986 0.25 0.39999986
		 0.30000001 0.39999986 0.35000002 0.39999986 0.40000004 0.39999986 0.45000005 0.39999986
		 0.50000006 0.39999986 0.55000007 0.39999986 0.60000008 0.39999986 0.6500001 0.39999986
		 0.70000011 0.39999986 0.95000017 0.39999986 1.000000119209 0.39999986 0 0.34999985
		 0.050000001 0.34999985 0.1 0.34999985 0.15000001 0.34999985 0.2 0.34999985 0.25 0.34999985
		 0.30000001 0.34999985 0.35000002 0.34999985 0.40000004 0.34999985 0.45000005 0.34999985
		 0.50000006 0.34999985 0.55000007 0.34999985 0.60000008 0.34999985 0.6500001 0.34999985
		 0.70000011 0.34999985 0.95000017 0.34999985 1.000000119209 0.34999985 0 0.29999983
		 0.050000001 0.29999983 0.1 0.29999983 0.15000001 0.29999983 0.2 0.29999983 0.25 0.29999983
		 0.30000001 0.29999983 0.35000002 0.29999983 0.40000004 0.29999983 0.45000005 0.29999983
		 0.50000006 0.29999983 0.55000007 0.29999983 0.60000008 0.29999983 0.6500001 0.29999983
		 0.70000011 0.29999983 0.95000017 0.29999983 1.000000119209 0.29999983 0 0.24999984
		 0.050000001 0.24999984 0.1 0.24999984 0.15000001 0.24999984 0.2 0.24999984 0.25 0.24999984
		 0.30000001 0.24999984 0.35000002 0.24999984 0.40000004 0.24999984 0.45000005 0.24999984
		 0.50000006 0.24999984 0.55000007 0.24999984 0.60000008 0.24999984 0.6500001 0.24999984
		 0.70000011 0.24999984 0.95000017 0.24999984 1.000000119209 0.24999984 0 0.19999984
		 0.050000001 0.19999984 0.1 0.19999984 0.15000001 0.19999984 0.2 0.19999984 0.25 0.19999984
		 0.30000001 0.19999984 0.35000002 0.19999984 0.40000004 0.19999984 0.45000005 0.19999984
		 0.50000006 0.19999984 0.55000007 0.19999984 0.60000008 0.19999984 0.6500001 0.19999984
		 0.70000011 0.19999984 0.95000017 0.19999984 1.000000119209 0.19999984 0 0.14999984
		 0.050000001 0.14999984 0.1 0.14999984 0.15000001 0.14999984 0.2 0.14999984 0.25 0.14999984
		 0.30000001 0.14999984 0.35000002 0.14999984 0.40000004 0.14999984 0.45000005 0.14999984
		 0.50000006 0.14999984 0.55000007 0.14999984 0.60000008 0.14999984 0.6500001 0.14999984
		 0.70000011 0.14999984 0.95000017 0.14999984 1.000000119209 0.14999984 0 0.099999845
		 0.050000001 0.099999845 0.1 0.099999845 0.15000001 0.099999845 0.2 0.099999845 0.25
		 0.099999845 0.30000001 0.099999845 0.35000002 0.099999845 0.40000004 0.099999845
		 0.45000005 0.099999845 0.50000006 0.099999845 0.55000007 0.099999845 0.60000008 0.099999845
		 0.6500001 0.099999845 0.70000011 0.099999845 0.95000017 0.099999845 1.000000119209
		 0.099999845 0 0.049999844 0.050000001 0.049999844 0.1 0.049999844 0.15000001 0.049999844
		 0.2 0.049999844 0.25 0.049999844 0.30000001 0.049999844 0.35000002 0.049999844 0.40000004
		 0.049999844 0.45000005 0.049999844 0.50000006 0.049999844 0.55000007 0.049999844
		 0.60000008 0.049999844 0.6500001 0.049999844 0.70000011 0.049999844 0.95000017 0.049999844
		 1.000000119209 0.049999844 0 -1.5646219e-07 0.050000001 -1.5646219e-07 0.1 -1.5646219e-07
		 0.15000001 -1.5646219e-07 0.2 -1.5646219e-07 0.25 -1.5646219e-07 0.30000001 -1.5646219e-07
		 0.35000002 -1.5646219e-07 0.40000004 -1.5646219e-07 0.45000005 -1.5646219e-07 0.50000006
		 -1.5646219e-07 0.55000007 -1.5646219e-07 0.60000008 -1.5646219e-07 0.6500001 -1.5646219e-07
		 0.70000011 -1.5646219e-07;
	setAttr ".uvst[0].uvsp[500:749]" 0.95000017 -1.5646219e-07 1.000000119209 -1.5646219e-07
		 0 0 0.15838426 1.4050773e-16 0.30901742 0.95105654 0.15838476 1 0.15063262 0 0.30901688
		 0 0.15063237 1 0 0.95105654 0 0 0.18460587 0 0.61803406 0.85065073 0.50952542 1 0.72654116
		 0 0.99999857 0 4.1442365e-07 1 0 0.72654247 0 0 0.29869798 0 0.82442909 0.26787239
		 1 0.50952357 0.48745704 0 1 0 0 0.15838529 0 0 0.18460587 0 0.61803424 0.85065079
		 0.50952554 0.99999994 0.72654277 0 1.000000119209 0 0 0.99999946 2.7628249e-07 0.72654223
		 0 0 0.29869834 0 0.82442951 0.26787299 0.99999994 0.50952518 0.48745716 0 1 0 0 0.15838429
		 0 2.9547712e-16 0.16653505 0 0.4596495 0.90211302 0.32491958 1 4.9568939e-07 1.4050772e-16
		 0.15838474 0 0.15838425 1 0 0.99999994 0 0 0.21701717 0 0.79360449 0.79360431 0.72654229
		 1 0.72654295 0 1 0 0 0.72654068 0.084503144 0.46646726 0 0 0.36230886 0 0.70688558
		 0.11195894 1 0.32491878 0 0 0.16653535 0 0.45964921 0.90211308 0.32491925 1 0.57658839
		 0 0.79360545 0 0.06706205 1 0 0.79360431 0 0 0.27345735 0 0.91549689 0.46646893 1
		 0.72654241 0.63769084 0 1 0 0 0.32492003 0.29311422 0.11195964 0.7377643 0.1727457
		 0.75 0.25 0.73776412 0.32725424 0.70225424 0.39694631 0.64694631 0.45225427 0.57725424
		 0.48776415 0.5 0.5 0.42274573 0.48776418 0.35305366 0.4522543 0.2977457 0.39694634
		 0.26223582 0.32725427 0.24999994 0.25 0.26223582 0.17274573 0.2977457 0.10305364
		 0.35305363 0.047745675 0.4227457 0.012235761 0.5 -1.1920929e-07 0.5772543 0.012235746
		 0.64694643 0.04774563 0.70225441 0.1030536 0.25 0.5 0.27500001 0.5 0.49981534 0.99958968
		 0.49979484 0.99958968 0.30000001 0.5 0.49983585 0.99958968 0.32500002 0.5 0.49985638
		 0.99958968 0.35000002 0.5 0.49987689 0.99958968 0.37500003 0.5 0.49989742 0.99958968
		 0.40000004 0.5 0.49991792 0.99958968 0.42500004 0.5 0.49993846 0.99958968 0.45000005
		 0.5 0.49995896 0.99958968 0.47500005 0.5 0.4999795 0.99958968 0.50000006 0.5 0.5
		 0.99958968 0.52500004 0.5 0.5000205 0.99958968 0.55000001 0.5 0.50004101 0.99958968
		 0.57499999 0.5 0.50006157 0.99958968 0.59999996 0.5 0.50008208 0.99958968 0.62499994
		 0.5 0.50010258 0.99958968 0.64999992 0.5 0.50012308 0.99958968 0.67499989 0.5 0.50014365
		 0.99958968 0.69999987 0.5 0.50016415 0.99958968 0.72499985 0.5 0.50018466 0.99958968
		 0.74999982 0.5 0.50020516 0.99958968 0.5 1 0.050000001 1 0 1 0 0.94999999 0.050000001
		 0.94999999 0.1 1 0.1 0.94999999 0.15000001 1 0.15000001 0.94999999 0.2 1 0.2 0.94999999
		 0.25 1 0.25 0.94999999 0.30000001 1 0.30000001 0.94999999 0.35000002 1 0.35000002
		 0.94999999 0.40000004 1 0.40000004 0.94999999 0.45000005 1 0.45000005 0.94999999
		 0.50000006 1 0.50000006 0.94999999 0.55000007 1 0.55000007 0.94999999 0.60000008
		 1 0.60000008 0.94999999 0.6500001 1 0.6500001 0.94999999 0.70000011 1 0.70000011
		 0.94999999 1.000000119209 1 0.95000017 1 0.95000017 0.94999999 1.000000119209 0.94999999
		 0 0.89999998 0.050000001 0.89999998 0.1 0.89999998 0.15000001 0.89999998 0.2 0.89999998
		 0.25 0.89999998 0.30000001 0.89999998 0.35000002 0.89999998 0.40000004 0.89999998
		 0.45000005 0.89999998 0.50000006 0.89999998 0.55000007 0.89999998 0.60000008 0.89999998
		 0.6500001 0.89999998 0.70000011 0.89999998 0.95000017 0.89999998 1.000000119209 0.89999998
		 0 0.84999996 0.050000001 0.84999996 0.1 0.84999996 0.15000001 0.84999996 0.2 0.84999996
		 0.25 0.84999996 0.30000001 0.84999996 0.35000002 0.84999996 0.40000004 0.84999996
		 0.45000005 0.84999996 0.50000006 0.84999996 0.55000007 0.84999996 0.60000008 0.84999996
		 0.6500001 0.84999996 0.70000011 0.84999996 0.95000017 0.84999996 1.000000119209 0.84999996
		 0 0.79999995 0.050000001 0.79999995 0.1 0.79999995 0.15000001 0.79999995 0.2 0.79999995
		 0.25 0.79999995 0.30000001 0.79999995 0.35000002 0.79999995 0.40000004 0.79999995
		 0.45000005 0.79999995 0.50000006 0.79999995 0.55000007 0.79999995 0.60000008 0.79999995
		 0.6500001 0.79999995 0.70000011 0.79999995 0.95000017 0.79999995 1.000000119209 0.79999995
		 0 0.74999994 0.050000001 0.74999994 0.1 0.74999994 0.15000001 0.74999994 0.2 0.74999994
		 0.25 0.74999994 0.30000001 0.74999994 0.35000002 0.74999994 0.40000004 0.74999994
		 0.45000005 0.74999994 0.50000006 0.74999994 0.55000007 0.74999994 0.60000008 0.74999994
		 0.6500001 0.74999994 0.70000011 0.74999994 0.95000017 0.74999994 1.000000119209 0.74999994
		 0 0.69999993 0.050000001 0.69999993 0.1 0.69999993 0.15000001 0.69999993 0.2 0.69999993
		 0.25 0.69999993 0.30000001 0.69999993 0.35000002 0.69999993 0.40000004 0.69999993;
	setAttr ".uvst[0].uvsp[750:999]" 0.45000005 0.69999993 0.50000006 0.69999993
		 0.55000007 0.69999993 0.60000008 0.69999993 0.6500001 0.69999993 0.70000011 0.69999993
		 0.95000017 0.69999993 1.000000119209 0.69999993 0 0.64999992 0.050000001 0.64999992
		 0.1 0.64999992 0.15000001 0.64999992 0.2 0.64999992 0.25 0.64999992 0.30000001 0.64999992
		 0.35000002 0.64999992 0.40000004 0.64999992 0.45000005 0.64999992 0.50000006 0.64999992
		 0.55000007 0.64999992 0.60000008 0.64999992 0.6500001 0.64999992 0.70000011 0.64999992
		 0.95000017 0.64999992 1.000000119209 0.64999992 0 0.5999999 0.050000001 0.5999999
		 0.1 0.5999999 0.15000001 0.5999999 0.2 0.5999999 0.25 0.5999999 0.30000001 0.5999999
		 0.35000002 0.5999999 0.40000004 0.5999999 0.45000005 0.5999999 0.50000006 0.5999999
		 0.55000007 0.5999999 0.60000008 0.5999999 0.6500001 0.5999999 0.70000011 0.5999999
		 0.95000017 0.5999999 1.000000119209 0.5999999 0 0.54999989 0.050000001 0.54999989
		 0.1 0.54999989 0.15000001 0.54999989 0.2 0.54999989 0.25 0.54999989 0.30000001 0.54999989
		 0.35000002 0.54999989 0.40000004 0.54999989 0.45000005 0.54999989 0.50000006 0.54999989
		 0.55000007 0.54999989 0.60000008 0.54999989 0.6500001 0.54999989 0.70000011 0.54999989
		 0.95000017 0.54999989 1.000000119209 0.54999989 0 0.49999988 0.050000001 0.49999988
		 0.1 0.49999988 0.15000001 0.49999988 0.2 0.49999988 0.25 0.49999988 0.30000001 0.49999988
		 0.35000002 0.49999988 0.40000004 0.49999988 0.45000005 0.49999988 0.50000006 0.49999988
		 0.55000007 0.49999988 0.60000008 0.49999988 0.6500001 0.49999988 0.70000011 0.49999988
		 0.95000017 0.49999988 1.000000119209 0.49999988 0 0.44999987 0.050000001 0.44999987
		 0.1 0.44999987 0.15000001 0.44999987 0.2 0.44999987 0.25 0.44999987 0.30000001 0.44999987
		 0.35000002 0.44999987 0.40000004 0.44999987 0.45000005 0.44999987 0.50000006 0.44999987
		 0.55000007 0.44999987 0.60000008 0.44999987 0.6500001 0.44999987 0.70000011 0.44999987
		 0.95000017 0.44999987 1.000000119209 0.44999987 0 0.39999986 0.050000001 0.39999986
		 0.1 0.39999986 0.15000001 0.39999986 0.2 0.39999986 0.25 0.39999986 0.30000001 0.39999986
		 0.35000002 0.39999986 0.40000004 0.39999986 0.45000005 0.39999986 0.50000006 0.39999986
		 0.55000007 0.39999986 0.60000008 0.39999986 0.6500001 0.39999986 0.70000011 0.39999986
		 0.95000017 0.39999986 1.000000119209 0.39999986 0 0.34999985 0.050000001 0.34999985
		 0.1 0.34999985 0.15000001 0.34999985 0.2 0.34999985 0.25 0.34999985 0.30000001 0.34999985
		 0.35000002 0.34999985 0.40000004 0.34999985 0.45000005 0.34999985 0.50000006 0.34999985
		 0.55000007 0.34999985 0.60000008 0.34999985 0.6500001 0.34999985 0.70000011 0.34999985
		 0.95000017 0.34999985 1.000000119209 0.34999985 0 0.29999983 0.050000001 0.29999983
		 0.1 0.29999983 0.15000001 0.29999983 0.2 0.29999983 0.25 0.29999983 0.30000001 0.29999983
		 0.35000002 0.29999983 0.40000004 0.29999983 0.45000005 0.29999983 0.50000006 0.29999983
		 0.55000007 0.29999983 0.60000008 0.29999983 0.6500001 0.29999983 0.70000011 0.29999983
		 0.95000017 0.29999983 1.000000119209 0.29999983 0 0.24999984 0.050000001 0.24999984
		 0.1 0.24999984 0.15000001 0.24999984 0.2 0.24999984 0.25 0.24999984 0.30000001 0.24999984
		 0.35000002 0.24999984 0.40000004 0.24999984 0.45000005 0.24999984 0.50000006 0.24999984
		 0.55000007 0.24999984 0.60000008 0.24999984 0.6500001 0.24999984 0.70000011 0.24999984
		 0.95000017 0.24999984 1.000000119209 0.24999984 0 0.19999984 0.050000001 0.19999984
		 0.1 0.19999984 0.15000001 0.19999984 0.2 0.19999984 0.25 0.19999984 0.30000001 0.19999984
		 0.35000002 0.19999984 0.40000004 0.19999984 0.45000005 0.19999984 0.50000006 0.19999984
		 0.55000007 0.19999984 0.60000008 0.19999984 0.6500001 0.19999984 0.70000011 0.19999984
		 0.95000017 0.19999984 1.000000119209 0.19999984 0 0.14999984 0.050000001 0.14999984
		 0.1 0.14999984 0.15000001 0.14999984 0.2 0.14999984 0.25 0.14999984 0.30000001 0.14999984
		 0.35000002 0.14999984 0.40000004 0.14999984 0.45000005 0.14999984 0.50000006 0.14999984
		 0.55000007 0.14999984 0.60000008 0.14999984 0.6500001 0.14999984 0.70000011 0.14999984
		 0.95000017 0.14999984 1.000000119209 0.14999984 0 0.099999845 0.050000001 0.099999845
		 0.1 0.099999845 0.15000001 0.099999845 0.2 0.099999845 0.25 0.099999845 0.30000001
		 0.099999845 0.35000002 0.099999845 0.40000004 0.099999845 0.45000005 0.099999845
		 0.50000006 0.099999845 0.55000007 0.099999845 0.60000008 0.099999845 0.6500001 0.099999845
		 0.70000011 0.099999845 0.95000017 0.099999845 1.000000119209 0.099999845 0 0.049999844
		 0.050000001 0.049999844 0.1 0.049999844 0.15000001 0.049999844 0.2 0.049999844 0.25
		 0.049999844 0.30000001 0.049999844 0.35000002 0.049999844 0.40000004 0.049999844
		 0.45000005 0.049999844 0.50000006 0.049999844 0.55000007 0.049999844 0.60000008 0.049999844
		 0.6500001 0.049999844 0.70000011 0.049999844 0.95000017 0.049999844 1.000000119209
		 0.049999844 0 -1.5646219e-07 0.050000001 -1.5646219e-07 0.1 -1.5646219e-07 0.15000001
		 -1.5646219e-07 0.2 -1.5646219e-07 0.25 -1.5646219e-07 0.30000001 -1.5646219e-07 0.35000002
		 -1.5646219e-07 0.40000004 -1.5646219e-07 0.45000005 -1.5646219e-07 0.50000006 -1.5646219e-07
		 0.55000007 -1.5646219e-07 0.60000008 -1.5646219e-07 0.6500001 -1.5646219e-07 0.70000011
		 -1.5646219e-07 0.95000017 -1.5646219e-07 1.000000119209 -1.5646219e-07 0 0 0.15838426
		 1.4050773e-16 0.30901742 0.95105654 0.15838476 1;
	setAttr ".uvst[0].uvsp[1000:1069]" 0.15063262 0 0.30901688 0 0.15063237 1 0 0.95105654
		 0 0 0.18460587 0 0.61803406 0.85065073 0.50952542 1 0.72654116 0 0.99999857 0 4.1442365e-07
		 1 0 0.72654247 0 0 0.29869798 0 0.82442909 0.26787239 1 0.50952357 0.48745704 0 1
		 0 0 0.15838529 0 0 0.18460587 0 0.61803424 0.85065079 0.50952554 0.99999994 0.72654277
		 0 1.000000119209 0 0 0.99999946 2.7628249e-07 0.72654223 0 0 0.29869834 0 0.82442951
		 0.26787299 0.99999994 0.50952518 0.48745716 0 1 0 0 0.15838429 0 2.9547712e-16 0.16653505
		 0 0.4596495 0.90211302 0.32491958 1 4.9568939e-07 1.4050772e-16 0.15838474 0 0.15838425
		 1 0 0.99999994 0 0 0.21701717 0 0.79360449 0.79360431 0.72654229 1 0.72654295 0 1
		 0 0 0.72654068 0.084503144 0.46646726 0 0 0.36230886 0 0.70688558 0.11195894 1 0.32491878
		 0 0 0.16653535 0 0.45964921 0.90211308 0.32491925 1 0.57658839 0 0.79360545 0 0.06706205
		 1 0 0.79360431 0 0 0.27345735 0 0.91549689 0.46646893 1 0.72654241 0.63769084 0 1
		 0 0 0.32492003 0.29311422 0.11195964;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 762 ".vt";
	setAttr ".vt[0:165]"  0.14265858 -2 -0.04635258 0.12135264 -2 -0.088167846
		 0.088167846 -2 -0.12135263 0.046352573 -2 -0.14265856 0 -2 -0.15000008 -0.046352573 -2 -0.14265855
		 -0.088167824 -2 -0.1213526 -0.12135259 -2 -0.088167816 -0.14265852 -2 -0.046352562
		 -0.15000004 -2 0 -0.14265852 -2 0.046352562 -0.12135258 -2 0.088167809 -0.088167809 -2 0.12135258
		 -0.046352562 -2 0.1426585 -4.4703485e-09 -2 0.15000002 0.046352547 -2 0.1426585 0.088167787 -2 0.12135256
		 0.12135255 -2 0.088167801 0.14265849 -2 0.04635255 0.15000001 -2 0 0.14265858 2 -0.04635258
		 0.12135264 2 -0.088167846 0.088167846 2 -0.12135263 0.046352573 2 -0.14265856 0 2 -0.15000008
		 -0.046352573 2 -0.14265855 -0.088167824 2 -0.1213526 -0.12135259 2 -0.088167816 -0.14265852 2 -0.046352562
		 -0.15000004 2 0 -0.14265852 2 0.046352562 -0.12135258 2 0.088167809 -0.088167809 2 0.12135258
		 -0.046352562 2 0.1426585 -4.4703485e-09 2 0.15000002 0.046352547 2 0.1426585 0.088167787 2 0.12135256
		 0.12135255 2 0.088167801 0.14265849 2 0.04635255 0.15000001 2 0 -0.0027888119 1.46116579 0.89826292
		 -0.0027888119 1.50792933 0.8064844 -0.0027888119 1.58076513 0.7336486 -0.0027888119 1.67254364 0.68688512
		 -0.0027888119 1.77428091 0.67077154 -0.0027888119 1.87601817 0.68688512 -0.0027888119 1.96779668 0.73364866
		 -0.0027888119 2.040632486 0.80648446 -0.0027888119 2.087395906 0.89826298 -0.0027888119 2.10350943 1.000000119209
		 -0.0027888119 2.087395906 1.10173738 -0.0027888119 2.040632486 1.19351578 -0.0027888119 1.96779656 1.26635158
		 -0.0027888119 1.87601817 1.31311512 -0.0027888119 1.77428091 1.32922864 -0.0027888119 1.67254376 1.313115
		 -0.0027888119 1.58076525 1.26635158 -0.0027888119 1.50792944 1.19351578 -0.0027888119 1.4611659 1.10173738
		 -0.0027888119 1.44505239 1.000000119209 0.45642692 1.77428091 1.000000119209 0.45642692 1.77402389 0.99991667
		 0.45642692 1.77406228 0.99984133 0.45642692 1.77412212 0.99978161 0.45642692 1.77419746 0.99974322
		 0.45642692 1.77428091 0.99972999 0.45642692 1.77436435 0.99974322 0.45642692 1.77443969 0.99978161
		 0.45642692 1.77449954 0.99984133 0.45642692 1.77453792 0.99991667 0.45642692 1.77455115 1.000000119209
		 0.45642692 1.77453792 1.000083565712 0.45642692 1.77449954 1.00015890598 0.45642692 1.77443969 1.00021874905
		 0.45642692 1.77436435 1.00025713444 0.45642692 1.77428091 1.00027036667 0.45642692 1.77419746 1.00025713444
		 0.45642692 1.77412212 1.00021874905 0.45642692 1.77406228 1.00015890598 0.45642692 1.77402389 1.000083565712
		 0.45642692 1.77401066 1.000000119209 0.85595143 1.77428091 -0.27811545 0.72811574 1.77428091 -0.52900702
		 0.52900702 1.77428091 -0.72811574 0.27811542 1.77428091 -0.85595131 0 1.77428091 -0.90000039
		 -0.27811542 1.77428091 -0.85595125 -0.5290069 1.77428091 -0.72811556 -0.7281155 1.77428091 -0.52900684
		 -0.85595107 1.77428091 -0.27811536 -0.90000021 1.77428091 0 -0.85595107 1.77428091 0.27811536
		 -0.72811544 1.77428091 0.52900684 -0.52900684 1.77428091 0.72811538 -0.27811536 1.77428091 0.85595095
		 -2.6822089e-08 1.77428091 0.9000001 0.89999998 1.77428091 0 0.86060625 1.80518258 -0.27962789
		 0.73207539 1.80518258 -0.5318839 0.5318839 1.80518258 -0.73207533 0.27962789 1.80518258 -0.86060613
		 0 1.80518258 -0.90489477 -0.27962789 1.80518258 -0.86060607 -0.53188378 1.80518258 -0.73207521
		 -0.73207515 1.80518258 -0.53188372 -0.8606059 1.80518258 -0.2796278 -0.90489459 1.80518258 0
		 -0.8606059 1.80518258 0.2796278 -0.7320751 1.80518258 0.53188366 -0.53188366 1.80518258 0.73207504
		 -0.2796278 1.80518258 0.86060578 -2.6967953e-08 1.80518258 0.90489447 0.90489435 1.80518258 0
		 0.87411499 1.83305943 -0.28401718 0.74356663 1.83305943 -0.54023278 0.54023278 1.83305943 -0.74356663
		 0.28401715 1.83305943 -0.87411493 0 1.83305943 -0.91909873 -0.28401715 1.83305943 -0.87411487
		 -0.54023266 1.83305943 -0.74356645 -0.74356639 1.83305943 -0.5402326 -0.87411469 1.83305943 -0.28401706
		 -0.91909856 1.83305943 0 -0.87411469 1.83305943 0.28401706 -0.74356633 1.83305943 0.54023254
		 -0.54023254 1.83305943 0.74356627 -0.28401706 1.83305943 0.87411457 -2.7391264e-08 1.83305943 0.91909844
		 0.91909832 1.83305943 0 0.89515543 1.85518265 -0.29085362 0.76146466 1.85518265 -0.55323642
		 0.55323642 1.85518265 -0.76146466 0.29085359 1.85518265 -0.89515531 0 1.85518265 -0.94122195
		 -0.29085359 1.85518265 -0.89515525 -0.55323631 1.85518265 -0.76146448 -0.76146442 1.85518265 -0.55323625
		 -0.89515507 1.85518265 -0.2908535 -0.94122171 1.85518265 0 -0.89515507 1.85518265 0.2908535
		 -0.76146436 1.85518265 0.55323619 -0.55323619 1.85518265 0.7614643 -0.2908535 1.85518265 0.89515495
		 -2.8050586e-08 1.85518265 0.94122159 0.94122148 1.85518265 0 0.92166787 1.86938655 -0.29946804
		 0.78401756 1.86938655 -0.56962204 0.56962204 1.86938655 -0.7840175 0.29946801 1.86938655 -0.92166775
		 0 1.86938655 -0.96909881 -0.29946801 1.86938655 -0.9216677 -0.56962192 1.86938655 -0.78401732
		 -0.78401726 1.86938655 -0.56962186 -0.92166752 1.86938655 -0.29946792 -0.96909857 1.86938655 0
		 -0.92166752 1.86938655 0.29946792 -0.78401721 1.86938655 0.5696218 -0.5696218 1.86938655 0.78401715
		 -0.29946792 1.86938655 0.9216674 -2.8881381e-08 1.86938655 0.96909845 0.96909833 1.86938655 0
		 0.95105714 1.87428093 -0.30901718 0.80901754 1.87428093 -0.5877856 0.5877856 1.87428093 -0.80901748
		 0.30901715 1.87428093 -0.95105702 0 1.87428093 -1.000000476837;
	setAttr ".vt[166:331]" -0.30901715 1.87428093 -0.95105696 -0.58778548 1.87428093 -0.8090173
		 -0.80901724 1.87428093 -0.58778542 -0.95105678 1.87428093 -0.30901706 -1.000000238419 1.87428093 0
		 -0.95105678 1.87428093 0.30901706 -0.80901718 1.87428093 0.58778536 -0.58778536 1.87428093 0.80901712
		 -0.30901706 1.87428093 0.95105666 -2.9802322e-08 1.87428093 1.000000119209 1 1.87428093 0
		 0.9804464 1.86938655 -0.31856632 0.83401752 1.86938655 -0.60594916 0.60594916 1.86938655 -0.83401746
		 0.31856629 1.86938655 -0.98044628 0 1.86938655 -1.030902147 -0.31856629 1.86938655 -0.98044622
		 -0.60594904 1.86938655 -0.83401728 -0.83401722 1.86938655 -0.60594898 -0.98044604 1.86938655 -0.3185662
		 -1.030901909 1.86938655 0 -0.98044604 1.86938655 0.3185662 -0.83401716 1.86938655 0.60594893
		 -0.60594893 1.86938655 0.8340171 -0.3185662 1.86938655 0.98044592 -3.0723264e-08 1.86938655 1.03090179
		 1.03090167 1.86938655 0 1.0069588423 1.85518265 -0.32718074 0.85657042 1.85518265 -0.62233478
		 0.62233478 1.85518265 -0.8565703 0.32718071 1.85518265 -1.0069587231 0 1.85518265 -1.058779001
		 -0.32718071 1.85518265 -1.0069587231 -0.62233466 1.85518265 -0.85657012 -0.85657007 1.85518265 -0.6223346
		 -1.0069584846 1.85518265 -0.32718062 -1.058778763 1.85518265 0 -1.0069584846 1.85518265 0.32718062
		 -0.85657001 1.85518265 0.62233454 -0.62233454 1.85518265 0.85656995 -0.32718062 1.85518265 1.0069583654
		 -3.1554059e-08 1.85518265 1.058778644 1.058778524 1.85518265 0 1.027999282 1.83305943 -0.33401722
		 0.87446845 1.83305943 -0.63533849 0.63533849 1.83305943 -0.87446839 0.33401719 1.83305943 -1.027999163
		 0 1.83305943 -1.080902219 -0.33401719 1.83305943 -1.027999163 -0.63533837 1.83305943 -0.87446821
		 -0.87446815 1.83305943 -0.63533831 -1.027998924 1.83305943 -0.33401707 -1.08090198 1.83305943 0
		 -1.027998924 1.83305943 0.33401707 -0.87446809 1.83305943 0.63533825 -0.63533825 1.83305943 0.87446803
		 -0.33401707 1.83305943 1.027998805 -3.2213382e-08 1.83305943 1.080901861 1.080901742 1.83305943 0
		 1.041508079 1.80518258 -0.33840647 0.88595968 1.80518258 -0.64368731 0.64368731 1.80518258 -0.88595963
		 0.33840641 1.80518258 -1.041507959 0 1.80518258 -1.095106125 -0.33840641 1.80518258 -1.04150784
		 -0.64368719 1.80518258 -0.88595939 -0.88595933 1.80518258 -0.64368713 -1.041507602 1.80518258 -0.33840632
		 -1.095105886 1.80518258 0 -1.041507602 1.80518258 0.33840632 -0.88595927 1.80518258 0.64368707
		 -0.64368707 1.80518258 0.88595921 -0.33840632 1.80518258 1.041507483 -3.2636692e-08 1.80518258 1.095105767
		 1.095105648 1.80518258 0 1.046162844 1.77428091 -0.33991891 0.88991934 1.77428091 -0.64656419
		 0.64656419 1.77428091 -0.88991922 0.33991888 1.77428091 -1.046162724 0 1.77428091 -1.1000005
		 -0.33991888 1.77428091 -1.046162724 -0.64656407 1.77428091 -0.88991904 -0.88991898 1.77428091 -0.64656401
		 -1.046162486 1.77428091 -0.33991876 -1.10000026 1.77428091 0 -1.046162486 1.77428091 0.33991876
		 -0.88991892 1.77428091 0.64656389 -0.64656389 1.77428091 0.88991886 -0.33991876 1.77428091 1.046162367
		 -3.2782555e-08 1.77428091 1.10000014 1.10000002 1.77428091 0 1.041508079 1.74337924 -0.33840647
		 0.88595968 1.74337924 -0.64368731 0.64368731 1.74337924 -0.88595963 0.33840641 1.74337924 -1.041507959
		 0 1.74337924 -1.095106125 -0.33840641 1.74337924 -1.04150784 -0.64368719 1.74337924 -0.88595939
		 -0.88595933 1.74337924 -0.64368713 -1.041507602 1.74337924 -0.33840632 -1.095105886 1.74337924 0
		 -1.041507602 1.74337924 0.33840632 -0.88595927 1.74337924 0.64368707 -0.64368707 1.74337924 0.88595921
		 -0.33840632 1.74337924 1.041507483 -3.2636692e-08 1.74337924 1.095105767 1.095105648 1.74337924 0
		 1.027999282 1.71550238 -0.33401722 0.87446845 1.71550238 -0.63533849 0.63533849 1.71550238 -0.87446839
		 0.33401719 1.71550238 -1.027999163 0 1.71550238 -1.080902219 -0.33401719 1.71550238 -1.027999163
		 -0.63533837 1.71550238 -0.87446821 -0.87446815 1.71550238 -0.63533831 -1.027998924 1.71550238 -0.33401707
		 -1.08090198 1.71550238 0 -1.027998924 1.71550238 0.33401707 -0.87446809 1.71550238 0.63533825
		 -0.63533825 1.71550238 0.87446803 -0.33401707 1.71550238 1.027998805 -3.2213382e-08 1.71550238 1.080901861
		 1.080901742 1.71550238 0 1.0069588423 1.69337916 -0.32718074 0.85657042 1.69337916 -0.62233478
		 0.62233478 1.69337916 -0.8565703 0.32718071 1.69337916 -1.0069587231 0 1.69337916 -1.058779001
		 -0.32718071 1.69337916 -1.0069587231 -0.62233466 1.69337916 -0.85657012 -0.85657007 1.69337916 -0.6223346
		 -1.0069584846 1.69337916 -0.32718062 -1.058778763 1.69337916 0 -1.0069584846 1.69337916 0.32718062
		 -0.85657001 1.69337916 0.62233454 -0.62233454 1.69337916 0.85656995 -0.32718062 1.69337916 1.0069583654
		 -3.1554059e-08 1.69337916 1.058778644 1.058778524 1.69337916 0 0.9804464 1.67917526 -0.31856632
		 0.83401752 1.67917526 -0.60594916 0.60594916 1.67917526 -0.83401746 0.31856629 1.67917526 -0.98044628
		 0 1.67917526 -1.030902147 -0.31856629 1.67917526 -0.98044622 -0.60594904 1.67917526 -0.83401728
		 -0.83401722 1.67917526 -0.60594898 -0.98044604 1.67917526 -0.3185662 -1.030901909 1.67917526 0
		 -0.98044604 1.67917526 0.3185662 -0.83401716 1.67917526 0.60594893 -0.60594893 1.67917526 0.8340171
		 -0.3185662 1.67917526 0.98044592 -3.0723264e-08 1.67917526 1.03090179 1.03090167 1.67917526 0
		 0.95105714 1.67428088 -0.30901718 0.80901754 1.67428088 -0.5877856 0.5877856 1.67428088 -0.80901748
		 0.30901715 1.67428088 -0.95105702 0 1.67428088 -1.000000476837 -0.30901715 1.67428088 -0.95105696
		 -0.58778548 1.67428088 -0.8090173 -0.80901724 1.67428088 -0.58778542 -0.95105678 1.67428088 -0.30901706
		 -1.000000238419 1.67428088 0 -0.95105678 1.67428088 0.30901706;
	setAttr ".vt[332:497]" -0.80901718 1.67428088 0.58778536 -0.58778536 1.67428088 0.80901712
		 -0.30901706 1.67428088 0.95105666 -2.9802322e-08 1.67428088 1.000000119209 1 1.67428088 0
		 0.92166781 1.67917526 -0.29946801 0.7840175 1.67917526 -0.56962198 0.56962198 1.67917526 -0.78401744
		 0.29946798 1.67917526 -0.9216677 0 1.67917526 -0.96909875 -0.29946798 1.67917526 -0.92166764
		 -0.56962192 1.67917526 -0.78401726 -0.78401721 1.67917526 -0.56962186 -0.92166746 1.67917526 -0.29946789
		 -0.96909851 1.67917526 0 -0.92166746 1.67917526 0.29946789 -0.78401715 1.67917526 0.5696218
		 -0.5696218 1.67917526 0.78401709 -0.29946789 1.67917526 0.92166734 -2.8881379e-08 1.67917526 0.96909839
		 0.96909827 1.67917526 0 0.89515537 1.69337916 -0.29085359 0.76146466 1.69337916 -0.55323642
		 0.55323642 1.69337916 -0.7614646 0.29085356 1.69337916 -0.89515525 0 1.69337916 -0.94122189
		 -0.29085356 1.69337916 -0.89515519 -0.55323631 1.69337916 -0.76146442 -0.76146436 1.69337916 -0.55323625
		 -0.89515501 1.69337916 -0.29085347 -0.94122165 1.69337916 0 -0.89515501 1.69337916 0.29085347
		 -0.7614643 1.69337916 0.55323619 -0.55323619 1.69337916 0.76146424 -0.29085347 1.69337916 0.89515489
		 -2.8050584e-08 1.69337916 0.94122154 0.94122142 1.69337916 0 0.87411493 1.71550238 -0.28401715
		 0.74356663 1.71550238 -0.54023272 0.54023272 1.71550238 -0.74356657 0.28401712 1.71550238 -0.87411487
		 0 1.71550238 -0.91909868 -0.28401712 1.71550238 -0.87411481 -0.5402326 1.71550238 -0.74356639
		 -0.74356633 1.71550238 -0.54023254 -0.87411463 1.71550238 -0.28401706 -0.9190985 1.71550238 0
		 -0.87411463 1.71550238 0.28401706 -0.74356627 1.71550238 0.54023248 -0.54023248 1.71550238 0.74356622
		 -0.28401706 1.71550238 0.87411451 -2.7391263e-08 1.71550238 0.91909838 0.91909826 1.71550238 0
		 0.86060619 1.74337924 -0.27962789 0.73207533 1.74337924 -0.53188384 0.53188384 1.74337924 -0.73207527
		 0.27962786 1.74337924 -0.86060607 0 1.74337924 -0.90489471 -0.27962786 1.74337924 -0.86060601
		 -0.53188372 1.74337924 -0.73207515 -0.7320751 1.74337924 -0.53188366 -0.86060584 1.74337924 -0.27962777
		 -0.90489453 1.74337924 0 -0.86060584 1.74337924 0.27962777 -0.73207504 1.74337924 0.5318836
		 -0.5318836 1.74337924 0.73207498 -0.27962777 1.74337924 0.86060572 -2.6967951e-08 1.74337924 0.90489441
		 0.90489429 1.74337924 0 -0.0027888119 -2.087115288 0.89826292 -0.0027888119 -2.040351629 0.8064844
		 -0.0027888119 -1.96751583 0.7336486 -0.0027888119 -1.87573731 0.68688512 -0.0027888119 -1.77400005 0.67077154
		 -0.0027888119 -1.67226279 0.68688512 -0.0027888119 -1.58048427 0.73364866 -0.0027888119 -1.50764847 0.80648446
		 -0.0027888119 -1.46088505 0.89826298 -0.0027888119 -1.44477141 1.000000119209 -0.0027888119 -1.46088505 1.10173738
		 -0.0027888119 -1.50764859 1.19351578 -0.0027888119 -1.58048439 1.26635158 -0.0027888119 -1.67226279 1.31311512
		 -0.0027888119 -1.77400005 1.32922864 -0.0027888119 -1.87573719 1.313115 -0.0027888119 -1.96751571 1.26635158
		 -0.0027888119 -2.040351391 1.19351578 -0.0027888119 -2.087115049 1.10173738 -0.0027888119 -2.10322857 1.000000119209
		 0.45642692 -1.77400005 1.000000119209 0.45642692 -1.77425706 0.99991667 0.45642692 -1.77421868 0.99984133
		 0.45642692 -1.77415884 0.99978161 0.45642692 -1.7740835 0.99974322 0.45642692 -1.77400005 0.99972999
		 0.45642692 -1.7739166 0.99974322 0.45642692 -1.77384126 0.99978161 0.45642692 -1.77378142 0.99984133
		 0.45642692 -1.77374303 0.99991667 0.45642692 -1.7737298 1.000000119209 0.45642692 -1.77374303 1.000083565712
		 0.45642692 -1.77378142 1.00015890598 0.45642692 -1.77384126 1.00021874905 0.45642692 -1.7739166 1.00025713444
		 0.45642692 -1.77400005 1.00027036667 0.45642692 -1.7740835 1.00025713444 0.45642692 -1.77415884 1.00021874905
		 0.45642692 -1.77421868 1.00015890598 0.45642692 -1.77425706 1.000083565712 0.45642692 -1.7742703 1.000000119209
		 0.85595143 -1.77400005 -0.27811545 0.72811574 -1.77400005 -0.52900702 0.52900702 -1.77400005 -0.72811574
		 0.27811542 -1.77400005 -0.85595131 0 -1.77400005 -0.90000039 -0.27811542 -1.77400005 -0.85595125
		 -0.5290069 -1.77400005 -0.72811556 -0.7281155 -1.77400005 -0.52900684 -0.85595107 -1.77400005 -0.27811536
		 -0.90000021 -1.77400005 0 -0.85595107 -1.77400005 0.27811536 -0.72811544 -1.77400005 0.52900684
		 -0.52900684 -1.77400005 0.72811538 -0.27811536 -1.77400005 0.85595095 -2.6822089e-08 -1.77400005 0.9000001
		 0.89999998 -1.77400005 0 0.86060625 -1.74309838 -0.27962789 0.73207539 -1.74309838 -0.5318839
		 0.5318839 -1.74309838 -0.73207533 0.27962789 -1.74309838 -0.86060613 0 -1.74309838 -0.90489477
		 -0.27962789 -1.74309838 -0.86060607 -0.53188378 -1.74309838 -0.73207521 -0.73207515 -1.74309838 -0.53188372
		 -0.8606059 -1.74309838 -0.2796278 -0.90489459 -1.74309838 0 -0.8606059 -1.74309838 0.2796278
		 -0.7320751 -1.74309838 0.53188366 -0.53188366 -1.74309838 0.73207504 -0.2796278 -1.74309838 0.86060578
		 -2.6967953e-08 -1.74309838 0.90489447 0.90489435 -1.74309838 0 0.87411499 -1.71522152 -0.28401718
		 0.74356663 -1.71522152 -0.54023278 0.54023278 -1.71522152 -0.74356663 0.28401715 -1.71522152 -0.87411493
		 0 -1.71522152 -0.91909873 -0.28401715 -1.71522152 -0.87411487 -0.54023266 -1.71522152 -0.74356645
		 -0.74356639 -1.71522152 -0.5402326 -0.87411469 -1.71522152 -0.28401706 -0.91909856 -1.71522152 0
		 -0.87411469 -1.71522152 0.28401706 -0.74356633 -1.71522152 0.54023254 -0.54023254 -1.71522152 0.74356627
		 -0.28401706 -1.71522152 0.87411457 -2.7391264e-08 -1.71522152 0.91909844 0.91909832 -1.71522152 0
		 0.89515543 -1.69309831 -0.29085362 0.76146466 -1.69309831 -0.55323642 0.55323642 -1.69309831 -0.76146466
		 0.29085359 -1.69309831 -0.89515531 0 -1.69309831 -0.94122195 -0.29085359 -1.69309831 -0.89515525
		 -0.55323631 -1.69309831 -0.76146448 -0.76146442 -1.69309831 -0.55323625;
	setAttr ".vt[498:663]" -0.89515507 -1.69309831 -0.2908535 -0.94122171 -1.69309831 0
		 -0.89515507 -1.69309831 0.2908535 -0.76146436 -1.69309831 0.55323619 -0.55323619 -1.69309831 0.7614643
		 -0.2908535 -1.69309831 0.89515495 -2.8050586e-08 -1.69309831 0.94122159 0.94122148 -1.69309831 0
		 0.92166787 -1.6788944 -0.29946804 0.78401756 -1.6788944 -0.56962204 0.56962204 -1.6788944 -0.7840175
		 0.29946801 -1.6788944 -0.92166775 0 -1.6788944 -0.96909881 -0.29946801 -1.6788944 -0.9216677
		 -0.56962192 -1.6788944 -0.78401732 -0.78401726 -1.6788944 -0.56962186 -0.92166752 -1.6788944 -0.29946792
		 -0.96909857 -1.6788944 0 -0.92166752 -1.6788944 0.29946792 -0.78401721 -1.6788944 0.5696218
		 -0.5696218 -1.6788944 0.78401715 -0.29946792 -1.6788944 0.9216674 -2.8881381e-08 -1.6788944 0.96909845
		 0.96909833 -1.6788944 0 0.95105714 -1.67400002 -0.30901718 0.80901754 -1.67400002 -0.5877856
		 0.5877856 -1.67400002 -0.80901748 0.30901715 -1.67400002 -0.95105702 0 -1.67400002 -1.000000476837
		 -0.30901715 -1.67400002 -0.95105696 -0.58778548 -1.67400002 -0.8090173 -0.80901724 -1.67400002 -0.58778542
		 -0.95105678 -1.67400002 -0.30901706 -1.000000238419 -1.67400002 0 -0.95105678 -1.67400002 0.30901706
		 -0.80901718 -1.67400002 0.58778536 -0.58778536 -1.67400002 0.80901712 -0.30901706 -1.67400002 0.95105666
		 -2.9802322e-08 -1.67400002 1.000000119209 1 -1.67400002 0 0.9804464 -1.6788944 -0.31856632
		 0.83401752 -1.6788944 -0.60594916 0.60594916 -1.6788944 -0.83401746 0.31856629 -1.6788944 -0.98044628
		 0 -1.6788944 -1.030902147 -0.31856629 -1.6788944 -0.98044622 -0.60594904 -1.6788944 -0.83401728
		 -0.83401722 -1.6788944 -0.60594898 -0.98044604 -1.6788944 -0.3185662 -1.030901909 -1.6788944 0
		 -0.98044604 -1.6788944 0.3185662 -0.83401716 -1.6788944 0.60594893 -0.60594893 -1.6788944 0.8340171
		 -0.3185662 -1.6788944 0.98044592 -3.0723264e-08 -1.6788944 1.03090179 1.03090167 -1.6788944 0
		 1.0069588423 -1.69309831 -0.32718074 0.85657042 -1.69309831 -0.62233478 0.62233478 -1.69309831 -0.8565703
		 0.32718071 -1.69309831 -1.0069587231 0 -1.69309831 -1.058779001 -0.32718071 -1.69309831 -1.0069587231
		 -0.62233466 -1.69309831 -0.85657012 -0.85657007 -1.69309831 -0.6223346 -1.0069584846 -1.69309831 -0.32718062
		 -1.058778763 -1.69309831 0 -1.0069584846 -1.69309831 0.32718062 -0.85657001 -1.69309831 0.62233454
		 -0.62233454 -1.69309831 0.85656995 -0.32718062 -1.69309831 1.0069583654 -3.1554059e-08 -1.69309831 1.058778644
		 1.058778524 -1.69309831 0 1.027999282 -1.71522152 -0.33401722 0.87446845 -1.71522152 -0.63533849
		 0.63533849 -1.71522152 -0.87446839 0.33401719 -1.71522152 -1.027999163 0 -1.71522152 -1.080902219
		 -0.33401719 -1.71522152 -1.027999163 -0.63533837 -1.71522152 -0.87446821 -0.87446815 -1.71522152 -0.63533831
		 -1.027998924 -1.71522152 -0.33401707 -1.08090198 -1.71522152 0 -1.027998924 -1.71522152 0.33401707
		 -0.87446809 -1.71522152 0.63533825 -0.63533825 -1.71522152 0.87446803 -0.33401707 -1.71522152 1.027998805
		 -3.2213382e-08 -1.71522152 1.080901861 1.080901742 -1.71522152 0 1.041508079 -1.74309838 -0.33840647
		 0.88595968 -1.74309838 -0.64368731 0.64368731 -1.74309838 -0.88595963 0.33840641 -1.74309838 -1.041507959
		 0 -1.74309838 -1.095106125 -0.33840641 -1.74309838 -1.04150784 -0.64368719 -1.74309838 -0.88595939
		 -0.88595933 -1.74309838 -0.64368713 -1.041507602 -1.74309838 -0.33840632 -1.095105886 -1.74309838 0
		 -1.041507602 -1.74309838 0.33840632 -0.88595927 -1.74309838 0.64368707 -0.64368707 -1.74309838 0.88595921
		 -0.33840632 -1.74309838 1.041507483 -3.2636692e-08 -1.74309838 1.095105767 1.095105648 -1.74309838 0
		 1.046162844 -1.77400005 -0.33991891 0.88991934 -1.77400005 -0.64656419 0.64656419 -1.77400005 -0.88991922
		 0.33991888 -1.77400005 -1.046162724 0 -1.77400005 -1.1000005 -0.33991888 -1.77400005 -1.046162724
		 -0.64656407 -1.77400005 -0.88991904 -0.88991898 -1.77400005 -0.64656401 -1.046162486 -1.77400005 -0.33991876
		 -1.10000026 -1.77400005 0 -1.046162486 -1.77400005 0.33991876 -0.88991892 -1.77400005 0.64656389
		 -0.64656389 -1.77400005 0.88991886 -0.33991876 -1.77400005 1.046162367 -3.2782555e-08 -1.77400005 1.10000014
		 1.10000002 -1.77400005 0 1.041508079 -1.80490172 -0.33840647 0.88595968 -1.80490172 -0.64368731
		 0.64368731 -1.80490172 -0.88595963 0.33840641 -1.80490172 -1.041507959 0 -1.80490172 -1.095106125
		 -0.33840641 -1.80490172 -1.04150784 -0.64368719 -1.80490172 -0.88595939 -0.88595933 -1.80490172 -0.64368713
		 -1.041507602 -1.80490172 -0.33840632 -1.095105886 -1.80490172 0 -1.041507602 -1.80490172 0.33840632
		 -0.88595927 -1.80490172 0.64368707 -0.64368707 -1.80490172 0.88595921 -0.33840632 -1.80490172 1.041507483
		 -3.2636692e-08 -1.80490172 1.095105767 1.095105648 -1.80490172 0 1.027999282 -1.83277857 -0.33401722
		 0.87446845 -1.83277857 -0.63533849 0.63533849 -1.83277857 -0.87446839 0.33401719 -1.83277857 -1.027999163
		 0 -1.83277857 -1.080902219 -0.33401719 -1.83277857 -1.027999163 -0.63533837 -1.83277857 -0.87446821
		 -0.87446815 -1.83277857 -0.63533831 -1.027998924 -1.83277857 -0.33401707 -1.08090198 -1.83277857 0
		 -1.027998924 -1.83277857 0.33401707 -0.87446809 -1.83277857 0.63533825 -0.63533825 -1.83277857 0.87446803
		 -0.33401707 -1.83277857 1.027998805 -3.2213382e-08 -1.83277857 1.080901861 1.080901742 -1.83277857 0
		 1.0069588423 -1.85490179 -0.32718074 0.85657042 -1.85490179 -0.62233478 0.62233478 -1.85490179 -0.8565703
		 0.32718071 -1.85490179 -1.0069587231 0 -1.85490179 -1.058779001 -0.32718071 -1.85490179 -1.0069587231
		 -0.62233466 -1.85490179 -0.85657012 -0.85657007 -1.85490179 -0.6223346 -1.0069584846 -1.85490179 -0.32718062
		 -1.058778763 -1.85490179 0 -1.0069584846 -1.85490179 0.32718062 -0.85657001 -1.85490179 0.62233454
		 -0.62233454 -1.85490179 0.85656995 -0.32718062 -1.85490179 1.0069583654;
	setAttr ".vt[664:761]" -3.1554059e-08 -1.85490179 1.058778644 1.058778524 -1.85490179 0
		 0.9804464 -1.8691057 -0.31856632 0.83401752 -1.8691057 -0.60594916 0.60594916 -1.8691057 -0.83401746
		 0.31856629 -1.8691057 -0.98044628 0 -1.8691057 -1.030902147 -0.31856629 -1.8691057 -0.98044622
		 -0.60594904 -1.8691057 -0.83401728 -0.83401722 -1.8691057 -0.60594898 -0.98044604 -1.8691057 -0.3185662
		 -1.030901909 -1.8691057 0 -0.98044604 -1.8691057 0.3185662 -0.83401716 -1.8691057 0.60594893
		 -0.60594893 -1.8691057 0.8340171 -0.3185662 -1.8691057 0.98044592 -3.0723264e-08 -1.8691057 1.03090179
		 1.03090167 -1.8691057 0 0.95105714 -1.87400007 -0.30901718 0.80901754 -1.87400007 -0.5877856
		 0.5877856 -1.87400007 -0.80901748 0.30901715 -1.87400007 -0.95105702 0 -1.87400007 -1.000000476837
		 -0.30901715 -1.87400007 -0.95105696 -0.58778548 -1.87400007 -0.8090173 -0.80901724 -1.87400007 -0.58778542
		 -0.95105678 -1.87400007 -0.30901706 -1.000000238419 -1.87400007 0 -0.95105678 -1.87400007 0.30901706
		 -0.80901718 -1.87400007 0.58778536 -0.58778536 -1.87400007 0.80901712 -0.30901706 -1.87400007 0.95105666
		 -2.9802322e-08 -1.87400007 1.000000119209 1 -1.87400007 0 0.92166781 -1.8691057 -0.29946801
		 0.7840175 -1.8691057 -0.56962198 0.56962198 -1.8691057 -0.78401744 0.29946798 -1.8691057 -0.9216677
		 0 -1.8691057 -0.96909875 -0.29946798 -1.8691057 -0.92166764 -0.56962192 -1.8691057 -0.78401726
		 -0.78401721 -1.8691057 -0.56962186 -0.92166746 -1.8691057 -0.29946789 -0.96909851 -1.8691057 0
		 -0.92166746 -1.8691057 0.29946789 -0.78401715 -1.8691057 0.5696218 -0.5696218 -1.8691057 0.78401709
		 -0.29946789 -1.8691057 0.92166734 -2.8881379e-08 -1.8691057 0.96909839 0.96909827 -1.8691057 0
		 0.89515537 -1.85490179 -0.29085359 0.76146466 -1.85490179 -0.55323642 0.55323642 -1.85490179 -0.7614646
		 0.29085356 -1.85490179 -0.89515525 0 -1.85490179 -0.94122189 -0.29085356 -1.85490179 -0.89515519
		 -0.55323631 -1.85490179 -0.76146442 -0.76146436 -1.85490179 -0.55323625 -0.89515501 -1.85490179 -0.29085347
		 -0.94122165 -1.85490179 0 -0.89515501 -1.85490179 0.29085347 -0.7614643 -1.85490179 0.55323619
		 -0.55323619 -1.85490179 0.76146424 -0.29085347 -1.85490179 0.89515489 -2.8050584e-08 -1.85490179 0.94122154
		 0.94122142 -1.85490179 0 0.87411493 -1.83277857 -0.28401715 0.74356663 -1.83277857 -0.54023272
		 0.54023272 -1.83277857 -0.74356657 0.28401712 -1.83277857 -0.87411487 0 -1.83277857 -0.91909868
		 -0.28401712 -1.83277857 -0.87411481 -0.5402326 -1.83277857 -0.74356639 -0.74356633 -1.83277857 -0.54023254
		 -0.87411463 -1.83277857 -0.28401706 -0.9190985 -1.83277857 0 -0.87411463 -1.83277857 0.28401706
		 -0.74356627 -1.83277857 0.54023248 -0.54023248 -1.83277857 0.74356622 -0.28401706 -1.83277857 0.87411451
		 -2.7391263e-08 -1.83277857 0.91909838 0.91909826 -1.83277857 0 0.86060619 -1.80490172 -0.27962789
		 0.73207533 -1.80490172 -0.53188384 0.53188384 -1.80490172 -0.73207527 0.27962786 -1.80490172 -0.86060607
		 0 -1.80490172 -0.90489471 -0.27962786 -1.80490172 -0.86060601 -0.53188372 -1.80490172 -0.73207515
		 -0.7320751 -1.80490172 -0.53188366 -0.86060584 -1.80490172 -0.27962777 -0.90489453 -1.80490172 0
		 -0.86060584 -1.80490172 0.27962777 -0.73207504 -1.80490172 0.5318836 -0.5318836 -1.80490172 0.73207498
		 -0.27962777 -1.80490172 0.86060572 -2.6967951e-08 -1.80490172 0.90489441 0.90489429 -1.80490172 0;
	setAttr -s 1494 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0 7 8 0 8 9 0
		 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0 18 19 0 19 0 0
		 20 21 0 21 22 0 22 23 0 23 24 0 24 25 0 25 26 0 26 27 0 27 28 0 28 29 0 29 30 0 30 31 0
		 31 32 0 32 33 0 33 34 0 34 35 0 35 36 0 36 37 0 37 38 0 38 39 0 39 20 0 0 20 1 1 21 1
		 2 22 1 3 23 1 4 24 1 5 25 1 6 26 1 7 27 1 8 28 1 9 29 1 10 30 1 11 31 1 12 32 1 13 33 1
		 14 34 1 15 35 1 16 36 1 17 37 1 18 38 1 19 39 1 40 41 0 41 42 0 42 43 0 43 44 0 44 45 0
		 45 46 0 46 47 0 47 48 0 48 49 0 49 50 0 50 51 0 51 52 0 52 53 0 53 54 0 54 55 0 55 56 0
		 56 57 0 57 58 0 58 59 0 59 40 0 40 61 1 41 62 1 42 63 1 43 64 1 44 65 1 45 66 1 46 67 1
		 47 68 1 48 69 1 49 70 1 50 71 1 51 72 1 52 73 1 53 74 1 54 75 1 55 76 1 56 77 1 57 78 1
		 58 79 1 59 80 1 61 60 0 62 60 0 63 60 0 64 60 0 65 60 0 66 60 0 67 60 0 68 60 0 69 60 0
		 70 60 0 71 60 0 72 60 0 73 60 0 74 60 0 75 60 0 76 60 0 77 60 0 78 60 0 79 60 0 80 60 0
		 62 61 0 63 62 0 64 63 0 65 64 0 66 65 0 67 66 0 68 67 0 69 68 0 70 69 0 71 70 0 72 71 0
		 73 72 0 74 73 0 75 74 0 76 75 0 77 76 0 78 77 0 79 78 0 80 79 0 61 80 0 81 82 1 82 83 1
		 83 84 1 84 85 1 85 86 1 86 87 1 87 88 1 88 89 1 89 90 1 90 91 1 91 92 1 92 93 1 93 94 1
		 94 95 1 96 81 1 97 98 1 98 99 1 99 100 1 100 101 1 101 102 1 102 103 1 103 104 1
		 104 105 1 105 106 1 106 107 1 107 108 1;
	setAttr ".ed[166:331]" 108 109 1 109 110 1 110 111 1 112 97 1 113 114 1 114 115 1
		 115 116 1 116 117 1 117 118 1 118 119 1 119 120 1 120 121 1 121 122 1 122 123 1 123 124 1
		 124 125 1 125 126 1 126 127 1 128 113 1 129 130 1 130 131 1 131 132 1 132 133 1 133 134 1
		 134 135 1 135 136 1 136 137 1 137 138 1 138 139 1 139 140 1 140 141 1 141 142 1 142 143 1
		 144 129 1 145 146 1 146 147 1 147 148 1 148 149 1 149 150 1 150 151 1 151 152 1 152 153 1
		 153 154 1 154 155 1 155 156 1 156 157 1 157 158 1 158 159 1 160 145 1 161 162 1 162 163 1
		 163 164 1 164 165 1 165 166 1 166 167 1 167 168 1 168 169 1 169 170 1 170 171 1 171 172 1
		 172 173 1 173 174 1 174 175 1 176 161 1 177 178 1 178 179 1 179 180 1 180 181 1 181 182 1
		 182 183 1 183 184 1 184 185 1 185 186 1 186 187 1 187 188 1 188 189 1 189 190 1 190 191 1
		 192 177 1 193 194 1 194 195 1 195 196 1 196 197 1 197 198 1 198 199 1 199 200 1 200 201 1
		 201 202 1 202 203 1 203 204 1 204 205 1 205 206 1 206 207 1 208 193 1 209 210 1 210 211 1
		 211 212 1 212 213 1 213 214 1 214 215 1 215 216 1 216 217 1 217 218 1 218 219 1 219 220 1
		 220 221 1 221 222 1 222 223 1 224 209 1 225 226 1 226 227 1 227 228 1 228 229 1 229 230 1
		 230 231 1 231 232 1 232 233 1 233 234 1 234 235 1 235 236 1 236 237 1 237 238 1 238 239 1
		 240 225 1 241 242 1 242 243 1 243 244 1 244 245 1 245 246 1 246 247 1 247 248 1 248 249 1
		 249 250 1 250 251 1 251 252 1 252 253 1 253 254 1 254 255 1 256 241 1 257 258 1 258 259 1
		 259 260 1 260 261 1 261 262 1 262 263 1 263 264 1 264 265 1 265 266 1 266 267 1 267 268 1
		 268 269 1 269 270 1 270 271 1 272 257 1 273 274 1 274 275 1 275 276 1 276 277 1 277 278 1
		 278 279 1 279 280 1 280 281 1 281 282 1 282 283 1 283 284 1 284 285 1;
	setAttr ".ed[332:497]" 285 286 1 286 287 1 288 273 1 289 290 1 290 291 1 291 292 1
		 292 293 1 293 294 1 294 295 1 295 296 1 296 297 1 297 298 1 298 299 1 299 300 1 300 301 1
		 301 302 1 302 303 1 304 289 1 305 306 1 306 307 1 307 308 1 308 309 1 309 310 1 310 311 1
		 311 312 1 312 313 1 313 314 1 314 315 1 315 316 1 316 317 1 317 318 1 318 319 1 320 305 1
		 321 322 1 322 323 1 323 324 1 324 325 1 325 326 1 326 327 1 327 328 1 328 329 1 329 330 1
		 330 331 1 331 332 1 332 333 1 333 334 1 334 335 1 336 321 1 337 338 1 338 339 1 339 340 1
		 340 341 1 341 342 1 342 343 1 343 344 1 344 345 1 345 346 1 346 347 1 347 348 1 348 349 1
		 349 350 1 350 351 1 352 337 1 353 354 1 354 355 1 355 356 1 356 357 1 357 358 1 358 359 1
		 359 360 1 360 361 1 361 362 1 362 363 1 363 364 1 364 365 1 365 366 1 366 367 1 368 353 1
		 369 370 1 370 371 1 371 372 1 372 373 1 373 374 1 374 375 1 375 376 1 376 377 1 377 378 1
		 378 379 1 379 380 1 380 381 1 381 382 1 382 383 1 384 369 1 385 386 1 386 387 1 387 388 1
		 388 389 1 389 390 1 390 391 1 391 392 1 392 393 1 393 394 1 394 395 1 395 396 1 396 397 1
		 397 398 1 398 399 1 400 385 1 81 97 1 82 98 1 83 99 1 84 100 1 85 101 1 86 102 1
		 87 103 1 88 104 1 89 105 1 90 106 1 91 107 1 92 108 1 93 109 1 94 110 1 95 111 0
		 96 112 0 97 113 1 98 114 1 99 115 1 100 116 1 101 117 1 102 118 1 103 119 1 104 120 1
		 105 121 1 106 122 1 107 123 1 108 124 1 109 125 1 110 126 1 111 127 0 112 128 0 113 129 1
		 114 130 1 115 131 1 116 132 1 117 133 1 118 134 1 119 135 1 120 136 1 121 137 1 122 138 1
		 123 139 1 124 140 1 125 141 1 126 142 1 127 143 0 128 144 0 129 145 1 130 146 1 131 147 1
		 132 148 1 133 149 1 134 150 1 135 151 1 136 152 1 137 153 1 138 154 1;
	setAttr ".ed[498:663]" 139 155 1 140 156 1 141 157 1 142 158 1 143 159 0 144 160 0
		 145 161 1 146 162 1 147 163 1 148 164 1 149 165 1 150 166 1 151 167 1 152 168 1 153 169 1
		 154 170 1 155 171 1 156 172 1 157 173 1 158 174 1 159 175 0 160 176 0 161 177 1 162 178 1
		 163 179 1 164 180 1 165 181 1 166 182 1 167 183 1 168 184 1 169 185 1 170 186 1 171 187 1
		 172 188 1 173 189 1 174 190 1 175 191 0 176 192 0 177 193 1 178 194 1 179 195 1 180 196 1
		 181 197 1 182 198 1 183 199 1 184 200 1 185 201 1 186 202 1 187 203 1 188 204 1 189 205 1
		 190 206 1 191 207 0 192 208 0 193 209 1 194 210 1 195 211 1 196 212 1 197 213 1 198 214 1
		 199 215 1 200 216 1 201 217 1 202 218 1 203 219 1 204 220 1 205 221 1 206 222 1 207 223 0
		 208 224 0 209 225 1 210 226 1 211 227 1 212 228 1 213 229 1 214 230 1 215 231 1 216 232 1
		 217 233 1 218 234 1 219 235 1 220 236 1 221 237 1 222 238 1 223 239 0 224 240 0 225 241 1
		 226 242 1 227 243 1 228 244 1 229 245 1 230 246 1 231 247 1 232 248 1 233 249 1 234 250 1
		 235 251 1 236 252 1 237 253 1 238 254 1 239 255 0 240 256 0 241 257 1 242 258 1 243 259 1
		 244 260 1 245 261 1 246 262 1 247 263 1 248 264 1 249 265 1 250 266 1 251 267 1 252 268 1
		 253 269 1 254 270 1 255 271 0 256 272 0 257 273 1 258 274 1 259 275 1 260 276 1 261 277 1
		 262 278 1 263 279 1 264 280 1 265 281 1 266 282 1 267 283 1 268 284 1 269 285 1 270 286 1
		 271 287 0 272 288 0 273 289 1 274 290 1 275 291 1 276 292 1 277 293 1 278 294 1 279 295 1
		 280 296 1 281 297 1 282 298 1 283 299 1 284 300 1 285 301 1 286 302 1 287 303 0 288 304 0
		 289 305 1 290 306 1 291 307 1 292 308 1 293 309 1 294 310 1 295 311 1 296 312 1 297 313 1
		 298 314 1 299 315 1 300 316 1 301 317 1 302 318 1 303 319 0 304 320 0;
	setAttr ".ed[664:829]" 305 321 1 306 322 1 307 323 1 308 324 1 309 325 1 310 326 1
		 311 327 1 312 328 1 313 329 1 314 330 1 315 331 1 316 332 1 317 333 1 318 334 1 319 335 0
		 320 336 0 321 337 1 322 338 1 323 339 1 324 340 1 325 341 1 326 342 1 327 343 1 328 344 1
		 329 345 1 330 346 1 331 347 1 332 348 1 333 349 1 334 350 1 335 351 0 336 352 0 337 353 1
		 338 354 1 339 355 1 340 356 1 341 357 1 342 358 1 343 359 1 344 360 1 345 361 1 346 362 1
		 347 363 1 348 364 1 349 365 1 350 366 1 351 367 0 352 368 0 353 369 1 354 370 1 355 371 1
		 356 372 1 357 373 1 358 374 1 359 375 1 360 376 1 361 377 1 362 378 1 363 379 1 364 380 1
		 365 381 1 366 382 1 367 383 0 368 384 0 369 385 1 370 386 1 371 387 1 372 388 1 373 389 1
		 374 390 1 375 391 1 376 392 1 377 393 1 378 394 1 379 395 1 380 396 1 381 397 1 382 398 1
		 383 399 0 384 400 0 385 81 1 386 82 1 387 83 1 388 84 1 389 85 1 390 86 1 391 87 1
		 392 88 1 393 89 1 394 90 1 395 91 1 396 92 1 397 93 1 398 94 1 399 95 0 400 96 0
		 160 352 0 336 176 0 320 192 0 304 208 0 288 224 0 272 240 0 144 368 0 128 384 0 112 400 0
		 191 303 0 319 175 0 335 159 0 207 287 0 223 271 0 351 143 0 367 127 0 383 111 0 401 402 0
		 402 403 0 403 404 0 404 405 0 405 406 0 406 407 0 407 408 0 408 409 0 409 410 0 410 411 0
		 411 412 0 412 413 0 413 414 0 414 415 0 415 416 0 416 417 0 417 418 0 418 419 0 419 420 0
		 420 401 0 401 422 1 402 423 1 403 424 1 404 425 1 405 426 1 406 427 1 407 428 1 408 429 1
		 409 430 1 410 431 1 411 432 1 412 433 1 413 434 1 414 435 1 415 436 1 416 437 1 417 438 1
		 418 439 1 419 440 1 420 441 1 422 421 0 423 421 0 424 421 0 425 421 0 426 421 0 427 421 0
		 428 421 0 429 421 0 430 421 0 431 421 0 432 421 0 433 421 0 434 421 0;
	setAttr ".ed[830:995]" 435 421 0 436 421 0 437 421 0 438 421 0 439 421 0 440 421 0
		 441 421 0 423 422 0 424 423 0 425 424 0 426 425 0 427 426 0 428 427 0 429 428 0 430 429 0
		 431 430 0 432 431 0 433 432 0 434 433 0 435 434 0 436 435 0 437 436 0 438 437 0 439 438 0
		 440 439 0 441 440 0 422 441 0 442 443 1 443 444 1 444 445 1 445 446 1 446 447 1 447 448 1
		 448 449 1 449 450 1 450 451 1 451 452 1 452 453 1 453 454 1 454 455 1 455 456 1 457 442 1
		 458 459 1 459 460 1 460 461 1 461 462 1 462 463 1 463 464 1 464 465 1 465 466 1 466 467 1
		 467 468 1 468 469 1 469 470 1 470 471 1 471 472 1 473 458 1 474 475 1 475 476 1 476 477 1
		 477 478 1 478 479 1 479 480 1 480 481 1 481 482 1 482 483 1 483 484 1 484 485 1 485 486 1
		 486 487 1 487 488 1 489 474 1 490 491 1 491 492 1 492 493 1 493 494 1 494 495 1 495 496 1
		 496 497 1 497 498 1 498 499 1 499 500 1 500 501 1 501 502 1 502 503 1 503 504 1 505 490 1
		 506 507 1 507 508 1 508 509 1 509 510 1 510 511 1 511 512 1 512 513 1 513 514 1 514 515 1
		 515 516 1 516 517 1 517 518 1 518 519 1 519 520 1 521 506 1 522 523 1 523 524 1 524 525 1
		 525 526 1 526 527 1 527 528 1 528 529 1 529 530 1 530 531 1 531 532 1 532 533 1 533 534 1
		 534 535 1 535 536 1 537 522 1 538 539 1 539 540 1 540 541 1 541 542 1 542 543 1 543 544 1
		 544 545 1 545 546 1 546 547 1 547 548 1 548 549 1 549 550 1 550 551 1 551 552 1 553 538 1
		 554 555 1 555 556 1 556 557 1 557 558 1 558 559 1 559 560 1 560 561 1 561 562 1 562 563 1
		 563 564 1 564 565 1 565 566 1 566 567 1 567 568 1 569 554 1 570 571 1 571 572 1 572 573 1
		 573 574 1 574 575 1 575 576 1 576 577 1 577 578 1 578 579 1 579 580 1 580 581 1 581 582 1
		 582 583 1 583 584 1 585 570 1 586 587 1 587 588 1 588 589 1 589 590 1;
	setAttr ".ed[996:1161]" 590 591 1 591 592 1 592 593 1 593 594 1 594 595 1 595 596 1
		 596 597 1 597 598 1 598 599 1 599 600 1 601 586 1 602 603 1 603 604 1 604 605 1 605 606 1
		 606 607 1 607 608 1 608 609 1 609 610 1 610 611 1 611 612 1 612 613 1 613 614 1 614 615 1
		 615 616 1 617 602 1 618 619 1 619 620 1 620 621 1 621 622 1 622 623 1 623 624 1 624 625 1
		 625 626 1 626 627 1 627 628 1 628 629 1 629 630 1 630 631 1 631 632 1 633 618 1 634 635 1
		 635 636 1 636 637 1 637 638 1 638 639 1 639 640 1 640 641 1 641 642 1 642 643 1 643 644 1
		 644 645 1 645 646 1 646 647 1 647 648 1 649 634 1 650 651 1 651 652 1 652 653 1 653 654 1
		 654 655 1 655 656 1 656 657 1 657 658 1 658 659 1 659 660 1 660 661 1 661 662 1 662 663 1
		 663 664 1 665 650 1 666 667 1 667 668 1 668 669 1 669 670 1 670 671 1 671 672 1 672 673 1
		 673 674 1 674 675 1 675 676 1 676 677 1 677 678 1 678 679 1 679 680 1 681 666 1 682 683 1
		 683 684 1 684 685 1 685 686 1 686 687 1 687 688 1 688 689 1 689 690 1 690 691 1 691 692 1
		 692 693 1 693 694 1 694 695 1 695 696 1 697 682 1 698 699 1 699 700 1 700 701 1 701 702 1
		 702 703 1 703 704 1 704 705 1 705 706 1 706 707 1 707 708 1 708 709 1 709 710 1 710 711 1
		 711 712 1 713 698 1 714 715 1 715 716 1 716 717 1 717 718 1 718 719 1 719 720 1 720 721 1
		 721 722 1 722 723 1 723 724 1 724 725 1 725 726 1 726 727 1 727 728 1 729 714 1 730 731 1
		 731 732 1 732 733 1 733 734 1 734 735 1 735 736 1 736 737 1 737 738 1 738 739 1 739 740 1
		 740 741 1 741 742 1 742 743 1 743 744 1 745 730 1 746 747 1 747 748 1 748 749 1 749 750 1
		 750 751 1 751 752 1 752 753 1 753 754 1 754 755 1 755 756 1 756 757 1 757 758 1 758 759 1
		 759 760 1 761 746 1 442 458 1 443 459 1 444 460 1 445 461 1 446 462 1;
	setAttr ".ed[1162:1327]" 447 463 1 448 464 1 449 465 1 450 466 1 451 467 1 452 468 1
		 453 469 1 454 470 1 455 471 1 456 472 0 457 473 0 458 474 1 459 475 1 460 476 1 461 477 1
		 462 478 1 463 479 1 464 480 1 465 481 1 466 482 1 467 483 1 468 484 1 469 485 1 470 486 1
		 471 487 1 472 488 0 473 489 0 474 490 1 475 491 1 476 492 1 477 493 1 478 494 1 479 495 1
		 480 496 1 481 497 1 482 498 1 483 499 1 484 500 1 485 501 1 486 502 1 487 503 1 488 504 0
		 489 505 0 490 506 1 491 507 1 492 508 1 493 509 1 494 510 1 495 511 1 496 512 1 497 513 1
		 498 514 1 499 515 1 500 516 1 501 517 1 502 518 1 503 519 1 504 520 0 505 521 0 506 522 1
		 507 523 1 508 524 1 509 525 1 510 526 1 511 527 1 512 528 1 513 529 1 514 530 1 515 531 1
		 516 532 1 517 533 1 518 534 1 519 535 1 520 536 0 521 537 0 522 538 1 523 539 1 524 540 1
		 525 541 1 526 542 1 527 543 1 528 544 1 529 545 1 530 546 1 531 547 1 532 548 1 533 549 1
		 534 550 1 535 551 1 536 552 0 537 553 0 538 554 1 539 555 1 540 556 1 541 557 1 542 558 1
		 543 559 1 544 560 1 545 561 1 546 562 1 547 563 1 548 564 1 549 565 1 550 566 1 551 567 1
		 552 568 0 553 569 0 554 570 1 555 571 1 556 572 1 557 573 1 558 574 1 559 575 1 560 576 1
		 561 577 1 562 578 1 563 579 1 564 580 1 565 581 1 566 582 1 567 583 1 568 584 0 569 585 0
		 570 586 1 571 587 1 572 588 1 573 589 1 574 590 1 575 591 1 576 592 1 577 593 1 578 594 1
		 579 595 1 580 596 1 581 597 1 582 598 1 583 599 1 584 600 0 585 601 0 586 602 1 587 603 1
		 588 604 1 589 605 1 590 606 1 591 607 1 592 608 1 593 609 1 594 610 1 595 611 1 596 612 1
		 597 613 1 598 614 1 599 615 1 600 616 0 601 617 0 602 618 1 603 619 1 604 620 1 605 621 1
		 606 622 1 607 623 1 608 624 1 609 625 1 610 626 1 611 627 1 612 628 1;
	setAttr ".ed[1328:1493]" 613 629 1 614 630 1 615 631 1 616 632 0 617 633 0 618 634 1
		 619 635 1 620 636 1 621 637 1 622 638 1 623 639 1 624 640 1 625 641 1 626 642 1 627 643 1
		 628 644 1 629 645 1 630 646 1 631 647 1 632 648 0 633 649 0 634 650 1 635 651 1 636 652 1
		 637 653 1 638 654 1 639 655 1 640 656 1 641 657 1 642 658 1 643 659 1 644 660 1 645 661 1
		 646 662 1 647 663 1 648 664 0 649 665 0 650 666 1 651 667 1 652 668 1 653 669 1 654 670 1
		 655 671 1 656 672 1 657 673 1 658 674 1 659 675 1 660 676 1 661 677 1 662 678 1 663 679 1
		 664 680 0 665 681 0 666 682 1 667 683 1 668 684 1 669 685 1 670 686 1 671 687 1 672 688 1
		 673 689 1 674 690 1 675 691 1 676 692 1 677 693 1 678 694 1 679 695 1 680 696 0 681 697 0
		 682 698 1 683 699 1 684 700 1 685 701 1 686 702 1 687 703 1 688 704 1 689 705 1 690 706 1
		 691 707 1 692 708 1 693 709 1 694 710 1 695 711 1 696 712 0 697 713 0 698 714 1 699 715 1
		 700 716 1 701 717 1 702 718 1 703 719 1 704 720 1 705 721 1 706 722 1 707 723 1 708 724 1
		 709 725 1 710 726 1 711 727 1 712 728 0 713 729 0 714 730 1 715 731 1 716 732 1 717 733 1
		 718 734 1 719 735 1 720 736 1 721 737 1 722 738 1 723 739 1 724 740 1 725 741 1 726 742 1
		 727 743 1 728 744 0 729 745 0 730 746 1 731 747 1 732 748 1 733 749 1 734 750 1 735 751 1
		 736 752 1 737 753 1 738 754 1 739 755 1 740 756 1 741 757 1 742 758 1 743 759 1 744 760 0
		 745 761 0 746 442 1 747 443 1 748 444 1 749 445 1 750 446 1 751 447 1 752 448 1 753 449 1
		 754 450 1 755 451 1 756 452 1 757 453 1 758 454 1 759 455 1 760 456 0 761 457 0 521 713 0
		 697 537 0 681 553 0 665 569 0 649 585 0 633 601 0 505 729 0 489 745 0 473 761 0 552 664 0
		 680 536 0 696 520 0 568 648 0 584 632 0 712 504 0 728 488 0 744 472 0;
	setAttr -s 742 -ch 2988 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces" 
		f 4 0 41 -21 -41
		mu 0 4 20 21 42 41
		f 4 1 42 -22 -42
		mu 0 4 21 22 43 42
		f 4 2 43 -23 -43
		mu 0 4 22 23 44 43
		f 4 3 44 -24 -44
		mu 0 4 23 24 45 44
		f 4 4 45 -25 -45
		mu 0 4 24 25 46 45
		f 4 5 46 -26 -46
		mu 0 4 25 26 47 46
		f 4 6 47 -27 -47
		mu 0 4 26 27 48 47
		f 4 7 48 -28 -48
		mu 0 4 27 28 49 48
		f 4 8 49 -29 -49
		mu 0 4 28 29 50 49
		f 4 9 50 -30 -50
		mu 0 4 29 30 51 50
		f 4 10 51 -31 -51
		mu 0 4 30 31 52 51
		f 4 11 52 -32 -52
		mu 0 4 31 32 53 52
		f 4 12 53 -33 -53
		mu 0 4 32 33 54 53
		f 4 13 54 -34 -54
		mu 0 4 33 34 55 54
		f 4 14 55 -35 -55
		mu 0 4 34 35 56 55
		f 4 15 56 -36 -56
		mu 0 4 35 36 57 56
		f 4 16 57 -37 -57
		mu 0 4 36 37 58 57
		f 4 17 58 -38 -58
		mu 0 4 37 38 59 58
		f 4 18 59 -39 -59
		mu 0 4 38 39 60 59
		f 4 19 40 -40 -60
		mu 0 4 39 40 61 60
		f 20 -20 -19 -18 -17 -16 -15 -14 -13 -12 -11 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1
		mu 0 20 0 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1
		f 20 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39
		mu 0 20 80 79 78 77 76 75 74 73 72 71 70 69 68 67 66 65 64 63 62 81
		f 20 -80 -79 -78 -77 -76 -75 -74 -73 -72 -71 -70 -69 -68 -67 -66 -65 -64 -63 -62 -61
		mu 0 20 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101
		f 4 60 81 120 -81
		mu 0 4 102 103 104 105
		f 4 61 82 121 -82
		mu 0 4 103 106 107 104
		f 4 62 83 122 -83
		mu 0 4 106 108 109 107
		f 4 63 84 123 -84
		mu 0 4 108 110 111 109
		f 4 64 85 124 -85
		mu 0 4 110 112 113 111
		f 4 65 86 125 -86
		mu 0 4 112 114 115 113
		f 4 66 87 126 -87
		mu 0 4 114 116 117 115
		f 4 67 88 127 -88
		mu 0 4 116 118 119 117
		f 4 68 89 128 -89
		mu 0 4 118 120 121 119
		f 4 69 90 129 -90
		mu 0 4 120 122 123 121
		f 4 70 91 130 -91
		mu 0 4 122 124 125 123
		f 4 71 92 131 -92
		mu 0 4 124 126 127 125
		f 4 72 93 132 -93
		mu 0 4 126 128 129 127
		f 4 73 94 133 -94
		mu 0 4 128 130 131 129
		f 4 74 95 134 -95
		mu 0 4 130 132 133 131
		f 4 75 96 135 -96
		mu 0 4 132 134 135 133
		f 4 76 97 136 -97
		mu 0 4 134 136 137 135
		f 4 77 98 137 -98
		mu 0 4 136 138 139 137
		f 4 78 99 138 -99
		mu 0 4 138 140 141 139
		f 4 79 80 139 -100
		mu 0 4 140 142 143 141
		f 3 -121 101 -101
		mu 0 3 105 104 144
		f 3 -122 102 -102
		mu 0 3 104 107 144
		f 3 -123 103 -103
		mu 0 3 107 109 144
		f 3 -124 104 -104
		mu 0 3 109 111 144
		f 3 -125 105 -105
		mu 0 3 111 113 144
		f 3 -126 106 -106
		mu 0 3 113 115 144
		f 3 -127 107 -107
		mu 0 3 115 117 144
		f 3 -128 108 -108
		mu 0 3 117 119 144
		f 3 -129 109 -109
		mu 0 3 119 121 144
		f 3 -130 110 -110
		mu 0 3 121 123 144
		f 3 -131 111 -111
		mu 0 3 123 125 144
		f 3 -132 112 -112
		mu 0 3 125 127 144
		f 3 -133 113 -113
		mu 0 3 127 129 144
		f 3 -134 114 -114
		mu 0 3 129 131 144
		f 3 -135 115 -115
		mu 0 3 131 133 144
		f 3 -136 116 -116
		mu 0 3 133 135 144
		f 3 -137 117 -117
		mu 0 3 135 137 144
		f 3 -138 118 -118
		mu 0 3 137 139 144
		f 3 -139 119 -119
		mu 0 3 139 141 144
		f 3 -140 100 -120
		mu 0 3 141 143 144
		f 4 -141 440 155 -442
		mu 0 4 145 146 147 148
		f 4 -142 441 156 -443
		mu 0 4 149 145 148 150
		f 4 -143 442 157 -444
		mu 0 4 151 149 150 152
		f 4 -144 443 158 -445
		mu 0 4 153 151 152 154
		f 4 -145 444 159 -446
		mu 0 4 155 153 154 156
		f 4 -146 445 160 -447
		mu 0 4 157 155 156 158
		f 4 -147 446 161 -448
		mu 0 4 159 157 158 160
		f 4 -148 447 162 -449
		mu 0 4 161 159 160 162
		f 4 -149 448 163 -450
		mu 0 4 163 161 162 164
		f 4 -150 449 164 -451
		mu 0 4 165 163 164 166
		f 4 -151 450 165 -452
		mu 0 4 167 165 166 168
		f 4 -152 451 166 -453
		mu 0 4 169 167 168 170
		f 4 -153 452 167 -454
		mu 0 4 171 169 170 172
		f 4 -154 453 168 -455
		mu 0 4 173 171 172 174
		f 4 -155 455 169 -441
		mu 0 4 175 176 177 178
		f 4 -156 456 170 -458
		mu 0 4 148 147 179 180
		f 4 -157 457 171 -459
		mu 0 4 150 148 180 181
		f 4 -158 458 172 -460
		mu 0 4 152 150 181 182
		f 4 -159 459 173 -461
		mu 0 4 154 152 182 183
		f 4 -160 460 174 -462
		mu 0 4 156 154 183 184
		f 4 -161 461 175 -463
		mu 0 4 158 156 184 185
		f 4 -162 462 176 -464
		mu 0 4 160 158 185 186
		f 4 -163 463 177 -465
		mu 0 4 162 160 186 187
		f 4 -164 464 178 -466
		mu 0 4 164 162 187 188
		f 4 -165 465 179 -467
		mu 0 4 166 164 188 189
		f 4 -166 466 180 -468
		mu 0 4 168 166 189 190
		f 4 -167 467 181 -469
		mu 0 4 170 168 190 191
		f 4 -168 468 182 -470
		mu 0 4 172 170 191 192
		f 4 -169 469 183 -471
		mu 0 4 174 172 192 193
		f 4 -170 471 184 -457
		mu 0 4 178 177 194 195
		f 4 -171 472 185 -474
		mu 0 4 180 179 196 197
		f 4 -172 473 186 -475
		mu 0 4 181 180 197 198
		f 4 -173 474 187 -476
		mu 0 4 182 181 198 199
		f 4 -174 475 188 -477
		mu 0 4 183 182 199 200
		f 4 -175 476 189 -478
		mu 0 4 184 183 200 201
		f 4 -176 477 190 -479
		mu 0 4 185 184 201 202
		f 4 -177 478 191 -480
		mu 0 4 186 185 202 203
		f 4 -178 479 192 -481
		mu 0 4 187 186 203 204
		f 4 -179 480 193 -482
		mu 0 4 188 187 204 205
		f 4 -180 481 194 -483
		mu 0 4 189 188 205 206
		f 4 -181 482 195 -484
		mu 0 4 190 189 206 207
		f 4 -182 483 196 -485
		mu 0 4 191 190 207 208
		f 4 -183 484 197 -486
		mu 0 4 192 191 208 209
		f 4 -184 485 198 -487
		mu 0 4 193 192 209 210
		f 4 -185 487 199 -473
		mu 0 4 195 194 211 212
		f 4 -186 488 200 -490
		mu 0 4 197 196 213 214
		f 4 -187 489 201 -491
		mu 0 4 198 197 214 215
		f 4 -188 490 202 -492
		mu 0 4 199 198 215 216
		f 4 -189 491 203 -493
		mu 0 4 200 199 216 217
		f 4 -190 492 204 -494
		mu 0 4 201 200 217 218
		f 4 -191 493 205 -495
		mu 0 4 202 201 218 219
		f 4 -192 494 206 -496
		mu 0 4 203 202 219 220
		f 4 -193 495 207 -497
		mu 0 4 204 203 220 221
		f 4 -194 496 208 -498
		mu 0 4 205 204 221 222
		f 4 -195 497 209 -499
		mu 0 4 206 205 222 223
		f 4 -196 498 210 -500
		mu 0 4 207 206 223 224
		f 4 -197 499 211 -501
		mu 0 4 208 207 224 225
		f 4 -198 500 212 -502
		mu 0 4 209 208 225 226
		f 4 -199 501 213 -503
		mu 0 4 210 209 226 227
		f 4 -200 503 214 -489
		mu 0 4 212 211 228 229
		f 4 -201 504 215 -506
		mu 0 4 214 213 230 231
		f 4 -202 505 216 -507
		mu 0 4 215 214 231 232
		f 4 -203 506 217 -508
		mu 0 4 216 215 232 233
		f 4 -204 507 218 -509
		mu 0 4 217 216 233 234
		f 4 -205 508 219 -510
		mu 0 4 218 217 234 235
		f 4 -206 509 220 -511
		mu 0 4 219 218 235 236
		f 4 -207 510 221 -512
		mu 0 4 220 219 236 237
		f 4 -208 511 222 -513
		mu 0 4 221 220 237 238
		f 4 -209 512 223 -514
		mu 0 4 222 221 238 239
		f 4 -210 513 224 -515
		mu 0 4 223 222 239 240
		f 4 -211 514 225 -516
		mu 0 4 224 223 240 241
		f 4 -212 515 226 -517
		mu 0 4 225 224 241 242
		f 4 -213 516 227 -518
		mu 0 4 226 225 242 243
		f 4 -214 517 228 -519
		mu 0 4 227 226 243 244
		f 4 -215 519 229 -505
		mu 0 4 229 228 245 246
		f 4 -216 520 230 -522
		mu 0 4 231 230 247 248
		f 4 -217 521 231 -523
		mu 0 4 232 231 248 249
		f 4 -218 522 232 -524
		mu 0 4 233 232 249 250
		f 4 -219 523 233 -525
		mu 0 4 234 233 250 251
		f 4 -220 524 234 -526
		mu 0 4 235 234 251 252
		f 4 -221 525 235 -527
		mu 0 4 236 235 252 253
		f 4 -222 526 236 -528
		mu 0 4 237 236 253 254
		f 4 -223 527 237 -529
		mu 0 4 238 237 254 255
		f 4 -224 528 238 -530
		mu 0 4 239 238 255 256
		f 4 -225 529 239 -531
		mu 0 4 240 239 256 257
		f 4 -226 530 240 -532
		mu 0 4 241 240 257 258
		f 4 -227 531 241 -533
		mu 0 4 242 241 258 259
		f 4 -228 532 242 -534
		mu 0 4 243 242 259 260
		f 4 -229 533 243 -535
		mu 0 4 244 243 260 261
		f 4 -230 535 244 -521
		mu 0 4 246 245 262 263
		f 4 -231 536 245 -538
		mu 0 4 248 247 264 265
		f 4 -232 537 246 -539
		mu 0 4 249 248 265 266
		f 4 -233 538 247 -540
		mu 0 4 250 249 266 267
		f 4 -234 539 248 -541
		mu 0 4 251 250 267 268
		f 4 -235 540 249 -542
		mu 0 4 252 251 268 269
		f 4 -236 541 250 -543
		mu 0 4 253 252 269 270
		f 4 -237 542 251 -544
		mu 0 4 254 253 270 271
		f 4 -238 543 252 -545
		mu 0 4 255 254 271 272
		f 4 -239 544 253 -546
		mu 0 4 256 255 272 273
		f 4 -240 545 254 -547
		mu 0 4 257 256 273 274
		f 4 -241 546 255 -548
		mu 0 4 258 257 274 275
		f 4 -242 547 256 -549
		mu 0 4 259 258 275 276
		f 4 -243 548 257 -550
		mu 0 4 260 259 276 277
		f 4 -244 549 258 -551
		mu 0 4 261 260 277 278
		f 4 -245 551 259 -537
		mu 0 4 263 262 279 280
		f 4 -246 552 260 -554
		mu 0 4 265 264 281 282
		f 4 -247 553 261 -555
		mu 0 4 266 265 282 283
		f 4 -248 554 262 -556
		mu 0 4 267 266 283 284
		f 4 -249 555 263 -557
		mu 0 4 268 267 284 285
		f 4 -250 556 264 -558
		mu 0 4 269 268 285 286
		f 4 -251 557 265 -559
		mu 0 4 270 269 286 287
		f 4 -252 558 266 -560
		mu 0 4 271 270 287 288
		f 4 -253 559 267 -561
		mu 0 4 272 271 288 289
		f 4 -254 560 268 -562
		mu 0 4 273 272 289 290
		f 4 -255 561 269 -563
		mu 0 4 274 273 290 291
		f 4 -256 562 270 -564
		mu 0 4 275 274 291 292
		f 4 -257 563 271 -565
		mu 0 4 276 275 292 293
		f 4 -258 564 272 -566
		mu 0 4 277 276 293 294
		f 4 -259 565 273 -567
		mu 0 4 278 277 294 295
		f 4 -260 567 274 -553
		mu 0 4 280 279 296 297
		f 4 -261 568 275 -570
		mu 0 4 282 281 298 299
		f 4 -262 569 276 -571
		mu 0 4 283 282 299 300
		f 4 -263 570 277 -572
		mu 0 4 284 283 300 301
		f 4 -264 571 278 -573
		mu 0 4 285 284 301 302
		f 4 -265 572 279 -574
		mu 0 4 286 285 302 303
		f 4 -266 573 280 -575
		mu 0 4 287 286 303 304
		f 4 -267 574 281 -576
		mu 0 4 288 287 304 305
		f 4 -268 575 282 -577
		mu 0 4 289 288 305 306
		f 4 -269 576 283 -578
		mu 0 4 290 289 306 307
		f 4 -270 577 284 -579
		mu 0 4 291 290 307 308
		f 4 -271 578 285 -580
		mu 0 4 292 291 308 309
		f 4 -272 579 286 -581
		mu 0 4 293 292 309 310
		f 4 -273 580 287 -582
		mu 0 4 294 293 310 311
		f 4 -274 581 288 -583
		mu 0 4 295 294 311 312
		f 4 -275 583 289 -569
		mu 0 4 297 296 313 314
		f 4 -276 584 290 -586
		mu 0 4 299 298 315 316
		f 4 -277 585 291 -587
		mu 0 4 300 299 316 317
		f 4 -278 586 292 -588
		mu 0 4 301 300 317 318
		f 4 -279 587 293 -589
		mu 0 4 302 301 318 319
		f 4 -280 588 294 -590
		mu 0 4 303 302 319 320
		f 4 -281 589 295 -591
		mu 0 4 304 303 320 321
		f 4 -282 590 296 -592
		mu 0 4 305 304 321 322
		f 4 -283 591 297 -593
		mu 0 4 306 305 322 323
		f 4 -284 592 298 -594
		mu 0 4 307 306 323 324
		f 4 -285 593 299 -595
		mu 0 4 308 307 324 325
		f 4 -286 594 300 -596
		mu 0 4 309 308 325 326
		f 4 -287 595 301 -597
		mu 0 4 310 309 326 327
		f 4 -288 596 302 -598
		mu 0 4 311 310 327 328
		f 4 -289 597 303 -599
		mu 0 4 312 311 328 329
		f 4 -290 599 304 -585
		mu 0 4 314 313 330 331
		f 4 -291 600 305 -602
		mu 0 4 316 315 332 333
		f 4 -292 601 306 -603
		mu 0 4 317 316 333 334
		f 4 -293 602 307 -604
		mu 0 4 318 317 334 335
		f 4 -294 603 308 -605
		mu 0 4 319 318 335 336
		f 4 -295 604 309 -606
		mu 0 4 320 319 336 337
		f 4 -296 605 310 -607
		mu 0 4 321 320 337 338
		f 4 -297 606 311 -608
		mu 0 4 322 321 338 339
		f 4 -298 607 312 -609
		mu 0 4 323 322 339 340
		f 4 -299 608 313 -610
		mu 0 4 324 323 340 341
		f 4 -300 609 314 -611
		mu 0 4 325 324 341 342
		f 4 -301 610 315 -612
		mu 0 4 326 325 342 343
		f 4 -302 611 316 -613
		mu 0 4 327 326 343 344
		f 4 -303 612 317 -614
		mu 0 4 328 327 344 345
		f 4 -304 613 318 -615
		mu 0 4 329 328 345 346
		f 4 -305 615 319 -601
		mu 0 4 331 330 347 348
		f 4 -306 616 320 -618
		mu 0 4 333 332 349 350
		f 4 -307 617 321 -619
		mu 0 4 334 333 350 351
		f 4 -308 618 322 -620
		mu 0 4 335 334 351 352
		f 4 -309 619 323 -621
		mu 0 4 336 335 352 353
		f 4 -310 620 324 -622
		mu 0 4 337 336 353 354
		f 4 -311 621 325 -623
		mu 0 4 338 337 354 355
		f 4 -312 622 326 -624
		mu 0 4 339 338 355 356
		f 4 -313 623 327 -625
		mu 0 4 340 339 356 357
		f 4 -314 624 328 -626
		mu 0 4 341 340 357 358
		f 4 -315 625 329 -627
		mu 0 4 342 341 358 359
		f 4 -316 626 330 -628
		mu 0 4 343 342 359 360
		f 4 -317 627 331 -629
		mu 0 4 344 343 360 361
		f 4 -318 628 332 -630
		mu 0 4 345 344 361 362
		f 4 -319 629 333 -631
		mu 0 4 346 345 362 363
		f 4 -320 631 334 -617
		mu 0 4 348 347 364 365
		f 4 -321 632 335 -634
		mu 0 4 350 349 366 367
		f 4 -322 633 336 -635
		mu 0 4 351 350 367 368
		f 4 -323 634 337 -636
		mu 0 4 352 351 368 369
		f 4 -324 635 338 -637
		mu 0 4 353 352 369 370
		f 4 -325 636 339 -638
		mu 0 4 354 353 370 371
		f 4 -326 637 340 -639
		mu 0 4 355 354 371 372
		f 4 -327 638 341 -640
		mu 0 4 356 355 372 373
		f 4 -328 639 342 -641
		mu 0 4 357 356 373 374
		f 4 -329 640 343 -642
		mu 0 4 358 357 374 375
		f 4 -330 641 344 -643
		mu 0 4 359 358 375 376
		f 4 -331 642 345 -644
		mu 0 4 360 359 376 377
		f 4 -332 643 346 -645
		mu 0 4 361 360 377 378
		f 4 -333 644 347 -646
		mu 0 4 362 361 378 379
		f 4 -334 645 348 -647
		mu 0 4 363 362 379 380
		f 4 -335 647 349 -633
		mu 0 4 365 364 381 382
		f 4 -336 648 350 -650
		mu 0 4 367 366 383 384
		f 4 -337 649 351 -651
		mu 0 4 368 367 384 385
		f 4 -338 650 352 -652
		mu 0 4 369 368 385 386
		f 4 -339 651 353 -653
		mu 0 4 370 369 386 387
		f 4 -340 652 354 -654
		mu 0 4 371 370 387 388
		f 4 -341 653 355 -655
		mu 0 4 372 371 388 389
		f 4 -342 654 356 -656
		mu 0 4 373 372 389 390
		f 4 -343 655 357 -657
		mu 0 4 374 373 390 391
		f 4 -344 656 358 -658
		mu 0 4 375 374 391 392
		f 4 -345 657 359 -659
		mu 0 4 376 375 392 393
		f 4 -346 658 360 -660
		mu 0 4 377 376 393 394
		f 4 -347 659 361 -661
		mu 0 4 378 377 394 395
		f 4 -348 660 362 -662
		mu 0 4 379 378 395 396
		f 4 -349 661 363 -663
		mu 0 4 380 379 396 397
		f 4 -350 663 364 -649
		mu 0 4 382 381 398 399
		f 4 -351 664 365 -666
		mu 0 4 384 383 400 401
		f 4 -352 665 366 -667
		mu 0 4 385 384 401 402
		f 4 -353 666 367 -668
		mu 0 4 386 385 402 403
		f 4 -354 667 368 -669
		mu 0 4 387 386 403 404
		f 4 -355 668 369 -670
		mu 0 4 388 387 404 405
		f 4 -356 669 370 -671
		mu 0 4 389 388 405 406
		f 4 -357 670 371 -672
		mu 0 4 390 389 406 407
		f 4 -358 671 372 -673
		mu 0 4 391 390 407 408
		f 4 -359 672 373 -674
		mu 0 4 392 391 408 409
		f 4 -360 673 374 -675
		mu 0 4 393 392 409 410
		f 4 -361 674 375 -676
		mu 0 4 394 393 410 411
		f 4 -362 675 376 -677
		mu 0 4 395 394 411 412
		f 4 -363 676 377 -678
		mu 0 4 396 395 412 413
		f 4 -364 677 378 -679
		mu 0 4 397 396 413 414
		f 4 -365 679 379 -665
		mu 0 4 399 398 415 416
		f 4 -366 680 380 -682
		mu 0 4 401 400 417 418
		f 4 -367 681 381 -683
		mu 0 4 402 401 418 419
		f 4 -368 682 382 -684
		mu 0 4 403 402 419 420
		f 4 -369 683 383 -685
		mu 0 4 404 403 420 421
		f 4 -370 684 384 -686
		mu 0 4 405 404 421 422
		f 4 -371 685 385 -687
		mu 0 4 406 405 422 423
		f 4 -372 686 386 -688
		mu 0 4 407 406 423 424
		f 4 -373 687 387 -689
		mu 0 4 408 407 424 425
		f 4 -374 688 388 -690
		mu 0 4 409 408 425 426
		f 4 -375 689 389 -691
		mu 0 4 410 409 426 427
		f 4 -376 690 390 -692
		mu 0 4 411 410 427 428
		f 4 -377 691 391 -693
		mu 0 4 412 411 428 429
		f 4 -378 692 392 -694
		mu 0 4 413 412 429 430
		f 4 -379 693 393 -695
		mu 0 4 414 413 430 431
		f 4 -380 695 394 -681
		mu 0 4 416 415 432 433
		f 4 -381 696 395 -698
		mu 0 4 418 417 434 435
		f 4 -382 697 396 -699
		mu 0 4 419 418 435 436
		f 4 -383 698 397 -700
		mu 0 4 420 419 436 437
		f 4 -384 699 398 -701
		mu 0 4 421 420 437 438
		f 4 -385 700 399 -702
		mu 0 4 422 421 438 439
		f 4 -386 701 400 -703
		mu 0 4 423 422 439 440
		f 4 -387 702 401 -704
		mu 0 4 424 423 440 441
		f 4 -388 703 402 -705
		mu 0 4 425 424 441 442
		f 4 -389 704 403 -706
		mu 0 4 426 425 442 443
		f 4 -390 705 404 -707
		mu 0 4 427 426 443 444
		f 4 -391 706 405 -708
		mu 0 4 428 427 444 445
		f 4 -392 707 406 -709
		mu 0 4 429 428 445 446
		f 4 -393 708 407 -710
		mu 0 4 430 429 446 447
		f 4 -394 709 408 -711
		mu 0 4 431 430 447 448
		f 4 -395 711 409 -697
		mu 0 4 433 432 449 450
		f 4 -396 712 410 -714
		mu 0 4 435 434 451 452
		f 4 -397 713 411 -715
		mu 0 4 436 435 452 453
		f 4 -398 714 412 -716
		mu 0 4 437 436 453 454
		f 4 -399 715 413 -717
		mu 0 4 438 437 454 455
		f 4 -400 716 414 -718
		mu 0 4 439 438 455 456
		f 4 -401 717 415 -719
		mu 0 4 440 439 456 457
		f 4 -402 718 416 -720
		mu 0 4 441 440 457 458
		f 4 -403 719 417 -721
		mu 0 4 442 441 458 459
		f 4 -404 720 418 -722
		mu 0 4 443 442 459 460
		f 4 -405 721 419 -723
		mu 0 4 444 443 460 461
		f 4 -406 722 420 -724
		mu 0 4 445 444 461 462
		f 4 -407 723 421 -725
		mu 0 4 446 445 462 463
		f 4 -408 724 422 -726
		mu 0 4 447 446 463 464
		f 4 -409 725 423 -727
		mu 0 4 448 447 464 465
		f 4 -410 727 424 -713
		mu 0 4 450 449 466 467
		f 4 -411 728 425 -730
		mu 0 4 452 451 468 469
		f 4 -412 729 426 -731
		mu 0 4 453 452 469 470
		f 4 -413 730 427 -732
		mu 0 4 454 453 470 471
		f 4 -414 731 428 -733
		mu 0 4 455 454 471 472
		f 4 -415 732 429 -734
		mu 0 4 456 455 472 473
		f 4 -416 733 430 -735
		mu 0 4 457 456 473 474
		f 4 -417 734 431 -736
		mu 0 4 458 457 474 475
		f 4 -418 735 432 -737
		mu 0 4 459 458 475 476
		f 4 -419 736 433 -738
		mu 0 4 460 459 476 477
		f 4 -420 737 434 -739
		mu 0 4 461 460 477 478
		f 4 -421 738 435 -740
		mu 0 4 462 461 478 479
		f 4 -422 739 436 -741
		mu 0 4 463 462 479 480
		f 4 -423 740 437 -742
		mu 0 4 464 463 480 481
		f 4 -424 741 438 -743
		mu 0 4 465 464 481 482
		f 4 -425 743 439 -729
		mu 0 4 467 466 483 484
		f 4 -426 744 140 -746
		mu 0 4 469 468 485 486
		f 4 -427 745 141 -747
		mu 0 4 470 469 486 487
		f 4 -428 746 142 -748
		mu 0 4 471 470 487 488
		f 4 -429 747 143 -749
		mu 0 4 472 471 488 489
		f 4 -430 748 144 -750
		mu 0 4 473 472 489 490
		f 4 -431 749 145 -751
		mu 0 4 474 473 490 491
		f 4 -432 750 146 -752
		mu 0 4 475 474 491 492
		f 4 -433 751 147 -753
		mu 0 4 476 475 492 493
		f 4 -434 752 148 -754
		mu 0 4 477 476 493 494
		f 4 -435 753 149 -755
		mu 0 4 478 477 494 495
		f 4 -436 754 150 -756
		mu 0 4 479 478 495 496
		f 4 -437 755 151 -757
		mu 0 4 480 479 496 497
		f 4 -438 756 152 -758
		mu 0 4 481 480 497 498
		f 4 -439 757 153 -759
		mu 0 4 482 481 498 499
		f 4 -440 759 154 -745
		mu 0 4 484 483 500 501
		f 4 -520 760 -696 761
		mu 0 4 502 503 504 505
		f 4 -536 -762 -680 762
		mu 0 4 506 507 508 509
		f 4 -664 763 -552 -763
		mu 0 4 510 511 512 513
		f 4 -568 -764 -648 764
		mu 0 4 514 515 516 517
		f 4 -632 765 -584 -765
		mu 0 4 518 519 520 521
		f 3 -600 -766 -616
		mu 0 3 522 523 524
		f 4 -504 766 -712 -761
		mu 0 4 525 526 527 528
		f 4 -728 -767 -488 767
		mu 0 4 529 530 531 532
		f 4 -472 768 -744 -768
		mu 0 4 533 534 535 536
		f 3 -760 -769 -456
		mu 0 3 537 538 539
		f 4 534 769 662 770
		mu 0 4 540 541 542 543
		f 4 518 -771 678 771
		mu 0 4 544 545 546 547
		f 4 550 772 646 -770
		mu 0 4 548 549 550 551
		f 4 630 -773 566 773
		mu 0 4 552 553 554 555
		f 4 582 598 614 -774
		mu 0 4 556 557 558 559
		f 4 694 774 502 -772
		mu 0 4 560 561 562 563
		f 4 486 -775 710 775
		mu 0 4 564 565 566 567
		f 4 726 776 470 -776
		mu 0 4 568 569 570 571
		f 4 454 -777 742 758
		mu 0 4 572 573 574 575
		f 20 -797 -796 -795 -794 -793 -792 -791 -790 -789 -788 -787 -786 -785 -784 -783 -782
		 -781 -780 -779 -778
		mu 0 20 576 577 578 579 580 581 582 583 584 585 586 587 588 589 590 591 592 593 594 595
		f 4 777 798 837 -798
		mu 0 4 596 597 598 599
		f 4 778 799 838 -799
		mu 0 4 597 600 601 598
		f 4 779 800 839 -800
		mu 0 4 600 602 603 601
		f 4 780 801 840 -801
		mu 0 4 602 604 605 603
		f 4 781 802 841 -802
		mu 0 4 604 606 607 605
		f 4 782 803 842 -803
		mu 0 4 606 608 609 607
		f 4 783 804 843 -804
		mu 0 4 608 610 611 609
		f 4 784 805 844 -805
		mu 0 4 610 612 613 611
		f 4 785 806 845 -806
		mu 0 4 612 614 615 613
		f 4 786 807 846 -807
		mu 0 4 614 616 617 615
		f 4 787 808 847 -808
		mu 0 4 616 618 619 617
		f 4 788 809 848 -809
		mu 0 4 618 620 621 619
		f 4 789 810 849 -810
		mu 0 4 620 622 623 621
		f 4 790 811 850 -811
		mu 0 4 622 624 625 623
		f 4 791 812 851 -812
		mu 0 4 624 626 627 625
		f 4 792 813 852 -813
		mu 0 4 626 628 629 627
		f 4 793 814 853 -814
		mu 0 4 628 630 631 629
		f 4 794 815 854 -815
		mu 0 4 630 632 633 631
		f 4 795 816 855 -816
		mu 0 4 632 634 635 633
		f 4 796 797 856 -817
		mu 0 4 634 636 637 635
		f 3 -838 818 -818
		mu 0 3 599 598 638
		f 3 -839 819 -819
		mu 0 3 598 601 638
		f 3 -840 820 -820
		mu 0 3 601 603 638
		f 3 -841 821 -821
		mu 0 3 603 605 638
		f 3 -842 822 -822
		mu 0 3 605 607 638
		f 3 -843 823 -823
		mu 0 3 607 609 638
		f 3 -844 824 -824
		mu 0 3 609 611 638
		f 3 -845 825 -825
		mu 0 3 611 613 638
		f 3 -846 826 -826
		mu 0 3 613 615 638
		f 3 -847 827 -827
		mu 0 3 615 617 638
		f 3 -848 828 -828
		mu 0 3 617 619 638
		f 3 -849 829 -829
		mu 0 3 619 621 638
		f 3 -850 830 -830
		mu 0 3 621 623 638
		f 3 -851 831 -831
		mu 0 3 623 625 638
		f 3 -852 832 -832
		mu 0 3 625 627 638
		f 3 -853 833 -833
		mu 0 3 627 629 638
		f 3 -854 834 -834
		mu 0 3 629 631 638
		f 3 -855 835 -835
		mu 0 3 631 633 638
		f 3 -856 836 -836
		mu 0 3 633 635 638
		f 3 -857 817 -837
		mu 0 3 635 637 638
		f 4 -858 1157 872 -1159
		mu 0 4 639 640 641 642
		f 4 -859 1158 873 -1160
		mu 0 4 643 639 642 644
		f 4 -860 1159 874 -1161
		mu 0 4 645 643 644 646
		f 4 -861 1160 875 -1162
		mu 0 4 647 645 646 648
		f 4 -862 1161 876 -1163
		mu 0 4 649 647 648 650
		f 4 -863 1162 877 -1164
		mu 0 4 651 649 650 652
		f 4 -864 1163 878 -1165
		mu 0 4 653 651 652 654
		f 4 -865 1164 879 -1166
		mu 0 4 655 653 654 656
		f 4 -866 1165 880 -1167
		mu 0 4 657 655 656 658
		f 4 -867 1166 881 -1168
		mu 0 4 659 657 658 660
		f 4 -868 1167 882 -1169
		mu 0 4 661 659 660 662
		f 4 -869 1168 883 -1170
		mu 0 4 663 661 662 664
		f 4 -870 1169 884 -1171
		mu 0 4 665 663 664 666
		f 4 -871 1170 885 -1172
		mu 0 4 667 665 666 668
		f 4 -872 1172 886 -1158
		mu 0 4 669 670 671 672
		f 4 -873 1173 887 -1175
		mu 0 4 642 641 673 674
		f 4 -874 1174 888 -1176
		mu 0 4 644 642 674 675
		f 4 -875 1175 889 -1177
		mu 0 4 646 644 675 676
		f 4 -876 1176 890 -1178
		mu 0 4 648 646 676 677
		f 4 -877 1177 891 -1179
		mu 0 4 650 648 677 678
		f 4 -878 1178 892 -1180
		mu 0 4 652 650 678 679
		f 4 -879 1179 893 -1181
		mu 0 4 654 652 679 680
		f 4 -880 1180 894 -1182
		mu 0 4 656 654 680 681
		f 4 -881 1181 895 -1183
		mu 0 4 658 656 681 682
		f 4 -882 1182 896 -1184
		mu 0 4 660 658 682 683
		f 4 -883 1183 897 -1185
		mu 0 4 662 660 683 684
		f 4 -884 1184 898 -1186
		mu 0 4 664 662 684 685
		f 4 -885 1185 899 -1187
		mu 0 4 666 664 685 686
		f 4 -886 1186 900 -1188
		mu 0 4 668 666 686 687
		f 4 -887 1188 901 -1174
		mu 0 4 672 671 688 689
		f 4 -888 1189 902 -1191
		mu 0 4 674 673 690 691
		f 4 -889 1190 903 -1192
		mu 0 4 675 674 691 692
		f 4 -890 1191 904 -1193
		mu 0 4 676 675 692 693
		f 4 -891 1192 905 -1194
		mu 0 4 677 676 693 694
		f 4 -892 1193 906 -1195
		mu 0 4 678 677 694 695
		f 4 -893 1194 907 -1196
		mu 0 4 679 678 695 696
		f 4 -894 1195 908 -1197
		mu 0 4 680 679 696 697
		f 4 -895 1196 909 -1198
		mu 0 4 681 680 697 698
		f 4 -896 1197 910 -1199
		mu 0 4 682 681 698 699
		f 4 -897 1198 911 -1200
		mu 0 4 683 682 699 700
		f 4 -898 1199 912 -1201
		mu 0 4 684 683 700 701
		f 4 -899 1200 913 -1202
		mu 0 4 685 684 701 702
		f 4 -900 1201 914 -1203
		mu 0 4 686 685 702 703
		f 4 -901 1202 915 -1204
		mu 0 4 687 686 703 704
		f 4 -902 1204 916 -1190
		mu 0 4 689 688 705 706
		f 4 -903 1205 917 -1207
		mu 0 4 691 690 707 708
		f 4 -904 1206 918 -1208
		mu 0 4 692 691 708 709
		f 4 -905 1207 919 -1209
		mu 0 4 693 692 709 710
		f 4 -906 1208 920 -1210
		mu 0 4 694 693 710 711
		f 4 -907 1209 921 -1211
		mu 0 4 695 694 711 712
		f 4 -908 1210 922 -1212
		mu 0 4 696 695 712 713
		f 4 -909 1211 923 -1213
		mu 0 4 697 696 713 714
		f 4 -910 1212 924 -1214
		mu 0 4 698 697 714 715
		f 4 -911 1213 925 -1215
		mu 0 4 699 698 715 716
		f 4 -912 1214 926 -1216
		mu 0 4 700 699 716 717
		f 4 -913 1215 927 -1217
		mu 0 4 701 700 717 718
		f 4 -914 1216 928 -1218
		mu 0 4 702 701 718 719
		f 4 -915 1217 929 -1219
		mu 0 4 703 702 719 720
		f 4 -916 1218 930 -1220
		mu 0 4 704 703 720 721
		f 4 -917 1220 931 -1206
		mu 0 4 706 705 722 723
		f 4 -918 1221 932 -1223
		mu 0 4 708 707 724 725
		f 4 -919 1222 933 -1224
		mu 0 4 709 708 725 726
		f 4 -920 1223 934 -1225
		mu 0 4 710 709 726 727
		f 4 -921 1224 935 -1226
		mu 0 4 711 710 727 728
		f 4 -922 1225 936 -1227
		mu 0 4 712 711 728 729
		f 4 -923 1226 937 -1228
		mu 0 4 713 712 729 730
		f 4 -924 1227 938 -1229
		mu 0 4 714 713 730 731
		f 4 -925 1228 939 -1230
		mu 0 4 715 714 731 732
		f 4 -926 1229 940 -1231
		mu 0 4 716 715 732 733
		f 4 -927 1230 941 -1232
		mu 0 4 717 716 733 734
		f 4 -928 1231 942 -1233
		mu 0 4 718 717 734 735
		f 4 -929 1232 943 -1234
		mu 0 4 719 718 735 736
		f 4 -930 1233 944 -1235
		mu 0 4 720 719 736 737
		f 4 -931 1234 945 -1236
		mu 0 4 721 720 737 738
		f 4 -932 1236 946 -1222
		mu 0 4 723 722 739 740
		f 4 -933 1237 947 -1239
		mu 0 4 725 724 741 742
		f 4 -934 1238 948 -1240
		mu 0 4 726 725 742 743;
	setAttr ".fc[500:741]"
		f 4 -935 1239 949 -1241
		mu 0 4 727 726 743 744
		f 4 -936 1240 950 -1242
		mu 0 4 728 727 744 745
		f 4 -937 1241 951 -1243
		mu 0 4 729 728 745 746
		f 4 -938 1242 952 -1244
		mu 0 4 730 729 746 747
		f 4 -939 1243 953 -1245
		mu 0 4 731 730 747 748
		f 4 -940 1244 954 -1246
		mu 0 4 732 731 748 749
		f 4 -941 1245 955 -1247
		mu 0 4 733 732 749 750
		f 4 -942 1246 956 -1248
		mu 0 4 734 733 750 751
		f 4 -943 1247 957 -1249
		mu 0 4 735 734 751 752
		f 4 -944 1248 958 -1250
		mu 0 4 736 735 752 753
		f 4 -945 1249 959 -1251
		mu 0 4 737 736 753 754
		f 4 -946 1250 960 -1252
		mu 0 4 738 737 754 755
		f 4 -947 1252 961 -1238
		mu 0 4 740 739 756 757
		f 4 -948 1253 962 -1255
		mu 0 4 742 741 758 759
		f 4 -949 1254 963 -1256
		mu 0 4 743 742 759 760
		f 4 -950 1255 964 -1257
		mu 0 4 744 743 760 761
		f 4 -951 1256 965 -1258
		mu 0 4 745 744 761 762
		f 4 -952 1257 966 -1259
		mu 0 4 746 745 762 763
		f 4 -953 1258 967 -1260
		mu 0 4 747 746 763 764
		f 4 -954 1259 968 -1261
		mu 0 4 748 747 764 765
		f 4 -955 1260 969 -1262
		mu 0 4 749 748 765 766
		f 4 -956 1261 970 -1263
		mu 0 4 750 749 766 767
		f 4 -957 1262 971 -1264
		mu 0 4 751 750 767 768
		f 4 -958 1263 972 -1265
		mu 0 4 752 751 768 769
		f 4 -959 1264 973 -1266
		mu 0 4 753 752 769 770
		f 4 -960 1265 974 -1267
		mu 0 4 754 753 770 771
		f 4 -961 1266 975 -1268
		mu 0 4 755 754 771 772
		f 4 -962 1268 976 -1254
		mu 0 4 757 756 773 774
		f 4 -963 1269 977 -1271
		mu 0 4 759 758 775 776
		f 4 -964 1270 978 -1272
		mu 0 4 760 759 776 777
		f 4 -965 1271 979 -1273
		mu 0 4 761 760 777 778
		f 4 -966 1272 980 -1274
		mu 0 4 762 761 778 779
		f 4 -967 1273 981 -1275
		mu 0 4 763 762 779 780
		f 4 -968 1274 982 -1276
		mu 0 4 764 763 780 781
		f 4 -969 1275 983 -1277
		mu 0 4 765 764 781 782
		f 4 -970 1276 984 -1278
		mu 0 4 766 765 782 783
		f 4 -971 1277 985 -1279
		mu 0 4 767 766 783 784
		f 4 -972 1278 986 -1280
		mu 0 4 768 767 784 785
		f 4 -973 1279 987 -1281
		mu 0 4 769 768 785 786
		f 4 -974 1280 988 -1282
		mu 0 4 770 769 786 787
		f 4 -975 1281 989 -1283
		mu 0 4 771 770 787 788
		f 4 -976 1282 990 -1284
		mu 0 4 772 771 788 789
		f 4 -977 1284 991 -1270
		mu 0 4 774 773 790 791
		f 4 -978 1285 992 -1287
		mu 0 4 776 775 792 793
		f 4 -979 1286 993 -1288
		mu 0 4 777 776 793 794
		f 4 -980 1287 994 -1289
		mu 0 4 778 777 794 795
		f 4 -981 1288 995 -1290
		mu 0 4 779 778 795 796
		f 4 -982 1289 996 -1291
		mu 0 4 780 779 796 797
		f 4 -983 1290 997 -1292
		mu 0 4 781 780 797 798
		f 4 -984 1291 998 -1293
		mu 0 4 782 781 798 799
		f 4 -985 1292 999 -1294
		mu 0 4 783 782 799 800
		f 4 -986 1293 1000 -1295
		mu 0 4 784 783 800 801
		f 4 -987 1294 1001 -1296
		mu 0 4 785 784 801 802
		f 4 -988 1295 1002 -1297
		mu 0 4 786 785 802 803
		f 4 -989 1296 1003 -1298
		mu 0 4 787 786 803 804
		f 4 -990 1297 1004 -1299
		mu 0 4 788 787 804 805
		f 4 -991 1298 1005 -1300
		mu 0 4 789 788 805 806
		f 4 -992 1300 1006 -1286
		mu 0 4 791 790 807 808
		f 4 -993 1301 1007 -1303
		mu 0 4 793 792 809 810
		f 4 -994 1302 1008 -1304
		mu 0 4 794 793 810 811
		f 4 -995 1303 1009 -1305
		mu 0 4 795 794 811 812
		f 4 -996 1304 1010 -1306
		mu 0 4 796 795 812 813
		f 4 -997 1305 1011 -1307
		mu 0 4 797 796 813 814
		f 4 -998 1306 1012 -1308
		mu 0 4 798 797 814 815
		f 4 -999 1307 1013 -1309
		mu 0 4 799 798 815 816
		f 4 -1000 1308 1014 -1310
		mu 0 4 800 799 816 817
		f 4 -1001 1309 1015 -1311
		mu 0 4 801 800 817 818
		f 4 -1002 1310 1016 -1312
		mu 0 4 802 801 818 819
		f 4 -1003 1311 1017 -1313
		mu 0 4 803 802 819 820
		f 4 -1004 1312 1018 -1314
		mu 0 4 804 803 820 821
		f 4 -1005 1313 1019 -1315
		mu 0 4 805 804 821 822
		f 4 -1006 1314 1020 -1316
		mu 0 4 806 805 822 823
		f 4 -1007 1316 1021 -1302
		mu 0 4 808 807 824 825
		f 4 -1008 1317 1022 -1319
		mu 0 4 810 809 826 827
		f 4 -1009 1318 1023 -1320
		mu 0 4 811 810 827 828
		f 4 -1010 1319 1024 -1321
		mu 0 4 812 811 828 829
		f 4 -1011 1320 1025 -1322
		mu 0 4 813 812 829 830
		f 4 -1012 1321 1026 -1323
		mu 0 4 814 813 830 831
		f 4 -1013 1322 1027 -1324
		mu 0 4 815 814 831 832
		f 4 -1014 1323 1028 -1325
		mu 0 4 816 815 832 833
		f 4 -1015 1324 1029 -1326
		mu 0 4 817 816 833 834
		f 4 -1016 1325 1030 -1327
		mu 0 4 818 817 834 835
		f 4 -1017 1326 1031 -1328
		mu 0 4 819 818 835 836
		f 4 -1018 1327 1032 -1329
		mu 0 4 820 819 836 837
		f 4 -1019 1328 1033 -1330
		mu 0 4 821 820 837 838
		f 4 -1020 1329 1034 -1331
		mu 0 4 822 821 838 839
		f 4 -1021 1330 1035 -1332
		mu 0 4 823 822 839 840
		f 4 -1022 1332 1036 -1318
		mu 0 4 825 824 841 842
		f 4 -1023 1333 1037 -1335
		mu 0 4 827 826 843 844
		f 4 -1024 1334 1038 -1336
		mu 0 4 828 827 844 845
		f 4 -1025 1335 1039 -1337
		mu 0 4 829 828 845 846
		f 4 -1026 1336 1040 -1338
		mu 0 4 830 829 846 847
		f 4 -1027 1337 1041 -1339
		mu 0 4 831 830 847 848
		f 4 -1028 1338 1042 -1340
		mu 0 4 832 831 848 849
		f 4 -1029 1339 1043 -1341
		mu 0 4 833 832 849 850
		f 4 -1030 1340 1044 -1342
		mu 0 4 834 833 850 851
		f 4 -1031 1341 1045 -1343
		mu 0 4 835 834 851 852
		f 4 -1032 1342 1046 -1344
		mu 0 4 836 835 852 853
		f 4 -1033 1343 1047 -1345
		mu 0 4 837 836 853 854
		f 4 -1034 1344 1048 -1346
		mu 0 4 838 837 854 855
		f 4 -1035 1345 1049 -1347
		mu 0 4 839 838 855 856
		f 4 -1036 1346 1050 -1348
		mu 0 4 840 839 856 857
		f 4 -1037 1348 1051 -1334
		mu 0 4 842 841 858 859
		f 4 -1038 1349 1052 -1351
		mu 0 4 844 843 860 861
		f 4 -1039 1350 1053 -1352
		mu 0 4 845 844 861 862
		f 4 -1040 1351 1054 -1353
		mu 0 4 846 845 862 863
		f 4 -1041 1352 1055 -1354
		mu 0 4 847 846 863 864
		f 4 -1042 1353 1056 -1355
		mu 0 4 848 847 864 865
		f 4 -1043 1354 1057 -1356
		mu 0 4 849 848 865 866
		f 4 -1044 1355 1058 -1357
		mu 0 4 850 849 866 867
		f 4 -1045 1356 1059 -1358
		mu 0 4 851 850 867 868
		f 4 -1046 1357 1060 -1359
		mu 0 4 852 851 868 869
		f 4 -1047 1358 1061 -1360
		mu 0 4 853 852 869 870
		f 4 -1048 1359 1062 -1361
		mu 0 4 854 853 870 871
		f 4 -1049 1360 1063 -1362
		mu 0 4 855 854 871 872
		f 4 -1050 1361 1064 -1363
		mu 0 4 856 855 872 873
		f 4 -1051 1362 1065 -1364
		mu 0 4 857 856 873 874
		f 4 -1052 1364 1066 -1350
		mu 0 4 859 858 875 876
		f 4 -1053 1365 1067 -1367
		mu 0 4 861 860 877 878
		f 4 -1054 1366 1068 -1368
		mu 0 4 862 861 878 879
		f 4 -1055 1367 1069 -1369
		mu 0 4 863 862 879 880
		f 4 -1056 1368 1070 -1370
		mu 0 4 864 863 880 881
		f 4 -1057 1369 1071 -1371
		mu 0 4 865 864 881 882
		f 4 -1058 1370 1072 -1372
		mu 0 4 866 865 882 883
		f 4 -1059 1371 1073 -1373
		mu 0 4 867 866 883 884
		f 4 -1060 1372 1074 -1374
		mu 0 4 868 867 884 885
		f 4 -1061 1373 1075 -1375
		mu 0 4 869 868 885 886
		f 4 -1062 1374 1076 -1376
		mu 0 4 870 869 886 887
		f 4 -1063 1375 1077 -1377
		mu 0 4 871 870 887 888
		f 4 -1064 1376 1078 -1378
		mu 0 4 872 871 888 889
		f 4 -1065 1377 1079 -1379
		mu 0 4 873 872 889 890
		f 4 -1066 1378 1080 -1380
		mu 0 4 874 873 890 891
		f 4 -1067 1380 1081 -1366
		mu 0 4 876 875 892 893
		f 4 -1068 1381 1082 -1383
		mu 0 4 878 877 894 895
		f 4 -1069 1382 1083 -1384
		mu 0 4 879 878 895 896
		f 4 -1070 1383 1084 -1385
		mu 0 4 880 879 896 897
		f 4 -1071 1384 1085 -1386
		mu 0 4 881 880 897 898
		f 4 -1072 1385 1086 -1387
		mu 0 4 882 881 898 899
		f 4 -1073 1386 1087 -1388
		mu 0 4 883 882 899 900
		f 4 -1074 1387 1088 -1389
		mu 0 4 884 883 900 901
		f 4 -1075 1388 1089 -1390
		mu 0 4 885 884 901 902
		f 4 -1076 1389 1090 -1391
		mu 0 4 886 885 902 903
		f 4 -1077 1390 1091 -1392
		mu 0 4 887 886 903 904
		f 4 -1078 1391 1092 -1393
		mu 0 4 888 887 904 905
		f 4 -1079 1392 1093 -1394
		mu 0 4 889 888 905 906
		f 4 -1080 1393 1094 -1395
		mu 0 4 890 889 906 907
		f 4 -1081 1394 1095 -1396
		mu 0 4 891 890 907 908
		f 4 -1082 1396 1096 -1382
		mu 0 4 893 892 909 910
		f 4 -1083 1397 1097 -1399
		mu 0 4 895 894 911 912
		f 4 -1084 1398 1098 -1400
		mu 0 4 896 895 912 913
		f 4 -1085 1399 1099 -1401
		mu 0 4 897 896 913 914
		f 4 -1086 1400 1100 -1402
		mu 0 4 898 897 914 915
		f 4 -1087 1401 1101 -1403
		mu 0 4 899 898 915 916
		f 4 -1088 1402 1102 -1404
		mu 0 4 900 899 916 917
		f 4 -1089 1403 1103 -1405
		mu 0 4 901 900 917 918
		f 4 -1090 1404 1104 -1406
		mu 0 4 902 901 918 919
		f 4 -1091 1405 1105 -1407
		mu 0 4 903 902 919 920
		f 4 -1092 1406 1106 -1408
		mu 0 4 904 903 920 921
		f 4 -1093 1407 1107 -1409
		mu 0 4 905 904 921 922
		f 4 -1094 1408 1108 -1410
		mu 0 4 906 905 922 923
		f 4 -1095 1409 1109 -1411
		mu 0 4 907 906 923 924
		f 4 -1096 1410 1110 -1412
		mu 0 4 908 907 924 925
		f 4 -1097 1412 1111 -1398
		mu 0 4 910 909 926 927
		f 4 -1098 1413 1112 -1415
		mu 0 4 912 911 928 929
		f 4 -1099 1414 1113 -1416
		mu 0 4 913 912 929 930
		f 4 -1100 1415 1114 -1417
		mu 0 4 914 913 930 931
		f 4 -1101 1416 1115 -1418
		mu 0 4 915 914 931 932
		f 4 -1102 1417 1116 -1419
		mu 0 4 916 915 932 933
		f 4 -1103 1418 1117 -1420
		mu 0 4 917 916 933 934
		f 4 -1104 1419 1118 -1421
		mu 0 4 918 917 934 935
		f 4 -1105 1420 1119 -1422
		mu 0 4 919 918 935 936
		f 4 -1106 1421 1120 -1423
		mu 0 4 920 919 936 937
		f 4 -1107 1422 1121 -1424
		mu 0 4 921 920 937 938
		f 4 -1108 1423 1122 -1425
		mu 0 4 922 921 938 939
		f 4 -1109 1424 1123 -1426
		mu 0 4 923 922 939 940
		f 4 -1110 1425 1124 -1427
		mu 0 4 924 923 940 941
		f 4 -1111 1426 1125 -1428
		mu 0 4 925 924 941 942
		f 4 -1112 1428 1126 -1414
		mu 0 4 927 926 943 944
		f 4 -1113 1429 1127 -1431
		mu 0 4 929 928 945 946
		f 4 -1114 1430 1128 -1432
		mu 0 4 930 929 946 947
		f 4 -1115 1431 1129 -1433
		mu 0 4 931 930 947 948
		f 4 -1116 1432 1130 -1434
		mu 0 4 932 931 948 949
		f 4 -1117 1433 1131 -1435
		mu 0 4 933 932 949 950
		f 4 -1118 1434 1132 -1436
		mu 0 4 934 933 950 951
		f 4 -1119 1435 1133 -1437
		mu 0 4 935 934 951 952
		f 4 -1120 1436 1134 -1438
		mu 0 4 936 935 952 953
		f 4 -1121 1437 1135 -1439
		mu 0 4 937 936 953 954
		f 4 -1122 1438 1136 -1440
		mu 0 4 938 937 954 955
		f 4 -1123 1439 1137 -1441
		mu 0 4 939 938 955 956
		f 4 -1124 1440 1138 -1442
		mu 0 4 940 939 956 957
		f 4 -1125 1441 1139 -1443
		mu 0 4 941 940 957 958
		f 4 -1126 1442 1140 -1444
		mu 0 4 942 941 958 959
		f 4 -1127 1444 1141 -1430
		mu 0 4 944 943 960 961
		f 4 -1128 1445 1142 -1447
		mu 0 4 946 945 962 963
		f 4 -1129 1446 1143 -1448
		mu 0 4 947 946 963 964
		f 4 -1130 1447 1144 -1449
		mu 0 4 948 947 964 965
		f 4 -1131 1448 1145 -1450
		mu 0 4 949 948 965 966
		f 4 -1132 1449 1146 -1451
		mu 0 4 950 949 966 967
		f 4 -1133 1450 1147 -1452
		mu 0 4 951 950 967 968
		f 4 -1134 1451 1148 -1453
		mu 0 4 952 951 968 969
		f 4 -1135 1452 1149 -1454
		mu 0 4 953 952 969 970
		f 4 -1136 1453 1150 -1455
		mu 0 4 954 953 970 971
		f 4 -1137 1454 1151 -1456
		mu 0 4 955 954 971 972
		f 4 -1138 1455 1152 -1457
		mu 0 4 956 955 972 973
		f 4 -1139 1456 1153 -1458
		mu 0 4 957 956 973 974
		f 4 -1140 1457 1154 -1459
		mu 0 4 958 957 974 975
		f 4 -1141 1458 1155 -1460
		mu 0 4 959 958 975 976
		f 4 -1142 1460 1156 -1446
		mu 0 4 961 960 977 978
		f 4 -1143 1461 857 -1463
		mu 0 4 963 962 979 980
		f 4 -1144 1462 858 -1464
		mu 0 4 964 963 980 981
		f 4 -1145 1463 859 -1465
		mu 0 4 965 964 981 982
		f 4 -1146 1464 860 -1466
		mu 0 4 966 965 982 983
		f 4 -1147 1465 861 -1467
		mu 0 4 967 966 983 984
		f 4 -1148 1466 862 -1468
		mu 0 4 968 967 984 985
		f 4 -1149 1467 863 -1469
		mu 0 4 969 968 985 986
		f 4 -1150 1468 864 -1470
		mu 0 4 970 969 986 987
		f 4 -1151 1469 865 -1471
		mu 0 4 971 970 987 988
		f 4 -1152 1470 866 -1472
		mu 0 4 972 971 988 989
		f 4 -1153 1471 867 -1473
		mu 0 4 973 972 989 990
		f 4 -1154 1472 868 -1474
		mu 0 4 974 973 990 991
		f 4 -1155 1473 869 -1475
		mu 0 4 975 974 991 992
		f 4 -1156 1474 870 -1476
		mu 0 4 976 975 992 993
		f 4 -1157 1476 871 -1462
		mu 0 4 978 977 994 995
		f 4 -1237 1477 -1413 1478
		mu 0 4 996 997 998 999
		f 4 -1253 -1479 -1397 1479
		mu 0 4 1000 1001 1002 1003
		f 4 -1381 1480 -1269 -1480
		mu 0 4 1004 1005 1006 1007
		f 4 -1285 -1481 -1365 1481
		mu 0 4 1008 1009 1010 1011
		f 4 -1349 1482 -1301 -1482
		mu 0 4 1012 1013 1014 1015
		f 3 -1317 -1483 -1333
		mu 0 3 1016 1017 1018
		f 4 -1221 1483 -1429 -1478
		mu 0 4 1019 1020 1021 1022
		f 4 -1445 -1484 -1205 1484
		mu 0 4 1023 1024 1025 1026
		f 4 -1189 1485 -1461 -1485
		mu 0 4 1027 1028 1029 1030
		f 3 -1477 -1486 -1173
		mu 0 3 1031 1032 1033
		f 4 1251 1486 1379 1487
		mu 0 4 1034 1035 1036 1037
		f 4 1235 -1488 1395 1488
		mu 0 4 1038 1039 1040 1041
		f 4 1267 1489 1363 -1487
		mu 0 4 1042 1043 1044 1045
		f 4 1347 -1490 1283 1490
		mu 0 4 1046 1047 1048 1049
		f 4 1299 1315 1331 -1491
		mu 0 4 1050 1051 1052 1053
		f 4 1411 1491 1219 -1489
		mu 0 4 1054 1055 1056 1057
		f 4 1203 -1492 1427 1492
		mu 0 4 1058 1059 1060 1061
		f 4 1443 1493 1187 -1493
		mu 0 4 1062 1063 1064 1065
		f 4 1171 -1494 1459 1475
		mu 0 4 1066 1067 1068 1069;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode parentConstraint -n "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2" 
		-p "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp";
	rename -uid "14605806-4B87-615D-5F2C-B58975C99DF2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "IK_knee_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" -0.00045474388259534806 194.0365651069724 -89.999832235967844 ;
	setAttr ".rst" -type "double3" -3.9999982649846735 -0.00014042853273374048 -1.1146201218106684 ;
	setAttr ".rsrr" -type "double3" -0.00018002804286047444 14.036340339150859 -7.4640145540505663e-05 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint2" 
		-p "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp";
	rename -uid "16BDBFA4-4305-1CA5-EFD4-0C8981B89000";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
createNode transform -n "LegFoot__instance_1_mirror:hook_grp" -p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "0689E1FE-41DE-EC39-F4AD-E996E9945545";
createNode joint -n "LegFoot__instance_1_mirror:hook_root_joint" -p "LegFoot__instance_1_mirror:hook_grp";
	rename -uid "A1D47999-4F88-D0E8-4CB1-2B80B5AB994E";
	setAttr ".v" no;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 90 ;
createNode joint -n "LegFoot__instance_1_mirror:hook_target_joint" -p "LegFoot__instance_1_mirror:hook_root_joint";
	rename -uid "3B96525E-4DC1-A4C2-4D13-2EB928A1B453";
	setAttr ".v" no;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -90 ;
createNode ikEffector -n "LegFoot__instance_1_mirror:hook_root_jointikEffector" -p
		 "LegFoot__instance_1_mirror:hook_root_joint";
	rename -uid "A7DF8A63-4473-81DB-06F9-A097414125EC";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode pointConstraint -n "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint" 
		-p "LegFoot__instance_1_mirror:hook_root_joint";
	rename -uid "1FD01451-4066-E11C-3258-0D8DE90EB5AF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
createNode transform -n "LegFoot__instance_1_mirror:unhookedTarget" -p "LegFoot__instance_1_mirror:hook_grp";
	rename -uid "4F641AC6-423A-26BB-D716-1C9EF9E694E6";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:unhookedTargetShape" -p "LegFoot__instance_1_mirror:unhookedTarget";
	rename -uid "04025B01-48A7-4427-2667-4FB2A997D179";
	setAttr -k off ".v";
createNode pointConstraint -n "unhookedTarget_pointConstraint2" -p "LegFoot__instance_1_mirror:unhookedTarget";
	rename -uid "876DF0BC-441A-96D2-3F3B-41B8ACFCB32C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 0 0.001 0 ;
	setAttr ".rst" -type "double3" 0 0.001 0 ;
	setAttr -k on ".w0";
createNode ikHandle -n "LegFoot__instance_1_mirror:hook_root_joint_ikHandle" -p "LegFoot__instance_1_mirror:hook_grp";
	rename -uid "817C1BC5-4847-5677-744F-4391BA1F0716";
	setAttr ".v" no;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "hook_root_joint_ikHandle_poleVectorConstraint2" 
		-p "LegFoot__instance_1_mirror:hook_root_joint_ikHandle";
	rename -uid "0822B488-4439-3F68-D224-46BE14873512";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hook_root_joint_ikHandle_poleVectorLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 1 0 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint" 
		-p "LegFoot__instance_1_mirror:hook_root_joint_ikHandle";
	rename -uid "116B9914-45EA-235A-41B2-01A2DE1FDE98";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hook_target_joint_endPosLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 0.001 0 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator" 
		-p "LegFoot__instance_1_mirror:hook_grp";
	rename -uid "CA48B7CD-4233-217D-8BC3-F0A9E4D45AE7";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocatorShape" 
		-p "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator";
	rename -uid "18AE0CE3-421E-213F-0F9E-ED8DCD57819A";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint" 
		-p "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator";
	rename -uid "BF5A76B1-4611-7C33-709C-F68EB70C487F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hook_root_jointW0" -dv 1 -min 0 -at "double";
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
createNode transform -n "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator" 
		-p "LegFoot__instance_1_mirror:hook_grp";
	rename -uid "32F60D1D-4069-AA17-6443-20BFDED117B2";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:hook_target_joint_endPosLocatorShape" 
		-p "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator";
	rename -uid "1391A28B-4256-BA60-B15E-06BD116B4FDA";
	setAttr -k off ".v";
createNode pointConstraint -n "LegFoot__instance_1_mirror:hook_pointConstraint" -p
		 "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator";
	rename -uid "D9720392-4344-EE9C-E149-0C80DF488228";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "unhookedTargetW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 0.001 0 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_poleVectorLocator" 
		-p "LegFoot__instance_1_mirror:hook_grp";
	rename -uid "0F4F5905-4B1A-B8FE-4542-35894F8224A8";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1 0 ;
createNode locator -n "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_poleVectorLocatorShape" 
		-p "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_poleVectorLocator";
	rename -uid "0CB6D497-452B-03DB-572F-C086EA9E0D1A";
	setAttr -k off ".v";
createNode transform -n "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp" 
		-p "LegFoot__instance_1_mirror:hook_grp";
	rename -uid "5B42DF1A-412B-0505-846F-1B8367446E83";
createNode transform -n "LegFoot__instance_1_mirror:hook_root_joint_hook_representation" 
		-p "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp";
	rename -uid "B3F4E7BB-467C-B815-3982-9196054A3E3D";
createNode nurbsSurface -n "LegFoot__instance_1_mirror:hook_root_joint_hook_representationShape" 
		-p "LegFoot__instance_1_mirror:hook_root_joint_hook_representation";
	rename -uid "32EC1885-441A-4D04-C259-0F82A1203472";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		6 0 0 0 10 10 10
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		44
		0 -0.15672232497824501 -0.15672232497824506
		0 -0.22163883751087782 -3.5945998741709007e-17
		0 -0.15672232497824509 0.15672232497824481
		0 -2.862699950697759e-16 0.22163883751087754
		0 0.15672232497824459 0.15672232497824484
		0 0.22163883751087743 5.5517673144427339e-18
		0 0.15672232497824468 -0.15672232497824484
		0 -1.030019529394196e-16 -0.22163883751087765
		0 -0.15672232497824501 -0.15672232497824506
		0 -0.22163883751087782 -3.5945998741709007e-17
		0 -0.15672232497824509 0.15672232497824481
		0.33333333333333337 -0.15672232497824487 -0.15672232497824504
		0.33333333333333337 -0.22163883751087768 4.8755612298694312e-18
		0.33333333333333337 -0.15672232497824495 0.15672232497824484
		0.33333333333333331 -1.3824025845308839e-16 0.22163883751087757
		0.33333333333333326 0.15672232497824473 0.15672232497824487
		0.33333333333333326 0.22163883751087757 4.6373327286021172e-17
		0.33333333333333326 0.15672232497824481 -0.15672232497824481
		0.33333333333333331 4.502778367726793e-17 -0.22163883751087762
		0.33333333333333337 -0.15672232497824487 -0.15672232497824504
		0.33333333333333337 -0.22163883751087768 4.8755612298694312e-18
		0.33333333333333337 -0.15672232497824495 0.15672232497824484
		0.66666666666666674 -0.1567223249782447 -0.15672232497824498
		0.66666666666666674 -0.22163883751087751 4.5697121201447876e-17
		0.66666666666666674 -0.15672232497824479 0.1567223249782449
		0.66666666666666674 9.7894781635991762e-18 0.22163883751087762
		0.66666666666666663 0.1567223249782449 0.15672232497824493
		0.66666666666666663 0.22163883751087773 8.719488725759961e-17
		0.66666666666666663 0.15672232497824498 -0.15672232497824476
		0.66666666666666674 1.9305752029395549e-16 -0.22163883751087757
		0.66666666666666674 -0.1567223249782447 -0.15672232497824498
		0.66666666666666674 -0.22163883751087751 4.5697121201447876e-17
		0.66666666666666674 -0.15672232497824479 0.1567223249782449
		1 -0.15672232497824456 -0.15672232497824495
		1 -0.22163883751087737 8.651868117302632e-17
		1 -0.15672232497824465 0.15672232497824493
		1 1.5781921478028672e-16 0.22163883751087765
		1 0.15672232497824504 0.15672232497824495
		1 0.22163883751087787 1.2801644722917804e-16
		1 0.15672232497824512 -0.15672232497824473
		1 3.4108725691064299e-16 -0.22163883751087754
		1 -0.15672232497824456 -0.15672232497824495
		1 -0.22163883751087737 8.651868117302632e-17
		1 -0.15672232497824465 0.15672232497824493
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode parentConstraint -n "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2" 
		-p "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp";
	rename -uid "9FE8FC77-4867-40C1-95A5-548399911E98";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hook_root_jointW0" -dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 0 0 90 ;
	setAttr ".rsrr" -type "double3" 0 0 90 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint2" 
		-p "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp";
	rename -uid "CBC4691E-4D69-A4B5-041C-BCA510ED0810";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "module_transformW0" -dv 1 -min 0 
		-at "double";
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
createNode transform -n "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp" 
		-p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "739DA8B7-452B-2A5E-E28A-8F8684CDED66";
createNode transform -n "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator" 
		-p "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "6B78CCAC-410F-974F-6B10-F1A7EB00478A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0.5 6.123233995736766e-17 ;
createNode locator -n "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocatorShape" 
		-p "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator";
	rename -uid "B1F0A21C-4BC6-CD72-E4C5-C485D50647EA";
	setAttr -k off ".v";
createNode parentConstraint -n "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2" 
		-p "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "FF47A19D-42EF-A436-E10B-9184E994180E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 180 0 0 ;
	setAttr ".rsrr" -type "double3" 180 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp" 
		-p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "EB7F6618-495B-9527-D6E5-CA8BFAB037DC";
createNode transform -n "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator" 
		-p "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "1F8EABB9-4F30-2807-A43D-4391A12A5B48";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0.5 1.1102230246251565e-16 ;
createNode locator -n "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocatorShape" 
		-p "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator";
	rename -uid "BBBF9D90-49E0-9463-769A-BFABFD51F647";
	setAttr -k off ".v";
createNode parentConstraint -n "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2" 
		-p "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "87E37645-42AD-4354-DAB1-5F824354C7CB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 180 0 0 ;
	setAttr ".rst" -type "double3" -4 2.4651903288156619e-32 -1 ;
	setAttr ".rsrr" -type "double3" 180 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp" 
		-p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "9C8CFE79-495A-3751-F757-09B526033AC8";
createNode transform -n "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator" 
		-p "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "D88479F8-4159-CE68-1905-DA94D7807043";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0.5 6.1232339957367623e-17 ;
createNode locator -n "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocatorShape" 
		-p "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator";
	rename -uid "9EC5CF6C-40E2-6F9E-E6AA-E4B0EB4D9CFA";
	setAttr -k off ".v";
createNode parentConstraint -n "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2" 
		-p "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "0DB70EBE-4C3D-5120-8B6D-CD9733D70D6E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 180 0 0 ;
	setAttr ".rst" -type "double3" -8 6.0684932812713713e-32 -2.2204460492503131e-16 ;
	setAttr ".rsrr" -type "double3" 180 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp" 
		-p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "129CADC6-4006-14C1-4F72-8C9DA30750AE";
createNode transform -n "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator" 
		-p "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "8691D9A0-436F-E28C-A48F-52A22DADCEC1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0.5 1.1102230246251565e-16 ;
createNode locator -n "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocatorShape" 
		-p "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator";
	rename -uid "43F59156-4723-E8D3-98E9-A6926CF0E09E";
	setAttr -k off ".v";
createNode parentConstraint -n "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2" 
		-p "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp";
	rename -uid "E58C4B00-40E9-4FE0-09C7-F4B9C277F215";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ball_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".lr" -type "double3" 180 0 0 ;
	setAttr ".rst" -type "double3" 1.9984014443252818e-15 -9 3 ;
	setAttr ".rsrr" -type "double3" 180 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:IK_hip_joint_positionLocator" 
		-p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "69367920-40B1-13A3-3C5C-1F8E8D45C87B";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:IK_hip_joint_positionLocatorShape" 
		-p "LegFoot__instance_1_mirror:IK_hip_joint_positionLocator";
	rename -uid "BEFBD8E3-4EB5-0DBD-D1CD-1E88C74E0725";
	setAttr -k off ".v";
createNode joint -n "LegFoot__instance_1_mirror:IK_hip_joint" -p "LegFoot__instance_1_mirror:IK_hip_joint_positionLocator";
	rename -uid "9CCC7A51-4246-D543-99B9-03882466EF35";
	setAttr ".v" no;
	setAttr ".r" -type "double3" 14.450002498803718 -13.609274375970255 -93.469892329194522 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 -14.036243467926482 0 ;
	setAttr ".pa" -type "double3" 0 -50 0 ;
createNode joint -n "LegFoot__instance_1_mirror:IK_knee_joint" -p "LegFoot__instance_1_mirror:IK_hip_joint";
	rename -uid "231275D8-4F21-861F-B113-409D90A3B1CD";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.2053368091583252 8.290701458690819e-12 7.0748591076126867e-07 ;
	setAttr ".r" -type "double3" -1.6476845973834675e-05 56.145617150727389 3.8931820173668819e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.4842912056249647e-15 -28.072486935852965 -5.9371648224998572e-15 ;
	setAttr ".pa" -type "double3" 0 50 0 ;
createNode joint -n "LegFoot__instance_1_mirror:IK_ankle_joint" -p "LegFoot__instance_1_mirror:IK_knee_joint";
	rename -uid "1A9F29A6-4A21-6BC7-F9B4-B9AED1F48D37";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.2053368091583252 -3.2315908240487801e-06 -7.0750323966084494e-07 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 153.42734147199687 -23.00936329637852 -128.00775720672613 ;
createNode joint -n "IK_ball_joint1" -p "LegFoot__instance_1_mirror:IK_ankle_joint";
	rename -uid "A4B36FD0-461F-3E48-61DF-8BAF31804A93";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -12.40970275046732 3.2148622010286232e-05 -3.212588375989256e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 3.6232894814148571e-14 69.44395478041649 46.48887222312112 ;
createNode joint -n "IK_toe_joint1" -p "IK_ball_joint1";
	rename -uid "7B68652A-4F41-B88E-F348-A18150AC79E3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -3.0000035298101944 -8.7320083734354625e-05 -1.2655412575668379e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 8.5377368141828076e-07 89.999999999999972 0 ;
createNode ikEffector -n "LegFoot__instance_1_mirror:IK_hip_joint_ikEffector" -p "LegFoot__instance_1_mirror:IK_knee_joint";
	rename -uid "B5BD4BEB-47BB-2B1C-0AE7-5986B5A33C88";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode pointConstraint -n "IK_hip_joint_positionLocator_pointConstraint2" -p "LegFoot__instance_1_mirror:IK_hip_joint_positionLocator";
	rename -uid "DC19A7B7-46D4-F414-59ED-DCB662A7870D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
createNode transform -n "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator" 
		-p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "C5DAE86D-44E3-FAAB-4580-9D9371620E02";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:IK_knee_joint_positionLocatorShape" 
		-p "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator";
	rename -uid "801BA252-47F2-A658-519A-5682ADCEB1AD";
	setAttr -k off ".v";
createNode pointConstraint -n "IK_knee_joint_positionLocator_pointConstraint2" -p
		 "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator";
	rename -uid "C9A30F3B-4D13-F141-84FA-3DB75E88D41D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "knee_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -4 2.4651903288156619e-32 -1 ;
	setAttr -k on ".w0";
createNode transform -n "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocator" 
		-p "LegFoot__instance_1_mirror:module_grp";
	rename -uid "83332CDA-49BD-3079-7A66-0FA6F19D33D3";
	setAttr ".v" no;
createNode locator -n "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocatorShape" 
		-p "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocator";
	rename -uid "47C122A8-4545-C2EF-F55C-118B68E318AF";
	setAttr -k off ".v";
createNode ikHandle -n "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle" -p "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocator";
	rename -uid "8E18017D-4859-0599-DC08-1BB0A11B7DD1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -6.4553633761519904e-16 1.8897270157580692e-06 6.106226635438361e-16 ;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "IK_hip_joint_ikHandle_poleVectorConstraint2" 
		-p "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle";
	rename -uid "66E38C41-414B-A055-66F5-1683A75A09CF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "IK_knee_joint_positionLocatorW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -4.1482103163610355e-18 -1.16935 0.29233899999999996 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "IK_hip_joint_ikHandle_positionLocator_pointConstraint2" 
		-p "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocator";
	rename -uid "557A7422-4157-CA5D-9A7E-C5B57FCBC8C8";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ankle_joint_translation_controlW0" 
		-dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -8 6.0684932812713713e-32 -2.2204460492503131e-16 ;
	setAttr -k on ".w0";
createNode transform -n "Group__legs";
	rename -uid "28F5BF22-4A07-29F1-5FEA-69A7B42123DB";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr -l on -k off ".v";
	setAttr -k off ".sx";
	setAttr -k off ".sz";
	setAttr ".aal" -type "attributeAlias" {"globalScale","scaleY"} ;
createNode mesh -n "Group__legsShape" -p "Group__legs";
	rename -uid "E8A8EF38-46FA-AF55-35AA-ACAF3FE778F1";
	setAttr -k off ".v";
	setAttr ".ovs" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 26 ".uvst[0].uvsp[0:25]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.375 0 0.625
		 0 0.625 0.25 0.375 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".vt[0:19]"  -1 -1 1 1 -1 1 -1 1 1 1 1 1 -1 1 -1 1 1 -1
		 -1 -1 -1 1 -1 -1 -4.3673398e-07 -1.48870528 0 4.3673398e-07 -1.48870528 0 -4.3673398e-07 1.48870528 0
		 4.3673398e-07 1.48870528 0 1.48870528 -4.3673398e-07 0 1.48870528 4.3673398e-07 0
		 -1.48870528 -4.3673398e-07 0 -1.48870528 4.3673398e-07 0 3.3055887e-16 -4.3673398e-07 -1.48870528
		 3.3055905e-16 4.3673398e-07 -1.48870528 -3.3055905e-16 -4.3673398e-07 1.48870528
		 -3.3055887e-16 4.3673398e-07 1.48870528;
	setAttr -s 24 ".ed[0:23]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 8 9 0 10 11 0 8 10 0 9 11 0 12 13 0 14 15 0 12 14 0
		 13 15 0 16 17 0 18 19 0 16 18 0 17 19 0;
	setAttr -s 9 -ch 36 ".fc[0:8]" -type "polyFaces" 
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
		mu 0 4 12 0 2 13
		f 4 12 15 -14 -15
		mu 0 4 14 15 16 17
		f 4 16 19 -18 -19
		mu 0 4 18 19 20 21
		f 4 20 23 -22 -23
		mu 0 4 22 23 24 25;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "LegFoot__instance_1:module_transform" -p "Group__legs";
	rename -uid "E3731502-4FD8-CF97-21B1-76B65EE0C6B6";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".t" -type "double3" 1.9999999999999998 0 0 ;
	setAttr ".s" -type "double3" 0.29233710334467522 0.29233710334467522 0.29233710334467522 ;
	setAttr ".aal" -type "attributeAlias" {"globalScale","scaleY"} ;
createNode mesh -n "LegFoot__instance_1:module_transformShape" -p "LegFoot__instance_1:module_transform";
	rename -uid "7EA2F7D7-421F-D3DE-5533-92AB9C94B2C5";
	setAttr -k off ".v";
	setAttr ".ovs" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 26 ".uvst[0].uvsp[0:25]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.375 0 0.625
		 0 0.625 0.25 0.375 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".vt[0:19]"  -1 -1 1 1 -1 1 -1 1 1 1 1 1 -1 1 -1 1 1 -1
		 -1 -1 -1 1 -1 -1 -4.3673398e-07 -1.48870528 0 4.3673398e-07 -1.48870528 0 -4.3673398e-07 1.48870528 0
		 4.3673398e-07 1.48870528 0 1.48870528 -4.3673398e-07 0 1.48870528 4.3673398e-07 0
		 -1.48870528 -4.3673398e-07 0 -1.48870528 4.3673398e-07 0 3.3055887e-16 -4.3673398e-07 -1.48870528
		 3.3055905e-16 4.3673398e-07 -1.48870528 -3.3055905e-16 -4.3673398e-07 1.48870528
		 -3.3055887e-16 4.3673398e-07 1.48870528;
	setAttr -s 24 ".ed[0:23]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 8 9 0 10 11 0 8 10 0 9 11 0 12 13 0 14 15 0 12 14 0
		 13 15 0 16 17 0 18 19 0 16 18 0 17 19 0;
	setAttr -s 9 -ch 36 ".fc[0:8]" -type "polyFaces" 
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
		mu 0 4 12 0 2 13
		f 4 12 15 -14 -15
		mu 0 4 14 15 16 17
		f 4 16 19 -18 -19
		mu 0 4 18 19 20 21
		f 4 20 23 -22 -23
		mu 0 4 22 23 24 25;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "LegFoot__instance_1:hip_joint_translation_control" -p "LegFoot__instance_1:module_transform";
	rename -uid "55C88C63-4877-E255-28B1-7D9CC8018F15";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsSurface -n "LegFoot__instance_1:hip_joint_translation_controlShape" 
		-p "LegFoot__instance_1:hip_joint_translation_control";
	rename -uid "2DD3AB83-4F99-88CA-B591-B380025325D0";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		1.151601345627845e-16 -1 0.28272503694690354
		-0.19991679083637259 -1 0.19991679083637273
		-0.28272503694690365 -1 5.7191723447539755e-17
		-0.19991679083637276 -1 -0.19991679083637259
		-1.8508566094318079e-16 -1 -0.28272503694690365
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		1.9902882483877521e-16 -0.78361162489122427 0.87176363753180319
		-0.61642997969058921 -0.78361162489122427 0.61642997969058955
		-0.8717636375318033 -0.78361162489122427 1.6111055650702835e-16
		-0.61642997969058944 -0.78361162489122427 -0.61642997969058899
		-4.1463948278396632e-16 -0.78361162489122427 -0.87176363753180319
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		2.051909376318187e-16 -6.284284658528814e-17 1.2264094625656803
		-0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		-1.2264094625656805 1.2253074553466149e-17 2.1934926354574312e-16
		-0.86720244749154174 6.5353909630129502e-17 -0.8672024474915413
		-5.0851507246572639e-16 8.7348995692220465e-17 -1.2264094625656803
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		9.2681250202978354e-17 0.78361162489122449 0.87176363753180341
		-0.61642997969058944 0.78361162489122449 0.61642997969058966
		-0.87176363753180353 0.78361162489122449 1.507277286910009e-16
		-0.61642997969058955 0.78361162489122449 -0.61642997969058932
		-3.0829190814816951e-16 0.78361162489122449 -0.87176363753180341
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		-2.0554511899433756e-17 0.99999999999999989 0.28272503694690376
		-0.19991679083637282 0.99999999999999989 0.19991679083637282
		-0.28272503694690376 0.99999999999999989 4.3941756900056795e-17
		-0.19991679083637273 0.99999999999999989 -0.1999167908363727
		-4.9371014480962574e-17 0.99999999999999989 -0.28272503694690365
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "LegFoot__instance_1:knee_joint_translation_control" -p "LegFoot__instance_1:module_transform";
	rename -uid "23C3B82A-4012-9ED1-95C4-29BECE02B133";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 -4 1 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsSurface -n "LegFoot__instance_1:knee_joint_translation_controlShape" 
		-p "LegFoot__instance_1:knee_joint_translation_control";
	rename -uid "32EA48E3-40E5-A935-6F29-57BA809FB1DD";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		1.151601345627845e-16 -1 0.28272503694690354
		-0.19991679083637259 -1 0.19991679083637273
		-0.28272503694690365 -1 5.7191723447539755e-17
		-0.19991679083637276 -1 -0.19991679083637259
		-1.8508566094318079e-16 -1 -0.28272503694690365
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		1.9902882483877521e-16 -0.78361162489122427 0.87176363753180319
		-0.61642997969058921 -0.78361162489122427 0.61642997969058955
		-0.8717636375318033 -0.78361162489122427 1.6111055650702835e-16
		-0.61642997969058944 -0.78361162489122427 -0.61642997969058899
		-4.1463948278396632e-16 -0.78361162489122427 -0.87176363753180319
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		2.051909376318187e-16 -6.284284658528814e-17 1.2264094625656803
		-0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		-1.2264094625656805 1.2253074553466149e-17 2.1934926354574312e-16
		-0.86720244749154174 6.5353909630129502e-17 -0.8672024474915413
		-5.0851507246572639e-16 8.7348995692220465e-17 -1.2264094625656803
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		9.2681250202978354e-17 0.78361162489122449 0.87176363753180341
		-0.61642997969058944 0.78361162489122449 0.61642997969058966
		-0.87176363753180353 0.78361162489122449 1.507277286910009e-16
		-0.61642997969058955 0.78361162489122449 -0.61642997969058932
		-3.0829190814816951e-16 0.78361162489122449 -0.87176363753180341
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		-2.0554511899433756e-17 0.99999999999999989 0.28272503694690376
		-0.19991679083637282 0.99999999999999989 0.19991679083637282
		-0.28272503694690376 0.99999999999999989 4.3941756900056795e-17
		-0.19991679083637273 0.99999999999999989 -0.1999167908363727
		-4.9371014480962574e-17 0.99999999999999989 -0.28272503694690365
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "LegFoot__instance_1:ankle_joint_translation_control" -p "LegFoot__instance_1:module_transform";
	rename -uid "CBD9B7B7-4BD0-418E-E88B-8383EC640AD4";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 -8 0 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsSurface -n "LegFoot__instance_1:ankle_joint_translation_controlShape" 
		-p "LegFoot__instance_1:ankle_joint_translation_control";
	rename -uid "FDF76635-4399-662C-11C0-83B8B3AE800A";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		1.151601345627845e-16 -1 0.28272503694690354
		-0.19991679083637259 -1 0.19991679083637273
		-0.28272503694690365 -1 5.7191723447539755e-17
		-0.19991679083637276 -1 -0.19991679083637259
		-1.8508566094318079e-16 -1 -0.28272503694690365
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		1.9902882483877521e-16 -0.78361162489122427 0.87176363753180319
		-0.61642997969058921 -0.78361162489122427 0.61642997969058955
		-0.8717636375318033 -0.78361162489122427 1.6111055650702835e-16
		-0.61642997969058944 -0.78361162489122427 -0.61642997969058899
		-4.1463948278396632e-16 -0.78361162489122427 -0.87176363753180319
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		2.051909376318187e-16 -6.284284658528814e-17 1.2264094625656803
		-0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		-1.2264094625656805 1.2253074553466149e-17 2.1934926354574312e-16
		-0.86720244749154174 6.5353909630129502e-17 -0.8672024474915413
		-5.0851507246572639e-16 8.7348995692220465e-17 -1.2264094625656803
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		9.2681250202978354e-17 0.78361162489122449 0.87176363753180341
		-0.61642997969058944 0.78361162489122449 0.61642997969058966
		-0.87176363753180353 0.78361162489122449 1.507277286910009e-16
		-0.61642997969058955 0.78361162489122449 -0.61642997969058932
		-3.0829190814816951e-16 0.78361162489122449 -0.87176363753180341
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		-2.0554511899433756e-17 0.99999999999999989 0.28272503694690376
		-0.19991679083637282 0.99999999999999989 0.19991679083637282
		-0.28272503694690376 0.99999999999999989 4.3941756900056795e-17
		-0.19991679083637273 0.99999999999999989 -0.1999167908363727
		-4.9371014480962574e-17 0.99999999999999989 -0.28272503694690365
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "LegFoot__instance_1:ball_joint_translation_control" -p "LegFoot__instance_1:module_transform";
	rename -uid "0CCDFDA8-44D1-B1AE-D12E-F194BE3BF564";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 -9.0000000000000018 2.9999999999999991 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsSurface -n "LegFoot__instance_1:ball_joint_translation_controlShape" 
		-p "LegFoot__instance_1:ball_joint_translation_control";
	rename -uid "91F995BA-429E-7D04-3926-14ACE164CA31";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		1.151601345627845e-16 -1 0.28272503694690354
		-0.19991679083637259 -1 0.19991679083637273
		-0.28272503694690365 -1 5.7191723447539755e-17
		-0.19991679083637276 -1 -0.19991679083637259
		-1.8508566094318079e-16 -1 -0.28272503694690365
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		1.9902882483877521e-16 -0.78361162489122427 0.87176363753180319
		-0.61642997969058921 -0.78361162489122427 0.61642997969058955
		-0.8717636375318033 -0.78361162489122427 1.6111055650702835e-16
		-0.61642997969058944 -0.78361162489122427 -0.61642997969058899
		-4.1463948278396632e-16 -0.78361162489122427 -0.87176363753180319
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		2.051909376318187e-16 -6.284284658528814e-17 1.2264094625656803
		-0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		-1.2264094625656805 1.2253074553466149e-17 2.1934926354574312e-16
		-0.86720244749154174 6.5353909630129502e-17 -0.8672024474915413
		-5.0851507246572639e-16 8.7348995692220465e-17 -1.2264094625656803
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		9.2681250202978354e-17 0.78361162489122449 0.87176363753180341
		-0.61642997969058944 0.78361162489122449 0.61642997969058966
		-0.87176363753180353 0.78361162489122449 1.507277286910009e-16
		-0.61642997969058955 0.78361162489122449 -0.61642997969058932
		-3.0829190814816951e-16 0.78361162489122449 -0.87176363753180341
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		-2.0554511899433756e-17 0.99999999999999989 0.28272503694690376
		-0.19991679083637282 0.99999999999999989 0.19991679083637282
		-0.28272503694690376 0.99999999999999989 4.3941756900056795e-17
		-0.19991679083637273 0.99999999999999989 -0.1999167908363727
		-4.9371014480962574e-17 0.99999999999999989 -0.28272503694690365
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "LegFoot__instance_1:toe_joint_translation_control" -p "LegFoot__instance_1:module_transform";
	rename -uid "B2455D3F-425D-505F-8233-CA9204FCDDA4";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 2.2186712959340957e-31 -9.0000000000000018 6 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsSurface -n "LegFoot__instance_1:toe_joint_translation_controlShape" 
		-p "LegFoot__instance_1:toe_joint_translation_control";
	rename -uid "49BF307F-4659-FF3B-3504-C5996F3DD8E4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		1.151601345627845e-16 -1 0.28272503694690354
		-0.19991679083637259 -1 0.19991679083637273
		-0.28272503694690365 -1 5.7191723447539755e-17
		-0.19991679083637276 -1 -0.19991679083637259
		-1.8508566094318079e-16 -1 -0.28272503694690365
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		1.9902882483877521e-16 -0.78361162489122427 0.87176363753180319
		-0.61642997969058921 -0.78361162489122427 0.61642997969058955
		-0.8717636375318033 -0.78361162489122427 1.6111055650702835e-16
		-0.61642997969058944 -0.78361162489122427 -0.61642997969058899
		-4.1463948278396632e-16 -0.78361162489122427 -0.87176363753180319
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		2.051909376318187e-16 -6.284284658528814e-17 1.2264094625656803
		-0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		-1.2264094625656805 1.2253074553466149e-17 2.1934926354574312e-16
		-0.86720244749154174 6.5353909630129502e-17 -0.8672024474915413
		-5.0851507246572639e-16 8.7348995692220465e-17 -1.2264094625656803
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		9.2681250202978354e-17 0.78361162489122449 0.87176363753180341
		-0.61642997969058944 0.78361162489122449 0.61642997969058966
		-0.87176363753180353 0.78361162489122449 1.507277286910009e-16
		-0.61642997969058955 0.78361162489122449 -0.61642997969058932
		-3.0829190814816951e-16 0.78361162489122449 -0.87176363753180341
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		-2.0554511899433756e-17 0.99999999999999989 0.28272503694690376
		-0.19991679083637282 0.99999999999999989 0.19991679083637282
		-0.28272503694690376 0.99999999999999989 4.3941756900056795e-17
		-0.19991679083637273 0.99999999999999989 -0.1999167908363727
		-4.9371014480962574e-17 0.99999999999999989 -0.28272503694690365
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "LegFoot__instance_1_mirror:module_transform" -p "Group__legs";
	rename -uid "06279B3A-4866-4958-09CD-758A984E0DE5";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".t" -type "double3" -1.9999999999999998 0 0 ;
	setAttr ".r" -type "double3" 180 0 0 ;
	setAttr ".s" -type "double3" 0.29233710334467522 0.29233710334467522 0.29233710334467522 ;
	setAttr ".aal" -type "attributeAlias" {"globalScale","scaleY"} ;
createNode mesh -n "LegFoot__instance_1_mirror:module_transformShape" -p "LegFoot__instance_1_mirror:module_transform";
	rename -uid "A7021468-4218-B71D-020F-38BBB389DC40";
	setAttr -k off ".v";
	setAttr ".ovs" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 26 ".uvst[0].uvsp[0:25]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.375 0 0.625
		 0 0.625 0.25 0.375 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".vt[0:19]"  -1 -1 1 1 -1 1 -1 1 1 1 1 1 -1 1 -1 1 1 -1
		 -1 -1 -1 1 -1 -1 -4.3673398e-07 -1.48870528 0 4.3673398e-07 -1.48870528 0 -4.3673398e-07 1.48870528 0
		 4.3673398e-07 1.48870528 0 1.48870528 -4.3673398e-07 0 1.48870528 4.3673398e-07 0
		 -1.48870528 -4.3673398e-07 0 -1.48870528 4.3673398e-07 0 3.3055887e-16 -4.3673398e-07 -1.48870528
		 3.3055905e-16 4.3673398e-07 -1.48870528 -3.3055905e-16 -4.3673398e-07 1.48870528
		 -3.3055887e-16 4.3673398e-07 1.48870528;
	setAttr -s 24 ".ed[0:23]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 8 9 0 10 11 0 8 10 0 9 11 0 12 13 0 14 15 0 12 14 0
		 13 15 0 16 17 0 18 19 0 16 18 0 17 19 0;
	setAttr -s 9 -ch 36 ".fc[0:8]" -type "polyFaces" 
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
		mu 0 4 12 0 2 13
		f 4 12 15 -14 -15
		mu 0 4 14 15 16 17
		f 4 16 19 -18 -19
		mu 0 4 18 19 20 21
		f 4 20 23 -22 -23
		mu 0 4 22 23 24 25;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "LegFoot__instance_1_mirror:hip_joint_translation_control" 
		-p "LegFoot__instance_1_mirror:module_transform";
	rename -uid "31CC6434-4B69-6BD8-0318-D5963E60AA4D";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsSurface -n "LegFoot__instance_1_mirror:hip_joint_translation_controlShape" 
		-p "LegFoot__instance_1_mirror:hip_joint_translation_control";
	rename -uid "273207EE-4B19-7894-039A-759B8AFA504C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		1.151601345627845e-16 -1 0.28272503694690354
		-0.19991679083637259 -1 0.19991679083637273
		-0.28272503694690365 -1 5.7191723447539755e-17
		-0.19991679083637276 -1 -0.19991679083637259
		-1.8508566094318079e-16 -1 -0.28272503694690365
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		1.9902882483877521e-16 -0.78361162489122427 0.87176363753180319
		-0.61642997969058921 -0.78361162489122427 0.61642997969058955
		-0.8717636375318033 -0.78361162489122427 1.6111055650702835e-16
		-0.61642997969058944 -0.78361162489122427 -0.61642997969058899
		-4.1463948278396632e-16 -0.78361162489122427 -0.87176363753180319
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		2.051909376318187e-16 -6.284284658528814e-17 1.2264094625656803
		-0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		-1.2264094625656805 1.2253074553466149e-17 2.1934926354574312e-16
		-0.86720244749154174 6.5353909630129502e-17 -0.8672024474915413
		-5.0851507246572639e-16 8.7348995692220465e-17 -1.2264094625656803
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		9.2681250202978354e-17 0.78361162489122449 0.87176363753180341
		-0.61642997969058944 0.78361162489122449 0.61642997969058966
		-0.87176363753180353 0.78361162489122449 1.507277286910009e-16
		-0.61642997969058955 0.78361162489122449 -0.61642997969058932
		-3.0829190814816951e-16 0.78361162489122449 -0.87176363753180341
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		-2.0554511899433756e-17 0.99999999999999989 0.28272503694690376
		-0.19991679083637282 0.99999999999999989 0.19991679083637282
		-0.28272503694690376 0.99999999999999989 4.3941756900056795e-17
		-0.19991679083637273 0.99999999999999989 -0.1999167908363727
		-4.9371014480962574e-17 0.99999999999999989 -0.28272503694690365
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "LegFoot__instance_1_mirror:knee_joint_translation_control" 
		-p "LegFoot__instance_1_mirror:module_transform";
	rename -uid "2CDF9923-4A4E-12AB-8B44-7FA91C1FA9EF";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 4 -0.99999999999999956 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsSurface -n "LegFoot__instance_1_mirror:knee_joint_translation_controlShape" 
		-p "LegFoot__instance_1_mirror:knee_joint_translation_control";
	rename -uid "BC54B7AC-4D16-52F4-6B0D-B786443F5C20";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		1.151601345627845e-16 -1 0.28272503694690354
		-0.19991679083637259 -1 0.19991679083637273
		-0.28272503694690365 -1 5.7191723447539755e-17
		-0.19991679083637276 -1 -0.19991679083637259
		-1.8508566094318079e-16 -1 -0.28272503694690365
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		1.9902882483877521e-16 -0.78361162489122427 0.87176363753180319
		-0.61642997969058921 -0.78361162489122427 0.61642997969058955
		-0.8717636375318033 -0.78361162489122427 1.6111055650702835e-16
		-0.61642997969058944 -0.78361162489122427 -0.61642997969058899
		-4.1463948278396632e-16 -0.78361162489122427 -0.87176363753180319
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		2.051909376318187e-16 -6.284284658528814e-17 1.2264094625656803
		-0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		-1.2264094625656805 1.2253074553466149e-17 2.1934926354574312e-16
		-0.86720244749154174 6.5353909630129502e-17 -0.8672024474915413
		-5.0851507246572639e-16 8.7348995692220465e-17 -1.2264094625656803
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		9.2681250202978354e-17 0.78361162489122449 0.87176363753180341
		-0.61642997969058944 0.78361162489122449 0.61642997969058966
		-0.87176363753180353 0.78361162489122449 1.507277286910009e-16
		-0.61642997969058955 0.78361162489122449 -0.61642997969058932
		-3.0829190814816951e-16 0.78361162489122449 -0.87176363753180341
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		-2.0554511899433756e-17 0.99999999999999989 0.28272503694690376
		-0.19991679083637282 0.99999999999999989 0.19991679083637282
		-0.28272503694690376 0.99999999999999989 4.3941756900056795e-17
		-0.19991679083637273 0.99999999999999989 -0.1999167908363727
		-4.9371014480962574e-17 0.99999999999999989 -0.28272503694690365
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "LegFoot__instance_1_mirror:ankle_joint_translation_control" 
		-p "LegFoot__instance_1_mirror:module_transform";
	rename -uid "2ED93B3F-47B5-786A-886E-58B44FF94B4D";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 8 9.7971743931788276e-16 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsSurface -n "LegFoot__instance_1_mirror:ankle_joint_translation_controlShape" 
		-p "LegFoot__instance_1_mirror:ankle_joint_translation_control";
	rename -uid "08309EE3-4601-8747-B21F-7BA5ED1D6864";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		1.151601345627845e-16 -1 0.28272503694690354
		-0.19991679083637259 -1 0.19991679083637273
		-0.28272503694690365 -1 5.7191723447539755e-17
		-0.19991679083637276 -1 -0.19991679083637259
		-1.8508566094318079e-16 -1 -0.28272503694690365
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		1.9902882483877521e-16 -0.78361162489122427 0.87176363753180319
		-0.61642997969058921 -0.78361162489122427 0.61642997969058955
		-0.8717636375318033 -0.78361162489122427 1.6111055650702835e-16
		-0.61642997969058944 -0.78361162489122427 -0.61642997969058899
		-4.1463948278396632e-16 -0.78361162489122427 -0.87176363753180319
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		2.051909376318187e-16 -6.284284658528814e-17 1.2264094625656803
		-0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		-1.2264094625656805 1.2253074553466149e-17 2.1934926354574312e-16
		-0.86720244749154174 6.5353909630129502e-17 -0.8672024474915413
		-5.0851507246572639e-16 8.7348995692220465e-17 -1.2264094625656803
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		9.2681250202978354e-17 0.78361162489122449 0.87176363753180341
		-0.61642997969058944 0.78361162489122449 0.61642997969058966
		-0.87176363753180353 0.78361162489122449 1.507277286910009e-16
		-0.61642997969058955 0.78361162489122449 -0.61642997969058932
		-3.0829190814816951e-16 0.78361162489122449 -0.87176363753180341
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		-2.0554511899433756e-17 0.99999999999999989 0.28272503694690376
		-0.19991679083637282 0.99999999999999989 0.19991679083637282
		-0.28272503694690376 0.99999999999999989 4.3941756900056795e-17
		-0.19991679083637273 0.99999999999999989 -0.1999167908363727
		-4.9371014480962574e-17 0.99999999999999989 -0.28272503694690365
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "LegFoot__instance_1_mirror:ball_joint_translation_control" 
		-p "LegFoot__instance_1_mirror:module_transform";
	rename -uid "1AD63D6F-4C4D-11F1-9ABC-CDA4ED04BD15";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 9.0000000000000018 -2.9999999999999987 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsSurface -n "LegFoot__instance_1_mirror:ball_joint_translation_controlShape" 
		-p "LegFoot__instance_1_mirror:ball_joint_translation_control";
	rename -uid "D8313F13-4408-3CB8-ED06-F2A34990681F";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		1.151601345627845e-16 -1 0.28272503694690354
		-0.19991679083637259 -1 0.19991679083637273
		-0.28272503694690365 -1 5.7191723447539755e-17
		-0.19991679083637276 -1 -0.19991679083637259
		-1.8508566094318079e-16 -1 -0.28272503694690365
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		1.9902882483877521e-16 -0.78361162489122427 0.87176363753180319
		-0.61642997969058921 -0.78361162489122427 0.61642997969058955
		-0.8717636375318033 -0.78361162489122427 1.6111055650702835e-16
		-0.61642997969058944 -0.78361162489122427 -0.61642997969058899
		-4.1463948278396632e-16 -0.78361162489122427 -0.87176363753180319
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		2.051909376318187e-16 -6.284284658528814e-17 1.2264094625656803
		-0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		-1.2264094625656805 1.2253074553466149e-17 2.1934926354574312e-16
		-0.86720244749154174 6.5353909630129502e-17 -0.8672024474915413
		-5.0851507246572639e-16 8.7348995692220465e-17 -1.2264094625656803
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		9.2681250202978354e-17 0.78361162489122449 0.87176363753180341
		-0.61642997969058944 0.78361162489122449 0.61642997969058966
		-0.87176363753180353 0.78361162489122449 1.507277286910009e-16
		-0.61642997969058955 0.78361162489122449 -0.61642997969058932
		-3.0829190814816951e-16 0.78361162489122449 -0.87176363753180341
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		-2.0554511899433756e-17 0.99999999999999989 0.28272503694690376
		-0.19991679083637282 0.99999999999999989 0.19991679083637282
		-0.28272503694690376 0.99999999999999989 4.3941756900056795e-17
		-0.19991679083637273 0.99999999999999989 -0.1999167908363727
		-4.9371014480962574e-17 0.99999999999999989 -0.28272503694690365
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "LegFoot__instance_1_mirror:toe_joint_translation_control" 
		-p "LegFoot__instance_1_mirror:module_transform";
	rename -uid "4E5A043E-4E5F-6973-EA57-92925B23500D";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 9.0000000000000018 -5.9999999999999991 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsSurface -n "LegFoot__instance_1_mirror:toe_joint_translation_controlShape" 
		-p "LegFoot__instance_1_mirror:toe_joint_translation_control";
	rename -uid "085C5773-461A-3491-1A5E-0C9FC70723F1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		9.596474681976929e-17 -1 -2.5316183359690662e-16
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		1.151601345627845e-16 -1 0.28272503694690354
		-0.19991679083637259 -1 0.19991679083637273
		-0.28272503694690365 -1 5.7191723447539755e-17
		-0.19991679083637276 -1 -0.19991679083637259
		-1.8508566094318079e-16 -1 -0.28272503694690365
		0.19991679083637254 -1 -0.19991679083637298
		0.2827250369469036 -1 -6.2210285873682227e-17
		0.1999167908363727 -1 0.19991679083637259
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		1.9902882483877521e-16 -0.78361162489122427 0.87176363753180319
		-0.61642997969058921 -0.78361162489122427 0.61642997969058955
		-0.8717636375318033 -0.78361162489122427 1.6111055650702835e-16
		-0.61642997969058944 -0.78361162489122427 -0.61642997969058899
		-4.1463948278396632e-16 -0.78361162489122427 -0.87176363753180319
		0.61642997969058899 -0.78361162489122427 -0.61642997969058999
		0.87176363753180319 -0.78361162489122427 1.0506190143399388e-16
		0.61642997969058932 -0.78361162489122427 0.61642997969058932
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		2.051909376318187e-16 -6.284284658528814e-17 1.2264094625656803
		-0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		-1.2264094625656805 1.2253074553466149e-17 2.1934926354574312e-16
		-0.86720244749154174 6.5353909630129502e-17 -0.8672024474915413
		-5.0851507246572639e-16 8.7348995692220465e-17 -1.2264094625656803
		0.8672024474915413 6.5353909630129576e-17 -0.86720244749154252
		1.2264094625656803 1.2253074553466144e-17 2.901104977298788e-16
		0.86720244749154163 -4.0847760523197208e-17 0.86720244749154185
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		9.2681250202978354e-17 0.78361162489122449 0.87176363753180341
		-0.61642997969058944 0.78361162489122449 0.61642997969058966
		-0.87176363753180353 0.78361162489122449 1.507277286910009e-16
		-0.61642997969058955 0.78361162489122449 -0.61642997969058932
		-3.0829190814816951e-16 0.78361162489122449 -0.87176363753180341
		0.61642997969058932 0.78361162489122449 -0.61642997969058999
		0.87176363753180341 0.78361162489122449 3.0737422288956035e-16
		0.61642997969058944 0.78361162489122449 0.61642997969058966
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		-2.0554511899433756e-17 0.99999999999999989 0.28272503694690376
		-0.19991679083637282 0.99999999999999989 0.19991679083637282
		-0.28272503694690376 0.99999999999999989 4.3941756900056795e-17
		-0.19991679083637273 0.99999999999999989 -0.1999167908363727
		-4.9371014480962574e-17 0.99999999999999989 -0.28272503694690365
		0.19991679083637276 0.99999999999999989 -0.19991679083637284
		0.28272503694690371 0.99999999999999989 1.9596904050327137e-16
		0.1999167908363727 0.99999999999999989 0.19991679083637293
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		1.739967336636337e-16 1 -1.6799646886496759e-17
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode container -n "Group_container";
	rename -uid "FBBFC464-420E-D8AE-FAFD-D78D6983EB62";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 9 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2024/12/11 19:29:31";
	setAttr ".aal" -type "attributeAlias" {"legs_t","borderConnections[0]","legs_tX"
		,"borderConnections[1]","legs_tY","borderConnections[2]","legs_tZ","borderConnections[3]"
		,"legs_r","borderConnections[4]","legs_rX","borderConnections[5]","legs_rY","borderConnections[6]"
		,"legs_rZ","borderConnections[7]","legs_globalScale","borderConnections[8]"} ;
createNode container -n "LegFoot__instance_1:module_container";
	rename -uid "C2A27AE6-4D66-D848-D547-CC86DA627D24";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 77 ".boc";
	setAttr -s 23 ".ish";
	setAttr ".ish[34]" yes;
	setAttr ".ish[35]" yes;
	setAttr ".ish[36]" yes;
	setAttr ".ish[37]" yes;
	setAttr ".ish[38]" yes;
	setAttr ".ish[39]" yes;
	setAttr ".ish[40]" yes;
	setAttr ".ish[41]" yes;
	setAttr ".ish[42]" yes;
	setAttr ".ish[43]" yes;
	setAttr ".ish[44]" yes;
	setAttr ".ish[45]" yes;
	setAttr ".ish[46]" yes;
	setAttr ".ish[47]" yes;
	setAttr ".ish[48]" yes;
	setAttr ".ish[49]" yes;
	setAttr ".ish[50]" yes;
	setAttr ".ish[51]" yes;
	setAttr ".ish[52]" yes;
	setAttr ".ish[53]" yes;
	setAttr ".ish[74]" yes;
	setAttr ".ish[75]" yes;
	setAttr ".ish[76]" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2024/12/11 19:28:48";
	setAttr ".aal" -type "attributeAlias" {"hip_joint_R","borderConnections[0]","ankle_joint_R"
		,"borderConnections[10]","ankle_joint_RX","borderConnections[11]","ankle_joint_RY"
		,"borderConnections[12]","ankle_joint_RZ","borderConnections[13]","ankle_jointrotateOrder"
		,"borderConnections[14]","ball_joint_R","borderConnections[15]","ball_joint_RX","borderConnections[16]"
		,"ball_joint_RY","borderConnections[17]","ball_joint_RZ","borderConnections[18]","ball_jointrotateOrder"
		,"borderConnections[19]","hip_joint_RX","borderConnections[1]","toe_joint_R","borderConnections[20]"
		,"toe_joint_RX","borderConnections[21]","toe_joint_RY","borderConnections[22]","toe_joint_RZ"
		,"borderConnections[23]","toe_jointrotateOrder","borderConnections[24]","moduleTransform_T"
		,"borderConnections[25]","moduleTransform_TX","borderConnections[26]","moduleTransform_TY"
		,"borderConnections[27]","moduleTransform_TZ","borderConnections[28]","moduleTransform_R"
		,"borderConnections[29]","hip_joint_RY","borderConnections[2]","moduleTransform_RX"
		,"borderConnections[30]","moduleTransform_RY","borderConnections[31]","moduleTransform_RZ"
		,"borderConnections[32]","moduleTransform_globalScale","borderConnections[33]","hip_joint_T"
		,"borderConnections[34]","hip_joint_TX","borderConnections[35]","hip_joint_TY","borderConnections[36]"
		,"hip_joint_TZ","borderConnections[37]","knee_joint_T","borderConnections[38]","knee_joint_TX"
		,"borderConnections[39]","hip_joint_RZ","borderConnections[3]","knee_joint_TY","borderConnections[40]"
		,"knee_joint_TZ","borderConnections[41]","ankle_joint_T","borderConnections[42]","ankle_joint_TX"
		,"borderConnections[43]","ankle_joint_TY","borderConnections[44]","ankle_joint_TZ"
		,"borderConnections[45]","ball_joint_T","borderConnections[46]","ball_joint_TX","borderConnections[47]"
		,"ball_joint_TY","borderConnections[48]","ball_joint_TZ","borderConnections[49]","hip_jointrotateOrder"
		,"borderConnections[4]","toe_joint_T","borderConnections[50]","toe_joint_TX","borderConnections[51]"
		,"toe_joint_TY","borderConnections[52]","toe_joint_TZ","borderConnections[53]","IK_hip_joint_R"
		,"borderConnections[54]","IK_hip_joint_RX","borderConnections[55]","IK_hip_joint_RY"
		,"borderConnections[56]","IK_hip_joint_RZ","borderConnections[57]","IK_knee_joint_R"
		,"borderConnections[58]","IK_knee_joint_RX","borderConnections[59]","knee_joint_R"
		,"borderConnections[5]","IK_knee_joint_RY","borderConnections[60]","IK_knee_joint_RZ"
		,"borderConnections[61]","IK_ankle_joint_R","borderConnections[62]","IK_ankle_joint_RX"
		,"borderConnections[63]","IK_ankle_joint_RY","borderConnections[64]","IK_ankle_joint_RZ"
		,"borderConnections[65]","IK_ball_joint_R","borderConnections[66]","IK_ball_joint_RX"
		,"borderConnections[67]","IK_ball_joint_RY","borderConnections[68]","IK_ball_joint_RZ"
		,"borderConnections[69]","knee_joint_RX","borderConnections[6]","IK_toe_joint_R","borderConnections[70]"
		,"IK_toe_joint_RX","borderConnections[71]","IK_toe_joint_RY","borderConnections[72]"
		,"IK_toe_joint_RZ","borderConnections[73]","IK_knee_joint_preferredAngle_representation_axis"
		,"borderConnections[74]","ankle_joint_orientation","borderConnections[75]","ball_joint_orientation"
		,"borderConnections[76]","knee_joint_RY","borderConnections[7]","knee_joint_RZ","borderConnections[8]"
		,"knee_jointrotateOrder","borderConnections[9]"} ;
createNode container -n "LegFoot__instance_1_mirror:module_container";
	rename -uid "E2A9FEA3-4AF3-3CD0-0F9E-4D822A63AF83";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 44 ".boc";
	setAttr -s 23 ".ish";
	setAttr ".ish[34]" yes;
	setAttr ".ish[35]" yes;
	setAttr ".ish[36]" yes;
	setAttr ".ish[37]" yes;
	setAttr ".ish[38]" yes;
	setAttr ".ish[39]" yes;
	setAttr ".ish[40]" yes;
	setAttr ".ish[41]" yes;
	setAttr ".ish[42]" yes;
	setAttr ".ish[43]" yes;
	setAttr ".ish[44]" yes;
	setAttr ".ish[45]" yes;
	setAttr ".ish[46]" yes;
	setAttr ".ish[47]" yes;
	setAttr ".ish[48]" yes;
	setAttr ".ish[49]" yes;
	setAttr ".ish[50]" yes;
	setAttr ".ish[51]" yes;
	setAttr ".ish[52]" yes;
	setAttr ".ish[53]" yes;
	setAttr ".ish[66]" yes;
	setAttr ".ish[67]" yes;
	setAttr ".ish[68]" yes;
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2024/12/11 19:29:08";
	setAttr ".aal" -type "attributeAlias" {"hip_joint_R","borderConnections[0]","ankle_joint_R"
		,"borderConnections[10]","ankle_joint_RX","borderConnections[11]","ankle_joint_RY"
		,"borderConnections[12]","ankle_joint_RZ","borderConnections[13]","ankle_jointrotateOrder"
		,"borderConnections[14]","ball_joint_R","borderConnections[15]","ball_joint_RX","borderConnections[16]"
		,"ball_joint_RY","borderConnections[17]","ball_joint_RZ","borderConnections[18]","ball_jointrotateOrder"
		,"borderConnections[19]","hip_joint_RX","borderConnections[1]","toe_joint_R","borderConnections[20]"
		,"toe_joint_RX","borderConnections[21]","toe_joint_RY","borderConnections[22]","toe_joint_RZ"
		,"borderConnections[23]","toe_jointrotateOrder","borderConnections[24]","moduleTransform_T"
		,"borderConnections[25]","moduleTransform_TX","borderConnections[26]","moduleTransform_TY"
		,"borderConnections[27]","moduleTransform_TZ","borderConnections[28]","moduleTransform_R"
		,"borderConnections[29]","hip_joint_RY","borderConnections[2]","moduleTransform_RX"
		,"borderConnections[30]","moduleTransform_RY","borderConnections[31]","moduleTransform_RZ"
		,"borderConnections[32]","moduleTransform_globalScale","borderConnections[33]","hip_joint_T"
		,"borderConnections[34]","hip_joint_TX","borderConnections[35]","hip_joint_TY","borderConnections[36]"
		,"hip_joint_TZ","borderConnections[37]","knee_joint_T","borderConnections[38]","knee_joint_TX"
		,"borderConnections[39]","hip_joint_RZ","borderConnections[3]","knee_joint_TY","borderConnections[40]"
		,"knee_joint_TZ","borderConnections[41]","ankle_joint_T","borderConnections[42]","ankle_joint_TX"
		,"borderConnections[43]","ankle_joint_TY","borderConnections[44]","ankle_joint_TZ"
		,"borderConnections[45]","ball_joint_T","borderConnections[46]","ball_joint_TX","borderConnections[47]"
		,"ball_joint_TY","borderConnections[48]","ball_joint_TZ","borderConnections[49]","hip_jointrotateOrder"
		,"borderConnections[4]","toe_joint_T","borderConnections[50]","toe_joint_TX","borderConnections[51]"
		,"toe_joint_TY","borderConnections[52]","toe_joint_TZ","borderConnections[53]","IK_hip_joint_R"
		,"borderConnections[54]","IK_hip_joint_RX","borderConnections[55]","IK_hip_joint_RY"
		,"borderConnections[56]","IK_hip_joint_RZ","borderConnections[57]","IK_knee_joint_R"
		,"borderConnections[58]","IK_knee_joint_RX","borderConnections[59]","knee_joint_R"
		,"borderConnections[5]","IK_knee_joint_RY","borderConnections[60]","IK_knee_joint_RZ"
		,"borderConnections[61]","IK_ankle_joint_R","borderConnections[62]","IK_ankle_joint_RX"
		,"borderConnections[63]","IK_ankle_joint_RY","borderConnections[64]","IK_ankle_joint_RZ"
		,"borderConnections[65]","IK_knee_joint_preferredAngle_representation_axis","borderConnections[66]"
		,"ankle_joint_orientation","borderConnections[67]","ball_joint_orientation","borderConnections[68]"
		,"knee_joint_RX","borderConnections[6]","knee_joint_RY","borderConnections[7]","knee_joint_RZ"
		,"borderConnections[8]","knee_jointrotateOrder","borderConnections[9]"} ;
createNode hyperLayout -n "hyperLayout31";
	rename -uid "50E5378F-44C6-0117-82EA-B682768D977D";
	setAttr ".ihi" 0;
	setAttr -s 2 ".hyp";
createNode container -n "LegFoot__instance_1:knee_joint_translation_control_container";
	rename -uid "7CFE7C9D-4690-3327-B163-F6B3E8D7B1FE";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr -s 4 ".boc";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/08/05 11:57:53";
	setAttr ".aal" -type "attributeAlias" {"knee_joint_T","borderConnections[0]","knee_joint_TX"
		,"borderConnections[1]","knee_joint_TY","borderConnections[2]","knee_joint_TZ","borderConnections[3]"
		} ;
createNode container -n "LegFoot__instance_1:ankle_joint_translation_control_container";
	rename -uid "29C19471-4BDE-8A38-0691-AD9B621F71D9";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr -s 4 ".boc";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/08/05 11:57:53";
	setAttr ".aal" -type "attributeAlias" {"ankle_joint_T","borderConnections[0]","ankle_joint_TX"
		,"borderConnections[1]","ankle_joint_TY","borderConnections[2]","ankle_joint_TZ","borderConnections[3]"
		} ;
createNode container -n "LegFoot__instance_1:hip_joint_translation_control_container";
	rename -uid "A9267463-42CE-A783-4BBD-A6A5CA419B45";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr -s 4 ".boc";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/08/05 11:57:53";
	setAttr ".aal" -type "attributeAlias" {"hip_joint_T","borderConnections[0]","hip_joint_TX"
		,"borderConnections[1]","hip_joint_TY","borderConnections[2]","hip_joint_TZ","borderConnections[3]"
		} ;
createNode distanceBetween -n "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator";
	rename -uid "1D8D0956-4E67-6D75-ECF1-26A7CCB59CBB";
createNode distanceBetween -n "LegFoot__instance_1:distBetween_ankle_joint_rootPosLocator_ball_joint_endPosLocator";
	rename -uid "EDD32AE9-43CA-C3DB-7F54-0E87208C3DCC";
createNode distanceBetween -n "LegFoot__instance_1:distBetween_ball_joint_rootPosLocator_toe_joint_endPosLocator";
	rename -uid "0EC2D756-44CD-C916-1047-868923818068";
createNode distanceBetween -n "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator";
	rename -uid "9EFE9D6B-48B7-7161-4A36-E1A06D19CF50";
createNode container -n "LegFoot__instance_1:toe_joint_translation_control_container";
	rename -uid "1D751306-4184-BB13-3996-1194624D8AAE";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr -s 4 ".boc";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/08/05 11:57:53";
	setAttr ".aal" -type "attributeAlias" {"toe_joint_T","borderConnections[0]","toe_joint_TX"
		,"borderConnections[1]","toe_joint_TY","borderConnections[2]","toe_joint_TZ","borderConnections[3]"
		} ;
createNode container -n "LegFoot__instance_1:hip_joint_hierarchy_representation_container";
	rename -uid "167C5117-4A10-8999-66D7-70A081DEB5BA";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/07/28 18:18:37";
createNode container -n "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_container";
	rename -uid "60613498-4DE0-FAD8-BE7E-88B7A36F6C93";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/08/21 21:13:27";
	setAttr ".aal" -type "attributeAlias" {"axis","borderConnections[0]"} ;
createNode container -n "LegFoot__instance_1:ball_joint_translation_control_container";
	rename -uid "12532988-404A-1237-A7B8-85AF8AC1086B";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr -s 4 ".boc";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/08/05 11:57:53";
	setAttr ".aal" -type "attributeAlias" {"ball_joint_T","borderConnections[0]","ball_joint_TX"
		,"borderConnections[1]","ball_joint_TY","borderConnections[2]","ball_joint_TZ","borderConnections[3]"
		} ;
createNode container -n "LegFoot__instance_1:knee_joint_hierarchy_representation_container";
	rename -uid "F956C5AC-431B-64C4-0A98-53926133CEE0";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/07/28 18:18:37";
createNode container -n "LegFoot__instance_1:hook_container";
	rename -uid "D85808A5-40DF-92EA-5F64-13960CB36F69";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 8 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2024/12/11 19:28:48";
	setAttr ".aal" -type "attributeAlias" {"hook_root_joint_R","borderConnections[0]"
		,"hook_root_joint_RX","borderConnections[1]","hook_root_joint_RY","borderConnections[2]"
		,"hook_root_joint_RZ","borderConnections[3]","hook_target_joint_R","borderConnections[4]"
		,"hook_target_joint_RX","borderConnections[5]","hook_target_joint_RY","borderConnections[6]"
		,"hook_target_joint_RZ","borderConnections[7]"} ;
createNode container -n "LegFoot__instance_1:ankle_joint_orientation_control_container";
	rename -uid "826F20C2-4808-DCD0-66E8-8BB9C6D062F7";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/07/28 18:25:27";
	setAttr ".aal" -type "attributeAlias" {"ankle_joint_orientation","borderConnections[0]"
		} ;
createNode container -n "LegFoot__instance_1:ball_joint_orientation_control_container";
	rename -uid "8057086D-4274-351B-023C-329332E8C9E2";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/07/28 18:25:27";
	setAttr ".aal" -type "attributeAlias" {"ball_joint_orientation","borderConnections[0]"
		} ;
createNode distanceBetween -n "LegFoot__instance_1:distBetween_knee_joint_rootPosLocator_ankle_joint_endPosLocator";
	rename -uid "EB09F6CC-4859-5963-48E7-3CBBF555E3B3";
createNode distanceBetween -n "LegFoot__instance_1:distBetween_hip_joint_rootPosLocator_knee_joint_endPosLocator";
	rename -uid "EEEA60A1-4C00-74DC-DB87-0AB0F6B084D9";
createNode hyperLayout -n "hyperLayout1";
	rename -uid "C45889B4-48BF-E8F6-A029-66BF9D73FD64";
	setAttr ".ihi" 0;
	setAttr -s 118 ".hyp";
createNode multiplyDivide -n "LegFoot__instance_1:ankle_joint_scaleMultiply";
	rename -uid "97C9809D-440C-442E-3A5A-E49AEEC9F652";
	setAttr ".i1" -type "float3" 4.1231055 0 0 ;
createNode multiplyDivide -n "LegFoot__instance_1:hip_joint_ikHandle_scaleFactor";
	rename -uid "E30F9E07-4260-8130-41AB-B690FC69D205";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 4.1231055 1 1 ;
createNode multiplyDivide -n "LegFoot__instance_1:knee_joint_scaleMultiply";
	rename -uid "144319FA-48D9-178B-8314-51952D20227F";
	setAttr ".i1" -type "float3" 4.1231055 0 0 ;
createNode multiplyDivide -n "LegFoot__instance_1:knee_joint_ikHandle_scaleFactor";
	rename -uid "476533CC-4D9D-197F-1272-98A0B52A08D8";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 4.1231055 1 1 ;
createNode multiplyDivide -n "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_translationValue";
	rename -uid "CBEED79B-44F8-52E5-7EC9-749184C9D0D6";
	setAttr ".i1" -type "float3" 4.1231055 0 0 ;
createNode multiplyDivide -n "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_translationValue";
	rename -uid "6DC384D6-4838-1E50-90E8-5C82E40ADC1D";
	setAttr ".i1" -type "float3" 4.1231055 0 0 ;
createNode multiplyDivide -n "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_scaleFactor";
	rename -uid "C989740C-47EC-F10F-036D-2A822826A5CE";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 4.1231055 1 1 ;
createNode multiplyDivide -n "LegFoot__instance_1:ball_joint_ikHandle_scaleFactor";
	rename -uid "EBC5F3F9-4DDE-A4DB-3770-6C95A0F98D9C";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 3 1 1 ;
createNode multiplyDivide -n "LegFoot__instance_1:ball_joint_scaleMultiply";
	rename -uid "583EAAC5-424D-B354-7759-ABB88DED13C6";
	setAttr ".i1" -type "float3" 12.409674 0 0 ;
createNode multiplyDivide -n "LegFoot__instance_1:ankle_joint_ikHandle_scaleFactor";
	rename -uid "6C8F8BF5-4E18-7F9B-8C31-1491252BBB32";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 12.409674 1 1 ;
createNode multiplyDivide -n "LegFoot__instance_1:toe_joint_scaleMultiply";
	rename -uid "1B1C46DA-4E61-F22F-F36C-73BD6475E344";
	setAttr ".i1" -type "float3" 3 0 0 ;
createNode multiplyDivide -n "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_scaleFactor";
	rename -uid "A826BBD1-4677-7597-B2C9-1EB04655366C";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 4.1231055 1 1 ;
createNode materialInfo -n "materialInfo3";
	rename -uid "7603F10E-49DF-2886-3828-DBA42F79F0EE";
createNode shadingEngine -n "LegFoot__instance_1:ankle_joint_m_translation_control_SG";
	rename -uid "8C0F8E61-4238-8D40-D987-00B222C0E490";
	setAttr ".ro" yes;
createNode lambert -n "LegFoot__instance_1:ankle_joint_m_translation_control";
	rename -uid "A787C974-4BDE-7FDB-B091-14981192D2D4";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.97250003 0.66659999 0.149 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode materialInfo -n "materialInfo1";
	rename -uid "C8C080C2-4C07-DBFD-ECD6-9090284F9B64";
createNode shadingEngine -n "LegFoot__instance_1:hip_joint_m_translation_control_SG";
	rename -uid "0609B950-46A7-F534-E08F-29AB17554094";
	setAttr ".ro" yes;
createNode lambert -n "LegFoot__instance_1:hip_joint_m_translation_control";
	rename -uid "19062868-4AB0-5B1F-51FF-14942506AAF9";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.97250003 0.66659999 0.149 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode lambert -n "LegFoot__instance_1:knee_joint_m_translation_control";
	rename -uid "7D9518D3-4695-2047-9A89-539480DF52FC";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.97250003 0.66659999 0.149 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "LegFoot__instance_1:knee_joint_m_translation_control_SG";
	rename -uid "06C752D3-470E-89DF-1F38-35828F71ABBE";
	setAttr ".ro" yes;
createNode hyperLayout -n "hyperLayout3";
	rename -uid "88EF4AF6-462B-C92A-2E70-CC8C30920689";
	setAttr ".ihi" 0;
	setAttr -s 4 ".hyp";
	setAttr ".hyp[0].x" 71;
	setAttr ".hyp[0].y" 93;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 409;
	setAttr ".hyp[1].y" 309;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[2].x" 240;
	setAttr ".hyp[2].y" 309;
	setAttr ".hyp[2].isf" yes;
	setAttr ".hyp[3].x" 71;
	setAttr ".hyp[3].y" 309;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode materialInfo -n "materialInfo2";
	rename -uid "F2F2D57C-4A97-ED12-6C35-D699A2F79E75";
createNode hyperLayout -n "hyperLayout4";
	rename -uid "23671B86-4A7C-570E-3013-878C1FA048EF";
	setAttr ".ihi" 0;
	setAttr -s 4 ".hyp";
	setAttr ".hyp[0].x" 71;
	setAttr ".hyp[0].y" 93;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 409;
	setAttr ".hyp[1].y" 309;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[2].x" 240;
	setAttr ".hyp[2].y" 309;
	setAttr ".hyp[2].isf" yes;
	setAttr ".hyp[3].x" 71;
	setAttr ".hyp[3].y" 309;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode hyperLayout -n "hyperLayout2";
	rename -uid "8318EFBE-431E-1407-FED4-B89BE7ACE697";
	setAttr ".ihi" 0;
	setAttr -s 4 ".hyp";
	setAttr ".hyp[0].x" 71;
	setAttr ".hyp[0].y" 93;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 409;
	setAttr ".hyp[1].y" 309;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[2].x" 240;
	setAttr ".hyp[2].y" 309;
	setAttr ".hyp[2].isf" yes;
	setAttr ".hyp[3].x" 71;
	setAttr ".hyp[3].y" 309;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode materialInfo -n "materialInfo4";
	rename -uid "0A241A7C-4276-1CB0-7BC0-2982013DED37";
createNode shadingEngine -n "LegFoot__instance_1:ball_joint_m_translation_control_SG";
	rename -uid "F4C9F35E-46E1-E759-8DED-E4856927F2E5";
	setAttr ".ro" yes;
createNode lambert -n "LegFoot__instance_1:ball_joint_m_translation_control";
	rename -uid "99E76E3F-48C4-FADB-477F-95B8D50D32BD";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.97250003 0.66659999 0.149 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode hyperLayout -n "hyperLayout6";
	rename -uid "D5FE1F1D-46DA-AC2D-E85C-C0A6447E7172";
	setAttr ".ihi" 0;
	setAttr -s 4 ".hyp";
	setAttr ".hyp[0].x" 71;
	setAttr ".hyp[0].y" 93;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 409;
	setAttr ".hyp[1].y" 309;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[2].x" 240;
	setAttr ".hyp[2].y" 309;
	setAttr ".hyp[2].isf" yes;
	setAttr ".hyp[3].x" 71;
	setAttr ".hyp[3].y" 309;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode lambert -n "LegFoot__instance_1:toe_joint_m_translation_control";
	rename -uid "F7579C64-4E7B-6DB4-A528-11AE305AE2A7";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.97250003 0.66659999 0.149 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "LegFoot__instance_1:toe_joint_m_translation_control_SG";
	rename -uid "A23AD98B-4584-12C4-DA83-72A934DA8A14";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo5";
	rename -uid "E4BC8597-4682-24FB-A85A-B4BE6D8F63F9";
createNode hyperLayout -n "hyperLayout9";
	rename -uid "3AFA6D45-48DD-87CD-0D79-26B7DF2CC077";
	setAttr ".ihi" 0;
	setAttr -s 9 ".hyp";
	setAttr ".hyp[1].x" 71;
	setAttr ".hyp[1].y" 93;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[3].x" 259;
	setAttr ".hyp[3].y" 93;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode lambert -n "LegFoot__instance_1:hip_joint_m_hierarchyRepresentation";
	rename -uid "37CB55AA-4152-5F2F-ADC1-89825BF6FF31";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0 0.1882 0.34110001 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "LegFoot__instance_1:hip_joint_m_hookRepresentation_SG";
	rename -uid "E03F5109-476F-D0AE-932A-21855C3DB8CD";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo7";
	rename -uid "0F8A736B-4B70-B31D-8443-E684CC686700";
createNode animCurveUA -n "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_rotateX";
	rename -uid "B1310ACF-46A0-14BB-B10C-BB8CEF97B33B";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0 1 180 2 90 3 -90;
createNode hyperLayout -n "hyperLayout13";
	rename -uid "054BC141-44A7-1952-E77F-B69C422637EA";
	setAttr ".ihi" 0;
	setAttr -s 8 ".hyp";
	setAttr ".hyp[0].x" 583;
	setAttr ".hyp[0].y" -264;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 376;
	setAttr ".hyp[1].y" -334;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[2].x" 108;
	setAttr ".hyp[2].y" -158;
	setAttr ".hyp[2].isf" yes;
	setAttr ".hyp[3].x" 399;
	setAttr ".hyp[3].y" -32;
	setAttr ".hyp[3].isf" yes;
	setAttr ".hyp[4].x" -53;
	setAttr ".hyp[4].y" -463;
	setAttr ".hyp[4].isf" yes;
	setAttr ".anf" yes;
createNode shadingEngine -n "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_SG";
	rename -uid "B4C8FD0B-47FD-29F5-4F6D-1B8C919770ED";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode lambert -n "LegFoot__instance_1:IK_knee_joint_m_preferredAngle_representation";
	rename -uid "CD7AD8C7-4AEE-E453-89F2-77BD9139A7B4";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.90200001 0.79193944 0.094710015 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode materialInfo -n "materialInfo11";
	rename -uid "2C3191A8-44A1-A5CC-322A-B89E5C5AB38E";
createNode hyperLayout -n "hyperLayout5";
	rename -uid "F13D89F9-4487-65BF-A37B-CFB5DE0B2B48";
	setAttr ".ihi" 0;
	setAttr -s 4 ".hyp";
	setAttr ".hyp[0].x" 71;
	setAttr ".hyp[0].y" 93;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 409;
	setAttr ".hyp[1].y" 309;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[2].x" 240;
	setAttr ".hyp[2].y" 309;
	setAttr ".hyp[2].isf" yes;
	setAttr ".hyp[3].x" 71;
	setAttr ".hyp[3].y" 309;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode hyperLayout -n "hyperLayout10";
	rename -uid "2366CB0D-4053-8A06-6517-E69A8E3E063C";
	setAttr ".ihi" 0;
	setAttr -s 9 ".hyp";
	setAttr ".hyp[1].x" 71;
	setAttr ".hyp[1].y" 93;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[3].x" 259;
	setAttr ".hyp[3].y" 93;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode lambert -n "LegFoot__instance_1:knee_joint_m_hierarchyRepresentation";
	rename -uid "4344A46A-4E58-5F6D-85CE-F29E4CC08EE9";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0 0.1882 0.34110001 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "LegFoot__instance_1:knee_joint_m_hookRepresentation_SG";
	rename -uid "3B86B77E-49DF-04CB-C558-F3BD50034200";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo8";
	rename -uid "FA99180A-40EB-8263-FA85-BEB8B3AFF8B3";
createNode container -n "LegFoot__instance_1:hook_root_joint_hook_representation_container";
	rename -uid "827FE619-4EB2-40E4-485A-CCB3C7CD1B56";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/07/28 18:18:37";
createNode hyperLayout -n "hyperLayout7";
	rename -uid "2DBE890A-4A27-0EBD-A676-A9A5B0F1BAD5";
	setAttr ".ihi" 0;
	setAttr -s 23 ".hyp";
createNode distanceBetween -n "LegFoot__instance_1:distBetween_hook_root_joint_rootPosLocator_hook_target_joint_endPosLocator";
	rename -uid "F37ADA26-413F-E4D7-7DF1-168B5AA54639";
createNode multiplyDivide -n "LegFoot__instance_1:hook_root_joint_ikHandle_scaleFactor";
	rename -uid "ADE6DCAE-4E2A-A456-9185-16A66A066F71";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 0.001 1 1 ;
createNode multiplyDivide -n "LegFoot__instance_1:hook_target_joint_scaleMultiply";
	rename -uid "F13C813A-47ED-79AC-2DE2-859E13AAFCA2";
	setAttr ".i1" -type "float3" 0.001 0 0 ;
createNode hyperLayout -n "hyperLayout8";
	rename -uid "49853E8D-42CB-FB5C-CBF2-9CAD1E1EE546";
	setAttr ".ihi" 0;
	setAttr -s 7 ".hyp";
	setAttr ".hyp[1].x" 71;
	setAttr ".hyp[1].y" 93;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[3].x" 259;
	setAttr ".hyp[3].y" 93;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode lambert -n "LegFoot__instance_1:hook_root_joint_m_hookRepresentation";
	rename -uid "95775BDF-4866-9E53-547E-1B996F9ED616";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.56099999 0.56099999 0.56099999 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "LegFoot__instance_1:hook_root_joint_m_hookRepresentation_SG";
	rename -uid "06B2D887-4D21-9222-DF42-D2A33A91FABF";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo6";
	rename -uid "66D2D032-4E5A-27D1-BB2C-0BAFBFF6B4DA";
createNode ikRPsolver -n "ikRPsolver";
	rename -uid "BB46CF88-4D5F-F6FA-1911-B18247B3EAAD";
createNode hyperLayout -n "hyperLayout14";
	rename -uid "88ED14D4-4C61-AE05-8A1D-A3A556046FE7";
	setAttr ".ihi" 0;
	setAttr -s 9 ".hyp";
	setAttr ".hyp[0].x" 286;
	setAttr ".hyp[0].y" 613;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 286;
	setAttr ".hyp[1].y" 93;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[3].x" 497;
	setAttr ".hyp[3].y" 487;
	setAttr ".hyp[3].isf" yes;
	setAttr ".hyp[4].x" 474;
	setAttr ".hyp[4].y" 223;
	setAttr ".hyp[4].isf" yes;
	setAttr ".hyp[5].x" 148;
	setAttr ".hyp[5].y" 353;
	setAttr ".hyp[5].isf" yes;
	setAttr ".hyp[6].x" 148;
	setAttr ".hyp[6].y" 353;
	setAttr ".hyp[6].isf" yes;
	setAttr ".anf" yes;
createNode lambert -n "LegFoot__instance_1:ankle_joint_m_zAxisBlock";
	rename -uid "2BE3E102-422F-D5C4-2A06-F29D7FFFBD34";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0 0.1882 0.34110001 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode lambert -n "LegFoot__instance_1:ankle_joint_m_yAxisBlock";
	rename -uid "8355F22F-4B28-8896-8342-F0ABBD923A5B";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.32859999 0.69620001 0.1762 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "LegFoot__instance_1:ankle_joint_m_zAxisBlockSG";
	rename -uid "2FD6068F-464B-6F49-FE08-B2AB2D89D359";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode shadingEngine -n "LegFoot__instance_1:ankle_joint_m_yAxisBlockSG";
	rename -uid "D1B4958F-4E47-4089-E0BD-13B9EA835BDD";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode groupId -n "groupId19";
	rename -uid "2EDDAEB0-41DB-B114-7C6E-76878D98CE83";
	setAttr ".ihi" 0;
createNode groupId -n "groupId20";
	rename -uid "8DDFEF62-4FD9-F153-6B2C-6EAB4DA2CE3B";
	setAttr ".ihi" 0;
createNode groupId -n "groupId18";
	rename -uid "58513347-4B70-4035-C49A-D89180ADB4A9";
	setAttr ".ihi" 0;
createNode materialInfo -n "materialInfo12";
	rename -uid "261C1A96-49E1-B0F5-F1A5-84910EEF168E";
createNode materialInfo -n "materialInfo13";
	rename -uid "5B282A9B-47ED-449E-02F3-618E7B69CCC3";
createNode hyperLayout -n "hyperLayout15";
	rename -uid "867EE942-4BEF-3205-4C2C-3CA30B2A9997";
	setAttr ".ihi" 0;
	setAttr -s 9 ".hyp";
	setAttr ".hyp[0].x" 286;
	setAttr ".hyp[0].y" 613;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 286;
	setAttr ".hyp[1].y" 93;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[3].x" 497;
	setAttr ".hyp[3].y" 487;
	setAttr ".hyp[3].isf" yes;
	setAttr ".hyp[4].x" 474;
	setAttr ".hyp[4].y" 223;
	setAttr ".hyp[4].isf" yes;
	setAttr ".hyp[5].x" 148;
	setAttr ".hyp[5].y" 353;
	setAttr ".hyp[5].isf" yes;
	setAttr ".hyp[6].x" 148;
	setAttr ".hyp[6].y" 353;
	setAttr ".hyp[6].isf" yes;
	setAttr ".anf" yes;
createNode lambert -n "LegFoot__instance_1:ball_joint_m_yAxisBlock";
	rename -uid "0652FF75-4BC9-FD25-F881-18984BE3F049";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.32859999 0.69620001 0.1762 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode lambert -n "LegFoot__instance_1:ball_joint_m_zAxisBlock";
	rename -uid "D5B42B89-466D-7048-9949-25B0FAB7A74D";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0 0.1882 0.34110001 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "LegFoot__instance_1:ball_joint_m_yAxisBlockSG";
	rename -uid "0B7B6B51-44B7-3BA1-B670-3E9FD57C8D7F";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode shadingEngine -n "LegFoot__instance_1:ball_joint_m_zAxisBlockSG";
	rename -uid "E56429D7-430D-75C7-7A09-00BF778F864A";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode groupId -n "groupId22";
	rename -uid "B31E3A78-464B-909A-584D-93A2F0A99C7A";
	setAttr ".ihi" 0;
createNode groupId -n "groupId23";
	rename -uid "CDF9FD4B-4AC0-3C77-18F2-4685A980FAB8";
	setAttr ".ihi" 0;
createNode groupId -n "groupId21";
	rename -uid "C5683288-427D-6470-BE00-71A02BA424C9";
	setAttr ".ihi" 0;
createNode materialInfo -n "materialInfo15";
	rename -uid "8A6D4211-448E-2E5A-490A-F490595B1FD1";
createNode materialInfo -n "materialInfo14";
	rename -uid "F3C5D6FB-45CF-F840-A880-EBA24ECE87A6";
createNode container -n "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_container";
	rename -uid "770A401D-4886-01D5-A15B-7F8EA854F6D0";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/07/28 18:18:37";
createNode container -n "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_container";
	rename -uid "58BA28BC-43A6-9BCA-41D3-529D8660BE6F";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/07/28 18:18:37";
createNode container -n "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_container";
	rename -uid "7F63854F-44DF-2BFC-0ACE-7C9FCCA3D9E6";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/08/21 21:13:27";
	setAttr ".aal" -type "attributeAlias" {"axis","borderConnections[0]"} ;
createNode container -n "LegFoot__instance_1_mirror:ankle_joint_orientation_control_container";
	rename -uid "2818B959-4A7B-88B1-1112-BE8655551B58";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/07/28 18:25:27";
	setAttr ".aal" -type "attributeAlias" {"ankle_joint_orientation","borderConnections[0]"
		} ;
createNode container -n "LegFoot__instance_1_mirror:ball_joint_orientation_control_container";
	rename -uid "6F8FDE3B-40FC-BE96-F15A-959F3476C8E0";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/07/28 18:25:27";
	setAttr ".aal" -type "attributeAlias" {"ball_joint_orientation","borderConnections[0]"
		} ;
createNode container -n "LegFoot__instance_1_mirror:hip_joint_translation_control_container";
	rename -uid "B9C707FB-41EB-7128-18A1-ADAB58378579";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr -s 4 ".boc";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/08/05 11:57:53";
	setAttr ".aal" -type "attributeAlias" {"hip_joint_T","borderConnections[0]","hip_joint_TX"
		,"borderConnections[1]","hip_joint_TY","borderConnections[2]","hip_joint_TZ","borderConnections[3]"
		} ;
createNode container -n "LegFoot__instance_1_mirror:ball_joint_translation_control_container";
	rename -uid "36CC1BE4-4187-B65F-ACE5-44BAC35757CA";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr -s 4 ".boc";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/08/05 11:57:53";
	setAttr ".aal" -type "attributeAlias" {"ball_joint_T","borderConnections[0]","ball_joint_TX"
		,"borderConnections[1]","ball_joint_TY","borderConnections[2]","ball_joint_TZ","borderConnections[3]"
		} ;
createNode container -n "LegFoot__instance_1_mirror:toe_joint_translation_control_container";
	rename -uid "BB0D178F-48DE-5C33-B365-A2A863A13B48";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr -s 4 ".boc";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/08/05 11:57:53";
	setAttr ".aal" -type "attributeAlias" {"toe_joint_T","borderConnections[0]","toe_joint_TX"
		,"borderConnections[1]","toe_joint_TY","borderConnections[2]","toe_joint_TZ","borderConnections[3]"
		} ;
createNode container -n "LegFoot__instance_1_mirror:hook_container";
	rename -uid "71B23F51-4C0A-CB4D-06E4-CDACFB06ECA2";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".isc" yes;
	setAttr -s 8 ".boc";
	setAttr ".ctor" -type "string" "micma";
	setAttr ".cdat" -type "string" "2024/12/11 19:29:08";
	setAttr ".aal" -type "attributeAlias" {"hook_root_joint_R","borderConnections[0]"
		,"hook_root_joint_RX","borderConnections[1]","hook_root_joint_RY","borderConnections[2]"
		,"hook_root_joint_RZ","borderConnections[3]","hook_target_joint_R","borderConnections[4]"
		,"hook_target_joint_RX","borderConnections[5]","hook_target_joint_RY","borderConnections[6]"
		,"hook_target_joint_RZ","borderConnections[7]"} ;
createNode container -n "LegFoot__instance_1_mirror:knee_joint_translation_control_container";
	rename -uid "3E3BFE33-4CAA-F08C-892E-C5928852CD34";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr -s 4 ".boc";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/08/05 11:57:53";
	setAttr ".aal" -type "attributeAlias" {"knee_joint_T","borderConnections[0]","knee_joint_TX"
		,"borderConnections[1]","knee_joint_TY","borderConnections[2]","knee_joint_TZ","borderConnections[3]"
		} ;
createNode container -n "LegFoot__instance_1_mirror:ankle_joint_translation_control_container";
	rename -uid "D670DA5D-43E4-B7B9-7708-22A84CCDEBE4";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr -s 4 ".boc";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/08/05 11:57:53";
	setAttr ".aal" -type "attributeAlias" {"ankle_joint_T","borderConnections[0]","ankle_joint_TX"
		,"borderConnections[1]","ankle_joint_TY","borderConnections[2]","ankle_joint_TZ","borderConnections[3]"
		} ;
createNode hyperLayout -n "hyperLayout16";
	rename -uid "3D1FBA82-47C9-D59D-A5A9-00B9E54907AA";
	setAttr ".ihi" 0;
	setAttr -s 118 ".hyp";
createNode multiplyDivide -n "LegFoot__instance_1_mirror:ankle_joint_scaleMultiply";
	rename -uid "24FA572F-4B5E-46D7-1436-51AF6B5457D3";
	setAttr ".i1" -type "float3" -4.1231055 0 0 ;
createNode multiplyDivide -n "LegFoot__instance_1_mirror:ball_joint_scaleMultiply";
	rename -uid "571FDD1D-4817-BDEF-BA93-F7BEAACDCD35";
	setAttr ".i1" -type "float3" -12.409674 0 0 ;
createNode multiplyDivide -n "LegFoot__instance_1_mirror:hip_joint_ikHandle_scaleFactor";
	rename -uid "F4A13870-45EB-01DE-E6C9-ED843699F1B3";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 4.1231055 1 1 ;
createNode multiplyDivide -n "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_scaleFactor";
	rename -uid "6595EE24-4FCE-57C3-D3B6-529CF396EF06";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" -1.2053387 1 1 ;
createNode multiplyDivide -n "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_translationValue";
	rename -uid "C0C9B16C-4B33-DD8C-146B-CAA8D7C69F73";
	setAttr ".i1" -type "float3" 1.2053387 0 0 ;
createNode multiplyDivide -n "LegFoot__instance_1_mirror:knee_joint_scaleMultiply";
	rename -uid "00781E11-49D2-11C3-4FFB-AAA9943854CA";
	setAttr ".i1" -type "float3" -4.1231055 0 0 ;
createNode multiplyDivide -n "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_translationValue";
	rename -uid "DBB94C1E-47DE-D6B6-B9BF-7780BE374E0E";
	setAttr ".i1" -type "float3" 1.2053387 0 0 ;
createNode multiplyDivide -n "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_scaleFactor";
	rename -uid "609DD841-44E9-3DB0-AD59-8DAF55ED5DF2";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" -1.2053387 1 1 ;
createNode multiplyDivide -n "LegFoot__instance_1_mirror:knee_joint_ikHandle_scaleFactor";
	rename -uid "5986EEB6-4A1E-DAD5-A9F1-369885ED7ED5";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 4.1231055 1 1 ;
createNode multiplyDivide -n "LegFoot__instance_1_mirror:ball_joint_ikHandle_scaleFactor";
	rename -uid "1E69E907-449B-F5C1-2B52-E69638D1FF2C";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 3 1 1 ;
createNode multiplyDivide -n "LegFoot__instance_1_mirror:ankle_joint_ikHandle_scaleFactor";
	rename -uid "DF7FFB74-4021-C25F-24A5-9592584639FC";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 12.409674 1 1 ;
createNode multiplyDivide -n "LegFoot__instance_1_mirror:toe_joint_scaleMultiply";
	rename -uid "9C3A57EF-488A-2E47-B682-76B2DADB860B";
	setAttr ".i1" -type "float3" -3 0 0 ;
createNode distanceBetween -n "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator";
	rename -uid "BE40B03D-41D3-DBE7-64E9-5F8B975DE8F4";
createNode distanceBetween -n "LegFoot__instance_1_mirror:distBetween_ankle_joint_rootPosLocator_ball_joint_endPosLocator";
	rename -uid "F2D68A57-4450-4AFF-1A54-CB89110D5F17";
createNode distanceBetween -n "LegFoot__instance_1_mirror:distBetween_ball_joint_rootPosLocator_toe_joint_endPosLocator";
	rename -uid "91B00E13-4350-3D39-AFF6-FE893B426B26";
createNode distanceBetween -n "LegFoot__instance_1_mirror:distBetween_knee_joint_rootPosLocator_ankle_joint_endPosLocator";
	rename -uid "77C8D305-4F10-E89B-F4EA-109B3E78E569";
createNode distanceBetween -n "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator";
	rename -uid "84381B34-48E5-59C6-C128-299CD8B81C38";
createNode distanceBetween -n "LegFoot__instance_1_mirror:distBetween_hip_joint_rootPosLocator_knee_joint_endPosLocator";
	rename -uid "4FB50684-4929-BAC1-225D-F2B85644DA33";
createNode lambert -n "LegFoot__instance_1_mirror:hip_joint_m_hierarchyRepresentation";
	rename -uid "7608820F-4447-4FFB-9FE2-F3A6CF73F885";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0 0.1882 0.34110001 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode hyperLayout -n "hyperLayout24";
	rename -uid "DF994B8F-4DE0-9DAA-777E-F49B6C6DE1FC";
	setAttr ".ihi" 0;
	setAttr -s 9 ".hyp";
	setAttr ".hyp[1].x" 71;
	setAttr ".hyp[1].y" 93;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[3].x" 259;
	setAttr ".hyp[3].y" 93;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode shadingEngine -n "LegFoot__instance_1_mirror:hip_joint_m_hookRepresentation_SG";
	rename -uid "22E80B59-44B3-E1BB-8479-7596E55D9375";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo22";
	rename -uid "4F24AE5B-4C4D-884B-CCB4-27AE33AE9837";
createNode lambert -n "LegFoot__instance_1_mirror:knee_joint_m_hierarchyRepresentation";
	rename -uid "290BA248-4FC6-4ED4-2F50-C5BC5A98AD03";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0 0.1882 0.34110001 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode hyperLayout -n "hyperLayout25";
	rename -uid "45C275C7-4F5B-C3BF-B770-DC9A789585E4";
	setAttr ".ihi" 0;
	setAttr -s 9 ".hyp";
	setAttr ".hyp[1].x" 71;
	setAttr ".hyp[1].y" 93;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[3].x" 259;
	setAttr ".hyp[3].y" 93;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode shadingEngine -n "LegFoot__instance_1_mirror:knee_joint_m_hookRepresentation_SG";
	rename -uid "378C924A-4932-C69F-4838-9F9858F871C4";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo23";
	rename -uid "198BB09D-4B88-3A56-DABB-2086A4AA0BFB";
createNode animCurveUA -n "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_rotateX";
	rename -uid "F439539D-4F3A-B277-2075-EFBD51337182";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0 1 180 2 90 3 -90;
createNode lambert -n "LegFoot__instance_1_mirror:IK_knee_joint_m_preferredAngle_representation";
	rename -uid "FBA1D3D0-489C-18BA-F7F2-DE81120D922E";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.90200001 0.79193944 0.094710015 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_SG";
	rename -uid "2CF9D750-436B-691A-BDFE-ACBDC70FDCF4";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode hyperLayout -n "hyperLayout28";
	rename -uid "8CC01061-4324-8CE7-3954-0C9DA3D4359B";
	setAttr ".ihi" 0;
	setAttr -s 8 ".hyp";
	setAttr ".hyp[0].x" 583;
	setAttr ".hyp[0].y" -264;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 376;
	setAttr ".hyp[1].y" -334;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[2].x" 108;
	setAttr ".hyp[2].y" -158;
	setAttr ".hyp[2].isf" yes;
	setAttr ".hyp[3].x" 399;
	setAttr ".hyp[3].y" -32;
	setAttr ".hyp[3].isf" yes;
	setAttr ".hyp[4].x" -53;
	setAttr ".hyp[4].y" -463;
	setAttr ".hyp[4].isf" yes;
	setAttr ".anf" yes;
createNode materialInfo -n "materialInfo17";
	rename -uid "79E3D129-4A49-5EBE-027A-E18A6198711B";
createNode shadingEngine -n "LegFoot__instance_1_mirror:knee_joint_m_translation_control_SG";
	rename -uid "DA229651-4D70-2799-8C96-BC8E403ABA43";
	setAttr ".ro" yes;
createNode lambert -n "LegFoot__instance_1_mirror:knee_joint_m_translation_control";
	rename -uid "4F6D5E55-413A-213E-EC07-3F8198337BAF";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.97250003 0.66659999 0.149 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode materialInfo -n "materialInfo26";
	rename -uid "A860E8BD-4A4B-F025-57D0-48B64A06021B";
createNode lambert -n "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlock";
	rename -uid "D805F971-4F3B-0C93-8310-82AF998CFE20";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.32859999 0.69620001 0.1762 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode lambert -n "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlock";
	rename -uid "DFDC38AC-41AF-7E15-959F-8B8788A81928";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0 0.1882 0.34110001 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlockSG";
	rename -uid "034D7320-4EDA-1259-D984-0185722395B2";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode shadingEngine -n "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlockSG";
	rename -uid "C2268F6B-4F84-A835-44E4-EE90DAE2CFA3";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode hyperLayout -n "hyperLayout29";
	rename -uid "875FB882-4474-BEA5-C90B-9A876B65C56A";
	setAttr ".ihi" 0;
	setAttr -s 9 ".hyp";
	setAttr ".hyp[0].x" 286;
	setAttr ".hyp[0].y" 613;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 286;
	setAttr ".hyp[1].y" 93;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[3].x" 497;
	setAttr ".hyp[3].y" 487;
	setAttr ".hyp[3].isf" yes;
	setAttr ".hyp[4].x" 474;
	setAttr ".hyp[4].y" 223;
	setAttr ".hyp[4].isf" yes;
	setAttr ".hyp[5].x" 148;
	setAttr ".hyp[5].y" 353;
	setAttr ".hyp[5].isf" yes;
	setAttr ".hyp[6].x" 148;
	setAttr ".hyp[6].y" 353;
	setAttr ".hyp[6].isf" yes;
	setAttr ".anf" yes;
createNode groupId -n "groupId25";
	rename -uid "CDD6F593-498F-77A0-D0FC-BD9A44B20C1D";
	setAttr ".ihi" 0;
createNode groupId -n "groupId26";
	rename -uid "7E7DBAF8-4F1A-B2D9-1C9F-47B5CAE002F9";
	setAttr ".ihi" 0;
createNode groupId -n "groupId24";
	rename -uid "F62BA79F-41D1-2A50-2723-5D9B9E6D141F";
	setAttr ".ihi" 0;
createNode materialInfo -n "materialInfo28";
	rename -uid "A2A57271-4FAF-487B-9E74-A4B4B9996736";
createNode materialInfo -n "materialInfo27";
	rename -uid "B2C4EBBF-4208-D477-00D1-9495642032A4";
createNode lambert -n "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlock";
	rename -uid "68366A93-46B8-E4AA-955B-B0B336EBF6DF";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.32859999 0.69620001 0.1762 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode lambert -n "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlock";
	rename -uid "4764BCC7-4E3A-5D10-7607-76828323BAF8";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0 0.1882 0.34110001 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlockSG";
	rename -uid "D2F2A894-44B9-2034-FE03-BBBE71F52F86";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode hyperLayout -n "hyperLayout30";
	rename -uid "509CCF72-4E9E-31CC-DAB8-089C98E9D834";
	setAttr ".ihi" 0;
	setAttr -s 9 ".hyp";
	setAttr ".hyp[0].x" 286;
	setAttr ".hyp[0].y" 613;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 286;
	setAttr ".hyp[1].y" 93;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[3].x" 497;
	setAttr ".hyp[3].y" 487;
	setAttr ".hyp[3].isf" yes;
	setAttr ".hyp[4].x" 474;
	setAttr ".hyp[4].y" 223;
	setAttr ".hyp[4].isf" yes;
	setAttr ".hyp[5].x" 148;
	setAttr ".hyp[5].y" 353;
	setAttr ".hyp[5].isf" yes;
	setAttr ".hyp[6].x" 148;
	setAttr ".hyp[6].y" 353;
	setAttr ".hyp[6].isf" yes;
	setAttr ".anf" yes;
createNode shadingEngine -n "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlockSG";
	rename -uid "07E0AE5D-4B60-57B7-7C2F-D394700D52BD";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode groupId -n "groupId28";
	rename -uid "1C404752-4253-DB80-6564-6B9A2309229D";
	setAttr ".ihi" 0;
createNode groupId -n "groupId29";
	rename -uid "DED55E9F-409A-104F-6B27-BFA9404F79A2";
	setAttr ".ihi" 0;
createNode groupId -n "groupId27";
	rename -uid "6526E365-4B58-B7BC-9853-2F85D69256AB";
	setAttr ".ihi" 0;
createNode materialInfo -n "materialInfo29";
	rename -uid "D079CE36-4453-2AF3-10F3-CD97AA55B578";
createNode materialInfo -n "materialInfo30";
	rename -uid "6B898E99-4566-3A94-2CC0-4F845F82DCA5";
createNode hyperLayout -n "hyperLayout17";
	rename -uid "93A0BA33-4131-5283-934A-B5BD2653DAC7";
	setAttr ".ihi" 0;
	setAttr -s 4 ".hyp";
	setAttr ".hyp[0].x" 71;
	setAttr ".hyp[0].y" 93;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 409;
	setAttr ".hyp[1].y" 309;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[2].x" 240;
	setAttr ".hyp[2].y" 309;
	setAttr ".hyp[2].isf" yes;
	setAttr ".hyp[3].x" 71;
	setAttr ".hyp[3].y" 309;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode lambert -n "LegFoot__instance_1_mirror:hip_joint_m_translation_control";
	rename -uid "6CA65EAD-4ACF-3EC2-2E5A-98AB83573614";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.97250003 0.66659999 0.149 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "LegFoot__instance_1_mirror:hip_joint_m_translation_control_SG";
	rename -uid "C31D7314-4E75-D318-479C-D4BE80BBCF83";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo16";
	rename -uid "64F0E2F1-4339-3A05-85BA-A3A720D05B29";
createNode shadingEngine -n "LegFoot__instance_1_mirror:ball_joint_m_translation_control_SG";
	rename -uid "CC6DB139-444B-AE45-27F2-CB89ED772DE1";
	setAttr ".ro" yes;
createNode hyperLayout -n "hyperLayout20";
	rename -uid "5E29CF46-46C8-15DF-65D5-08AAAF5D2B3D";
	setAttr ".ihi" 0;
	setAttr -s 4 ".hyp";
	setAttr ".hyp[0].x" 71;
	setAttr ".hyp[0].y" 93;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 409;
	setAttr ".hyp[1].y" 309;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[2].x" 240;
	setAttr ".hyp[2].y" 309;
	setAttr ".hyp[2].isf" yes;
	setAttr ".hyp[3].x" 71;
	setAttr ".hyp[3].y" 309;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode lambert -n "LegFoot__instance_1_mirror:ball_joint_m_translation_control";
	rename -uid "93F40E92-4153-2A6A-38AD-AA82C6B997E8";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.97250003 0.66659999 0.149 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode materialInfo -n "materialInfo19";
	rename -uid "A18ED307-47C0-24AA-70FC-0BBDC6BBE48B";
createNode lambert -n "LegFoot__instance_1_mirror:toe_joint_m_translation_control";
	rename -uid "55C93AEF-4ADD-3777-B8D5-629DBC2DAAEE";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.97250003 0.66659999 0.149 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "LegFoot__instance_1_mirror:toe_joint_m_translation_control_SG";
	rename -uid "D0DBA03D-4458-FB3F-2542-838D2AAEEDA9";
	setAttr ".ro" yes;
createNode hyperLayout -n "hyperLayout21";
	rename -uid "D6C370F9-449F-4F69-E044-549C9E3F6E7B";
	setAttr ".ihi" 0;
	setAttr -s 4 ".hyp";
	setAttr ".hyp[0].x" 71;
	setAttr ".hyp[0].y" 93;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 409;
	setAttr ".hyp[1].y" 309;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[2].x" 240;
	setAttr ".hyp[2].y" 309;
	setAttr ".hyp[2].isf" yes;
	setAttr ".hyp[3].x" 71;
	setAttr ".hyp[3].y" 309;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode materialInfo -n "materialInfo20";
	rename -uid "75564F83-4D0A-0587-FB9F-6D98FA15D2B7";
createNode container -n "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_container";
	rename -uid "5A7DC327-4FBA-9165-AEA5-94B6E6A15880";
	setAttr ".ctor" -type "string" "Administrator";
	setAttr ".cdat" -type "string" "2009/07/28 18:18:37";
createNode multiplyDivide -n "LegFoot__instance_1_mirror:hook_target_joint_scaleMultiply";
	rename -uid "0C3B4CD7-4F42-47DD-C622-089AA73B5DC6";
	setAttr ".i1" -type "float3" 0.001 0 0 ;
createNode multiplyDivide -n "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_scaleFactor";
	rename -uid "84E975B5-46C0-4B09-7E8B-21B90D133749";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 0.001 1 1 ;
createNode hyperLayout -n "hyperLayout22";
	rename -uid "003B318F-41CA-B9F1-87EF-74ABF6A6B9E0";
	setAttr ".ihi" 0;
	setAttr -s 23 ".hyp";
createNode distanceBetween -n "LegFoot__instance_1_mirror:distBetween_hook_root_joint_rootPosLocator_hook_target_joint_endPosLocator";
	rename -uid "F3990D34-425B-71A0-BA93-8484CE60773F";
createNode lambert -n "LegFoot__instance_1_mirror:hook_root_joint_m_hookRepresentation";
	rename -uid "4B17669B-4B15-FD54-7A48-D1B9CB6B7F76";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.56099999 0.56099999 0.56099999 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "LegFoot__instance_1_mirror:hook_root_joint_m_hookRepresentation_SG";
	rename -uid "D1D90CB0-4B31-8359-0DBE-068CC798F44D";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode hyperLayout -n "hyperLayout23";
	rename -uid "3AA9A429-46CA-2FC5-B8A8-4780A9DDEB6F";
	setAttr ".ihi" 0;
	setAttr -s 7 ".hyp";
	setAttr ".hyp[1].x" 71;
	setAttr ".hyp[1].y" 93;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[3].x" 259;
	setAttr ".hyp[3].y" 93;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode materialInfo -n "materialInfo21";
	rename -uid "EC66258E-45CA-9C32-BC67-C4BA5D4DA563";
createNode hyperLayout -n "hyperLayout18";
	rename -uid "109B5EAD-46B9-0DC3-C84E-FFB42CC4DFD1";
	setAttr ".ihi" 0;
	setAttr -s 4 ".hyp";
	setAttr ".hyp[0].x" 71;
	setAttr ".hyp[0].y" 93;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 409;
	setAttr ".hyp[1].y" 309;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[2].x" 240;
	setAttr ".hyp[2].y" 309;
	setAttr ".hyp[2].isf" yes;
	setAttr ".hyp[3].x" 71;
	setAttr ".hyp[3].y" 309;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode lambert -n "LegFoot__instance_1_mirror:ankle_joint_m_translation_control";
	rename -uid "D5C0D8B2-4B84-7A16-3670-1ABBCECE704A";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0.97250003 0.66659999 0.149 ;
	setAttr ".ambc" -type "float3" 1 1 1 ;
createNode hyperLayout -n "hyperLayout19";
	rename -uid "4BFFE1B6-443B-8F1A-89C5-819553CF9A46";
	setAttr ".ihi" 0;
	setAttr -s 4 ".hyp";
	setAttr ".hyp[0].x" 71;
	setAttr ".hyp[0].y" 93;
	setAttr ".hyp[0].isf" yes;
	setAttr ".hyp[1].x" 409;
	setAttr ".hyp[1].y" 309;
	setAttr ".hyp[1].isf" yes;
	setAttr ".hyp[2].x" 240;
	setAttr ".hyp[2].y" 309;
	setAttr ".hyp[2].isf" yes;
	setAttr ".hyp[3].x" 71;
	setAttr ".hyp[3].y" 309;
	setAttr ".hyp[3].isf" yes;
	setAttr ".anf" yes;
createNode shadingEngine -n "LegFoot__instance_1_mirror:ankle_joint_m_translation_control_SG";
	rename -uid "0B68B654-4841-32B7-EE45-52A14E81D85B";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo18";
	rename -uid "4179E94B-4490-775C-D58E-1AA7E66C35FC";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "EFF6A752-4A29-D688-E8AF-C5AAB8FA534F";
	setAttr -s 32 ".lnk";
	setAttr -s 32 ".slnk";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".tq" 1;
	setAttr ".msaa" yes;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 28 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 31 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 42 ".u";
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
	setAttr -s 3 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 4 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".ren" -type "string" "arnold";
	setAttr ".fs" 1;
	setAttr ".ef" 10;
	setAttr ".ifp" -type "string" "01_Legs";
select -ne :defaultResolution;
	setAttr ".pa" 1;
	setAttr ".dar" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cme" no;
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
connectAttr "LegFoot__instance_1:hip_joint_pointConstraint.ctx" "LegFoot__instance_1:hip_joint.tx"
		;
connectAttr "LegFoot__instance_1:hip_joint_pointConstraint.cty" "LegFoot__instance_1:hip_joint.ty"
		;
connectAttr "LegFoot__instance_1:hip_joint_pointConstraint.ctz" "LegFoot__instance_1:hip_joint.tz"
		;
connectAttr "LegFoot__instance_1:hip_joint.s" "LegFoot__instance_1:knee_joint.is"
		;
connectAttr "LegFoot__instance_1:knee_joint_scaleMultiply.ox" "LegFoot__instance_1:knee_joint.tx"
		;
connectAttr "LegFoot__instance_1:knee_joint.s" "LegFoot__instance_1:ankle_joint.is"
		;
connectAttr "LegFoot__instance_1:ankle_joint_scaleMultiply.ox" "LegFoot__instance_1:ankle_joint.tx"
		;
connectAttr "LegFoot__instance_1:ankle_joint.s" "LegFoot__instance_1:ball_joint.is"
		;
connectAttr "LegFoot__instance_1:ball_joint_scaleMultiply.ox" "LegFoot__instance_1:ball_joint.tx"
		;
connectAttr "LegFoot__instance_1:ball_joint.s" "LegFoot__instance_1:toe_joint.is"
		;
connectAttr "LegFoot__instance_1:toe_joint_scaleMultiply.ox" "LegFoot__instance_1:toe_joint.tx"
		;
connectAttr "LegFoot__instance_1:toe_joint.tx" "LegFoot__instance_1:ball_jointikEffector.tx"
		;
connectAttr "LegFoot__instance_1:toe_joint.ty" "LegFoot__instance_1:ball_jointikEffector.ty"
		;
connectAttr "LegFoot__instance_1:toe_joint.tz" "LegFoot__instance_1:ball_jointikEffector.tz"
		;
connectAttr "LegFoot__instance_1:toe_joint.opm" "LegFoot__instance_1:ball_jointikEffector.opm"
		;
connectAttr "LegFoot__instance_1:ball_joint.tx" "LegFoot__instance_1:ankle_jointikEffector.tx"
		;
connectAttr "LegFoot__instance_1:ball_joint.ty" "LegFoot__instance_1:ankle_jointikEffector.ty"
		;
connectAttr "LegFoot__instance_1:ball_joint.tz" "LegFoot__instance_1:ankle_jointikEffector.tz"
		;
connectAttr "LegFoot__instance_1:ball_joint.opm" "LegFoot__instance_1:ankle_jointikEffector.opm"
		;
connectAttr "LegFoot__instance_1:ankle_joint.tx" "LegFoot__instance_1:knee_jointikEffector.tx"
		;
connectAttr "LegFoot__instance_1:ankle_joint.ty" "LegFoot__instance_1:knee_jointikEffector.ty"
		;
connectAttr "LegFoot__instance_1:ankle_joint.tz" "LegFoot__instance_1:knee_jointikEffector.tz"
		;
connectAttr "LegFoot__instance_1:ankle_joint.opm" "LegFoot__instance_1:knee_jointikEffector.opm"
		;
connectAttr "LegFoot__instance_1:hip_joint.pim" "LegFoot__instance_1:hip_joint_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:hip_joint.rp" "LegFoot__instance_1:hip_joint_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:hip_joint.rpt" "LegFoot__instance_1:hip_joint_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.t" "LegFoot__instance_1:hip_joint_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.rp" "LegFoot__instance_1:hip_joint_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.rpt" "LegFoot__instance_1:hip_joint_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.pm" "LegFoot__instance_1:hip_joint_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:hip_joint_pointConstraint.w0" "LegFoot__instance_1:hip_joint_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:knee_joint.tx" "LegFoot__instance_1:hip_jointikEffector.tx"
		;
connectAttr "LegFoot__instance_1:knee_joint.ty" "LegFoot__instance_1:hip_jointikEffector.ty"
		;
connectAttr "LegFoot__instance_1:knee_joint.tz" "LegFoot__instance_1:hip_jointikEffector.tz"
		;
connectAttr "LegFoot__instance_1:knee_joint.opm" "LegFoot__instance_1:hip_jointikEffector.opm"
		;
connectAttr "LegFoot__instance_1:hip_joint.msg" "LegFoot__instance_1:hip_joint_ikHandle.hsj"
		;
connectAttr "LegFoot__instance_1:hip_jointikEffector.hp" "LegFoot__instance_1:hip_joint_ikHandle.hee"
		;
connectAttr "ikRPsolver.msg" "LegFoot__instance_1:hip_joint_ikHandle.hsv";
connectAttr "hip_joint_ikHandle_poleVectorConstraint1.ctx" "LegFoot__instance_1:hip_joint_ikHandle.pvx"
		;
connectAttr "hip_joint_ikHandle_poleVectorConstraint1.cty" "LegFoot__instance_1:hip_joint_ikHandle.pvy"
		;
connectAttr "hip_joint_ikHandle_poleVectorConstraint1.ctz" "LegFoot__instance_1:hip_joint_ikHandle.pvz"
		;
connectAttr "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint.ctx" "LegFoot__instance_1:hip_joint_ikHandle.tx"
		;
connectAttr "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint.cty" "LegFoot__instance_1:hip_joint_ikHandle.ty"
		;
connectAttr "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint.ctz" "LegFoot__instance_1:hip_joint_ikHandle.tz"
		;
connectAttr "LegFoot__instance_1:hip_joint_ikHandle.pim" "hip_joint_ikHandle_poleVectorConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:hip_joint.pm" "hip_joint_ikHandle_poleVectorConstraint1.ps"
		;
connectAttr "LegFoot__instance_1:hip_joint.t" "hip_joint_ikHandle_poleVectorConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator.t" "hip_joint_ikHandle_poleVectorConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator.rp" "hip_joint_ikHandle_poleVectorConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator.rpt" "hip_joint_ikHandle_poleVectorConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator.pm" "hip_joint_ikHandle_poleVectorConstraint1.tg[0].tpm"
		;
connectAttr "hip_joint_ikHandle_poleVectorConstraint1.w0" "hip_joint_ikHandle_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:hip_joint_ikHandle.pim" "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:hip_joint_ikHandle.rp" "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:hip_joint_ikHandle.rpt" "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocator.t" "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocator.rp" "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocator.rpt" "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocator.pm" "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint.w0" "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint.ctx" "LegFoot__instance_1:hip_joint_rootPosLocator.tx"
		;
connectAttr "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint.cty" "LegFoot__instance_1:hip_joint_rootPosLocator.ty"
		;
connectAttr "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint.ctz" "LegFoot__instance_1:hip_joint_rootPosLocator.tz"
		;
connectAttr "LegFoot__instance_1:hip_joint_rootPosLocator.pim" "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:hip_joint_rootPosLocator.rp" "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:hip_joint_rootPosLocator.rpt" "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:hip_joint.t" "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:hip_joint.rp" "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:hip_joint.rpt" "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:hip_joint.pm" "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint.w0" "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint.ctx" "LegFoot__instance_1:knee_joint_endPosLocator.tx"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint.cty" "LegFoot__instance_1:knee_joint_endPosLocator.ty"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint.ctz" "LegFoot__instance_1:knee_joint_endPosLocator.tz"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocator.pim" "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocator.rp" "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocator.rpt" "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.t" "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.rp" "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.rpt" "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.pm" "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint.w0" "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:knee_joint.msg" "LegFoot__instance_1:knee_joint_ikHandle.hsj"
		;
connectAttr "LegFoot__instance_1:knee_jointikEffector.hp" "LegFoot__instance_1:knee_joint_ikHandle.hee"
		;
connectAttr "ikRPsolver.msg" "LegFoot__instance_1:knee_joint_ikHandle.hsv";
connectAttr "knee_joint_ikHandle_poleVectorConstraint1.ctx" "LegFoot__instance_1:knee_joint_ikHandle.pvx"
		;
connectAttr "knee_joint_ikHandle_poleVectorConstraint1.cty" "LegFoot__instance_1:knee_joint_ikHandle.pvy"
		;
connectAttr "knee_joint_ikHandle_poleVectorConstraint1.ctz" "LegFoot__instance_1:knee_joint_ikHandle.pvz"
		;
connectAttr "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint.ctx" "LegFoot__instance_1:knee_joint_ikHandle.tx"
		;
connectAttr "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint.cty" "LegFoot__instance_1:knee_joint_ikHandle.ty"
		;
connectAttr "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint.ctz" "LegFoot__instance_1:knee_joint_ikHandle.tz"
		;
connectAttr "LegFoot__instance_1:knee_joint_ikHandle.pim" "knee_joint_ikHandle_poleVectorConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:knee_joint.pm" "knee_joint_ikHandle_poleVectorConstraint1.ps"
		;
connectAttr "LegFoot__instance_1:knee_joint.t" "knee_joint_ikHandle_poleVectorConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator.t" "knee_joint_ikHandle_poleVectorConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator.rp" "knee_joint_ikHandle_poleVectorConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator.rpt" "knee_joint_ikHandle_poleVectorConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator.pm" "knee_joint_ikHandle_poleVectorConstraint1.tg[0].tpm"
		;
connectAttr "knee_joint_ikHandle_poleVectorConstraint1.w0" "knee_joint_ikHandle_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:knee_joint_ikHandle.pim" "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:knee_joint_ikHandle.rp" "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:knee_joint_ikHandle.rpt" "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocator.t" "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocator.rp" "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocator.rpt" "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocator.pm" "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint.w0" "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint.ctx" "LegFoot__instance_1:knee_joint_rootPosLocator.tx"
		;
connectAttr "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint.cty" "LegFoot__instance_1:knee_joint_rootPosLocator.ty"
		;
connectAttr "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint.ctz" "LegFoot__instance_1:knee_joint_rootPosLocator.tz"
		;
connectAttr "LegFoot__instance_1:knee_joint_rootPosLocator.pim" "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:knee_joint_rootPosLocator.rp" "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:knee_joint_rootPosLocator.rpt" "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:knee_joint.t" "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:knee_joint.rp" "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:knee_joint.rpt" "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:knee_joint.pm" "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint.w0" "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint.ctx" "LegFoot__instance_1:ankle_joint_endPosLocator.tx"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint.cty" "LegFoot__instance_1:ankle_joint_endPosLocator.ty"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint.ctz" "LegFoot__instance_1:ankle_joint_endPosLocator.tz"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocator.pim" "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocator.rp" "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocator.rpt" "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.t" "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.rp" "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.rpt" "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.pm" "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint.w0" "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:ankle_joint.msg" "LegFoot__instance_1:ankle_joint_ikHandle.hsj"
		;
connectAttr "LegFoot__instance_1:ankle_jointikEffector.hp" "LegFoot__instance_1:ankle_joint_ikHandle.hee"
		;
connectAttr "ikRPsolver.msg" "LegFoot__instance_1:ankle_joint_ikHandle.hsv";
connectAttr "ankle_joint_ikHandle_poleVectorConstraint1.ctx" "LegFoot__instance_1:ankle_joint_ikHandle.pvx"
		;
connectAttr "ankle_joint_ikHandle_poleVectorConstraint1.cty" "LegFoot__instance_1:ankle_joint_ikHandle.pvy"
		;
connectAttr "ankle_joint_ikHandle_poleVectorConstraint1.ctz" "LegFoot__instance_1:ankle_joint_ikHandle.pvz"
		;
connectAttr "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint.ctx" "LegFoot__instance_1:ankle_joint_ikHandle.tx"
		;
connectAttr "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint.cty" "LegFoot__instance_1:ankle_joint_ikHandle.ty"
		;
connectAttr "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint.ctz" "LegFoot__instance_1:ankle_joint_ikHandle.tz"
		;
connectAttr "LegFoot__instance_1:ankle_joint_ikHandle.pim" "ankle_joint_ikHandle_poleVectorConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:ankle_joint.pm" "ankle_joint_ikHandle_poleVectorConstraint1.ps"
		;
connectAttr "LegFoot__instance_1:ankle_joint.t" "ankle_joint_ikHandle_poleVectorConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator.t" "ankle_joint_ikHandle_poleVectorConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator.rp" "ankle_joint_ikHandle_poleVectorConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator.rpt" "ankle_joint_ikHandle_poleVectorConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator.pm" "ankle_joint_ikHandle_poleVectorConstraint1.tg[0].tpm"
		;
connectAttr "ankle_joint_ikHandle_poleVectorConstraint1.w0" "ankle_joint_ikHandle_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:ankle_joint_ikHandle.pim" "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:ankle_joint_ikHandle.rp" "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:ankle_joint_ikHandle.rpt" "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocator.t" "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocator.rp" "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocator.rpt" "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocator.pm" "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint.w0" "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint.ctx" "LegFoot__instance_1:ankle_joint_rootPosLocator.tx"
		;
connectAttr "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint.cty" "LegFoot__instance_1:ankle_joint_rootPosLocator.ty"
		;
connectAttr "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint.ctz" "LegFoot__instance_1:ankle_joint_rootPosLocator.tz"
		;
connectAttr "LegFoot__instance_1:ankle_joint_rootPosLocator.pim" "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:ankle_joint_rootPosLocator.rp" "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:ankle_joint_rootPosLocator.rpt" "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:ankle_joint.t" "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:ankle_joint.rp" "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:ankle_joint.rpt" "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:ankle_joint.pm" "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint.w0" "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint.ctx" "LegFoot__instance_1:ball_joint_endPosLocator.tx"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint.cty" "LegFoot__instance_1:ball_joint_endPosLocator.ty"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint.ctz" "LegFoot__instance_1:ball_joint_endPosLocator.tz"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocator.pim" "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocator.rp" "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocator.rpt" "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.t" "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.rp" "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.rpt" "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.pm" "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint.w0" "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:ball_joint.msg" "LegFoot__instance_1:ball_joint_ikHandle.hsj"
		;
connectAttr "LegFoot__instance_1:ball_jointikEffector.hp" "LegFoot__instance_1:ball_joint_ikHandle.hee"
		;
connectAttr "ikRPsolver.msg" "LegFoot__instance_1:ball_joint_ikHandle.hsv";
connectAttr "ball_joint_ikHandle_poleVectorConstraint1.ctx" "LegFoot__instance_1:ball_joint_ikHandle.pvx"
		;
connectAttr "ball_joint_ikHandle_poleVectorConstraint1.cty" "LegFoot__instance_1:ball_joint_ikHandle.pvy"
		;
connectAttr "ball_joint_ikHandle_poleVectorConstraint1.ctz" "LegFoot__instance_1:ball_joint_ikHandle.pvz"
		;
connectAttr "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint.ctx" "LegFoot__instance_1:ball_joint_ikHandle.tx"
		;
connectAttr "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint.cty" "LegFoot__instance_1:ball_joint_ikHandle.ty"
		;
connectAttr "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint.ctz" "LegFoot__instance_1:ball_joint_ikHandle.tz"
		;
connectAttr "LegFoot__instance_1:ball_joint_ikHandle.pim" "ball_joint_ikHandle_poleVectorConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:ball_joint.pm" "ball_joint_ikHandle_poleVectorConstraint1.ps"
		;
connectAttr "LegFoot__instance_1:ball_joint.t" "ball_joint_ikHandle_poleVectorConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator.t" "ball_joint_ikHandle_poleVectorConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator.rp" "ball_joint_ikHandle_poleVectorConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator.rpt" "ball_joint_ikHandle_poleVectorConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator.pm" "ball_joint_ikHandle_poleVectorConstraint1.tg[0].tpm"
		;
connectAttr "ball_joint_ikHandle_poleVectorConstraint1.w0" "ball_joint_ikHandle_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:ball_joint_ikHandle.pim" "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:ball_joint_ikHandle.rp" "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:ball_joint_ikHandle.rpt" "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocator.t" "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocator.rp" "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocator.rpt" "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocator.pm" "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint.w0" "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint.ctx" "LegFoot__instance_1:ball_joint_rootPosLocator.tx"
		;
connectAttr "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint.cty" "LegFoot__instance_1:ball_joint_rootPosLocator.ty"
		;
connectAttr "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint.ctz" "LegFoot__instance_1:ball_joint_rootPosLocator.tz"
		;
connectAttr "LegFoot__instance_1:ball_joint_rootPosLocator.pim" "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:ball_joint_rootPosLocator.rp" "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:ball_joint_rootPosLocator.rpt" "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:ball_joint.t" "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:ball_joint.rp" "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:ball_joint.rpt" "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:ball_joint.pm" "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint.w0" "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint.ctx" "LegFoot__instance_1:toe_joint_endPosLocator.tx"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint.cty" "LegFoot__instance_1:toe_joint_endPosLocator.ty"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint.ctz" "LegFoot__instance_1:toe_joint_endPosLocator.tz"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocator.pim" "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocator.rp" "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocator.rpt" "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control.t" "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control.rp" "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control.rpt" "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control.pm" "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint.w0" "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.ctx" "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.tx"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.cty" "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.ty"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.ctz" "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.tz"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.crx" "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.rx"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.cry" "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.ry"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.crz" "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.rz"
		;
connectAttr "LegFoot__instance_1:knee_joint.tx" "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.sx"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.csy" "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.sy"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.csz" "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.sz"
		;
connectAttr "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.ro" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.cro"
		;
connectAttr "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.pim" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.rp" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.rpt" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:hip_joint.t" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:hip_joint.rp" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:hip_joint.rpt" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:hip_joint.r" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:hip_joint.ro" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:hip_joint.s" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:hip_joint.pm" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:hip_joint.jo" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1:hip_joint.ssc" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1:hip_joint.is" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tis"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.w0" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.pim" "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:module_transform.s" "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:module_transform.pm" "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.tg[0].tpm"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.w0" "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.tg[0].tw"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.ctx" "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.tx"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.cty" "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.ty"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.ctz" "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.tz"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.crx" "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.rx"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.cry" "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.ry"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.crz" "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.rz"
		;
connectAttr "LegFoot__instance_1:ankle_joint.tx" "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.sx"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.csy" "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.sy"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.csz" "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.sz"
		;
connectAttr "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.ro" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.cro"
		;
connectAttr "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.pim" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.rp" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.rpt" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:knee_joint.t" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:knee_joint.rp" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:knee_joint.rpt" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:knee_joint.r" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:knee_joint.ro" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:knee_joint.s" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:knee_joint.pm" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:knee_joint.jo" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1:knee_joint.ssc" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1:knee_joint.is" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tis"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.w0" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.pim" "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:module_transform.s" "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:module_transform.pm" "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.tg[0].tpm"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.w0" "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.tg[0].tw"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.ctx" "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.tx"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.cty" "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.ty"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.ctz" "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.tz"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.crx" "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.rx"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.cry" "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.ry"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.crz" "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.rz"
		;
connectAttr "LegFoot__instance_1:ball_joint.tx" "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.sx"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint1.csy" "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.sy"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint1.csz" "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.sz"
		;
connectAttr "groupId19.id" "LegFoot__instance_1:ankle_joint_orientation_controlShape.iog.og[0].gid"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_yAxisBlockSG.mwc" "LegFoot__instance_1:ankle_joint_orientation_controlShape.iog.og[0].gco"
		;
connectAttr "groupId20.id" "LegFoot__instance_1:ankle_joint_orientation_controlShape.iog.og[1].gid"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_zAxisBlockSG.mwc" "LegFoot__instance_1:ankle_joint_orientation_controlShape.iog.og[1].gco"
		;
connectAttr "groupId18.id" "LegFoot__instance_1:ankle_joint_orientation_controlShape.ciog.cog[0].cgid"
		;
connectAttr "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.ro" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.cro"
		;
connectAttr "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.pim" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.rp" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.rpt" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:ankle_joint.t" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:ankle_joint.rp" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:ankle_joint.rpt" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:ankle_joint.r" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:ankle_joint.ro" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:ankle_joint.s" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:ankle_joint.pm" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:ankle_joint.jo" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1:ankle_joint.ssc" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1:ankle_joint.is" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tis"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.w0" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.pim" "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:module_transform.s" "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:module_transform.pm" "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint1.tg[0].tpm"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint1.w0" "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint1.tg[0].tw"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.ctx" "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.tx"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.cty" "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.ty"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.ctz" "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.tz"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.crx" "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.rx"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.cry" "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.ry"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.crz" "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.rz"
		;
connectAttr "LegFoot__instance_1:toe_joint.tx" "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.sx"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint1.csy" "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.sy"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint1.csz" "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.sz"
		;
connectAttr "groupId22.id" "LegFoot__instance_1:ball_joint_orientation_controlShape.iog.og[0].gid"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_yAxisBlockSG.mwc" "LegFoot__instance_1:ball_joint_orientation_controlShape.iog.og[0].gco"
		;
connectAttr "groupId23.id" "LegFoot__instance_1:ball_joint_orientation_controlShape.iog.og[1].gid"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_zAxisBlockSG.mwc" "LegFoot__instance_1:ball_joint_orientation_controlShape.iog.og[1].gco"
		;
connectAttr "groupId21.id" "LegFoot__instance_1:ball_joint_orientation_controlShape.ciog.cog[0].cgid"
		;
connectAttr "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.ro" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.cro"
		;
connectAttr "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.pim" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.rp" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.rpt" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:ball_joint.t" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:ball_joint.rp" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:ball_joint.rpt" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:ball_joint.r" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:ball_joint.ro" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:ball_joint.s" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:ball_joint.pm" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:ball_joint.jo" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1:ball_joint.ssc" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1:ball_joint.is" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tis"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.w0" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.pim" "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:module_transform.s" "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:module_transform.pm" "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint1.tg[0].tpm"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint1.w0" "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint1.tg[0].tw"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.ctx" "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.tx"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.cty" "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.ty"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.ctz" "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.tz"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.crx" "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.rx"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.cry" "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.ry"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.crz" "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.rz"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint1.csx" "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.sx"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint1.csy" "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.sy"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint1.csz" "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.sz"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_rotateX.o" "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation.rx"
		 -l on;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.ro" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.cro"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.pim" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.rp" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.rpt" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.t" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.rp" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.rpt" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.r" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.ro" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.s" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.pm" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.jo" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.ssc" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.is" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.tg[0].tis"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.w0" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.pim" "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.s" "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.pm" "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint1.tg[0].tpm"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint1.w0" "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_pointConstraint.ctx" "LegFoot__instance_1:hook_root_joint.tx"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_pointConstraint.cty" "LegFoot__instance_1:hook_root_joint.ty"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_pointConstraint.ctz" "LegFoot__instance_1:hook_root_joint.tz"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.s" "LegFoot__instance_1:hook_target_joint.is"
		;
connectAttr "LegFoot__instance_1:hook_target_joint_scaleMultiply.ox" "LegFoot__instance_1:hook_target_joint.tx"
		;
connectAttr "LegFoot__instance_1:hook_target_joint.tx" "LegFoot__instance_1:hook_root_jointikEffector.tx"
		;
connectAttr "LegFoot__instance_1:hook_target_joint.ty" "LegFoot__instance_1:hook_root_jointikEffector.ty"
		;
connectAttr "LegFoot__instance_1:hook_target_joint.tz" "LegFoot__instance_1:hook_root_jointikEffector.tz"
		;
connectAttr "LegFoot__instance_1:hook_target_joint.opm" "LegFoot__instance_1:hook_root_jointikEffector.opm"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.pim" "LegFoot__instance_1:hook_root_joint_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.rp" "LegFoot__instance_1:hook_root_joint_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.rpt" "LegFoot__instance_1:hook_root_joint_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.t" "LegFoot__instance_1:hook_root_joint_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.rp" "LegFoot__instance_1:hook_root_joint_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.rpt" "LegFoot__instance_1:hook_root_joint_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.pm" "LegFoot__instance_1:hook_root_joint_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_pointConstraint.w0" "LegFoot__instance_1:hook_root_joint_pointConstraint.tg[0].tw"
		;
connectAttr "unhookedTarget_pointConstraint1.ctx" "LegFoot__instance_1:unhookedTarget.tx"
		;
connectAttr "unhookedTarget_pointConstraint1.cty" "LegFoot__instance_1:unhookedTarget.ty"
		;
connectAttr "unhookedTarget_pointConstraint1.ctz" "LegFoot__instance_1:unhookedTarget.tz"
		;
connectAttr "LegFoot__instance_1:unhookedTarget.pim" "unhookedTarget_pointConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:unhookedTarget.rp" "unhookedTarget_pointConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:unhookedTarget.rpt" "unhookedTarget_pointConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.t" "unhookedTarget_pointConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.rp" "unhookedTarget_pointConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.rpt" "unhookedTarget_pointConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.pm" "unhookedTarget_pointConstraint1.tg[0].tpm"
		;
connectAttr "unhookedTarget_pointConstraint1.w0" "unhookedTarget_pointConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.msg" "LegFoot__instance_1:hook_root_joint_ikHandle.hsj"
		;
connectAttr "LegFoot__instance_1:hook_root_jointikEffector.hp" "LegFoot__instance_1:hook_root_joint_ikHandle.hee"
		;
connectAttr "ikRPsolver.msg" "LegFoot__instance_1:hook_root_joint_ikHandle.hsv";
connectAttr "hook_root_joint_ikHandle_poleVectorConstraint1.ctx" "LegFoot__instance_1:hook_root_joint_ikHandle.pvx"
		;
connectAttr "hook_root_joint_ikHandle_poleVectorConstraint1.cty" "LegFoot__instance_1:hook_root_joint_ikHandle.pvy"
		;
connectAttr "hook_root_joint_ikHandle_poleVectorConstraint1.ctz" "LegFoot__instance_1:hook_root_joint_ikHandle.pvz"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint.ctx" "LegFoot__instance_1:hook_root_joint_ikHandle.tx"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint.cty" "LegFoot__instance_1:hook_root_joint_ikHandle.ty"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint.ctz" "LegFoot__instance_1:hook_root_joint_ikHandle.tz"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle.pim" "hook_root_joint_ikHandle_poleVectorConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.pm" "hook_root_joint_ikHandle_poleVectorConstraint1.ps"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.t" "hook_root_joint_ikHandle_poleVectorConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_poleVectorLocator.t" "hook_root_joint_ikHandle_poleVectorConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_poleVectorLocator.rp" "hook_root_joint_ikHandle_poleVectorConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_poleVectorLocator.rpt" "hook_root_joint_ikHandle_poleVectorConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_poleVectorLocator.pm" "hook_root_joint_ikHandle_poleVectorConstraint1.tg[0].tpm"
		;
connectAttr "hook_root_joint_ikHandle_poleVectorConstraint1.w0" "hook_root_joint_ikHandle_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle.pim" "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle.rp" "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle.rpt" "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:hook_target_joint_endPosLocator.t" "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:hook_target_joint_endPosLocator.rp" "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:hook_target_joint_endPosLocator.rpt" "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:hook_target_joint_endPosLocator.pm" "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint.w0" "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint.ctx" "LegFoot__instance_1:hook_root_joint_rootPosLocator.tx"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint.cty" "LegFoot__instance_1:hook_root_joint_rootPosLocator.ty"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint.ctz" "LegFoot__instance_1:hook_root_joint_rootPosLocator.tz"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_rootPosLocator.pim" "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_rootPosLocator.rp" "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_rootPosLocator.rpt" "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.t" "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.rp" "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.rpt" "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.pm" "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint.w0" "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:hook_pointConstraint.ctx" "LegFoot__instance_1:hook_target_joint_endPosLocator.tx"
		;
connectAttr "LegFoot__instance_1:hook_pointConstraint.cty" "LegFoot__instance_1:hook_target_joint_endPosLocator.ty"
		;
connectAttr "LegFoot__instance_1:hook_pointConstraint.ctz" "LegFoot__instance_1:hook_target_joint_endPosLocator.tz"
		;
connectAttr "LegFoot__instance_1:hook_target_joint_endPosLocator.pim" "LegFoot__instance_1:hook_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1:hook_target_joint_endPosLocator.rp" "LegFoot__instance_1:hook_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1:hook_target_joint_endPosLocator.rpt" "LegFoot__instance_1:hook_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1:unhookedTarget.t" "LegFoot__instance_1:hook_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:unhookedTarget.rp" "LegFoot__instance_1:hook_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:unhookedTarget.rpt" "LegFoot__instance_1:hook_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:unhookedTarget.pm" "LegFoot__instance_1:hook_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:hook_pointConstraint.w0" "LegFoot__instance_1:hook_pointConstraint.tg[0].tw"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.ctx" "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.tx"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.cty" "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.ty"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.ctz" "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.tz"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.crx" "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.rx"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.cry" "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.ry"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.crz" "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.rz"
		;
connectAttr "LegFoot__instance_1:hook_target_joint.tx" "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.sx"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint1.csy" "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.sy"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint1.csz" "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.sz"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.ro" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.cro"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.pim" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.rp" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.rpt" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.t" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.rp" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.rpt" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.r" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.ro" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.s" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.pm" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.jo" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.ssc" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.is" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.tg[0].tis"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.w0" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.pim" "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:module_transform.s" "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:module_transform.pm" "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint1.tg[0].tpm"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint1.w0" "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint1.tg[0].tw"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.ctx" "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.tx"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cty" "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.ty"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.ctz" "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.tz"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crx" "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.rx"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cry" "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.ry"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crz" "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.rz"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.ro" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cro"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.pim" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.rp" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.rpt" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.t" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.rp" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.rpt" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.r" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.ro" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.s" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.pm" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tpm"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.w0" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tw"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.ctx" "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.tx"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cty" "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.ty"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.ctz" "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.tz"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crx" "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.rx"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cry" "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.ry"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crz" "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.rz"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.ro" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cro"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.pim" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.rp" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.rpt" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.t" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.rp" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.rpt" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.r" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.ro" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.s" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.pm" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tpm"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.w0" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tw"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.ctx" "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.tx"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cty" "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.ty"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.ctz" "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.tz"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crx" "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.rx"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cry" "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.ry"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crz" "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.rz"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.ro" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cro"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.pim" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.rp" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.rpt" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.t" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.rp" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.rpt" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.r" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.ro" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.s" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.pm" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tpm"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.w0" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tw"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.ctx" "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.tx"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cty" "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.ty"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.ctz" "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.tz"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crx" "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.rx"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cry" "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.ry"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crz" "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.rz"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.ro" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cro"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.pim" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.rp" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.rpt" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.t" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.rp" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.rpt" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.r" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tr"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.ro" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tro"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.s" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].ts"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.pm" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tpm"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.w0" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.tg[0].tw"
		;
connectAttr "IK_hip_joint_positionLocator_pointConstraint1.ctx" "LegFoot__instance_1:IK_hip_joint_positionLocator.tx"
		;
connectAttr "IK_hip_joint_positionLocator_pointConstraint1.cty" "LegFoot__instance_1:IK_hip_joint_positionLocator.ty"
		;
connectAttr "IK_hip_joint_positionLocator_pointConstraint1.ctz" "LegFoot__instance_1:IK_hip_joint_positionLocator.tz"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint.s" "LegFoot__instance_1:IK_knee_joint.is"
		;
connectAttr "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_translationValue.ox" "LegFoot__instance_1:IK_knee_joint.tx"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.s" "LegFoot__instance_1:IK_ankle_joint.is"
		;
connectAttr "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_translationValue.ox" "LegFoot__instance_1:IK_ankle_joint.tx"
		;
connectAttr "LegFoot__instance_1:IK_ankle_joint.s" "LegFoot__instance_1:IK_ball_joint.is"
		;
connectAttr "LegFoot__instance_1:IK_ball_joint.s" "LegFoot__instance_1:IK_toe_joint.is"
		;
connectAttr "LegFoot__instance_1:IK_ankle_joint.tx" "LegFoot__instance_1:IK_hip_joint_ikEffector.tx"
		;
connectAttr "LegFoot__instance_1:IK_ankle_joint.ty" "LegFoot__instance_1:IK_hip_joint_ikEffector.ty"
		;
connectAttr "LegFoot__instance_1:IK_ankle_joint.tz" "LegFoot__instance_1:IK_hip_joint_ikEffector.tz"
		;
connectAttr "LegFoot__instance_1:IK_ankle_joint.opm" "LegFoot__instance_1:IK_hip_joint_ikEffector.opm"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_positionLocator.pim" "IK_hip_joint_positionLocator_pointConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_positionLocator.rp" "IK_hip_joint_positionLocator_pointConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_positionLocator.rpt" "IK_hip_joint_positionLocator_pointConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.t" "IK_hip_joint_positionLocator_pointConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.rp" "IK_hip_joint_positionLocator_pointConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.rpt" "IK_hip_joint_positionLocator_pointConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.pm" "IK_hip_joint_positionLocator_pointConstraint1.tg[0].tpm"
		;
connectAttr "IK_hip_joint_positionLocator_pointConstraint1.w0" "IK_hip_joint_positionLocator_pointConstraint1.tg[0].tw"
		;
connectAttr "IK_knee_joint_positionLocator_pointConstraint1.ctx" "LegFoot__instance_1:IK_knee_joint_positionLocator.tx"
		;
connectAttr "IK_knee_joint_positionLocator_pointConstraint1.cty" "LegFoot__instance_1:IK_knee_joint_positionLocator.ty"
		;
connectAttr "IK_knee_joint_positionLocator_pointConstraint1.ctz" "LegFoot__instance_1:IK_knee_joint_positionLocator.tz"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_positionLocator.pim" "IK_knee_joint_positionLocator_pointConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_positionLocator.rp" "IK_knee_joint_positionLocator_pointConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_positionLocator.rpt" "IK_knee_joint_positionLocator_pointConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.t" "IK_knee_joint_positionLocator_pointConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.rp" "IK_knee_joint_positionLocator_pointConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.rpt" "IK_knee_joint_positionLocator_pointConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.pm" "IK_knee_joint_positionLocator_pointConstraint1.tg[0].tpm"
		;
connectAttr "IK_knee_joint_positionLocator_pointConstraint1.w0" "IK_knee_joint_positionLocator_pointConstraint1.tg[0].tw"
		;
connectAttr "IK_hip_joint_ikHandle_positionLocator_pointConstraint1.ctx" "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocator.tx"
		;
connectAttr "IK_hip_joint_ikHandle_positionLocator_pointConstraint1.cty" "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocator.ty"
		;
connectAttr "IK_hip_joint_ikHandle_positionLocator_pointConstraint1.ctz" "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocator.tz"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint.msg" "LegFoot__instance_1:IK_hip_joint_ikHandle.hsj"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_ikEffector.hp" "LegFoot__instance_1:IK_hip_joint_ikHandle.hee"
		;
connectAttr "ikRPsolver.msg" "LegFoot__instance_1:IK_hip_joint_ikHandle.hsv";
connectAttr "IK_hip_joint_ikHandle_poleVectorConstraint1.ctx" "LegFoot__instance_1:IK_hip_joint_ikHandle.pvx"
		;
connectAttr "IK_hip_joint_ikHandle_poleVectorConstraint1.cty" "LegFoot__instance_1:IK_hip_joint_ikHandle.pvy"
		;
connectAttr "IK_hip_joint_ikHandle_poleVectorConstraint1.ctz" "LegFoot__instance_1:IK_hip_joint_ikHandle.pvz"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_ikHandle.pim" "IK_hip_joint_ikHandle_poleVectorConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint.pm" "IK_hip_joint_ikHandle_poleVectorConstraint1.ps"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint.t" "IK_hip_joint_ikHandle_poleVectorConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_positionLocator.t" "IK_hip_joint_ikHandle_poleVectorConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_positionLocator.rp" "IK_hip_joint_ikHandle_poleVectorConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_positionLocator.rpt" "IK_hip_joint_ikHandle_poleVectorConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_positionLocator.pm" "IK_hip_joint_ikHandle_poleVectorConstraint1.tg[0].tpm"
		;
connectAttr "IK_hip_joint_ikHandle_poleVectorConstraint1.w0" "IK_hip_joint_ikHandle_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocator.pim" "IK_hip_joint_ikHandle_positionLocator_pointConstraint1.cpim"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocator.rp" "IK_hip_joint_ikHandle_positionLocator_pointConstraint1.crp"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocator.rpt" "IK_hip_joint_ikHandle_positionLocator_pointConstraint1.crt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.t" "IK_hip_joint_ikHandle_positionLocator_pointConstraint1.tg[0].tt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.rp" "IK_hip_joint_ikHandle_positionLocator_pointConstraint1.tg[0].trp"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.rpt" "IK_hip_joint_ikHandle_positionLocator_pointConstraint1.tg[0].trt"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.pm" "IK_hip_joint_ikHandle_positionLocator_pointConstraint1.tg[0].tpm"
		;
connectAttr "IK_hip_joint_ikHandle_positionLocator_pointConstraint1.w0" "IK_hip_joint_ikHandle_positionLocator_pointConstraint1.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_pointConstraint.ctx" "LegFoot__instance_1_mirror:hip_joint.tx"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_pointConstraint.cty" "LegFoot__instance_1_mirror:hip_joint.ty"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_pointConstraint.ctz" "LegFoot__instance_1_mirror:hip_joint.tz"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.s" "LegFoot__instance_1_mirror:knee_joint.is"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_scaleMultiply.ox" "LegFoot__instance_1_mirror:knee_joint.tx"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.s" "LegFoot__instance_1_mirror:ankle_joint.is"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_scaleMultiply.ox" "LegFoot__instance_1_mirror:ankle_joint.tx"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.s" "LegFoot__instance_1_mirror:ball_joint.is"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_scaleMultiply.ox" "LegFoot__instance_1_mirror:ball_joint.tx"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.s" "LegFoot__instance_1_mirror:toe_joint.is"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_scaleMultiply.ox" "LegFoot__instance_1_mirror:toe_joint.tx"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint.tx" "LegFoot__instance_1_mirror:ball_jointikEffector.tx"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint.ty" "LegFoot__instance_1_mirror:ball_jointikEffector.ty"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint.tz" "LegFoot__instance_1_mirror:ball_jointikEffector.tz"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint.opm" "LegFoot__instance_1_mirror:ball_jointikEffector.opm"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.tx" "LegFoot__instance_1_mirror:ankle_jointikEffector.tx"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.ty" "LegFoot__instance_1_mirror:ankle_jointikEffector.ty"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.tz" "LegFoot__instance_1_mirror:ankle_jointikEffector.tz"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.opm" "LegFoot__instance_1_mirror:ankle_jointikEffector.opm"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.tx" "LegFoot__instance_1_mirror:knee_jointikEffector.tx"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.ty" "LegFoot__instance_1_mirror:knee_jointikEffector.ty"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.tz" "LegFoot__instance_1_mirror:knee_jointikEffector.tz"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.opm" "LegFoot__instance_1_mirror:knee_jointikEffector.opm"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.pim" "LegFoot__instance_1_mirror:hip_joint_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.rp" "LegFoot__instance_1_mirror:hip_joint_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.rpt" "LegFoot__instance_1_mirror:hip_joint_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.t" "LegFoot__instance_1_mirror:hip_joint_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.rp" "LegFoot__instance_1_mirror:hip_joint_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.rpt" "LegFoot__instance_1_mirror:hip_joint_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.pm" "LegFoot__instance_1_mirror:hip_joint_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_pointConstraint.w0" "LegFoot__instance_1_mirror:hip_joint_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.tx" "LegFoot__instance_1_mirror:hip_jointikEffector.tx"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.ty" "LegFoot__instance_1_mirror:hip_jointikEffector.ty"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.tz" "LegFoot__instance_1_mirror:hip_jointikEffector.tz"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.opm" "LegFoot__instance_1_mirror:hip_jointikEffector.opm"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.msg" "LegFoot__instance_1_mirror:hip_joint_ikHandle.hsj"
		;
connectAttr "LegFoot__instance_1_mirror:hip_jointikEffector.hp" "LegFoot__instance_1_mirror:hip_joint_ikHandle.hee"
		;
connectAttr "ikRPsolver.msg" "LegFoot__instance_1_mirror:hip_joint_ikHandle.hsv"
		;
connectAttr "hip_joint_ikHandle_poleVectorConstraint2.ctx" "LegFoot__instance_1_mirror:hip_joint_ikHandle.pvx"
		;
connectAttr "hip_joint_ikHandle_poleVectorConstraint2.cty" "LegFoot__instance_1_mirror:hip_joint_ikHandle.pvy"
		;
connectAttr "hip_joint_ikHandle_poleVectorConstraint2.ctz" "LegFoot__instance_1_mirror:hip_joint_ikHandle.pvz"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint.ctx" "LegFoot__instance_1_mirror:hip_joint_ikHandle.tx"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint.cty" "LegFoot__instance_1_mirror:hip_joint_ikHandle.ty"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint.ctz" "LegFoot__instance_1_mirror:hip_joint_ikHandle.tz"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_ikHandle.pim" "hip_joint_ikHandle_poleVectorConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.pm" "hip_joint_ikHandle_poleVectorConstraint2.ps"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.t" "hip_joint_ikHandle_poleVectorConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator.t" "hip_joint_ikHandle_poleVectorConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator.rp" "hip_joint_ikHandle_poleVectorConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator.rpt" "hip_joint_ikHandle_poleVectorConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator.pm" "hip_joint_ikHandle_poleVectorConstraint2.tg[0].tpm"
		;
connectAttr "hip_joint_ikHandle_poleVectorConstraint2.w0" "hip_joint_ikHandle_poleVectorConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_ikHandle.pim" "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_ikHandle.rp" "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_ikHandle.rpt" "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocator.t" "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocator.rp" "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocator.rpt" "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocator.pm" "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint.w0" "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint.ctx" "LegFoot__instance_1_mirror:hip_joint_rootPosLocator.tx"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint.cty" "LegFoot__instance_1_mirror:hip_joint_rootPosLocator.ty"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint.ctz" "LegFoot__instance_1_mirror:hip_joint_rootPosLocator.tz"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_rootPosLocator.pim" "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_rootPosLocator.rp" "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_rootPosLocator.rpt" "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.t" "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.rp" "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.rpt" "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.pm" "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint.w0" "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint.ctx" "LegFoot__instance_1_mirror:knee_joint_endPosLocator.tx"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint.cty" "LegFoot__instance_1_mirror:knee_joint_endPosLocator.ty"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint.ctz" "LegFoot__instance_1_mirror:knee_joint_endPosLocator.tz"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocator.pim" "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocator.rp" "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocator.rpt" "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.t" "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.rp" "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.rpt" "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.pm" "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint.w0" "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.msg" "LegFoot__instance_1_mirror:knee_joint_ikHandle.hsj"
		;
connectAttr "LegFoot__instance_1_mirror:knee_jointikEffector.hp" "LegFoot__instance_1_mirror:knee_joint_ikHandle.hee"
		;
connectAttr "ikRPsolver.msg" "LegFoot__instance_1_mirror:knee_joint_ikHandle.hsv"
		;
connectAttr "knee_joint_ikHandle_poleVectorConstraint2.ctx" "LegFoot__instance_1_mirror:knee_joint_ikHandle.pvx"
		;
connectAttr "knee_joint_ikHandle_poleVectorConstraint2.cty" "LegFoot__instance_1_mirror:knee_joint_ikHandle.pvy"
		;
connectAttr "knee_joint_ikHandle_poleVectorConstraint2.ctz" "LegFoot__instance_1_mirror:knee_joint_ikHandle.pvz"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint.ctx" "LegFoot__instance_1_mirror:knee_joint_ikHandle.tx"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint.cty" "LegFoot__instance_1_mirror:knee_joint_ikHandle.ty"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint.ctz" "LegFoot__instance_1_mirror:knee_joint_ikHandle.tz"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_ikHandle.pim" "knee_joint_ikHandle_poleVectorConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.pm" "knee_joint_ikHandle_poleVectorConstraint2.ps"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.t" "knee_joint_ikHandle_poleVectorConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator.t" "knee_joint_ikHandle_poleVectorConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator.rp" "knee_joint_ikHandle_poleVectorConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator.rpt" "knee_joint_ikHandle_poleVectorConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator.pm" "knee_joint_ikHandle_poleVectorConstraint2.tg[0].tpm"
		;
connectAttr "knee_joint_ikHandle_poleVectorConstraint2.w0" "knee_joint_ikHandle_poleVectorConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_ikHandle.pim" "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_ikHandle.rp" "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_ikHandle.rpt" "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocator.t" "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocator.rp" "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocator.rpt" "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocator.pm" "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint.w0" "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint.ctx" "LegFoot__instance_1_mirror:knee_joint_rootPosLocator.tx"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint.cty" "LegFoot__instance_1_mirror:knee_joint_rootPosLocator.ty"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint.ctz" "LegFoot__instance_1_mirror:knee_joint_rootPosLocator.tz"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_rootPosLocator.pim" "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_rootPosLocator.rp" "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_rootPosLocator.rpt" "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.t" "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.rp" "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.rpt" "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.pm" "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint.w0" "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint.ctx" "LegFoot__instance_1_mirror:ankle_joint_endPosLocator.tx"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint.cty" "LegFoot__instance_1_mirror:ankle_joint_endPosLocator.ty"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint.ctz" "LegFoot__instance_1_mirror:ankle_joint_endPosLocator.tz"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocator.pim" "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocator.rp" "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocator.rpt" "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.t" "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.rp" "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.rpt" "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.pm" "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint.w0" "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.msg" "LegFoot__instance_1_mirror:ankle_joint_ikHandle.hsj"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_jointikEffector.hp" "LegFoot__instance_1_mirror:ankle_joint_ikHandle.hee"
		;
connectAttr "ikRPsolver.msg" "LegFoot__instance_1_mirror:ankle_joint_ikHandle.hsv"
		;
connectAttr "ankle_joint_ikHandle_poleVectorConstraint2.ctx" "LegFoot__instance_1_mirror:ankle_joint_ikHandle.pvx"
		;
connectAttr "ankle_joint_ikHandle_poleVectorConstraint2.cty" "LegFoot__instance_1_mirror:ankle_joint_ikHandle.pvy"
		;
connectAttr "ankle_joint_ikHandle_poleVectorConstraint2.ctz" "LegFoot__instance_1_mirror:ankle_joint_ikHandle.pvz"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint.ctx" "LegFoot__instance_1_mirror:ankle_joint_ikHandle.tx"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint.cty" "LegFoot__instance_1_mirror:ankle_joint_ikHandle.ty"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint.ctz" "LegFoot__instance_1_mirror:ankle_joint_ikHandle.tz"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_ikHandle.pim" "ankle_joint_ikHandle_poleVectorConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.pm" "ankle_joint_ikHandle_poleVectorConstraint2.ps"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.t" "ankle_joint_ikHandle_poleVectorConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator.t" "ankle_joint_ikHandle_poleVectorConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator.rp" "ankle_joint_ikHandle_poleVectorConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator.rpt" "ankle_joint_ikHandle_poleVectorConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator.pm" "ankle_joint_ikHandle_poleVectorConstraint2.tg[0].tpm"
		;
connectAttr "ankle_joint_ikHandle_poleVectorConstraint2.w0" "ankle_joint_ikHandle_poleVectorConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_ikHandle.pim" "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_ikHandle.rp" "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_ikHandle.rpt" "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocator.t" "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocator.rp" "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocator.rpt" "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocator.pm" "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint.w0" "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint.ctx" "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator.tx"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint.cty" "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator.ty"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint.ctz" "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator.tz"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator.pim" "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator.rp" "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator.rpt" "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.t" "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.rp" "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.rpt" "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.pm" "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint.w0" "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint.ctx" "LegFoot__instance_1_mirror:ball_joint_endPosLocator.tx"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint.cty" "LegFoot__instance_1_mirror:ball_joint_endPosLocator.ty"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint.ctz" "LegFoot__instance_1_mirror:ball_joint_endPosLocator.tz"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocator.pim" "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocator.rp" "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocator.rpt" "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.t" "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.rp" "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.rpt" "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.pm" "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint.w0" "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.msg" "LegFoot__instance_1_mirror:ball_joint_ikHandle.hsj"
		;
connectAttr "LegFoot__instance_1_mirror:ball_jointikEffector.hp" "LegFoot__instance_1_mirror:ball_joint_ikHandle.hee"
		;
connectAttr "ikRPsolver.msg" "LegFoot__instance_1_mirror:ball_joint_ikHandle.hsv"
		;
connectAttr "ball_joint_ikHandle_poleVectorConstraint2.ctx" "LegFoot__instance_1_mirror:ball_joint_ikHandle.pvx"
		;
connectAttr "ball_joint_ikHandle_poleVectorConstraint2.cty" "LegFoot__instance_1_mirror:ball_joint_ikHandle.pvy"
		;
connectAttr "ball_joint_ikHandle_poleVectorConstraint2.ctz" "LegFoot__instance_1_mirror:ball_joint_ikHandle.pvz"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint.ctx" "LegFoot__instance_1_mirror:ball_joint_ikHandle.tx"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint.cty" "LegFoot__instance_1_mirror:ball_joint_ikHandle.ty"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint.ctz" "LegFoot__instance_1_mirror:ball_joint_ikHandle.tz"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_ikHandle.pim" "ball_joint_ikHandle_poleVectorConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.pm" "ball_joint_ikHandle_poleVectorConstraint2.ps"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.t" "ball_joint_ikHandle_poleVectorConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator.t" "ball_joint_ikHandle_poleVectorConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator.rp" "ball_joint_ikHandle_poleVectorConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator.rpt" "ball_joint_ikHandle_poleVectorConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator.pm" "ball_joint_ikHandle_poleVectorConstraint2.tg[0].tpm"
		;
connectAttr "ball_joint_ikHandle_poleVectorConstraint2.w0" "ball_joint_ikHandle_poleVectorConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_ikHandle.pim" "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_ikHandle.rp" "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_ikHandle.rpt" "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocator.t" "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocator.rp" "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocator.rpt" "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocator.pm" "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint.w0" "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint.ctx" "LegFoot__instance_1_mirror:ball_joint_rootPosLocator.tx"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint.cty" "LegFoot__instance_1_mirror:ball_joint_rootPosLocator.ty"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint.ctz" "LegFoot__instance_1_mirror:ball_joint_rootPosLocator.tz"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_rootPosLocator.pim" "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_rootPosLocator.rp" "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_rootPosLocator.rpt" "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.t" "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.rp" "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.rpt" "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.pm" "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint.w0" "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint.ctx" "LegFoot__instance_1_mirror:toe_joint_endPosLocator.tx"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint.cty" "LegFoot__instance_1_mirror:toe_joint_endPosLocator.ty"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint.ctz" "LegFoot__instance_1_mirror:toe_joint_endPosLocator.tz"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocator.pim" "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocator.rp" "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocator.rpt" "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control.t" "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control.rp" "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control.rpt" "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control.pm" "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint.w0" "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.ctx" "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.tx"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.cty" "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.ty"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.ctz" "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.tz"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.crx" "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.rx"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.cry" "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.ry"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.crz" "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.rz"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.tx" "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.sx"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.csy" "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.sy"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.csz" "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.sz"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.ro" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.cro"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.pim" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.rp" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.rpt" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.t" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.rp" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.rpt" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.r" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.ro" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.s" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.pm" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.jo" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.ssc" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint.is" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tis"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.w0" "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.pim" "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.s" "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.pm" "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.tg[0].tpm"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.w0" "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.tg[0].tw"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.ctx" "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.tx"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.cty" "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.ty"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.ctz" "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.tz"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.crx" "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.rx"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.cry" "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.ry"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.crz" "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.rz"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.tx" "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.sx"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.csy" "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.sy"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.csz" "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.sz"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.ro" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.cro"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.pim" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.rp" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.rpt" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.t" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.rp" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.rpt" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.r" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.ro" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.s" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.pm" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.jo" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.ssc" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint.is" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tis"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.w0" "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.pim" "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.s" "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.pm" "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.tg[0].tpm"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.w0" "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.tg[0].tw"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.ctx" "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.tx"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.cty" "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.ty"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.ctz" "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.tz"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.crx" "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.rx"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.cry" "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.ry"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.crz" "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.rz"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.tx" "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.sx"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint2.csy" "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.sy"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint2.csz" "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.sz"
		;
connectAttr "groupId25.id" "LegFoot__instance_1_mirror:ankle_joint_orientation_controlShape.iog.og[0].gid"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlockSG.mwc" "LegFoot__instance_1_mirror:ankle_joint_orientation_controlShape.iog.og[0].gco"
		;
connectAttr "groupId26.id" "LegFoot__instance_1_mirror:ankle_joint_orientation_controlShape.iog.og[1].gid"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlockSG.mwc" "LegFoot__instance_1_mirror:ankle_joint_orientation_controlShape.iog.og[1].gco"
		;
connectAttr "groupId24.id" "LegFoot__instance_1_mirror:ankle_joint_orientation_controlShape.ciog.cog[0].cgid"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.ro" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.cro"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.pim" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.rp" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.rpt" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.t" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.rp" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.rpt" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.r" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.ro" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.s" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.pm" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.jo" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.ssc" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint.is" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tis"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.w0" "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.pim" "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.s" "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.pm" "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint2.tg[0].tpm"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint2.w0" "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint2.tg[0].tw"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.ctx" "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.tx"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.cty" "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.ty"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.ctz" "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.tz"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.crx" "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.rx"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.cry" "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.ry"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.crz" "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.rz"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint.tx" "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.sx"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint2.csy" "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.sy"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint2.csz" "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.sz"
		;
connectAttr "groupId28.id" "LegFoot__instance_1_mirror:ball_joint_orientation_controlShape.iog.og[0].gid"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlockSG.mwc" "LegFoot__instance_1_mirror:ball_joint_orientation_controlShape.iog.og[0].gco"
		;
connectAttr "groupId29.id" "LegFoot__instance_1_mirror:ball_joint_orientation_controlShape.iog.og[1].gid"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlockSG.mwc" "LegFoot__instance_1_mirror:ball_joint_orientation_controlShape.iog.og[1].gco"
		;
connectAttr "groupId27.id" "LegFoot__instance_1_mirror:ball_joint_orientation_controlShape.ciog.cog[0].cgid"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.ro" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.cro"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.pim" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.rp" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.rpt" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.t" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.rp" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.rpt" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.r" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.ro" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.s" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.pm" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.jo" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.ssc" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint.is" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tis"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.w0" "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.pim" "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.s" "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.pm" "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint2.tg[0].tpm"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint2.w0" "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint2.tg[0].tw"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.ctx" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.tx"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.cty" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.ty"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.ctz" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.tz"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.crx" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.rx"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.cry" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.ry"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.crz" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.rz"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint2.csx" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.sx"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint2.csy" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.sy"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint2.csz" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.sz"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_rotateX.o" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation.rx"
		 -l on;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.ro" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.cro"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.pim" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.rp" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.rpt" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.t" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.rp" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.rpt" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.r" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.ro" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.s" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.pm" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.jo" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.ssc" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.is" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.tg[0].tis"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.w0" "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.pim" "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.s" "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.pm" "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint2.tg[0].tpm"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint2.w0" "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint.ctx" "LegFoot__instance_1_mirror:hook_root_joint.tx"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint.cty" "LegFoot__instance_1_mirror:hook_root_joint.ty"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint.ctz" "LegFoot__instance_1_mirror:hook_root_joint.tz"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.s" "LegFoot__instance_1_mirror:hook_target_joint.is"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint_scaleMultiply.ox" "LegFoot__instance_1_mirror:hook_target_joint.tx"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint.tx" "LegFoot__instance_1_mirror:hook_root_jointikEffector.tx"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint.ty" "LegFoot__instance_1_mirror:hook_root_jointikEffector.ty"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint.tz" "LegFoot__instance_1_mirror:hook_root_jointikEffector.tz"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint.opm" "LegFoot__instance_1_mirror:hook_root_jointikEffector.opm"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.pim" "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.rp" "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.rpt" "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.t" "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.rp" "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.rpt" "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.pm" "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint.w0" "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint.tg[0].tw"
		;
connectAttr "unhookedTarget_pointConstraint2.ctx" "LegFoot__instance_1_mirror:unhookedTarget.tx"
		;
connectAttr "unhookedTarget_pointConstraint2.cty" "LegFoot__instance_1_mirror:unhookedTarget.ty"
		;
connectAttr "unhookedTarget_pointConstraint2.ctz" "LegFoot__instance_1_mirror:unhookedTarget.tz"
		;
connectAttr "LegFoot__instance_1_mirror:unhookedTarget.pim" "unhookedTarget_pointConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:unhookedTarget.rp" "unhookedTarget_pointConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:unhookedTarget.rpt" "unhookedTarget_pointConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.t" "unhookedTarget_pointConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.rp" "unhookedTarget_pointConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.rpt" "unhookedTarget_pointConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.pm" "unhookedTarget_pointConstraint2.tg[0].tpm"
		;
connectAttr "unhookedTarget_pointConstraint2.w0" "unhookedTarget_pointConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.msg" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.hsj"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_jointikEffector.hp" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.hee"
		;
connectAttr "ikRPsolver.msg" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.hsv"
		;
connectAttr "hook_root_joint_ikHandle_poleVectorConstraint2.ctx" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.pvx"
		;
connectAttr "hook_root_joint_ikHandle_poleVectorConstraint2.cty" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.pvy"
		;
connectAttr "hook_root_joint_ikHandle_poleVectorConstraint2.ctz" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.pvz"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint.ctx" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.tx"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint.cty" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.ty"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint.ctz" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.tz"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.pim" "hook_root_joint_ikHandle_poleVectorConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.pm" "hook_root_joint_ikHandle_poleVectorConstraint2.ps"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.t" "hook_root_joint_ikHandle_poleVectorConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_poleVectorLocator.t" "hook_root_joint_ikHandle_poleVectorConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_poleVectorLocator.rp" "hook_root_joint_ikHandle_poleVectorConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_poleVectorLocator.rpt" "hook_root_joint_ikHandle_poleVectorConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_poleVectorLocator.pm" "hook_root_joint_ikHandle_poleVectorConstraint2.tg[0].tpm"
		;
connectAttr "hook_root_joint_ikHandle_poleVectorConstraint2.w0" "hook_root_joint_ikHandle_poleVectorConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.pim" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.rp" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.rpt" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator.t" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator.rp" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator.rpt" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator.pm" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint.w0" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint.ctx" "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator.tx"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint.cty" "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator.ty"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint.ctz" "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator.tz"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator.pim" "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator.rp" "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator.rpt" "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.t" "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.rp" "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.rpt" "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.pm" "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint.w0" "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:hook_pointConstraint.ctx" "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator.tx"
		;
connectAttr "LegFoot__instance_1_mirror:hook_pointConstraint.cty" "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator.ty"
		;
connectAttr "LegFoot__instance_1_mirror:hook_pointConstraint.ctz" "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator.tz"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator.pim" "LegFoot__instance_1_mirror:hook_pointConstraint.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator.rp" "LegFoot__instance_1_mirror:hook_pointConstraint.crp"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator.rpt" "LegFoot__instance_1_mirror:hook_pointConstraint.crt"
		;
connectAttr "LegFoot__instance_1_mirror:unhookedTarget.t" "LegFoot__instance_1_mirror:hook_pointConstraint.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:unhookedTarget.rp" "LegFoot__instance_1_mirror:hook_pointConstraint.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:unhookedTarget.rpt" "LegFoot__instance_1_mirror:hook_pointConstraint.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:unhookedTarget.pm" "LegFoot__instance_1_mirror:hook_pointConstraint.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:hook_pointConstraint.w0" "LegFoot__instance_1_mirror:hook_pointConstraint.tg[0].tw"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.ctx" "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.tx"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.cty" "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.ty"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.ctz" "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.tz"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.crx" "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.rx"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.cry" "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.ry"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.crz" "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.rz"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint.tx" "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.sx"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint2.csy" "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.sy"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint2.csz" "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.sz"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.ro" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.cro"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.pim" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.rp" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.rpt" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.t" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.rp" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.rpt" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.r" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.ro" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.s" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.pm" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.tg[0].tpm"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.jo" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.tg[0].tjo"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.ssc" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.tg[0].tsc"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.is" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.tg[0].tis"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.w0" "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.pim" "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.s" "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.pm" "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint2.tg[0].tpm"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint2.w0" "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint2.tg[0].tw"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.ctx" "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.tx"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cty" "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.ty"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.ctz" "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.tz"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crx" "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.rx"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cry" "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.ry"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crz" "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.rz"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.ro" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cro"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.pim" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.rp" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.rpt" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.t" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.rp" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.rpt" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.r" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.ro" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.s" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.pm" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tpm"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.w0" "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tw"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.ctx" "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.tx"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cty" "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.ty"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.ctz" "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.tz"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crx" "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.rx"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cry" "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.ry"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crz" "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.rz"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.ro" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cro"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.pim" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.rp" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.rpt" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.t" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.rp" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.rpt" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.r" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.ro" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.s" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.pm" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tpm"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.w0" "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tw"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.ctx" "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.tx"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cty" "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.ty"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.ctz" "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.tz"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crx" "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.rx"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cry" "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.ry"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crz" "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.rz"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.ro" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cro"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.pim" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.rp" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.rpt" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.t" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.rp" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.rpt" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.r" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.ro" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.s" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.pm" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tpm"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.w0" "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tw"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.ctx" "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.tx"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cty" "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.ty"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.ctz" "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.tz"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crx" "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.rx"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cry" "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.ry"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crz" "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.rz"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.ro" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cro"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.pim" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.rp" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.rpt" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.t" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.rp" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.rpt" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.r" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tr"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.ro" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tro"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.s" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].ts"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.pm" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tpm"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.w0" "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.tg[0].tw"
		;
connectAttr "IK_hip_joint_positionLocator_pointConstraint2.ctx" "LegFoot__instance_1_mirror:IK_hip_joint_positionLocator.tx"
		;
connectAttr "IK_hip_joint_positionLocator_pointConstraint2.cty" "LegFoot__instance_1_mirror:IK_hip_joint_positionLocator.ty"
		;
connectAttr "IK_hip_joint_positionLocator_pointConstraint2.ctz" "LegFoot__instance_1_mirror:IK_hip_joint_positionLocator.tz"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint.s" "LegFoot__instance_1_mirror:IK_knee_joint.is"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_translationValue.ox" "LegFoot__instance_1_mirror:IK_knee_joint.tx"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.s" "LegFoot__instance_1_mirror:IK_ankle_joint.is"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_translationValue.ox" "LegFoot__instance_1_mirror:IK_ankle_joint.tx"
		;
connectAttr "LegFoot__instance_1_mirror:IK_ankle_joint.s" "IK_ball_joint1.is";
connectAttr "IK_ball_joint1.s" "IK_toe_joint1.is";
connectAttr "LegFoot__instance_1_mirror:IK_ankle_joint.tx" "LegFoot__instance_1_mirror:IK_hip_joint_ikEffector.tx"
		;
connectAttr "LegFoot__instance_1_mirror:IK_ankle_joint.ty" "LegFoot__instance_1_mirror:IK_hip_joint_ikEffector.ty"
		;
connectAttr "LegFoot__instance_1_mirror:IK_ankle_joint.tz" "LegFoot__instance_1_mirror:IK_hip_joint_ikEffector.tz"
		;
connectAttr "LegFoot__instance_1_mirror:IK_ankle_joint.opm" "LegFoot__instance_1_mirror:IK_hip_joint_ikEffector.opm"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_positionLocator.pim" "IK_hip_joint_positionLocator_pointConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_positionLocator.rp" "IK_hip_joint_positionLocator_pointConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_positionLocator.rpt" "IK_hip_joint_positionLocator_pointConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.t" "IK_hip_joint_positionLocator_pointConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.rp" "IK_hip_joint_positionLocator_pointConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.rpt" "IK_hip_joint_positionLocator_pointConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.pm" "IK_hip_joint_positionLocator_pointConstraint2.tg[0].tpm"
		;
connectAttr "IK_hip_joint_positionLocator_pointConstraint2.w0" "IK_hip_joint_positionLocator_pointConstraint2.tg[0].tw"
		;
connectAttr "IK_knee_joint_positionLocator_pointConstraint2.ctx" "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator.tx"
		;
connectAttr "IK_knee_joint_positionLocator_pointConstraint2.cty" "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator.ty"
		;
connectAttr "IK_knee_joint_positionLocator_pointConstraint2.ctz" "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator.tz"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator.pim" "IK_knee_joint_positionLocator_pointConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator.rp" "IK_knee_joint_positionLocator_pointConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator.rpt" "IK_knee_joint_positionLocator_pointConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.t" "IK_knee_joint_positionLocator_pointConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.rp" "IK_knee_joint_positionLocator_pointConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.rpt" "IK_knee_joint_positionLocator_pointConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.pm" "IK_knee_joint_positionLocator_pointConstraint2.tg[0].tpm"
		;
connectAttr "IK_knee_joint_positionLocator_pointConstraint2.w0" "IK_knee_joint_positionLocator_pointConstraint2.tg[0].tw"
		;
connectAttr "IK_hip_joint_ikHandle_positionLocator_pointConstraint2.ctx" "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocator.tx"
		;
connectAttr "IK_hip_joint_ikHandle_positionLocator_pointConstraint2.cty" "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocator.ty"
		;
connectAttr "IK_hip_joint_ikHandle_positionLocator_pointConstraint2.ctz" "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocator.tz"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint.msg" "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle.hsj"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_ikEffector.hp" "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle.hee"
		;
connectAttr "ikRPsolver.msg" "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle.hsv"
		;
connectAttr "IK_hip_joint_ikHandle_poleVectorConstraint2.ctx" "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle.pvx"
		;
connectAttr "IK_hip_joint_ikHandle_poleVectorConstraint2.cty" "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle.pvy"
		;
connectAttr "IK_hip_joint_ikHandle_poleVectorConstraint2.ctz" "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle.pvz"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle.pim" "IK_hip_joint_ikHandle_poleVectorConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint.pm" "IK_hip_joint_ikHandle_poleVectorConstraint2.ps"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint.t" "IK_hip_joint_ikHandle_poleVectorConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator.t" "IK_hip_joint_ikHandle_poleVectorConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator.rp" "IK_hip_joint_ikHandle_poleVectorConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator.rpt" "IK_hip_joint_ikHandle_poleVectorConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator.pm" "IK_hip_joint_ikHandle_poleVectorConstraint2.tg[0].tpm"
		;
connectAttr "IK_hip_joint_ikHandle_poleVectorConstraint2.w0" "IK_hip_joint_ikHandle_poleVectorConstraint2.tg[0].tw"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocator.pim" "IK_hip_joint_ikHandle_positionLocator_pointConstraint2.cpim"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocator.rp" "IK_hip_joint_ikHandle_positionLocator_pointConstraint2.crp"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocator.rpt" "IK_hip_joint_ikHandle_positionLocator_pointConstraint2.crt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.t" "IK_hip_joint_ikHandle_positionLocator_pointConstraint2.tg[0].tt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.rp" "IK_hip_joint_ikHandle_positionLocator_pointConstraint2.tg[0].trp"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.rpt" "IK_hip_joint_ikHandle_positionLocator_pointConstraint2.tg[0].trt"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.pm" "IK_hip_joint_ikHandle_positionLocator_pointConstraint2.tg[0].tpm"
		;
connectAttr "IK_hip_joint_ikHandle_positionLocator_pointConstraint2.w0" "IK_hip_joint_ikHandle_positionLocator_pointConstraint2.tg[0].tw"
		;
connectAttr "Group__legs.sy" "Group__legs.sx" -l on;
connectAttr "Group__legs.sy" "Group__legs.sz" -l on;
connectAttr "LegFoot__instance_1:module_transform.sy" "LegFoot__instance_1:module_transform.sx"
		;
connectAttr "LegFoot__instance_1:module_transform.sy" "LegFoot__instance_1:module_transform.sz"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.sy" "LegFoot__instance_1_mirror:module_transform.sx"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.sy" "LegFoot__instance_1_mirror:module_transform.sz"
		;
connectAttr "Group__legs.t" "Group_container.boc[0]";
connectAttr "Group__legs.tx" "Group_container.boc[1]";
connectAttr "Group__legs.ty" "Group_container.boc[2]";
connectAttr "Group__legs.tz" "Group_container.boc[3]";
connectAttr "Group__legs.r" "Group_container.boc[4]";
connectAttr "Group__legs.rx" "Group_container.boc[5]";
connectAttr "Group__legs.ry" "Group_container.boc[6]";
connectAttr "Group__legs.rz" "Group_container.boc[7]";
connectAttr "Group__legs.sy" "Group_container.boc[8]";
connectAttr "hyperLayout31.msg" "Group_container.hl";
connectAttr "LegFoot__instance_1:hip_joint.r" "LegFoot__instance_1:module_container.boc[0]"
		;
connectAttr "LegFoot__instance_1:hip_joint.rx" "LegFoot__instance_1:module_container.boc[1]"
		;
connectAttr "LegFoot__instance_1:hip_joint.ry" "LegFoot__instance_1:module_container.boc[2]"
		;
connectAttr "LegFoot__instance_1:hip_joint.rz" "LegFoot__instance_1:module_container.boc[3]"
		;
connectAttr "LegFoot__instance_1:hip_joint.ro" "LegFoot__instance_1:module_container.boc[4]"
		;
connectAttr "LegFoot__instance_1:knee_joint.r" "LegFoot__instance_1:module_container.boc[5]"
		;
connectAttr "LegFoot__instance_1:knee_joint.rx" "LegFoot__instance_1:module_container.boc[6]"
		;
connectAttr "LegFoot__instance_1:knee_joint.ry" "LegFoot__instance_1:module_container.boc[7]"
		;
connectAttr "LegFoot__instance_1:knee_joint.rz" "LegFoot__instance_1:module_container.boc[8]"
		;
connectAttr "LegFoot__instance_1:knee_joint.ro" "LegFoot__instance_1:module_container.boc[9]"
		;
connectAttr "LegFoot__instance_1:ankle_joint.r" "LegFoot__instance_1:module_container.boc[10]"
		;
connectAttr "LegFoot__instance_1:ankle_joint.rx" "LegFoot__instance_1:module_container.boc[11]"
		;
connectAttr "LegFoot__instance_1:ankle_joint.ry" "LegFoot__instance_1:module_container.boc[12]"
		;
connectAttr "LegFoot__instance_1:ankle_joint.rz" "LegFoot__instance_1:module_container.boc[13]"
		;
connectAttr "LegFoot__instance_1:ankle_joint.ro" "LegFoot__instance_1:module_container.boc[14]"
		;
connectAttr "LegFoot__instance_1:ball_joint.r" "LegFoot__instance_1:module_container.boc[15]"
		;
connectAttr "LegFoot__instance_1:ball_joint.rx" "LegFoot__instance_1:module_container.boc[16]"
		;
connectAttr "LegFoot__instance_1:ball_joint.ry" "LegFoot__instance_1:module_container.boc[17]"
		;
connectAttr "LegFoot__instance_1:ball_joint.rz" "LegFoot__instance_1:module_container.boc[18]"
		;
connectAttr "LegFoot__instance_1:ball_joint.ro" "LegFoot__instance_1:module_container.boc[19]"
		;
connectAttr "LegFoot__instance_1:toe_joint.r" "LegFoot__instance_1:module_container.boc[20]"
		;
connectAttr "LegFoot__instance_1:toe_joint.rx" "LegFoot__instance_1:module_container.boc[21]"
		;
connectAttr "LegFoot__instance_1:toe_joint.ry" "LegFoot__instance_1:module_container.boc[22]"
		;
connectAttr "LegFoot__instance_1:toe_joint.rz" "LegFoot__instance_1:module_container.boc[23]"
		;
connectAttr "LegFoot__instance_1:toe_joint.ro" "LegFoot__instance_1:module_container.boc[24]"
		;
connectAttr "LegFoot__instance_1:module_transform.t" "LegFoot__instance_1:module_container.boc[25]"
		;
connectAttr "LegFoot__instance_1:module_transform.tx" "LegFoot__instance_1:module_container.boc[26]"
		;
connectAttr "LegFoot__instance_1:module_transform.ty" "LegFoot__instance_1:module_container.boc[27]"
		;
connectAttr "LegFoot__instance_1:module_transform.tz" "LegFoot__instance_1:module_container.boc[28]"
		;
connectAttr "LegFoot__instance_1:module_transform.r" "LegFoot__instance_1:module_container.boc[29]"
		;
connectAttr "LegFoot__instance_1:module_transform.rx" "LegFoot__instance_1:module_container.boc[30]"
		;
connectAttr "LegFoot__instance_1:module_transform.ry" "LegFoot__instance_1:module_container.boc[31]"
		;
connectAttr "LegFoot__instance_1:module_transform.rz" "LegFoot__instance_1:module_container.boc[32]"
		;
connectAttr "LegFoot__instance_1:module_transform.sy" "LegFoot__instance_1:module_container.boc[33]"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_container.boc[0]" "LegFoot__instance_1:module_container.boc[34]"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_container.boc[1]" "LegFoot__instance_1:module_container.boc[35]"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_container.boc[2]" "LegFoot__instance_1:module_container.boc[36]"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_container.boc[3]" "LegFoot__instance_1:module_container.boc[37]"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_container.boc[0]" "LegFoot__instance_1:module_container.boc[38]"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_container.boc[1]" "LegFoot__instance_1:module_container.boc[39]"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_container.boc[2]" "LegFoot__instance_1:module_container.boc[40]"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_container.boc[3]" "LegFoot__instance_1:module_container.boc[41]"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_container.boc[0]" "LegFoot__instance_1:module_container.boc[42]"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_container.boc[1]" "LegFoot__instance_1:module_container.boc[43]"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_container.boc[2]" "LegFoot__instance_1:module_container.boc[44]"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_container.boc[3]" "LegFoot__instance_1:module_container.boc[45]"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_container.boc[0]" "LegFoot__instance_1:module_container.boc[46]"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_container.boc[1]" "LegFoot__instance_1:module_container.boc[47]"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_container.boc[2]" "LegFoot__instance_1:module_container.boc[48]"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_container.boc[3]" "LegFoot__instance_1:module_container.boc[49]"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control_container.boc[0]" "LegFoot__instance_1:module_container.boc[50]"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control_container.boc[1]" "LegFoot__instance_1:module_container.boc[51]"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control_container.boc[2]" "LegFoot__instance_1:module_container.boc[52]"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control_container.boc[3]" "LegFoot__instance_1:module_container.boc[53]"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint.r" "LegFoot__instance_1:module_container.boc[54]"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint.rx" "LegFoot__instance_1:module_container.boc[55]"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint.ry" "LegFoot__instance_1:module_container.boc[56]"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint.rz" "LegFoot__instance_1:module_container.boc[57]"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.r" "LegFoot__instance_1:module_container.boc[58]"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.rx" "LegFoot__instance_1:module_container.boc[59]"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.ry" "LegFoot__instance_1:module_container.boc[60]"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint.rz" "LegFoot__instance_1:module_container.boc[61]"
		;
connectAttr "LegFoot__instance_1:IK_ankle_joint.r" "LegFoot__instance_1:module_container.boc[62]"
		;
connectAttr "LegFoot__instance_1:IK_ankle_joint.rx" "LegFoot__instance_1:module_container.boc[63]"
		;
connectAttr "LegFoot__instance_1:IK_ankle_joint.ry" "LegFoot__instance_1:module_container.boc[64]"
		;
connectAttr "LegFoot__instance_1:IK_ankle_joint.rz" "LegFoot__instance_1:module_container.boc[65]"
		;
connectAttr "LegFoot__instance_1:IK_ball_joint.r" "LegFoot__instance_1:module_container.boc[66]"
		;
connectAttr "LegFoot__instance_1:IK_ball_joint.rx" "LegFoot__instance_1:module_container.boc[67]"
		;
connectAttr "LegFoot__instance_1:IK_ball_joint.ry" "LegFoot__instance_1:module_container.boc[68]"
		;
connectAttr "LegFoot__instance_1:IK_ball_joint.rz" "LegFoot__instance_1:module_container.boc[69]"
		;
connectAttr "LegFoot__instance_1:IK_toe_joint.r" "LegFoot__instance_1:module_container.boc[70]"
		;
connectAttr "LegFoot__instance_1:IK_toe_joint.rx" "LegFoot__instance_1:module_container.boc[71]"
		;
connectAttr "LegFoot__instance_1:IK_toe_joint.ry" "LegFoot__instance_1:module_container.boc[72]"
		;
connectAttr "LegFoot__instance_1:IK_toe_joint.rz" "LegFoot__instance_1:module_container.boc[73]"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_container.boc[0]" "LegFoot__instance_1:module_container.boc[74]"
		;
connectAttr "LegFoot__instance_1:ankle_joint_orientation_control_container.boc[0]" "LegFoot__instance_1:module_container.boc[75]"
		;
connectAttr "LegFoot__instance_1:ball_joint_orientation_control_container.boc[0]" "LegFoot__instance_1:module_container.boc[76]"
		;
connectAttr "hyperLayout1.msg" "LegFoot__instance_1:module_container.hl";
connectAttr "LegFoot__instance_1_mirror:module_transform.t" "LegFoot__instance_1_mirror:module_container.boc[25]"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.tx" "LegFoot__instance_1_mirror:module_container.boc[26]"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.ty" "LegFoot__instance_1_mirror:module_container.boc[27]"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.tz" "LegFoot__instance_1_mirror:module_container.boc[28]"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.r" "LegFoot__instance_1_mirror:module_container.boc[29]"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.rx" "LegFoot__instance_1_mirror:module_container.boc[30]"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.ry" "LegFoot__instance_1_mirror:module_container.boc[31]"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.rz" "LegFoot__instance_1_mirror:module_container.boc[32]"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.sy" "LegFoot__instance_1_mirror:module_container.boc[33]"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_container.boc[0]" "LegFoot__instance_1_mirror:module_container.boc[34]"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_container.boc[1]" "LegFoot__instance_1_mirror:module_container.boc[35]"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_container.boc[2]" "LegFoot__instance_1_mirror:module_container.boc[36]"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_container.boc[3]" "LegFoot__instance_1_mirror:module_container.boc[37]"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_container.boc[0]" "LegFoot__instance_1_mirror:module_container.boc[38]"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_container.boc[1]" "LegFoot__instance_1_mirror:module_container.boc[39]"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_container.boc[2]" "LegFoot__instance_1_mirror:module_container.boc[40]"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_container.boc[3]" "LegFoot__instance_1_mirror:module_container.boc[41]"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_container.boc[0]" "LegFoot__instance_1_mirror:module_container.boc[42]"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_container.boc[1]" "LegFoot__instance_1_mirror:module_container.boc[43]"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_container.boc[2]" "LegFoot__instance_1_mirror:module_container.boc[44]"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_container.boc[3]" "LegFoot__instance_1_mirror:module_container.boc[45]"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_container.boc[0]" "LegFoot__instance_1_mirror:module_container.boc[46]"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_container.boc[1]" "LegFoot__instance_1_mirror:module_container.boc[47]"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_container.boc[2]" "LegFoot__instance_1_mirror:module_container.boc[48]"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_container.boc[3]" "LegFoot__instance_1_mirror:module_container.boc[49]"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control_container.boc[0]" "LegFoot__instance_1_mirror:module_container.boc[50]"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control_container.boc[1]" "LegFoot__instance_1_mirror:module_container.boc[51]"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control_container.boc[2]" "LegFoot__instance_1_mirror:module_container.boc[52]"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control_container.boc[3]" "LegFoot__instance_1_mirror:module_container.boc[53]"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint.r" "LegFoot__instance_1_mirror:module_container.boc[54]"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint.rx" "LegFoot__instance_1_mirror:module_container.boc[55]"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint.ry" "LegFoot__instance_1_mirror:module_container.boc[56]"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint.rz" "LegFoot__instance_1_mirror:module_container.boc[57]"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.r" "LegFoot__instance_1_mirror:module_container.boc[58]"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.rx" "LegFoot__instance_1_mirror:module_container.boc[59]"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.ry" "LegFoot__instance_1_mirror:module_container.boc[60]"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.rz" "LegFoot__instance_1_mirror:module_container.boc[61]"
		;
connectAttr "LegFoot__instance_1_mirror:IK_ankle_joint.r" "LegFoot__instance_1_mirror:module_container.boc[62]"
		;
connectAttr "LegFoot__instance_1_mirror:IK_ankle_joint.rx" "LegFoot__instance_1_mirror:module_container.boc[63]"
		;
connectAttr "LegFoot__instance_1_mirror:IK_ankle_joint.ry" "LegFoot__instance_1_mirror:module_container.boc[64]"
		;
connectAttr "LegFoot__instance_1_mirror:IK_ankle_joint.rz" "LegFoot__instance_1_mirror:module_container.boc[65]"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_container.boc[0]" "LegFoot__instance_1_mirror:module_container.boc[66]"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_orientation_control_container.boc[0]" "LegFoot__instance_1_mirror:module_container.boc[67]"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_orientation_control_container.boc[0]" "LegFoot__instance_1_mirror:module_container.boc[68]"
		;
connectAttr "hyperLayout16.msg" "LegFoot__instance_1_mirror:module_container.hl"
		;
connectAttr "Group__legs.msg" "hyperLayout31.hyp[0].dn";
connectAttr "Group__legsShape.msg" "hyperLayout31.hyp[1].dn";
connectAttr "hyperLayout3.msg" "LegFoot__instance_1:knee_joint_translation_control_container.hl"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.t" "LegFoot__instance_1:knee_joint_translation_control_container.boc[0]"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.tx" "LegFoot__instance_1:knee_joint_translation_control_container.boc[1]"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.ty" "LegFoot__instance_1:knee_joint_translation_control_container.boc[2]"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.tz" "LegFoot__instance_1:knee_joint_translation_control_container.boc[3]"
		;
connectAttr "hyperLayout4.msg" "LegFoot__instance_1:ankle_joint_translation_control_container.hl"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.t" "LegFoot__instance_1:ankle_joint_translation_control_container.boc[0]"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.tx" "LegFoot__instance_1:ankle_joint_translation_control_container.boc[1]"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.ty" "LegFoot__instance_1:ankle_joint_translation_control_container.boc[2]"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.tz" "LegFoot__instance_1:ankle_joint_translation_control_container.boc[3]"
		;
connectAttr "hyperLayout2.msg" "LegFoot__instance_1:hip_joint_translation_control_container.hl"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.t" "LegFoot__instance_1:hip_joint_translation_control_container.boc[0]"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.tx" "LegFoot__instance_1:hip_joint_translation_control_container.boc[1]"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.ty" "LegFoot__instance_1:hip_joint_translation_control_container.boc[2]"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.tz" "LegFoot__instance_1:hip_joint_translation_control_container.boc[3]"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_positionLocatorShape.wp" "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator.p1"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_positionLocatorShape.wp" "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator.p2"
		;
connectAttr "LegFoot__instance_1:ankle_joint_rootPosLocatorShape.wp" "LegFoot__instance_1:distBetween_ankle_joint_rootPosLocator_ball_joint_endPosLocator.p1"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocatorShape.wp" "LegFoot__instance_1:distBetween_ankle_joint_rootPosLocator_ball_joint_endPosLocator.p2"
		;
connectAttr "LegFoot__instance_1:ball_joint_rootPosLocatorShape.wp" "LegFoot__instance_1:distBetween_ball_joint_rootPosLocator_toe_joint_endPosLocator.p1"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocatorShape.wp" "LegFoot__instance_1:distBetween_ball_joint_rootPosLocator_toe_joint_endPosLocator.p2"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_positionLocatorShape.wp" "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator.p1"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocatorShape.wp" "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator.p2"
		;
connectAttr "hyperLayout6.msg" "LegFoot__instance_1:toe_joint_translation_control_container.hl"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control.t" "LegFoot__instance_1:toe_joint_translation_control_container.boc[0]"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control.tx" "LegFoot__instance_1:toe_joint_translation_control_container.boc[1]"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control.ty" "LegFoot__instance_1:toe_joint_translation_control_container.boc[2]"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control.tz" "LegFoot__instance_1:toe_joint_translation_control_container.boc[3]"
		;
connectAttr "hyperLayout9.msg" "LegFoot__instance_1:hip_joint_hierarchy_representation_container.hl"
		;
connectAttr "hyperLayout13.msg" "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_container.hl"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation.axis" "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_container.boc[0]"
		;
connectAttr "hyperLayout5.msg" "LegFoot__instance_1:ball_joint_translation_control_container.hl"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.t" "LegFoot__instance_1:ball_joint_translation_control_container.boc[0]"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.tx" "LegFoot__instance_1:ball_joint_translation_control_container.boc[1]"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.ty" "LegFoot__instance_1:ball_joint_translation_control_container.boc[2]"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.tz" "LegFoot__instance_1:ball_joint_translation_control_container.boc[3]"
		;
connectAttr "hyperLayout10.msg" "LegFoot__instance_1:knee_joint_hierarchy_representation_container.hl"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.r" "LegFoot__instance_1:hook_container.boc[0]"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.rx" "LegFoot__instance_1:hook_container.boc[1]"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.ry" "LegFoot__instance_1:hook_container.boc[2]"
		;
connectAttr "LegFoot__instance_1:hook_root_joint.rz" "LegFoot__instance_1:hook_container.boc[3]"
		;
connectAttr "LegFoot__instance_1:hook_target_joint.r" "LegFoot__instance_1:hook_container.boc[4]"
		;
connectAttr "LegFoot__instance_1:hook_target_joint.rx" "LegFoot__instance_1:hook_container.boc[5]"
		;
connectAttr "LegFoot__instance_1:hook_target_joint.ry" "LegFoot__instance_1:hook_container.boc[6]"
		;
connectAttr "LegFoot__instance_1:hook_target_joint.rz" "LegFoot__instance_1:hook_container.boc[7]"
		;
connectAttr "hyperLayout7.msg" "LegFoot__instance_1:hook_container.hl";
connectAttr "hyperLayout14.msg" "LegFoot__instance_1:ankle_joint_orientation_control_container.hl"
		;
connectAttr "LegFoot__instance_1:ankle_joint_orientation_control.rx" "LegFoot__instance_1:ankle_joint_orientation_control_container.boc[0]"
		;
connectAttr "hyperLayout15.msg" "LegFoot__instance_1:ball_joint_orientation_control_container.hl"
		;
connectAttr "LegFoot__instance_1:ball_joint_orientation_control.rx" "LegFoot__instance_1:ball_joint_orientation_control_container.boc[0]"
		;
connectAttr "LegFoot__instance_1:knee_joint_rootPosLocatorShape.wp" "LegFoot__instance_1:distBetween_knee_joint_rootPosLocator_ankle_joint_endPosLocator.p1"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocatorShape.wp" "LegFoot__instance_1:distBetween_knee_joint_rootPosLocator_ankle_joint_endPosLocator.p2"
		;
connectAttr "LegFoot__instance_1:hip_joint_rootPosLocatorShape.wp" "LegFoot__instance_1:distBetween_hip_joint_rootPosLocator_knee_joint_endPosLocator.p1"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocatorShape.wp" "LegFoot__instance_1:distBetween_hip_joint_rootPosLocator_knee_joint_endPosLocator.p2"
		;
connectAttr "LegFoot__instance_1:module_grp.msg" "hyperLayout1.hyp[0].dn";
connectAttr "LegFoot__instance_1:joints_grp.msg" "hyperLayout1.hyp[1].dn";
connectAttr "LegFoot__instance_1:hierarchyRepresentations_grp.msg" "hyperLayout1.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1:orientationControls_grp.msg" "hyperLayout1.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:preferredAngleRepresentation_grp.msg" "hyperLayout1.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint.msg" "hyperLayout1.hyp[5].dn";
connectAttr "LegFoot__instance_1:knee_joint.msg" "hyperLayout1.hyp[6].dn";
connectAttr "LegFoot__instance_1:ankle_joint.msg" "hyperLayout1.hyp[7].dn";
connectAttr "LegFoot__instance_1:ball_joint.msg" "hyperLayout1.hyp[8].dn";
connectAttr "LegFoot__instance_1:toe_joint.msg" "hyperLayout1.hyp[9].dn";
connectAttr "LegFoot__instance_1:module_transform.msg" "hyperLayout1.hyp[10].dn"
		;
connectAttr "LegFoot__instance_1:module_transformShape.msg" "hyperLayout1.hyp[11].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_container.msg" "hyperLayout1.hyp[12].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_container.msg" "hyperLayout1.hyp[13].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_container.msg" "hyperLayout1.hyp[14].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_container.msg" "hyperLayout1.hyp[15].dn"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control_container.msg" "hyperLayout1.hyp[16].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_pointConstraint.msg" "hyperLayout1.hyp[17].dn"
		;
connectAttr "LegFoot__instance_1:hook_container.msg" "hyperLayout1.hyp[18].dn";
connectAttr "LegFoot__instance_1:hip_joint_ikHandle.msg" "hyperLayout1.hyp[20].dn"
		;
connectAttr "LegFoot__instance_1:hip_jointikEffector.msg" "hyperLayout1.hyp[21].dn"
		;
connectAttr "hip_joint_ikHandle_poleVectorConstraint1.msg" "hyperLayout1.hyp[22].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_rootPosLocator.msg" "hyperLayout1.hyp[23].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocator.msg" "hyperLayout1.hyp[24].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_rootPosLocator_pointConstraint.msg" "hyperLayout1.hyp[25].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_ikHandle_pointConstraint.msg" "hyperLayout1.hyp[26].dn"
		;
connectAttr "LegFoot__instance_1:distBetween_hip_joint_rootPosLocator_knee_joint_endPosLocator.msg" "hyperLayout1.hyp[27].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_ikHandle_scaleFactor.msg" "hyperLayout1.hyp[28].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_scaleMultiply.msg" "hyperLayout1.hyp[29].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_rootPosLocatorShape.msg" "hyperLayout1.hyp[30].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocatorShape.msg" "hyperLayout1.hyp[31].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.msg" "hyperLayout1.hyp[32].dn"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.msg" "hyperLayout1.hyp[33].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_endPosLocator_pointConstraint.msg" "hyperLayout1.hyp[34].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocator.msg" "hyperLayout1.hyp[35].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control_poleVectorLocatorShape.msg" "hyperLayout1.hyp[36].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_hierarchy_representation_container.msg" "hyperLayout1.hyp[37].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_ikHandle.msg" "hyperLayout1.hyp[38].dn"
		;
connectAttr "LegFoot__instance_1:knee_jointikEffector.msg" "hyperLayout1.hyp[39].dn"
		;
connectAttr "knee_joint_ikHandle_poleVectorConstraint1.msg" "hyperLayout1.hyp[40].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_rootPosLocator.msg" "hyperLayout1.hyp[41].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocator.msg" "hyperLayout1.hyp[42].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_rootPosLocator_pointConstraint.msg" "hyperLayout1.hyp[43].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_ikHandle_pointConstraint.msg" "hyperLayout1.hyp[44].dn"
		;
connectAttr "LegFoot__instance_1:distBetween_knee_joint_rootPosLocator_ankle_joint_endPosLocator.msg" "hyperLayout1.hyp[45].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_ikHandle_scaleFactor.msg" "hyperLayout1.hyp[46].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_scaleMultiply.msg" "hyperLayout1.hyp[47].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_rootPosLocatorShape.msg" "hyperLayout1.hyp[48].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocatorShape.msg" "hyperLayout1.hyp[49].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.msg" "hyperLayout1.hyp[50].dn"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.msg" "hyperLayout1.hyp[51].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_endPosLocator_pointConstraint.msg" "hyperLayout1.hyp[52].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocator.msg" "hyperLayout1.hyp[53].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control_poleVectorLocatorShape.msg" "hyperLayout1.hyp[54].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_hierarchy_representation_container.msg" "hyperLayout1.hyp[55].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_ikHandle.msg" "hyperLayout1.hyp[56].dn"
		;
connectAttr "LegFoot__instance_1:ankle_jointikEffector.msg" "hyperLayout1.hyp[57].dn"
		;
connectAttr "ankle_joint_ikHandle_poleVectorConstraint1.msg" "hyperLayout1.hyp[58].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_rootPosLocator.msg" "hyperLayout1.hyp[59].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocator.msg" "hyperLayout1.hyp[60].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_rootPosLocator_pointConstraint.msg" "hyperLayout1.hyp[61].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_ikHandle_pointConstraint.msg" "hyperLayout1.hyp[62].dn"
		;
connectAttr "LegFoot__instance_1:distBetween_ankle_joint_rootPosLocator_ball_joint_endPosLocator.msg" "hyperLayout1.hyp[63].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_ikHandle_scaleFactor.msg" "hyperLayout1.hyp[64].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_scaleMultiply.msg" "hyperLayout1.hyp[65].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_rootPosLocatorShape.msg" "hyperLayout1.hyp[66].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocatorShape.msg" "hyperLayout1.hyp[67].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.msg" "hyperLayout1.hyp[68].dn"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.msg" "hyperLayout1.hyp[69].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_endPosLocator_pointConstraint.msg" "hyperLayout1.hyp[70].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocator.msg" "hyperLayout1.hyp[71].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control_poleVectorLocatorShape.msg" "hyperLayout1.hyp[72].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_ikHandle.msg" "hyperLayout1.hyp[74].dn"
		;
connectAttr "LegFoot__instance_1:ball_jointikEffector.msg" "hyperLayout1.hyp[75].dn"
		;
connectAttr "ball_joint_ikHandle_poleVectorConstraint1.msg" "hyperLayout1.hyp[76].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_rootPosLocator.msg" "hyperLayout1.hyp[77].dn"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocator.msg" "hyperLayout1.hyp[78].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_rootPosLocator_pointConstraint.msg" "hyperLayout1.hyp[79].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_ikHandle_pointConstraint.msg" "hyperLayout1.hyp[80].dn"
		;
connectAttr "LegFoot__instance_1:distBetween_ball_joint_rootPosLocator_toe_joint_endPosLocator.msg" "hyperLayout1.hyp[81].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_ikHandle_scaleFactor.msg" "hyperLayout1.hyp[82].dn"
		;
connectAttr "LegFoot__instance_1:toe_joint_scaleMultiply.msg" "hyperLayout1.hyp[83].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_rootPosLocatorShape.msg" "hyperLayout1.hyp[84].dn"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocatorShape.msg" "hyperLayout1.hyp[85].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.msg" "hyperLayout1.hyp[86].dn"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint1.msg" "hyperLayout1.hyp[87].dn"
		;
connectAttr "LegFoot__instance_1:toe_joint_endPosLocator_pointConstraint.msg" "hyperLayout1.hyp[88].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocator.msg" "hyperLayout1.hyp[89].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control_poleVectorLocatorShape.msg" "hyperLayout1.hyp[90].dn"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint.msg" "hyperLayout1.hyp[92].dn";
connectAttr "LegFoot__instance_1:IK_knee_joint.msg" "hyperLayout1.hyp[93].dn";
connectAttr "LegFoot__instance_1:IK_ankle_joint.msg" "hyperLayout1.hyp[94].dn";
connectAttr "LegFoot__instance_1:IK_ball_joint.msg" "hyperLayout1.hyp[95].dn";
connectAttr "LegFoot__instance_1:IK_toe_joint.msg" "hyperLayout1.hyp[96].dn";
connectAttr "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator.msg" "hyperLayout1.hyp[97].dn"
		;
connectAttr "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_scaleFactor.msg" "hyperLayout1.hyp[98].dn"
		;
connectAttr "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_translationValue.msg" "hyperLayout1.hyp[99].dn"
		;
connectAttr "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator.msg" "hyperLayout1.hyp[100].dn"
		;
connectAttr "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_scaleFactor.msg" "hyperLayout1.hyp[101].dn"
		;
connectAttr "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_translationValue.msg" "hyperLayout1.hyp[102].dn"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_ikHandle.msg" "hyperLayout1.hyp[103].dn"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_ikEffector.msg" "hyperLayout1.hyp[104].dn"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_positionLocator.msg" "hyperLayout1.hyp[105].dn"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_positionLocator.msg" "hyperLayout1.hyp[106].dn"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocator.msg" "hyperLayout1.hyp[107].dn"
		;
connectAttr "IK_hip_joint_ikHandle_poleVectorConstraint1.msg" "hyperLayout1.hyp[108].dn"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_positionLocatorShape.msg" "hyperLayout1.hyp[109].dn"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_positionLocatorShape.msg" "hyperLayout1.hyp[110].dn"
		;
connectAttr "LegFoot__instance_1:IK_hip_joint_ikHandle_positionLocatorShape.msg" "hyperLayout1.hyp[111].dn"
		;
connectAttr "IK_hip_joint_positionLocator_pointConstraint1.msg" "hyperLayout1.hyp[112].dn"
		;
connectAttr "IK_knee_joint_positionLocator_pointConstraint1.msg" "hyperLayout1.hyp[113].dn"
		;
connectAttr "IK_hip_joint_ikHandle_positionLocator_pointConstraint1.msg" "hyperLayout1.hyp[114].dn"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_container.msg" "hyperLayout1.hyp[115].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_orientation_control_container.msg" "hyperLayout1.hyp[116].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_orientation_control_container.msg" "hyperLayout1.hyp[117].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_ikHandle_scaleFactor.ox" "LegFoot__instance_1:ankle_joint_scaleMultiply.i2x"
		;
connectAttr "LegFoot__instance_1:distBetween_hip_joint_rootPosLocator_knee_joint_endPosLocator.d" "LegFoot__instance_1:hip_joint_ikHandle_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1:hip_joint_ikHandle_scaleFactor.ox" "LegFoot__instance_1:knee_joint_scaleMultiply.i2x"
		;
connectAttr "LegFoot__instance_1:distBetween_knee_joint_rootPosLocator_ankle_joint_endPosLocator.d" "LegFoot__instance_1:knee_joint_ikHandle_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_scaleFactor.ox" "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_translationValue.i2x"
		;
connectAttr "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_scaleFactor.ox" "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_translationValue.i2x"
		;
connectAttr "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator.d" "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1:distBetween_ball_joint_rootPosLocator_toe_joint_endPosLocator.d" "LegFoot__instance_1:ball_joint_ikHandle_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1:ankle_joint_ikHandle_scaleFactor.ox" "LegFoot__instance_1:ball_joint_scaleMultiply.i2x"
		;
connectAttr "LegFoot__instance_1:distBetween_ankle_joint_rootPosLocator_ball_joint_endPosLocator.d" "LegFoot__instance_1:ankle_joint_ikHandle_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1:ball_joint_ikHandle_scaleFactor.ox" "LegFoot__instance_1:toe_joint_scaleMultiply.i2x"
		;
connectAttr "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator.d" "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_translation_control_SG.msg" "materialInfo3.sg"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_translation_control.msg" "materialInfo3.m"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_translation_control.oc" "LegFoot__instance_1:ankle_joint_m_translation_control_SG.ss"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_controlShape.iog" "LegFoot__instance_1:ankle_joint_m_translation_control_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1:hip_joint_m_translation_control_SG.msg" "materialInfo1.sg"
		;
connectAttr "LegFoot__instance_1:hip_joint_m_translation_control.msg" "materialInfo1.m"
		;
connectAttr "LegFoot__instance_1:hip_joint_m_translation_control.oc" "LegFoot__instance_1:hip_joint_m_translation_control_SG.ss"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_controlShape.iog" "LegFoot__instance_1:hip_joint_m_translation_control_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1:knee_joint_m_translation_control.oc" "LegFoot__instance_1:knee_joint_m_translation_control_SG.ss"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_controlShape.iog" "LegFoot__instance_1:knee_joint_m_translation_control_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1:knee_joint_translation_controlShape.msg" "hyperLayout3.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_translation_control.msg" "hyperLayout3.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_m_translation_control_SG.msg" "hyperLayout3.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_m_translation_control.msg" "hyperLayout3.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_m_translation_control_SG.msg" "materialInfo2.sg"
		;
connectAttr "LegFoot__instance_1:knee_joint_m_translation_control.msg" "materialInfo2.m"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_controlShape.msg" "hyperLayout4.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_translation_control.msg" "hyperLayout4.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_translation_control_SG.msg" "hyperLayout4.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_translation_control.msg" "hyperLayout4.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_controlShape.msg" "hyperLayout2.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_translation_control.msg" "hyperLayout2.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_m_translation_control_SG.msg" "hyperLayout2.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_m_translation_control.msg" "hyperLayout2.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_translation_control_SG.msg" "materialInfo4.sg"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_translation_control.msg" "materialInfo4.m"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_translation_control.oc" "LegFoot__instance_1:ball_joint_m_translation_control_SG.ss"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_controlShape.iog" "LegFoot__instance_1:ball_joint_m_translation_control_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1:toe_joint_translation_controlShape.msg" "hyperLayout6.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_control.msg" "hyperLayout6.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1:toe_joint_m_translation_control_SG.msg" "hyperLayout6.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1:toe_joint_m_translation_control.msg" "hyperLayout6.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:toe_joint_m_translation_control.oc" "LegFoot__instance_1:toe_joint_m_translation_control_SG.ss"
		;
connectAttr "LegFoot__instance_1:toe_joint_translation_controlShape.iog" "LegFoot__instance_1:toe_joint_m_translation_control_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1:toe_joint_m_translation_control_SG.msg" "materialInfo5.sg"
		;
connectAttr "LegFoot__instance_1:toe_joint_m_translation_control.msg" "materialInfo5.m"
		;
connectAttr "LegFoot__instance_1:hip_joint_m_hierarchyRepresentation.msg" "hyperLayout9.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_m_hookRepresentation_SG.msg" "hyperLayout9.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_hierarchy_representation.msg" "hyperLayout9.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_hierarchy_representationShape.msg" "hyperLayout9.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_hierarchy_arrow_representation.msg" "hyperLayout9.hyp[6].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_hierarchy_arrow_representationShape.msg" "hyperLayout9.hyp[7].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_hierarchy_representation_parentConstraint_grp.msg" "hyperLayout9.hyp[8].dn"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.msg" "hyperLayout9.hyp[9].dn"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.msg" "hyperLayout9.hyp[10].dn"
		;
connectAttr "LegFoot__instance_1:hip_joint_m_hierarchyRepresentation.oc" "LegFoot__instance_1:hip_joint_m_hookRepresentation_SG.ss"
		;
connectAttr "LegFoot__instance_1:hip_joint_hierarchy_representationShape.iog" "LegFoot__instance_1:hip_joint_m_hookRepresentation_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1:hip_joint_hierarchy_arrow_representationShape.iog" "LegFoot__instance_1:hip_joint_m_hookRepresentation_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1:hip_joint_m_hookRepresentation_SG.msg" "materialInfo7.sg"
		;
connectAttr "LegFoot__instance_1:hip_joint_m_hierarchyRepresentation.msg" "materialInfo7.m"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation.axis" "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_rotateX.i"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_m_preferredAngle_representation.msg" "hyperLayout13.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation.msg" "hyperLayout13.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_representationShape.msg" "hyperLayout13.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_SG.msg" "hyperLayout13.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_rotateX.msg" "hyperLayout13.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_parentConstraintGrp.msg" "hyperLayout13.hyp[5].dn"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint1.msg" "hyperLayout13.hyp[6].dn"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint1.msg" "hyperLayout13.hyp[7].dn"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_m_preferredAngle_representation.oc" "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_SG.ss"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_representationShape.iog" "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_SG.msg" "materialInfo11.sg"
		;
connectAttr "LegFoot__instance_1:IK_knee_joint_m_preferredAngle_representation.msg" "materialInfo11.m"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_controlShape.msg" "hyperLayout5.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_translation_control.msg" "hyperLayout5.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_translation_control_SG.msg" "hyperLayout5.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_translation_control.msg" "hyperLayout5.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_m_hierarchyRepresentation.msg" "hyperLayout10.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_m_hookRepresentation_SG.msg" "hyperLayout10.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_hierarchy_representation.msg" "hyperLayout10.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_hierarchy_representationShape.msg" "hyperLayout10.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_hierarchy_arrow_representation.msg" "hyperLayout10.hyp[6].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_hierarchy_arrow_representationShape.msg" "hyperLayout10.hyp[7].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_hierarchy_representation_parentConstraint_grp.msg" "hyperLayout10.hyp[8].dn"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint1.msg" "hyperLayout10.hyp[9].dn"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint1.msg" "hyperLayout10.hyp[10].dn"
		;
connectAttr "LegFoot__instance_1:knee_joint_m_hierarchyRepresentation.oc" "LegFoot__instance_1:knee_joint_m_hookRepresentation_SG.ss"
		;
connectAttr "LegFoot__instance_1:knee_joint_hierarchy_representationShape.iog" "LegFoot__instance_1:knee_joint_m_hookRepresentation_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1:knee_joint_hierarchy_arrow_representationShape.iog" "LegFoot__instance_1:knee_joint_m_hookRepresentation_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1:knee_joint_m_hookRepresentation_SG.msg" "materialInfo8.sg"
		;
connectAttr "LegFoot__instance_1:knee_joint_m_hierarchyRepresentation.msg" "materialInfo8.m"
		;
connectAttr "hyperLayout8.msg" "LegFoot__instance_1:hook_root_joint_hook_representation_container.hl"
		;
connectAttr "LegFoot__instance_1:hook_grp.msg" "hyperLayout7.hyp[0].dn";
connectAttr "LegFoot__instance_1:hook_root_joint.msg" "hyperLayout7.hyp[1].dn";
connectAttr "LegFoot__instance_1:hook_target_joint.msg" "hyperLayout7.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1:unhookedTarget.msg" "hyperLayout7.hyp[3].dn";
connectAttr "LegFoot__instance_1:unhookedTargetShape.msg" "hyperLayout7.hyp[4].dn"
		;
connectAttr "unhookedTarget_pointConstraint1.msg" "hyperLayout7.hyp[5].dn";
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle.msg" "hyperLayout7.hyp[6].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_jointikEffector.msg" "hyperLayout7.hyp[7].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_poleVectorLocator.msg" "hyperLayout7.hyp[8].dn"
		;
connectAttr "hook_root_joint_ikHandle_poleVectorConstraint1.msg" "hyperLayout7.hyp[9].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_rootPosLocator.msg" "hyperLayout7.hyp[10].dn"
		;
connectAttr "LegFoot__instance_1:hook_target_joint_endPosLocator.msg" "hyperLayout7.hyp[11].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_rootPosLocator_pointConstraint.msg" "hyperLayout7.hyp[12].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_pointConstraint.msg" "hyperLayout7.hyp[13].dn"
		;
connectAttr "LegFoot__instance_1:distBetween_hook_root_joint_rootPosLocator_hook_target_joint_endPosLocator.msg" "hyperLayout7.hyp[14].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_scaleFactor.msg" "hyperLayout7.hyp[15].dn"
		;
connectAttr "LegFoot__instance_1:hook_target_joint_scaleMultiply.msg" "hyperLayout7.hyp[16].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_poleVectorLocatorShape.msg" "hyperLayout7.hyp[17].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_rootPosLocatorShape.msg" "hyperLayout7.hyp[18].dn"
		;
connectAttr "LegFoot__instance_1:hook_target_joint_endPosLocatorShape.msg" "hyperLayout7.hyp[19].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_pointConstraint.msg" "hyperLayout7.hyp[20].dn"
		;
connectAttr "LegFoot__instance_1:hook_pointConstraint.msg" "hyperLayout7.hyp[21].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_hook_representation_container.msg" "hyperLayout7.hyp[22].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_rootPosLocatorShape.wp" "LegFoot__instance_1:distBetween_hook_root_joint_rootPosLocator_hook_target_joint_endPosLocator.p1"
		;
connectAttr "LegFoot__instance_1:hook_target_joint_endPosLocatorShape.wp" "LegFoot__instance_1:distBetween_hook_root_joint_rootPosLocator_hook_target_joint_endPosLocator.p2"
		;
connectAttr "LegFoot__instance_1:distBetween_hook_root_joint_rootPosLocator_hook_target_joint_endPosLocator.d" "LegFoot__instance_1:hook_root_joint_ikHandle_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_scaleFactor.ox" "LegFoot__instance_1:hook_target_joint_scaleMultiply.i2x"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_m_hookRepresentation.msg" "hyperLayout8.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_m_hookRepresentation_SG.msg" "hyperLayout8.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_hook_representation.msg" "hyperLayout8.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_hook_representationShape.msg" "hyperLayout8.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_hook_representation_parentConstraint_grp.msg" "hyperLayout8.hyp[6].dn"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint1.msg" "hyperLayout8.hyp[7].dn"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint1.msg" "hyperLayout8.hyp[8].dn"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_m_hookRepresentation.oc" "LegFoot__instance_1:hook_root_joint_m_hookRepresentation_SG.ss"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_hook_representationShape.iog" "LegFoot__instance_1:hook_root_joint_m_hookRepresentation_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1:hook_root_joint_m_hookRepresentation_SG.msg" "materialInfo6.sg"
		;
connectAttr "LegFoot__instance_1:hook_root_joint_m_hookRepresentation.msg" "materialInfo6.m"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_yAxisBlock.msg" "hyperLayout14.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_zAxisBlock.msg" "hyperLayout14.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_yAxisBlockSG.msg" "hyperLayout14.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_zAxisBlockSG.msg" "hyperLayout14.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_orientation_control.msg" "hyperLayout14.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_orientation_controlShape.msg" "hyperLayout14.hyp[6].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_orientation_control_parentConstraint_grp.msg" "hyperLayout14.hyp[7].dn"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint1.msg" "hyperLayout14.hyp[8].dn"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint1.msg" "hyperLayout14.hyp[9].dn"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_zAxisBlock.oc" "LegFoot__instance_1:ankle_joint_m_zAxisBlockSG.ss"
		;
connectAttr "LegFoot__instance_1:ankle_joint_orientation_controlShape.iog.og[1]" "LegFoot__instance_1:ankle_joint_m_zAxisBlockSG.dsm"
		 -na;
connectAttr "groupId20.msg" "LegFoot__instance_1:ankle_joint_m_zAxisBlockSG.gn" 
		-na;
connectAttr "LegFoot__instance_1:ankle_joint_m_yAxisBlock.oc" "LegFoot__instance_1:ankle_joint_m_yAxisBlockSG.ss"
		;
connectAttr "LegFoot__instance_1:ankle_joint_orientation_controlShape.iog.og[0]" "LegFoot__instance_1:ankle_joint_m_yAxisBlockSG.dsm"
		 -na;
connectAttr "groupId19.msg" "LegFoot__instance_1:ankle_joint_m_yAxisBlockSG.gn" 
		-na;
connectAttr "LegFoot__instance_1:ankle_joint_m_zAxisBlockSG.msg" "materialInfo12.sg"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_zAxisBlock.msg" "materialInfo12.m"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_yAxisBlockSG.msg" "materialInfo13.sg"
		;
connectAttr "LegFoot__instance_1:ankle_joint_m_yAxisBlock.msg" "materialInfo13.m"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_yAxisBlock.msg" "hyperLayout15.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_zAxisBlock.msg" "hyperLayout15.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_yAxisBlockSG.msg" "hyperLayout15.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_zAxisBlockSG.msg" "hyperLayout15.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_orientation_control.msg" "hyperLayout15.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_orientation_controlShape.msg" "hyperLayout15.hyp[6].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_orientation_control_parentConstraint_grp.msg" "hyperLayout15.hyp[7].dn"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint1.msg" "hyperLayout15.hyp[8].dn"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint1.msg" "hyperLayout15.hyp[9].dn"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_yAxisBlock.oc" "LegFoot__instance_1:ball_joint_m_yAxisBlockSG.ss"
		;
connectAttr "LegFoot__instance_1:ball_joint_orientation_controlShape.iog.og[0]" "LegFoot__instance_1:ball_joint_m_yAxisBlockSG.dsm"
		 -na;
connectAttr "groupId22.msg" "LegFoot__instance_1:ball_joint_m_yAxisBlockSG.gn" -na
		;
connectAttr "LegFoot__instance_1:ball_joint_m_zAxisBlock.oc" "LegFoot__instance_1:ball_joint_m_zAxisBlockSG.ss"
		;
connectAttr "LegFoot__instance_1:ball_joint_orientation_controlShape.iog.og[1]" "LegFoot__instance_1:ball_joint_m_zAxisBlockSG.dsm"
		 -na;
connectAttr "groupId23.msg" "LegFoot__instance_1:ball_joint_m_zAxisBlockSG.gn" -na
		;
connectAttr "LegFoot__instance_1:ball_joint_m_yAxisBlockSG.msg" "materialInfo15.sg"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_yAxisBlock.msg" "materialInfo15.m"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_zAxisBlockSG.msg" "materialInfo14.sg"
		;
connectAttr "LegFoot__instance_1:ball_joint_m_zAxisBlock.msg" "materialInfo14.m"
		;
connectAttr "hyperLayout24.msg" "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_container.hl"
		;
connectAttr "hyperLayout25.msg" "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_container.hl"
		;
connectAttr "hyperLayout28.msg" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_container.hl"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation.axis" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_container.boc[0]"
		;
connectAttr "hyperLayout29.msg" "LegFoot__instance_1_mirror:ankle_joint_orientation_control_container.hl"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_orientation_control.rx" "LegFoot__instance_1_mirror:ankle_joint_orientation_control_container.boc[0]"
		;
connectAttr "hyperLayout30.msg" "LegFoot__instance_1_mirror:ball_joint_orientation_control_container.hl"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_orientation_control.rx" "LegFoot__instance_1_mirror:ball_joint_orientation_control_container.boc[0]"
		;
connectAttr "hyperLayout17.msg" "LegFoot__instance_1_mirror:hip_joint_translation_control_container.hl"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.t" "LegFoot__instance_1_mirror:hip_joint_translation_control_container.boc[0]"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.tx" "LegFoot__instance_1_mirror:hip_joint_translation_control_container.boc[1]"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.ty" "LegFoot__instance_1_mirror:hip_joint_translation_control_container.boc[2]"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.tz" "LegFoot__instance_1_mirror:hip_joint_translation_control_container.boc[3]"
		;
connectAttr "hyperLayout20.msg" "LegFoot__instance_1_mirror:ball_joint_translation_control_container.hl"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.t" "LegFoot__instance_1_mirror:ball_joint_translation_control_container.boc[0]"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.tx" "LegFoot__instance_1_mirror:ball_joint_translation_control_container.boc[1]"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.ty" "LegFoot__instance_1_mirror:ball_joint_translation_control_container.boc[2]"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.tz" "LegFoot__instance_1_mirror:ball_joint_translation_control_container.boc[3]"
		;
connectAttr "hyperLayout21.msg" "LegFoot__instance_1_mirror:toe_joint_translation_control_container.hl"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control.t" "LegFoot__instance_1_mirror:toe_joint_translation_control_container.boc[0]"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control.tx" "LegFoot__instance_1_mirror:toe_joint_translation_control_container.boc[1]"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control.ty" "LegFoot__instance_1_mirror:toe_joint_translation_control_container.boc[2]"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control.tz" "LegFoot__instance_1_mirror:toe_joint_translation_control_container.boc[3]"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.r" "LegFoot__instance_1_mirror:hook_container.boc[0]"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.rx" "LegFoot__instance_1_mirror:hook_container.boc[1]"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.ry" "LegFoot__instance_1_mirror:hook_container.boc[2]"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.rz" "LegFoot__instance_1_mirror:hook_container.boc[3]"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint.r" "LegFoot__instance_1_mirror:hook_container.boc[4]"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint.rx" "LegFoot__instance_1_mirror:hook_container.boc[5]"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint.ry" "LegFoot__instance_1_mirror:hook_container.boc[6]"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint.rz" "LegFoot__instance_1_mirror:hook_container.boc[7]"
		;
connectAttr "hyperLayout22.msg" "LegFoot__instance_1_mirror:hook_container.hl";
connectAttr "hyperLayout18.msg" "LegFoot__instance_1_mirror:knee_joint_translation_control_container.hl"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.t" "LegFoot__instance_1_mirror:knee_joint_translation_control_container.boc[0]"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.tx" "LegFoot__instance_1_mirror:knee_joint_translation_control_container.boc[1]"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.ty" "LegFoot__instance_1_mirror:knee_joint_translation_control_container.boc[2]"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.tz" "LegFoot__instance_1_mirror:knee_joint_translation_control_container.boc[3]"
		;
connectAttr "hyperLayout19.msg" "LegFoot__instance_1_mirror:ankle_joint_translation_control_container.hl"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.t" "LegFoot__instance_1_mirror:ankle_joint_translation_control_container.boc[0]"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.tx" "LegFoot__instance_1_mirror:ankle_joint_translation_control_container.boc[1]"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.ty" "LegFoot__instance_1_mirror:ankle_joint_translation_control_container.boc[2]"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.tz" "LegFoot__instance_1_mirror:ankle_joint_translation_control_container.boc[3]"
		;
connectAttr "LegFoot__instance_1_mirror:module_grp.msg" "hyperLayout16.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1_mirror:joints_grp.msg" "hyperLayout16.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hierarchyRepresentations_grp.msg" "hyperLayout16.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1_mirror:orientationControls_grp.msg" "hyperLayout16.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:preferredAngleRepresentation_grp.msg" "hyperLayout16.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1_mirror:module_transform.msg" "hyperLayout16.hyp[10].dn"
		;
connectAttr "LegFoot__instance_1_mirror:module_transformShape.msg" "hyperLayout16.hyp[11].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_container.msg" "hyperLayout16.hyp[12].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_container.msg" "hyperLayout16.hyp[13].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_container.msg" "hyperLayout16.hyp[14].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_container.msg" "hyperLayout16.hyp[15].dn"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control_container.msg" "hyperLayout16.hyp[16].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_pointConstraint.msg" "hyperLayout16.hyp[17].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_container.msg" "hyperLayout16.hyp[18].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_ikHandle.msg" "hyperLayout16.hyp[20].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_jointikEffector.msg" "hyperLayout16.hyp[21].dn"
		;
connectAttr "hip_joint_ikHandle_poleVectorConstraint2.msg" "hyperLayout16.hyp[22].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_rootPosLocator.msg" "hyperLayout16.hyp[23].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocator.msg" "hyperLayout16.hyp[24].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_rootPosLocator_pointConstraint.msg" "hyperLayout16.hyp[25].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_ikHandle_pointConstraint.msg" "hyperLayout16.hyp[26].dn"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_hip_joint_rootPosLocator_knee_joint_endPosLocator.msg" "hyperLayout16.hyp[27].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_ikHandle_scaleFactor.msg" "hyperLayout16.hyp[28].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_scaleMultiply.msg" "hyperLayout16.hyp[29].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_rootPosLocatorShape.msg" "hyperLayout16.hyp[30].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocatorShape.msg" "hyperLayout16.hyp[31].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator_parentConstraintGrp.msg" "hyperLayout16.hyp[32].dn"
		;
connectAttr "hip_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.msg" "hyperLayout16.hyp[33].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocator_pointConstraint.msg" "hyperLayout16.hyp[34].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocator.msg" "hyperLayout16.hyp[35].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control_poleVectorLocatorShape.msg" "hyperLayout16.hyp[36].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_container.msg" "hyperLayout16.hyp[37].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_ikHandle.msg" "hyperLayout16.hyp[38].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_jointikEffector.msg" "hyperLayout16.hyp[39].dn"
		;
connectAttr "knee_joint_ikHandle_poleVectorConstraint2.msg" "hyperLayout16.hyp[40].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_rootPosLocator.msg" "hyperLayout16.hyp[41].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocator.msg" "hyperLayout16.hyp[42].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_rootPosLocator_pointConstraint.msg" "hyperLayout16.hyp[43].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_ikHandle_pointConstraint.msg" "hyperLayout16.hyp[44].dn"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_knee_joint_rootPosLocator_ankle_joint_endPosLocator.msg" "hyperLayout16.hyp[45].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_ikHandle_scaleFactor.msg" "hyperLayout16.hyp[46].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_scaleMultiply.msg" "hyperLayout16.hyp[47].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_rootPosLocatorShape.msg" "hyperLayout16.hyp[48].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocatorShape.msg" "hyperLayout16.hyp[49].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator_parentConstraintGrp.msg" "hyperLayout16.hyp[50].dn"
		;
connectAttr "knee_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.msg" "hyperLayout16.hyp[51].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocator_pointConstraint.msg" "hyperLayout16.hyp[52].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocator.msg" "hyperLayout16.hyp[53].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control_poleVectorLocatorShape.msg" "hyperLayout16.hyp[54].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_container.msg" "hyperLayout16.hyp[55].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_ikHandle.msg" "hyperLayout16.hyp[56].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_jointikEffector.msg" "hyperLayout16.hyp[57].dn"
		;
connectAttr "ankle_joint_ikHandle_poleVectorConstraint2.msg" "hyperLayout16.hyp[58].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator.msg" "hyperLayout16.hyp[59].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocator.msg" "hyperLayout16.hyp[60].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_rootPosLocator_pointConstraint.msg" "hyperLayout16.hyp[61].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_ikHandle_pointConstraint.msg" "hyperLayout16.hyp[62].dn"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_ankle_joint_rootPosLocator_ball_joint_endPosLocator.msg" "hyperLayout16.hyp[63].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_ikHandle_scaleFactor.msg" "hyperLayout16.hyp[64].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_scaleMultiply.msg" "hyperLayout16.hyp[65].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_rootPosLocatorShape.msg" "hyperLayout16.hyp[66].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocatorShape.msg" "hyperLayout16.hyp[67].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp.msg" "hyperLayout16.hyp[68].dn"
		;
connectAttr "ankle_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.msg" "hyperLayout16.hyp[69].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocator_pointConstraint.msg" "hyperLayout16.hyp[70].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocator.msg" "hyperLayout16.hyp[71].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control_poleVectorLocatorShape.msg" "hyperLayout16.hyp[72].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_ikHandle.msg" "hyperLayout16.hyp[74].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_jointikEffector.msg" "hyperLayout16.hyp[75].dn"
		;
connectAttr "ball_joint_ikHandle_poleVectorConstraint2.msg" "hyperLayout16.hyp[76].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_rootPosLocator.msg" "hyperLayout16.hyp[77].dn"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocator.msg" "hyperLayout16.hyp[78].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_rootPosLocator_pointConstraint.msg" "hyperLayout16.hyp[79].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_ikHandle_pointConstraint.msg" "hyperLayout16.hyp[80].dn"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_ball_joint_rootPosLocator_toe_joint_endPosLocator.msg" "hyperLayout16.hyp[81].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_ikHandle_scaleFactor.msg" "hyperLayout16.hyp[82].dn"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_scaleMultiply.msg" "hyperLayout16.hyp[83].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_rootPosLocatorShape.msg" "hyperLayout16.hyp[84].dn"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocatorShape.msg" "hyperLayout16.hyp[85].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator_parentConstraintGrp.msg" "hyperLayout16.hyp[86].dn"
		;
connectAttr "ball_joint_translation_control_poleVectorLocator_parentConstraintGrp_parentConstraint2.msg" "hyperLayout16.hyp[87].dn"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocator_pointConstraint.msg" "hyperLayout16.hyp[88].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocator.msg" "hyperLayout16.hyp[89].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control_poleVectorLocatorShape.msg" "hyperLayout16.hyp[90].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint.msg" "hyperLayout16.hyp[92].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint.msg" "hyperLayout16.hyp[93].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_ankle_joint.msg" "hyperLayout16.hyp[94].dn"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator.msg" "hyperLayout16.hyp[95].dn"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_scaleFactor.msg" "hyperLayout16.hyp[96].dn"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_translationValue.msg" "hyperLayout16.hyp[97].dn"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator.msg" "hyperLayout16.hyp[98].dn"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_scaleFactor.msg" "hyperLayout16.hyp[99].dn"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_translationValue.msg" "hyperLayout16.hyp[100].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle.msg" "hyperLayout16.hyp[101].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_ikEffector.msg" "hyperLayout16.hyp[102].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_positionLocator.msg" "hyperLayout16.hyp[103].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_positionLocator.msg" "hyperLayout16.hyp[104].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocator.msg" "hyperLayout16.hyp[105].dn"
		;
connectAttr "IK_hip_joint_ikHandle_poleVectorConstraint2.msg" "hyperLayout16.hyp[106].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_positionLocatorShape.msg" "hyperLayout16.hyp[107].dn"
		;
connectAttr "IK_ball_joint1.msg" "hyperLayout16.hyp[108].dn";
connectAttr "IK_toe_joint1.msg" "hyperLayout16.hyp[109].dn";
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_positionLocatorShape.msg" "hyperLayout16.hyp[110].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocatorShape.msg" "hyperLayout16.hyp[111].dn"
		;
connectAttr "IK_hip_joint_positionLocator_pointConstraint2.msg" "hyperLayout16.hyp[112].dn"
		;
connectAttr "IK_knee_joint_positionLocator_pointConstraint2.msg" "hyperLayout16.hyp[113].dn"
		;
connectAttr "IK_hip_joint_ikHandle_positionLocator_pointConstraint2.msg" "hyperLayout16.hyp[114].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_container.msg" "hyperLayout16.hyp[115].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_orientation_control_container.msg" "hyperLayout16.hyp[116].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_orientation_control_container.msg" "hyperLayout16.hyp[117].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_ikHandle_scaleFactor.ox" "LegFoot__instance_1_mirror:ankle_joint_scaleMultiply.i2x"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_ikHandle_scaleFactor.ox" "LegFoot__instance_1_mirror:ball_joint_scaleMultiply.i2x"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_hip_joint_rootPosLocator_knee_joint_endPosLocator.d" "LegFoot__instance_1_mirror:hip_joint_ikHandle_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator.d" "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_scaleFactor.ox" "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_translationValue.i2x"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_ikHandle_scaleFactor.ox" "LegFoot__instance_1_mirror:knee_joint_scaleMultiply.i2x"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_scaleFactor.ox" "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_translationValue.i2x"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator.d" "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_knee_joint_rootPosLocator_ankle_joint_endPosLocator.d" "LegFoot__instance_1_mirror:knee_joint_ikHandle_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_ball_joint_rootPosLocator_toe_joint_endPosLocator.d" "LegFoot__instance_1_mirror:ball_joint_ikHandle_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_ankle_joint_rootPosLocator_ball_joint_endPosLocator.d" "LegFoot__instance_1_mirror:ankle_joint_ikHandle_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_ikHandle_scaleFactor.ox" "LegFoot__instance_1_mirror:toe_joint_scaleMultiply.i2x"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_positionLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator.p1"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_positionLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator.p2"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_rootPosLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_ankle_joint_rootPosLocator_ball_joint_endPosLocator.p1"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_endPosLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_ankle_joint_rootPosLocator_ball_joint_endPosLocator.p2"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_rootPosLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_ball_joint_rootPosLocator_toe_joint_endPosLocator.p1"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_endPosLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_ball_joint_rootPosLocator_toe_joint_endPosLocator.p2"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_rootPosLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_knee_joint_rootPosLocator_ankle_joint_endPosLocator.p1"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_endPosLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_knee_joint_rootPosLocator_ankle_joint_endPosLocator.p2"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_positionLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator.p1"
		;
connectAttr "LegFoot__instance_1_mirror:IK_hip_joint_ikHandle_positionLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator.p2"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_rootPosLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_hip_joint_rootPosLocator_knee_joint_endPosLocator.p1"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_endPosLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_hip_joint_rootPosLocator_knee_joint_endPosLocator.p2"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_hierarchyRepresentation.msg" "hyperLayout24.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_hookRepresentation_SG.msg" "hyperLayout24.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation.msg" "hyperLayout24.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_hierarchy_representationShape.msg" "hyperLayout24.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_hierarchy_arrow_representation.msg" "hyperLayout24.hyp[6].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_hierarchy_arrow_representationShape.msg" "hyperLayout24.hyp[7].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_hierarchy_representation_parentConstraint_grp.msg" "hyperLayout24.hyp[8].dn"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.msg" "hyperLayout24.hyp[9].dn"
		;
connectAttr "hip_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.msg" "hyperLayout24.hyp[10].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_hierarchyRepresentation.oc" "LegFoot__instance_1_mirror:hip_joint_m_hookRepresentation_SG.ss"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_hierarchy_representationShape.iog" "LegFoot__instance_1_mirror:hip_joint_m_hookRepresentation_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1_mirror:hip_joint_hierarchy_arrow_representationShape.iog" "LegFoot__instance_1_mirror:hip_joint_m_hookRepresentation_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_hookRepresentation_SG.msg" "materialInfo22.sg"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_hierarchyRepresentation.msg" "materialInfo22.m"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_hierarchyRepresentation.msg" "hyperLayout25.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_hookRepresentation_SG.msg" "hyperLayout25.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation.msg" "hyperLayout25.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_hierarchy_representationShape.msg" "hyperLayout25.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_hierarchy_arrow_representation.msg" "hyperLayout25.hyp[6].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_hierarchy_arrow_representationShape.msg" "hyperLayout25.hyp[7].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_hierarchy_representation_parentConstraint_grp.msg" "hyperLayout25.hyp[8].dn"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_parentConstraint2.msg" "hyperLayout25.hyp[9].dn"
		;
connectAttr "knee_joint_hierarchy_representation_parentConstraint_grp_scaleConstraint2.msg" "hyperLayout25.hyp[10].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_hierarchyRepresentation.oc" "LegFoot__instance_1_mirror:knee_joint_m_hookRepresentation_SG.ss"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_hierarchy_representationShape.iog" "LegFoot__instance_1_mirror:knee_joint_m_hookRepresentation_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1_mirror:knee_joint_hierarchy_arrow_representationShape.iog" "LegFoot__instance_1_mirror:knee_joint_m_hookRepresentation_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_hookRepresentation_SG.msg" "materialInfo23.sg"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_hierarchyRepresentation.msg" "materialInfo23.m"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation.axis" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_rotateX.i"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_m_preferredAngle_representation.oc" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_SG.ss"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representationShape.iog" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_m_preferredAngle_representation.msg" "hyperLayout28.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation.msg" "hyperLayout28.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representationShape.msg" "hyperLayout28.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_SG.msg" "hyperLayout28.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_rotateX.msg" "hyperLayout28.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_parentConstraintGrp.msg" "hyperLayout28.hyp[5].dn"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_parentConstraint2.msg" "hyperLayout28.hyp[6].dn"
		;
connectAttr "IK_knee_joint_preferredAngle_parentConstraintGrp_scaleConstraint2.msg" "hyperLayout28.hyp[7].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_translation_control_SG.msg" "materialInfo17.sg"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_translation_control.msg" "materialInfo17.m"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_translation_control.oc" "LegFoot__instance_1_mirror:knee_joint_m_translation_control_SG.ss"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_controlShape.iog" "LegFoot__instance_1_mirror:knee_joint_m_translation_control_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_SG.msg" "materialInfo26.sg"
		;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_m_preferredAngle_representation.msg" "materialInfo26.m"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlock.oc" "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlockSG.ss"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_orientation_controlShape.iog.og[0]" "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlockSG.dsm"
		 -na;
connectAttr "groupId25.msg" "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlockSG.gn"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlock.oc" "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlockSG.ss"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_orientation_controlShape.iog.og[1]" "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlockSG.dsm"
		 -na;
connectAttr "groupId26.msg" "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlockSG.gn"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlock.msg" "hyperLayout29.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlock.msg" "hyperLayout29.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlockSG.msg" "hyperLayout29.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlockSG.msg" "hyperLayout29.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_orientation_control.msg" "hyperLayout29.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_orientation_controlShape.msg" "hyperLayout29.hyp[6].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_orientation_control_parentConstraint_grp.msg" "hyperLayout29.hyp[7].dn"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_parentConstraint2.msg" "hyperLayout29.hyp[8].dn"
		;
connectAttr "ankle_joint_orientation_control_parentConstraint_grp_scaleConstraint2.msg" "hyperLayout29.hyp[9].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlockSG.msg" "materialInfo28.sg"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlock.msg" "materialInfo28.m"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlockSG.msg" "materialInfo27.sg"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlock.msg" "materialInfo27.m"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlock.oc" "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlockSG.ss"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_orientation_controlShape.iog.og[1]" "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlockSG.dsm"
		 -na;
connectAttr "groupId29.msg" "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlockSG.gn"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlock.msg" "hyperLayout30.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlock.msg" "hyperLayout30.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlockSG.msg" "hyperLayout30.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlockSG.msg" "hyperLayout30.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_orientation_control.msg" "hyperLayout30.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_orientation_controlShape.msg" "hyperLayout30.hyp[6].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_orientation_control_parentConstraint_grp.msg" "hyperLayout30.hyp[7].dn"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_parentConstraint2.msg" "hyperLayout30.hyp[8].dn"
		;
connectAttr "ball_joint_orientation_control_parentConstraint_grp_scaleConstraint2.msg" "hyperLayout30.hyp[9].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlock.oc" "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlockSG.ss"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_orientation_controlShape.iog.og[0]" "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlockSG.dsm"
		 -na;
connectAttr "groupId28.msg" "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlockSG.gn"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlockSG.msg" "materialInfo29.sg"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlock.msg" "materialInfo29.m"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlockSG.msg" "materialInfo30.sg"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlock.msg" "materialInfo30.m"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_controlShape.msg" "hyperLayout17.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_control.msg" "hyperLayout17.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_translation_control_SG.msg" "hyperLayout17.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_translation_control.msg" "hyperLayout17.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_translation_control.oc" "LegFoot__instance_1_mirror:hip_joint_m_translation_control_SG.ss"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_translation_controlShape.iog" "LegFoot__instance_1_mirror:hip_joint_m_translation_control_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_translation_control_SG.msg" "materialInfo16.sg"
		;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_translation_control.msg" "materialInfo16.m"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_translation_control.oc" "LegFoot__instance_1_mirror:ball_joint_m_translation_control_SG.ss"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_controlShape.iog" "LegFoot__instance_1_mirror:ball_joint_m_translation_control_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_controlShape.msg" "hyperLayout20.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_translation_control.msg" "hyperLayout20.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_translation_control_SG.msg" "hyperLayout20.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_translation_control.msg" "hyperLayout20.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_translation_control_SG.msg" "materialInfo19.sg"
		;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_translation_control.msg" "materialInfo19.m"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_m_translation_control.oc" "LegFoot__instance_1_mirror:toe_joint_m_translation_control_SG.ss"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_controlShape.iog" "LegFoot__instance_1_mirror:toe_joint_m_translation_control_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_controlShape.msg" "hyperLayout21.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_translation_control.msg" "hyperLayout21.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_m_translation_control_SG.msg" "hyperLayout21.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_m_translation_control.msg" "hyperLayout21.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_m_translation_control_SG.msg" "materialInfo20.sg"
		;
connectAttr "LegFoot__instance_1_mirror:toe_joint_m_translation_control.msg" "materialInfo20.m"
		;
connectAttr "hyperLayout23.msg" "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_container.hl"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_scaleFactor.ox" "LegFoot__instance_1_mirror:hook_target_joint_scaleMultiply.i2x"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_hook_root_joint_rootPosLocator_hook_target_joint_endPosLocator.d" "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_scaleFactor.i1x"
		;
connectAttr "LegFoot__instance_1_mirror:hook_grp.msg" "hyperLayout22.hyp[0].dn";
connectAttr "LegFoot__instance_1_mirror:hook_root_joint.msg" "hyperLayout22.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint.msg" "hyperLayout22.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1_mirror:unhookedTarget.msg" "hyperLayout22.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:unhookedTargetShape.msg" "hyperLayout22.hyp[4].dn"
		;
connectAttr "unhookedTarget_pointConstraint2.msg" "hyperLayout22.hyp[5].dn";
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle.msg" "hyperLayout22.hyp[6].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_jointikEffector.msg" "hyperLayout22.hyp[7].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_poleVectorLocator.msg" "hyperLayout22.hyp[8].dn"
		;
connectAttr "hook_root_joint_ikHandle_poleVectorConstraint2.msg" "hyperLayout22.hyp[9].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator.msg" "hyperLayout22.hyp[10].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint_endPosLocator.msg" "hyperLayout22.hyp[11].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocator_pointConstraint.msg" "hyperLayout22.hyp[12].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_pointConstraint.msg" "hyperLayout22.hyp[13].dn"
		;
connectAttr "LegFoot__instance_1_mirror:distBetween_hook_root_joint_rootPosLocator_hook_target_joint_endPosLocator.msg" "hyperLayout22.hyp[14].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_scaleFactor.msg" "hyperLayout22.hyp[15].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint_scaleMultiply.msg" "hyperLayout22.hyp[16].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_poleVectorLocatorShape.msg" "hyperLayout22.hyp[17].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocatorShape.msg" "hyperLayout22.hyp[18].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint_endPosLocatorShape.msg" "hyperLayout22.hyp[19].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_pointConstraint.msg" "hyperLayout22.hyp[20].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_pointConstraint.msg" "hyperLayout22.hyp[21].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_container.msg" "hyperLayout22.hyp[22].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_rootPosLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_hook_root_joint_rootPosLocator_hook_target_joint_endPosLocator.p1"
		;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint_endPosLocatorShape.wp" "LegFoot__instance_1_mirror:distBetween_hook_root_joint_rootPosLocator_hook_target_joint_endPosLocator.p2"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_m_hookRepresentation.oc" "LegFoot__instance_1_mirror:hook_root_joint_m_hookRepresentation_SG.ss"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_hook_representationShape.iog" "LegFoot__instance_1_mirror:hook_root_joint_m_hookRepresentation_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_m_hookRepresentation.msg" "hyperLayout23.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_m_hookRepresentation_SG.msg" "hyperLayout23.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_hook_representation.msg" "hyperLayout23.hyp[4].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_hook_representationShape.msg" "hyperLayout23.hyp[5].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_hook_representation_parentConstraint_grp.msg" "hyperLayout23.hyp[6].dn"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_parentConstraint2.msg" "hyperLayout23.hyp[7].dn"
		;
connectAttr "hook_root_joint_hook_representation_parentConstraint_grp_scaleConstraint2.msg" "hyperLayout23.hyp[8].dn"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_m_hookRepresentation_SG.msg" "materialInfo21.sg"
		;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_m_hookRepresentation.msg" "materialInfo21.m"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_controlShape.msg" "hyperLayout18.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_translation_control.msg" "hyperLayout18.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_translation_control_SG.msg" "hyperLayout18.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_translation_control.msg" "hyperLayout18.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_controlShape.msg" "hyperLayout19.hyp[0].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_control.msg" "hyperLayout19.hyp[1].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_translation_control_SG.msg" "hyperLayout19.hyp[2].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_translation_control.msg" "hyperLayout19.hyp[3].dn"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_translation_control.oc" "LegFoot__instance_1_mirror:ankle_joint_m_translation_control_SG.ss"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_translation_controlShape.iog" "LegFoot__instance_1_mirror:ankle_joint_m_translation_control_SG.dsm"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_translation_control_SG.msg" "materialInfo18.sg"
		;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_translation_control.msg" "materialInfo18.m"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1:hip_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1:knee_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1:ankle_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1:ball_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1:toe_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1:hook_root_joint_m_hookRepresentation_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1:hip_joint_m_hookRepresentation_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1:knee_joint_m_hookRepresentation_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1:ankle_joint_m_zAxisBlockSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1:ankle_joint_m_yAxisBlockSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1:ball_joint_m_zAxisBlockSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1:ball_joint_m_yAxisBlockSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1_mirror:hip_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1_mirror:knee_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1_mirror:ankle_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1_mirror:ball_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1_mirror:toe_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1_mirror:hook_root_joint_m_hookRepresentation_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1_mirror:hip_joint_m_hookRepresentation_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1_mirror:knee_joint_m_hookRepresentation_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlockSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlockSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlockSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlockSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1:hip_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1:knee_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1:ankle_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1:ball_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1:toe_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1:hook_root_joint_m_hookRepresentation_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1:hip_joint_m_hookRepresentation_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1:knee_joint_m_hookRepresentation_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1:ankle_joint_m_zAxisBlockSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1:ankle_joint_m_yAxisBlockSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1:ball_joint_m_zAxisBlockSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1:ball_joint_m_yAxisBlockSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1_mirror:hip_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1_mirror:knee_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1_mirror:ankle_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1_mirror:ball_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1_mirror:toe_joint_m_translation_control_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1_mirror:hook_root_joint_m_hookRepresentation_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1_mirror:hip_joint_m_hookRepresentation_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1_mirror:knee_joint_m_hookRepresentation_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlockSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlockSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlockSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlockSG.message" ":defaultLightSet.message";
connectAttr "LegFoot__instance_1:hip_joint_m_translation_control_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1:knee_joint_m_translation_control_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1:ankle_joint_m_translation_control_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1:ball_joint_m_translation_control_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1:toe_joint_m_translation_control_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1:hook_root_joint_m_hookRepresentation_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1:hip_joint_m_hookRepresentation_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1:knee_joint_m_hookRepresentation_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1:IK_knee_joint_preferredAngle_representation_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1:ankle_joint_m_zAxisBlockSG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1:ankle_joint_m_yAxisBlockSG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1:ball_joint_m_zAxisBlockSG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1:ball_joint_m_yAxisBlockSG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_translation_control_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_translation_control_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_translation_control_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_translation_control_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1_mirror:toe_joint_m_translation_control_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_m_hookRepresentation_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_hookRepresentation_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_hookRepresentation_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_preferredAngle_representation_SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlockSG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlockSG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlockSG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlockSG.pa" ":renderPartition.st"
		 -na;
connectAttr "LegFoot__instance_1:hip_joint_m_translation_control.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1:knee_joint_m_translation_control.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1:ankle_joint_m_translation_control.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1:ball_joint_m_translation_control.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1:toe_joint_m_translation_control.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1:hook_root_joint_m_hookRepresentation.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1:hip_joint_m_hierarchyRepresentation.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1:knee_joint_m_hierarchyRepresentation.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1:IK_knee_joint_m_preferredAngle_representation.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1:ankle_joint_m_yAxisBlock.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1:ankle_joint_m_zAxisBlock.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1:ball_joint_m_yAxisBlock.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1:ball_joint_m_zAxisBlock.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_translation_control.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_translation_control.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_translation_control.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_translation_control.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1_mirror:toe_joint_m_translation_control.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_m_hookRepresentation.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1_mirror:hip_joint_m_hierarchyRepresentation.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1_mirror:knee_joint_m_hierarchyRepresentation.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1_mirror:IK_knee_joint_m_preferredAngle_representation.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_yAxisBlock.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_m_zAxisBlock.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_yAxisBlock.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ball_joint_m_zAxisBlock.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LegFoot__instance_1:distBetween_hook_root_joint_rootPosLocator_hook_target_joint_endPosLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:hook_root_joint_ikHandle_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:hook_target_joint_scaleMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:distBetween_hip_joint_rootPosLocator_knee_joint_endPosLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:hip_joint_ikHandle_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:knee_joint_scaleMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:distBetween_knee_joint_rootPosLocator_ankle_joint_endPosLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:knee_joint_ikHandle_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:ankle_joint_scaleMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:distBetween_ankle_joint_rootPosLocator_ball_joint_endPosLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:ankle_joint_ikHandle_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:ball_joint_scaleMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:distBetween_ball_joint_rootPosLocator_toe_joint_endPosLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:ball_joint_ikHandle_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:toe_joint_scaleMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_translationValue.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_translationValue.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:distBetween_hook_root_joint_rootPosLocator_hook_target_joint_endPosLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:hook_root_joint_ikHandle_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:hook_target_joint_scaleMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:distBetween_hip_joint_rootPosLocator_knee_joint_endPosLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:hip_joint_ikHandle_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:knee_joint_scaleMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:distBetween_knee_joint_rootPosLocator_ankle_joint_endPosLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:knee_joint_ikHandle_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_scaleMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:distBetween_ankle_joint_rootPosLocator_ball_joint_endPosLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ankle_joint_ikHandle_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ball_joint_scaleMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:distBetween_ball_joint_rootPosLocator_toe_joint_endPosLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:ball_joint_ikHandle_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:toe_joint_scaleMultiply.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_hip_joint_positionLocator_IK_knee_joint_positionLocator_translationValue.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_scaleFactor.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1_mirror:distBetween_IK_knee_joint_positionLocator_IK_hip_joint_ikHandle_positionLocator_translationValue.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LegFoot__instance_1:module_transformShape.iog" ":initialShadingGroup.dsm"
		 -na;
connectAttr "LegFoot__instance_1_mirror:module_transformShape.iog" ":initialShadingGroup.dsm"
		 -na;
connectAttr "Group__legsShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "groupId18.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId21.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId24.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId27.msg" ":initialShadingGroup.gn" -na;
connectAttr "ikRPsolver.msg" ":ikSystem.sol" -na;
// End of 01_Legs.ma
