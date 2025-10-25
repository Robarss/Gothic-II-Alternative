
instance DIA_Wolf_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_EXIT_Condition;
	information = DIA_Wolf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Wolf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_Hallo(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_Hallo_Condition;
	information = DIA_Wolf_Hallo_Info;
	permanent = FALSE;
	description = "Jsi v pořádku?";
};


func int DIA_Wolf_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wolf_Hallo_Info()
{
	AI_Output(other,self,"DIA_Wolf_Hallo_15_00");	//Jsi v pořádku?
	AI_Output(self,other,"DIA_Wolf_Hallo_08_01");	//Hej, já tě znám! Z kolonie!
	AI_Output(self,other,"DIA_Wolf_Hallo_08_02");	//Co tady chceš?
};


instance DIA_Wolf_WannaJoin(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 5;
	condition = DIA_Wolf_WannaJoin_Condition;
	information = DIA_Wolf_WannaJoin_Info;
	permanent = FALSE;
	description = "Přišel jsem se k vám přidat.";
};


func int DIA_Wolf_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (Kapitel < 2))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_00");	//Přišel jsem se k vám přidat.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_01");	//Proč ne, já proti tobě nic nemám. Vždyť jsi z našeho dolu kdysi vyhnal stráže.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_02");	//Ale nepočítej s tím, že tě takhle snadno přijmou i ostatní.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_03");	//Od té doby sem přišla spousta nových lidí a někteří staří žoldáci už se na tebe asi ani nebudou pamatovat.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_04");	//Já tě taky skoro nepoznal, jsi nějaký zruchaný.
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_05");	//Když bariéra padla, sotva jsem si zachránil holý život.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_06");	//Tak tos měl teda štěstí.
	B_LogEntry(TOPIC_SLDRespekt,"Wolfovi nebude vadit, když se připojím k žoldnéřům.");
};


instance DIA_Wolf_WannaBuy(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 6;
	condition = DIA_Wolf_WannaBuy_Condition;
	information = DIA_Wolf_WannaBuy_Info;
	permanent = FALSE;
	description = "Nemáš něco na prodej?";
};


func int DIA_Wolf_WannaBuy_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaBuy_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaBuy_15_00");	//Nemáš něco na prodej?
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_01");	//Ále, ani se neptej.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_02");	//O zbraně a zbroj se teď stará Bennet, jeden z těch nových chlápků.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_03");	//V kolonii jsem vedl celou Leeovu zbrojírnu a pak si přijde nějaký školený kovář a bác, jsem bez práce.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_04");	//Zoufale potřebuju novou práci, i když tu nedělám nic jiného, než hlídám polnosti.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_05");	//Ale nevadí mi to, aspoň tu nemusím sedět s rukama v klíně.
};


instance DIA_Wolf_WannaLearn(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 7;
	condition = DIA_Wolf_WannaLearn_Condition;
	information = DIA_Wolf_WannaLearn_Info;
	permanent = FALSE;
	description = "Můžu se u tebe něčemu přiučit?";
};


func int DIA_Wolf_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaLearn_15_00");	//Můžu se u tebe něčemu přiučit?
	AI_Output(self,other,"DIA_Wolf_WannaLearn_08_01");	//Jestli chceš, můžu ti poradit pár triků v zacházení s lukem. Nic lepšího teď stejně dělat nemůžu.
	Wolf_TeachBow = TRUE;
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher,"Wolf mě naučí zacházet s luky.");
};


var int Wolf_Merke_Bow;

instance DIA_Wolf_TEACH(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 8;
	condition = DIA_Wolf_TEACH_Condition;
	information = DIA_Wolf_TEACH_Info;
	permanent = TRUE;
	description = "Chtěl bych se trochu vylepšit ve střelbě.";
};


func int DIA_Wolf_TEACH_Condition()
{
	if(Wolf_TeachBow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Wolf_TEACH_Info()
{
	AI_Output(other,self,"DIA_Wolf_TEACH_15_00");	//Chtěl bych se trochu vylepšit ve střelbě.
	AI_Output(self,other,"DIA_Wolf_TEACH_08_01");	//Co bych tě měl naučit?
	Wolf_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_Back()
{
	if(Wolf_Merke_Bow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Wolf_Teach_BACK_08_00");	//A je to. Už máš zase o něco přesnější ruku.
	};
	Info_ClearChoices(DIA_Wolf_TEACH);
};

func void DIA_Wolf_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90);
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90);
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};


instance DIA_Wolf_PERM(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 9;
	condition = DIA_Wolf_PERM_Condition;
	information = DIA_Wolf_PERM_Info;
	permanent = TRUE;
	description = "Tak co? Už sis našel novou práci?";
};


func int DIA_Wolf_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_WannaBuy) && (MIS_BengarsHelpingSLD == 0) && (Wolf_IsOnBoard != LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Wolf_PERM_Info()
{
	AI_Output(other,self,"DIA_Wolf_PERM_15_00");	//Tak co? Už sis našel novou práci?
	AI_Output(self,other,"DIA_Wolf_PERM_08_01");	//Ne, zatím ne. Dej mi vědět, jestli na něco natrefíš.
};


instance DIA_Wolf_Stadt(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 10;
	condition = DIA_Wolf_Stadt_Condition;
	information = DIA_Wolf_Stadt_Info;
	permanent = FALSE;
	description = "Zkoušel sis něco najít ve městě?";
};


func int DIA_Wolf_Stadt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_WannaBuy) && (MIS_BengarsHelpingSLD == 0) && (Wolf_IsOnBoard != LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Wolf_Stadt_Info()
{
	AI_Output(other,self,"DIA_Wolf_Stadt_15_00");	//Zkoušel sis něco najít ve městě?
	AI_Output(self,other,"DIA_Wolf_Stadt_08_01");	//Ve městě? (směje se) Tam by mě nedostali ani párem volů!
	AI_Output(self,other,"DIA_Wolf_Stadt_08_02");	//Nebo si myslíš, že bych tam měl dělat nějakého vojáka z domobrany? Nedovedu si představit, že bych nosil uniformu jak nějaký dvořan.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_03");	//A pak ta slepá poslušnost. Ne, zapomeň na to - možná tady na farmě nemám moc co na práci, ale aspoň si můžu dělat, co chci.
};


var int MIS_Wolf_BringCrawlerPlates;
var int Wolf_MakeArmor;
var int Player_GotCrawlerArmor;

instance DIA_Wolf_AboutCrawler(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = DIA_Wolf_AboutCrawler_Condition;
	information = DIA_Wolf_AboutCrawler_Info;
	permanent = FALSE;
	description = "Slyšel jsem, že umíš vykovat zbroj z červích krunýřů?";
};


func int DIA_Wolf_AboutCrawler_Condition()
{
	if((Kapitel >= 2) && (Wolf_ProduceCrawlerArmor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_AboutCrawler_Info()
{
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_00");	//Slyšel jsem, že umíš vykovat zbroj z červích krunýřů?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_01");	//To je fakt. Od koho ses to dozvěděl?
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_02");	//Řekl mi to lovec jménem Gestath.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_03");	//Dokázal bys takovou zbroj vyrobit?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_04");	//Jasně. Přines mi 10 červích krunýřů a já ti ji vyrobím.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_05");	//A kolik za ni budeš chtít?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_06");	//Na placení zapomeň, udělám ti ji grátis, na památku starých dobrých časů.
	MIS_Wolf_BringCrawlerPlates = LOG_Running;
	Log_CreateTopic(TOPIC_Wolf_BringCrawlerPlates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wolf_BringCrawlerPlates,LOG_Running);
	B_LogEntry(TOPIC_Wolf_BringCrawlerPlates,"Wolf mi z 10 červích krunýřů vyková zbroj.");
};


instance DIA_Wolf_TeachCrawlerPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_TeachCrawlerPlates_Condition;
	information = DIA_Wolf_TeachCrawlerPlates_Info;
	permanent = TRUE;
	description = B_BuildLearnString("Můžeš mě naučit, jak červí krunýře oddělit?",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate));
};


func int DIA_Wolf_TeachCrawlerPlates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_AboutCrawler) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_TeachCrawlerPlates_Info()
{
	AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_00");	//Můžeš mě naučit, jak červí krunýře oddělit?
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_01");	//To je jednoduché. Zadní krunýře jsou totiž na těle pevně přichyceny pouze na okrajích. Stačí je ostrým nožem odříznout a je to.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_02");	//Chápeš?
		AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_03");	//To je jednoduché.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_04");	//Vždyť to povídám.
	};
};


instance DIA_Wolf_BringPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 3;
	condition = DIA_Wolf_BringPlates_Condition;
	information = DIA_Wolf_BringPlates_Info;
	permanent = TRUE;
	description = "Sehnal jsem ty červí krunýře na brnění.";
};


func int DIA_Wolf_BringPlates_Condition()
{
	if((MIS_Wolf_BringCrawlerPlates == LOG_Running) && (Npc_HasItems(other,ItAt_CrawlerPlate) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Wolf_BringPlates_Info()
{
	AI_Output(other,self,"DIA_Wolf_BringPlates_15_00");	//Sehnal jsem ty červí krunýře na brnění.
	B_GiveInvItems(other,self,ItAt_CrawlerPlate,10);
	AI_Output(self,other,"DIA_Wolf_BringPlates_08_01");	//Skvělé, tak je sem dej!
	MIS_Wolf_BringCrawlerPlates = LOG_SUCCESS;
};


var int Wolf_Armor_Day;

instance DIA_Wolf_ArmorReady(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_ArmorReady_Condition;
	information = DIA_Wolf_ArmorReady_Info;
	permanent = TRUE;
	description = "Prima, a kdy ta zbroj bude?";
};


func int DIA_Wolf_ArmorReady_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_AboutCrawler) && (Player_GotCrawlerArmor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_ArmorReady_Info()
{
	AI_Output(other,self,"DIA_Wolf_ArmorReady_15_00");	//Prima, a kdy ta zbroj bude?
	if(Npc_HasItems(self,ItAt_CrawlerPlate) >= 10)
	{
		if(Wolf_MakeArmor == FALSE)
		{
			Wolf_Armor_Day = Wld_GetDay() + 1;
			Wolf_MakeArmor = TRUE;
		};
		if((Wolf_MakeArmor == TRUE) && (Wolf_Armor_Day > Wld_GetDay()))
		{
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_01");	//Jen co ji dám dohromady. Vrať se zítra.
		}
		else
		{
			CreateInvItems(self,ITAR_DJG_Crawler,1);
			Npc_RemoveInvItems(self,ItAt_CrawlerPlate,10);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_02");	//Už je hotová - tady je.
			B_GiveInvItems(self,other,ITAR_DJG_Crawler,1);
			B_GiveInvItems(self,other,ithl_helm20,1);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_03");	//Jak tak koukám, to provedení je fakt skvělé.
			AI_Output(other,self,"DIA_Wolf_ArmorReady_15_04");	//Díky!
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_05");	//Není zač.
			Player_GotCrawlerArmor = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_06");	//Ty vtipálku, nejdřív potřebuju ty červí krunýře.
		Wolf_MakeArmor = FALSE;
		MIS_Wolf_BringCrawlerPlates = LOG_Running;
	};
};


instance DIA_Wolf_KAP3_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP3_EXIT_Condition;
	information = DIA_Wolf_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_BENGAR(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 31;
	condition = DIA_Wolf_BENGAR_Condition;
	information = DIA_Wolf_BENGAR_Info;
	permanent = TRUE;
	description = "Možná jsem ti našel práci u Bengara na statku.";
};


func int DIA_Wolf_BENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (MIS_BengarsHelpingSLD == LOG_Running) && (Kapitel >= 3) && (Wolf_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Wolf_BENGAR_oneTime;
var int Wolf_BENGAR_geld;

func void DIA_Wolf_BENGAR_Info()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_15_00");	//Možná jsem ti našel práci u Bengara na statku.
	if(DIA_Wolf_BENGAR_oneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_01");	//Tak povídej.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_02");	//Přímo u Bengarova statku ústí průsmyk do Hornického údolí, kterým se pořád snaží prodrat nějaké obludy. Nemusím ani dodávat, že z nich má ten sedlák pěkně těžkou hlavu.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_03");	//Proto je třeba, aby Bengarův statek někdo střežil.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_04");	//Na tom by mohlo něco být. Aspoň budu venku na poli a nebudu muset pořád okounět tady u kovárny.
		DIA_Wolf_BENGAR_oneTime = TRUE;
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_05");	//Souhlasím. A když jsi teď jedním z nás, udělám ti dobrou cenu. Dej mi 300 zlaťáků a já tam hned vyrazím.
		Wolf_BENGAR_geld = 300;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_06");	//Dobře. Dělá to 800 zlaťáků.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_07");	//To je pořádný balík.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_08");	//No, pro někoho z nás bych to udělal za babku, ale pro tebe...
		Wolf_BENGAR_geld = 800;
	};
	Info_ClearChoices(DIA_Wolf_BENGAR);
	Info_AddChoice(DIA_Wolf_BENGAR,"Budu o tom přemýšlet.",DIA_Wolf_BENGAR_nochnicht);
	Info_AddChoice(DIA_Wolf_BENGAR,"Tady je zlato.",DIA_Wolf_BENGAR_geld);
};

func void DIA_Wolf_BENGAR_geld()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_geld_15_00");	//Tady je zlato.
	if(B_GiveInvItems(other,self,ItMi_Gold,Wolf_BENGAR_geld))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_01");	//Fajn, a teď půjdu dohlídnout na ty nestvůry. Uvidíme, jestli se mi na té farmě podaří ještě někoho naverbovat.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_02");	//Tak se zatím měj.
		MIS_BengarsHelpingSLD = LOG_SUCCESS;
		B_GivePlayerXP(XP_BengarsHelpingSLD);
		AI_StopProcessInfos(self);
		AI_UseMob(self,"BENCH",-1);
		Npc_ExchangeRoutine(self,"BengarsFarm");
		B_StartOtherRoutine(SLD_815_Soeldner,"BengarsFarm");
		B_StartOtherRoutine(SLD_817_Soeldner,"BengarsFarm");
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_03");	//No, kdybys měl dost peněz, už bych byl dávno na cestě.
	};
	Info_ClearChoices(DIA_Wolf_BENGAR);
};

func void DIA_Wolf_BENGAR_nochnicht()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_nochnicht_15_00");	//Budu o tom přemýšlet.
	AI_Output(self,other,"DIA_Wolf_BENGAR_nochnicht_08_01");	//Fajn, ale ne abys mě shodil.
	Info_ClearChoices(DIA_Wolf_BENGAR);
};


instance DIA_Wolf_PERMKAP3(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 80;
	condition = DIA_Wolf_PERMKAP3_Condition;
	information = DIA_Wolf_PERMKAP3_Info;
	permanent = TRUE;
	description = "Tak co, všechno v cajku?";
};


func int DIA_Wolf_PERMKAP3_Condition()
{
	if((Kapitel >= 3) && (Npc_GetDistToWP(self,"FARM3") < 3000) && (MIS_BengarsHelpingSLD == LOG_SUCCESS) && (Wolf_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Wolf_PERMKAP3_onetime;

func void DIA_Wolf_PERMKAP3_Info()
{
	AI_Output(other,self,"DIA_Wolf_PERMKAP3_15_00");	//Tak co, všechno v cajku?
	if(Npc_IsDead(Bengar) && (DIA_Wolf_PERMKAP3_onetime == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_01");	//Můj zaměstnavatel je mrtvý. No, a já si vždycky přál mít vlastní statek.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BengarDead");
		DIA_Wolf_PERMKAP3_onetime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_02");	//No jasně! Všude ticho jako v chrámu!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_KAP4_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP4_EXIT_Condition;
	information = DIA_Wolf_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_KAP5_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP5_EXIT_Condition;
	information = DIA_Wolf_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int wolf_SaidNo;

instance DIA_Wolf_SHIP(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_SHIP_Condition;
	information = DIA_Wolf_SHIP_Info;
	description = "Nelíbilo by se ti odsud vyplout na lodi?";
};


func int DIA_Wolf_SHIP_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && Npc_KnowsInfo(other,DIA_Wolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIP_Info()
{
	AI_Output(other,self,"DIA_Wolf_SHIP_15_00");	//Nelíbilo by se ti odsud vyplout na lodi?
	if((MIS_BengarsHelpingSLD == LOG_SUCCESS) && !Npc_IsDead(Bengar))
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_01");	//Ne, už ne. Konečně jsem si našel práci. Možná někdy jindy.
		wolf_SaidNo = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_02");	//No jasně, pojďme odsud. Můžu ti pomoct s obranou lodi. A kam máme namířeno?
		MIS_BengarsHelpingSLD = LOG_OBSOLETE;
		Log_CreateTopic(Topic_Crew,LOG_MISSION);
		Log_SetTopicStatus(Topic_Crew,LOG_Running);
		B_LogEntry(Topic_Crew,"Wolf už má tohoto ostrova plné zuby a udělal by cokoliv, jen aby se odsud dostal. Je to dobrý bojovník.");
	};
};


instance DIA_Wolf_KnowWhereEnemy(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_KnowWhereEnemy_Condition;
	information = DIA_Wolf_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Chci se dostat na ostrov nedaleko odsud.";
};


func int DIA_Wolf_KnowWhereEnemy_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_SHIP) && (wolf_SaidNo == FALSE) && (MIS_SCKnowsWayToIrdorath == TRUE) && (Wolf_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_00");	//Chci se dostat na ostrov nedaleko odsud.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_01");	//No tak na co ještě čekáme? Na moři tě můžu trochu pocvičit ve střelbě z luku a kuše.
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_02");	//Vlastně jsem si zrovna uvědomil, že už mám dost lidí.
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_03");	//(naštvaně) Tak TAKHLE to je! Nejdřív prudíš, ať se pohnu, a pak z toho nic není, co?
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_04");	//Jdi do hajzlu! Doufám, že se ta tvoje kocábka brzo potopí.
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy,"Musím o tom ještě trochu popřemýšlet.",DIA_Wolf_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy,"Vítej na palubě!",DIA_Wolf_KnowWhereEnemy_Yes);
	};
};

func void DIA_Wolf_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_00");	//Vítej na palubě!
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_01");	//Přijď dolů do přístavu, už brzo vyplujeme.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02");	//Už jdu.
	B_GivePlayerXP(XP_Crewmember_Success);
	self.flags = NPC_FLAG_IMMORTAL;
	Wolf_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

func void DIA_Wolf_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_No_15_00");	//Musím o tom ještě trochu popřemýšlet.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_No_08_01");	//Hele, víš co si myslím? Že se jenom tak vytahuješ. Nevěřím ti ani slovo, vysmahni!
	Wolf_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
};


instance DIA_Wolf_LeaveMyShip(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 55;
	condition = DIA_Wolf_LeaveMyShip_Condition;
	information = DIA_Wolf_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Stejně už mi nejsi k ničemu.";
};


func int DIA_Wolf_LeaveMyShip_Condition()
{
	if((Wolf_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Wolf_LeaveMyShip_15_00");	//Stejně už mi nejsi k ničemu.
	AI_Output(self,other,"DIA_Wolf_LeaveMyShip_08_01");	//Nejdřív mi dáš naději a pak mě takhle odmítneš. Ty svině, za tohle zaplatíš!
	Wolf_IsOnBoard = LOG_FAILED;
	Crewmember_Count = Crewmember_Count - 1;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Wolf_SHIPOFF(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 56;
	condition = DIA_Wolf_SHIPOFF_Condition;
	information = DIA_Wolf_SHIPOFF_Info;
	permanent = TRUE;
	description = "Poslouchej.";
};


func int DIA_Wolf_SHIPOFF_Condition()
{
	if(Wolf_IsOnBoard == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIPOFF_Info()
{
	AI_Output(other,self,"DIA_Wolf_SHIPOFF_15_00");	//Poslouchej.
	AI_Output(self,other,"DIA_Wolf_SHIPOFF_08_01");	//Jdi do prdele, ty zkurvysynu!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Wolf_KAP6_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP6_EXIT_Condition;
	information = DIA_Wolf_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_PICKPOCKET(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 900;
	condition = DIA_Wolf_PICKPOCKET_Condition;
	information = DIA_Wolf_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Wolf_PICKPOCKET_Condition()
{
	return C_Beklauen(32,35);
};

func void DIA_Wolf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
	Info_AddChoice(DIA_Wolf_PICKPOCKET,Dialog_Back,DIA_Wolf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wolf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wolf_PICKPOCKET_DoIt);
};

func void DIA_Wolf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};

func void DIA_Wolf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};

