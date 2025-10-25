
instance DIA_Isgaroth_EXIT(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 999;
	condition = DIA_Isgaroth_EXIT_Condition;
	information = DIA_Isgaroth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Isgaroth_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_EXIT_Info()
{
	AI_Output(self,other,"DIA_Isgaroth_EXIT_01_00");	//Nechť nad tebou Innos bdí.
	AI_StopProcessInfos(self);
};


instance DIA_Isgaroth_Hello(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_Hello_Condition;
	information = DIA_Isgaroth_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Isgaroth_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Hello_Info()
{
	AI_Output(self,other,"DIA_Isgaroth_Hello_01_00");	//Innos tě doprovázej. Co pro tebe mohu udělat, poutníče?
};


instance DIA_Isgaroth_Segen(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 10;
	condition = DIA_Isgaroth_Segen_Condition;
	information = DIA_Isgaroth_Segen_Info;
	permanent = TRUE;
	description = "Požehnej mi!";
};


func int DIA_Isgaroth_Segen_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_Segen_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Segen_15_00");	//Požehnej mi!
	AI_Output(self,other,"DIA_Isgaroth_Segen_01_01");	//Žehnám ti jménem Innosovým. Nechť ve tvém srdci plane oheň našeho Pána a nechť ti dá sílu řídit se jeho spravedlivostí.
	Isgaroth_Segen = TRUE;
};


instance DIA_Isgaroth_Wolf(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_Wolf_Condition;
	information = DIA_Isgaroth_Wolf_Info;
	permanent = FALSE;
	description = "Posílá mě Sergio...";
};


func int DIA_Isgaroth_Wolf_Condition()
{
	if((MIS_KlosterArbeit == LOG_Running) && (Sergio_Sends == TRUE) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Wolf_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Wolf_15_00");	//Posílá mě Sergio. Převzal jsem jeho úkol. Tak, o co jde?
	AI_Output(self,other,"DIA_Isgaroth_Wolf_01_01");	//Poslední dobou se po okolí toulá černý vlk. Vystopuj jej a zabij ho.
	MIS_IsgarothWolf = LOG_Running;
	B_LogEntry(Topic_IsgarothWolf,"Kolem svatyně se potuluje temný vlk. Měl bych ho najít a zabít.");
};


instance DIA_Isgaroth_tot(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_tot_Condition;
	information = DIA_Isgaroth_tot_Info;
	permanent = TRUE;
	description = "Zabil jsem toho vlka.";
};


func int DIA_Isgaroth_tot_Condition()
{
	Wolfi = Hlp_GetNpc(BlackWolf);
	if((MIS_IsgarothWolf == LOG_Running) && Npc_IsDead(Wolfi))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_tot_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_tot_15_00");	//Zabil jsem toho vlka.
	AI_Output(self,other,"DIA_Isgaroth_tot_01_01");	//Dobrá práce, novici. Jsi statečný muž. Teď se vrať do kláštera a věnuj se svým povinnostem.
	MIS_IsgarothWolf = LOG_SUCCESS;
	B_GivePlayerXP(XP_IsgarothWolf);
	AI_StopProcessInfos(self);
};


instance DIA_Isgaroth_Job(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 4;
	condition = DIA_Isgaroth_Job_Condition;
	information = DIA_Isgaroth_Job_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Isgaroth_Job_Condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Job_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Job_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Isgaroth_Job_01_01");	//Jsem ohnivý mág. Kněz našeho boha Innose.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_02");	//Toto místo je zasvěcené JEMU, nejvyššímu bohu, stvořiteli ohně a pánovi spravedlnosti.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_03");	//Lidé sem přicházejí, aby se modlili k Innosovi a obdrželi požehnání.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_04");	//Za nějaký ten drobný ode mě také můžeš dostat mnohé užitečné věci.
	Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader,"Ve svatyni před klášterem sídlí mistr Isgaroth, který prodává užitečné magické předměty.");
};


instance DIA_Isgaroth_Trade(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 99;
	condition = DIA_Isgaroth_Trade_Condition;
	information = DIA_Isgaroth_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Isgaroth_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Isgaroth_Job))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Isgaroth_Trade_15_00");	//Ukaž mi své zboží.
};


instance DIA_Isgaroth_Kloster(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 3;
	condition = DIA_Isgaroth_Kloster_Condition;
	information = DIA_Isgaroth_Kloster_Info;
	permanent = FALSE;
	description = "Kam mě tahle cesta dovede?";
};


func int DIA_Isgaroth_Kloster_Condition()
{
	if((other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Kloster_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Kloster_15_00");	//Kam mě tahle cesta dovede?
	AI_Output(self,other,"DIA_Isgaroth_Kloster_01_01");	//Tahle cesta vede do kláštera ohnivých mágů. Vstup do něj je ovšem povolen jen služebníkům Innose.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_02");	//A jestli chceš být do kláštera přijat jako novic, musíš s sebou přivést ovci a...
		B_Say_Gold(self,other,Summe_Kloster);
		Log_CreateTopic(Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus(Topic_Kloster,LOG_Running);
		B_LogEntry(Topic_Kloster,"Chci-li se stát novicem v Innosově svatyni, potřebuji ovci a 1000 zlaťáků.");
	}
	else
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_03");	//Protože ses ovšem již rozhodl spojit se s jinou skupinou, bude ti vstup odepřen.
	};
};


instance DIA_Isgaroth_Vatras(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 3;
	condition = DIA_Isgaroth_Vatras_Condition;
	information = DIA_Isgaroth_Vatras_Info;
	permanent = TRUE;
	description = "Nesu zprávu od Vatrase.";
};


func int DIA_Isgaroth_Vatras_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && ((Npc_HasItems(other,ItWr_VatrasMessage) == 1) || (Npc_HasItems(other,ItWr_VatrasMessage_Open) == 1)))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Vatras_Info()
{
	AI_Output(other,self,"DIA_ISgaroth_Vatras_15_00");	//Nesu zprávu od Vatrase.
	AI_Output(self,other,"DIA_Isgaroth_Vatras_01_01");	//Co je to za zprávu?
	AI_Output(other,self,"DIA_Isgaroth_Vatras_15_02");	//Je to dopis. Tady.
	if(Npc_HasItems(other,ItWr_VatrasMessage) == 1)
	{
		if(B_GiveInvItems(other,self,ItWr_VatrasMessage,1))
		{
			Npc_RemoveInvItems(self,ItWr_VatrasMessage,1);
		};
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_03");	//Dobrá, můžeš Vatrasovi vyřídit, že jsem tu zprávu obdržel.
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_04");	//Vezmi si tyhle lektvary jako odměnu za své služby, určitě se ti budou hodit.
		CreateInvItems(self,ItPo_Health_02,2);
		B_GiveInvItems(self,other,ItPo_Health_02,2);
		B_GivePlayerXP(XP_Ambient * 2);
	}
	else if(Npc_HasItems(other,ItWr_VatrasMessage_Open) == 1)
	{
		if(B_GiveInvItems(other,self,ItWr_VatrasMessage_Open,1))
		{
			Npc_RemoveInvItems(self,ItWr_VatrasMessage_Open,1);
		};
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_05");	//Pečeť je rozlomená. Na cos myslel, ty blázne!
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_06");	//Běž a vyřiď Vatrasovi, že jsem jeho zprávu obdržel.
		AI_StopProcessInfos(self);
	};
	Vatras_Return = TRUE;
};


instance DIA_Isgaroth_PICKPOCKET(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 900;
	condition = DIA_Isgaroth_PICKPOCKET_Condition;
	information = DIA_Isgaroth_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Isgaroth_PICKPOCKET_Condition()
{
	return C_Beklauen(48,50);
};

func void DIA_Isgaroth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
	Info_AddChoice(DIA_Isgaroth_PICKPOCKET,Dialog_Back,DIA_Isgaroth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Isgaroth_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Isgaroth_PICKPOCKET_DoIt);
};

func void DIA_Isgaroth_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
};

func void DIA_Isgaroth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
};

