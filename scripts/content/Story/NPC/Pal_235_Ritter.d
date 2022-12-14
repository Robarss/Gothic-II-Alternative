
instance Pal_235_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 235;
	voice = 9;
	level = 50;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	attribute[ATR_STRENGTH] = 1500;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 520;
	attribute[ATR_HITPOINTS] = 520;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	EquipItem(self,itsh_2shield);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal18,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"HUMANS_1HST1SH.mds");
	B_GiveNpcTalents(self);
	B_AddFightSkill(self,NPC_TALENT_1H,0);
	B_AddFightSkill(self,NPC_TALENT_2H,0);
	B_AddFightSkill(self,NPC_TALENT_BOW,80);
	B_AddFightSkill(self,NPC_TALENT_CROSSBOW,80);
	daily_routine = Rtn_Start_235;
};


func void Rtn_Start_235()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_PALCAMP_GUARD_02");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_PALCAMP_GUARD_02");
};

