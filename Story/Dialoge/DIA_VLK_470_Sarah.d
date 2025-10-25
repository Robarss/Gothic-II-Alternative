
instance DIA_Sarah_EXIT(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 999;
	condition = DIA_Sarah_EXIT_Condition;
	information = DIA_Sarah_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sarah_PICKPOCKET(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 900;
	condition = DIA_Sarah_PICKPOCKET_Condition;
	information = DIA_Sarah_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60_Female;
};


func int DIA_Sarah_PICKPOCKET_Condition()
{
	return C_Beklauen(57,60);
};

func void DIA_Sarah_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
	Info_AddChoice(DIA_Sarah_PICKPOCKET,Dialog_Back,DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sarah_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
};

func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
};


instance DIA_Sarah_Greet(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 1;
	condition = DIA_Sarah_Greet_Condition;
	information = DIA_Sarah_Greet_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Sarah_Greet_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Ausgeliefert == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Greet_Info()
{
	AI_Output(self,other,"DIA_Sarah_Add_16_07");	//Á! To jsi zase ty!
};


instance DIA_Sarah_HALLO(C_Info)
{
	npc = VLK_470_Sarah;
	condition = DIA_Sarah_HALLO_Condition;
	information = DIA_Sarah_HALLO_Info;
	permanent = FALSE;
	description = "Jak jdou obchody?";
};


func int DIA_Sarah_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Sarah_HALLO_Info()
{
	AI_Output(other,self,"DIA_Sarah_HALLO_15_00");	//Jak jdou obchody?
	AI_Output(self,other,"DIA_Sarah_HALLO_16_01");	//Když dorazili paladinové, nejdřív jsem si myslela, že to je příležitost k dobrým obchodům.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_02");	//Ale pak nechali Harada, aby jim vyráběl zbraně, a ani Hakon ani já jsme od nich neviděli ani zlatku.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_03");	//Navíc farmáři už dál nechtějí zásobovat město potravinami, a všechny ceny tak jdou nahoru.
	AI_Output(self,other,"DIA_Sarah_Add_16_00");	//Že mi paladinové platí hotel, je jen slabou útěchou.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Sarah prodává na tržišti zbraně.");
};


instance DIA_Sarah_Bauern(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 2;
	condition = DIA_Sarah_Bauern_Condition;
	information = DIA_Sarah_Bauern_Info;
	permanent = FALSE;
	description = "Co je s farmáři za problémy?";
};


func int DIA_Sarah_Bauern_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sarah_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Bauern_Info()
{
	AI_Output(other,self,"DIA_Sarah_Bauern_15_00");	//Co je s farmáři za problémy?
	AI_Output(self,other,"DIA_Sarah_Bauern_16_01");	//Odmítají dovážet své zboží.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_02");	//Teď, když už sem nepřiplouvají žádné lodě, je město samozřejmě závislé jen na tom, co poskytnou farmáři.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_03");	//A Onar, ten největší z farmářů, si najal žoldnéře, aby chránili jeho farmu před městskou stráží. Jinak by si domobrana všechno zabrala pro sebe.
	AI_Output(self,other,"DIA_Sarah_Add_16_01");	//Ale ti žoldáci nechrání jenom Onarovu farmu.
	AI_Output(self,other,"DIA_Sarah_Add_16_02");	//Zašli tak daleko, že zastrašují i malé farmáře tady u města.
	AI_Output(self,other,"DIA_Sarah_Add_16_03");	//Viděla jsem je, když jsem procházela přes Akilovu farmu. Nechtěla bych teď být v jeho kůži.
};


instance DIA_Sarah_AkilsHof(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 3;
	condition = DIA_Sarah_AkilsHof_Condition;
	information = DIA_Sarah_AkilsHof_Info;
	permanent = FALSE;
	description = "Kde najdu Akilovu farmu?";
};


func int DIA_Sarah_AkilsHof_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sarah_Bauern))
	{
		return TRUE;
	};
};

func void DIA_Sarah_AkilsHof_Info()
{
	AI_Output(other,self,"DIA_Sarah_AkilsHof_15_00");	//Kde najdu Akilovu farmu?
	AI_Output(self,other,"DIA_Sarah_Add_16_04");	//Pokud odejdeš východní bránou a dáš se cestou napravo, dostaneš se ke schodišti.
	AI_Output(self,other,"DIA_Sarah_Add_16_05");	//To vede nahoru k Akilově farmě.
	AI_Output(self,other,"DIA_Sarah_Add_16_06");	//Ale já bych tam teď nechodila - určitě tam ještě pořád jsou žoldáci.
};


instance DIA_Sarah_Trade(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 99;
	condition = DIA_Sarah_Trade_Condition;
	information = DIA_Sarah_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Sarah_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sarah_HALLO) && (MIS_Canthars_KomproBrief != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Sarah_Trade_15_00");	//Ukaž mi své zboží.
	Sarah_WaffenGesehen = TRUE;
};


instance DIA_Sarah_IMKNAST(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 99;
	condition = DIA_Sarah_IMKNAST_Condition;
	information = DIA_Sarah_IMKNAST_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Sarah_IMKNAST_Condition()
{
	if((MIS_Canthars_KomproBrief == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Sarah_IMKNAST_Info()
{
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_00");	//Ty! Ty máš tu drzost tady ještě ukázat svůj ksicht! Nemůžu to dokázat, ale vsadím se, že jsi namočenej do pěkně špinavý hry.
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_01");	//Je to tvoje chyba, že jsem tady. Tvoje a toho zatracenýho Canthara - ať vás Innos ztrestá!
	AI_StopProcessInfos(self);
};


instance DIA_Sarah_Success(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = DIA_Sarah_Success_Condition;
	information = DIA_Sarah_Success_Info;
	permanent = FALSE;
	description = "Canthar se tě snažil obelstít...";
};


func int DIA_Sarah_Success_Condition()
{
	if(Canthar_Ausgeliefert == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Sarah_Success_Info()
{
	AI_Output(other,self,"DIA_Sarah_Success_15_00");	//Canthar se tě pokusil podvést a získat tvůj stánek pro sebe. Ale já jsem ho předhodil městským strážím.
	AI_Output(self,other,"DIA_Sarah_Success_16_01");	//Tak to sis znepřátelil nebezpečného muže. Znám toho bastarda už pěkně dlouho, a vždycky chtěl můj stánek pro sebe.
	AI_Output(self,other,"DIA_Sarah_Success_16_02");	//Vezmi si tuhle zbraň jako vyjádření mé vděčnosti.
	B_GivePlayerXP(XP_CantharImKnast);
	B_GiveInvItems(self,other,ItMw_Piratensaebel,1);
};

