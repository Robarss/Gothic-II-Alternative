
instance DIA_Addon_Greg_EXIT(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 999;
	condition = DIA_Addon_Greg_EXIT_Condition;
	information = DIA_Addon_Greg_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_PICKPOCKET(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 900;
	condition = DIA_Addon_Greg_PICKPOCKET_Condition;
	information = DIA_Addon_Greg_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Addon_Greg_PICKPOCKET_Condition()
{
	return C_Beklauen(111,666);
};

func void DIA_Addon_Greg_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,Dialog_Back,DIA_Addon_Greg_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Greg_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};

func void DIA_Addon_Greg_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};


instance DIA_Addon_Greg_ImNew(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = DIA_Addon_Greg_ImNew_Condition;
	information = DIA_Addon_Greg_ImNew_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_ImNew_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_00");	//(hrozivě) Hej ty. Co děláš v mé chatrči?
	AI_Output(other,self,"DIA_Addon_Greg_Hello_15_01");	//Já ...
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_02");	//(zuřivě) Odejdu jen na pár dní a každý si myslí, že si může dělat, co chce.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_03");	//Co se tady vlastně děje?
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_04");	//Co, palisáda ještě není dokončena? Kaňon oplýva potvorama a každý má pohodu!!!
	GregIsBack = TRUE;
	if(!Npc_IsDead(Francis))
	{
		AI_TurnToNPC(self,Francis);
		AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_05");	//(řve) Je to všechno, co jsi udělal Francisi?
		if(C_BodyStateContains(Francis,BS_SIT))
		{
			AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_06");	//(řve) Jdi z mé lavice, HNED!
		};
	};
	Npc_ExchangeRoutine(self,"HOME");
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_07");	//A TY? Co jsi TY dělal?
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
	Info_AddChoice(DIA_Addon_Greg_ImNew,"Nic moc.",DIA_Addon_Greg_ImNew_nich);
	if((Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1) && Npc_IsDead(BeachShadowbeast1) && (MIS_Addon_MorganLurker != 0)) || (C_TowerBanditsDead() == TRUE))
	{
		Info_AddChoice(DIA_Addon_Greg_ImNew,"Pracoval.",DIA_Addon_Greg_ImNew_turm);
	};
};

func void B_UseRakeBilanz()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_00");	//Nevěřil jsem ani na chvíli, že bys na mně zapomněl.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_01");	//Ty věci měly hodnotu několika stovek zlaťáků, které jsem ukryl v Khorinisu.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_02");	//Ty jsi je prostě všechny vzal, co?
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_03");	//Budeš si muset odpracovat dluh.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_04");	//Brzy pochopíš, co to znamená práce.
	};
	if(!Npc_IsDead(Francis))
	{
		Npc_ExchangeRoutine(Francis,"GREGISBACK");
		AI_StartState(Francis,ZS_Saw,1,"ADW_PIRATECAMP_BEACH_19");
		Francis_ausgeschissen = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
};

func void DIA_Addon_Greg_ImNew_nich()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_nich_15_00");	//Nic moc.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_nich_01_01");	//To nevadí. Najdu pro tebe něco vhodného, chlapče.
	B_UseRakeBilanz();
};

func void DIA_Addon_Greg_ImNew_turm()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_00");	//Pracoval.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_01");	//Tak takhle? Co?
	if(C_TowerBanditsDead() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_02");	//Dostal jsem bandity z věže.
	};
	if(Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1) && (MIS_Addon_MorganLurker != 0))
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_03");	//Pláž na severu je vyčištěná od potvor.
	};
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_04");	//Dobrá. To je začátek.
	B_UseRakeBilanz();
};


instance DIA_Addon_Greg_JoinPirates(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_JoinPirates_Condition;
	information = DIA_Addon_Greg_JoinPirates_Info;
	permanent = FALSE;
	description = "Co mám dělat?";
};


func int DIA_Addon_Greg_JoinPirates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_ImNew) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_JoinPirates_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_15_00");	//Co mám udělat?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_01");	//První ze všeho musíme do tohohle místa vnést trochu života.
	if(Npc_IsDead(Morgan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_02");	//Morgan, ten líný blb, bude poslán řezat fošny.
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_03");	//TY se postaráš o Morganovu práci a vyčístíš kaňon od těch krvelačných potvor.
	MIS_Addon_Greg_ClearCanyon = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_ClearCanyon,LOG_Running);
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Greg chce, abych vzal Morganův ůkol a vyčistil kaňon od potvor.");
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"Pak tedy jdu.",DIA_Addon_Greg_JoinPirates_Leave);
	if((Npc_IsDead(Brandon) == FALSE) || (Npc_IsDead(Matt) == FALSE))
	{
		Info_AddChoice(DIA_Addon_Greg_JoinPirates,"Mám to udělat sám?",DIA_Addon_Greg_JoinPirates_Compadres);
	};
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"Jaké potvory?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

func void DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00");	//Pak tedy jdu.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01");	//Drž se. Teď jsi jeden z nás.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02");	//Vem si nějaké lepší oblečení na lov.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03");	//Tady je jedno z našich brnění. Vypadá to, že ti sedne.
	CreateInvItems(self,ITAR_PIR_L_Addon,1);
	B_GiveInvItems(self,other,ITAR_PIR_L_Addon,1);
	AI_EquipArmor(hero,ITAR_PIR_L_Addon);
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04");	//A neflákej se s tím, jasné?
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
};


instance DIA_ADDON_GREG_SELLWHAT(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = dia_addon_greg_sellwhat_condition;
	information = dia_addon_greg_sellwhat_info;
	permanent = FALSE;
	description = "Neměl bys pro mě lepší zbroj?";
};


func int dia_addon_greg_sellwhat_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_JoinPirates))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_addon_greg_sellwhat_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_SellWhat_15_00");	//Neměl bys pro mě lepší zbroj?
	AI_Output(self,other,"DIA_Addon_Greg_SellWhat_09_01");	//Ano ale ne zadarmo jestli chceš něco lepšího tak za 600 zlatých, nejsem charita.
};


var int addon_greg_leatherbought;

instance DIA_ADDON_GREG_LEATHER(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 650;
	condition = dia_addon_greg_leather_condition;
	information = dia_addon_greg_leather_info;
	permanent = TRUE;
	description = "Koupit Piratskou zbroj (600 zlaťáků)";
};


func int dia_addon_greg_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_sellwhat) && (ADDON_GREG_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_leather_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_LEATHER_15_00");	//Tady jsou peníze za zbroj.
	if(B_GiveInvItems(other,self,ItMi_Gold,600))
	{
		AI_Output(self,other,"DIA_Addon_Greg_LEATHER_09_01");	//Díky za dobrý obchod.
		CreateInvItems(other,ITAR_PIR_M_Addon,1);
		AI_PrintScreen("Zbroj od Addon_Greg získána.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		ADDON_GREG_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_LEATHER_09_02");	//Oděv má svou cenu - a opravdu za to stojí. Takže se vrať, až dáš dohromady dost zlata.
	};
};

func void DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Compadres_15_00");	//Mám to udělat sám?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01");	//Vem si pár chlapů, pokud chceš.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02");	//Měli by radši makat, než se tady celý den poflakovat.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Greg řekl, že si můžu vzít na pomoc pár chlapů.");
};

func void DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00");	//Jaké potvory?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01");	//Břitvy z kaňonu se dostávají každým dnem blíže k táboru.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02");	//Nechci, aby byl některý z mých chlapů sežrán.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Jdeme jenom po břitvách.");
};


instance DIA_Addon_Greg_AboutCanyon(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_AboutCanyon_Condition;
	information = DIA_Addon_Greg_AboutCanyon_Info;
	permanent = TRUE;
	description = "O práci v kaňonu ...";
};


func int DIA_Addon_Greg_AboutCanyon_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_15_00");	//O úkolu v kaňonu ...
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_01_01");	//Ano, co je s tím?
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
	if(C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,Dialog_Back,DIA_Addon_Greg_AboutCanyon_Back);
		if((Npc_IsDead(Brandon) == FALSE) || (Npc_IsDead(Matt) == FALSE))
		{
			Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Kdo mi může pomoct?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Které nestvůry mám zabít?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Zabil jsem všechny břitvy.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

func void DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00");	//Kdo mi může pomoci?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01");	//Vezmi s sebou pár chlapů.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02");	//Stejnak jenom mrhají časem.
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Job_15_00");	//Které potvory mám zabít?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01");	//Zabij břitvy! Zbytek toho zvěřince je neškodný.
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00");	//Zabil jsem všechny břitvy.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01");	//Velmi dobře. Vypadá to, že jsi docela užitečný.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Greg vypadá, že je trochu ohromený tím, že jsem zabil všechny břitvy v kaňonu.");
	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP(XP_addon_ClearCanyon);
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};


instance DIA_Addon_Greg_BanditArmor(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditArmor_Condition;
	information = DIA_Addon_Greg_BanditArmor_Info;
	permanent = TRUE;
	description = "Potřebuji brnění banditů.";
};


func int DIA_Addon_Greg_BanditArmor_Condition()
{
	if(MIS_Greg_ScoutBandits == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_00");	//Potřebuji brnění banditů.
	if(MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_01");	//Buď nejdřív užitečný. Poté si o tom můžeme promluvit.
		if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
		{
			AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_02");	//Nejdřív zabij všechny břitvy v kaňonu!
		};
		B_LogEntry(TOPIC_Addon_BDTRuestung,"Greg po mě chce, abych mu pomohl dostat tábor na nohy. Poté si můžeme promluvit o brnění.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_03");	//Jsi opravdu docela dobrý.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_04");	//Vlastně chci, aby Bones použil tu zbroj ke špehování banditů.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_05");	//Ale bude lepší, když ten úkol dám TOBĚ.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_06");	//Máš větší šanci se odtamtud dostat v jednom kuse.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_07");	//Promluv si s Bonesem. Dá ti brnění. Vezmi ho, a vydej se do tábora banditů.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_08");	//Musím vědět, proč se ti bastardi dostali do údolí, jako první.
		AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_09");	//Ano, ano kapitáne!
		B_LogEntry(TOPIC_Addon_BDTRuestung,"Teď, když jsem skoncoval s břitvami, můžu si vybrat brnění u Bonese.");
		Log_CreateTopic(TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_ScoutBandits,LOG_Running);
		B_LogEntry(TOPIC_Addon_ScoutBandits,"Mám pro Grega zjistit, proč bandité přišli do údolí.");
		MIS_Greg_ScoutBandits = LOG_Running;
	};
};


instance DIA_Addon_Greg_Auftraege2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Auftraege2_Condition;
	information = DIA_Addon_Greg_Auftraege2_Info;
	description = "Je tady ještě něco, co mám udělat?";
};


func int DIA_Addon_Greg_Auftraege2_Condition()
{
	if((MIS_Greg_ScoutBandits != 0) && ((C_TowerBanditsDead() == FALSE) || ((Npc_IsDead(BeachLurker1) == FALSE) && (Npc_IsDead(BeachLurker2) == FALSE) && (Npc_IsDead(BeachLurker3) == FALSE) && (Npc_IsDead(BeachWaran1) == FALSE) && (Npc_IsDead(BeachWaran2) == FALSE) && (Npc_IsDead(BeachShadowbeast1) == FALSE))))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Auftraege2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Auftraege2_15_00");	//Je tady ještě něco, co mám udělat?
	if((Npc_IsDead(BeachLurker1) == FALSE) && (Npc_IsDead(BeachLurker2) == FALSE) && (Npc_IsDead(BeachLurker3) == FALSE) && (Npc_IsDead(BeachWaran1) == FALSE) && (Npc_IsDead(BeachWaran2) == FALSE) && (Npc_IsDead(BeachShadowbeast1) == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_01");	//Západní pláž je stále plná potvor.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_02");	//Morgan opravdu nepohne ani prstem.
		Log_CreateTopic(TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MorganBeach,LOG_Running);
		B_LogEntry(TOPIC_Addon_MorganBeach,"Greg chce, abych se postaral o pláž. Je plná nestvůr a potřebuje vyčistit.");
		MIS_Addon_MorganLurker = LOG_Running;
	};
	if(C_TowerBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_03");	//V jižní věži na skalách jsou stále bandité.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_04");	//Vlastně, Francis byl pověřen, aby se o to postaral.
		Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
		B_LogEntry(TOPIC_Addon_BanditsTower,"Greg chce, abych vyhnal bandity z věže na východ od tábora.");
		MIS_Henry_FreeBDTTower = LOG_Running;
	};
	AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_05");	//Jestli chceš, můžeš na to dohlédnout.
};


instance DIA_Addon_Greg_Sauber2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Sauber2_Condition;
	information = DIA_Addon_Greg_Sauber2_Info;
	description = "Severní pláž je vyčištěná.";
};


func int DIA_Addon_Greg_Sauber2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Sauber2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Sauber2_15_00");	//Severní pláž je vyčištěná.
	AI_Output(self,other,"DIA_Addon_Greg_Sauber2_01_01");	//Velmi dobře. Tady je odměna.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_LogEntry(TOPIC_Addon_MorganBeach,"Ohlásil jsem vyčištění severní pláže Gregovi.");
	MIS_Addon_MorganLurker = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
};


instance DIA_Addon_Greg_BanditPlatt2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditPlatt2_Condition;
	information = DIA_Addon_Greg_BanditPlatt2_Info;
	description = "Bandité z věže jsou pryč.";
};


func int DIA_Addon_Greg_BanditPlatt2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && (C_TowerBanditsDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditPlatt2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditPlatt2_15_00");	//Bandité z věže jsou pryč.
	AI_Output(self,other,"DIA_Addon_Greg_BanditPlatt2_01_01");	//Skvělé. To byla dobrá práce. Tady je tvůj plat.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_LogEntry(TOPIC_Addon_BanditsTower,"Bandité z věže jsou mrtví. Greg je s tím velmi spokojený.");
	MIS_Henry_FreeBDTTower = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
};


instance DIA_Addon_Greg_BanditGoldmine(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditGoldmine_Condition;
	information = DIA_Addon_Greg_BanditGoldmine_Info;
	permanent = TRUE;
	description = "Bandité nalezli zlatý důl.";
};


func int DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if((SC_KnowsRavensGoldmine == TRUE) && (MIS_Greg_ScoutBandits == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditGoldmine_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditGoldmine_15_00");	//Bandité nalezli zlatý důl.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_01");	//Věděl jsem to! TO je to, proč sem přišli.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_02");	//Nikdo nebude dobrovolně žít v té nestvůrami zamořené bažině.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_03");	//Dobrá práce, tady něco máš.
	B_GiveInvItems(self,other,ItRi_Addon_STR_01,1);
	B_LogEntry(TOPIC_Addon_ScoutBandits,"Informoval jsem Grega o zlatém dole.");
	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Greg_ScoutBandits);
};


instance DIA_Addon_Greg_WhoAreYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_WhoAreYou_Condition;
	information = DIA_Addon_Greg_WhoAreYou_Info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int DIA_Addon_Greg_WhoAreYou_Condition()
{
	if((PlayerTalkedToGregNW == FALSE) && (SC_MeetsGregTime == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_WhoAreYou_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_01");	//Jsem Greg, velitel tohoto tábora.
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_02");	//Šťastný?
};


instance DIA_Addon_Greg_NiceToSeeYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_NiceToSeeYou_Condition;
	information = DIA_Addon_Greg_NiceToSeeYou_Info;
	permanent = FALSE;
	description = "Jak jsi se sem vlasně dostal?";
};


func int DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if((PlayerTalkedToGregNW == TRUE) && (MIS_Greg_ScoutBandits == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NiceToSeeYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NiceToSeeYou_15_00");	//Jak jsi se sem vlasně dostal?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_01");	//Nečekal jsi, že mě tu uvidíš, he?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_02");	//Jenom si to vyjasněme. Jsem Greg a tohle je můj tábor.
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_03");	//Šťastný?
};


instance DIA_Addon_Greg_Story(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 99;
	condition = DIA_Addon_Greg_Story_Condition;
	information = DIA_Addon_Greg_Story_Info;
	permanent = TRUE;
	description = "Je tady ještě jedna věc, kterou chci vědět.";
};


func int DIA_Addon_Greg_Story_Condition()
{
	if(((Npc_KnowsInfo(other,DIA_Addon_Greg_WhoAreYou) == TRUE) || (Npc_KnowsInfo(other,DIA_Addon_Greg_NiceToSeeYou) == TRUE)) && (MIS_Greg_ScoutBandits != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Story_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_15_00");	//Je tady ještě jedna věc, kterou chci vědět.
	AI_Output(self,other,"DIA_Addon_Greg_Story_01_01");	//Co to je?
	Info_ClearChoices(DIA_Addon_Greg_Story);
	Info_AddChoice(DIA_Addon_Greg_Story,Dialog_Back,DIA_Addon_Greg_Story_Back);
	Info_AddChoice(DIA_Addon_Greg_Story,"Jak jsi se sem dostal?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice(DIA_Addon_Greg_Story,"Kde máš loď?",DIA_Addon_Greg_Story_Ship);
	if(RavenIsDead == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_Story,"Co víš o Ravenovi?",DIA_Addon_Greg_Story_Raven);
	};
};

func void DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_Story);
};

func void DIA_Addon_Greg_Story_Way()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Way_15_00");	//Jak jsi se sem dostal?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_01");	//Našel jsem tunel. Ve staré pyramidě. Byl hlídaný pár mágy.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_02");	//Ti slepý zasvěcenci o mě nezavadili ani pohledem.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_03");	//Nejdřív jsem si myslel, že to je jen pohřební síň a chtěl jsem se mrknou, jestli tam není něco cenného.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_04");	//Opravdu dost jsem zíral, když jsem vyšel ve svém milovaném údolí.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_05");	//Začal jsem si myslet, že jsem uniknul domobraně na zbytek svého života.
};

func void DIA_Addon_Greg_Story_Ship()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_00");	//Kde je tvoje loď?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_01");	//Nebudeš tomu věřit. Žádná loď mezi pevninou a ostrovem nebyla v dohledu celé měsíce.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_02");	//Celé měsíce! - A první loď, která připluje je plně obsazená válečná loď krále.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_03");	//Plná paladinů od spodku až po vršek stožáru.
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_04");	//To je to, čemu já říkám smůla.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_05");	//Můžeš to říci znova. Stahlo nás to jak nic. Jsem jediný, kdo to zvládl na břeh.
};

func void DIA_Addon_Greg_Story_Raven()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Raven_15_00");	//Co víš o Ravenovi?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_01");	//Vím, že byl rudný baron. Velký číslo v kolonii.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_02");	//Nevím, proč je tady, nebo proč ho lidé následují.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_03");	//Ale jsem si jistý, že něco chystá. Není typ, který by se schoval v bažině.
};


instance DIA_Addon_Greg_RavenDead(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_RavenDead_Condition;
	information = DIA_Addon_Greg_RavenDead_Info;
	description = "Raven patří minulosti.";
};


func int DIA_Addon_Greg_RavenDead_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_RavenDead_15_00");	//Raven patří minulosti.
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_01");	//Úžasné! To jsem nečekal. Načapal jsi ho se staženejma kalhotama, co?
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_02");	//Za to ti dám 500 zlaťáků.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_03");	//Jsi opravdový ničitel zla. To je dobře.
	B_GivePlayerXP(XP_ADDON_GregRavenLohn);
};

