
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
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_00");	//Podle zpr?v, kter? jsem dostal, je Hornick? ?dol? dost nebezpe?n? m?sto.
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_01");	//Ne? odejde?, po??dn? se vybav.
	}
	else if((MIS_OLDWORLD == LOG_SUCCESS) && (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_02");	//Situace v Hornick?m ?dol? je v??n?. Ale p?iprav?me n?jak? pl?n, jak odtamtud dostat na?e chlapce i s rudou.
		DIA_Ingmar_Hallo_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_03");	//Myslel jsem, ?e sis p?i?el promluvit s lordem Hagenem. M?l bys j?t d?l a popov?dat si s n?m.
	};
};


instance DIA_Ingmar_Krieg(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 99;
	condition = DIA_Ingmar_Krieg_Condition;
	information = DIA_Ingmar_Krieg_Info;
	permanent = FALSE;
	description = "Jak? je situace na kontinentu?";
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
	AI_Output(other,self,"DIA_Ingmar_Krieg_15_00");	//Jak? je situace na kontinentu?
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_01");	//V?lka je?t? nen? vyhran?, i kdy? kr?lovsk? s?ly u? ?enou sk?ety zp?t.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_02");	//Na mnoh?ch m?stech se ale shroma??uj? men?? tlupy sk?et? a sna?? se na?? arm?du rozt???tit.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_03");	//Bojuj? beze cti a bez v?ry - mus?me tedy zv?t?zit.
};


instance DIA_Ingmar_CanTeach(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 100;
	condition = DIA_Ingmar_CanTeach_Condition;
	information = DIA_Ingmar_CanTeach_Info;
	permanent = TRUE;
	description = "M??e? m? n?co nau?it?";
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
	AI_Output(other,self,"DIA_Ingmar_CanTeach_15_00");	//M??e? m? n?co nau?it?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_01");	//M??u t? nau?it, jak si pos?lit pa?e, abys mohl pou??vat zbran? efektivn?ji.
		Ingmar_TeachSTR = TRUE;
		B_LogEntry(TOPIC_CityTeacher,"Paladin Ingmar mi m??e pomoci zv??it s?lu.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_02");	//U??m pouze ?leny na?eho ??du.
	};
};


instance DIA_Ingmar_Teach(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 6;
	condition = DIA_Ingmar_Teach_Condition;
	information = DIA_Ingmar_Teach_Info;
	permanent = TRUE;
	description = "Cht?l bych se st?t siln?j??m.";
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
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//Cht?l bych se st?t siln?j??m.
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);
};

func void DIA_Ingmar_Teach_BACK()
{
	if(other.attribute[ATR_STRENGTH] >= T_MAX)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//U? jsi siln? jako trol. Nen? nic, co bych t? mohl nau?it.
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
	description = "Nev?? kde bych mohl koupit takovou zbroj jako m?? ty ?";
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
	AI_Output(other,self,"DIA_Ingmar_SellWhat_15_00");	//Kde bych sehnal takovou zbroj jako m?? ty ?
	AI_Output(self,other,"DIA_Ingmar_SellWhat_09_01");	//U m?, m??u ti j? vylep?it jen pot?ebuji tvoj? KOMPLETN? ryt??skou zbroj a zlato ale u tebe to je zdarma proto?e mu?i jako ty se n?m hod?.
};


var int ingmar_leatherbought;

instance DIA_INGMAR_LEATHER(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 650;
	condition = dia_ingmar_leather_condition;
	information = dia_ingmar_leather_info;
	permanent = TRUE;
	description = "Nechat si vylep?it zbroj";
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
	AI_Output(other,self,"DIA_Ingmar_LEATHER_15_00");	//Vylep?i my ryt??skou zbroj.
	if(B_GiveInvItems(other,self,ItAr_PAL_M,1))
	{
		AI_Output(self,other,"DIA_Ingmar_LEATHER_09_01");	//A je to, tady ju m??, bude se ti moc l?bit.
		CreateInvItems(other,itar_palup,1);
		AI_PrintScreen("Zbroj od Ingmara z?sk?na.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		INGMAR_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_LEATHER_09_02");	//Bez KOMPLETN? ryt??sk? zbroje ti j? nevylep??m.
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
	description = "Sk?eti pl?nuj? hlavn? ofenz?vu.";
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
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_00");	//Sk?eti pl?nuj? hlavn? ofenz?vu.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_01");	//V??n?. Tak to je velice zaj?mav?. A na z?klad? ?eho se tak domn?v???
	if(TalkedTo_AntiPaladin == TRUE)
	{
		AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_02");	//Mluvil jsem s nimi.
	};
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_03");	//Po kraji se potuluj? jejich velitel?.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_04");	//Hmm. To nezn? jako typick? sk?et? strategie.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Rad?ji bys m?l p?ij?t na n?co, jak se jich zbavit.",DIA_Ingmar_ORKELITE_loswerden);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Co ud?l?me?",DIA_Ingmar_ORKELITE_wasTun);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Co to znamen??",DIA_Ingmar_ORKELITE_wieso);
	Log_CreateTopic(TOPIC_OrcElite,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite,LOG_Running);
	B_LogEntry(TOPIC_OrcElite,"Ingmar se velmi zaj?m? o p??b?h sk?et?ch elitn?ch v?le?n?k?.");
	MIS_KillOrkOberst = LOG_Running;
};

func void DIA_Ingmar_ORKELITE_loswerden()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_loswerden_15_00");	//Rad?ji bys m?l p?ij?t na n?co, jak se jich zbavit.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_loswerden_06_01");	//M?lo by sta?it, kdybychom m?li v?c informac?. Po?lu n?koho, aby prozkoumal okol?.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};

func void DIA_Ingmar_ORKELITE_wieso()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wieso_15_00");	//Co to znamen??
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_01");	//Pokud to, co ??k??, je pravda, tak n?s cht?j? oslabit zevnit? t?m, ?e na n?s budou ?to?it jejich nejlep?? v?le?n?ci.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_02");	//Obvykle jeden takov? velitel vede skupinu sk?et?ch bojovn?k?. M?lokdy jich vid?? dva nebo v?c pohromad?.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_03");	//D?laj? to z n?jak?ho d?vodu. Jejich v?dci tvo?? j?dro ?to?n? strategie a v?t?inou jsou obklopeni sk?et?mi v?le?n?ky.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_04");	//Je tedy velice t??k? se k n?komu z nich dostat, ani? by bylo nutn? si prosekat cestu alespo? t?iceti nep??teli.
	B_LogEntry(TOPIC_OrcElite,"Ingmar se zm?nil o hlavn?m sk?et?m vojev?dci.");
};

func void DIA_Ingmar_ORKELITE_wasTun()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wasTun_15_00");	//Co ud?l?me?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_01");	//Kdy? jich je tolik jako te?, jedn? se v?t?inou o n?jezdnou patrolu, kterou vede ten nejv??e postaven? z nich.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_02");	//Nejv??e postaven? vojev?dce si za??d? hlavn? stan v n?jak? jeskyni, odkud vys?l? sv? vojsko do boje.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_03");	//Pokud by se n?m poda?ilo tohoto velitele zne?kodnit, z?skali bychom tak nezanedbatelnou v?hodu.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_04");	//Sk?et? velitel se v?t?inou pohybuje v bl?zkosti sv?ch nep??tel. Asi by bylo dobr? hledat jeho jeskyni n?kde nedaleko m?sta.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_05");	//N?kolik sk?et? bylo spat?eno pobl?? Lobartovy farmy. Asi by bylo moudr? za??t s p?tr?n?m tam.
	B_LogEntry(TOPIC_OrcElite,"Podle Ingmara bych m?l sk?et?ho plukovn?ka hledat v jeskyni kdesi u Lobartova statku. M?m ho naj?t a zni?it.");
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};


instance DIA_Ingmar_HAUPTQUARTIER(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 41;
	condition = DIA_Ingmar_HAUPTQUARTIER_Condition;
	information = DIA_Ingmar_HAUPTQUARTIER_Info;
	permanent = FALSE;
	description = "Na?el jsem hlavn? stan sk?et?. Jejich vojev?dce padl.";
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
	AI_Output(other,self,"DIA_Ingmar_HAUPTQUARTIER_15_00");	//Na?el jsem hlavn? stan sk?et?. Jejich vojev?dce padl.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_01");	//To je vynikaj?c? zpr?va. Sk?eti tak nebudou m?t n?jak? ?as na ?tok ani pomy?len?.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_02");	//To nen? ?patn?. Kdybychom m?li v?c ryt??? jako jsi ty, byla by nadch?zej?c? bitva p?edem rozhodnuta.
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
	description = "(Tento svitek je t?m?? nemo?n? ukr?st.)";
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

