
prototype Mst_Default_WoodGolem(C_Npc)
{
	name[0] = "Lesní golem";
	guild = GIL_ICEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_WOODGOLEM;
	level = 45;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_FLY;
	fight_tactic = FAI_STONEGOLEM;  
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;   
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = true;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_WoodGolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"WoodGolem.mds");
	Mdl_SetVisualBody(self,"Gol_Wood_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance WoodGolem(Mst_Default_WoodGolem)
{
	b_setvisuals_woodgolem();
	Npc_SetToFistMode(self);
};


prototype MST_DEFAULT_BIGWOODGOLEM(C_Npc)
{
	name[0] = "Pán lesa";
	guild = GIL_ICEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_WOODGOLEM;
	level = 60;
	attribute[ATR_STRENGTH] = 2000;
	attribute[ATR_DEXTERITY] = 2000;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 400;
	protection[PROT_MAGIC] = 80;
	damagetype = DAM_FLY;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void b_setvisuals_bigwoodgolem()
{
	Mdl_SetVisual(self,"BigWoodGolem.mds");
	Mdl_ApplyOverlayMds(self,"BigWoodGolem.mds");
	Mdl_SetVisualBody(self,"BIGWOODGOLEM_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelScale(self,0.7,0.7,0.7);
};


instance BIGWOODGOLEM(MST_DEFAULT_BIGWOODGOLEM)
{
	b_setvisuals_bigwoodgolem();
	Npc_SetToFistMode(self);
};

