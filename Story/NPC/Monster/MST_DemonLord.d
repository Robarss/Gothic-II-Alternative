
prototype Mst_Default_DemonLord(C_Npc)
{
	name[0] = "Pán démonů";
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	level = 60;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_DEMON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_DemonLord()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DemonLord(Mst_Default_DemonLord)
{
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};

instance Xardas_DT_DemonLord(Mst_Default_DemonLord)
{
	B_SetVisuals_DemonLord();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	Npc_SetToFistMode(self);
};

instance RAVEN_DEMONLORD(Mst_Default_DemonLord)
{
	name[0] = "Raven's guard";
	level = 20;
	attribute[ATR_STRENGTH] = 220;
	attribute[ATR_DEXTERITY] = 220;
	attribute[ATR_HITPOINTS_MAX] = 450;
	attribute[ATR_HITPOINTS] = 450;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_DemonLord();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	Npc_SetToFistMode(self);
};

instance RAVEN_DEMONLORD_1(Mst_Default_DemonLord)
{
	name[0] = "Ravenova pravá ruka";
	level = 16;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 180;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 135;
	protection[PROT_EDGE] = 135;
	protection[PROT_POINT] = 125;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 65;
	bodyStateInterruptableOverride = FALSE;
	B_SetVisuals_DemonLord();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	Npc_SetToFistMode(self);
};

instance RAVEN_DEMONLORD_2(Mst_Default_DemonLord)
{
	name[0] = "Ravenova levá ruka";
	level = 16;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 115;
	protection[PROT_EDGE] = 115;
	protection[PROT_POINT] = 125;
	protection[PROT_FIRE] = 75;
	protection[PROT_FLY] = 155;
	protection[PROT_MAGIC] = 55;
	bodyStateInterruptableOverride = FALSE;
	B_SetVisuals_DemonLord();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	Npc_SetToFistMode(self);
};

instance RAVEN_DEMONLORD_SUPREME(Mst_Default_DemonLord)
{
	name[0] = "Sluha temnoty";
	level = 40;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_DemonLord();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	Npc_SetToFistMode(self);
};

