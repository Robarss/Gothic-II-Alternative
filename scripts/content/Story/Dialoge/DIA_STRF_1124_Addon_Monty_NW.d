
instance DIA_Addon_Monty_NW_EXIT(C_Info)
{
	npc = STRF_1124_Addon_Monty_NW;
	nr = 999;
	condition = DIA_Addon_Monty_NW_EXIT_Condition;
	information = DIA_Addon_Monty_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Monty_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Monty_NW_Hi(C_Info)
{
	npc = STRF_1124_Addon_Monty_NW;
	nr = 2;
	condition = DIA_Addon_Monty_NW_Hi_Condition;
	information = DIA_Addon_Monty_NW_Hi_Info;
	permanent = FALSE;
	description = "Tak ses vr?til do pr?ce?";
};


func int DIA_Addon_Monty_NW_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_NW_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Monty_NW_Hi_15_00");	//Tak ses vr?til do pr?ce?
	AI_Output(self,other,"DIA_Addon_Monty_NW_Hi_08_01");	//Hejskov?, nedali jedin? prkno na spr?vn? m?sto, kdy? jsem byl pry?. Budu se muset vr?tit k r?sovac?mu prknu a probrat to, co jsem zanechal.
	AI_Output(other,self,"DIA_Addon_Monty_NW_Hi_15_02");	//Jasn?. Nenech m? zdr?et t?.
	AI_Output(self,other,"DIA_Addon_Monty_NW_Hi_08_03");	//(sm?je se) Jasn? v?c. P??jemnou cestu.
};


instance DIA_Addon_Monty_NW_PICKPOCKET(C_Info)
{
	npc = STRF_1124_Addon_Monty_NW;
	nr = 900;
	condition = DIA_Addon_Monty_NW_PICKPOCKET_Condition;
	information = DIA_Addon_Monty_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Monty_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(60,60);
};

func void DIA_Addon_Monty_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Monty_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Monty_NW_PICKPOCKET,Dialog_Back,DIA_Addon_Monty_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Monty_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Monty_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Monty_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Monty_NW_PICKPOCKET);
};

func void DIA_Addon_Monty_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Monty_NW_PICKPOCKET);
};

