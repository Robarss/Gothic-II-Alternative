
instance DIA_SylvioDJG_EXIT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 999;
	condition = DIA_SylvioDJG_EXIT_Condition;
	information = DIA_SylvioDJG_EXIT_Info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int DIA_SylvioDJG_EXIT_Condition()
{
	return 1;
};

func void DIA_SylvioDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_HelloAgain(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_HelloAgain_Condition;
	information = DIA_SylvioDJG_HelloAgain_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_HelloAgain_Condition()
{
	if((Npc_IsDead(IceDragon) == FALSE) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_HelloAgain_Info()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_00");	//Dobrá, ať se propadnu! Koukáš, jak si vydělat, co? Věděl jsem to! Máš žoldáckou duši.
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_01");	//Hele, jestli si myslíš, že si tu můžeš nahrabat, tak to se fakt pleteš. Byl jsem tu první.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_02");	//Hej, ty! Mágové mě znervózňují! Běž někam jinam! Tady pro tebe nic není.
	}
	else
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_03");	//Hej, ty, paladine! Vrať se zpátky do těch svejch dolů. Tady pro tebe nic není.
	};
	AI_Output(other,self,"DIA_SylvioDJG_HelloAgain_15_04");	//Jasný. Nikdo se nechce dělit o svou kořist.
	AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_05");	//Přesně tak. Zmizni.
};


instance DIA_Sylvio_VERSAGER(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 6;
	condition = DIA_Sylvio_VERSAGER_Condition;
	information = DIA_Sylvio_VERSAGER_Info;
	description = "A co když se mi nechce?";
};


func int DIA_Sylvio_VERSAGER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_HelloAgain) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_VERSAGER_Info()
{
	AI_Output(other,self,"DIA_Sylvio_VERSAGER_15_00");	//A co když se mi nechce?
	AI_Output(self,other,"DIA_Sylvio_VERSAGER_09_01");	//Nehraj si na tvrďáka, pískle, jinak skončíš jako ty mizerný svině, co se válej támhle na sněhu.
};


instance DIA_Sylvio_DEINELEUTE(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 7;
	condition = DIA_Sylvio_DEINELEUTE_Condition;
	information = DIA_Sylvio_DEINELEUTE_Info;
	description = "To byli tví lidé?";
};


func int DIA_Sylvio_DEINELEUTE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_VERSAGER) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_DJG_Sylvio_KillIceGolem == 0))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DEINELEUTE_Info()
{
	AI_Output(other,self,"DIA_Sylvio_DEINELEUTE_15_00");	//To byli tví lidé?
	AI_Output(self,other,"DIA_Sylvio_DEINELEUTE_09_01");	//Ne tak docela. Žádný velký ztráty. Ti idioti stejně nestáli za nic.
};


instance DIA_Sylvio_WASISTPASSIERT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 8;
	condition = DIA_Sylvio_WASISTPASSIERT_Condition;
	information = DIA_Sylvio_WASISTPASSIERT_Info;
	description = "Co se jim stalo?";
};


func int DIA_Sylvio_WASISTPASSIERT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_VERSAGER) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASISTPASSIERT_Info()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_15_00");	//Co se jim stalo?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_01");	//Nebyli schopný se dostat tam přes ty ledový obry. Zůstali tam.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_02");	//Když seš tak tvrdej, tak proč to nezkusíš?
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Tak dobrá. Proč ne?",DIA_Sylvio_WASISTPASSIERT_ok);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"K čemu ti bude dobrý, když to udělám?",DIA_Sylvio_WASISTPASSIERT_washastdudavon);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Co z toho budu mít?",DIA_Sylvio_WASISTPASSIERT_warum);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Proč to nevyřídíš sám?",DIA_Sylvio_WASISTPASSIERT_selbst);
	Log_CreateTopic(TOPIC_SylvioKillIceGolem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SylvioKillIceGolem,LOG_Running);
	B_LogEntry(TOPIC_SylvioKillIceGolem,"Sylvio se bojí dvou ledových golemů před vchodem do zamrzlé části Hornického údolí.");
	MIS_DJG_Sylvio_KillIceGolem = LOG_Running;
};

func void DIA_Sylvio_WASISTPASSIERT_selbst()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_selbst_15_00");	//Proč to nevyřídíš sám?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_01");	//Hele, nech si ty nafoukaný řeči.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_02");	//Jak to já vidím, seš podělanej strachy.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Nemám v úmyslu přistoupit na tvoji hru.",DIA_Sylvio_WASISTPASSIERT_keinInteresse);
};


var int DJG_Sylvio_PromisedMoney;

func void DIA_Sylvio_WASISTPASSIERT_warum()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_warum_15_00");	//Co z toho budu mít?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_warum_09_01");	//Hodně. Řekněme... 1000 zlatých. To zní dobře, ne?
	DJG_Sylvio_PromisedMoney = TRUE;
};

func void DIA_Sylvio_WASISTPASSIERT_washastdudavon()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00");	//K čemu ti bude dobrý, když to udělám?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01");	//K tomu samýmu, co tobě. Ale abych ti odpověděl na otázku, chci se dostat do té zamrzlé oblasti.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02");	//Bohužel, v cestě mi stojej ty zatracený věci.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Co chceš v té zamrzlé oblasti dělat?",DIA_Sylvio_WASISTPASSIERT_Eisregion);
};

func void DIA_Sylvio_WASISTPASSIERT_keinInteresse()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00");	//Nemám v úmyslu přistoupit na tvoji hru.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01");	//Aha. Tak odsud koukej sypat, ty babo.
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASISTPASSIERT_Eisregion()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00");	//Co chceš v té zamrzlé oblasti dělat?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01");	//Ty s těma otázkama nepřestaneš, co? Dobrá, povím ti to.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02");	//Tady, za tím srázem, je taková ledová pustina, jakou jsi nikdy předtím neviděl.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03");	//Spolu s tučnými zásobami tam je ukrytý poklad ledového draka.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04");	//Chci ho dostat. Tak jak? Ano, nebo ne?
};

func void DIA_Sylvio_WASISTPASSIERT_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_ok_15_00");	//Tak dobrá. Proč ne?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_ok_09_01");	//Tak honem. Nemám na to celý den.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_ICEGOLEMSKILLED(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 9;
	condition = DIA_Sylvio_ICEGOLEMSKILLED_Condition;
	information = DIA_Sylvio_ICEGOLEMSKILLED_Info;
	description = "Cesta je volná! Ti ledoví obři už tam zaclánět nebudou.";
};


func int DIA_Sylvio_ICEGOLEMSKILLED_Condition()
{
	if(Npc_IsDead(IceGolem_Sylvio1) && Npc_IsDead(IceGolem_Sylvio2) && (MIS_DJG_Sylvio_KillIceGolem == LOG_Running) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_ICEGOLEMSKILLED_Info()
{
	AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_00");	//Cesta je volná! Ti ledoví obři už tam zaclánět nebudou.
	AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_01");	//Dobrá práce. Podíváme se na to.
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_02");	//Tak moment. A co prachy?
		AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_03");	//Všechno má svůj čas.
	};
	AI_StopProcessInfos(self);
	MIS_DJG_Sylvio_KillIceGolem = LOG_SUCCESS;
	B_GivePlayerXP(XP_SylvioDJGIceGolemDead);
	Npc_ExchangeRoutine(self,"IceWait1");
	B_StartOtherRoutine(DJG_Bullco,"IceWait1");
};


instance DIA_Sylvio_WASJETZT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 10;
	condition = DIA_Sylvio_WASJETZT_Condition;
	information = DIA_Sylvio_WASJETZT_Info;
	description = "Co dál?";
};


func int DIA_Sylvio_WASJETZT_Condition()
{
	if((MIS_DJG_Sylvio_KillIceGolem == LOG_SUCCESS) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASJETZT_Info()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_15_00");	//Co dál?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_01");	//Fajn. Řekl bych, že to vypadá pěkně na levačku.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_02");	//Nejlíp bude, když půjdeš první a já za tebou.
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Tak dobrá.",DIA_Sylvio_WASJETZT_ok);
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Bojíš se?",DIA_Sylvio_WASJETZT_trennen);
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Nebudu za tebe dělat špinavou práci.",DIA_Sylvio_WASJETZT_nein);
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		Info_AddChoice(DIA_Sylvio_WASJETZT,"Nejdřív bych rád viděl ty prachy.",DIA_Sylvio_WASJETZT_Geld);
	};
};

func void DIA_Sylvio_WASJETZT_trennen()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_trennen_15_00");	//Bojíš se?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_trennen_09_01");	//Nesmysl, přestaň žvanit. Jdeme.
};

func void DIA_Sylvio_WASJETZT_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_ok_15_00");	//Tak dobrá.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_ok_09_01");	//Fajn, pokračuj, do toho.
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_nein()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_nein_15_00");	//Nebudu za tebe dělat špinavou práci.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_nein_09_01");	//Babo!
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_Geld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_Geld_15_00");	//Nejdřív bych rád viděl ty prachy.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_Geld_09_01");	//Až dostaneme toho draka, budeš mít peněz, kolik uneseš.
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Chci ty peníze hned.",DIA_Sylvio_WASJETZT_jetztGeld);
};

func void DIA_Sylvio_WASJETZT_jetztGeld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_jetztGeld_15_00");	//Chci ty peníze hned.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_jetztGeld_09_01");	//Buď půjdeš vpředu, nebo si to s tebou vyřídim.
};


instance DIA_Sylvio_KOMMSTDU(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_KOMMSTDU_Condition;
	information = DIA_Sylvio_KOMMSTDU_Info;
	permanent = TRUE;
	description = "Myslel jsem, že máme namířeno do té zamrzlé oblasti.";
};


func int DIA_Sylvio_KOMMSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_WASJETZT) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_KOMMSTDU_Info()
{
	AI_Output(other,self,"DIA_Sylvio_KOMMSTDU_15_00");	//Myslel jsem, že máme namířeno do té zamrzlé oblasti.
	AI_Output(self,other,"DIA_Sylvio_KOMMSTDU_09_01");	//Pokračuj dál. Budu hned za tebou.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_DUHIER(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_DUHIER_Condition;
	information = DIA_Sylvio_DUHIER_Info;
	permanent = TRUE;
	description = "Potřebovat bych nějakou pomoc.";
};


func int DIA_Sylvio_DUHIER_Condition()
{
	if((Npc_IsDead(IceDragon) == FALSE) && (IceDragon.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DUHIER_Info()
{
	AI_Output(other,self,"DIA_Sylvio_DUHIER_15_00");	//Potřebovat bych nějakou pomoc.
	AI_Output(self,other,"DIA_Sylvio_DUHIER_09_01");	//Nesmysl. Vedeš si dobře.
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_WHATNEXT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 12;
	condition = DIA_SylvioDJG_WHATNEXT_Condition;
	information = DIA_SylvioDJG_WHATNEXT_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_WHATNEXT_Condition()
{
	if(Npc_IsDead(IceDragon))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_WHATNEXT_Info()
{
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_00");	//Ledový drak je mrtvý! A teď mi dej všechno, co u sebe máš!
	AI_Output(other,self,"DIA_SylvioDJG_WHATNEXT_15_01");	//Ani náhodou!
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_02");	//Budu to já, koho nemine sláva za zabití ledového draka.
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_03");	//Tvoje nepodstatná role je právě u konce!
	TOPIC_END_SylvioKillIceGolem = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_SylvioDJG_WHATNEXT);
	Info_AddChoice(DIA_SylvioDJG_WHATNEXT,Dialog_Ende,DIA_SylvioDJG_WHATNEXT_ATTACK);
};

func void DIA_SylvioDJG_WHATNEXT_ATTACK()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(DJG_Bullco,"Start");
	B_LogEntry(TOPIC_Dragonhunter,"Ten hajzl Sylvio si dělal nároky na moje vítězství nad ledovým drakem. Trochu jsme se kvůli tomu poškorpili.");
	B_Attack(self,other,AR_NONE,1);
	B_Attack(DJG_Bullco,other,AR_NONE,1);
};


instance DIA_SylvioDJG_BUTNOW(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 13;
	condition = DIA_SylvioDJG_BUTNOW_Condition;
	information = DIA_SylvioDJG_BUTNOW_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_SylvioDJG_BUTNOW_Condition()
{
	if(Npc_IsDead(IceDragon) && (Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(other,DIA_SylvioDJG_WHATNEXT))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_BUTNOW_Info()
{
	AI_Output(self,other,"DIA_SylvioDJG_BUTNOW_09_00");	//Je načase vyrovnat skóre.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	B_Attack(self,other,AR_NONE,1);
	B_Attack(DJG_Bullco,other,AR_NONE,1);
};


instance DIA_Sylvio_PICKPOCKET(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 900;
	condition = DIA_Sylvio_PICKPOCKET_Condition;
	information = DIA_Sylvio_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Sylvio_PICKPOCKET_Condition()
{
	return C_Beklauen(78,560);
};

func void DIA_Sylvio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,Dialog_Back,DIA_Sylvio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sylvio_PICKPOCKET_DoIt);
};

func void DIA_Sylvio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};

func void DIA_Sylvio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};

