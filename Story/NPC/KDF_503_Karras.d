
instance KDF_503_Karras(Npc_Default)
{
	name[0] = "Karras";
	guild = GIL_KDF;
	id = 503;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_L_NormalBart02,BodyTex_L,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_503;
};


func void Rtn_Start_503()
{
	ta_buchschreiben(8,0,23,0,"NW_MONASTERY_RUNEMAKER_02");
	ta_buchschreiben(8,0,23,0,"NW_MONASTERY_RUNEMAKER_02");
};

