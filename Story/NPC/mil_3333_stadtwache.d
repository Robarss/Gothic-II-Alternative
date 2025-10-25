
instance MIL_3333_STADTWACHE(Npc_Default)
{
	name[0] = NAME_Stadtwache;
	guild = GIL_MIL;
	id = 3333;
	voice = 6;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Normal03,BodyTex_P,ItAr_MIL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_3333;
};


func void rtn_start_3333()
{
	ta_stand_halberd(8,0,22,0,"NW_CITY_ENTRANCE_GUARD_01_NEW");
	ta_stand_halberd(22,0,8,0,"NW_CITY_ENTRANCE_GUARD_01_NEW");
};

