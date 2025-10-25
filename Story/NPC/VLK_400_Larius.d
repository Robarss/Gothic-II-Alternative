
instance VLK_400_Larius(Npc_Default)
{
	name[0] = "Larius";
	guild = GIL_VLK;
	id = 400;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Weak_Cipher_alt,BodyTex_N,ITAR_Governor);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_400;
};


func void Rtn_Start_400()
{
	TA_Sit_Throne(8,0,12,0,"NW_CITY_LARIUS");
	ta_malen(12,0,15,0,"NW_COLOR1");
	ta_buchschreiben(15,0,19,0,"NW_CITYHALL_OFFICE_03");
	TA_Sit_Throne(19,0,22,0,"NW_CITYHALL_PRIVATE_THRONE");
	TA_Sleep(22,0,8,0,"NW_CITY_LARIUS_BED");
};

