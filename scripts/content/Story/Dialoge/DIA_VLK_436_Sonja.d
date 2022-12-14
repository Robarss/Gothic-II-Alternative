
instance DIA_Sonja_EXIT(C_Info)
{
	npc = VLK_436_Sonja;
	nr = 999;
	condition = DIA_Sonja_EXIT_Condition;
	information = DIA_Sonja_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sonja_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sonja_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sonja_PICKPOCKET(C_Info)
{
	npc = VLK_436_Sonja;
	nr = 900;
	condition = DIA_Sonja_PICKPOCKET_Condition;
	information = DIA_Sonja_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60_Female;
};


func int DIA_Sonja_PICKPOCKET_Condition()
{
	return C_Beklauen(58,70);
};

func void DIA_Sonja_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sonja_PICKPOCKET);
	Info_AddChoice(DIA_Sonja_PICKPOCKET,Dialog_Back,DIA_Sonja_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sonja_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sonja_PICKPOCKET_DoIt);
};

func void DIA_Sonja_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sonja_PICKPOCKET);
};

func void DIA_Sonja_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sonja_PICKPOCKET);
};


instance DIA_Sonja_STANDARD(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_STANDARD_Condition;
	information = DIA_Sonja_STANDARD_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Sonja_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Andre_REDLIGHT != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Sonja_STANDARD_Info()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Sonja_STANDARD_16_00");	//Jestli se chce? pobavit, promluv si s Bromorem.
	}
	else if((other.guild == GIL_DJG) && (Sonja_Says == FALSE))
	{
		AI_Output(self,other,"DIA_Sonja_STANDARD_16_01");	//To je probl?m v?s chlap? - rad?i byste vra?dili sk?ety, ne? zatloukli h?eb?k.
		Sonja_Says = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sonja_STANDARD_16_02");	//A jestli se r?d s n?k?m vybavuje?, najdi si babu a o?e? se s n?.
	};
	AI_StopProcessInfos(self);
};

