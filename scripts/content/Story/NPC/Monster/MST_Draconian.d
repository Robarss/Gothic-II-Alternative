
prototype Mst_Default_Draconian(C_Npc)
{
	name[0] = "Je?t?ran";
	guild = GIL_DRACONIAN;
	aivar[AIV_MM_REAL_ID] = ID_DRACONIAN;
	level = 35;
	attribute[ATR_STRENGTH] = 130;
	attribute[ATR_DEXTERITY] = 130;
	attribute[ATR_HITPOINTS_MAX] = 260;
	attribute[ATR_HITPOINTS] = 260;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 130;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 65;
	HitChance[NPC_TALENT_1H] = 80;
	HitChance[NPC_TALENT_2H] = 80;
	HitChance[NPC_TALENT_BOW] = 80;
	HitChance[NPC_TALENT_CROSSBOW] = 80;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

func void B_SetVisuals_Draconian()
{
	Mdl_SetVisual(self,"Draconian.mds");
	Mdl_SetVisualBody(self,"Draconian_body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Draconian(Mst_Default_Draconian)
{
	B_SetVisuals_Draconian();
	EquipItem(self,ItMw_2H_OrcSword_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};


prototype MST_DEFAULT_DRACONIAN2(C_Npc)
{
	name[0] = "Ledov? je?t?ran";
	guild = GIL_DRACONIAN;
	aivar[AIV_MM_REAL_ID] = ID_DRACONIAN;
	level = 35;
	attribute[ATR_STRENGTH] = 160;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 360;
	attribute[ATR_HITPOINTS] = 360;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 95;
	HitChance[NPC_TALENT_1H] = 80;
	HitChance[NPC_TALENT_2H] = 80;
	HitChance[NPC_TALENT_BOW] = 80;
	HitChance[NPC_TALENT_CROSSBOW] = 80;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

func void b_setvisuals_draconian2()
{
	Mdl_SetVisual(self,"Draconian.mds");
	Mdl_SetVisualBody(self,"Draconian_Icebody",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DRACONIAN2(MST_DEFAULT_DRACONIAN2)
{
	b_setvisuals_draconian2();
	EquipItem(self,ItMw_2H_OrcSword_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

