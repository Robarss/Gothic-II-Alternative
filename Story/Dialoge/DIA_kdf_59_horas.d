
instance DIA_HORAS_EXIT(C_Info)
{
	npc = kdf_59_horas;
	nr = 990;
	condition = dia_horas_exit_condition;
	information = dia_horas_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_horas_exit_condition()
{
	return TRUE;
};

func void dia_horas_exit_info()
{
	AI_Output(self,other,"DIA_Horas_EXIT_01_00");	//Nechť nad tebou Innos bdí.
	AI_StopProcessInfos(self);
};


instance DIA_HORAS_HELLO(C_Info)
{
	npc = kdf_59_horas;
	nr = 2;
	condition = dia_horas_hello_condition;
	information = dia_horas_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_horas_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_horas_hello_info()
{
	AI_Output(self,other,"DIA_Horas_Hello_01_00");	//Innos tě doprovázej. Co pro tebe mohu udělat, poutníče?
};


instance DIA_HORAS_JOB(C_Info)
{
	npc = kdf_59_horas;
	nr = 4;
	condition = dia_horas_job_condition;
	information = dia_horas_job_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int dia_horas_job_condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_horas_job_info()
{
	AI_Output(other,self,"DIA_Horas_Job_15_00");	//Co tady děláš a co my mužeš nabídnout?
	AI_Output(self,other,"DIA_Horas_Job_01_01");	//Jsem ohnivý mág. Kněz našeho boha Innose.
	AI_Output(self,other,"DIA_Horas_Job_01_02");	//A za nějaký ten drobný ode mě také můžeš dostat mnohé užitečné věci.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Cestou do přístaviště mág Horas prodává užitečné magické předměty.");
};


instance DIA_HORAS_TRADE(C_Info)
{
	npc = kdf_59_horas;
	nr = 99;
	condition = dia_horas_trade_condition;
	information = dia_horas_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int dia_horas_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_horas_job))
	{
		return TRUE;
	};
};

func void dia_horas_trade_info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Horas_Trade_15_00");	//Ukaž mi své zboží.
};


instance DIA_HORAS_PICKPOCKET(C_Info)
{
	npc = kdf_59_horas;
	nr = 900;
	condition = dia_horas_pickpocket_condition;
	information = dia_horas_pickpocket_info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int dia_horas_pickpocket_condition()
{
	return C_Beklauen(48,50);
};

func void dia_horas_pickpocket_info()
{
	Info_ClearChoices(dia_horas_pickpocket);
	Info_AddChoice(dia_horas_pickpocket,Dialog_Back,dia_horas_pickpocket_back);
	Info_AddChoice(dia_horas_pickpocket,DIALOG_PICKPOCKET,dia_horas_pickpocket_doit);
};

func void dia_horas_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_horas_pickpocket);
};

func void dia_horas_pickpocket_back()
{
	Info_ClearChoices(dia_horas_pickpocket);
};

