
instance DIA_Addon_Brandon_EXIT(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 999;
	condition = DIA_Addon_Brandon_EXIT_Condition;
	information = DIA_Addon_Brandon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Brandon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Brandon_Hello(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 1;
	condition = DIA_Addon_Brandon_Hello_Condition;
	information = DIA_Addon_Brandon_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Brandon_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_00");	//Pod?vejme, novic!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_01");	//A k tomu suchozemsk? krysa!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_02");	//Nejsi trochu such? na pir?ta.
};


instance DIA_Addon_Brandon_AnyNews(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 99;
	condition = DIA_Addon_Brandon_AnyNews_Condition;
	information = DIA_Addon_Brandon_AnyNews_Info;
	permanent = TRUE;
	description = "N?co nov?ho?";
};


func int DIA_Addon_Brandon_AnyNews_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_AnyNews_15_00");	//N?co nov?ho?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_01");	//Vskutku. Jsem ran?n. Mohl bys mi d?t l??iv? lektvar?
		}
		else if(C_AllCanyonRazorDead() == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_02");	//Co pak? P?jdeme d?le nebo co?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_03");	//M??e? se na n?co zeptat! Mysl?m ?e tu nejsou jednotliv? b?itvy!
		};
	}
	else if((GregIsBack == TRUE) && !Npc_IsDead(Greg) && (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_04");	//Ne, ale douf?m ?e kdy? je Greg zp?tky, ?e se to rychle zm?n?.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_06");	//Po?kej chv?li ...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_07");	//Nic se nezm?nilo, v?e je jako p?edt?m.
	};
};


instance DIA_Addon_Brandon_WannaLearn(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 11;
	condition = DIA_Addon_Brandon_WannaLearn_Condition;
	information = DIA_Addon_Brandon_WannaLearn_Info;
	description = "M??e? m? n?co nau?it?";
};


func int DIA_Addon_Brandon_WannaLearn_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_WannaLearn_15_00");	//M??e? m? n?co nau?it?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_01");	//Tebe? M??u t? nau?it jak b?t siln?j?? a obratn?j??.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_02");	//Nicm?n? pro? bych to m?l d?lat?
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00");	//Proto?e ti koup?m drink?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_03");	//To nezn? ?patn?, tak n?co dones.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_04");	//Ale nenos mi n?jak? levn? dry?k!
	MIS_Brandon_BringHering = LOG_Running;
	Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_BrandonTeach);
	Log_CreateTopic(TOPIC_Addon_BrandonBooze,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BrandonBooze,LOG_Running);
	Log_AddEntry(TOPIC_Addon_BrandonBooze,"Mus?m koupit Bradonovi drink. Pouze pak m? bude u?it.");
};


instance DIA_Addon_Brandon_HoleGrog(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 12;
	condition = DIA_Addon_Brandon_HoleGrog_Condition;
	information = DIA_Addon_Brandon_HoleGrog_Info;
	description = "M?m pro tebe grog.";
};


func int DIA_Addon_Brandon_HoleGrog_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_HoleGrog_Info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00");	//M?m pro tebe grog.
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_01");	//Chce? m? otr?vit???
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_02");	//Zkou??? m? otr?vit? V?? v?bec, co je uvnit??
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_03");	//Star? Samuel m? dobr? chlast, dones mi n?co od n?j!
	if(Player_KnowsSchnellerHering == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_05");	//Mysl?? 'Rychl?ho sle?e'?
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_04");	//Jo, to si mysl?m!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_05");	//U? m?? Samuel?v speci?l?
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_07");	//Ne, je?t? ne.
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_06");	//St?j, m?ls to pouze zkusit!
	};
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_08");	//Miluji tento ??belsk? n?poj!
	B_LogEntry(TOPIC_Addon_BrandonBooze,"Grog nen? pro Brandona dost dobr?. Chce 'Rychl?ho sle?e'. Pouze Samuel m? tento chlast.");
};


instance DIA_Addon_Brandon_SchnellerHering(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 13;
	condition = DIA_Addon_Brandon_SchnellerHering_Condition;
	information = DIA_Addon_Brandon_SchnellerHering_Info;
	description = "Zkus to!";
};


func int DIA_Addon_Brandon_SchnellerHering_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn) && (Npc_HasItems(other,ItFo_Addon_SchnellerHering) > 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_SchnellerHering_Info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_GiveGrog_15_00");	//Zkus to.
	B_GiveInvItems(other,self,ItFo_Addon_SchnellerHering,1);
	B_UseItem(self,ItFo_Addon_SchnellerHering);
	AI_Output(self,other,"DIA_Addon_Brandon_GiveGrog_04_01");	//Ahh! Jde to dol? jak tekut? ohe?!
	B_LogEntry(TOPIC_Addon_BrandonBooze,"Dal jsem Bradonovi drink. Nyn? m? bude r?d u?it.");
	MIS_Brandon_BringHering = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


var int Brandon_Merke_Str;
var int Brandon_Merke_Dex;

instance DIA_Addon_Brandon_TeachPlayer(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 777;
	condition = DIA_Addon_Brandon_TeachPlayer_Condition;
	information = DIA_Addon_Brandon_TeachPlayer_Info;
	permanent = TRUE;
	description = "Nau? m? n?co!";
};


func int DIA_Addon_Brandon_TeachPlayer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_TeachPlayer_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_TeachPlayer_15_00");	//Nau? m? n?co!
	Brandon_Merke_Str = other.attribute[ATR_STRENGTH];
	Brandon_Merke_Dex = other.attribute[ATR_DEXTERITY];
	if(MIS_Brandon_BringHering == LOG_SUCCESS)
	{
		Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_04_01");	//P?edpokl?dal jsem, ?e mi p?inese? n?co slu?n?ho, chlap?e.
	};
};

func void DIA_Addon_Brandon_TeachPlayer_Back()
{
	if(other.attribute[ATR_STRENGTH] > Brandon_Merke_Str)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_00");	//Dobr? pr?ce chlape, zase jsi o trochu siln?j??.
	};
	if(other.attribute[ATR_DEXTERITY] > Brandon_Merke_Dex)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_01");	//??m jsi obratn?j??, t?m l?pe zas?hne? c?l.
	};
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
};

func void DIA_Addon_Brandon_TeachPlayer_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};

func void DIA_Addon_Brandon_TeachPlayer_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};

func void DIA_Addon_Brandon_TeachPlayer_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};

func void DIA_Addon_Brandon_TeachPlayer_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};


instance DIA_Addon_Brandon_Anheuern(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 11;
	condition = DIA_Addon_Brandon_Anheuern_Condition;
	information = DIA_Addon_Brandon_Anheuern_Info;
	permanent = FALSE;
	description = "M?l bys mi pomoct.";
};


func int DIA_Addon_Brandon_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_00");	//M?l bys mi pomoct.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_01");	//To jsou opravdu velk? novinky. Kdo to ??kal?
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_02");	//Greg, m?li bychom zab?t b?itvy v ka?onu.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_03");	//Tak m?me tady kone?n? boj!
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_04");	//Pro m? za m?, ??m d??v zabijeme ty bestie, t?m d??v se vr?t?me.
};


instance DIA_Addon_Brandon_ComeOn(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 12;
	condition = DIA_Addon_Brandon_ComeOn_Condition;
	information = DIA_Addon_Brandon_ComeOn_Info;
	permanent = TRUE;
	description = "Poj? se mnou.";
};


func int DIA_Addon_Brandon_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Brandon_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_Weiter_15_00");	//Poj? se mnou.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_02");	//Poj?me trochu zp?t.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_01");	//Jako obvykle!
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_Brandon_GoHome(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 13;
	condition = DIA_Addon_Brandon_GoHome_Condition;
	information = DIA_Addon_Brandon_GoHome_Info;
	permanent = TRUE;
	description = "U? t? v?ce nepot?ebuji.";
};


func int DIA_Addon_Brandon_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_DontNeedYou_15_00");	//U? t? v?ce nepot?ebuji.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_01");	//V po??dku, bez probl?mu.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_02");	//Mo?n? se je?t? jednou spolu napijem.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Brandon_TooFar(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 14;
	condition = DIA_Addon_Brandon_TooFar_Condition;
	information = DIA_Addon_Brandon_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Brandon_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_00");	//Chce? cel? ostrov lidupr?zdn????
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_01");	//Jdeme zp?tky do t?bora.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_02");	//Jdu zp?t do t?bora.
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

