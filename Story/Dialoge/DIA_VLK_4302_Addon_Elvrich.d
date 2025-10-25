
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
		AI_Output(self,other,"DIA_Addon_Elvrich_BanditsThere_04_00");	//Díky Bohu. Banditi už nejsou.
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
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_01");	//Jmenuji se Elvrich. Jsem z města.
	if(MIS_Thorben_BringElvrichBack == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_02");	//Mistr Thorben mi řekl, že jsi zmizel.
	};
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_03");	//Tito strašní lidé mě sem dotáhli a drželi mě tu jako vězně.
};


instance DIA_Addon_Elvrich_MissingPeople(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_MissingPeople_Condition;
	information = DIA_Addon_Elvrich_MissingPeople_Info;
	description = "Hodně lidí tady ve městě chybí.";
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
	AI_Output(other,self,"DIA_Addon_Elvrich_MissingPeople_15_00");	//Hodně lidí tady ve městě chybí.
	AI_Output(self,other,"DIA_Addon_Elvrich_MissingPeople_04_01");	//O tom nevím nic. Můžu ti jenom říct, co se stalo MĚ.
};


instance DIA_Addon_Elvrich_WhatExactly(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WhatExactly_Condition;
	information = DIA_Addon_Elvrich_WhatExactly_Info;
	description = "Co se ti přesně stalo?";
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
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_15_00");	//Co se ti přesně stalo?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_01");	//Šel jsem na schůzku s holkou.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_02");	//Jmenuje se Lucie. Měli jsme v plánu utéct do hor. Pryč z města a ode všech, co tam žijí.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_03");	//Jen co jsem dorazil na místo, vyvalilo se z křoví několik banditů a oba nás zajali.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_04");	//Samozřejmě jsem bojoval, ale bylo to k ničemu. Bylo jich příliš mnoho. Neměl jsem šanci.
	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Co od tebe banditi chtěli?",DIA_Addon_Elvrich_WhatExactly_Want);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Pověz mi o Lucii.",DIA_Addon_Elvrich_WhatExactly_lucia);
};

func void DIA_Addon_Elvrich_WhatExactly_Want()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Want_15_00");	//Co od tebe banditi chtěli?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Want_04_01");	//Někdy, v noci, se mi podařilo je odpslouchávat. Nerozumněl jsem tomu dobře, ale myslím, že nás chtěli zotročit.
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Kam vás chtěli odvléct?",DIA_Addon_Elvrich_WhatExactly_Pirates);
};

func void DIA_Addon_Elvrich_WhatExactly_Pirates()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Pirates_15_00");	//Kam vás chtěli odvléct?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_01");	//Někam na ostrov Khorinisu. Ale podle mě se tam nejde dostat bez lodi.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_02");	//Odvedli mě na jakési kotviště na pobřeží. Tábořili tam nějací piráti.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_03");	//Jeden z banditů šel napřed něco vyjednat a s těmi piráty. Měli prudké argumenty.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_04");	//Myslím, že banditi chtěli, aby je piráti převezli a mě s nima.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_05");	//Ale piráti s tím myslím nesouhlasili. Nakonec se banditi vrátili sem a od té doby tady sedíme.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_06");	//Vypadali pěkně bezradní. A pak ses objevil ty.
	Elvrich_SCKnowsPirats = TRUE;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Elvrich, učedník truhláře Thorbena byl unesen bandity. Vypadá to, že piráti se s bandity moc rádi nemají.");
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Piráti v Khorinisu?",DIA_Addon_Elvrich_WhatExactly_Here);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Kde mají piráti svou skrýš?",DIA_Addon_Elvrich_WhatExactly_pirat);
};

func void DIA_Addon_Elvrich_WhatExactly_Here()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Here_15_00");	//Piráti v Khorinisu?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_01");	//Moc o nich nevím. Na tom kotvišti jsem je viděl poprvé.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_02");	//Vždycky stojí v pozadí. Každý z nich je hledaný zločinec v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_03");	//Bojí se šibenice. Proto je nikdy neuvidíš ve městě.
};

func void DIA_Addon_Elvrich_WhatExactly_lucia()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_lucia_15_00");	//Pověz mi o Lucii.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_lucia_04_01");	//Holka z přístavu. Pracovala pro toho teplouše Bromora. Je velmi pěkná.
};

func void DIA_Addon_Elvrich_WhatExactly_pirat()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_pirat_15_00");	//Kde mají piráti svou skrýš?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_01");	//Není to daleko od přístavu v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_02");	//Když stojíš na molu a díváš se na moře, tak vem člun a vesluj podél pobřeží na pravé straně.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_03");	//První malá zátoka, kterou projedeš by to měla být.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Abych našel skrýš pirátů, musím jít nejprve do přístavu v Khorinisu. Jakmile budu stát na molu, čelem k moři, musím plavat po pobřeží na pravé straně.");
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
	description = "Bromor říkal, že mu Lucia ukradla zlatou misu ...";
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
	AI_Output(other,self,"DIA_Addon_Elvrich_Bromor_15_00");	//Bromor říkal, že mu Lucia ukradla zlatou misu ...
	AI_Output(self,other,"DIA_Addon_Elvrich_Bromor_04_01");	//No, pokud Lucie opravdu něco ukradla, tak jí to bandité určitě sebrali.
	Log_CreateTopic(TOPIC_Addon_BromorsGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold,LOG_Running);
	B_LogEntry(TOPIC_Addon_BromorsGold,"Bromorova zlatá misa je nejspíše u banditů v severním lese za Sekobovou farmou.");
};


instance DIA_Addon_Elvrich_WhereIsLucia(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WhereIsLucia_Condition;
	information = DIA_Addon_Elvrich_WhereIsLucia_Info;
	description = "Kde je Lucie teď?";
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
	AI_Output(other,self,"DIA_Addon_Elvrich_WhereIsLucia_15_00");	//Kde je Lucie teď?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_01");	//Naše cesty se rozdělili na velké křižovatce u Onarovy farmy.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_02");	//Banditi ji odvlekli do lesa za Sekobovu farmu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_03");	//Innos ji chraň.
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Lucie byla odvlečena bandity do lesa za Sekobovou farmou někde na severu.");
	SC_KnowsLuciaCaughtByBandits = TRUE;
};


instance DIA_Addon_Elvrich_FernandosWaffen(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_FernandosWaffen_Condition;
	information = DIA_Addon_Elvrich_FernandosWaffen_Info;
	description = "To jsou ti banditi, co obdrželi tu dodávku zbraní?";
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
	AI_Output(other,self,"DIA_Addon_Elvrich_FernandosWaffen_15_00");	//To jsou ti banditi, co obdrželi tu dodávku zbraní?
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_01");	//Jo. Na mou duši, měli problémy ji celou unést.
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_02");	//Utekli za tu farmu a všechno vzali s sebou.
	B_GivePlayerXP(XP_Ambient);
	Log_CreateTopic(TOPIC_Addon_Bandittrader,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Bandittrader,LOG_Running);
	B_LogEntry(TOPIC_Addon_Bandittrader,"Badndité, kteří obdrželi velkou dodávku zbraní se skrývají někde za Sekobovou farmou na severu. ");
};


instance DIA_Addon_Elvrich_LuciaLetter(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 4;
	condition = DIA_Addon_Elvrich_LuciaLetter_Condition;
	information = DIA_Addon_Elvrich_LuciaLetter_Info;
	description = "Našel jsem dopis od Lucie.";
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
	AI_Output(other,self,"DIA_Addon_Elvrich_LuciaLetter_15_00");	//Našel jsem dopis od Lucie.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_01");	//(rozrušeně) Co? Dej to sem!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_02");	//(v zoufalství) NE! Tomu nevěřím. Ne. To nemůže být pravda.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_03");	//(v zoufalství) Nemohla mě takhle opustit.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_04");	//(v zoufalství) Vezmi si ten dopis zpátky. Nechci ho. Pevně věřím, že se jednoho dne vrátí.
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Elvrich nechce uvěřit, že Lucie šla s bandity dobrovolně. Pořád doufá, že se vrátí, navzdory jejího dopisu na rozloučenou.");
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
	description = "Měl by ses vrátit do města!";
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
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_00");	//Měl by ses vrátit do města!
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_01");	//A co sis myslel, že bych dělal? Půjdu rovnou zpátky k mistru Thorbenovi.
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_02");	//Budeš hledat bandity?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_03");	//No, hádal bych že asi jo ...
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_04");	//Pokud bys našel Lucii, vzal bys ji bezpečně zpět do města, že jo?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_05");	//Uvidím, co se dá dělat.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Elvrich se vrátil ke svému truhlářskému mistrovi Thorbenovi.");
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
	AI_Output(self,other,"DIA_Addon_Elvrich_PERM_04_00");	//Děkuji ti za záchranu!
};

