
instance DIA_Dyrian_EXIT(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 999;
	condition = DIA_Dyrian_EXIT_Condition;
	information = DIA_Dyrian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dyrian_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dyrian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_Hello(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_Hello_Condition;
	information = DIA_Dyrian_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Hello_Info()
{
	AI_Output(self,other,"DIA_Dyrian_Hello_13_00");	//(smutně) Co chceš?
};


instance DIA_Dyrian_Wurst(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_Wurst_Condition;
	information = DIA_Dyrian_Wurst_Info;
	permanent = FALSE;
	description = "Nemám čas, musím rozdělovat klobásy.";
};


func int DIA_Dyrian_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Dyrian_Wurst_15_00");	//Nemám čas, musím rozdělovat klobásy.
	AI_Output(self,other,"DIA_Dyrian_Wurst_13_01");	//Díky. Doufám, že to není poslední klobása, kterou jsem tu dostal.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
};


instance DIA_Dyrian_Job(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_Job_Condition;
	information = DIA_Dyrian_Job_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Dyrian_Job_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Hello) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Job_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Job_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Dyrian_Job_13_01");	//Porušil jsem zákony tohoto společenství.
	AI_Output(self,other,"DIA_Dyrian_Job_13_02");	//Teď čekám na rozhodnutí Nejvyšší rady, jestli budu moci zůstat v klášteře.
};


instance DIA_Dyrian_WhatDone(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_WhatDone_Condition;
	information = DIA_Dyrian_WhatDone_Info;
	permanent = FALSE;
	description = "Řekni mi, co se stalo.";
};


func int DIA_Dyrian_WhatDone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_Job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_WhatDone_Info()
{
	AI_Output(other,self,"DIA_Dyrian_WhatDone_15_00");	//Řekni mi, co se stalo.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_01");	//Když jsem zametal, vzal jsem knihu z komnat mágů, abych si ji mohl později přečíst.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_02");	//Mistr Hyglas si toho samozřejmě okamžitě všiml a na tu knihu se mě zeptal.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_03");	//Ze strachu před trestem jsem zalhal - ale později mě nachytal s tou knihou v mé cele.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_04");	//Strašně se rozzlobil a řekl o tom Nejvyšší radě. Teď probírají, jestli mohu zůstat.
};


instance DIA_Dyrian_CanHelp(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 4;
	condition = DIA_Dyrian_CanHelp_Condition;
	information = DIA_Dyrian_CanHelp_Info;
	permanent = TRUE;
	description = "Je něco, jak bych ti mohl pomoci?";
};


func int DIA_Dyrian_CanHelp_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_CanHelp_Info()
{
	AI_Output(other,self,"DIA_Dyrian_CanHelp_15_00");	//Je něco, jak bych ti mohl pomoci?
	AI_Output(self,other,"DIA_Dyrian_CanHelp_13_01");	//Ne, odevzdal jsem se na milost Innosovi a mágům.
};


instance DIA_Dyrian_Scroll(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_Scroll_Condition;
	information = DIA_Dyrian_Scroll_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_Scroll_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) || (MIS_RUNE == LOG_Running) || (MIS_GOLEM == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Scroll_Info()
{
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_00");	//Hele, vážně jsi požadoval Zkoušku ohně?
	AI_Output(other,self,"DIA_Dyrian_Scroll_15_01");	//Ano. A mám v úmyslu ji složit.
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_02");	//Dobrá - možná bych ti s tím mohl pomoci. Můžu ti dát velice užitečný kouzelný svitek. Kouzlo SPÁNKU. Máš zájem?
	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll,"Ne, nepotřebuji tvou pomoc.",DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll,"Co za to chceš?",DIA_Dyrian_Scroll_How);
	Info_AddChoice(DIA_Dyrian_Scroll,"K čemu mi bude?",DIA_Dyrian_Scroll_What);
};

func void DIA_Dyrian_Scroll_What()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_00");	//K čemu mi bude?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_01");	//S pomocí tohohle kouzla můžeš kohokoliv na chvíli uvrhnout do magického spánku. Ovšem jenom v případě, že je jeho vůle slabší než tvoje.
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_02");	//To by se mohlo hodit, pokud budeš někoho potřebovat odklidit z cesty.
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_03");	//A jak zjistím, jestli má ten dotyčný slabší vůli než já?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_04");	//Ani se to nenamáhej zkoušet na mágy. Ale většinu noviců bys tak měl uspat.
};

func void DIA_Dyrian_Scroll_No()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_No_15_00");	//Ne, nepotřebuji tvou pomoc.
	AI_Output(self,other,"DIA_Dyrian_Scroll_No_13_01");	//Pokud bys náhodou změnil názor, můžeš za mnou kdykoliv přijít.
	Info_ClearChoices(DIA_Dyrian_Scroll);
};

func void DIA_Dyrian_Scroll_How()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_How_15_00");	//Co za to chceš?
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_01");	//Každý mág, který u zkoušky uspěje, může mít jedno přání.
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_02");	//Pokud se ti opravdu podaří projít Zkouškou ohně, možná bys mohl zařídit, abych zůstal tady v klášteře.
	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll,"Ne, nepotřebuji tvou pomoc.",DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll,"Dobrá, dej mi ten kouzelný svitek.",DIA_Dyrian_Scroll_Yes);
};

func void DIA_Dyrian_Scroll_Yes()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_Yes_15_00");	//Dobrá, dej mi ten kouzelný svitek.
	AI_Output(self,other,"DIA_Dyrian_Scroll_Yes_13_01");	//Přeji ti hodně štěstí u zkoušky. Ať je ti Innos nápomocen.
	B_GiveInvItems(self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_Running;
	Log_CreateTopic(Topic_DyrianDrin,LOG_MISSION);
	Log_SetTopicStatus(Topic_DyrianDrin,LOG_Running);
	B_LogEntry(Topic_DyrianDrin,"Dyrian mi věnoval svitek s uspávacím kouzlem. Na oplátku se mám - až budu mágem - postarat, aby ho v klášteře nechali i nadále.");
	Info_ClearChoices(DIA_Dyrian_Scroll);
};


instance DIA_Dyrian_Doch(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 4;
	condition = DIA_Dyrian_Doch_Condition;
	information = DIA_Dyrian_Doch_Info;
	permanent = TRUE;
	description = "Změnil jsem názor. Dej mi to uspávací kouzlo.";
};


func int DIA_Dyrian_Doch_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Scroll) && (MIS_HelpDyrian != LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Doch_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Doch_15_00");	//Změnil jsem názor. Dej mi to uspávací kouzlo.
	AI_Output(self,other,"DIA_Dyrian_Doch_13_01");	//Dobrá, ale když zkouškou projdeš, zařídíš, abych mohl zůstat v klášteře.
	B_GiveInvItems(self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_Running;
};


instance DIA_Dyrian_HelloAgain(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_HelloAgain_Condition;
	information = DIA_Dyrian_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_HelloAgain_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_KDF) && (MIS_HelpDyrian == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HelloAgain_Info()
{
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_00");	//(radostně) Díky, zachránils mě!
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_01");	//(ustrašeně) Ach, promiň, mistře. Nechtěl jsem se vtírat.
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_02");	//(zdvořile) Děkuji ti, že mohu zůstat zde v klášteře. Od této chvíle se celý můj život změní.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};

func void B_Dyrian_PlayerHowIsIt()
{
	AI_Output(other,self,"DIA_Dyrian_HowIsIt_15_00");	//Jak se vede?
};


instance DIA_Dyrian_HowIsIt(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_HowIsIt_Condition;
	information = DIA_Dyrian_HowIsIt_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Dyrian_HowIsIt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_HelloAgain))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HowIsIt_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_01");	//Dobře. Mám zdejší práci opravdu rád, mistře.
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_other(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_other_Condition;
	information = DIA_Dyrian_other_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Dyrian_other_Condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_other_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_02");	//Děkuji Innosovi, že mohu být zde v klášteře.
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_Kneipe(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_Kneipe_Condition;
	information = DIA_Dyrian_Kneipe_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Dyrian_Kneipe_Condition()
{
	if((MIS_HelpDyrian == LOG_FAILED) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Kneipe_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_01");	//Na co se mě to ptáš? Vkládal jsem do tebe veškeré své naděje a tys mě nechal na holičkách.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_02");	//Teď už nemám nic než pití. A je to tvoje chyba!
	Info_ClearChoices(DIA_Dyrian_Kneipe);
	Info_AddChoice(DIA_Dyrian_Kneipe,"Tady máš 5 zlaťáků.",DIA_Dyrian_Kneipe_Gold);
	Info_AddChoice(DIA_Dyrian_Kneipe,"Můžu všechno vysvětlit.",DIA_Dyrian_Kneipe_CanExplain);
	Info_AddChoice(DIA_Dyrian_Kneipe,"Podívej, co říkáš.",DIA_Dyrian_Kneipe_ShutUp);
};

func void DIA_Dyrian_Kneipe_Gold()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_Gold_15_00");	//Na, tady máš 5 zlatých.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_01");	//(nervózně) 5 zlatých? Dáváš mi 5 zlatých a chceš se tak revanšovat za to, žes mi zničil život?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_02");	//Vezmu si všechno tvoje zlato!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

func void DIA_Dyrian_Kneipe_CanExplain()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_CanExplain_15_00");	//Můžu všechno vysvětlit.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_01");	//Nech si svoje laciné výmluvy.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_02");	//Lžeš pokaždé, když otevřeš ústa. Nech mě být.
	AI_StopProcessInfos(self);
};

func void DIA_Dyrian_Kneipe_ShutUp()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_ShutUp_15_00");	//Podívej, co říkáš.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_01");	//Jo, jen do toho, jen mě zastrašuj. To ti nijak nepomůže.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_02");	//Řeknu celému světu, co jsi za pokryteckou svini! Hned jak dopiju tuhle flašku...
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_03");	//Běž mi z očí, je mi z tebe nanic!
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_nachher(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_nachher_Condition;
	information = DIA_Dyrian_nachher_Info;
	permanent = TRUE;
	description = "Co se stalo?";
};


func int DIA_Dyrian_nachher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_Kneipe))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_nachher_Info()
{
	AI_Output(other,self,"DIA_Dyrian_nachher_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Dyrian_nachher_13_01");	//Aaa, nech mě na pokoji! Už s tebou nechci mít nic společného!
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_PICKPOCKET(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 900;
	condition = DIA_Dyrian_PICKPOCKET_Condition;
	information = DIA_Dyrian_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Dyrian_PICKPOCKET_Condition()
{
	return C_Beklauen(10,15);
};

func void DIA_Dyrian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET,Dialog_Back,DIA_Dyrian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dyrian_PICKPOCKET_DoIt);
};

func void DIA_Dyrian_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};

func void DIA_Dyrian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};

