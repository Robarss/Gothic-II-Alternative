
instance DIA_DiegoOw_EXIT(C_Info)
{
	npc = PC_ThiefOW;
	nr = 999;
	condition = DIA_DiegoOw_EXIT_Condition;
	information = DIA_DiegoOw_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoOw_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoOw_Hallo(C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_DiegoOw_Hallo_Condition;
	information = DIA_DiegoOw_Hallo_Info;
	important = TRUE;
};


func int DIA_DiegoOw_Hallo_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Hallo_Info()
{
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_00");	//Hej, myslel jsem si, ?e jsi mrtv?.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_01");	//Ano... to jsem tak? byl.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_02");	//Ale te? jsem zp?tky a hled?m d?kaz o tom, ?e tady jsou draci.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_03");	//Pro? to d?l???
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_04");	//Pracuji pro lorda Hagena. S pomoc? paladin? se n?m ur?it? poda?? draky zastavit.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_05");	//Paladinov?? N?co ti ?eknu. Kdy? se mi odsud poda?ilo uprchnout, ?el jsem do Khorinisu.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_06");	//Cht?l jsem paladiny varovat p?ed draky. Nebesa v?d?, pro? jsem to v?bec zkou?el.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_07");	//Ten nadutec Lothar m? ani neposlouchal - a u? v?bec m? nenechal si promluvit s lordem Hagenem.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_08");	//M?sto toho m? poslali zp?tky s touhle v?pravou. Tak?e o paladinech mi v?bec nemluv.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_09");	//D?le?it? je zastavit draky, dokud m?me ?as - a v?bec nez?le?? na tom, kdo n?m k tomu pom??e.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_10");	//Zastavit je? M?li bychom vypadnout z tohohle ?dol?, dokud m?me ?as aspo? na to.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//?ekni, jak se ti poda?ilo dostat se p?es pr?smyk? Myslel jsem, ?e se to tam hem?? sk?ety.
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//Skrz opu?t?n? d?l vede cesta, kterou sk?eti nehl?daj?.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//To je dobr? v?d?t. V tom p??pad? se brzy vyd?m do Khorinisu - m?m tam p?r nevy??zen?ch ??t?.
};


instance DIA_DiegoOw_Beweise(C_Info)
{
	npc = PC_ThiefOW;
	nr = 2;
	condition = DIA_DiegoOw_Beweise_Condition;
	information = DIA_DiegoOw_Beweise_Info;
	description = "Poslouchej, pot?ebuju ten d?kaz.";
};


func int DIA_DiegoOw_Beweise_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Beweise_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_11");	//Poslouchej, pot?ebuju ten d?kaz.
	if(MIS_ScoutMine == LOG_Running)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//Dobr?, ud?l?m pro tebe, co bude v m?ch sil?ch. Ale nebudu za nikoho riskovat krk.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//Dobr?, pokud to je smysl tvoj? cesty - b?? si promluvit s velitelem Garondem.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//Pokud n?kdo v? n?co o ?toc?ch drak?, tak to jsou ho?i z hradu.
	};
	if(MIS_ScoutMine == LOG_Running)
	{
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//Jsem na cest? z Garondova rozkazu. Pot?ebuje v?d?t, kolik rudy jste zat?m vykutali.
		AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//A pak ti d? ten d?kaz, po kter?m tak tou????
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//P?esn? tak. Tak?e co - m??e? mi n?co ??ct?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Garond_11_01");	//A kdy? bude? na hrad?, mo?n? bys mohl Garondovi ??ct n?co, co by ho mohlo velmi zaj?mat.
	};
	if(Npc_GetDistToWP(self,"LOCATION_02_05") <= 1000)
	{
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//Tady vzadu v jeskyni jsou ?TY?I bedny s rudou. Narubali ji Silvestrovi chlapi.
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//Jen a? si pro ni Garond p?ijde a vezme si ji - ale to u? j? tady nebudu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_01");	//Nedaleko odsud v jeskyni jsou schovan? ?TY?I bedny pln? rudy, kterou vykopali Silvestrovi mu?i.
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_02");	//Garondovi nic nebr?n?, aby si pro n? p?i?el. Mn? by na nic nebyly ...
	};
	Silvestro_Ore = TRUE;
	B_LogEntry(TOPIC_ScoutMine,"Diego dopravil ?TY?I bedny rudy, kterou vyt??ili Silvestrovi mu?i, do bezpe??.");
};


instance DIA_DiegoOw_Mine(C_Info)
{
	npc = PC_ThiefOW;
	nr = 3;
	condition = DIA_DiegoOw_Mine_Condition;
	information = DIA_DiegoOw_Mine_Info;
	permanent = FALSE;
	description = "Jak to, ?e jsi u rudy pr?v? ty?";
};


func int DIA_DiegoOw_Mine_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DiegoOw_Beweise))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Mine_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//Jak to, ?e jsi u rudy pr?v? ty?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//Byl jsem v Silvestrov? skupin?. T??ili jsme n?kolik dn? a pak za?al b?t Silvestro z ni?eho nic stra?n? nerv?zn?.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//?ekl, ?e bychom m?li ukr?t rudu na n?jak? bezpe?n? m?sto.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//No, a proto?e jsem se tehdy u? stejn? chystal k ?t?ku, nab?dl jsem se, ?e rudu schov?m.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//A to bylo moje jedin? ?t?st?. Horn?ci toti? narazili na p?r d?ln?ch ?erv?. ??dn? z nich nep?e?il.
};


instance DIA_DiegoOw_Ritter(C_Info)
{
	npc = PC_ThiefOW;
	nr = 4;
	condition = DIA_DiegoOw_Ritter_Condition;
	information = DIA_DiegoOw_Ritter_Info;
	permanent = FALSE;
	description = "Co ti dva mrtv? ryt??i p?ed tvou skr????";
};


func int DIA_DiegoOw_Ritter_Condition()
{
	if((Npc_HasItems(PAL_Leiche4,ItMi_OldCoin) == 0) || (Npc_HasItems(PAL_Leiche5,ItMi_OldCoin) == 0))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Ritter_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//Co ti dva mrtv? ryt??i p?ed tvou skr????
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//Na?la si je zubat? b?hem bitvy se skupinou ch?apavc?.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//No, Hornick? ?dol? m? svoje vlastn? z?kony. ??kal jsem jim to. Ale necht?li m? poslouchat.
};


instance DIA_DiegoOw_Perm(C_Info)
{
	npc = PC_ThiefOW;
	nr = 5;
	condition = DIA_DiegoOw_Perm_Condition;
	information = DIA_DiegoOw_Perm_Info;
	permanent = FALSE;
	description = "Co bych m?l o ?dol? v?d?t?";
};


func int DIA_DiegoOw_Perm_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Perm_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//Co bych m?l o ?dol? v?d?t?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//Od p?du bari?ry se tady p?r v?c? zm?nilo. Hlavn? slovo tu te? maj? sk?eti.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//My lid? nejsme nic jin?ho ne? ?r?dlo pro skute?n? p?ny ?dol?: draky.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//Dr? se stranou od v?eho, co je nad tvoje s?ly - a vyh?bej se v?emu, co vypad? jako drak.
};


instance DIA_DiegoOw_Gorn(C_Info)
{
	npc = PC_ThiefOW;
	nr = 6;
	condition = DIA_DiegoOw_Gorn_Condition;
	information = DIA_DiegoOw_Gorn_Info;
	permanent = FALSE;
	description = "Cht?l bych vykoupit Gornovi svobodu...";
};


func int DIA_DiegoOw_Gorn_Condition()
{
	if(MIS_RescueGorn == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Gorn_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//Cht?l bych vykoupit Gornovi svobodu, ale Garond za to chce 1000 zlat?ch.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//Hezk? sumi?ka. M?m u sebe 300 zlat?ch, klidn? si je vezmi. Ale zbytek je na tob?.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	B_LogEntry(TOPIC_RescueGorn,"Diego mi zaplatil 300, abych Gornovi pomohl na svobodu.");
};


var int Diego_MerkeDEX;
var int Diego_MerkeSTR;

instance DIA_DiegoOw_Teach(C_Info)
{
	npc = PC_ThiefOW;
	nr = 100;
	condition = DIA_DiegoOw_Teach_Condition;
	information = DIA_DiegoOw_Teach_Info;
	permanent = TRUE;
	description = "M??e? m? n??emu nau?it?";
};


func int DIA_DiegoOw_Teach_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//M??e? m? n??emu nau?it?
	AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_01");	//Jist?, co bys r?d ved?l?
	Diego_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Diego_MerkeSTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACH_BACK()
{
	if(other.attribute[ATR_DEXTERITY] > Diego_MerkeDEX)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_02");	//Tv? obratnost se zlep?ila.
	};
	if(other.attribute[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_03");	//(pochvaln?) Dob?e. Tv? s?la se zlep?ila.
	};
	Info_ClearChoices(DIA_DiegoOw_Teach);
};

func void DIA_DiegoOw_TEACHDEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACHDEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACHSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACHSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoOw_TEACHSTR_5);
};


instance DIA_ThiefOW_PICKPOCKET(C_Info)
{
	npc = PC_ThiefOW;
	nr = 900;
	condition = DIA_ThiefOW_PICKPOCKET_Condition;
	information = DIA_ThiefOW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_ThiefOW_PICKPOCKET_Condition()
{
	return C_Beklauen(120,600);
};

func void DIA_ThiefOW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
	Info_AddChoice(DIA_ThiefOW_PICKPOCKET,Dialog_Back,DIA_ThiefOW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_ThiefOW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_ThiefOW_PICKPOCKET_DoIt);
};

func void DIA_ThiefOW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
};

func void DIA_ThiefOW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
};


instance DIA_Addon_ThiefOW_Together(C_Info)
{
	npc = PC_ThiefOW;
	nr = 11;
	condition = DIA_Addon_ThiefOW_Together_Condition;
	information = DIA_Addon_ThiefOW_Together_Info;
	description = "Poj?me spolu.";
};


func int DIA_Addon_ThiefOW_Together_Condition()
{
	return TRUE;
};

func void DIA_Addon_ThiefOW_Together_Info()
{
	AI_Output(other,self,"DIA_Addon_Diego_Together_15_00");	//Poj?me spolu.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_01");	//K pr?smyku? Pro? ne ...
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_02");	//Jdi nap?ed. Potom se tady setk?me.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_03");	//Ale necho?me bl?zko hradu nebo sk?et? palis?dy.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_04");	//Taky bychom se m?li vyhnout v?em paladinsk?m t?bor?m.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_05");	//Pr?v? jsem utekl a nechci se nechat znovu chytit a zase makat v dole.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_06");	//A je ti z?ejm? jasn?, ?e se mus?me vyhnout drak?m.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_07");	//Jen mi ?ekni, jakmile bude? p?ipraven.
};


instance DIA_Addon_ThiefOW_ComeOn(C_Info)
{
	npc = PC_ThiefOW;
	nr = 12;
	condition = DIA_Addon_ThiefOW_ComeOn_Condition;
	information = DIA_Addon_ThiefOW_ComeOn_Info;
	permanent = TRUE;
	description = "Poj?me.";
};


func int DIA_Addon_ThiefOW_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_ThiefOW_Together) && (Diego_angekommen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Diego_ComeOn_15_00");	//Poj?me.
	if(C_DiegoTooFar(0))
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_01");	//To je ?patn? sm?r!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_02");	//V po??dku.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_ThiefOW_GoHome(C_Info)
{
	npc = PC_ThiefOW;
	nr = 13;
	condition = DIA_Addon_ThiefOW_GoHome_Condition;
	information = DIA_Addon_ThiefOW_GoHome_Info;
	permanent = TRUE;
	description = "Z?sta? tu a po?kej.";
};


func int DIA_Addon_ThiefOW_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_Diego_WarteHier_15_00");	//Z?sta? tu a po?kej.
	if(Npc_GetDistToWP(self,"LOCATION_02_05") < 2000)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_01");	//Dobr?.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
	}
	else if(Npc_GetDistToWP(self,"DT_E1_04") < (1500 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_02");	//Budu ?ekat venku u ve?e.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"XARDAS");
	}
	else if(Npc_GetDistToWP(self,"OW_NEWMINE_11") < (4000 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_03");	//Budu ?ekat bl?zko dolu.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"FAJETH");
	}
	else if(Npc_GetDistToWP(self,"OW_MINE3_OUT") < (1200 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_04");	//Budu ?ekat p?ed dolem.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"SILVESTRO");
	}
	else if(Npc_GetDistToWP(self,"OW_PATH_266") < (3000 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_05");	//Po?k?m nedaleko.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"GRIMES");
	}
	else if(Npc_GetDistToWP(self,"LOCATION_02_05") < 15000)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_06");	//Ne, vr?t?m se do jeskyn?.
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_07");	//M??e? m? znova nav?t?vit, a? dod?l?? svou pr?ci.
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_08");	//Nicm?n? kdy? ti to bude trvat dlouho, vr?t?m se do jeskyn?.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_09");	//D?l?? si srandu. Rozd?lit se tady???
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_10");	//Nikdy!
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_11");	//M??eme j?t pr?smykem spolu.
	};
};

func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_00");	//Po?k?m nedaleko, jestli se tam chce? porozhl?dnout.
};

func void B_Addon_Diego_PassOtherDirection()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_01");	//Mus?me j?t jinama, abychom se dostali do pr?smyku.
};


var int Diego_TooFarComment;
var int Diego_BurgVariation;
var int Diego_FajethVariation;
var int Diego_SilvestroVariation;
var int Diego_GrimesVariation;
var int Diego_XardasVariation;
var int Diego_IceVariation;

instance DIA_Addon_ThiefOW_TooFar(C_Info)
{
	npc = PC_ThiefOW;
	nr = 14;
	condition = DIA_Addon_ThiefOW_TooFar_Condition;
	information = DIA_Addon_ThiefOW_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_ThiefOW_TooFar_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(C_DiegoTooFar(0))
		{
			if(Diego_TooFarComment == FALSE)
			{
				return TRUE;
			};
		}
		else
		{
			Diego_TooFarComment = FALSE;
		};
	};
	return 0;
};

func void DIA_Addon_ThiefOW_TooFar_Info()
{
	if(C_DiegoTooFar(1000) == LOC_ANGAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_02");	//Nem?m r?d tady tu hrobku.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_03");	//?el bych rad?ji kolem.
	}
	else if(C_DiegoTooFar(1000) == LOC_ICE)
	{
		if(Diego_IceVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_04");	//To je vstup do b?val?ho Nov?ho t?bora.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_05");	//P?edpokl?d?m, ?e je tam drak.
			B_Addon_Diego_PassOtherDirection();
			Diego_IceVariation = 1;
		}
		else
		{
			B_Addon_Diego_PassOtherDirection();
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_SWAMP)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_06");	//Ten mo??l je mrtv?.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_07");	//Nebyl bych p?ekvapen, kdyby tam na n?s ?ekal drak.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_08");	//M?li bychom se od takov?ho m?sta dr?et d?l.
	}
	else if(C_DiegoTooFar(1000) == LOC_FIRE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_09");	//Vsadil bych se, ?e tam naho?e bychom potkali draka.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_10");	//A v?? v?bec, ?e bych r?d dorazil do Khorinisu ?iv??
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_11");	//Vyberme si n?jakou jinou cestu.
	}
	else if(C_DiegoTooFar(1000) == LOC_LAKE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_12");	//To jezero n?s nikam nedovede.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_13");	//Pr?smyk je na opa?n? stran?.
	}
	else if(C_DiegoTooFar(1000) == LOC_XARDAS)
	{
		if(Diego_XardasVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_14");	//To je star? Xrdasova v??. U? ji ale samoz?ejm? opustil.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_15");	//Nebyl bych p?ekvapen, kdyby na n?s je?t? ?ekaly n?jak? nemil? p?ekvapen?.
			B_Addon_Diego_WillWaitOutside();
			Diego_XardasVariation = 1;
		}
		else
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos(self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(self,"XARDAS");
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_FAJETHMINE)
	{
		if(Diego_FajethVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_16");	//Fajeth?v d?l je tam dole.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_17");	//Dol??! Ne se mnou!
			Diego_FajethVariation = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_18");	//Volil bych rad?ji cestu mimo ten d?l.
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_SILVESTROMINE)
	{
		if(Diego_SilvestroVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_19");	//To je d?l, kde jsem byl nucen pracovat, kdy? jsem se vr?til s kolonou v?z??.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_20");	//Jsem si zcela jist, ?e tam nikdo nep?e?il.
			B_Addon_Diego_WillWaitOutside();
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_20");	//Kdy? ti to bude trvat dlouho, vr?t?m se do jeskyn?.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_21");	//Chce? abych zde z?stal a po?kal, a? se vr?t??.
			Diego_SilvestroVariation = 1;
		}
		else
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos(self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(self,"SILVESTRO");
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_GRIMESMINE)
	{
		if(Diego_GrimesVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_21");	//Toto je jeden z nov?ch paladinsk?ch dol?.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_22");	//Nikdy - nechci na tom nic m?nit.
			Diego_GrimesVariation = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_23");	//Dal bych p?ednost vyhnout se tomu dolu.
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_BURG)
	{
		if(Diego_BurgVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_24");	//Jsi blb?? Ne k hradu!
			Diego_BurgVariation = 1;
		}
		else if(Diego_BurgVariation == 1)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_25");	//Ty ka?le? na m? rady? Ne k hradu!
			Diego_BurgVariation = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_26");	//??k?m ne k hradu. Rozum???
			Diego_BurgVariation = 1;
		};
	}
	else if(C_DiegoTooFar(1000) == LOC_ORCBARRIER)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_27");	//Nemo?n?. Cesta kolem palis?dy je velice nebezpe?n?.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_28");	//Mysl?m, ?e bude nejlep?? j?t na z?pad a zkusit naj?t odtud lep?? cestu.
	}
	else if(C_DiegoTooFar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_29");	//Dostaneme se ke sk?et? palis?d?, pokud p?jdeme tudy.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_30");	//P?ejdeme pr?smyk!
	};
	Diego_TooFarComment = TRUE;
};

func void B_Diego_WirSindDa()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_02");	//P?jdu chv?li s?m ...
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_03");	//Mus?m je?t? n?co ud?lat, ne? se vr?t?m do Khorinisu.
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_04");	//D?ky p??teli, uvid?me se ve m?st?.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"PASS");
	Diego_angekommen = TRUE;
};


instance DIA_Addon_ThiefOW_Angekommen(C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_Addon_ThiefOW_Angekommen_Condition;
	information = DIA_Addon_ThiefOW_Angekommen_Info;
	important = TRUE;
};


func int DIA_Addon_ThiefOW_Angekommen_Condition()
{
	if(Npc_GetDistToWP(self,"OW_VM_ENTRANCE") < 800)
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_Angekommen_Info()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_01");	//Dobr?, p?jdeme.
	B_GivePlayerXP(500);
	B_Diego_WirSindDa();
};


instance DIA_Addon_ThiefOW_Nostalgie(C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_Addon_ThiefOW_Nostalgie_Condition;
	information = DIA_Addon_ThiefOW_Nostalgie_Info;
	important = TRUE;
};


func int DIA_Addon_ThiefOW_Nostalgie_Condition()
{
	if(Npc_GetDistToWP(self,"WP_INTRO14") < 2000)
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_Nostalgie_Info()
{
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_01");	//Vzpom?n???
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_02");	//Vra? se zp?t, kde jsme se potkali poprv?.
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_03");	//Po?kej ...
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_04");	//A m?lo by tam b?t n?co dal??ho v t? oblasti - sakra - nem??u si vzpomenout.
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_05");	//Cokoliv ...
	B_GivePlayerXP(500);
	hero.exp = hero.exp + 500;
	PrintScreen(ConcatStrings(NAME_Addon_NostalgieBonus,IntToString(500)),-1,60,FONT_Screen,2);
	B_Diego_WirSindDa();
};


instance DIA_Addon_ThiefOW_PERM(C_Info)
{
	npc = PC_ThiefOW;
	nr = 10;
	condition = DIA_Addon_ThiefOW_PERM_Condition;
	information = DIA_Addon_ThiefOW_PERM_Info;
	permanent = TRUE;
	description = "V?e v po??dku?";
};


func int DIA_Addon_ThiefOW_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DiegoOw_Perm) && Npc_KnowsInfo(other,DIA_Addon_ThiefOW_Together))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Diego_PERM_15_00");	//V?e v po??dku?
	if(self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_01");	//Ne?kodil by n?jak? l??iv? lektvar. Nem?? nejak??
	}
	else if((DiegoOW.aivar[AIV_PARTYMEMBER] == FALSE) && (Diego_angekommen == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_02");	//Jen mi ?ekni, jak n?s bude? cht?t odv?st jinam.
	}
	else if(Diego_angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_03");	//V pohod?. Pouze si beru kr?tkou p?est?vku.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_04");	//Dob?e.
	};
};

