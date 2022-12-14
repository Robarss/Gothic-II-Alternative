
instance DIA_Angar_NW_KAP5_EXIT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 999;
	condition = DIA_Angar_NW_KAP5_EXIT_Condition;
	information = DIA_Angar_NW_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Angar_NW_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Angar_NW_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Angar_NW_AllDragonsDead(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 59;
	condition = DIA_Angar_NW_AllDragonsDead_Condition;
	information = DIA_Angar_NW_AllDragonsDead_Info;
	description = "Jak se vede?";
};


func int DIA_Angar_NW_AllDragonsDead_Condition()
{
	return TRUE;
};

func void DIA_Angar_NW_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_AllDragonsDead_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_01");	//Docela dob?e. Ale po??d m?m ty ??len? bolesti. I kdy? od t? doby, co nejsem v Hornick?m ?dol?, se to dost zlep?ilo.
	if(Angar_IsOnBoard != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_02");	//Z?stanu tady. Tak?e kdybys m? pot?eboval, v??, kde m? hledat.
	};
};


instance DIA_Angar_NW_KnowWhereEnemy(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_KnowWhereEnemy_Condition;
	information = DIA_Angar_NW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Chyst?m se opustit Khorinis. Chce? se p?idat?";
};


func int DIA_Angar_NW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Angar_IsOnBoard == FALSE) && Npc_KnowsInfo(other,DIA_Angar_NW_AllDragonsDead))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_00");	//Chyst?m se opustit Khorinis. Chce? se p?idat?
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_01");	//??m d?l budu od Hornick?ho ?dol?, t?m l?p. Kdy vyraz?me?
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Angar je r?d za ka?dou m?li, o kterou se vzd?l? od Hornick?ho ?dol?. Nab?dl mi, ?e m? na cest? doprovod?.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_02");	//Moment?ln? m?m dost lid? na to, aby mohli ??dit lo?. Mo?n? se k tob? pozd?ji je?t? vr?t?m.
		AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_03");	//Fajn. Budu tady, kdybys m? pot?eboval.
	}
	else
	{
		Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy,"D?m ti v?d?t, a? budeme vyplouvat.",DIA_Angar_NW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy,"Zajdi tedy do p??stavu. Pak se tam potk?me.",DIA_Angar_NW_KnowWhereEnemy_Yes);
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_Yes_15_00");	//Zajdi tedy do p??stavu. Pak se tam potk?me.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01");	//To se mi l?b?.
	self.flags = NPC_FLAG_IMMORTAL;
	Angar_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_GivePlayerXP(XP_Crewmember_Success);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
};

func void DIA_Angar_NW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_No_15_00");	//D?m ti v?d?t, a? budeme vyplouvat.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01");	//Dobr?.
	Angar_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
};


instance DIA_Angar_NW_LeaveMyShip(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_LeaveMyShip_Condition;
	information = DIA_Angar_NW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Z?sta? tady a starej se o sv? probl?my.";
};


func int DIA_Angar_NW_LeaveMyShip_Condition()
{
	if((Angar_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_LeaveMyShip_15_00");	//Z?sta? tady a starej se o sv? probl?my.
	AI_Output(self,other,"DIA_Angar_NW_LeaveMyShip_04_01");	//Dobr?. Vr?t?m se. Mo?n? to bude tak lep??.
	Angar_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Angar_NW_StillNeedYou(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_StillNeedYou_Condition;
	information = DIA_Angar_NW_StillNeedYou_Info;
	permanent = TRUE;
	description = "Vra? se na palubu.";
};


func int DIA_Angar_NW_StillNeedYou_Condition()
{
	if(((Angar_IsOnBoard == LOG_OBSOLETE) || (Angar_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_StillNeedYou_15_00");	//Vra? se na palubu.
	AI_Output(self,other,"DIA_Angar_NW_StillNeedYou_04_01");	//Jsi hor?? ne? j?. Trochu v?c rozhodnosti by ti jen prosp?lo. Je?t? se uvid?me.
	self.flags = NPC_FLAG_IMMORTAL;
	Angar_IsOnBoard = LOG_SUCCESS;
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


instance DIA_Angar_NW_PICKPOCKET(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 900;
	condition = DIA_Angar_NW_PICKPOCKET_Condition;
	information = DIA_Angar_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Angar_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(47,34);
};

func void DIA_Angar_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET,Dialog_Back,DIA_Angar_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Angar_NW_PICKPOCKET_DoIt);
};

func void DIA_Angar_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};

func void DIA_Angar_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};


instance DIA_Angar_NW_FOUNDAMULETT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 7;
	condition = DIA_Angar_NW_FOUNDAMULETT_Condition;
	information = DIA_Angar_NW_FOUNDAMULETT_Info;
	description = "Na?el jsem tv?j amulet.";
};


func int DIA_Angar_NW_FOUNDAMULETT_Condition()
{
	if(Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_FOUNDAMULETT_Info()
{
	B_AngarsAmulettAbgeben();
};

