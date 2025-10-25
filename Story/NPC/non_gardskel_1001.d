
instance NON_GARDSKEL_1001(Npc_Default)
{
	name[0] = "Xardasuv strážce";
	guild = GIL_NONE;
	id = 1001;
	flags = 0;
	npcType = FAI_HUMAN_STRONG;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Sword);
	Mdl_SetModelFatness(self,2);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body2",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = rtn_start_1001;
};


func void rtn_start_1001()
{
	ta_lean_wall(8,0,24,0,"NW_XARDAS_TOWER_PATH_01");
	ta_lean_wall(24,0,8,0,"NW_XARDAS_TOWER_PATH_01");
};

