
instance DIA_Addon_Lares_Patch(C_Info)
{
	npc = VLK_449_Lares;
	nr = 99;
	condition = DIA_Addon_Lares_Patch_Condition;
	information = DIA_Addon_Lares_Patch_Info;
	description = "(??dat zlomek z ornamentu)";
};


func int DIA_Addon_Lares_Patch_Condition()
{
	if(Npc_HasItems(self,ItMi_Ornament_Addon_Vatras) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Patch_Info()
{
	B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
};


instance DIA_Lares_Kap1_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap1_EXIT_Condition;
	information = DIA_Lares_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lares_HaltsMaul(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_HaltsMaul_Condition;
	information = DIA_Addon_Lares_HaltsMaul_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Lares_HaltsMaul_Condition()
{
	if((Lares_HaltsMaul == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_HaltsMaul_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_HaltsMaul_09_01");	//Uvid?me se pozd?ji v doc?ch.
	AI_StopProcessInfos(self);
};


instance DIA_Lares_PICKPOCKET(C_Info)
{
	npc = VLK_449_Lares;
	nr = 900;
	condition = DIA_Lares_PICKPOCKET_Condition;
	information = DIA_Lares_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Lares_PICKPOCKET_Condition()
{
	return C_Beklauen(95,350);
};

func void DIA_Lares_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
	Info_AddChoice(DIA_Lares_PICKPOCKET,Dialog_Back,DIA_Lares_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lares_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lares_PICKPOCKET_DoIt);
};

func void DIA_Lares_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};

func void DIA_Lares_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};


instance DIA_Lares_HALLO(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Lares_HALLO_Condition;
	information = DIA_Lares_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_HALLO_Condition()
{
	if(RangerMeetingRunning == 0)
	{
		return TRUE;
	};
};

func void DIA_Lares_HALLO_Info()
{
	AI_Output(self,other,"DIA_Lares_HALLO_09_00");	//J? jsem se musel zbl?znit. Co tady d?l???
	if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
	{
		AI_Output(self,other,"DIA_Lares_HALLO_09_01");	//Ty jsi sem P?IPLAVAL?
		AI_Output(self,other,"DIA_Lares_HALLO_09_02");	//(sm?ch) Je to jedin? cesta, jak obej?t str??e u br?ny.
		B_GivePlayerXP(500);
	};
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Nevid?li jsme se u??",DIA_Lares_HALLO_NO);
	Info_AddChoice(DIA_Lares_HALLO,"Hej, Laresi, ty starej pard?le!",DIA_Lares_HALLO_YES);
};

func void DIA_Lares_HALLO_NO()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NO_15_00");	//Nevid?li jsme se u??
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_01");	//Chlape, to si m? v??n? nepamatuje?? Poflakoval jsem se kolem Nov?ho t?bora.
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_02");	//Seznam pro doly... Chlape, u?ili jsme si spolu spoustu srandy. Pamatuje? si Leeho?
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Samoz?ejm?, ?e si pamatuju na Leeho!",DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO,"Lee...?",DIA_Lares_HALLO_NOIDEA);
};

func void DIA_Lares_HALLO_YES()
{
	AI_Output(other,self,"DIA_Lares_HALLO_YES_15_00");	//Hej, Laresi, ty starej mizero, jak ses sem dostal?
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_01");	//Poda?ilo se mi ut?ct z Hornick?ho ?dol? pr?v? v?as. Spolu s Leem a je?t? n?kolika dal??ma chlapama.
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_02");	//Pamatuje? si p?ece Leeho, ne?
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Samoz?ejm?, ?e si pamatuju na Leeho!",DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO,"Lee...?",DIA_Lares_HALLO_NOIDEA);
};

func void B_Lares_AboutLee()
{
	AI_Output(self,other,"B_Lares_AboutLee_09_00");	//Tak s n?m jsem se dostal z kolonie. Hned po zni?en? bari?ry.
	AI_Output(self,other,"B_Lares_AboutLee_09_01");	//Je se svejma klukama na Onarov? farm?.
	AI_Output(self,other,"B_Lares_AboutLee_09_02");	//M? s t?m farm??em dohodu. On se sv?mi chlapci br?n? farmu a Onar je na opl?tku ?iv?.
};

func void DIA_Lares_HALLO_LEE()
{
	AI_Output(other,self,"DIA_Lares_HALLO_LEE_15_00");	//Samoz?ejm?, ?e si pamatuju na Leeho!
	B_Lares_AboutLee();
	Info_ClearChoices(DIA_Lares_HALLO);
};

func void DIA_Lares_HALLO_NOIDEA()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//Lee...?
	AI_Output(self,other,"DIA_Lares_HALLO_NOIDEA_09_01");	//Ty ses trochu pra?til, co? Lee byl velitelem ?old?k? v Nov?m t?bo?e.
	B_Lares_AboutLee();
	Info_ClearChoices(DIA_Lares_HALLO);
};


instance DIA_Addon_Lares_Vatras(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_Vatras_Condition;
	information = DIA_Addon_Lares_Vatras_Info;
	description = "Vatras m? poslal. ??kal, ?e bys mi mohl pomoct.";
};


func int DIA_Addon_Lares_Vatras_Condition()
{
	if(Vatras_GehZuLares == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Vatras_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Vatras_15_00");	//Vatras m? poslal. ??kal, ?e bys mi mohl pomoct.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_01");	//(p?ekvapen?) Ty u? ses setkal s Vatrasem. Jist? jsi na n?j ud?lal dojem.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_02");	//On by ti jinak jist? m? jm?no nedal. Obzvl??t? dokud se nevy?e?? p??pad s mizen?m lid?.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_03");	//Dobr?, co pot?ebuje??
	Lares_RangerHelp = TRUE;
	if(GregLocation == Greg_Farm1)
	{
		B_StartOtherRoutine(BAU_974_Bauer,"GregInTaverne");
		GregLocation = Greg_Taverne;
		B_StartOtherRoutine(Greg_NW,"Taverne");
	};
};


instance DIA_Addon_Lares_WhatAreYouGuys(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = DIA_Addon_Lares_WhatAreYouGuys_Condition;
	information = DIA_Addon_Lares_WhatAreYouGuys_Info;
	description = "Co m?? co d?lat s Vatrasem?";
};


func int DIA_Addon_Lares_WhatAreYouGuys_Condition()
{
	if((Lares_RangerHelp == TRUE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_WhatAreYouGuys_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_00");	//Co m?? co d?lat s Vatrasem?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_01");	//?ekn?m?, ?e m?m malou dohodu s m?gy Vody. Sta???
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_02");	//Jakou dohodu?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_03");	//Pracujeme pro n? a oni se staraj?, abychom se nedostali do pr?seru, v?ak to zn?? z trestaneck? kolonie.
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_04");	//Mluv?? o 'Kruhu Vody'?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_05");	//(p?ekvapen?) Co o tom v???
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_06");	//Vatras mi o n?m ?ekl.
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_07");	//Pro? ses o tom nezm?nil u? na za??tku na?eho rozhovoru?
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Lares pat?? ke 'Kruhu Vody'.");
};


instance DIA_Addon_Lares_Ranger(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_Ranger_Condition;
	information = DIA_Addon_Lares_Ranger_Info;
	description = "?ekni mi v?c o 'Kruhu Vody'.";
};


func int DIA_Addon_Lares_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_WhatAreYouGuys) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_00");	//?ekni mi v?c o 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_01");	//'Kruh' je m?g?m Vody t?m, ??m jsou paladinov? m?g?m Ohn?.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_02");	//Narozd?l od paladin? 'Kruh' rad?ji stoj? v pozad?.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_03");	//'Kruh' je mocnou zbran? proti nebezpe??m, kter? hroz? lidem v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_04");	//Ale m??eme pracovat pouze pokud nikdo nev?, kdo ke 'Kruhu' pat??.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_05");	//Prost? o tom nemluv!
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_06");	//Jasn?.
	B_LogEntry(TOPIC_Addon_RingOfWater,"'Kruh' je pro M?gy vody jako to, co jsou paladinov? pro M?gy ohn?, jen 'Kruh' pracuje tajn?. Mimo to, nikdo by nem?l v?d?t, kdo tam PAT??. Proto z?st?v? jejich s?la skryta.");
};


instance DIA_Addon_Lares_WannaBeRanger(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_WannaBeRanger_Condition;
	information = DIA_Addon_Lares_WannaBeRanger_Info;
	description = "R?d bych se p?ipojil ke 'Kruhu Vody' ...";
};


func int DIA_Addon_Lares_WannaBeRanger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_Ranger) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_WannaBeRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_15_00");	//R?d bych se p?ipojil ke 'Kruhu Vody' ...
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_09_01");	//To zn? dob?e. Nicm?n?, o tom rozhoduj? m?gov? Vody.
	B_LogEntry(TOPIC_Addon_RingOfWater,LogText_Addon_KDWRight);
	Info_ClearChoices(DIA_Addon_Lares_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger,"Aha.",DIA_Addon_Lares_WannaBeRanger_BACK);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger,"Tak co obn??? b?t ?lenem 'Kruhu'?",DIA_Addon_Lares_WannaBeRanger_HowIsIt);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger,"Cos ud?lal ty, abys zaujal m?gy Vody?",DIA_Addon_Lares_WannaBeRanger_AboutYou);
};

func void DIA_Addon_Lares_WannaBeRanger_BACK()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_BACK_15_00");	//Aha.
	Info_ClearChoices(DIA_Addon_Lares_WannaBeRanger);
};

func void DIA_Addon_Lares_WannaBeRanger_AboutYou()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00");	//Cos ud?lal ty, abys zaujal m?gy Vody?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01");	//Chr?nil jsem je dlouho, zat?mco jsme ?ili je?t? v bari??e.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02");	//(usm?v? se) A je ur?it? je?t? mnoho d?vod?, aby mi byli vd??n?.
};

func void DIA_Addon_Lares_WannaBeRanger_HowIsIt()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00");	//Tak co obn??? b?t ?lenem 'Kruhu'?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01");	//My jsme velice odli?n? od ostatn?ch obvykl?ch gild, kter? m??e? naj?t v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02");	//Jakmile jsi jedn?m z n?s, u? si nem??e? d?lat, co bys cht?l.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03");	//Nejd?le?it?j?? je dr?et hubu.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04");	//Pracujeme skryt?, neodhaleni. Ostatn? nev?, kdo k n?m pat??.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05");	//Budeme t? sledovat. Pak uvid?me.
};

func void B_Lares_Geheimtreffen()
{
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_07");	//Brzy bude tajn? setk?n? v Orlanov? hospod?.
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_08");	//P?ij? hned, jakmile bude? moci. Dostane? tam sv? vybaven?.
};


instance DIA_Addon_Lares_RingBack(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_RingBack_Condition;
	information = DIA_Addon_Lares_RingBack_Info;
	description = "Nyn? jsem ?lenem 'Kruhu Vody'.";
};


func int DIA_Addon_Lares_RingBack_Condition()
{
	if((SC_IsRanger == TRUE) && (MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS) && ((Npc_GetDistToWP(self,"NW_CITY_HABOUR_02_B") < 1000) || (Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") < 1000)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RingBack_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_00");	//Nyn? jsem ?lenem 'Kruhu Vody'.
	if((Lares_GotRingBack == FALSE) && (SC_GotLaresRing == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_01");	//Skv?l?! M??u nyn? dostat sv?j akvamar?nov? prsten zp?t?
		if(B_GiveInvItems(other,self,ItRi_Ranger_Lares_Addon,1))
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_02");	//Jist?.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_03");	//Douf?m, ?e ti bude u?ite?n?. R?d vid?m, ?e jsi nyn? jedn?m z n?s.
			Lares_GotRingBack = TRUE;
			B_GivePlayerXP(XP_Ambient);
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_04");	//Dob?e, se mnou se ti te? nic nestane.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_05");	//Neztra? ho! St?le ho pot?ebuji.
		};
	};
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_06");	//Nyn? bys ur?it? r?d dostal nov? vybaven? do sv?ch rukou, ?e? Dobr?, poslouchej.
	B_Lares_Geheimtreffen();
	B_LogEntry(TOPIC_Addon_RingOfWater,"Lares m? pozval na tejn? setk?n? 'Kruhu Vody' do Orlanovy hospody.");
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_Running;
};


instance DIA_Addon_Lares_RingBack2(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_RingBack2_Condition;
	information = DIA_Addon_Lares_RingBack2_Info;
	description = "Tady je tv?j akvamar?nov? prsten.";
};


func int DIA_Addon_Lares_RingBack2_Condition()
{
	if(Npc_HasItems(other,ItRi_Ranger_Lares_Addon) && (Lares_GotRingBack == FALSE) && (MIS_Addon_Lares_ComeToRangerMeeting != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RingBack2_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RingBack2_15_00");	//Toto je tv?j akvamar?nov? prsten.
	B_GiveInvItems(other,self,ItRi_Ranger_Lares_Addon,1);
	AI_Output(self,other,"DIA_Addon_Lares_RingBack2_09_01");	//No. M?? ?t?st?. U? jsem myslel, ?e jsi ho ztratil.
	B_GivePlayerXP(XP_Ambient);
	Lares_GotRingBack = TRUE;
};


instance DIA_Addon_Lares_Geduld(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_Geduld_Condition;
	information = DIA_Addon_Lares_Geduld_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Lares_Geduld_Condition()
{
	if((RangerMeetingRunning == LOG_Running) && (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES") > 200) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Geduld_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_Geduld_09_01");	//Po?kej chv?li. St?le ?ek?me na n?kter? dal?? ?leny.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lares_GetRangerArmor(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_GetRangerArmor_Condition;
	information = DIA_Addon_Lares_GetRangerArmor_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_GetRangerArmor_Condition()
{
	if((MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running) && (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES") < 200) && (RangerMeetingRunning == LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_GetRangerArmor_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_00");	//Tak, m?j mlad? p??teli. Dnes jsme zde p?i?li oslavit tv? p?ijet? do 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_01");	//Tihle chl?pci nyn? na tebe budou dohl??et a starat se o tebe.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_02");	//Ne v?ichni ?lenov? 'Kruhu Vody' dorazili. Tak bu? opatrn?.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_03");	//Bez ohledu na tv? ?sp?chy ?i ne?sp?chy - budeme o tom v?d?t.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_04");	//Nyn? ti tak? d?m tv? brn?n?.
	CreateInvItem(hero,ITAR_RANGER_Addon);
	AI_EquipArmor(hero,ITAR_RANGER_Addon);
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_05");	//Nos ho s p?chou, ale neukazuj se v n?m ve m?st? nebo jin?ch ve?ejn?ch lokalit?ch.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_06");	//Pamatuj, na?e spole?enstv? nesm? b?t prozrazeno. Nikdo nesm? v?d?t, ?e pat??? do 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_07");	//Nikdo nemluv? o 'Kruhu Vody'. To je prvn? a nejd?le?it?j?? pravidlo. Nezapom??.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_08");	//N?jak? dal?? ot?zky?
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor,"Mus?m u? j?t.",DIA_Addon_Lares_GetRangerArmor_end);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor,"A jak mi m??e? pomoci?",DIA_Addon_Lares_GetRangerArmor_Learn);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor,"Co zbran??",DIA_Addon_Lares_GetRangerArmor_weapons);
};

func void DIA_Addon_Lares_GetRangerArmor_weapons()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_weapons_15_00");	//Co zbran??
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_01");	//H?l je zbra? 'Kruhu'. Ale ka?d? m??e pou??vat jakou zbra? chce.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_02");	//Zde je tv? zbra?, nikdy jsem ji ve skute?nosti nepou?il. Mo?n? ti poslou?? l?pe.
	CreateInvItems(self,ItMw_RangerStaff_Addon,1);
	B_GiveInvItems(self,other,ItMw_RangerStaff_Addon,1);
};

func void DIA_Addon_Lares_GetRangerArmor_end()
{
	B_MakeRangerReadyToLeaveMeetingALL();
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_end_15_00");	//Mus?m u? j?t.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_01");	//Dob?e, nechceme t? zdr?ovat.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_02");	//B?? za Vatrasem a on ti d? prvn? ?kol.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_03");	//?lenov? 'Kruhu', vra?te se ke sv?m povinnostem.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_04");	//Banditi je?t? nep?estali ?to?it. Mus?me vy?e?it tento probl?m.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_05");	//Adanosi, udr?uj po??dek v tomto sv?t?.
	Lares_TakeFirstMissionFromVatras = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor,Dialog_Ende,DIA_Addon_Lares_GetRangerArmor_weiter);
};

func void DIA_Addon_Lares_GetRangerArmor_weiter()
{
	AI_StopProcessInfos(self);
	B_RangerMeetingParking();
	B_LogEntry(TOPIC_Addon_RingOfWater,"Dostal jsem sv? brn?n? na tajn?m setk?n? 'Kruhu Vody' v Orlanov? hospod?. M?l bych nyn? j?t za Vatrasem pro sv?j prvn? ?kol jako ?len 'Kruhu'.");
};

func void DIA_Addon_Lares_GetRangerArmor_Learn()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_Learn_15_00");	//A jak mi m??e? pomoci?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_01");	//M??u ti pomoci zlep?it se v s?le.
	if(Npc_IsDead(Sld_805_Cord) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_02");	//Jestli chce? zlep?it sv? schopnosti v boji se zbran?mi nabl?zko, promluv si s Cordem. On je p?n me?e.
	};
	if(Npc_IsDead(BAU_961_Gaan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_03");	//Gann t? nau??, jak z?skat ze zv??e trofeje.
	};
	if(Npc_IsDead(Mil_350_Addon_Martin) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_04");	//Jestli chce? v?d?t v?ce o paladinech, promluv si s Martinem.
	};
	if(Npc_IsDead(BAU_4300_Addon_Cavalorn) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_05");	//Cavalorn t? nau??, jak se pl??it a boji s jednoru?n?mi zbran?mi. Tak? t? nau?? zach?zet s lukem.
	};
	if(Npc_IsDead(BAU_970_Orlan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_06");	//Promluv si s Orlanem, pokud zde bude? cht?t str?vit noc.
	};
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_07");	//A jestli t? zaj?m? magie, m??e? se na n?co zeptat Vatrase.
};


instance DIA_Addon_Lares_Teleportstation(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_Teleportstation_Condition;
	information = DIA_Addon_Lares_Teleportstation_Info;
	description = "U? jsi n?kdy pou?il teleporta?n? k?men?";
};


func int DIA_Addon_Lares_Teleportstation_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SCUsed_TELEPORTER == TRUE) && (MIS_Lares_BringRangerToMe != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Teleportstation_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_00");	//U? jsi n?kdy pou?il teleporta?n? k?men?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_01");	//Ne, ale sly?el jsem o tom. M?gov? Vody nev? p?esn?, co si o t?chto v?cech maj? myslet.
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_02");	//U? jsem jeden vyzkou?el.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_03");	//(sm?je se) M?l jsem si to myslet. Je v?bec n?co, co bys neud?lal?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_04");	//Dob?e, jestli chce? pou??t jednu z t?chto v?c?, zeptej se Orlana - hospodsk?ho - jestli ti povol? vstup do jeskyn?, kter? je zamkl?.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_05");	//Mysl?m, ?e je skryt? teleporta?n? k?men k m?g?m Vody nedaleko jeho hospody.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_06");	//Opus? m?sto v?chodn? branou a prost? b?? po cest?. Nev?m, jak bys to mohl minout.
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Lares mi ?ekl, ?e bl?zko Orlanovy hospody je skryt? teleporta?n? k?men.");
	Orlan_Hint_Lares = TRUE;
};


instance DIA_Addon_Lares_Ornament(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_Ornament_Condition;
	information = DIA_Addon_Lares_Ornament_Info;
	description = "Vatras mi pro tebe dal tento ornament...";
};


func int DIA_Addon_Lares_Ornament_Condition()
{
	if(Npc_HasItems(other,ItMi_Ornament_Addon_Vatras) && Npc_KnowsInfo(other,DIA_Addon_Lares_Vatras))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Ornament_15_00");	//Vatras mi pro tebe dal tento ornament. ?ekl, ?e ho m?? vr?tit.
	B_GiveInvItems(other,self,ItMi_Ornament_Addon_Vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_01");	//(povzdechne si) Jak? p?ekvapen?. Zase je to na mn?. Mohl jsem si to myslet.
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_02");	//Nyn? mus?m j?t p?es cel? ostrov, abych to vr?til m?g?m Vody.
};


instance DIA_Addon_Lares_OrnamentBringJob(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_OrnamentBringJob_Condition;
	information = DIA_Addon_Lares_OrnamentBringJob_Info;
	description = "Ud?l?m to pro tebe!";
};


func int DIA_Addon_Lares_OrnamentBringJob_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_Ornament) && (MIS_Addon_Lares_Ornament2Saturas == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_OrnamentBringJob_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_OrnamentBringJob_15_00");	//Ud?l?m to pro tebe!
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_01");	//(uva?uje) Hmm . Mysl?m, ?e bude lep??, kdy? tam ten ornament donesu osobn?. Nicm?n? se ke mn? m??e? p?idat.
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_02");	//Bohu?el, nem??u opustit toto m?sto. Mus?m sledovat doky.
	B_LogEntry(TOPIC_Addon_KDW,"Donesl jsem Laresovi Vatras?v ornament. Chce, abychom ho donesli M?g?m vody a Lares by m? m?l doprov?zet.");
	MIS_Addon_Lares_Ornament2Saturas = LOG_Running;
};


instance DIA_Addon_Lares_YourMission(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_YourMission_Condition;
	information = DIA_Addon_Lares_YourMission_Info;
	permanent = TRUE;
	description = "Co p?esn? d?l?? tady v p??stavu?";
};


func int DIA_Addon_Lares_YourMission_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_Ornament) && (MIS_Lares_BringRangerToMe == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_YourMission_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_YourMission_15_00");	//Co p?esn? d?l?? tady v p??stavu?
	if(!Npc_KnowsInfo(other,DIA_Addon_Lares_WhatAreYouGuys))
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_01");	//Nem??u o tom mluvit.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_02");	//Vatras by mi srazil hlavu ...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_03");	//D?l?m, co d?l?me my v?ichni. Pln?me ?koly, kter? dostaneme od m?g? Vody.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_04");	//N?kte?? ze zmizel?ch lid? jsou ryb??i. Dokonce jejich lod? zmizely.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_05");	//To je, pro? jsem zde a sleduji doky. Mo?n? zde n?co najdu.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_06");	//Ale mohl bys mi pomoci.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_07");	//Poslouchej, d?m ti sv?j akvamar?nov? prsten. Je to znak 'Kruhu Vody'.
		CreateInvItems(self,ItRi_Ranger_Lares_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Lares_Addon,1);
		SC_GotLaresRing = TRUE;
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_08");	//Nasa? si ho a ostatn? poznaj?, ?e pracuje? pro m?.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_09");	//Najdi za m? n?hradu a tak budeme moci vr?tit ornament.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_10");	//Jeden z n?s obvykle sleduje tr?i?t?. Nen? tam pr?v? zapot?eb?.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_11");	//Prost? mluv s lidmi. Spr?vn? osoba t? pozn? d?ky m?mu prstenu na tv?m prst?.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_12");	//?ekni mu, ?e hled?m n?hradu.
		B_LogEntry(TOPIC_Addon_RingOfWater,"Lares mi dal sv?j akvamar?nov? prsten se zna?kou 'Kruhu'. Nasazen? prsten v?ichni ?lenov? 'Kruhu' poznaj? a p?ijmou m?.");
		Log_CreateTopic(TOPIC_Addon_BringRangerToLares,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares,LOG_Running);
		B_LogEntry(TOPIC_Addon_BringRangerToLares,"Lares nem??e opustit p??stav. M?l bych prozkoumat tr?i?t? s nasazen?m akvamar?nov?m prstenem, abych na?el za Larese n?hradu.");
		MIS_Lares_BringRangerToMe = LOG_Running;
	};
};


instance DIA_Addon_Lares_BaltramAbloese(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_BaltramAbloese_Condition;
	information = DIA_Addon_Lares_BaltramAbloese_Info;
	description = "Mluvil jsem s Baltramem...";
};


func int DIA_Addon_Lares_BaltramAbloese_Condition()
{
	if((MIS_Lares_BringRangerToMe == LOG_Running) && (Baltram_Exchange4Lares == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_BaltramAbloese_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_BaltramAbloese_15_00");	//Mluvil jsem s Baltramem. Najde n?koho, kdo t? nahrad?.
	AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_01");	//Velmi dob?e. Alespo? odsud m??eme vypadnout.
	if(SC_IsRanger == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_02");	//M??e? si nyn? nechat m?j akvamar?nov? prsten.
		if(Npc_KnowsInfo(other,DIA_Addon_Lares_WannaBeRanger))
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_03");	//(sm?je se) ?ekl bych, ?e se ti bude hodit, dokud nedostane? sv?j vlastn?.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_04");	//(sm?je se) Mo?n? se k n?m nakonec rozhodne? i p?idat ...
		};
	};
	MIS_Lares_BringRangerToMe = LOG_SUCCESS;
	Lares_CanBringScToPlaces = TRUE;
};


var int Lares_PeopleMissing_PERM;

instance DIA_Addon_Lares_PeopleMissing(C_Info)
{
	npc = VLK_449_Lares;
	nr = 3;
	condition = DIA_Addon_Lares_PeopleMissing_Condition;
	information = DIA_Addon_Lares_PeopleMissing_Info;
	permanent = TRUE;
	description = "O zmizel?ch lidech ...";
};


func int DIA_Addon_Lares_PeopleMissing_Condition()
{
	if((Lares_RangerHelp == TRUE) && (Lares_PeopleMissing_PERM == FALSE) && ((SC_IsRanger == FALSE) || (MissingPeopleReturnedHome == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_PeopleMissing_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_15_00");	//O zmizel?ch lidech ...
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
	Info_AddChoice(DIA_Addon_Lares_PeopleMissing,Dialog_Back,DIA_Addon_Lares_PeopleMissing_BACK);
	if(MissingPeopleReturnedHome == TRUE)
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing,"Ud?lal jsem to, abych zachr?nil n?kter? ze zmizel?ch lid?.",DIA_Addon_Lares_PeopleMissing_SAVED);
	}
	else if((MIS_Lares_BringRangerToMe != 0) && (SCKnowsMissingPeopleAreInAddonWorld == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing,"V?m, kde jsou zmizel? lid? te?!",DIA_Addon_Lares_PeopleMissing_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing,"A nen? to n?hodou pr?ce domobrany?",DIA_Addon_Lares_PeopleMissing_MIL);
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing,"?ekni mi, co o nich v??.",DIA_Addon_Lares_PeopleMissing_TellMe);
	};
};

func void DIA_Addon_Lares_PeopleMissing_BACK()
{
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};

func void DIA_Addon_Lares_PeopleMissing_TellMe()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_TellMe_15_00");	//?ekni mi, co o nich v??.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_01");	//Ryb?? tady z Khorinisu - William - byl prvn?. Prost? se jednoho dne nevr?til.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_02");	//Prvn? jsme si mysleli, ?e se stal ob?t? i s jeho lo?kou n?jak? mo?sk? obludy, kdy? ryba?il venku.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_03");	//Ale brzy za?ali mizet dal??. A nezd?lo se, ?e by za t?m bylo n?co jin?ho.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_04");	//Dosud jsme byli celkem bezradn?. Vypad? to, ?e mus?me ?ekat na n?jakou n?hodu ?i d?kaz, kter? objev?me.
	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
	};
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
	SC_HearedAboutMissingPeople = TRUE;
};

func void DIA_Addon_Lares_PeopleMissing_MIL()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_MIL_15_00");	//A nen? to n?hodou pr?ce domobrany?
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_01");	//Kdyby byli schopn? n?co ud?lat.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_02");	//Nena?li jedin? d?kaz. Lid? mizeli beze stopy.
};

func void DIA_Addon_Lares_PeopleMissing_Success()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_00");	//V?m, kde zmizel? lid? jsou.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_01");	//(p?ekvapen?) Je to tak?
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_02");	//B?val? rudobaron RAVEN je zajal.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_03");	//Jsi si jist? Mus?me je pak n?jak zachr?nit.
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_04");	//Pracuji na tom.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_05");	//V po??dku. V??, kde m? hledat, kdybys pot?eboval pomoc ...
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_06");	//... v?m, kde je naj?t. Dostaneme je.
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};

func void DIA_Addon_Lares_PeopleMissing_SAVED()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_SAVED_15_00");	//Zvl?dl jsem to. Osvobodil jsem v?echny poh?e?ovan? lidi.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_SAVED_09_01");	//V?d?l jsem, ?e to dok??e?. Kone?n? se mohu soust?edit na svou pr?ci.
	B_GivePlayerXP(XP_Ambient);
	Lares_PeopleMissing_PERM = TRUE;
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};


var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung;

instance DIA_Addon_Lares_RangerHelp(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_RangerHelp_Condition;
	information = DIA_Addon_Lares_RangerHelp_Info;
	permanent = TRUE;
	description = "Pot?ebuji tvou pomoc.";
};


func int DIA_Addon_Lares_RangerHelp_Condition()
{
	if(((Lares_RangerHelp == TRUE) && (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE) && (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE) && (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)) || Npc_IsInState(Moe,ZS_Attack))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RangerHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_15_00");	//Pot?ebuji tvou pomoc.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_09_01");	//A jak ti mohu poslou?it?
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
	Info_AddChoice(DIA_Addon_Lares_RangerHelp,Dialog_Back,DIA_Addon_Lares_RangerHelp_nix);
	if(Npc_IsInState(Moe,ZS_Attack))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp,"Ten chl?pek tam mi leze na nervy...",DIA_Addon_Lares_RangerHelp_Moe);
	};
	if((DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE) && (Lares_RangerHelp == TRUE))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp,"Pot?ebuji lep?? zbra?.",DIA_Addon_Lares_RangerHelp_waffe);
	};
	if((DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE) && (Lares_RangerHelp == TRUE))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp,"A co tak lep?? brn?n??",DIA_Addon_Lares_RangerHelp_ruestung);
	};
	if((DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE) && (Lares_RangerHelp == TRUE))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp,"Pot?ebuji pen?ze.",DIA_Addon_Lares_RangerHelp_geld);
	};
};

func void DIA_Addon_Lares_RangerHelp_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_00");	//A co tak lep?? brn?n??
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_01");	//Hmm. Mysl?m, ?e Mateo prod?v? brn?n?, ale nen? zrovna levn? ...
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_02");	//Existuje pravd?podobn? levn?j?? cesta, pokud ti nevad? mal? trable s domobranou ...
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_03");	//Tak jak?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_04");	//Za Mateov?m obchodem je skladi?t?. Ale v?echno zbo?? bylo skonfiskov?no domobranou.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_05");	//Nav?tiv Zurise na tr?i?ti, kup si od n?j svitek se "sp?nkem" a pou?ij ho na str?? u skladu.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_06");	//?ekl bych, ?e kolem Mateova obchodu se v?lela p?kn? zbroj.
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung = TRUE;
};

func void DIA_Addon_Lares_RangerHelp_waffe()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_waffe_15_00");	//Pot?ebuji lep?? zbra?.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_waffe_09_01");	//Sorry, ale s t?mto ti nepomohu. U? jsi byl na tr?i?ti?
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe = TRUE;
};

func void DIA_Addon_Lares_RangerHelp_geld()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_geld_15_00");	//Pot?ebuji pen?ze.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_01");	//Pro? ne? Promi?, nem??u ti p?j?it. Ale Lehmar - lichv?? - mi dlu?? laskavost.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_02");	//Jen mu ?ekni a dostane? pen?ze, kter? pot?ebuje?. J? se u? o zbytek postar?m. Najde? ho po cest? k dok?m u vstupu do doln? ??sti m?sta.
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld = TRUE;
	RangerHelp_LehmarKohle = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
};

func void DIA_Addon_Lares_RangerHelp_nix()
{
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
};

func void DIA_Addon_Lares_RangerHelp_Moe()
{
	AI_Output(other,self,"DIA_Addon_Lares_Moe_15_00");	//Ten chlap mi leze na nervy ...
	AI_Output(self,other,"DIA_Addon_Lares_Moe_09_01");	//Po?kej chvili?ku ...
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack(self,Moe,AR_GuardStopsFight,0);
};


instance DIA_Lares_Paladine(C_Info)
{
	npc = VLK_449_Lares;
	nr = 4;
	condition = DIA_Lares_Paladine_Condition;
	information = DIA_Lares_Paladine_Info;
	permanent = FALSE;
	description = "Mus?m za ka?dou cenu mluvit s paladiny!";
};


func int DIA_Lares_Paladine_Condition()
{
	if((other.guild == GIL_NONE) && (RangerHelp_gildeMIL == FALSE) && (RangerHelp_gildeSLD == FALSE) && (RangerHelp_gildeKDF == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_Paladine_Info()
{
	AI_Output(other,self,"DIA_Lares_Paladine_15_00");	//Mus?m za ka?dou cenu mluvit s paladiny!
	AI_Output(self,other,"DIA_Lares_Paladine_09_01");	//Co od NICH chce??
	AI_Output(other,self,"DIA_Lares_Paladine_15_02");	//Maj? mocn? amulet, Innosovo oko. Mus?m ho m?t.
	AI_Output(self,other,"DIA_Lares_Paladine_09_03");	//A to si mysl??, ?e ti ho daj?? Nikdy se nedostane? ani do horn? ??sti m?sta.
	if(!Npc_KnowsInfo(other,DIA_Addon_Lares_Vatras))
	{
		AI_Output(other,self,"DIA_Lares_Paladine_15_04");	//N?jak? zp?sob se najde.
		AI_Output(self,other,"DIA_Lares_Paladine_09_05");	//Jasn?, jestli chce? podlejzat m욝an?m nebo d?lat poskoka domobran?...
	};
};


instance DIA_Lares_WhyPalHere(C_Info)
{
	npc = VLK_449_Lares;
	nr = 4;
	condition = DIA_Lares_WhyPalHere_Condition;
	information = DIA_Lares_WhyPalHere_Info;
	permanent = FALSE;
	description = "V??, pro? tu jsou paladinov??";
};


func int DIA_Lares_WhyPalHere_Condition()
{
	if(other.guild == GIL_NONE)
	{
		if(Npc_KnowsInfo(other,DIA_Lares_Paladine) || (RangerHelp_gildeMIL == TRUE) || (RangerHelp_gildeSLD == TRUE) || (RangerHelp_gildeKDF == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Lares_WhyPalHere_Info()
{
	AI_Output(other,self,"DIA_Lares_WhyPalHere_15_00");	//V??, pro? tu jsou paladinov??
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_01");	//Nikdo to nev? jist?. Hodn? lid? si mysl?, ?e to je kv?li sk?et?m, ale j? si mysl?m, ?e tu je jinej d?vod.
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_02");	//Nejsp?? to m? co d?lat se starou trestaneckou koloni?.
};


instance DIA_Addon_Lares_Gilde(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_Gilde_Condition;
	information = DIA_Addon_Lares_Gilde_Info;
	permanent = TRUE;
	description = "Vatras se zm?nil...";
};


func int DIA_Addon_Lares_Gilde_Condition()
{
	if((Lares_RangerHelp == TRUE) && (other.guild == GIL_NONE) && (RangerHelp_gildeMIL == FALSE) && (RangerHelp_gildeSLD == FALSE) && (RangerHelp_gildeKDF == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Gilde_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_15_00");	//Vatras se zm?nil, ?e bys mi mohl pomoct p?idat se k jedn? gild?.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_01");	//(posm??n?) Horliv? pracovn? posila, ?e?
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_02");	//Dobr?, poslouch?m.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_03");	//M??u zkusit domluvit ?oldn???m, kdyby ses cht?l p?ipojit k Leemu.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_04");	//Samoz?ejm?, ?e je rychlej?? cesta, jak se dostat do kl??tera.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_05");	//Nejjednodu??? bude p?idat se k domobran?.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_06");	//Kter? gild? d?? p?ednost?
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
	Info_AddChoice(DIA_Addon_Lares_Gilde,"Mus?m si to cel? je?t? jednou promyslet ...",DIA_Addon_Lares_Gilde_BACK);
	Info_AddChoice(DIA_Addon_Lares_Gilde,"M?gov? ohn?.",DIA_Addon_Lares_Gilde_KDF);
	Info_AddChoice(DIA_Addon_Lares_Gilde,"?old?ci.",DIA_Addon_Lares_Gilde_SLD);
	Info_AddChoice(DIA_Addon_Lares_Gilde,"Domobrana.",DIA_Addon_Lares_Gilde_MIL);
};

func void DIA_Addon_Lares_Gilde_BACK()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_BACK_15_00");	//Mus?m si to je?t? jednou promyslet ...
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_SLD()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_SLD_15_00");	//?old?ci.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_01");	//Jsem si jist, ?e Lee t? p?iv?t?.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_01");	//Nicm?n?, je tam test, zda-li jsi pou?iteln?.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_02");	//Navrhnul bych si pohovo?it si s Cordem na Onarov? farm?.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_02");	//M??e ti pomoct s testem.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_03");	//?ekni mu, ?e "?ije? pod m?mi ochran?mi k??dly". On to pochop?.
	RangerHelp_gildeSLD = TRUE;
	Log_CreateTopic(TOPIC_Addon_RangerHelpSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpSLD,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpSLD,"Lares v???, ?e Cord mi pom??e s p?ijet?m na farmu.");
	SC_KnowsCordAsRangerFromLares = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_MIL()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_MIL_15_00");	//Domobrana.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_01");	//(bav? se) ?, opravdu si to dok??u p?edstavit, jak si to u?ije?. ??kat jin?m lidem o z?konech, zat?mco bere? jejich pen?ze.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_02");	//Paladinov? maj? sv?j sklad na molu. D?stojn?k je m?j dobr? kamar?d.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_03");	//Mo?n? by ti pomohl. Jmenuje se Martin.
	Log_CreateTopic(TOPIC_Addon_RangerHelpMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpMIL,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpMIL,"Lares mi ?ekl, ?e d?stojn?k Martin mi pom??e p?idat se k domobran? mnohem rychleji. Obvykle b?v? v p??stavu tam, jak maj? paladinov? sv?j sklad.");
	RangerHelp_gildeMIL = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_KDF()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_KDF_15_00");	//M?gov? ohn?.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_01");	//(sm?je se) ?e to Vatras neo?ek?val? Jinak by t? za mnou asi neposlal.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_02");	//Kdy? se chce? p?idat ke kl??teru, vyjde t? to dost draho.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_03");	//Ti chl?p?ci t? nepust? dovnit?, pokud jim nezaplat?? poplatek.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_04");	//A jedin? osoba, kter? to m??e zm?nit je Vatras. Mysl?m, ?e bys s n?m m?l promluvit.
	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF,"Vatras v?, jak se snadno p?ipojit ke kl??teru.");
	RangerHelp_gildeKDF = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};


var int Lares_WorkForLee;
var int Lares_WayToOnar;

instance DIA_Lares_AboutSld(C_Info)
{
	npc = VLK_449_Lares;
	nr = 10;
	condition = DIA_Lares_AboutSld_Condition;
	information = DIA_Lares_AboutSld_Info;
	permanent = TRUE;
	description = "?ekni mi v?ce o Leem a jeho ?old?c?ch ...";
};


func int DIA_Lares_AboutSld_Condition()
{
	if((other.guild == GIL_NONE) && (Lares_WayToOnar == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_AboutSld_Info()
{
	AI_Output(other,self,"DIA_ADDON_Lares_AboutSld_15_00");	//?ekni mi v?ce o Leem a jeho ?old?c?ch ...
	AI_Output(self,other,"DIA_ADDON_Lares_AboutSld_09_01");	//Co bys r?d v?d?l?
	Info_ClearChoices(DIA_Lares_AboutSld);
	Info_AddChoice(DIA_Lares_AboutSld,Dialog_Back,DIA_Lares_AboutSld_BACK);
	Info_AddChoice(DIA_Lares_AboutSld,"A pro? teda nejsi s Leem a jeho ?old?kama?",DIA_Lares_AboutSld_WhyNotYou);
	Info_AddChoice(DIA_Lares_AboutSld,"?ekni mi o ?oldn???ch v?c.",DIA_Lares_AboutSld_Sld);
	Info_AddChoice(DIA_Lares_AboutSld,"Jak najdu farmu velkostatk??e?",DIA_Lares_AboutSld_WayToOnar);
};

func void DIA_Lares_AboutSld_BACK()
{
	Info_ClearChoices(DIA_Lares_AboutSld);
};

func void DIA_Lares_AboutSld_Sld()
{
	AI_Output(other,self,"DIA_Lares_AboutSld_15_00");	//?ekni mi o ?oldn???ch v?c.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_01");	//Fajn, jestli se? po??d tak tvrdej, jako jsi bejval, nem?l bys s nima m?t ??dnej probl?m.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_02");	//V?t?ina z nich jsou rv??i, a jestli se jim nebude? um?t postavit, daleko se nedostane?.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_03");	//(sm?ch) Jestli se? krapet p?ecitliv?lej, tak nem?? ?anci s nima vydr?et.
};

func void DIA_Lares_AboutSld_WhyNotYou()
{
	AI_Output(other,self,"DIA_Lares_WhyInCity_15_00");	//A pro? teda nejsi s Leem a jeho ?old?kama?
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_01");	//Ale v?dy? jsem! Jenom ne na farm?.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_02");	//D? se ??ct, ?e ho tady ve m?st? zastupuju. Nechceme, aby ta lo? odplula bez n?s.
	Lares_WorkForLee = TRUE;
	Info_AddChoice(DIA_Lares_AboutSld,"O jak? lodi jsi to mluvil?",DIA_Lares_AboutSld_Schiff);
};

func void DIA_Lares_AboutSld_Schiff()
{
	AI_Output(other,self,"DIA_Lares_Schiff_15_00");	//O jak? lodi jsi to mluvil?
	AI_Output(self,other,"DIA_Lares_Schiff_09_01");	//Je na otev?en? ??sti p??stavu za ?tesem. Lee se chce se svejma p?r lidma odsud v??n? dostat.
	AI_Output(self,other,"DIA_Lares_Schiff_09_02");	//Ale bude to chv?li trvat.
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//Pro??
	AI_Output(self,other,"DIA_Lares_Schiff_09_04");	//M?l by ses na to rad?j zeptat Leeho, kdy? ho potk??... M? dobrej pl?n.
};

func void DIA_Lares_AboutSld_WayToOnar()
{
	AI_Output(other,self,"DIA_Lares_WegZumHof_15_00");	//Jak najdu farmu velkostatk??e?
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_00");	//Je to velmi jednoduch?. Opus? m?sto v?chodn? branou a pak b?? na sever.
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_01");	//M??u ti uk?zat cestu, jestli chce?.
	Lares_WayToOnar = TRUE;
};


instance DIA_Lares_GuildOfThieves(C_Info)
{
	npc = VLK_449_Lares;
	nr = 14;
	condition = DIA_Lares_GuildOfThieves_Condition;
	information = DIA_Lares_GuildOfThieves_Info;
	permanent = FALSE;
	description = "V?? n?co o zlod?jsk?m cechu ve m?st??";
};


func int DIA_Lares_GuildOfThieves_Condition()
{
	if(MIS_Andre_GuildOfThieves == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lares_GuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Lares_GuildOfThieves_15_00");	//V?? n?co o zlod?jsk?m cechu ve m?st??
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_01");	//Ty tvoje ot?zky...
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_02");	//Samoz?ejm?, m?me tady zlod?jskej cech. Jako v ka?d?m v?t??m m?st?.
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_03");	//A ka?dej malej zlod?j??ek nebo ?melin?? je s n? n?jak propojenej.
};


instance DIA_Lares_WhereGuildOfThieves(C_Info)
{
	npc = VLK_449_Lares;
	nr = 15;
	condition = DIA_Lares_WhereGuildOfThieves_Condition;
	information = DIA_Lares_WhereGuildOfThieves_Info;
	permanent = FALSE;
	description = "V??, kde bych ten cech na?el?";
};


func int DIA_Lares_WhereGuildOfThieves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_GuildOfThieves) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_WhereGuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Lares_WhereGuildOfThieves_15_00");	//V??, kde bych ten cech na?el?
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_01");	//(sm?ch) Bez ur??ky, ale v?m jen to, ?e ti nesm?m nic ??ct.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_02");	//Tihle lid? na takov? v?ci v?t?inou reaguj? VELMI citliv?.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_03");	//Jestli se s nima chce? zapl?st, m?l bys b?t hodn? opatrn?.
};


instance DIA_Lares_GotKey(C_Info)
{
	npc = VLK_449_Lares;
	nr = 16;
	condition = DIA_Lares_GotKey_Condition;
	information = DIA_Lares_GotKey_Info;
	permanent = FALSE;
	description = "M?m tady tenhle kl??. Je celej zrezlej od mo?sk? vody.";
};


func int DIA_Lares_GotKey_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_WhereGuildOfThieves) && Npc_HasItems(other,ItKe_ThiefGuildKey_MIS) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_GotKey_Info()
{
	AI_Output(other,self,"DIA_Lares_GotKey_15_00");	//M?m tady tenhle kl??. Je celej zrezlej od mo?sk? vody.
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//Tak?e?
	AI_Output(other,self,"DIA_Lares_GotKey_15_02");	//M?m dojem, ?e by m? mohl dov?st k ?krytu zlod?jsk?ho cechu.
	AI_Output(self,other,"DIA_Lares_GotKey_09_03");	//Fajn, to by moh bejt kl?? od stok.
};


instance DIA_Lares_Kanalisation(C_Info)
{
	npc = VLK_449_Lares;
	nr = 17;
	condition = DIA_Lares_Kanalisation_Condition;
	information = DIA_Lares_Kanalisation_Info;
	permanent = FALSE;
	description = "Kde najdu ty stoky?";
};


func int DIA_Lares_Kanalisation_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_GotKey) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_Kanalisation_Info()
{
	AI_Output(other,self,"DIA_Lares_Kanalisation_15_00");	//Kde najdu ty stoky?
	AI_Output(self,other,"DIA_Lares_Kanalisation_09_01");	//Co j? v?m... v?t?inou ?st? do mo?e.
};


instance DIA_Lares_OtherGuild(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_OtherGuild_Condition;
	information = DIA_Lares_OtherGuild_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_OtherGuild_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild != GIL_NONE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_OtherGuild_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_00");	//Ty jsi te? v domobran?!
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_01");	//(sm?ch) To m? p?etrhne - bejvalej trestanec v domobran?...
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_02");	//Tak ty se? te? jedn?m z kr?lovsk?ch paladin?!
		};
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//(uli?nicky) N?co takov?ho m??e? prov?st jenom ty.
		if(Lares_WorkForLee == TRUE)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_04");	//(starostliv?) Nepr?skne? m? kv?li moj? spolupr?ci s Leem?
			AI_Output(other,self,"DIA_Lares_OtherGuild_15_05");	//V?ak m? zn??...
		};
	};
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06");	//Nerozum?m tomu. Vstoupil jsi do kl??tera. Jak? to tam je?
		AI_Output(other,self,"DIA_Lares_OtherGuild_15_07");	//Jin?.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_08");	//Nedovedu si to p?edstavit.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Addon_Lares_OtherGuild_09_00");	//Sly?el jsem, ?e t? Lee p?ijal.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_10");	//Gratuluju.
	};
};


instance DIA_Addon_Lares_Forest(C_Info)
{
	npc = VLK_449_Lares;
	nr = 9;
	condition = DIA_Addon_Lares_Forest_Condition;
	information = DIA_Addon_Lares_Forest_Info;
	description = "M??e? m? doprov?zet na cest? tamt?m hust?m lesem?";
};


func int DIA_Addon_Lares_Forest_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Forest_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_00");	//M??e? m? doprov?zet na cest? tamt?m hust?m lesem?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_01");	//Jist?, ale co chce? d?lat na takov?m m?st??
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_02");	//Nefarius mi ?ekl, abych se porozhl?dl po dal??ch ornamentech.
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_03");	//Jedno z m?st, abych ti ?ekl pravdu, je tam na v?chod? v tomto lese.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_04");	//Vid?m, dost nebezpe?n? pro jednoho, ?e?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_05");	//Bez probl?mu, prost? mi ?ekni, kam chce? j?t.
	RangerHelp_OrnamentForest = TRUE;
};


instance DIA_Lares_GoNow(C_Info)
{
	npc = VLK_449_Lares;
	nr = 10;
	condition = DIA_Lares_GoNow_Condition;
	information = DIA_Lares_GoNow_Info;
	permanent = TRUE;
	description = "Fajn, jdeme.";
};


func int DIA_Lares_GoNow_Condition()
{
	if(((Lares_WayToOnar == TRUE) || (MIS_Addon_Lares_Ornament2Saturas == LOG_Running) || (RangerHelp_OrnamentForest == TRUE)) && ((LaresGuide_ZumPortal == 0) || (LaresGuide_ZumPortal == 8)) && ((LaresGuide_ZuOnar == FALSE) || (LaresGuide_ZuOnar == LOG_SUCCESS)) && ((LaresGuide_OrnamentForest == 0) || (LaresGuide_OrnamentForest == 3)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lares_GoNow_GoingConditions()
{
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//Tak jdeme... Poj? za mnou.
	AI_StopProcessInfos(self);
	Lares_Guide = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	if(Npc_KnowsInfo(other,DIA_Moe_Hallo) == FALSE)
	{
		Npc_SetRefuseTalk(Moe,30);
	};
};

func void DIA_Lares_GoNow_Info()
{
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//Fajn, jdeme.
	if(Lares_CanBringScToPlaces == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_03");	//Nem??u opustit sv? m?sto, dokud nebudu m?t n?hradu za sebe nebo nevy?e??me z?hadu s mizen?m lid?.
	}
	else if(MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running)
	{
		B_Lares_Geheimtreffen();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_04");	//Kam?
		Info_ClearChoices(DIA_Lares_GoNow);
		Info_AddChoice(DIA_Lares_GoNow,Dialog_Back,DIA_Lares_GoNow_warte);
		if((Lares_WayToOnar == TRUE) && (LaresGuide_ZuOnar != LOG_SUCCESS))
		{
			Info_AddChoice(DIA_Lares_GoNow,"Na Onarovu farmu.",DIA_Lares_GoNow_Onar);
		};
		if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && (Lares_Angekommen == FALSE))
		{
			Info_AddChoice(DIA_Lares_GoNow,"Okay, vra?me Vatras?v ornament.",DIA_Lares_GoNow_Maya);
		};
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && (LaresGuide_OrnamentForest == 0) && (RangerHelp_OrnamentForest == TRUE))
		{
			Info_AddChoice(DIA_Lares_GoNow,"K hust?mu lesu na v?chod.",DIA_Lares_GoNow_Forest);
		};
	};
};

func void DIA_Lares_GoNow_Maya()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Maya_15_00");	//Okay, vra?me Vatras?v ornament.
	LaresGuide_ZumPortal = 1;
	Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL1");
	DIA_Lares_GoNow_GoingConditions();
};

func void DIA_Lares_GoNow_Onar()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Onar_15_00");	//Na Onarovu farmu.
	LaresGuide_ZuOnar = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	DIA_Lares_GoNow_GoingConditions();
};

func void DIA_Lares_GoNow_Forest()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Forest_15_00");	//K hust?mu lesu na v?chod.
	LaresGuide_OrnamentForest = 1;
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD1");
	DIA_Lares_GoNow_GoingConditions();
};

func void DIA_Lares_GoNow_warte()
{
	Info_ClearChoices(DIA_Lares_GoNow);
};


instance DIA_Lares_GUIDE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_GUIDE_Condition;
	information = DIA_Lares_GUIDE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_GUIDE_Condition()
{
	if((LaresGuide_ZuOnar == TRUE) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_BIGFARM_05"))
	{
		return TRUE;
	};
};

func void DIA_Lares_GUIDE_Info()
{
	if(Lares_Guide > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_00");	//Tak jsme tady.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_01");	//Tak tady jsi. U? jsem si za??nal myslet, ?e t? se?rali vlci.
	};
	AI_Output(self,other,"DIA_Lares_GUIDE_09_02");	//Tak?e d?l u? tref?? s?m. Mus?m se vr?tit do m?sta, m?m tam je?t? n?jak? vy?izov?n?.
	AI_Output(self,other,"DIA_Lares_GUIDE_09_03");	//Prost? pokra?uj po t?hle cest? d?l a pamatuj - va? si s?m sebe a nepod?lej se z ka?d? blbosti, pak to pro tebe bude hra?ka.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	LaresGuide_ZuOnar = LOG_SUCCESS;
};


instance DIA_Addon_Lares_ArrivedPortalInter1(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_ArrivedPortalInter1_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInter1_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInter1_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_TO_FOREST_11") && (LaresGuide_ZumPortal == 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInter1_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_00");	//Nyn?, kdy? jsme z m?sta venku a nikdo n?s nesleduje, r?d bych ti n?co ?ekl.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_01");	//Ornament p?edpokl?d?m vr?t?me Saturasovi. Vzpom?n?? si na n?j, ne?
	Info_ClearChoices(DIA_Addon_Lares_ArrivedPortalInter1);
	Info_AddChoice(DIA_Addon_Lares_ArrivedPortalInter1,"Jist?. On byl nejvy???m M?gem vody v Nov?m t?bo?e.",DIA_Addon_Lares_ArrivedPortalInter1_ja);
	Info_AddChoice(DIA_Addon_Lares_ArrivedPortalInter1,"Saturas? Kdo je to?",DIA_Addon_Lares_ArrivedPortalInter1_wer);
	LaresGuide_ZumPortal = 2;
};

func void DIA_Addon_Lares_ArrivedPortalInter1_teil2()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00");	//Pod?vej, my chlapi z Nov?ho t?bora m?me st?le dobr? vztahy s m?gy Vody.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01");	//Dokonce i Lee bude chr?nit m?gy Vody, bude-li to nezbytn?.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02");	//Str?vil jsem mnoho ?asu tady ve m?st? a spolupracoval s Vatrasem a udr?oval kontakt s m?gy Vody.
	B_MakeRangerReadyForMeeting(self);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03");	//A toto je brn?n?, kter? jsme dostali od m?g? Vody. "Kruh Vody" ho nosil je?t? p?ed v?lkou se sk?ety.
	if(Cavalorn_RangerHint == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04");	//Jak se dostal Cavalorn k v?m? Nevzpom?n?m si, ?e by pat?il k Nov?mu t?boru.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05");	//M?? pravdu, na?e spole?enstv? se rozrostlo. Dokonce ani j? nev?m, kolik n?s u? je.
	};
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06");	//Ale poj?me u?. R?d bych se dostal z tohoto m?sta. Mluvit m??eme cestou.
	Info_ClearChoices(DIA_Addon_Lares_ArrivedPortalInter1);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_wer()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00");	//Saturas? Kdo je to?
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01");	//Hmm, nejvy??? m?g Vody v Nov?m t?bo?e. Vr?til se zp?t z Hornick?ho ?dol?, kdy? bari?ra padla.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02");	//Lee a moje mali?kost jsme ud?lali dohodu s m?gy Vody a spojili sv? s?ly, abychom mohli vzdorovat Star?mu t?boru.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2();
};

func void DIA_Addon_Lares_ArrivedPortalInter1_ja()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00");	//Jist?. On byl nejvy???m m?gem Vody v Nov?m t?bo?e.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2();
};


instance DIA_Addon_Lares_ArrivedPortalInterWeiter(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERN_TO_FOREST_02") && (LaresGuide_ZumPortal == 2))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00");	//Co se d?je? Jsi v po??dku?
	if((MIS_Addon_Erol_BanditStuff == LOG_Running) && (Npc_GetDistToWP(Erol,"NW_TAVERN_TO_FOREST_03") < 1000) && (Npc_IsDead(Erol) == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01");	//Ten chl?pek tam m? probl?my s bandity.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02");	//(arogantn?) To je fakt p?kn? v?d?t, ale m?me m?lo ?asu.
	};
	LaresGuide_ZumPortal = 3;
};


instance DIA_Addon_Lares_ArrivedPortalInterWeiter2(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_TROLLAREA_14") && (LaresGuide_ZumPortal == 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00");	//Chlape, nevypr?ela u? na?e dohoda?
	LaresGuide_ZumPortal = 4;
};


instance DIA_Addon_Lares_ArrivedPortalInter2(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_ArrivedPortalInter2_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInter2_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInter2_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_PATH_58") && (LaresGuide_ZumPortal == 4))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInter2_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_00");	//M?gov? Vody jsou ?pln? napjat?. Kopou na severov?chod? u? t?dny. Nem?m potuchy, co tam hledaj?.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_01");	//Cel? zem se za?ala ot??sat, jako kdy? padla bari?ra.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_02");	//Jako ve zl?m snu se probudily kamenn? p???ery a za?to?ili na v?e, co se ocitlo v jejich bl?zkosti.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_03");	//M?gov? Vody na to dohl??? a zni?ili v?echny nep??telsk? potvory. A nyn? kopaj? kolem a hledaj? vysv?tlen? t?ch ud?lost?.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_04");	//Ale brzy to uvid?? na vlastn? o?i.
	LaresGuide_ZumPortal = 5;
	B_LogEntry(TOPIC_Addon_KDW,"Lares mi ?ekl o vykop?vk?ch m?g? vody. Zaznamenali tam divn? v?ci. Nejsp?? tam je zdroj tajemn?ch zem?t?esen? a kamenn?ch monster.");
};


instance DIA_Addon_Lares_ArrivedPortalInterWeiter3(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 200) && (LaresGuide_ZumPortal == 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00");	//Jsi v pohod??
	LaresGuide_ZumPortal = 6;
};


instance DIA_Addon_Lares_ArrivedPortalInterWeiter4(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_02") && (LaresGuide_ZumPortal == 6))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00");	//Bu? opatrn?, m??e to b?t odsud nebezpe?n?.
	LaresGuide_ZumPortal = 7;
};


instance DIA_Addon_Lares_ArrivedPortal(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_ArrivedPortal_Condition;
	information = DIA_Addon_Lares_ArrivedPortal_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortal_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_41") && (LaresGuide_ZumPortal == 7))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortal_Info()
{
	B_MakeRangerReadyToLeaveMeeting(self);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_00");	//A tak jsme tu.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_01");	//Vem ten ornament. M?gov? Vody tam n?kde mus? b?t. Dones ho k nim.
	B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_02");	//M?l bys be?et rovnou za Saturasem, pokud bys narazil na potvoru, kter? je siln?j?? ne? ty, a to tak rychle, jak jen bude? moci.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_03");	//On bude n?jak ovl?dat zv??ata. Mus?m se nyn? vr?tit.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_04");	//A je?t? jedna rada. Nepotloukej se tady kolem a be? s t?m rovnou za Saturasem.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_05");	//Uvid?me se.
	B_LogEntry(TOPIC_Addon_KDW,"Lares mi dal ornament do rukou. M?l bych ho doru?it m?gu vody Saturasovi.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	LaresGuide_ZumPortal = 8;
	Lares_Angekommen = TRUE;
};


instance DIA_Addon_Lares_Albern(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_Albern_Condition;
	information = DIA_Addon_Lares_Albern_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_Albern_Condition()
{
	if((Lares_Angekommen == TRUE) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RUINS_41") > 1000) && (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Albern_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_Albern_09_00");	//(v??n?) Konec srandy! Doru? ten ornament!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lares_GOFORESTPRE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_GOFORESTPRE_Condition;
	information = DIA_Addon_Lares_GOFORESTPRE_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_GOFORESTPRE_Condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_TO_FARM2_04") && (LaresGuide_OrnamentForest == 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_GOFORESTPRE_ja()
{
	B_MakeRangerReadyForMeeting(self);
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_ja_15_00");	//Ano.
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_ja_09_01");	//Dob?e m?j p??teli. N?sleduj m?. Odsud to bude o?kliv?.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD2");
	LaresGuide_OrnamentForest = 2;
};

func void DIA_Addon_Lares_GOFORESTPRE_nein()
{
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_nein_15_00");	//Ne, m??e? nyn? odej?t.
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_nein_09_01");	//H?d?m, ?e to tu skon?ilo. Dobr?, uvid?me se pozd?ji.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LaresGuide_OrnamentForest = 3;
};

func void DIA_Addon_Lares_GOFORESTPRE_Info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_00");	//Chce?, abych s tebou ?el do lesa?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_01");	//Mysl?? to v??n?? Ur?it? tam chce? j?t?
	};
	Info_ClearChoices(DIA_Addon_Lares_GOFORESTPRE);
	Info_AddChoice(DIA_Addon_Lares_GOFORESTPRE,"Ne, m??e? nyn? odej?t.",DIA_Addon_Lares_GOFORESTPRE_nein);
	Info_AddChoice(DIA_Addon_Lares_GOFORESTPRE,"Ano.",DIA_Addon_Lares_GOFORESTPRE_ja);
};


instance DIA_Addon_Lares_GOFOREST(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_GOFOREST_Condition;
	information = DIA_Addon_Lares_GOFOREST_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Lares_GOFOREST_Condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_FOREST_PATH_62") && (LaresGuide_OrnamentForest == 2) && Npc_IsDead(Stoneguardian_Ornament))
	{
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
		if(ORNAMENT_SWITCHED_FOREST == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Lares_GOFOREST_Info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		B_MakeRangerReadyToLeaveMeeting(self);
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_00");	//Dob?e, vypad? to, ?e jsem tu skon?il. Mysl?m, ?e u? to zvl?dne? i beze m?. ?as, abych od??el.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
		LaresGuide_OrnamentForest = 3;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_01");	//Posp??me, rad?ji bych tu dlouho nez?st?val.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Lares_PortalInterWEITER(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_PortalInterWEITER_Condition;
	information = DIA_Addon_Lares_PortalInterWEITER_Info;
	permanent = TRUE;
	description = "P?esta? ?vanit!";
};


func int DIA_Addon_Lares_PortalInterWEITER_Condition()
{
	if((LaresGuide_ZumPortal != 0) && (LaresGuide_ZumPortal != 8))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_PortalInterWEITER_Info()
{
	if(LaresGuide_ZumPortal == 4)
	{
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_00");	//P?esta? ?vanit!
	}
	else if(LaresGuide_ZumPortal == 6)
	{
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_01");	//(trochu rozmrzele) Ano, ano.
	};
	AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_02");	//Poj?me na to.
	if(LaresGuide_ZumPortal == 7)
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_03");	//Zpomal trochu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_04");	//Z?sta? za mnou.
	};
	AI_StopProcessInfos(self);
	if(LaresGuide_ZumPortal == 2)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL2");
	}
	else if(LaresGuide_ZumPortal == 3)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL3");
	}
	else if(LaresGuide_ZumPortal == 4)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL4");
	}
	else if(LaresGuide_ZumPortal == 5)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL5");
	}
	else if(LaresGuide_ZumPortal == 6)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL6");
	}
	else if(LaresGuide_ZumPortal == 7)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPELEND");
	};
};


instance DIA_Lares_DEX(C_Info)
{
	npc = VLK_449_Lares;
	nr = 20;
	condition = DIA_Lares_DEX_Condition;
	information = DIA_Lares_DEX_Info;
	permanent = FALSE;
	description = "M??e? m? n??emu nau?it?";
};


func int DIA_Lares_DEX_Condition()
{
	return TRUE;
};

func void DIA_Lares_DEX_Info()
{
	AI_Output(other,self,"DIA_Lares_DEX_15_00");	//M??e? m? n??emu nau?it?
	AI_Output(self,other,"DIA_Addon_Lares_DEX_Add_09_01");	//Jist?, m??u t? nau?it, jak se st?t obratn?j??m a siln?j??m.
	Lares_TeachDEX = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Lares mi m??e vylep?it obratnost a s?lu.");
};


var int Lares_MerkeDEX;
var int Lares_MerkeSTR;

instance DIA_Lares_TEACH(C_Info)
{
	npc = VLK_449_Lares;
	nr = 20;
	condition = DIA_Lares_TEACH_Condition;
	information = DIA_Lares_TEACH_Info;
	permanent = TRUE;
	description = "U? m?.";
};


func int DIA_Lares_TEACH_Condition()
{
	if(Lares_TeachDEX == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lares_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Teach_15_00");	//U? m?.
	Lares_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Lares_MerkeSTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACH_BACK()
{
	if(other.attribute[ATR_DEXTERITY] > Lares_MerkeDEX)
	{
		AI_Output(self,other,"DIA_Lares_TEACH_BACK_09_00");	//U? jsi se stal obratn?j??m.
	};
	if(other.attribute[ATR_STRENGTH] > Lares_MerkeSTR)
	{
		AI_Output(self,other,"DIA_Addon_Lares_TEACH_BACK_Add_09_00");	//(pochvaln?) Dob?e, tv? s?la se zlep?ila.
	};
	Info_ClearChoices(DIA_Lares_TEACH);
};

func void DIA_Lares_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACHSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_LOW);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACHSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_LOW);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};


instance DIA_Lares_Kap2_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap2_EXIT_Condition;
	information = DIA_Lares_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_Kap3_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap3_EXIT_Condition;
	information = DIA_Lares_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_AnyNews(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_AnyNews_Condition;
	information = DIA_Lares_AnyNews_Info;
	permanent = TRUE;
	description = "Co je nov?ho?";
};


func int DIA_Lares_AnyNews_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lares_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Lares_AnyNews_15_00");	//Co je nov?ho?
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_01");	//Za ty nejlep?? zpr?vy m??e? ty s?m. Nechali Benneta j?t, je zp?tky na farm?.
		AI_Output(self,other,"DIA_Lares_AnyNews_09_02");	//B?? za n?m, m?m dojem, ?e by ti cht?l pod?kovat osobn?.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_03");	//Dalo by se to tak ??ct. Paladinov? zab?sli Benneta, na?eho kov??e.
		if(MIS_RescueBennet == LOG_Running)
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_04");	//Sly?el jsem. Tak to je zl?.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_05");	//To mi pov?dej.
		}
		else
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_06");	//Jak se to stalo?
			AI_Output(self,other,"DIA_Lares_AnyNews_09_07");	//Bennet odjel do m?sta pro z?soby. No a u? se nevr?til.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_08");	//Jestli se chce? dozv?d?t v?c, promluv si s Hodgesem, byl ve m?st? s Bennetem.
			MIS_RescueBennet = LOG_Running;
		};
	};
};


instance DIA_Lares_NewsAboutBennet(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = DIA_Lares_NewsAboutBennet_Condition;
	information = DIA_Lares_NewsAboutBennet_Info;
	permanent = FALSE;
	description = "N?jak? zpr?vy o Bennetovi?";
};


func int DIA_Lares_NewsAboutBennet_Condition()
{
	if(MIS_RescueBennet == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lares_NewsAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_00");	//N?jak? zpr?vy o Bennetovi?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_01");	//Vypad? to, ?e ho vzali do kas?ren a str?ili do ?al??e.
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_02");	//Jak ho odtamtud m??eme dostat?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_03");	//Tak to v?bec netu??m. Nem??u se dostat ani k n?mu do cely, abych si s n?m promluvil.
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_04");	//V?echno, co zm??u, je m?t o?i na stopk?ch. Ale asi toho stejn? moc nevykouk?m.
};


instance DIA_Lares_Kap4_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap4_EXIT_Condition;
	information = DIA_Lares_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_Kap4_PERM(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = DIA_Lares_Kap4_PERM_Condition;
	information = DIA_Lares_Kap4_PERM_Info;
	permanent = TRUE;
	description = "Pro? nejsi venku a nelov?? draky?";
};


func int DIA_Lares_Kap4_PERM_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap4_PERM_Info()
{
	AI_Output(other,self,"DIA_Lares_Kap4_PERM_15_00");	//Pro? nejsi venku a nelov?? draky?
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_01");	//O takov? v?ci se nestar?m, p?enech?v?m je ostatn?m.
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_02");	//Hmmm. ?erstv? mo?sk? vzduch - to je p?esn? to, co jsem pot?eboval.
};


instance DIA_Lares_Kap5_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap5_EXIT_Condition;
	information = DIA_Lares_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_KnowWhereEnemy(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_KnowWhereEnemy_Condition;
	information = DIA_Lares_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Necht?l bys opustit tenhle ostrov?";
};


func int DIA_Lares_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lares_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_00");	//Necht?l bys opustit tenhle ostrov?
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_01");	//V?c ne? cokoli jin?ho. Cos myslel?
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_02");	//Zjistil jsem, kde se ukr?v? v?dce drak?. Je na ostrov?, nedaleko odsud.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_03");	//Chci se ho jednou prov?dy zbavit.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_04");	//Spr?vn? slova. Jestli m? bude? pot?ebovat, jdu do toho.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_05");	//M??e? na sv?ch cest?ch pot?ebovat n?koho, kde t? nau?? posilovat obratnost nebo boj jednoru?n?mi zbran?mi?
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_06");	//Lo? u? je pln?, ale kdyby se n?co zm?nilo, d?m v?d?t.
	}
	else
	{
		Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy,"K ni?emu bys mi nebyl.",DIA_Lares_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy,"V?d?l jsem, ?e se na tebe m??u spolehnout.",DIA_Lares_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lares_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_00");	//V?d?l jsem, ?e se na tebe m??u spolehnout.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_01");	//V?ichni se sejdeme na lodi.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02");	//Mu?i ?inu, tak to m?m r?d. Je?t? se uvid?me.
	Lares_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
};

func void DIA_Lares_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_No_15_00");	//Cen?m si tv? nab?dky, ale nem?m, jak bych t? vyu?il.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_No_09_01");	//S?m mus?? v?d?t, co chce?. Pokud si o tom bude? cht?t promluvit pozd?ji, v??, kde m? najde?.
	if(hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	};
	Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
};


instance DIA_Lares_LeaveMyShip(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_LeaveMyShip_Condition;
	information = DIA_Lares_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Bude lep??, kdy? nepopluje?.";
};


func int DIA_Lares_LeaveMyShip_Condition()
{
	if((Lares_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Lares_LeaveMyShip_15_00");	//Bude lep??, kdy? nepopluje?.
	AI_Output(self,other,"DIA_Lares_LeaveMyShip_09_01");	//Jak chce?, ale pak si vzpome?, kdo komu co sliboval.
	if(hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	};
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lares_StillNeedYou(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_StillNeedYou_Condition;
	information = DIA_Lares_StillNeedYou_Info;
	permanent = TRUE;
	description = "Je?t? po??d bys m?l z?jem o tu cestu?";
};


func int DIA_Lares_StillNeedYou_Condition()
{
	if(((Lares_IsOnBoard == LOG_OBSOLETE) || (Lares_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Lares_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//Je?t? po??d bys m?l z?jem o tu cestu?
	if(Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_01");	//Norm?ln? nenech?v?m jen tak n?koho, aby se mnou takhle jednal, ale jeliko? jsi jedn?m z n?s, nech?m t? j?t.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_02");	//Uvid?me se na lodi.
		Lares_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		if(MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_03");	//Neber si to n?jak osobn?, ale asi jsi m?l pravdu.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_04");	//Bude lep??, kdy? z?stanu tady.
		AI_StopProcessInfos(self);
	};
};

