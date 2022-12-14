
instance DMT_1215_DEMENTOR(Npc_Default)
{
	name[0] = NAME_Dementor;
	guild = GIL_DMT;
	id = 1212;
	voice = 19;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_MadPsi,BodyTex_N,itar_demetordemon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_1215;
};


func void rtn_start_1215()
{
	TA_Stand_Dementor(8,0,23,0,"GD_WALL_227");
	TA_Stand_Dementor(23,0,8,0,"GD_WALL_227");
};

