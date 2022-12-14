
instance DIA_Addon_Logan_EXIT(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 999;
	condition = DIA_Addon_Logan_EXIT_Condition;
	information = DIA_Addon_Logan_EXIT_Info;
	permanent = TRUE;
	description = "Vr?t?m se pozd?ji ...";
};


func int DIA_Addon_Logan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Logan_EXIT_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_EXIT_15_00");	//Vr?t?m se pozd?ji ...
	if(!((MIS_HlpLogan == LOG_Running) || !(MIS_HlpLogan == LOG_SUCCESS)) && (Logan_Inside == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Logan_EXIT_10_01");	//(bru??) Jasn?, ute?. J? tu budu st?t a zastav?m v?echno a v?echny, kte?? se opov??? p?ibl??it.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Logan_PICKPOCKET(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 900;
	condition = DIA_Addon_Logan_PICKPOCKET_Condition;
	information = DIA_Addon_Logan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Logan_PICKPOCKET_Condition()
{
	return C_Beklauen(59,50);
};

func void DIA_Addon_Logan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Logan_PICKPOCKET,Dialog_Back,DIA_Addon_Logan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Logan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Logan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Logan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
};

func void DIA_Addon_Logan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
};


instance DIA_Addon_BDT_1072_Logan_Mine(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_Mine_Condition;
	information = DIA_Addon_Logan_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Logan_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1072_Logan_Mine_10_00");	//Zvl?dl jsi to, co? Dob?e, je fajn, ?e mi tady pom?h??.
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Logan_How2(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_How2_Condition;
	information = DIA_Addon_Logan_How2_Info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int DIA_Addon_Logan_How2_Condition()
{
	if((Logan_Inside == TRUE) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_How2_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_01");	//Celkem dob?e, aspo? ?e jsem tady. Lucie d?l? fakt drsnou ko?alku.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_02");	//Ale Esteban m? nechce pustit do dolu. Aspo? ne te?. Dostal jsem toti? jin? ?kol.
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_03");	//Tak?e? Co chce abys ud?lal?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_04");	//N?kdo se pokusil Estebana zavra?dit. A on by r?d v?d?l, kdo za t?m stoj?.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_05");	//(?ept?) Esteban v???, ?e Snaf je do toho zapleten?. M?m na n?ho d?vat pozor ...
};


instance DIA_Addon_Logan_Attentat(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 9;
	condition = DIA_Addon_Logan_Attentat_Condition;
	information = DIA_Addon_Logan_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Logan_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && (Logan_Inside == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_00");	//Tak?e, ty hled?? chl?pky, kte?? jsou za to zodpov?dn??
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_01");	//No, j? o tom nic nev?m. M?l bych? Kdy? se to stalo, tak j? jsem sed?l celou dobu v ba?in?.
};


instance DIA_Addon_Logan_HI(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_HI_Condition;
	information = DIA_Addon_Logan_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Logan_HI_Condition()
{
	if((Logan_Inside == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_HI_Info()
{
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_00");	//Hele, jestli to nen? nov? tv??.
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_01");	//Pl?nuje? tady st?t celou dobu, nebo mi p?jde? pomoct?
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HI))
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_02");	//Franco se zm?nil. Mysl? si, ?e by se ti hodila n?jak? pomoc. Tak co?
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_03");	//Z?le?? na tom, jakou p?esn? pot?ebuje? pomoc?
	};
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_04");	//Mo??lov? ?raloci jsou na m?j vkus p??li? bl?zko. M?li bychom jich p?r zab?t.
	Log_CreateTopic(Topic_Addon_Logan,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Logan,LOG_Running);
	B_LogEntry(Topic_Addon_Logan,"Logan chce, abych s n?m ?el lovit mo??lov? ?raloky.");
};


instance DIA_Addon_Logan_Why(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_Why_Condition;
	information = DIA_Addon_Logan_Why_Info;
	permanent = FALSE;
	description = "A co za to dostanu?";
};


func int DIA_Addon_Logan_Why_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_HI) && (Logan_Inside == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Why_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Why_15_00");	//A co za to dostanu?
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_01");	//(bru??) Franco t? tu nech? shn?t, jestli nebud? u?ite?n?.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_02");	//Chce? do t?bora? No, nap?ed tu mus?? trochu pomoct. Samotn? slova ti nepom??ou dos?hnout tv?ho c?le.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_03");	//Tak?e, mohl bych ti uk?zat, jak zpracovat tyhle monstra.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_04");	//Ale ve skute?nosti si nemysl?m, ?e by t? Franco pustil jenom proto, ?e jsme tu zabili p?r mo??lov?ch ?ralok?.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_05");	//Tady venku jsou lid?, kte?? ?ekaj? daleko d?le.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_06");	//A lep?? bude, p?ipojit se tak? k t?boru ... (bru??)
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher,"Logan m? m??e nau?it, jak z?skat ze zabit?ch zv??at k??i, dr?py a zuby.");
};


instance DIA_Addon_Logan_Lager(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 3;
	condition = DIA_Addon_Logan_Lager_Condition;
	information = DIA_Addon_Logan_Lager_Info;
	permanent = FALSE;
	description = "Co je p?esn? v t?bo?e?";
};


func int DIA_Addon_Logan_Lager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Why) && (Logan_Inside == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lager_15_00");	//Co je p?esn? v t?bo?e?
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_01");	//(bru??) Ot?zka sp?? je, co NEN? v t?bo?e. ??dn? mo??lov? ?raloci, ??dn? pitom? ba?inat? d?ra ... zkr?tka, ??DN? ba?ina, ch?pe?.
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_02");	//Nejenom ?e tam maj? chlast a zlato, ale pokud si dob?e pamatuju, tak jsou tam i ?eny, u? rozum???
};


instance DIA_Addon_Logan_MIS(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 99;
	condition = DIA_Addon_Logan_MIS_Condition;
	information = DIA_Addon_Logan_MIS_Info;
	permanent = FALSE;
	description = "Poj?me zab?t p?r mo??lov?ch ?ralok?.";
};


func int DIA_Addon_Logan_MIS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_HI))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_MIS_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_00");	//Poj?me zab?t p?r mo??lov?ch ?ralok?.
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_01");	//(bru??) Vypad? to, ?e jsi pochopil, jak to tady chod?. To se mi l?b?. Do prdele ... sly?el jsi to? Sly??m je!
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_02");	//M?me to - a co budeme d?lat te??
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_03");	//P?ich?zej?. A jde jim o to, aby si z n?s ukousli po??dn? kousek. Tak?e, poj?me se mrknout kdo z koho. Na n?.
	Snd_Play("SWA_Warn");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JAGD");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HlpLogan = LOG_Running;
	Wld_InsertNpc(MIS_Addon_Swampshark_01,"ADW_SWAMPSHARK_01");
	Wld_InsertNpc(MIS_Addon_Swampshark_02,"ADW_SWAMPSHARK_02");
	Wld_InsertNpc(MIS_Addon_Swampshark_03,"ADW_BANDIT_VP3_06");
};


instance DIA_Addon_Logan_tot(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_tot_Condition;
	information = DIA_Addon_Logan_tot_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Logan_tot_Condition()
{
	if(Npc_IsDead(MIS_Addon_Swampshark_01) && Npc_IsDead(MIS_Addon_Swampshark_02) && Npc_IsDead(MIS_Addon_Swampshark_03) && Npc_KnowsInfo(other,DIA_Addon_Logan_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_tot_Info()
{
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_00");	//Mrtv? ?ralok, dobr? ?ralok. To by m?lo b?t varov?n? pro ostatn?.
	AI_Output(other,self,"DIA_Addon_Logan_tot_15_01");	//Ok, je?t? n?co? Jinak odejdu.
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_02");	//Je?t? ne. V??, kde hledat jestli se bude? cht?t n?co nau?it.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HlpLogan = LOG_SUCCESS;
	B_CheckLog();
	B_LogEntry(Topic_Addon_Franco,"Pomohl jsem Loganovi. Je ?as se j?t mrknout, jestli je Franco spokojen?.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Logan_Lern(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 100;
	condition = DIA_Addon_Logan_Lern_Condition;
	information = DIA_Addon_Logan_Lern_Info;
	permanent = FALSE;
	description = "Uka? mi, jak zpracovat zv??ata ...";
};


func int DIA_Addon_Logan_Lern_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Why))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Lern_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lern_15_00");	//Uka? mi, jak zpracovat zv??ata ...
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_01");	//Jestli chce? v?d?t v?c o krvav?ch mouch?ch, zeptej se sp?? Edgora.
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_02");	//Jestli chce? v?d?t, jak zpracovat mo??lov? ?raloky nebo je?t?rky, tak by bylo dobr? v?d?t, jak jim st?hnout k??i a od??znout jim zuby. Tohle ti m??u uk?zat.
};


instance DIA_Addon_Logan_Allg(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 3;
	condition = DIA_Addon_Logan_Allg_Condition;
	information = DIA_Addon_Logan_Allg_Info;
	permanent = TRUE;
	description = "Chci se nau?it ...";
};


func int DIA_Addon_Logan_Allg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Lern) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Allg_Info()
{
	Info_ClearChoices(DIA_Addon_Logan_Allg);
	Info_AddChoice(DIA_Addon_Logan_Allg,Dialog_Back,DIA_Addon_Logan_Allg_BACK);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg,B_BuildLearnString("Vytahov?n? zub?",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Addon_Logan_Allg_Teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg,B_BuildLearnString("Odseknut? dr?p?",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Addon_Logan_Allg_Claws);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg,B_BuildLearnString("St?hnout k??i",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Addon_Logan_Allg_Fur);
	};
};

func void DIA_Addon_Logan_Allg_BACK()
{
	Info_ClearChoices(DIA_Addon_Logan_Allg);
};

func void DIA_Addon_Logan_Allg_Teeth()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth);
};

func void DIA_Addon_Logan_Allg_Claws()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws);
};

func void DIA_Addon_Logan_Allg_Fur()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur);
};


var int Logan_Lohn;

instance DIA_Addon_Logan_Hacker(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 9;
	condition = DIA_Addon_Logan_Hacker_Condition;
	information = DIA_Addon_Logan_Hacker_Info;
	permanent = TRUE;
	description = "Co je nov?ho?";
};


func int DIA_Addon_Logan_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Logan_Hacker_15_00");	//Co je nov?ho?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_01");	//Hej, mus?m ti pod?kovat! M?m povolen? ke vstupu do dolu!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_02");	//Moc toho o kop?n? zlata nev?m, ale n?jak ho dostanu.
	if(Logan_Lohn == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_03");	//U? um?m z?klady. Zap?i se siln? nohama a bouchni tak siln?, jak jen m??e?!
		B_Upgrade_Hero_HackChance(10);
		Logan_Lohn = TRUE;
	};
};

