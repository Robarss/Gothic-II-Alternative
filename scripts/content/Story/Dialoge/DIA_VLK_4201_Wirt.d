
instance DIA_Wirt_EXIT(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 999;
	condition = DIA_Wirt_EXIT_Condition;
	information = DIA_Wirt_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wirt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wirt_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wirt_PICKPOCKET(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 900;
	condition = DIA_Wirt_PICKPOCKET_Condition;
	information = DIA_Wirt_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Wirt_PICKPOCKET_Condition()
{
	return C_Beklauen(60,65);
};

func void DIA_Wirt_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
	Info_AddChoice(DIA_Wirt_PICKPOCKET,Dialog_Back,DIA_Wirt_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wirt_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wirt_PICKPOCKET_DoIt);
};

func void DIA_Wirt_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
};

func void DIA_Wirt_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
};


instance DIA_Wirt_Hallo(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 2;
	condition = DIA_Wirt_Hallo_Condition;
	information = DIA_Wirt_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Wirt_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Wirt_Hallo_Info()
{
	var int randy;
	randy = Hlp_Random(2);
	AI_Output(self,other,"DIA_Wirt_Hallo_14_00");	//Hej, poj? bl?? - dej si pauzu a p?r lok? dob?e chlazen?ho piva.
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_01");	//Lord Andre objednal p?r soudk? piva, kter? to??me zdarma.
		AI_StopProcessInfos(self);
	}
	else if(randy == 0)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_02");	//Nen? nad to, kdy? si po pr?ci d?? jednu pintu orosen?ho.
		AI_StopProcessInfos(self);
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_03");	//Paladinov? daj? v?echno do po??dku, tak?e si klidn? je?t? lokni a u?ij si to.
		B_GiveInvItems(self,other,ItFo_Beer,1);
		AI_StopProcessInfos(self);
	}
	else if(randy == 2)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_04");	//O Khorinisu si ??kej co chce?, ale n?? 'Temn? paladin' je prost? nejlep?? z cel? Myrtany.
		AI_StopProcessInfos(self);
	};
};

