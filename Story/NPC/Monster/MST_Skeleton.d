
prototype Mst_Default_Skeleton(C_Npc)
{
	name[0] = "Kostlivec";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 30;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 275;
	protection[PROT_FIRE] = 125;
	protection[PROT_FLY] = 125;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Skeleton()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body2",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Lesser_Skeleton()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_shield_skeleton()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"HUMANS_1HST1SH.MDS");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Skeleton(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
};

instance Summoned_Skeleton(Mst_Default_Skeleton)
{
	name[0] = "Vyvolaný kostlivec";
	guild = gil_summoned_skeleton;
	aivar[AIV_MM_REAL_ID] = id_summoned_skeleton;
	level = 0;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 175;
	protection[PROT_FIRE] = 125;
	protection[PROT_FLY] = 125;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetVisuals_Lesser_Skeleton();
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Lesser_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
};

instance Lesser_Skeleton(Mst_Default_Skeleton)
{
	name[0] = "Malý kostlivec";
	level = 15;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 230;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 80;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetVisuals_Lesser_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
};

instance RAVEN_GUARD(Mst_Default_Skeleton)
{
	name[0] = "Ravenuv sluha";
	aivar[AIV_EnemyOverride] = FALSE;
	level = 10;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
};

instance UNDEAD_GUARD(Mst_Default_Skeleton)
{
	name[0] = "Ravenuv sluha";
	aivar[AIV_EnemyOverride] = FALSE;
	level = 10;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
};

instance UNDEAD_SEEKER_HEAL_1(Mst_Default_Skeleton)
{
	name[0] = "Seeker";
	aivar[AIV_MM_REAL_ID] = ID_UNDEAD_SEEKER;
	aivar[AIV_EnemyOverride] = FALSE;
	level = 10;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 150;
	bodyStateInterruptableOverride = TRUE;
	b_setvisuals_shield_skeleton();
};

instance UNDEAD_SEEKER_HEAL_2(Mst_Default_Skeleton)
{
	name[0] = "Seeker";
	aivar[AIV_MM_REAL_ID] = ID_UNDEAD_SEEKER;
	aivar[AIV_EnemyOverride] = FALSE;
	level = 10;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 150;
	bodyStateInterruptableOverride = TRUE;
	b_setvisuals_shield_skeleton();
};

instance LESSER_SKELETON2(Mst_Default_Skeleton)
{
	name[0] = "Kostlivec";
	level = 25;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 275;
	protection[PROT_FIRE] = 125;
	protection[PROT_FLY] = 125;
	fight_tactic = FAI_HUMAN_NORMAL;
	b_setvisuals_shield_skeleton();
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,itsh_10shield);
};

instance Crypt_Skeleton_Room_01(Mst_Default_Skeleton)
{
	name[0] = "Strážce krypty";
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
	CreateInvItem(self,ItKe_EVT_CRYPT_01);
};

instance Crypt_Skeleton_Room_02(Mst_Default_Skeleton)
{
	name[0] = "Strážce krypty";
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
	CreateInvItem(self,ItKe_EVT_CRYPT_02);
};

instance Crypt_Skeleton_Room_03(Mst_Default_Skeleton)
{
	name[0] = "Strážce krypty";
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
	CreateInvItem(self,ItKe_EVT_CRYPT_03);
};

instance Skeleton_Archol1(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
};

instance Skeleton_Archol2(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
};

instance Skeleton_Archol3(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
};

instance Skeleton_Archol4(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
};

instance Skeleton_Archol5(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
};

instance Skeleton_Archol6(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
};

instance Skeleton_Mario1(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
};

instance Skeleton_Mario2(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
};

instance Skeleton_Mario3(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
};

instance Skeleton_Mario4(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
};

