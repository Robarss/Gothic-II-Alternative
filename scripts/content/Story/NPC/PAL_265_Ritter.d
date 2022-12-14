
instance PAL_265_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 265;
	voice = 4;
	level = 40;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	attribute[ATR_STRENGTH] = 1500;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 520;
	attribute[ATR_HITPOINTS] = 520;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Pal_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	EquipItem(self,itsh_2shield);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_NormalBart_Nefarius,BodyTex_P,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"HUMANS_1HST1SH.mds");
	B_GiveNpcTalents(self);
	B_AddFightSkill(self,NPC_TALENT_1H,0);
	B_AddFightSkill(self,NPC_TALENT_2H,0);
	B_AddFightSkill(self,NPC_TALENT_BOW,65);
	B_AddFightSkill(self,NPC_TALENT_CROSSBOW,65);
	daily_routine = Rtn_Start_265;
};


func void Rtn_Start_265()
{
	TA_Stand_Guarding(8,0,23,0,"OC_TO_GUARD");
	TA_Sit_Campfire(23,0,8,0,"OC_GUARD_ROOM_01_FIRE");
};

