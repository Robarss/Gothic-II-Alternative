
instance DIA_Addon_Pardos_EXIT(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 999;
	condition = DIA_Addon_Pardos_EXIT_Condition;
	information = DIA_Addon_Pardos_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Pardos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Pardos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Pardos_Hi(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 2;
	condition = DIA_Addon_Pardos_Hi_Condition;
	information = DIA_Addon_Pardos_Hi_Info;
	permanent = FALSE;
	description = "Jak ti je?";
};


func int DIA_Addon_Pardos_Hi_Condition()
{
	if(Sklaven_Flucht == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Pardos_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_00");	//Jak ti je?
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_01");	//(unaven?) Jsem zni?en? ... ?pln? zni?en?. Je kr?sn? letn? den nebo jedna z t?ch jasn?ch noc? kde z??? tis?ce hv?zd?
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_02");	//(je?t? unaven?ji) Nev?m ... kde je ten lehk? letn? d隝, kde jsou ty sv??? no?n? v?nky ... u? je nec?t?m ...
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_03");	//(rezignovan?) Zde zahynou jako prvn? o?i ...
};


instance DIA_Addon_Pardos_save(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 2;
	condition = DIA_Addon_Pardos_save_Condition;
	information = DIA_Addon_Pardos_save_Info;
	permanent = FALSE;
	description = "Vydr?. Z?chrana je na dosah.";
};


func int DIA_Addon_Pardos_save_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Pardos_Hi) && (Sklaven_Flucht == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pardos_save_Info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_save_15_00");	//Vydr?. Z?chrana je na dosah.
	AI_Output(self,other,"DIA_Addon_Pardos_save_03_01");	//(unaven?) D?ky. D?kuju ti za tv? laskav? slova.
};


var int Pardos_Geheilt;

instance DIA_Addon_Pardos_trank(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 2;
	condition = DIA_Addon_Pardos_trank_Condition;
	information = DIA_Addon_Pardos_trank_Info;
	permanent = FALSE;
	description = "Tady, vypij to. (d?t lektvar)";
};


func int DIA_Addon_Pardos_trank_Condition()
{
	if((Pardos_Geheilt == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Pardos_save))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pardos_trank_Info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_trank_15_00");	//Tady, vypij to.
	AI_StandupQuick(self);
	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Info_AddChoice(DIA_Addon_Pardos_trank,Dialog_Back,DIA_Addon_Pardos_trank_BACK);
	if(Npc_HasItems(other,ItPo_Health_01))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank,"D?t esenci hojiv? s?ly",DIA_Addon_Pardos_trank_01);
	};
	if(Npc_HasItems(other,ItPo_Health_02))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank,"D?t extrakt hojiv? s?ly",DIA_Addon_Pardos_trank_02);
	};
	if(Npc_HasItems(other,ItPo_Health_03))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank,"D?t elix?r hojiv? s?ly",DIA_Addon_Pardos_trank_03);
	};
	if(Npc_HasItems(other,ItFo_Addon_Meatsoup))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank,"D?t masov? v?var",DIA_Addon_Pardos_trank_Soup);
	};
};

func void B_SayPardosThanks()
{
	AI_Output(self,other,"DIA_Addon_Pardos_trank_03_00");	//D?ky, to mi ud?lalo dob?e.
};

func void DIA_Addon_Pardos_trank_BACK()
{
	Info_ClearChoices(DIA_Addon_Pardos_trank);
};

func void DIA_Addon_Pardos_trank_01()
{
	if(B_GiveInvItems(other,self,ItPo_Health_01,1))
	{
		B_UseItem(self,ItPo_Health_01);
	};
	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Pardos_Geheilt = TRUE;
	B_SayPardosThanks();
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Pardos_trank_02()
{
	if(B_GiveInvItems(other,self,ItPo_Health_02,1))
	{
		B_UseItem(self,ItPo_Health_02);
	};
	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Pardos_Geheilt = TRUE;
	B_SayPardosThanks();
	B_GivePlayerXP(XP_Ambient * 2);
};

func void DIA_Addon_Pardos_trank_03()
{
	if(B_GiveInvItems(other,self,ItPo_Health_01,3))
	{
		B_UseItem(self,ItPo_Health_03);
	};
	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Pardos_Geheilt = TRUE;
	B_SayPardosThanks();
	B_GivePlayerXP(XP_Ambient * 3);
};

func void DIA_Addon_Pardos_trank_Soup()
{
	AI_Output(other,self,"DIA_Addon_Pardos_trank_soup_15_00");	//Tady, dej si tento v?var.
	if(B_GiveInvItems(other,self,ItFo_Addon_Meatsoup,1))
	{
		B_UseItem(self,ItFo_Addon_Meatsoup);
	};
	AI_Output(self,other,"DIA_Addon_Pardos_trank_03_01");	//D?ky, to m? pos?l?.
	B_GivePlayerXP(XP_Ambient * 3);
};


instance DIA_Addon_Pardos_perm(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 99;
	condition = DIA_Addon_Pardos_perm_Condition;
	information = DIA_Addon_Pardos_perm_Info;
	permanent = TRUE;
	description = "Jak ti je?";
};


func int DIA_Addon_Pardos_perm_Condition()
{
	if(Pardos_Geheilt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Pardos_perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_perm_15_00");	//Jak ti je?
	AI_Output(self,other,"DIA_Addon_Pardos_perm_03_01");	//D?ky tob? se c?t?m o mnoho l?pe. C?t?m jak se mi vrac? s?la.
};

