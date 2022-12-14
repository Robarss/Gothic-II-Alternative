
instance Vlk_424_Alwin(Npc_Default)
{
	name[0] = "Alwin";
	guild = GIL_VLK;
	id = 424;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_NormalBart_Riordian,BodyTex_P,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_424;
};


func void Rtn_Start_424()
{
	TA_Stand_Guarding(8,0,22,0,"NW_CITY_HABOUR_NTHLH_02");
	TA_Sleep(22,0,8,0,"NW_CITY_HABOUR_HUT_07_BED_01");
};

