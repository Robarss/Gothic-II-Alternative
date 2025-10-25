
instance DIA_Lutero_EXIT(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 999;
	condition = DIA_Lutero_EXIT_Condition;
	information = DIA_Lutero_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lutero_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lutero_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if((Lutero_Krallen == LOG_Running) && (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) && (Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER) == FALSE))
	{
		Lutero_Krallen = LOG_OBSOLETE;
		B_CheckLog();
	};
};


instance DIA_Lutero_Hallo(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Hallo_Condition;
	information = DIA_Lutero_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_Hallo_Condition()
{
	if(((other.guild != GIL_NONE) || (other.guild != GIL_NOV)) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Hallo_Info()
{
	AI_Output(self,other,"DIA_Lutero_Hallo_13_00");	//Jmenuju se Lutero. Obchoduju se vším, na co si vzpomeneš.
	AI_Output(other,self,"DIA_Lutero_Hallo_15_01");	//Jaké zboží mi můžeš nabídnout?
	AI_Output(self,other,"DIA_Lutero_Hallo_13_02");	//No, hlavně vzácné a neobvyklé věci. Vždycky jsem se snažil vyhovět zákazníkovu přání.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Lutero prodává v horní čtvrti neobvyklé a vzácné věci.");
};


instance DIA_LUTERO_SELLWHAT(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 1;
	condition = dia_lutero_sellwhat_condition;
	information = dia_lutero_sellwhat_info;
	permanent = FALSE;
	description = "Nevíš kde bych mohl koupit takoví oblek jako máš ty ?.";
};


func int dia_lutero_sellwhat_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lutero_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_lutero_sellwhat_info()
{
	AI_Output(other,self,"DIA_Lutero_SellWhat_15_00");	//Nevíš kde bych mohl koupit takoví oblek jako máš ty ?
	AI_Output(self,other,"DIA_Lutero_SellWhat_09_01");	//Ano a to přímo u mě, akorat nevím jestli na to budeš mít, protože tohle je totiž dost luxusní oděv, takže jedině pokud budeš mít dost zlata klidně ti ho prodám.
};


instance DIA_Lutero_GetLost(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_GetLost_Condition;
	information = DIA_Lutero_GetLost_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_GetLost_Condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_NOV)) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_GetLost_Info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_00");	//Zmizni, kořene! Nemáš co dělat? Tak si koukej sehnat práci - ale někde jinde!
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_01");	//Co tady chceš, novici? Neměl bys být v klášteře?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Lutero_Snapper(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Snapper_Condition;
	information = DIA_Lutero_Snapper_Info;
	permanent = FALSE;
	description = "Hledáš něco konkrétního?";
};


func int DIA_Lutero_Snapper_Condition()
{
	if((other.guild != GIL_NONE) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Snapper_Info()
{
	AI_Output(other,self,"DIA_Lutero_Snapper_15_00");	//Hledáš něco konkrétního?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_01");	//Pro svůj současný úkol potřebuju drápy chňapavce.
	AI_Output(self,other,"DIA_Lutero_Snapper_13_02");	//Ale ne jen tak ledajaké drápy. Musí to být něco zvláštního - drápy mocné bestie, co už zabila mnoho mužů, nebo něco takového.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_03");	//Kde najdu chňapavce?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_04");	//Na tomhle ostrově jich pár je, ale většina z nich žije v Hornickém údolí.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_05");	//A co z toho budu mít?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_06");	//Můžu ti opatřit nějaký runový kámen.
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_07");	//Můžu ti dát prsten nepřemožitelnosti.
	};
	AI_Output(other,self,"DIA_Lutero_Hello_15_08");	//Uvidím, co se dá dělat.
	Log_CreateTopic(TOPIC_Lutero,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lutero,LOG_Running);
	B_LogEntry(TOPIC_Lutero,"Obchodník Lutero hledá drápy zvlášť silného chňapavce.");
	Lutero_Krallen = LOG_Running;
};


instance DIA_Lutero_Kralle(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Kralle_Condition;
	information = DIA_Lutero_Kralle_Info;
	permanent = FALSE;
	description = "Mám pro tebe nějaké zajímavé drápy chňapavce.";
};


func int DIA_Lutero_Kralle_Condition()
{
	if((Npc_HasItems(other,ItAt_ClawLeader) >= 1) && Npc_KnowsInfo(other,DIA_Lutero_Snapper))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Kralle_Info()
{
	AI_Output(other,self,"DIA_Lutero_Kralle_15_00");	//Mám pro tebe nějaké zajímavé drápy chňapavce.
	Lutero_Krallen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Lutero_Kralle_13_01");	//Můj zákazník to rád uslyší.
	B_GiveInvItems(other,self,ItAt_ClawLeader,1);
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_02");	//Nemám ten runový kámen tady u sebe. Ale vím, kde ho můžeš najít.
		AI_Output(self,other,"DIA_Lutero_Hello_13_03");	//Až půjdeš z města do hospody, projdeš pod mostem.
		AI_Output(self,other,"DIA_Lutero_Hello_13_04");	//Je tam jeskyně, moji přátelé tam mají v truhle uložené runové kameny. Tady je klíč.
		B_GiveInvItems(self,other,itke_rune_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_05");	//Tady je ten prsten, co jsem si slíbil.
		B_GiveInvItems(self,other,ItRi_Prot_Total_01,1);
	};
};


instance DIA_Lutero_Trade(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Trade_Condition;
	information = DIA_Lutero_Trade_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};


func int DIA_Lutero_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lutero_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Ukaž mi své zboží.
};


var int lutero_leatherbought;

instance DIA_LUTERO_LEATHER(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 650;
	condition = dia_lutero_leather_condition;
	information = dia_lutero_leather_info;
	permanent = TRUE;
	description = "Koupit Velitelský kabátec. (3500 zlaťáků)";
};


func int dia_lutero_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_lutero_sellwhat) && (LUTERO_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_lutero_leather_info()
{
	AI_Output(other,self,"DIA_Lutero_LEATHER_15_00");	//3500 zlaťáků??? no dobře žiju jen jednou, teť aspon budu vypadat Luxusně.
	if(B_GiveInvItems(other,self,ItMi_Gold,3500))
	{
		AI_Output(self,other,"DIA_Lutero_LEATHER_09_01");	//Bude se ti moc líbit. (ušklíbne se)
		CreateInvItems(other,ITAR_Governor,1);
		AI_PrintScreen("Zbroj od Lutera získána.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		LUTERO_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_LEATHER_09_02");	//Oděv má svou cenu - a opravdu za to stojí. Takže se vrať, až dáš dohromady dost zlata.
	};
};


instance DIA_Lutero_PICKPOCKET(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 900;
	condition = DIA_Lutero_PICKPOCKET_Condition;
	information = DIA_Lutero_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Lutero_PICKPOCKET_Condition()
{
	return C_Beklauen(58,65);
};

func void DIA_Lutero_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
	Info_AddChoice(DIA_Lutero_PICKPOCKET,Dialog_Back,DIA_Lutero_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lutero_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lutero_PICKPOCKET_DoIt);
};

func void DIA_Lutero_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};

func void DIA_Lutero_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};

