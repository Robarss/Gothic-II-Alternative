
prototype MST_DEFAULT_PIG(C_Npc)
{
	name[0] = "Prase";
	guild = GIL_SHEEP;
	aivar[AIV_MM_REAL_ID] = ID_SHEEP;
	level = 1;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void b_setvisuals_pig()
{
	Mdl_SetVisual(self,"PIG.mds");
	Mdl_SetVisualBody(self,"Pig_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance PIG(MST_DEFAULT_PIG)
{
	b_setvisuals_pig();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,4);
};

