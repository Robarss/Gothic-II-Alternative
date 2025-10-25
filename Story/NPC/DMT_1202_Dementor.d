
instance DMT_1202_Dementor(Npc_Default)
{
	name[0] = NAME_Dementor;
	guild = GIL_DMT;
	id = 1202;
	voice = 19;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_MadPsi,BodyTex_N,ITAR_Dementor);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1202;
};


func void Rtn_Start_1202()
{
	TA_Circle(8,0,23,0,"NW_TROLLAREA_RITUAL_02");
	TA_Circle(23,0,8,0,"NW_TROLLAREA_RITUAL_02");
};

