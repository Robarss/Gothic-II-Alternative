
instance DIA_Grimbald_EXIT(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 999;
	condition = DIA_Grimbald_EXIT_Condition;
	information = DIA_Grimbald_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Grimbald_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimbald_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grimbald_HALLO(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_HALLO_Condition;
	information = DIA_Grimbald_HALLO_Info;
	description = "?ek?? na n?co?";
};


func int DIA_Grimbald_HALLO_Condition()
{
	return TRUE;
};


var int Grimbald_PissOff;

func void DIA_Grimbald_HALLO_Info()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_15_00");	//?ek?? na n?co?
	if(Npc_IsDead(Grimbald_Snapper1) && Npc_IsDead(Grimbald_Snapper2) && Npc_IsDead(Grimbald_Snapper3))
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_01");	//Jsem na lovu. To je snad jasn?.
		Grimbald_PissOff = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_02");	//U? ne. Te? jsi tady, ne?
		Info_ClearChoices(DIA_Grimbald_HALLO);
		Info_AddChoice(DIA_Grimbald_HALLO,"?ek? na m? pr?ce.",DIA_Grimbald_HALLO_nein);
		Info_AddChoice(DIA_Grimbald_HALLO,"Co t?m mysl???",DIA_Grimbald_HALLO_Was);
		Info_AddChoice(DIA_Grimbald_HALLO,"Pro? j??",DIA_Grimbald_HALLO_ich);
	};
};

func void DIA_Grimbald_HALLO_ich()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_ich_15_00");	//Pro? j??
	AI_Output(self,other,"DIA_Grimbald_HALLO_ich_07_01");	//Vypad?? siln?. Chl?pek jako ty se mi m??e hodit.
};

func void DIA_Grimbald_HALLO_Was()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_15_00");	//Co t?m mysl???
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_07_01");	//Cht?l bych ulovit ty ch?apavce t?mhle naho?e, ale m?m dojem, ?e je jich na m? samotn?ho moc.
	Info_AddChoice(DIA_Grimbald_HALLO,"Se mnou nepo??tej..",DIA_Grimbald_HALLO_Was_neinnein);
	Info_AddChoice(DIA_Grimbald_HALLO,"Dobr?. Pom??u ti. Jdi prvn?.",DIA_Grimbald_HALLO_Was_ja);
};

func void DIA_Grimbald_HALLO_Was_neinnein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_neinnein_15_00");	//Se mnou nepo??tej.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_neinnein_07_01");	//Tak to vypadni, babo.
	Grimbald_PissOff = TRUE;
	Info_ClearChoices(DIA_Grimbald_HALLO);
};

func void DIA_Grimbald_HALLO_Was_ja()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_ja_15_00");	//Dobr?. Pom??u ti. Jdi prvn?.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_01");	//Jasn? v?c. Ale moc se nep?ibli?uj k tomu ?ern?mu trolovi tam naho?e. Jinak t? rozsek? na kousky, jasn??
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_02");	//?eho se boj??, ?e se dr??? tak zp?tky.
	B_StartOtherRoutine(self,"Lov");
	AI_StopProcessInfos(self);
};

func void DIA_Grimbald_HALLO_nein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_nein_15_00");	//?ek? na m? pr?ce.
	AI_Output(self,other,"DIA_Grimbald_HALLO_nein_07_01");	//Nevykl?dej nesmysly. Co by mohlo b?t tady uprost?ed divo?iny tak d?le?it?ho?
};


instance DIA_GRIMBALD_SELLWHAT(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_sellwhat_condition;
	information = dia_grimbald_sellwhat_info;
	permanent = FALSE;
	description = "Nev?? kde bych mohl koupit takov? oblek jako m?? ty ?";
};


func int dia_grimbald_sellwhat_condition()
{
	if(Npc_KnowsInfo(other,DIA_Grimbald_HALLO))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_grimbald_sellwhat_info()
{
	AI_Output(other,self,"DIA_Grimbald_SellWhat_15_00");	//Kde bych sehnal takovou zbroj jako m?? ty ?
	AI_Output(self,other,"DIA_Grimbald_SellWhat_09_01");	//No, tu jsem si vyrobil s?m ale bou?el u? m?m jen jednu s norm?ln?ho trola, m??u ti ji prodat za 1000, pochop tu cenu je s troll? ku?e.
};


var int grimbald_leatherbought;

instance DIA_GRIMBALD_LEATHER(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 650;
	condition = dia_grimbald_leather_condition;
	information = dia_grimbald_leather_info;
	permanent = TRUE;
	description = "Koupit zbroj z trolla (1000 zla??k?)";
};


func int dia_grimbald_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_grimbald_sellwhat) && (GRIMBALD_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_grimbald_leather_info()
{
	AI_Output(other,self,"DIA_Grimbald_LEATHER_15_00");	//D?ky za dobr? obchod.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other,"DIA_Grimbald_LEATHER_09_01");	//Bude se ti moc l?bit.
		CreateInvItems(other,itar_hunter_light,1);
		AI_PrintScreen("Zbroj od Grimbalda z?sk?na.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		GRIMBALD_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_LEATHER_09_02");	//Od?v m? svou cenu - a opravdu za to stoj?. Tak?e se vra?, a? d?? dohromady dost zlata.
	};
};


instance DIA_Grimbald_Jagd(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_Jagd_Condition;
	information = DIA_Grimbald_Jagd_Info;
	permanent = TRUE;
	description = "M??e? m? nau?it n?co o lovu?";
};


func int DIA_Grimbald_Jagd_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grimbald_HALLO) && (Grimbald_TeachAnimalTrophy == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Jagd_Info()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_15_00");	//M??e? m? nau?it n?co o lovu?
	if((Npc_IsDead(Grimbald_Snapper1) && Npc_IsDead(Grimbald_Snapper2) && Npc_IsDead(Grimbald_Snapper3)) || (Grimbald_PissOff == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_07_01");	//Mmh. Dobr?. Nebyl jsi mi sice zrovna moc platn?, ale nebudu na tebe tak tvrd?.
		Grimbald_TeachAnimalTrophy = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_07_02");	//Jasn?. Ale bude t? to n?co st?t.
		B_Say_Gold(self,other,200);
		Info_ClearChoices(DIA_Grimbald_Jagd);
		Info_AddChoice(DIA_Grimbald_Jagd,"Budu o tom p?em??let.",DIA_Grimbald_Jagd_zuviel);
		Info_AddChoice(DIA_Grimbald_Jagd,"Dobr?.",DIA_Grimbald_Jagd_ja);
	};
};

func void DIA_Grimbald_Jagd_ja()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_ja_15_00");	//Dobr?. Tady jsou pen?ze
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_01");	//Fajn. Tak mi ?ekni, a? se bude? cht?t n?co nau?it.
		Grimbald_TeachAnimalTrophy = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_02");	//Dej mi ty prachy a pak t? m??u n?co nau?it.
	};
	Info_ClearChoices(DIA_Grimbald_Jagd);
};

func void DIA_Grimbald_Jagd_zuviel()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_zuviel_15_00");	//Budu o tom p?em??let.
	AI_Output(self,other,"DIA_Grimbald_Jagd_zuviel_07_01");	//Kdy? to ??k??.
	Info_ClearChoices(DIA_Grimbald_Jagd);
};


instance DIA_Grimbald_TEACHHUNTING(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 12;
	condition = DIA_Grimbald_TEACHHUNTING_Condition;
	information = DIA_Grimbald_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "R?d bych se nau?il n?jak?m loveck?m technik?m.";
};


func int DIA_Grimbald_TEACHHUNTING_Condition()
{
	if(Grimbald_TeachAnimalTrophy == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Grimbald_TEACHHUNTING_OneTime;

func void DIA_Grimbald_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Grimbald_TEACHHUNTING_15_00");	//R?d bych se nau?il n?jak?m loveck?m technik?m.
	if(DIA_Grimbald_TEACHHUNTING_OneTime == FALSE)
	{
		B_StartOtherRoutine(self,"JagdOver");
		DIA_Grimbald_TEACHHUNTING_OneTime = TRUE;
	};
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_01");	//Co p?esn? bys cht?l v?d?t?
		Info_AddChoice(DIA_Grimbald_TEACHHUNTING,Dialog_Back,DIA_Grimbald_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString("?ihadlo krvav? mouchy",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Grimbald_TEACHHUNTING_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString("K??dla krvav? mouchy",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Grimbald_TEACHHUNTING_BFWing);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString("Vyjmut? dr?p?",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Grimbald_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString("Vyjmut? kusadel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Grimbald_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString("Odd?len? ?erv?ch krun???",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Grimbald_TEACHHUNTING_CrawlerPlate);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_02");	//U? zn?? v?e, co bych t? mohl nau?it.
	};
};

func void DIA_Grimbald_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFSting_07_00");	//Opravdu nen? probl?m dostat z krvav? mouchy jej? ?ihadlo. Sta?? jen naj?t jeho ko?en a vrazit tam n??.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFWing_07_00");	//Bu? m??e? k??dla z krvav? mouchy dostat tak, ?e je prost? utrhne?, nebo je odd?l?? ostr?m no?em.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Claws_07_00");	//Je n?kolik zp?sob?, jak z?skat dr?py. Na n?kter? zv??ata bude? pot?ebovat hodn? s?ly, u jin?ch ti sta?? jen od??znout je no?em.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Mandibles_07_00");	//D?ln? ?ervi a poln? ?k?dci maj? siln? kusadla, kter? m??e? z jejich hlavy dostat siln?m trhnut?m...
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00");	//Krun?? d?ln?ch ?erv? p?il?h? k jejich t?lu velmi t?sn?, ale velk?m ostr?m p?edm?tem se d? snadno odd?lit.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};


instance DIA_Grimbald_NovChase(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_NovChase_Condition;
	information = DIA_Grimbald_NovChase_Info;
	description = "Nevid?l jsi tudy proch?zet n?jak?ho novice?";
};


func int DIA_Grimbald_NovChase_Condition()
{
	if(MIS_NovizenChase == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Grimbald_NovChase_Info()
{
	AI_Output(other,self,"DIA_Grimbald_NovChase_15_00");	//Nevid?l jsi tudy proch?zet n?jak?ho novice?
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_01");	//Dneska tudy pro?lo hodn? podivn?ch osob - v?etn? t?ch dvou vtip?lk? od toho kamenn?ho oblouku.
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_02");	//Taky s nima byl n?jak? novic od m?g? ohn?.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Grimbald_Trolltot(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_Trolltot_Condition;
	information = DIA_Grimbald_Trolltot_Info;
	important = TRUE;
};


func int DIA_Grimbald_Trolltot_Condition()
{
	if(Npc_IsDead(Troll_Black))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Trolltot_Info()
{
	AI_Output(self,other,"DIA_Grimbald_Trolltot_07_00");	//?ern? trol je mrtev. Skv?l? pr?ce. Nikdy jsem si nemyslel, ?e ho lze zab?t. Na tohle nikdy nezapomenu.
	AI_Output(self,other,"DIA_Grimbald_Trolltot1_07_00");	//Jsi opravdu rozen? lovec, tak?e pokud rozum?? Zakladn? v?rob? luk? m??u t? nau?it pokro?ilu v?robu luk?.
	AI_Output(self,other,"DIA_Grimbald_Trolltot2_07_00");	//A jestli um?? stahovat k??e v?m jak z ?ern?ho trolla vyrobit zbroj jako m?m j?.
	Log_CreateTopic(TOPIC_BOWHUNT,LOG_NOTE);
	B_LogEntry(TOPIC_BOWHUNT,"Grimbald m? m??e nau?it Pokro?ilou v?robu luk?.");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_GRIMBALD_TEACH(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 5;
	condition = dia_grimbald_teach_condition;
	information = dia_grimbald_teach_info;
	permanent = 0;
	description = "M??e? m? nau?it vyrobit zbroj?";
};


func int dia_grimbald_teach_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grimbald_Trolltot))
	{
		return TRUE;
	};
};

func void dia_grimbald_teach_info()
{
	AI_Output(other,self,"DIA_Grimbald_teach_15_00");	//M??e? m? nau?it vyrobit zbroj jakou m?? ty?
	AI_Output(self,other,"DIA_Grimbald_teach_01_01");	//Potom co jsem vid?l jak jsi zabil toho trolla, tak nen? probl?m.
	Log_CreateTopic(TOPIC_SKINHUN,LOG_NOTE);
	B_LogEntry(TOPIC_SKINHUN,"Grimbald m? m??e nau?it jak vyrobit zbroj z k??e ?ern?ho trola.");
};


instance DIA_GRIMBALD_LEARN(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = dia_grimbald_learn_condition;
	information = dia_grimbald_learn_info;
	permanent = 6;
	description = "Zbroj z k??e ?ern?ho trola (cena: 6 VB)";
};


func int dia_grimbald_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_grimbald_teach) && (KNOWS_TRLBLARM == FALSE))
	{
		return TRUE;
	};
};

func void dia_grimbald_learn_info()
{
	AI_Output(other,self,"DIA_Grimbald_Learn_15_00");	//Nau? m? vyrobit zbroj z k??e ?ern?ho trola.
	if(hero.lp >= 6)
	{
		hero.lp = hero.lp - 6;
		AI_Output(self,other,"DIA_Grimbald_Learn_12_01");	//Za?ni t?m, ?e si na d?ln? na k??e p?iprav?? v?ci na v?robu.
		AI_Output(self,other,"DIA_Grimbald_Learn_12_02");	//Potom si p?iprav k??e ze kter?ch bude? vyr?b?t zbroj a o?isti ji.
		AI_Output(self,other,"DIA_Grimbald_Learn_12_04");	//Nat?hni je a se??vej p?esn? aby byla pevn? tak jak ti to ukazuji.
		Log_CreateTopic(TOPIC_SKINHUN,LOG_NOTE);
		B_LogEntry(TOPIC_SKINHUN,"Umim vyrobit: Zbroj z k??e ?ern?ho trola.");
		B_LogEntry(TOPIC_SKINHUN,"Material na v?robu: 2x k??e ?ern?ho trola, 3x Trol? tes?k.");
		KNOWS_TRLBLARM = TRUE;
		PrintScreen("Um?m vyrobit: Zbroj z k??e ?ern?ho trola",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek v?domostn?ch bod?!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_GRIMBALD_LEARNBOW2(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = dia_grimbald_learnbow2_condition;
	information = dia_grimbald_learnbow2_info;
	permanent = TRUE;
	description = "Pokro?il? v?roba  (cena: 10 VB, 1500 zlat?ch)";
};


func int dia_grimbald_learnbow2_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grimbald_Trolltot) && (KNOWS_BOWSCROLLSI == TRUE) && (KNOWS_BOWSCROLLSII == FALSE))
	{
		return TRUE;
	};
};

func void dia_grimbald_learnbow2_info()
{
	AI_Output(other,self,"DIA_grimbald_Learnbow2_15_00");	//Nau? m? pokro?ilou v?robu.
	if((hero.lp >= 10) && (Npc_HasItems(other,ItMi_Gold) > 1500))
	{
		hero.lp = hero.lp - 10;
		Npc_RemoveInvItems(hero,ItMi_Gold,1500);
		AI_Output(self,other,"DIA_grimbald_Learnbow2_12_01");	//Za?ni t?m, ?e si na d?ln? na luky p?iprav?? v?ci na v?robu.
		AI_Output(self,other,"DIA_grimbald_Learnbow2_12_02");	//Potom ud?l?? tohle a tam to, zbytek pochop?? z n?kresu.
		AI_Output(self,other,"DIA_grimbald_Learnbow2_12_04");	//N?kresy m??e? zakoupit u Bospra a lze ten sam? postup pou??t i na ku?e.
		Log_CreateTopic(TOPIC_BOWHUNT,LOG_NOTE);
		B_LogEntry(TOPIC_BOWHUNT,"Um?m vyrobit Pokro?il? luky a ku?e.");
		KNOWS_BOWSCROLLSII = TRUE;
		PrintScreen("Um?m vyrobit luky a ku?e",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek v?domostn?ch bod?!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_GRIMBALD_BOWINFO(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 8;
	condition = dia_grimbald_bowinfo_condition;
	information = dia_grimbald_bowinfo_info;
	permanent = TRUE;
	description = "Nev?? kde bych se mohl nau?it Mistrovskou v?robu luk??";
};


func int dia_grimbald_bowinfo_condition()
{
	if((KNOWS_BOWSCROLLSII == TRUE) && (KNOWS_BOWSCROLLSIII == FALSE) && Npc_KnowsInfo(hero,DIA_Grimbald_Trolltot))
	{
		return TRUE;
	};
};

func void dia_grimbald_bowinfo_info()
{
	AI_Output(other,self,"DIA_grimbald_Bowinfo_12_00");	//Nev?? kde bych se mohl nau?it Mistrovskou v?robu luk??
	AI_Output(self,other,"DIA_grimbald_Bowinfo_12_01");	//L?p ne? j? to um? jen bosper ale ten u?? jen lovce, tak?e pokud pro n?j nepracuje? asi nem?? ?anci.
	AI_Output(self,other,"DIA_grimbald_Bowinfo_12_02");	//Ale t?eba ho n?jak p?esv?d???.
};


instance DIA_Grimbald_PICKPOCKET(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 900;
	condition = DIA_Grimbald_PICKPOCKET_Condition;
	information = DIA_Grimbald_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Grimbald_PICKPOCKET_Condition()
{
	return C_Beklauen(85,250);
};

func void DIA_Grimbald_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET,Dialog_Back,DIA_Grimbald_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grimbald_PICKPOCKET_DoIt);
};

func void DIA_Grimbald_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};

func void DIA_Grimbald_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};

