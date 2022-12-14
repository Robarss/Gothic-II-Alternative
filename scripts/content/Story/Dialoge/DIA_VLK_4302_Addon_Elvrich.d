
instance DIA_Addon_Elvrich_EXIT(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 999;
	condition = DIA_Addon_Elvrich_EXIT_Condition;
	information = DIA_Addon_Elvrich_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Elvrich_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Elvrich_PICKPOCKET(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 900;
	condition = DIA_Addon_Elvrich_PICKPOCKET_Condition;
	information = DIA_Addon_Elvrich_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Elvrich_PICKPOCKET_Condition()
{
	return C_Beklauen(62,110);
};

func void DIA_Addon_Elvrich_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Elvrich_PICKPOCKET,Dialog_Back,DIA_Addon_Elvrich_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Elvrich_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Elvrich_PICKPOCKET_DoIt);
};

func void DIA_Addon_Elvrich_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
};

func void DIA_Addon_Elvrich_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
};


instance DIA_Addon_Elvrich_BanditsThere(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_BanditsThere_Condition;
	information = DIA_Addon_Elvrich_BanditsThere_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Elvrich_BanditsThere_NoPerm;

func int DIA_Addon_Elvrich_BanditsThere_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Addon_Elvrich_BanditsThere_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_BanditsThere_Info()
{
	if(Npc_IsDead(BDT_10307_Addon_RangerBandit_M) && Npc_IsDead(BDT_10308_Addon_RangerBandit_L) && Npc_IsDead(BDT_10309_Addon_RangerBandit_L) && Npc_IsDead(BDT_10310_Addon_RangerBandit_M))
	{
		AI_Output(self,other,"DIA_Addon_Elvrich_BanditsThere_04_00");	//D?ky Bohu. Banditi u? nejsou.
		DIA_Addon_Elvrich_BanditsThere_NoPerm = TRUE;
		self.aivar[AIV_NoFightParker] = FALSE;
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Elvrich_Wer(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_Wer_Condition;
	information = DIA_Addon_Elvrich_Wer_Info;
	description = "Kdo jsi?";
};


func int DIA_Addon_Elvrich_Wer_Condition()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_Wer_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_01");	//Jmenuji se Elvrich. Jsem z m?sta.
	if(MIS_Thorben_BringElvrichBack == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_02");	//Mistr Thorben mi ?ekl, ?e jsi zmizel.
	};
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_03");	//Tito stra?n? lid? m? sem dot?hli a dr?eli m? tu jako v?zn?.
};


instance DIA_Addon_Elvrich_MissingPeople(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_MissingPeople_Condition;
	information = DIA_Addon_Elvrich_MissingPeople_Info;
	description = "Hodn? lid? tady ve m?st? chyb?.";
};


func int DIA_Addon_Elvrich_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_Wer) && (SC_HearedAboutMissingPeople == TRUE) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_MissingPeople_15_00");	//Hodn? lid? tady ve m?st? chyb?.
	AI_Output(self,other,"DIA_Addon_Elvrich_MissingPeople_04_01");	//O tom nev?m nic. M??u ti jenom ??ct, co se stalo M?.
};


instance DIA_Addon_Elvrich_WhatExactly(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WhatExactly_Condition;
	information = DIA_Addon_Elvrich_WhatExactly_Info;
	description = "Co se ti p?esn? stalo?";
};


func int DIA_Addon_Elvrich_WhatExactly_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_Wer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WhatExactly_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_15_00");	//Co se ti p?esn? stalo?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_01");	//?el jsem na sch?zku s holkou.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_02");	//Jmenuje se Lucie. M?li jsme v pl?nu ut?ct do hor. Pry? z m?sta a ode v?ech, co tam ?ij?.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_03");	//Jen co jsem dorazil na m?sto, vyvalilo se z k?ov? n?kolik bandit? a oba n?s zajali.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_04");	//Samoz?ejm? jsem bojoval, ale bylo to k ni?emu. Bylo jich p??li? mnoho. Nem?l jsem ?anci.
	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Co od tebe banditi cht?li?",DIA_Addon_Elvrich_WhatExactly_Want);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Pov?z mi o Lucii.",DIA_Addon_Elvrich_WhatExactly_lucia);
};

func void DIA_Addon_Elvrich_WhatExactly_Want()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Want_15_00");	//Co od tebe banditi cht?li?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Want_04_01");	//N?kdy, v noci, se mi poda?ilo je odpslouch?vat. Nerozumn?l jsem tomu dob?e, ale mysl?m, ?e n?s cht?li zotro?it.
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Kam v?s cht?li odvl?ct?",DIA_Addon_Elvrich_WhatExactly_Pirates);
};

func void DIA_Addon_Elvrich_WhatExactly_Pirates()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Pirates_15_00");	//Kam v?s cht?li odvl?ct?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_01");	//N?kam na ostrov Khorinisu. Ale podle m? se tam nejde dostat bez lodi.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_02");	//Odvedli m? na jak?si kotvi?t? na pob?e??. T?bo?ili tam n?jac? pir?ti.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_03");	//Jeden z bandit? ?el nap?ed n?co vyjednat a s t?mi pir?ty. M?li prudk? argumenty.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_04");	//Mysl?m, ?e banditi cht?li, aby je pir?ti p?evezli a m? s nima.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_05");	//Ale pir?ti s t?m mysl?m nesouhlasili. Nakonec se banditi vr?tili sem a od t? doby tady sed?me.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_06");	//Vypadali p?kn? bezradn?. A pak ses objevil ty.
	Elvrich_SCKnowsPirats = TRUE;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Elvrich, u?edn?k truhl??e Thorbena byl unesen bandity. Vypad? to, ?e pir?ti se s bandity moc r?di nemaj?.");
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Pir?ti v Khorinisu?",DIA_Addon_Elvrich_WhatExactly_Here);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Kde maj? pir?ti svou skr???",DIA_Addon_Elvrich_WhatExactly_pirat);
};

func void DIA_Addon_Elvrich_WhatExactly_Here()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Here_15_00");	//Pir?ti v Khorinisu?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_01");	//Moc o nich nev?m. Na tom kotvi?ti jsem je vid?l poprv?.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_02");	//V?dycky stoj? v pozad?. Ka?d? z nich je hledan? zlo?inec v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_03");	//Boj? se ?ibenice. Proto je nikdy neuvid?? ve m?st?.
};

func void DIA_Addon_Elvrich_WhatExactly_lucia()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_lucia_15_00");	//Pov?z mi o Lucii.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_lucia_04_01");	//Holka z p??stavu. Pracovala pro toho teplou?e Bromora. Je velmi p?kn?.
};

func void DIA_Addon_Elvrich_WhatExactly_pirat()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_pirat_15_00");	//Kde maj? pir?ti svou skr???
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_01");	//Nen? to daleko od p??stavu v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_02");	//Kdy? stoj?? na molu a d?v?? se na mo?e, tak vem ?lun a vesluj pod?l pob?e?? na prav? stran?.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_03");	//Prvn? mal? z?toka, kterou projede? by to m?la b?t.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Abych na?el skr?? pir?t?, mus?m j?t nejprve do p??stavu v Khorinisu. Jakmile budu st?t na molu, ?elem k mo?i, mus?m plavat po pob?e?? na prav? stran?.");
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,Dialog_Back,DIA_Addon_Elvrich_WhatExactly_Back);
};

func void DIA_Addon_Elvrich_WhatExactly_Back()
{
	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
};


instance DIA_Addon_Elvrich_Bromor(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_Bromor_Condition;
	information = DIA_Addon_Elvrich_Bromor_Info;
	description = "Bromor ??kal, ?e mu Lucia ukradla zlatou misu ...";
};


func int DIA_Addon_Elvrich_Bromor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_Bromor_LuciaStoleGold == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_Bromor_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Bromor_15_00");	//Bromor ??kal, ?e mu Lucia ukradla zlatou misu ...
	AI_Output(self,other,"DIA_Addon_Elvrich_Bromor_04_01");	//No, pokud Lucie opravdu n?co ukradla, tak j? to bandit? ur?it? sebrali.
	Log_CreateTopic(TOPIC_Addon_BromorsGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold,LOG_Running);
	B_LogEntry(TOPIC_Addon_BromorsGold,"Bromorova zlat? misa je nejsp??e u bandit? v severn?m lese za Sekobovou farmou.");
};


instance DIA_Addon_Elvrich_WhereIsLucia(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WhereIsLucia_Condition;
	information = DIA_Addon_Elvrich_WhereIsLucia_Info;
	description = "Kde je Lucie te??";
};


func int DIA_Addon_Elvrich_WhereIsLucia_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_LuciasLetter != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WhereIsLucia_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhereIsLucia_15_00");	//Kde je Lucie te??
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_01");	//Na?e cesty se rozd?lili na velk? k?i?ovatce u Onarovy farmy.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_02");	//Banditi ji odvlekli do lesa za Sekobovu farmu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_03");	//Innos ji chra?.
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Lucie byla odvle?ena bandity do lesa za Sekobovou farmou n?kde na severu.");
	SC_KnowsLuciaCaughtByBandits = TRUE;
};


instance DIA_Addon_Elvrich_FernandosWaffen(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_FernandosWaffen_Condition;
	information = DIA_Addon_Elvrich_FernandosWaffen_Info;
	description = "To jsou ti banditi, co obdr?eli tu dod?vku zbran??";
};


func int DIA_Addon_Elvrich_FernandosWaffen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_FernandosWaffen_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_FernandosWaffen_15_00");	//To jsou ti banditi, co obdr?eli tu dod?vku zbran??
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_01");	//Jo. Na mou du?i, m?li probl?my ji celou un?st.
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_02");	//Utekli za tu farmu a v?echno vzali s sebou.
	B_GivePlayerXP(XP_Ambient);
	Log_CreateTopic(TOPIC_Addon_Bandittrader,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Bandittrader,LOG_Running);
	B_LogEntry(TOPIC_Addon_Bandittrader,"Badndit?, kte?? obdr?eli velkou dod?vku zbran? se skr?vaj? n?kde za Sekobovou farmou na severu. ");
};


instance DIA_Addon_Elvrich_LuciaLetter(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 4;
	condition = DIA_Addon_Elvrich_LuciaLetter_Condition;
	information = DIA_Addon_Elvrich_LuciaLetter_Info;
	description = "Na?el jsem dopis od Lucie.";
};


func int DIA_Addon_Elvrich_LuciaLetter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && Npc_HasItems(other,ItWr_LuciasLoveLetter_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_LuciaLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_LuciaLetter_15_00");	//Na?el jsem dopis od Lucie.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_01");	//(rozru?en?) Co? Dej to sem!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_02");	//(v zoufalstv?) NE! Tomu nev???m. Ne. To nem??e b?t pravda.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_03");	//(v zoufalstv?) Nemohla m? takhle opustit.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_04");	//(v zoufalstv?) Vezmi si ten dopis zp?tky. Nechci ho. Pevn? v???m, ?e se jednoho dne vr?t?.
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Elvrich nechce uv??it, ?e Lucie ?la s bandity dobrovoln?. Po??d douf?, ?e se vr?t?, navzdory jej?ho dopisu na rozlou?enou.");
	B_GivePlayerXP(XP_Addon_LuciasLetter);
	MIS_LuciasLetter = LOG_SUCCESS;
};


instance DIA_Addon_Elvrich_WasNun(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WasNun_Condition;
	information = DIA_Addon_Elvrich_WasNun_Info;
	permanent = FALSE;
	description = "M?l by ses vr?tit do m?sta!";
};


func int DIA_Addon_Elvrich_WasNun_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhereIsLucia))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WasNun_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_00");	//M?l by ses vr?tit do m?sta!
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_01");	//A co sis myslel, ?e bych d?lal? P?jdu rovnou zp?tky k mistru Thorbenovi.
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_02");	//Bude? hledat bandity?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_03");	//No, h?dal bych ?e asi jo ...
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_04");	//Pokud bys na?el Lucii, vzal bys ji bezpe?n? zp?t do m?sta, ?e jo?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_05");	//Uvid?m, co se d? d?lat.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Elvrich se vr?til ke sv?mu truhl??sk?mu mistrovi Thorbenovi.");
	Elvrich_GoesBack2Thorben = TRUE;
	Npc_ExchangeRoutine(self,"BACKINTHECITY");
	EquipItem(self,ItMw_1h_Bau_Mace);
};


instance DIA_Addon_Elvrich_PERM(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_PERM_Condition;
	information = DIA_Addon_Elvrich_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Elvrich_PERM_Condition()
{
	if((Elvrich_GoesBack2Thorben == TRUE) && Npc_IsInState(self,ZS_Talk) && (MIS_LuciasLetter != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_PERM_Info()
{
	AI_Output(self,other,"DIA_Addon_Elvrich_PERM_04_00");	//D?kuji ti za z?chranu!
};

