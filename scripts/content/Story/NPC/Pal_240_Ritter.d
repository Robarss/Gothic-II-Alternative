
instance Pal_240_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 240;
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
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal20,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"HUMANS_1HST1SH.mds");
	B_GiveNpcTalents(self);
	B_AddFightSkill(self,NPC_TALENT_1H,0);
	B_AddFightSkill(self,NPC_TALENT_2H,0);
	B_AddFightSkill(self,NPC_TALENT_BOW,80);
	B_AddFightSkill(self,NPC_TALENT_CROSSBOW,80);
	daily_routine = Rtn_Start_240;
};


func void Rtn_Start_240()
{
	TA_Stand_Guarding(6,0,7,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(7,0,8,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(8,0,9,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(9,0,10,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(10,0,11,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(11,0,12,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(12,0,13,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(13,0,14,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(14,0,15,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(15,0,16,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(16,0,17,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(17,0,18,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(18,0,19,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(19,0,20,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(20,0,21,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(21,0,22,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(22,0,23,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(23,0,0,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(0,0,1,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(1,0,2,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(2,0,3,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(3,0,4,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(4,0,5,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(5,0,6,0,"NW_CITY_WAY_TO_SHIP_23");
};

func void Rtn_ShipFree_240()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_UPTOWNPARADE_04");
	TA_Stand_WP(23,0,8,0,"NW_CITY_UPTOWNPARADE_04");
};

