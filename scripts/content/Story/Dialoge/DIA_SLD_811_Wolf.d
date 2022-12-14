
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
	description = "Jsi v po??dku?";
};


func int DIA_Wolf_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wolf_Hallo_Info()
{
	AI_Output(other,self,"DIA_Wolf_Hallo_15_00");	//Jsi v po??dku?
	AI_Output(self,other,"DIA_Wolf_Hallo_08_01");	//Hej, j? t? zn?m! Z kolonie!
	AI_Output(self,other,"DIA_Wolf_Hallo_08_02");	//Co tady chce??
};


instance DIA_Wolf_WannaJoin(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 5;
	condition = DIA_Wolf_WannaJoin_Condition;
	information = DIA_Wolf_WannaJoin_Info;
	permanent = FALSE;
	description = "P?i?el jsem se k v?m p?idat.";
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
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_00");	//P?i?el jsem se k v?m p?idat.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_01");	//Pro? ne, j? proti tob? nic nem?m. V?dy? jsi z na?eho dolu kdysi vyhnal str??e.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_02");	//Ale nepo??tej s t?m, ?e t? takhle snadno p?ijmou i ostatn?.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_03");	//Od t? doby sem p?i?la spousta nov?ch lid? a n?kte?? sta?? ?old?ci u? se na tebe asi ani nebudou pamatovat.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_04");	//J? t? taky skoro nepoznal, jsi n?jak? zruchan?.
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_05");	//Kdy? bari?ra padla, sotva jsem si zachr?nil hol? ?ivot.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_06");	//Tak tos m?l teda ?t?st?.
	B_LogEntry(TOPIC_SLDRespekt,"Wolfovi nebude vadit, kdy? se p?ipoj?m k ?oldn???m.");
};


instance DIA_Wolf_WannaBuy(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 6;
	condition = DIA_Wolf_WannaBuy_Condition;
	information = DIA_Wolf_WannaBuy_Info;
	permanent = FALSE;
	description = "Nem?? n?co na prodej?";
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
	AI_Output(other,self,"DIA_Wolf_WannaBuy_15_00");	//Nem?? n?co na prodej?
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_01");	//?le, ani se neptej.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_02");	//O zbran? a zbroj se te? star? Bennet, jeden z t?ch nov?ch chl?pk?.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_03");	//V kolonii jsem vedl celou Leeovu zbroj?rnu a pak si p?ijde n?jak? ?kolen? kov?? a b?c, jsem bez pr?ce.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_04");	//Zoufale pot?ebuju novou pr?ci, i kdy? tu ned?l?m nic jin?ho, ne? hl?d?m polnosti.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_05");	//Ale nevad? mi to, aspo? tu nemus?m sed?t s rukama v kl?n?.
};


instance DIA_Wolf_WannaLearn(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 7;
	condition = DIA_Wolf_WannaLearn_Condition;
	information = DIA_Wolf_WannaLearn_Info;
	permanent = FALSE;
	description = "M??u se u tebe n??emu p?iu?it?";
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
	AI_Output(other,self,"DIA_Wolf_WannaLearn_15_00");	//M??u se u tebe n??emu p?iu?it?
	AI_Output(self,other,"DIA_Wolf_WannaLearn_08_01");	//Jestli chce?, m??u ti poradit p?r trik? v zach?zen? s lukem. Nic lep??ho te? stejn? d?lat nem??u.
	Wolf_TeachBow = TRUE;
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher,"Wolf m? nau?? zach?zet s luky.");
};


var int Wolf_Merke_Bow;

instance DIA_Wolf_TEACH(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 8;
	condition = DIA_Wolf_TEACH_Condition;
	information = DIA_Wolf_TEACH_Info;
	permanent = TRUE;
	description = "Cht?l bych se trochu vylep?it ve st?elb?.";
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
	AI_Output(other,self,"DIA_Wolf_TEACH_15_00");	//Cht?l bych se trochu vylep?it ve st?elb?.
	AI_Output(self,other,"DIA_Wolf_TEACH_08_01");	//Co bych t? m?l nau?it?
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
		AI_Output(self,other,"DIA_Wolf_Teach_BACK_08_00");	//A je to. U? m?? zase o n?co p?esn?j?? ruku.
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
	description = "Tak co? U? sis na?el novou pr?ci?";
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
	AI_Output(other,self,"DIA_Wolf_PERM_15_00");	//Tak co? U? sis na?el novou pr?ci?
	AI_Output(self,other,"DIA_Wolf_PERM_08_01");	//Ne, zat?m ne. Dej mi v?d?t, jestli na n?co natref??.
};


instance DIA_Wolf_Stadt(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 10;
	condition = DIA_Wolf_Stadt_Condition;
	information = DIA_Wolf_Stadt_Info;
	permanent = FALSE;
	description = "Zkou?el sis n?co naj?t ve m?st??";
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
	AI_Output(other,self,"DIA_Wolf_Stadt_15_00");	//Zkou?el sis n?co naj?t ve m?st??
	AI_Output(self,other,"DIA_Wolf_Stadt_08_01");	//Ve m?st?? (sm?je se) Tam by m? nedostali ani p?rem vol?!
	AI_Output(self,other,"DIA_Wolf_Stadt_08_02");	//Nebo si mysl??, ?e bych tam m?l d?lat n?jak?ho voj?ka z domobrany? Nedovedu si p?edstavit, ?e bych nosil uniformu jak n?jak? dvo?an.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_03");	//A pak ta slep? poslu?nost. Ne, zapome? na to - mo?n? tady na farm? nem?m moc co na pr?ci, ale aspo? si m??u d?lat, co chci.
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
	description = "Sly?el jsem, ?e um?? vykovat zbroj z ?erv?ch krun????";
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
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_00");	//Sly?el jsem, ?e um?? vykovat zbroj z ?erv?ch krun????
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_01");	//To je fakt. Od koho ses to dozv?d?l?
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_02");	//?ekl mi to lovec jm?nem Gestath.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_03");	//Dok?zal bys takovou zbroj vyrobit?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_04");	//Jasn?. P?ines mi 10 ?erv?ch krun??? a j? ti ji vyrob?m.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_05");	//A kolik za ni bude? cht?t?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_06");	//Na placen? zapome?, ud?l?m ti ji gr?tis, na pam?tku star?ch dobr?ch ?as?.
	MIS_Wolf_BringCrawlerPlates = LOG_Running;
	Log_CreateTopic(TOPIC_Wolf_BringCrawlerPlates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wolf_BringCrawlerPlates,LOG_Running);
	B_LogEntry(TOPIC_Wolf_BringCrawlerPlates,"Wolf mi z 10 ?erv?ch krun??? vykov? zbroj.");
};


instance DIA_Wolf_TeachCrawlerPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_TeachCrawlerPlates_Condition;
	information = DIA_Wolf_TeachCrawlerPlates_Info;
	permanent = TRUE;
	description = B_BuildLearnString("M??e? m? nau?it, jak ?erv? krun??e odd?lit?",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate));
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
	AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_00");	//M??e? m? nau?it, jak ?erv? krun??e odd?lit?
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_01");	//To je jednoduch?. Zadn? krun??e jsou toti? na t?le pevn? p?ichyceny pouze na okraj?ch. Sta?? je ostr?m no?em od??znout a je to.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_02");	//Ch?pe??
		AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_03");	//To je jednoduch?.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_04");	//V?dy? to pov?d?m.
	};
};


instance DIA_Wolf_BringPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 3;
	condition = DIA_Wolf_BringPlates_Condition;
	information = DIA_Wolf_BringPlates_Info;
	permanent = TRUE;
	description = "Sehnal jsem ty ?erv? krun??e na brn?n?.";
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
	AI_Output(other,self,"DIA_Wolf_BringPlates_15_00");	//Sehnal jsem ty ?erv? krun??e na brn?n?.
	B_GiveInvItems(other,self,ItAt_CrawlerPlate,10);
	AI_Output(self,other,"DIA_Wolf_BringPlates_08_01");	//Skv?l?, tak je sem dej!
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
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_01");	//Jen co ji d?m dohromady. Vra? se z?tra.
		}
		else
		{
			CreateInvItems(self,ITAR_DJG_Crawler,1);
			Npc_RemoveInvItems(self,ItAt_CrawlerPlate,10);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_02");	//U? je hotov? - tady je.
			B_GiveInvItems(self,other,ITAR_DJG_Crawler,1);
			B_GiveInvItems(self,other,ithl_helm20,1);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_03");	//Jak tak kouk?m, to proveden? je fakt skv?l?.
			AI_Output(other,self,"DIA_Wolf_ArmorReady_15_04");	//D?ky!
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_05");	//Nen? za?.
			Player_GotCrawlerArmor = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_06");	//Ty vtip?lku, nejd??v pot?ebuju ty ?erv? krun??e.
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
	description = "Mo?n? jsem ti na?el pr?ci u Bengara na statku.";
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
	AI_Output(other,self,"DIA_Wolf_BENGAR_15_00");	//Mo?n? jsem ti na?el pr?ci u Bengara na statku.
	if(DIA_Wolf_BENGAR_oneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_01");	//Tak pov?dej.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_02");	//P??mo u Bengarova statku ?st? pr?smyk do Hornick?ho ?dol?, kter?m se po??d sna?? prodrat n?jak? obludy. Nemus?m ani dod?vat, ?e z nich m? ten sedl?k p?kn? t??kou hlavu.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_03");	//Proto je t?eba, aby Bengar?v statek n?kdo st?e?il.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_04");	//Na tom by mohlo n?co b?t. Aspo? budu venku na poli a nebudu muset po??d okoun?t tady u kov?rny.
		DIA_Wolf_BENGAR_oneTime = TRUE;
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_05");	//Souhlas?m. A kdy? jsi te? jedn?m z n?s, ud?l?m ti dobrou cenu. Dej mi 300 zla??k? a j? tam hned vyraz?m.
		Wolf_BENGAR_geld = 300;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_06");	//Dob?e. D?l? to 800 zla??k?.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_07");	//To je po??dn? bal?k.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_08");	//No, pro n?koho z n?s bych to ud?lal za babku, ale pro tebe...
		Wolf_BENGAR_geld = 800;
	};
	Info_ClearChoices(DIA_Wolf_BENGAR);
	Info_AddChoice(DIA_Wolf_BENGAR,"Budu o tom p?em??let.",DIA_Wolf_BENGAR_nochnicht);
	Info_AddChoice(DIA_Wolf_BENGAR,"Tady je zlato.",DIA_Wolf_BENGAR_geld);
};

func void DIA_Wolf_BENGAR_geld()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_geld_15_00");	//Tady je zlato.
	if(B_GiveInvItems(other,self,ItMi_Gold,Wolf_BENGAR_geld))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_01");	//Fajn, a te? p?jdu dohl?dnout na ty nestv?ry. Uvid?me, jestli se mi na t? farm? poda?? je?t? n?koho naverbovat.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_02");	//Tak se zat?m m?j.
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
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_03");	//No, kdybys m?l dost pen?z, u? bych byl d?vno na cest?.
	};
	Info_ClearChoices(DIA_Wolf_BENGAR);
};

func void DIA_Wolf_BENGAR_nochnicht()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_nochnicht_15_00");	//Budu o tom p?em??let.
	AI_Output(self,other,"DIA_Wolf_BENGAR_nochnicht_08_01");	//Fajn, ale ne abys m? shodil.
	Info_ClearChoices(DIA_Wolf_BENGAR);
};


instance DIA_Wolf_PERMKAP3(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 80;
	condition = DIA_Wolf_PERMKAP3_Condition;
	information = DIA_Wolf_PERMKAP3_Info;
	permanent = TRUE;
	description = "Tak co, v?echno v cajku?";
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
	AI_Output(other,self,"DIA_Wolf_PERMKAP3_15_00");	//Tak co, v?echno v cajku?
	if(Npc_IsDead(Bengar) && (DIA_Wolf_PERMKAP3_onetime == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_01");	//M?j zam?stnavatel je mrtv?. No, a j? si v?dycky p??l m?t vlastn? statek.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BengarDead");
		DIA_Wolf_PERMKAP3_onetime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_02");	//No jasn?! V?ude ticho jako v chr?mu!
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
	description = "Nel?bilo by se ti odsud vyplout na lodi?";
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
	AI_Output(other,self,"DIA_Wolf_SHIP_15_00");	//Nel?bilo by se ti odsud vyplout na lodi?
	if((MIS_BengarsHelpingSLD == LOG_SUCCESS) && !Npc_IsDead(Bengar))
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_01");	//Ne, u? ne. Kone?n? jsem si na?el pr?ci. Mo?n? n?kdy jindy.
		wolf_SaidNo = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_02");	//No jasn?, poj?me odsud. M??u ti pomoct s obranou lodi. A kam m?me nam??eno?
		MIS_BengarsHelpingSLD = LOG_OBSOLETE;
		Log_CreateTopic(Topic_Crew,LOG_MISSION);
		Log_SetTopicStatus(Topic_Crew,LOG_Running);
		B_LogEntry(Topic_Crew,"Wolf u? m? tohoto ostrova pln? zuby a ud?lal by cokoliv, jen aby se odsud dostal. Je to dobr? bojovn?k.");
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
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_01");	//No tak na co je?t? ?ek?me? Na mo?i t? m??u trochu pocvi?it ve st?elb? z luku a ku?e.
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_02");	//Vlastn? jsem si zrovna uv?domil, ?e u? m?m dost lid?.
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_03");	//(na?tvan?) Tak TAKHLE to je! Nejd??v prud??, a? se pohnu, a pak z toho nic nen?, co?
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_04");	//Jdi do hajzlu! Douf?m, ?e se ta tvoje koc?bka brzo potop?.
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy,"Mus?m o tom je?t? trochu pop?em??let.",DIA_Wolf_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy,"V?tej na palub?!",DIA_Wolf_KnowWhereEnemy_Yes);
	};
};

func void DIA_Wolf_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_00");	//V?tej na palub?!
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_01");	//P?ij? dol? do p??stavu, u? brzo vyplujeme.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02");	//U? jdu.
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
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_No_15_00");	//Mus?m o tom je?t? trochu pop?em??let.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_No_08_01");	//Hele, v?? co si mysl?m? ?e se jenom tak vytahuje?. Nev???m ti ani slovo, vysmahni!
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
	description = "Stejn? u? mi nejsi k ni?emu.";
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
	AI_Output(other,self,"DIA_Wolf_LeaveMyShip_15_00");	//Stejn? u? mi nejsi k ni?emu.
	AI_Output(self,other,"DIA_Wolf_LeaveMyShip_08_01");	//Nejd??v mi d?? nad?ji a pak m? takhle odm?tne?. Ty svin?, za tohle zaplat??!
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

