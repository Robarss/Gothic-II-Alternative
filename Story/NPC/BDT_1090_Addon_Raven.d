
instance BDT_1090_Addon_Raven(Npc_Default)
{
	name[0] = "Raven";
	guild = GIL_SKELETON;
	id = 1090;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_REAL_ID] = ID_RAVEN;
	level = 50;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 700;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 20;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	attribute[ATR_MANA_MAX] = 666666;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_BeliarWeapon_Raven);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMi_Addon_Stone_01,1);
	CreateInvItems(self,ItMi_Addon_Stone_02,1);
	CreateInvItems(self,ItMi_Addon_Stone_03,1);
	CreateInvItems(self,ItMi_Addon_Stone_04,1);
	CreateInvItems(self,ItMi_Addon_Stone_05,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Raven,BodyTex_N,ITAR_Raven_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_1090;
};


func void Rtn_Start_1090()
{
	TA_Pray_Innos_FP(9,0,21,0,"ADW_ADANOSTEMPEL_RAVEN_11");
	TA_Pray_Innos_FP(21,0,9,0,"ADW_ADANOSTEMPEL_RAVEN_11");
};

func void Rtn_WaitforPlayer_1090()
{
	TA_Stand_WP(9,0,21,0,"ADW_ADANOSTEMPEL_RAVEN_11");
	TA_Stand_WP(21,0,9,0,"ADW_ADANOSTEMPEL_RAVEN_11");
};

func void rtn_summon_1090()
{
	ta_stand_summon(0,0,23,59,"ADW_ADANOSTEMPEL_RAVEN_01");
	ta_stand_summon(23,59,0,1,"ADW_ADANOSTEMPEL_RAVEN_01");
};

func void rtn_battle_1090()
{
	TA_Stand_WP(0,0,23,59,"ADW_ADANOSTEMPEL_RAVEN_11");
	TA_Stand_WP(23,59,0,1,"ADW_ADANOSTEMPEL_RAVEN_11");
};

