
instance Addon_10008_Bandit_EXIT(C_Info)
{
	npc = BDT_10008_Addon_Bandit;
	nr = 999;
	condition = Addon_10008_Bandit_EXIT_Condition;
	information = Addon_10008_Bandit_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int Addon_10008_Bandit_EXIT_Condition()
{
	return TRUE;
};

func void Addon_10008_Bandit_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_10008_Bandit_PICKPOCKET(C_Info)
{
	npc = BDT_10008_Addon_Bandit;
	nr = 900;
	condition = DIA_Addon_10008_Bandit_PICKPOCKET_Condition;
	information = DIA_Addon_10008_Bandit_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_10008_Bandit_PICKPOCKET_Condition()
{
	return C_Beklauen(55,99);
};

func void DIA_Addon_10008_Bandit_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_10008_Bandit_PICKPOCKET);
	Info_AddChoice(DIA_Addon_10008_Bandit_PICKPOCKET,Dialog_Back,DIA_Addon_10008_Bandit_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_10008_Bandit_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_10008_Bandit_PICKPOCKET_DoIt);
};

func void DIA_Addon_10008_Bandit_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_10008_Bandit_PICKPOCKET);
};

func void DIA_Addon_10008_Bandit_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_10008_Bandit_PICKPOCKET);
};


instance DIA_Addon_10008_Bandit_Hi(C_Info)
{
	npc = BDT_10008_Addon_Bandit;
	nr = 2;
	condition = DIA_Addon_10008_Bandit_Hi_Condition;
	information = DIA_Addon_10008_Bandit_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_10008_Bandit_Hi_Condition()
{
	if((Npc_GetDistToNpc(other,Skinner) <= 600) && !Npc_IsDead(Skinner) && (Skinner.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_10008_Bandit_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_00");	//NEBUÏ HO!
	AI_Output(other,self,"DIA_Addon_10008_Bandit_Hi_15_01");	//Cože???
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_02");	//Jestli chceš sám sobì udìlat laskavost, vyhýbej se Skinnerovi.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_03");	//Ten hoch je nepøedvídatelný. Zabil posledního chlápka, co se ho snažil vzbudit.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_04");	//Nech ho spát, je to nejlepší pro každého.
};


instance DIA_Addon_10008_Bandit_soup(C_Info)
{
	npc = BDT_10008_Addon_Bandit;
	nr = 2;
	condition = DIA_Addon_10008_Bandit_soup_Condition;
	information = DIA_Addon_10008_Bandit_soup_Info;
	permanent = FALSE;
	description = "Ty jsi kopáè?";
};


func int DIA_Addon_10008_Bandit_soup_Condition()
{
	return TRUE;
};

func void DIA_Addon_10008_Bandit_soup_Info()
{
	AI_Output(other,self,"DIA_Addon_10008_Bandit_soup_15_00");	//Ty jsi kopáè?
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_01");	//Kvùli kalhotùm? Ne, já je nosím, protože jsou pohodlné.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_02");	//Já vaøím jen masovou polévku, zde, zkus to - budeš silnìjší.
	B_GiveInvItems(self,other,ItFo_Addon_Meatsoup,1);
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_03");	//Je dùležité cvièit tvoji sílu - venku tì èeká mnoho nebezpeèí.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_04");	//Jestli chceš, pomùžu ti zvednout tvoji sílu.
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher,"Bandita u kuchaøského hrnce mi mùže pomoci cvièit mou sílu.");
};


instance DIA_Addon_10008_Bandit_Teach(C_Info)
{
	npc = BDT_10008_Addon_Bandit;
	nr = 7;
	condition = DIA_Addon_10008_Bandit_Teach_Condition;
	information = DIA_Addon_10008_Bandit_Teach_Info;
	permanent = TRUE;
	description = "Chci se stát silnìjším.";
};


func int DIA_Addon_10008_Bandit_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_10008_Bandit_soup))
	{
		return TRUE;
	};
};

func void DIA_Addon_10008_Bandit_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_10008_Bandit_Teach_15_00");	//Chci se stát silnìjším.
	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach,Dialog_Back,DIA_Addon_10008_Bandit_Teach_Back);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_10008_Bandit_Teach_STR_1);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_10008_Bandit_Teach_STR_5);
};

func void DIA_Addon_10008_Bandit_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
};

func void DIA_Addon_10008_Bandit_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach,Dialog_Back,DIA_Addon_10008_Bandit_Teach_Back);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_10008_Bandit_Teach_STR_1);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_10008_Bandit_Teach_STR_5);
};

func void DIA_Addon_10008_Bandit_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach,Dialog_Back,DIA_Addon_10008_Bandit_Teach_Back);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_10008_Bandit_Teach_STR_1);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_10008_Bandit_Teach_STR_5);
};

