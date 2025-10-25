
instance DIA_Addon_Wache_02_EXIT(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 999;
	condition = DIA_Addon_Wache_02_EXIT_Condition;
	information = DIA_Addon_Wache_02_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Wache_02_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Wache_02_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Wache_02_PICKPOCKET(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 900;
	condition = DIA_Addon_Wache_02_PICKPOCKET_Condition;
	information = DIA_Addon_Wache_02_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Wache_02_PICKPOCKET_Condition()
{
	return C_Beklauen(38,101);
};

func void DIA_Addon_Wache_02_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Wache_02_PICKPOCKET,Dialog_Back,DIA_Addon_Wache_02_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Wache_02_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Wache_02_PICKPOCKET_DoIt);
};

func void DIA_Addon_Wache_02_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
};

func void DIA_Addon_Wache_02_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
};


instance DIA_Addon_Wache_02_Hi(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 2;
	condition = DIA_Addon_Wache_02_Hi_Condition;
	information = DIA_Addon_Wache_02_Hi_Info;
	permanent = FALSE;
	description = "Všechno v pořádku?";
};


func int DIA_Addon_Wache_02_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Wache_02_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_Hi_15_00");	//Všechno v pořádku?
	AI_Output(self,other,"DIA_Addon_Wache_02_Hi_13_01");	//Počkej chvíli - neznáme se odněkud?
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Wache_02_Hi_13_02");	//Hmmm..ne. Ty nejsi on. Ztrať se.
};


instance DIA_Addon_Wache_02_Attentat(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 2;
	condition = DIA_Addon_Wache_02_Attentat_Condition;
	information = DIA_Addon_Wache_02_Attentat_Info;
	permanent = FALSE;
	description = "Co víš o tom pokusu vraždy?";
};


func int DIA_Addon_Wache_02_Attentat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Wache_02_Hi) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Wache_02_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_Attentat_15_00");	//Co víš o tom pokusu vraždy?
	AI_Output(self,other,"DIA_Addon_Wache_02_Attentat_13_01");	//Co o tom vím? (Smích) Zlomil jsem mu obě nohy.
	AI_Output(self,other,"DIA_Addon_Wache_02_Attentat_13_02");	//(výhružně) a udělám to komukoliv, kdo se chce dostat do potíží s Estebanem...
};


instance DIA_Addon_Wache_02_perm(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 99;
	condition = DIA_Addon_Wache_02_perm_Condition;
	information = DIA_Addon_Wache_02_perm_Info;
	permanent = TRUE;
	description = "Něco nového?";
};


func int DIA_Addon_Wache_02_perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Wache_02_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Wache_02_perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_perm_15_00");	//Něco nového?
	AI_Output(self,other,"DIA_Addon_Wache_02_perm_13_01");	//Všude ticho.
	if(MIS_Judas == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Wache_02_perm_13_02");	//Ty najdeš zrádce - a pak se s ním vypořádáme ...
	};
};

