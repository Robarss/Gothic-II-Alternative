
instance KDF_59_HORAS(Npc_Default)
{
	name[0] = "Horas";
	guild = GIL_KDF;
	id = 59;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Tough_Okyl,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = rtn_start_59;
};


func void rtn_start_59()
{
	TA_Pray_Innos_FP(6,0,21,0,"NW_CITY_HABOUR_ENCHANT_IN_STAND");
	TA_Sit_Bench(21,0,6,0,"NW_CITY_HABOUR_ENCHANT_IN_05");
};

