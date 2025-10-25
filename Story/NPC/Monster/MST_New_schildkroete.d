
prototype MST_DEFAULT_SCHILDKROETE(C_Npc)
{
	name[0] = "Želva";
	guild = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_MEATBUG;
	level = 5;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
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
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void b_setvisuals_schildkroete()
{
	Mdl_SetVisual(self,"Schildkroete.mds");
	Mdl_SetVisualBody(self,"SCHILDKROETE_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelScale(self,0.5,0.5,0.5);
};


instance SCHILDKROETE(MST_DEFAULT_SCHILDKROETE)
{
	b_setvisuals_schildkroete();
	Npc_SetToFistMode(self);
};

