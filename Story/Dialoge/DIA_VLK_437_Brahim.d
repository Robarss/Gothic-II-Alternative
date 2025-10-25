
var int Brahim_ShowedMaps;

func void B_BrahimNewMaps()
{
	if(Brahim_ShowedMaps == TRUE)
	{
		AI_Output(self,other,"B_BrahimNewMaps_07_00");	//Vrať se později, určitě pro tebe pak budu něco mít.
	};
};


instance DIA_Brahim_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_EXIT_Condition;
	information = DIA_Brahim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Brahim_EXIT_Info()
{
	B_BrahimNewMaps();
	AI_StopProcessInfos(self);
};


instance DIA_Brahim_PICKPOCKET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 900;
	condition = DIA_Brahim_PICKPOCKET_Condition;
	information = DIA_Brahim_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Brahim_PICKPOCKET_Condition()
{
	return C_Beklauen(15,15);
};

func void DIA_Brahim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
	Info_AddChoice(DIA_Brahim_PICKPOCKET,Dialog_Back,DIA_Brahim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brahim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brahim_PICKPOCKET_DoIt);
};

func void DIA_Brahim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
};

func void DIA_Brahim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
};


instance DIA_Brahim_GREET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_GREET_Condition;
	information = DIA_Brahim_GREET_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Brahim_GREET_Condition()
{
	return TRUE;
};

func void DIA_Brahim_GREET_Info()
{
	AI_Output(other,self,"DIA_Brahim_GREET_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Brahim_GREET_07_01");	//Jmenuji se Brahim. Kreslím mapy a pak je prodávám.
	AI_Output(self,other,"DIA_Brahim_GREET_07_02");	//Tys tu nový, a tak by se ti nějaká mapa města jistě hodila.
	AI_Output(self,other,"DIA_Brahim_GREET_07_03");	//Je poměrně levná a bude se ti dost hodit, dokud se tu úplně nezorientuješ.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Brahim kreslí a prodává mapy. Sídlí poblíž přístavu.");
};


instance DIA_Addon_Brahim_MissingPeople(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 5;
	condition = DIA_Addon_Brahim_MissingPeople_Condition;
	information = DIA_Addon_Brahim_MissingPeople_Info;
	description = "Je to pravda, že obyvatelé tohohle města mizejí bez jakékoli stopy?";
};


func int DIA_Addon_Brahim_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (ENTERED_ADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brahim_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Brahim_MissingPeople_15_00");	//Je to pravda, že obyvatelé tohohle města mizejí bez jakékoli stopy?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_01");	//Hej, taky sem o tom slyšel. Bohužel, nemůžu říct, jestli jsou ty příbehy pravdivé.
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_02");	//Jen se koukni okolo. Tohle skutečně není místo kde bys chtel žít navždy, co?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_03");	//Žáden div, že lidé odcházejí.
};


instance DIA_Brahim_BUY(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 9;
	condition = DIA_Brahim_BUY_Condition;
	information = DIA_Brahim_BUY_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své mapy.";
};


func int DIA_Brahim_BUY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brahim_GREET))
	{
		return TRUE;
	};
};

func void DIA_Brahim_BUY_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Brahim_BUY_15_00");	//Ukaž mi své mapy.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_01");	//Lepší nenajdeš ani v tom svém klášteře.
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_02");	//Dobré mapy jsou důležité, zvláště pro ty, kdo přicházejí z pevniny, mistře paladine.
	};
	Brahim_ShowedMaps = TRUE;
};


instance DIA_Brahim_Kap3_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_EXIT_Condition;
	information = DIA_Brahim_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_EXIT_Condition()
{
	if((Kapitel >= 3) && (Npc_KnowsInfo(other,DIA_Brahim_Kap3_First_EXIT) || (Npc_HasItems(other,ItWr_ShatteredGolem_MIS) == 0)))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_EXIT_Info()
{
	if(Kapitel <= 4)
	{
		B_BrahimNewMaps();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Brahim_Kap3_First_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_First_EXIT_Condition;
	information = DIA_Brahim_Kap3_First_EXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_First_EXIT_Condition()
{
	if((Kapitel >= 3) && (Npc_HasItems(other,ItWr_ShatteredGolem_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_First_EXIT_Info()
{
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_00");	//Já věděl, že tě tenhle kousek bude zajímat.
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_15_01");	//Jaký kousek?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_02");	//No, ta stará mapa, kterou sis právě koupil.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_03");	//Znám takové, jako jsi ty. Nepropásnete jedinou šanci, jak přijít k bohatství.
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,Dialog_Back,DIA_Brahim_Kap3_First_EXIT_BACK);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Jak jsi získal tenhle dokument?",DIA_Brahim_Kap3_First_EXIT_WhereGetIt);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Co je to za dokument?",DIA_Brahim_Kap3_First_EXIT_Content);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Proč si ji nenecháš sám?",DIA_Brahim_Kap3_First_EXIT_KeepIt);
};

func void DIA_Brahim_Kap3_First_EXIT_BACK()
{
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
};

func void DIA_Brahim_Kap3_First_EXIT_WhereGetIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00");	//Kde jsi získal tuhle mapu?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01");	//No, našel jsem ji ve štosu starých map, který jsem nedávno koupil.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02");	//Ten, kdo ji prodával, ji musel přehlédnout.
};

func void DIA_Brahim_Kap3_First_EXIT_Content()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_Content_15_00");	//Co je to za mapu?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01");	//Vypadá to jako nějaká mapa k pokladu.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02");	//Ty mi ale připadáš jako někdo, kdo by něčemu takovému mohl přijít na kloub.
};

func void DIA_Brahim_Kap3_First_EXIT_KeepIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//Proč si ji nenecháš sám?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01");	//Jsem už starý a časy, kdy jsem vyrážel na výpravy, už jsou dávno pryč.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02");	//Teď už to nechávám na mladších.
};

