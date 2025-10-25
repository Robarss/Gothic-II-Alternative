
prototype Mst_Default_Draconian(C_Npc)
{
	name[0] = "Ještěran";
	guild = GIL_DRACONIAN;
	aivar[AIV_MM_REAL_ID] = ID_DRACONIAN;
	level = 35;
	attribute[ATR_STRENGTH] = 230;
	attribute[ATR_DEXTERITY] = 230;
	attribute[ATR_HITPOINTS_MAX] =660;
	attribute[ATR_HITPOINTS] = 660;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 30;
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
	name[0] = "Ledový ještěran";
	guild = GIL_DRACONIAN;
	aivar[AIV_MM_REAL_ID] = ID_DRACONIAN;
	level = 35;
	attribute[ATR_STRENGTH] = 260;
	attribute[ATR_DEXTERITY] = 260;
	attribute[ATR_HITPOINTS_MAX] = 960;
	attribute[ATR_HITPOINTS] = 960;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 180;
	protection[PROT_EDGE] = 180;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 90;
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

