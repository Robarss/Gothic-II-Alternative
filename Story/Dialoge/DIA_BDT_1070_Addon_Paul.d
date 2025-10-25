
instance DIA_Addon_Paul_EXIT(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 999;
	condition = DIA_Addon_Paul_EXIT_Condition;
	information = DIA_Addon_Paul_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Paul_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_PICKPOCKET(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 900;
	condition = DIA_Addon_Paul_PICKPOCKET_Condition;
	information = DIA_Addon_Paul_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Paul_PICKPOCKET_Condition()
{
	return C_Beklauen(22,19);
};

func void DIA_Addon_Paul_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Paul_PICKPOCKET,Dialog_Back,DIA_Addon_Paul_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Paul_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Paul_PICKPOCKET_DoIt);
};

func void DIA_Addon_Paul_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
};

func void DIA_Addon_Paul_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
};


instance DIA_Addon_Paul_Hi(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 1;
	condition = DIA_Addon_Paul_Hi_Condition;
	information = DIA_Addon_Paul_Hi_Info;
	permanent = FALSE;
	description = "Prodáváš také kovářské náčiní?";
};


func int DIA_Addon_Paul_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Hi_15_00");	//Prodáváš také kovářské náčiní?
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_01");	//Huno může nabídnout nějakou ocel na kování. Já mám pouze pár kousků rudy.
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_02");	//Ale ta není na prodej, je to jediná cenná věc, kterou vlastním.
};


instance DIA_Addon_Paul_Huno(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 2;
	condition = DIA_Addon_Paul_Huno_Condition;
	information = DIA_Addon_Paul_Huno_Info;
	permanent = FALSE;
	description = "Pracuješ pro Huna?";
};


func int DIA_Addon_Paul_Huno_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Huno_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Huno_15_00");	//Pracuješ pro Huna?
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_01");	//Chci si vydělat trochu peněz a začít pracovat pro Huna. Ale nedostal jsem nic od Estebana od té doby.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_02");	//Řekl mi, že tam není práce pro mne.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_03");	//Tak pracovat pro Huna je jediná možnost volby.
};


instance DIA_Addon_Paul_Attentat(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 3;
	condition = DIA_Addon_Paul_Attentat_Condition;
	information = DIA_Addon_Paul_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Paul_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Paul_Attentat_03_00");	//Nic! Já s tím nemám nic společného. Co ode mě chceš?
};


instance DIA_Addon_Paul_HunoVerdacht(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 4;
	condition = DIA_Addon_Paul_HunoVerdacht_Condition;
	information = DIA_Addon_Paul_HunoVerdacht_Info;
	permanent = FALSE;
	description = "Huno je podezříván ze zapletení se do úkladné vraždy...";
};


func int DIA_Addon_Paul_HunoVerdacht_Condition()
{
	if(((Finn_TellAll == TRUE) || (Emilio_TellAll == TRUE)) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_HunoVerdacht_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoVerdacht_15_00");	//Huno je podezříván ze zapletení se do úkladné vraždy...
	AI_Output(self,other,"DIA_Addon_Paul_HunoVerdacht_03_01");	//Nic o tom nevím.
};


instance DIA_Addon_Paul_HunoArbeit(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_HunoArbeit_Condition;
	information = DIA_Addon_Paul_HunoArbeit_Info;
	permanent = FALSE;
	description = "Pracuješ pro něj. Musíš něco vědět!!!";
};


func int DIA_Addon_Paul_HunoArbeit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Huno) && Npc_KnowsInfo(other,DIA_Addon_Paul_HunoVerdacht) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_HunoArbeit_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoArbeit_15_00");	//Pracuješ pro něj. Musíš něco vědět!!!
	AI_Output(self,other,"DIA_Addon_Paul_HunoArbeit_03_01");	//(zoufale) Nic nevím - opravdu! Musím pokračovat v práci.
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_FearEsteban(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_FearEsteban_Condition;
	information = DIA_Addon_Paul_FearEsteban_Info;
	permanent = FALSE;
	description = "Víš, co ti udělá Esteban, když se doví, že kryješ Huna?";
};


func int DIA_Addon_Paul_FearEsteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_HunoArbeit) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_FearEsteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_FearEsteban_15_00");	//Víš, co ti udělá Esteban, když se doví, že kryješ Huna?
	AI_Output(self,other,"DIA_Addon_Paul_FearEsteban_03_01");	//Prosím, nech mě. Já do toho nejsem zapleten!
	Npc_ExchangeRoutine(self,"PRESTART");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_MaulPaul(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_MaulPaul_Condition;
	information = DIA_Addon_Paul_MaulPaul_Info;
	permanent = FALSE;
	description = "Dobře, tak mi řekni vše, co víš.";
};


func int DIA_Addon_Paul_MaulPaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_FearEsteban) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_MaulPaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_00");	//(přátelsky) Dobře, teď mi řekneš vše, co víš, nebo tě budu muset zmlátit!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_01");	//Hej, nemůžeš se mnou jednat jen tak jen proto, že pracuješ pro šéfa!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_02");	//(přátelsky) Ale můžu!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_03");	//Nechoď blíž!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_04");	//(netrpělivě) Paul ...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_05");	//(vzrušeně) Vše, co vím je, že Huno nemá rád Estebana.
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_06");	//(vzrušeně) Začíná mi jít na nervy, jak Esteban stále ničí Hunův obchod...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_07");	//Já se opravdu nikdy nemíchám do těchto věcí.
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_08");	//Tak bych řekl, že to nebylo ani tak těžké.
	Npc_ExchangeRoutine(self,"START");
	Paul_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban,"Paul říká, že Huno nesnáší Estebana za to, že ruinuje jeho práci.");
};


instance DIA_Addon_BDT_1070_Paul_Mine(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 2;
	condition = DIA_Addon_Paul_Mine_Condition;
	information = DIA_Addon_Paul_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Paul_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1070_Paul_Mine_03_00");	//Konečně! Zde je tvá ruda.
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Paul_PERM(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 99;
	condition = DIA_Addon_Paul_PERM_Condition;
	information = DIA_Addon_Paul_PERM_Info;
	permanent = TRUE;
	description = "Vše v pořádku?";
};


func int DIA_Addon_Paul_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Huno))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_PERM_15_00");	//Vše v pořádku?
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_01");	//Ano, chystám se dostat zlato z té skály!
	}
	else if((Paul_TellAll == TRUE) && (Huno_zuSnaf == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_02");	//Už jsem ti řekl vše, co jsem věděl!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_03");	//Hej já zde chci pouze pracovat!
	};
};

