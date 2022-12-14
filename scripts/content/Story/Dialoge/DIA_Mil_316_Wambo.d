
instance DIA_Wambo_EXIT(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 999;
	condition = DIA_Wambo_EXIT_Condition;
	information = DIA_Wambo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wambo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wambo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wambo_PICKPOCKET(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 900;
	condition = DIA_Wambo_PICKPOCKET_Condition;
	information = DIA_Wambo_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Kr?de? tohoto kl??e by byla riskantn?)";
};


func int DIA_Wambo_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_04) >= 1) && (other.attribute[ATR_DEXTERITY] >= 40))
	{
		return TRUE;
	};
};

func void DIA_Wambo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wambo_PICKPOCKET);
	Info_AddChoice(DIA_Wambo_PICKPOCKET,Dialog_Back,DIA_Wambo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wambo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wambo_PICKPOCKET_DoIt);
};

func void DIA_Wambo_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems(self,other,ItKe_City_Tower_04,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Wambo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Wambo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wambo_PICKPOCKET);
};


instance DIA_Wambo_Job(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Job_Condition;
	information = DIA_Wambo_Job_Info;
	permanent = FALSE;
	description = "Co tady d?l???";
};


func int DIA_Wambo_Job_Condition()
{
	return TRUE;
};

func void DIA_Wambo_Job_Info()
{
	AI_Output(other,self,"DIA_Wambo_Job_15_00");	//Co tady d?l???
	AI_Output(self,other,"DIA_Wambo_Job_03_01");	//Star?m se o to, aby nikdo neve?el dovnit?.
	AI_Output(self,other,"DIA_Wambo_Job_03_02");	//V?slovn? rozkaz od lorda Hagena. A ani nemysli na to, ?e by ses tomu rozkazu protivil!
};


instance DIA_Wambo_Situation(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 10;
	condition = DIA_Wambo_Situation_Condition;
	information = DIA_Wambo_Situation_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Wambo_Situation_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wambo_Job))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Situation_Info()
{
	AI_Output(other,self,"DIA_Wambo_Situation_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Wambo_Situation_03_01");	//V tuhle chv?li je v?echno v klidu.
};


instance DIA_Wambo_Ramirez(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Ramirez_Condition;
	information = DIA_Wambo_Ramirez_Info;
	permanent = FALSE;
	description = "P?ich?z?m od na?eho spole?n?ho p??tele Ramireze.";
};


func int DIA_Wambo_Ramirez_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ramirez_Viertel))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Ramirez_Info()
{
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_00");	//P?ich?z?m od na?eho spole?n?ho p??tele Ramireze.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_01");	//Co?e? Ten Ramirez je p?kn? krysa. A nen? ??dn? m?j p??tel. To je jedno. P?in???? mi n?co?
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_02");	//To z?le?? na tom, co chce?.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_03");	//(ti?e) Dobr?, ?eknu ti, jak to chod?. Zaplat?? 250 zlat?ch. Pak tady v noci nebudu.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_04");	//Pokud bys ale byl p??li? n?padn? a j? tady p?ece jenom byl, tak z obchodu se?lo.
};


instance DIA_Wambo_Deal(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Deal_Condition;
	information = DIA_Wambo_Deal_Info;
	permanent = TRUE;
	description = "(Zaplatit 250 zla??k?)";
};


var int DIA_Wambo_Deal_permanent;

func int DIA_Wambo_Deal_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wambo_Ramirez) && (DIA_Wambo_Deal_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Deal_Info()
{
	AI_Output(other,self,"DIA_Wambo_Deal_15_00");	//M?m pro tebe ty pen?ze...
	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other,"DIA_Wambo_Deal_03_01");	//Dobr?, tak j? na ve?er zmiz?m.
		AI_Output(self,other,"DIA_Wambo_Deal_03_02");	//A nezapome? - kdybys d?lal n?jak? probl?my, tak t? nezn?m.
		DIA_Wambo_Deal_permanent = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DRINK");
	}
	else
	{
		AI_Output(other,self,"DIA_Wambo_Deal_15_03");	//... ale ne zrovna u sebe.
		AI_Output(self,other,"DIA_Wambo_Deal_03_04");	//Nesn???m, kdy? ze m? n?kdo d?l? ?a?ka. Tak p?ines to zlato.
		AI_StopProcessInfos(self);
	};
};

