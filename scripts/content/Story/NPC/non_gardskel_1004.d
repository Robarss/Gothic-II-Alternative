
instance NON_GARDSKEL_1004(Npc_Default)
{
	name[0] = "Xardasuv sluha";
	guild = GIL_NONE;
	id = 1004;
	flags = 0;
	npcType = FAI_HUMAN_STRONG;
	B_SetAttributesToChapter(self,4);
	fight_tactic = npctype_main;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMi_Broom);
	Mdl_SetModelFatness(self,2);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = rtn_start_1004;
};


func void rtn_start_1004()
{
	TA_Cook_Stove(8,0,24,0,"NW_XARDAKEL1");
	TA_Cook_Stove(24,0,8,0,"NW_XARDAKEL1");
};

