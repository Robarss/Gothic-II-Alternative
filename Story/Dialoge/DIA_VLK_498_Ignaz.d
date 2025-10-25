
instance DIA_Ignaz_EXIT(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 999;
	condition = DIA_Ignaz_EXIT_Condition;
	information = DIA_Ignaz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ignaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ignaz_PICKPOCKET(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 900;
	condition = DIA_Ignaz_PICKPOCKET_Condition;
	information = DIA_Ignaz_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Ignaz_PICKPOCKET_Condition()
{
	return C_Beklauen(38,50);
};

func void DIA_Ignaz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET,Dialog_Back,DIA_Ignaz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ignaz_PICKPOCKET_DoIt);
};

func void DIA_Ignaz_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};

func void DIA_Ignaz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};


instance DIA_Ignaz_Hallo(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Hallo_Condition;
	information = DIA_Ignaz_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ignaz_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Hallo_Info()
{
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_00");	//Á - přišel jsi právě včas. Potřebuju pro své magické pokusy nějakého asistenta.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_01");	//Jsem si jistý, že jsi celý nedočkavý, jak mi ve vědeckém zájmu udělat malou laskavost.
	AI_Output(other,self,"DIA_Ignaz_Hallo_15_02");	//Pomalu, příteli. Nejdřív mi řekni, o co vlastně jde.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_03");	//Vymyslel jsem nové kouzlo. Kouzlo zapomnění.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_04");	//Už jsem úspěšně provedl několik praktických zkoušek, ale na finální test se mi nedostává času.
};


instance DIA_Ignaz_Traenke(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 3;
	condition = DIA_Ignaz_Traenke_Condition;
	information = DIA_Ignaz_Traenke_Info;
	permanent = FALSE;
	description = "Co z toho budu mít, když ti pomůžu?";
};


func int DIA_Ignaz_Traenke_Condition()
{
	if(MIS_Ignaz_Charm != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Traenke_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Traenke_15_00");	//Co z toho budu mít, když ti pomůžu?
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_01");	//Můžu tě naučit, jak se připravují lektvary.
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_02");	//Znám recepty na léčivou esenci, esenci many a lektvar rychlosti.
};


instance DIA_Ignaz_Experiment(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 4;
	condition = DIA_Ignaz_Experiment_Condition;
	information = DIA_Ignaz_Experiment_Info;
	permanent = FALSE;
	description = "Řekni mi o tom experimentu a kouzlu víc.";
};


func int DIA_Ignaz_Experiment_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_Experiment_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_00");	//Řekni mi o tom experimentu a kouzlu víc.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_01");	//To kouzlo má za následek, že si určitá osoba nepamatuje různé události.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_02");	//Už se mi podařilo zjistit, že to funguje, pokud je dotyčná osoba naštvaná - například, pokud ji někdo právě dal nakládačku, nebo ji oloupil.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_03");	//Dokonce i když je jen svědkem takové události, tak se jí to pak vymaže z paměti.
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_04");	//To bych jako měl někoho srazit na zem a pak na něj seslat kouzlo?
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_05");	//Ano, mám dojem, žes trefil hřebíček na hlavičku. Ale abys někoho naštval, stačí, abys ho napadl, nemusíš ho srazit k zemi.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_06");	//Takže by sis měl vybrat někoho, kdo je o samotě - pokud kolem budou lidé, jen se dostaneš do potíží s lordem Andrem.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_07");	//Taky nemá žádný smysl sesílat kouzlo na někoho, kdo na tebe právě útočí. Počkej na ten správný okamžik.
};


instance DIA_Ignaz_teilnehmen(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 5;
	condition = DIA_Ignaz_teilnehmen_Condition;
	information = DIA_Ignaz_teilnehmen_Info;
	permanent = FALSE;
	description = "Dobrá, vyzkouším to kouzlo.";
};


func int DIA_Ignaz_teilnehmen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ignaz_Experiment))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_teilnehmen_Info()
{
	AI_Output(other,self,"DIA_Ignaz_teilnehmen_15_00");	//Dobrá, vyzkouším to kouzlo.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_01");	//Tak si vezmi tenhle svitek a vyzkoušej si život pokusné myši.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_02");	//Až to provedeš, tak se vrať o tom poreferovat.
	B_GiveInvItems(self,other,ItSc_Charm,1);
	MIS_Ignaz_Charm = LOG_Running;
	Log_CreateTopic(TOPIC_Ignaz,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Ignaz,LOG_Running);
	B_LogEntry(TOPIC_Ignaz,"Mám vyzkoušet nové Ignazovo kouzlo - kouzlo zapomnění. Když se na mě někdo při bitce nebo z jiného důvodu rozhněvá, určitě se se mnou už nebude chtít bavit. A tehdy nastane pravá chvíle pro použití tohoto zaklínadla.");
	B_LogEntry(TOPIC_Ignaz,"Tohle je ideální příležitost vyzkoušet to kouzlo - pod jeho působením také zapomene ohlásit mimořádnou událost. Nemyslím si, že mi v přístavu bude někdo bránit, když mu dám ránu.");
	AI_StopProcessInfos(self);
};


instance DIA_Ignaz_Running(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Running_Condition;
	information = DIA_Ignaz_Running_Info;
	permanent = FALSE;
	description = "K tomu experimentu...";
};


func int DIA_Ignaz_Running_Condition()
{
	if((MIS_Ignaz_Charm == LOG_Running) && (Charm_Test == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Running_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Running_15_00");	//K tomu experimentu...
	AI_Output(self,other,"DIA_Ignaz_Running_14_01");	//Tak co, uspěl jsi? Nebo jsi to kouzlo jen tak zbůhdarma vyplýtval? Co?
	AI_Output(self,other,"DIA_Ignaz_Running_14_02");	//Jestli potřebuješ další svitky, tak si je ode mě můžeš koupit.
};


instance DIA_Ignaz_Danach(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 6;
	condition = DIA_Ignaz_Danach_Condition;
	information = DIA_Ignaz_Danach_Info;
	permanent = FALSE;
	description = "Použil jsem ten svitek.";
};


func int DIA_Ignaz_Danach_Condition()
{
	if((Charm_Test == TRUE) && (MIS_Ignaz_Charm == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Danach_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Danach_15_00");	//Použil jsem ten svitek.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_01");	//Fajn, fajn. A povedlo se?
	AI_Output(other,self,"DIA_Ignaz_Danach_15_02");	//Ano, funguje to.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_03");	//Výborně. Malý krok pro vědu, ale obrovský pro mě!
	AI_Output(self,other,"DIA_Ignaz_Danach_14_04");	//Teď můžu něco ze svého času využít na to, abych tě zasvětil do tajů alchymie.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_05");	//Taky ti můžu dát několik užitečných věcí, jestli máš zájem.
	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Ignaz z přístavní čtvrti mi může ukázat recepty na výrobu lektvarů.");
	MIS_Ignaz_Charm = LOG_SUCCESS;
	B_GivePlayerXP(XP_MIS_Ignaz_Charm);
	CreateInvItems(self,ItSc_Charm,3);
};


instance DIA_Ignaz_Trade(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 6;
	condition = DIA_Ignaz_Trade_Condition;
	information = DIA_Ignaz_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Ignaz_Trade_Condition()
{
	if((MIS_Ignaz_Charm == LOG_SUCCESS) || Npc_KnowsInfo(other,DIA_Ignaz_Running))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Ignaz_Trade_15_00");	//Ukaž mi své zboží.
};


instance DIA_Ignaz_Teach(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Teach_Condition;
	information = DIA_Ignaz_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě něco z alchymie.";
};


var int DIA_Ignaz_Teach_permanent;

func int DIA_Ignaz_Teach_Condition()
{
	if((DIA_Ignaz_Teach_permanent == FALSE) && (Ignaz_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Ignaz_Teach_15_00");	//Nauč mě něco z alchymie.
	if((PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE))
	{
		Info_ClearChoices(DIA_Ignaz_Teach);
		Info_AddChoice(DIA_Ignaz_Teach,Dialog_Back,DIA_Ignaz_Teach_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,B_BuildLearnString("Lektvar rychlosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),DIA_Ignaz_Teach_Speed);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,B_BuildLearnString("Esence many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Ignaz_Teach_Mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,B_BuildLearnString("Esence hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Ignaz_Teach_Health);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_01");	//OK přípravě lektvaru s pomocí alchymistické kolony potřebuješ laboratorní baňku.
			AI_Output(self,other,"DIA_Ignaz_Teach_14_02");	//Na každý lektvar budeš taky potřebovat různé rostliny a další ingredience.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_04");	//Co bys rád věděl?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ignaz_Teach_14_05");	//Už znáš všechno, čemu bych tě mohl naučit.
		DIA_Ignaz_Teach_permanent = TRUE;
	};
};

func void DIA_Ignaz_Teach_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_BACK()
{
	Info_ClearChoices(DIA_Ignaz_Teach);
};

