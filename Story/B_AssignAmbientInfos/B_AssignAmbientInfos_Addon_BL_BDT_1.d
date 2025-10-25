
instance DIA_Addon_BL_BDT_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_BL_BDT_1_EXIT_Condition;
	information = DIA_Addon_BL_BDT_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_BL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BL_BDT_1_Chef(C_Info)
{
	nr = 2;
	condition = DIA_Addon_BL_BDT_1_Chef_Condition;
	information = DIA_Addon_BL_BDT_1_Chef_Info;
	permanent = TRUE;
	description = "Kdo tomu tady velí?";
};


func int DIA_Addon_BL_BDT_1_Chef_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_Chef_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Chef_15_00");	//Kdo je tady šéf?
	if(RavenIsDead == TRUE)
	{
		if(Npc_IsDead(Thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_01");	//Hodně se jich tu už vystřídalo ... nemůžeš je všechny zaregistrovat.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_02");	//Věřím, že Thorus je teď náš vůdce ...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_03");	//Raven je náš vůdce. Dovedl nás sem a založil tábor.
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_04");	//Kontroluje důl, jinak by se ti psi tady mezi sebou pozabíjeli už dávno kvůli zlatu.
	};
};


instance DIA_Addon_BL_BDT_1_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_BL_BDT_1_Lager_Condition;
	information = DIA_Addon_BL_BDT_1_Lager_Info;
	permanent = FALSE;
	description = "Co víš o dolu?";
};


func int DIA_Addon_BL_BDT_1_Lager_Condition()
{
	if((Sklaven_Flucht == FALSE) || !Npc_IsDead(Raven))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_1_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager_15_00");	//Co víš o dolu?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_01");	//Jak se ukázalo, že je tady zlatý důl, tak se tady všichni navzájem celkem sjednotili.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_02");	//Raven pak pozabíjel ty nejhorší vzbouřence a jejich kosti vyhodil z dolu.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_03");	//Od té doby nikdo nemůže do vyšší čtvrti. Jinak by byl vzat jako vězeň a poslán kopat do dolu.
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_BL_BDT_1_Lager2(C_Info)
{
	nr = 3;
	condition = DIA_Addon_BL_BDT_1_Lager2_Condition;
	information = DIA_Addon_BL_BDT_1_Lager2_Info;
	permanent = TRUE;
	description = "Co víš o táboře?";
};


func int DIA_Addon_BL_BDT_1_Lager2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BL_BDT_1_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_1_Lager2_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager2_15_00");	//Co víš o táboře?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_01");	//Když na někoho zaútočíš, VŠICHNI po tobě půjdou.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_02");	//Pokud nemáš dobrý důvod. To tě pak nebude nikdo trestat.
};


instance DIA_Addon_BL_BDT_1_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_BL_BDT_1_News_Condition;
	information = DIA_Addon_BL_BDT_1_News_Info;
	permanent = TRUE;
	description = "Něco nového? ";
};


func int DIA_Addon_BL_BDT_1_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_News_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_News_15_00");	//Něco nového?
	if(RavenIsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_01");	//Raven je mrtvý. Co teď budeme dělat?
	};
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_02");	//Piráti nás už nechtějí převážet, protože jsme jim za to neplatili.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_03");	//Měli bychom jednoho nebo dva znich propíchnout, to by jsme pak měli zajištěný odvoz.
};


instance DIA_Addon_BL_BDT_1_Sklaven(C_Info)
{
	nr = 5;
	condition = DIA_Addon_BL_BDT_1_Sklaven_Condition;
	information = DIA_Addon_BL_BDT_1_Sklaven_Info;
	permanent = TRUE;
	description = "Co víš o vězních?";
};


func int DIA_Addon_BL_BDT_1_Sklaven_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BL_BDT_1_Lager) && ((Sklaven_Flucht == FALSE) || (RavenIsDead == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_1_Sklaven_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_00");	//Co víš o vězních?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_01");	//Raven chtěl něco vykopat. Nejprve to měli dělat banditi, ale mnohým se to nelíbilo.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_02");	//To byl ten důvod, proč potřeboval vězně - když zemřeli oni, nikomu to nevadilo.
	if(BDT_1_Ausbuddeln == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_03");	//Co chtěl Raven vykopat?
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_04");	//Nemám tušení, ale řekl bych, že něco víc než zlato.
		BDT_1_Ausbuddeln = TRUE;
	};
};

func void B_AssignAmbientInfos_Addon_BL_BDT_1(var C_Npc slf)
{
	DIA_Addon_BL_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Chef.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_News.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Sklaven.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager2.npc = Hlp_GetInstanceID(slf);
};

