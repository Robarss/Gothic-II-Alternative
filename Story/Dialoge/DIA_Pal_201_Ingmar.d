
instance DIA_Ingmar_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_EXIT_Condition;
	information = DIA_Ingmar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_Hallo(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 2;
	condition = DIA_Ingmar_Hallo_Condition;
	information = DIA_Ingmar_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};


var int DIA_Ingmar_Hallo_permanent;

func int DIA_Ingmar_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Ingmar_Hallo_permanent == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Hallo_Info()
{
	if((EnterOW_Kapitel2 == FALSE) && (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_00");	//Podle zpráv, které jsem dostal, je Hornické údolí dost nebezpečné místo.
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_01");	//Než odejdeš, pořádně se vybav.
	}
	else if((MIS_OLDWORLD == LOG_SUCCESS) && (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_02");	//Situace v Hornickém údolí je vážná. Ale připravíme nějaký plán, jak odtamtud dostat naše chlapce i s rudou.
		DIA_Ingmar_Hallo_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_03");	//Myslel jsem, že sis přišel promluvit s lordem Hagenem. Měl bys jít dál a popovídat si s ním.
	};
};


instance DIA_Ingmar_Krieg(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 99;
	condition = DIA_Ingmar_Krieg_Condition;
	information = DIA_Ingmar_Krieg_Info;
	permanent = FALSE;
	description = "Jaká je situace na kontinentu?";
};


func int DIA_Ingmar_Krieg_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Krieg_Info()
{
	AI_Output(other,self,"DIA_Ingmar_Krieg_15_00");	//Jaká je situace na kontinentu?
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_01");	//Válka ještě není vyhraná, i když královské síly už ženou skřety zpět.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_02");	//Na mnohých místech se ale shromažďují menší tlupy skřetů a snaží se naší armádu roztříštit.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_03");	//Bojují beze cti a bez víry - musíme tedy zvítězit.
};


instance DIA_Ingmar_CanTeach(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 100;
	condition = DIA_Ingmar_CanTeach_Condition;
	information = DIA_Ingmar_CanTeach_Info;
	permanent = TRUE;
	description = "Můžeš mě něco naučit?";
};


func int DIA_Ingmar_CanTeach_Condition()
{
	if(Ingmar_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeach_15_00");	//Můžeš mě něco naučit?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_01");	//Můžu tě naučit, jak si posílit paže, abys mohl používat zbraně efektivněji.
		Ingmar_TeachSTR = TRUE;
		B_LogEntry(TOPIC_CityTeacher,"Paladin Ingmar mi může pomoci zvýšit sílu.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_02");	//Učím pouze členy našeho Řádu.
	};
};


instance DIA_Ingmar_Teach(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 6;
	condition = DIA_Ingmar_Teach_Condition;
	information = DIA_Ingmar_Teach_Info;
	permanent = TRUE;
	description = "Chtěl bych se stát silnějším.";
};


func int DIA_Ingmar_Teach_Condition()
{
	if(Ingmar_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Teach_Info()
{
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//Chtěl bych se stát silnějším.
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);
};

func void DIA_Ingmar_Teach_BACK()
{
	if(other.attribute[ATR_STRENGTH] >= T_MAX)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//Už jsi silný jako trol. Není nic, co bych tě mohl naučit.
	};
	Info_ClearChoices(DIA_Ingmar_Teach);
};

func void DIA_Ingmar_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);
};

func void DIA_Ingmar_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);
};


instance DIA_Ingmar_KAP3_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP3_EXIT_Condition;
	information = DIA_Ingmar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_SELLWHAT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 1;
	condition = dia_ingmar_sellwhat_condition;
	information = dia_ingmar_sellwhat_info;
	permanent = FALSE;
	description = "Nevíš kde bych mohl koupit takovou zbroj jako máš ty ?";
};


func int dia_ingmar_sellwhat_condition()
{
	if(Ingmar_TeachSTR == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_ingmar_sellwhat_info()
{
	AI_Output(other,self,"DIA_Ingmar_SellWhat_15_00");	//Kde bych sehnal takovou zbroj jako máš ty ?
	AI_Output(self,other,"DIA_Ingmar_SellWhat_09_01");	//U mě, můžu ti jí vylepšit jen potřebuji tvojí KOMPLETNÍ rytířskou zbroj a zlato ale u tebe to je zdarma protože muži jako ty se nám hodí.
};


var int ingmar_leatherbought;

instance DIA_INGMAR_LEATHER(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 650;
	condition = dia_ingmar_leather_condition;
	information = dia_ingmar_leather_info;
	permanent = TRUE;
	description = "Nechat si vylepšit zbroj";
};


func int dia_ingmar_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_ingmar_sellwhat) && (INGMAR_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ingmar_leather_info()
{
	AI_Output(other,self,"DIA_Ingmar_LEATHER_15_00");	//Vylepši my rytířskou zbroj.
	if(B_GiveInvItems(other,self,ItAr_PAL_M,1))
	{
		AI_Output(self,other,"DIA_Ingmar_LEATHER_09_01");	//A je to, tady ju máš, bude se ti moc líbit.
		CreateInvItems(other,itar_palup,1);
		AI_PrintScreen("Zbroj od Ingmara získána.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		INGMAR_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_LEATHER_09_02");	//Bez KOMPLETNÍ rytířské zbroje ti jí nevylepším.
	};
};


instance DIA_Ingmar_KAP4_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP4_EXIT_Condition;
	information = DIA_Ingmar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_ORKELITE(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 40;
	condition = DIA_Ingmar_ORKELITE_Condition;
	information = DIA_Ingmar_ORKELITE_Info;
	description = "Skřeti plánují hlavní ofenzívu.";
};


func int DIA_Ingmar_ORKELITE_Condition()
{
	if(((TalkedTo_AntiPaladin == TRUE) || Npc_HasItems(other,ItRi_OrcEliteRing) || (Hagen_SawOrcRing == TRUE)) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_ORKELITE_Info()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_00");	//Skřeti plánují hlavní ofenzívu.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_01");	//Vážně. Tak to je velice zajímavé. A na základě čeho se tak domníváš?
	if(TalkedTo_AntiPaladin == TRUE)
	{
		AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_02");	//Mluvil jsem s nimi.
	};
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_03");	//Po kraji se potulují jejich velitelé.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_04");	//Hmm. To nezní jako typická skřetí strategie.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Raději bys měl přijít na něco, jak se jich zbavit.",DIA_Ingmar_ORKELITE_loswerden);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Co uděláme?",DIA_Ingmar_ORKELITE_wasTun);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Co to znamená?",DIA_Ingmar_ORKELITE_wieso);
	Log_CreateTopic(TOPIC_OrcElite,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite,LOG_Running);
	B_LogEntry(TOPIC_OrcElite,"Ingmar se velmi zajímá o příběh skřetích elitních válečníků.");
	MIS_KillOrkOberst = LOG_Running;
};

func void DIA_Ingmar_ORKELITE_loswerden()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_loswerden_15_00");	//Raději bys měl přijít na něco, jak se jich zbavit.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_loswerden_06_01");	//Mělo by stačit, kdybychom měli víc informací. Pošlu někoho, aby prozkoumal okolí.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};

func void DIA_Ingmar_ORKELITE_wieso()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wieso_15_00");	//Co to znamená?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_01");	//Pokud to, co říkáš, je pravda, tak nás chtějí oslabit zevnitř tím, že na nás budou útočit jejich nejlepší válečníci.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_02");	//Obvykle jeden takový velitel vede skupinu skřetích bojovníků. Málokdy jich vidíš dva nebo víc pohromadě.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_03");	//Dělají to z nějakého důvodu. Jejich vůdci tvoří jádro útočné strategie a většinou jsou obklopeni skřetími válečníky.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_04");	//Je tedy velice těžké se k někomu z nich dostat, aniž by bylo nutné si prosekat cestu alespoň třiceti nepřáteli.
	B_LogEntry(TOPIC_OrcElite,"Ingmar se zmínil o hlavním skřetím vojevůdci.");
};

func void DIA_Ingmar_ORKELITE_wasTun()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wasTun_15_00");	//Co uděláme?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_01");	//Když jich je tolik jako teď, jedná se většinou o nájezdnou patrolu, kterou vede ten nejvýše postavený z nich.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_02");	//Nejvýše postavený vojevůdce si zařídí hlavní stan v nějaké jeskyni, odkud vysílá své vojsko do boje.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_03");	//Pokud by se nám podařilo tohoto velitele zneškodnit, získali bychom tak nezanedbatelnou výhodu.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_04");	//Skřetí velitel se většinou pohybuje v blízkosti svých nepřátel. Asi by bylo dobré hledat jeho jeskyni někde nedaleko města.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_05");	//Několik skřetů bylo spatřeno poblíž Lobartovy farmy. Asi by bylo moudré začít s pátráním tam.
	B_LogEntry(TOPIC_OrcElite,"Podle Ingmara bych měl skřetího plukovníka hledat v jeskyni kdesi u Lobartova statku. Mám ho najít a zničit.");
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};


instance DIA_Ingmar_HAUPTQUARTIER(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 41;
	condition = DIA_Ingmar_HAUPTQUARTIER_Condition;
	information = DIA_Ingmar_HAUPTQUARTIER_Info;
	permanent = FALSE;
	description = "Našel jsem hlavní stan skřetů. Jejich vojevůdce padl.";
};


func int DIA_Ingmar_HAUPTQUARTIER_Condition()
{
	if(Npc_IsDead(OrkElite_AntiPaladinOrkOberst) && Npc_KnowsInfo(other,DIA_Ingmar_ORKELITE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_HAUPTQUARTIER_Info()
{
	AI_Output(other,self,"DIA_Ingmar_HAUPTQUARTIER_15_00");	//Našel jsem hlavní stan skřetů. Jejich vojevůdce padl.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_01");	//To je vynikající zpráva. Skřeti tak nebudou mít nějaký čas na útok ani pomyšlení.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_02");	//To není špatné. Kdybychom měli víc rytířů jako jsi ty, byla by nadcházející bitva předem rozhodnuta.
	B_GivePlayerXP(XP_KilledOrkOberst);
	CreateInvItems(self,ItMi_Gold,300);
	B_GiveInvItems(self,other,ItMi_Gold,300);
	MIS_KillOrkOberst = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OrcElite,LOG_SUCCESS);
};


instance DIA_Ingmar_KAP5_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP5_EXIT_Condition;
	information = DIA_Ingmar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_KAP6_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP6_EXIT_Condition;
	information = DIA_Ingmar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_PICKPOCKET(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 900;
	condition = DIA_Ingmar_PICKPOCKET_Condition;
	information = DIA_Ingmar_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Tento svitek je téměř nemožné ukrást.)";
};


func int DIA_Ingmar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (105 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
	Info_AddChoice(DIA_Ingmar_PICKPOCKET,Dialog_Back,DIA_Ingmar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ingmar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ingmar_PICKPOCKET_DoIt);
};

func void DIA_Ingmar_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 105)
	{
		B_GiveInvItems(self,other,ItWr_Manowar,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Ingmar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
};

