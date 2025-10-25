
instance DIA_None_101_Mario_EXIT(C_Info)
{
	npc = None_101_Mario;
	nr = 999;
	condition = DIA_None_101_Mario_EXIT_Condition;
	information = DIA_None_101_Mario_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_None_101_Mario_EXIT_Condition()
{
	return TRUE;
};

func void DIA_None_101_Mario_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_None_101_Mario_Job(C_Info)
{
	npc = None_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_Job_Condition;
	information = DIA_None_101_Mario_Job_Info;
	permanent = TRUE;
	description = "Co tady děláš?";
};


func int DIA_None_101_Mario_Job_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == FALSE) && (Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Job_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Job_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//Doufám, že co nejdřív připluje loď, kterou bych si mohl pronajmout.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//Tohle flákání mi už vážně leze na nervy.
};


instance DIA_None_101_Mario_YouNeedMe(C_Info)
{
	npc = None_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_YouNeedMe_Condition;
	information = DIA_None_101_Mario_YouNeedMe_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_None_101_Mario_YouNeedMe_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YouNeedMe_Info()
{
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//Slyšel jsem, že hledáš lidi na svou loď?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//A?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//Jdu do toho!
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"V přístavní krčmě se se mnou dal do řeči bývalý námořník Mario, který se chce opět dostat na loď.");
};


instance DIA_None_101_Mario_WhyNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 5;
	condition = DIA_None_101_Mario_WhyNeedYou_Condition;
	information = DIA_None_101_Mario_WhyNeedYou_Info;
	permanent = FALSE;
	description = "Proč bych tě měl s sebou brát?";
};


func int DIA_None_101_Mario_WhyNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//Proč bych tě měl s sebou brát?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//Prostě proto, že mě potřebuješ.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//Jsem... Byl jsem poručíkem v královském námořnictvu.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//Sloužil jsem jako námořník na Králi Rhobarovi a Chloubě Myrtany.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//V bitvě o Východní souostroví jsem jednou rukou poslal zpátky do Beliarovy říše dva tucty skřetů.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//Bohužel poté, co potopili naší vlajkovou loď, nás zbylo příliš málo a museli jsme se stáhnout.
};


instance DIA_None_101_Mario_WhyHere(C_Info)
{
	npc = None_101_Mario;
	nr = 7;
	condition = DIA_None_101_Mario_WhyHere_Condition;
	information = DIA_None_101_Mario_WhyHere_Info;
	permanent = FALSE;
	description = "Tak proč jsi tady?";
};


func int DIA_None_101_Mario_WhyHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyHere_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//Tak proč jsi tady?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//Flotila je poražená a truhlice se žoldem prázdná.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//Když mě propustili, zůstal jsem trčet v téhle díře. Tak hledám nějakou další práci.
};


instance DIA_None_101_Mario_Abilities(C_Info)
{
	npc = None_101_Mario;
	nr = 8;
	condition = DIA_None_101_Mario_Abilities_Condition;
	information = DIA_None_101_Mario_Abilities_Info;
	permanent = FALSE;
	description = "Co umíš?";
};


func int DIA_None_101_Mario_Abilities_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Abilities_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//Co umíš?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//Jsem zkušený námořník a bojovník, navíc dokážu slušně zacházet s lodním dělem.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//Určitě bych tě pár věcí dokázal naučit, než doplujeme k cíli.
	B_LogEntry(Topic_Crew,"Vypadá to, že Mario je ve věcech námořních docela zběhlý. Možná by se se mnou mohl o pár zkušeností podělit.");
};


instance DIA_None_101_Mario_YourPrice(C_Info)
{
	npc = None_101_Mario;
	nr = 9;
	condition = DIA_None_101_Mario_YourPrice_Condition;
	information = DIA_None_101_Mario_YourPrice_Info;
	permanent = FALSE;
	description = "Co za to chceš?";
};


func int DIA_None_101_Mario_YourPrice_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YourPrice_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//Co za to chceš?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//Co bych chtěl? Budu rád, že odsud vypadnu.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//Plácneme si. Já ti pomůžu a ty mě odsud dostaneš.
};


instance DIA_None_101_Mario_CouldBeDangerous(C_Info)
{
	npc = None_101_Mario;
	nr = 10;
	condition = DIA_None_101_Mario_CouldBeDangerous_Condition;
	information = DIA_None_101_Mario_CouldBeDangerous_Info;
	permanent = FALSE;
	description = "Ta cesta může být nebezpečná.";
};


func int DIA_None_101_Mario_CouldBeDangerous_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YourPrice) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_CouldBeDangerous_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//Ta cesta může být nebezpečná.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//Na nebezpečí jsem zvyklý. Když jsi na moři, je každý den nebezpečný.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//Příští bouře může být tvoje smrt a příšery z hlubin dokáží spolknout celou loď jako malinu.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//A o skřetích galérách snad ani mluvit nemusím, že? Věř mi, nenajde se nic, čeho bych se bál. Námořník, který se bojí, je už předem mrtvý.
};


instance DIA_None_101_Mario_DontNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 13;
	condition = DIA_None_101_Mario_DontNeedYou_Condition;
	information = DIA_None_101_Mario_DontNeedYou_Info;
	permanent = FALSE;
	description = "K ničemu bys mi nebyl.";
};


func int DIA_None_101_Mario_DontNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_DontNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//K ničemu bys mi nebyl.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//Jsem nejlepší námořník, kterého tady můžeš sehnat.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//Stačí se na tebe podívat a hned je jasné, že o navigaci nevíš, co by se za nehet vešlo.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//Takže radši všechno dvakrát zvaž, než budeš někomu věřit.
};


instance DIA_None_101_Mario_NeedGoodMen(C_Info)
{
	npc = None_101_Mario;
	nr = 2;
	condition = DIA_None_101_Mario_NeedGoodMen_Condition;
	information = DIA_None_101_Mario_NeedGoodMen_Info;
	permanent = FALSE;
	description = "Dobří pomocníci se vždycky hodí.";
};


func int DIA_None_101_Mario_NeedGoodMen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_NeedGoodMen_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//Dobří pomocníci se vždycky hodí.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//Jasná věc, uvidíme se na lodi.
	B_GivePlayerXP(XP_Crewmember_Success);
	Mario_IsOnBoard = LOG_SUCCESS;
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


instance DIA_Mario_LeaveMyShip(C_Info)
{
	npc = None_101_Mario;
	nr = 11;
	condition = DIA_Mario_LeaveMyShip_Condition;
	information = DIA_Mario_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Přece jenom bys mi k ničemu nebyl!";
};


func int DIA_Mario_LeaveMyShip_Condition()
{
	if((Mario_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mario_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//Přece jenom bys mi k ničemu nebyl!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//Jak je libo. Víš, kde mě najít!
	Mario_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Mario_StillNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 11;
	condition = DIA_Mario_StillNeedYou_Condition;
	information = DIA_Mario_StillNeedYou_Info;
	permanent = TRUE;
	description = "Přece jenom bys mi k něčemu mohl být!";
};


func int DIA_Mario_StillNeedYou_Condition()
{
	if(((Mario_IsOnBoard == LOG_OBSOLETE) || (Mario_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Mario_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//Přece jenom bys mi k něčemu mohl být!
	if(Mario_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//Věděl jsem to! Uvidíme se na lodi!
		Mario_IsOnBoard = LOG_SUCCESS;
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
	}
	else
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//Takhle se ke mně chovat nesmíš. Vykuchám tě!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_MARIO_PICKPOCKET(C_Info)
{
	npc = None_101_Mario;
	nr = 900;
	condition = DIA_MARIO_PICKPOCKET_Condition;
	information = DIA_MARIO_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_MARIO_PICKPOCKET_Condition()
{
	return C_Beklauen(71,220);
};

func void DIA_MARIO_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_mario_pickpocket);
	Info_AddChoice(dia_mario_pickpocket,Dialog_Back,dia_mario_pickpocket_back);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_PICKPOCKET,DIA_MARIO_PICKPOCKET_DoIt);
};

func void DIA_MARIO_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_mario_pickpocket);
};

func void dia_mario_pickpocket_back()
{
	Info_ClearChoices(dia_mario_pickpocket);
};

