
prototype MST_DEFAULT_RIESENNATTER(C_Npc)
{
	name[0] = "Had";
	guild = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_NATTER;
	level = 2;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_HITPOINTS_MAX] = 15;
	attribute[ATR_HITPOINTS] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 25;
	protection[PROT_EDGE] = 25;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 25;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = 8;
	aivar[AIV_MM_RoamEnd] = 20;
	aivar[AIV_MM_SleepStart] = 20;
	aivar[AIV_MM_SleepEnd] = 8;
};

func void b_setvisuals_riesennatter()
{
	Mdl_SetVisual(self,"Riesennatter.mds");
	Mdl_SetVisualBody(self,"Rnr_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelScale(self,0.7,0.7,0.7);
};


instance RIESENNATTER(MST_DEFAULT_RIESENNATTER)
{
	b_setvisuals_riesennatter();
	Npc_SetToFistMode(self);
};

