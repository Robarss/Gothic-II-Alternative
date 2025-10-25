
instance DIA_Fester_EXIT(C_Info)
{
	npc = Sld_816_Fester;
	nr = 999;
	condition = DIA_Fester_EXIT_Condition;
	information = DIA_Fester_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fester_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fester_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fester_Hello(C_Info)
{
	npc = Sld_816_Fester;
	nr = 1;
	condition = DIA_Fester_Hello_Condition;
	information = DIA_Fester_Hello_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Fester_Hello_Condition()
{
	return TRUE;
};

func void DIA_Fester_Hello_Info()
{
	AI_Output(other,self,"DIA_Fester_Hello_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Fester_Hello_08_01");	//Připravuju se na boj.
};


instance DIA_Fester_Auftrag(C_Info)
{
	npc = Sld_816_Fester;
	nr = 2;
	condition = DIA_Fester_Auftrag_Condition;
	information = DIA_Fester_Auftrag_Info;
	permanent = FALSE;
	description = "Proč?";
};


func int DIA_Fester_Auftrag_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_Hello))
	{
		return TRUE;
	};
};

func void DIA_Fester_Auftrag_Info()
{
	AI_Output(other,self,"DIA_Fester_Auftrag_15_00");	//Proč?
	AI_Output(self,other,"DIA_Fester_Auftrag_08_01");	//Poslední dobou mají sedláci čím dál větší problémy s polními škůdci.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_02");	//Jen pár se jich nějak uživí.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_03");	//Tlustému Onarovi to ale zrovna zábavné nepřipadá. Nikdo z nás už přes týden nedostal výplatu.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_04");	//A víceméně to byla moje chyba. Lee teď chce, abych sám zlikvidoval hnízdo těch potvor.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_05");	//A ostatní kluci se sázejí, jestli to přežiju, nebo ne.
};


instance DIA_Fester_YouFight(C_Info)
{
	npc = Sld_816_Fester;
	nr = 3;
	condition = DIA_Fester_YouFight_Condition;
	information = DIA_Fester_YouFight_Info;
	permanent = FALSE;
	description = "Jsi dobrý bojovník?";
};


func int DIA_Fester_YouFight_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_KnowsInfo(other,DIA_Fester_Hello) && (MIS_Fester_KillBugs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fester_YouFight_Info()
{
	AI_Output(other,self,"DIA_Fester_YouFight_15_00");	//Jsi dobrý bojovník?
	AI_Output(self,other,"DIA_Fester_YouFight_08_01");	//S mečem to celkem umím, ale s lukem zacházím mnohem líp. Proč se ptáš?
};


instance DIA_Fester_WoNest(C_Info)
{
	npc = Sld_816_Fester;
	nr = 4;
	condition = DIA_Fester_WoNest_Condition;
	information = DIA_Fester_WoNest_Info;
	permanent = FALSE;
	description = "Kde je to hnízdo?";
};


func int DIA_Fester_WoNest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_Auftrag) && (MIS_Fester_KillBugs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fester_WoNest_Info()
{
	AI_Output(other,self,"DIA_Fester_WoNest_15_00");	//Kde je to hnízdo?
	AI_Output(self,other,"DIA_Fester_WoNest_08_01");	//Tady vedle pole, v té malé jeskyni.
};


var int Fester_Choice;
const int FC_Gold = 0;
const int FC_Join = 1;

instance DIA_Fester_Together(C_Info)
{
	npc = Sld_816_Fester;
	nr = 5;
	condition = DIA_Fester_Together_Condition;
	information = DIA_Fester_Together_Info;
	permanent = FALSE;
	description = "Tak na to hnízdo můžeme zaútočit společně.";
};


func int DIA_Fester_Together_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_KnowsInfo(other,DIA_Fester_Auftrag))
	{
		return TRUE;
	};
};

func void DIA_Fester_Together_Info()
{
	AI_Output(other,self,"DIA_Fester_Together_15_00");	//Tak na to hnízdo můžeme zaútočit společně.
	AI_Output(self,other,"DIA_Fester_Together_08_01");	//Ty mi chceš pomoct? Proč?
	Info_ClearChoices(DIA_Fester_Together);
	Info_AddChoice(DIA_Fester_Together,"Rád bych viděl nějaké prašule!",DIA_Fester_Together_Gold);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Fester_Together,"Rád bych se k vám přidal!",DIA_Fester_Together_Join);
	};
};

func void DIA_Fester_Together_Join()
{
	AI_Output(other,self,"DIA_Fester_Together_Join_15_00");	//Rád bych se k vám přidal!
	AI_Output(self,other,"DIA_Fester_Together_Join_08_01");	//Aha, tak je to tedy. Chceš dokázat, jak jsi dobrý.
	AI_Output(self,other,"DIA_Fester_Together_Join_08_02");	//(vychytrale) Dobře, tak na to hnízdo zaútočíme společně.
	Fester_Choice = FC_Join;
	Info_ClearChoices(DIA_Fester_Together);
};

func void DIA_Fester_Together_Gold()
{
	AI_Output(other,self,"DIA_Fester_Together_Gold_15_00");	//Rád bych viděl nějaké prašule!
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_01");	//(směje se) Ty hajzle! Chceš těžit z mý situace, co?
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_02");	//Buď ti ale zaplatím, nebo budu brzo žrát hlínu.
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_03");	//No dobře. Dám ti 50 zlaťáků - víc nemám.
	Fester_Choice = FC_Gold;
	Info_ClearChoices(DIA_Fester_Together);
};


var int Fester_Losgeh_Day;

instance DIA_Fester_TogetherNOW(C_Info)
{
	npc = Sld_816_Fester;
	nr = 6;
	condition = DIA_Fester_TogetherNOW_Condition;
	information = DIA_Fester_TogetherNOW_Info;
	permanent = TRUE;
	description = "Tak pojďme na to hnízdo!";
};


func int DIA_Fester_TogetherNOW_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_KnowsInfo(other,DIA_Fester_Together) && (MIS_Fester_KillBugs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fester_TogetherNOW_Info()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_15_00");	//Tak pojďme na to hnízdo!
	if(Wld_IsTime(20,30,6,0))
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_01");	//Potmě? Ne ne, radši bychom to měli udělat ve dne.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_02");	//Teď? Nepotřebuješ se nejdřív trochu vybavit?
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_03");	//Měl by sis ještě dojít na statek.
		Info_ClearChoices(DIA_Fester_TogetherNOW);
		Info_AddChoice(DIA_Fester_TogetherNOW,"No dobře, tak tedy ještě chvíli počkejme.",DIA_Fester_TogetherNOW_Later);
		Info_AddChoice(DIA_Fester_TogetherNOW,"Jindy už nebude taková příležitost.",DIA_Fester_TogetherNOW_NOW);
	};
};

func void DIA_Fester_TogetherNOW_NOW()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Now_15_00");	//Jindy už nebude taková příležitost.
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Now_08_01");	//Fajn, tak uvidíme, co v tobě je.
	Npc_ExchangeRoutine(self,"GUIDE");
	Fester_Losgeh_Day = B_GetDayPlus();
	MIS_Fester_KillBugs = LOG_Running;
	Log_CreateTopic(TOPIC_FesterRauber,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FesterRauber,LOG_Running);
	B_LogEntry(TOPIC_FesterRauber,"Spolu s Festerem zničíme hnízdo polních škůdců.");
	Info_ClearChoices(DIA_Fester_TogetherNOW);
	AI_StopProcessInfos(self);
};

func void DIA_Fester_TogetherNOW_Later()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Later_15_00");	//No dobře, tak tedy ještě chvíli počkejme.
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Later_08_01");	//Víš, kde mě najdeš.
	Info_ClearChoices(DIA_Fester_TogetherNOW);
};


instance DIA_Fester_InCave(C_Info)
{
	npc = Sld_816_Fester;
	nr = 7;
	condition = DIA_Fester_InCave_Condition;
	information = DIA_Fester_InCave_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fester_InCave_Condition()
{
	if((MIS_Fester_KillBugs == LOG_Running) && (Npc_GetDistToWP(self,"NW_BIGFARM_FELDREUBER4") <= 500))
	{
		self.aivar[AIV_LastFightComment] = TRUE;
		return TRUE;
	};
};

func void DIA_Fester_InCave_Info()
{
	if(Wld_GetDay() > Fester_Losgeh_Day)
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_00");	//Kde k čertu vězíš?
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_01");	//Takže sem zavlékají mrtvé sedláky. To je ale humus.
	};
	AI_Output(self,other,"DIA_Fester_InCave_08_02");	//My jsme ale s těmi špinavými zrůdami skoncovali.
	AI_Output(self,other,"DIA_Fester_InCave_08_03");	//Vraťme se!
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_Fester_WasMitAbmachung(C_Info)
{
	npc = Sld_816_Fester;
	nr = 8;
	condition = DIA_Fester_WasMitAbmachung_Condition;
	information = DIA_Fester_WasMitAbmachung_Info;
	permanent = FALSE;
	description = "A co naše dohoda?";
};


func int DIA_Fester_WasMitAbmachung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_InCave))
	{
		return TRUE;
	};
};

func void DIA_Fester_WasMitAbmachung_Info()
{
	AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_00");	//A co naše dohoda?
	if(Festers_Giant_Bug_Killed == 0)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_01");	//Děláš si srandu? Vždyť jsi neudělal vůbec nic!
	}
	else if(Fester_Choice == FC_Join)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_02");	//No, můžu ti pomoct, abychom tě vzali mezi sebe, ale neudělám to.
		AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_03");	//A proč?
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_04");	//Kdybych někomu vyžvanil, žes mi pomohl, dali by mi nějakou jinou práci.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_05");	//Určitě chápeš, že to by se mi zrovna nelíbilo.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_06");	//No, je to smůla, hochu. Určitě ale najdeš někoho jiného, kdo ti pomůže.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_07");	//Hej, tys chtěl těžit z mé situace. Takže teď zase trochu já zneužiju té tvé.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_08");	//Ber to ale z té lepší stránky: získals cennou zkušenost, a to za to přece stojí, ne?
	};
	MIS_Fester_KillBugs = LOG_OBSOLETE;
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_BIGMILL_FIELD_MONSTER_04");
	Wld_InsertNpc(Giant_Bug,"NW_BIGMILL_FIELD_MONSTER_04");
};


var int Fester_Duell_Day;
var int Fester_FightVerarscht;
var int Fester_FightSylvio;

instance DIA_Fester_PERMPruegel(C_Info)
{
	npc = Sld_816_Fester;
	nr = 9;
	condition = DIA_Fester_PERMPruegel_Condition;
	information = DIA_Fester_PERMPruegel_Info;
	permanent = TRUE;
	description = "Myslím, že ti trochu zmaluju hřbet.";
};


func int DIA_Fester_PERMPruegel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_WasMitAbmachung) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO) || (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Fester_PERMPruegel_Info()
{
	var int random;
	AI_Output(other,self,"DIA_Fester_PERMPruegel_15_00");	//Myslím, že ti trochu zmaluju hřbet.
	if(Fester_Duell_Day < Wld_GetDay())
	{
		random = Hlp_Random(11);
		CreateInvItems(self,ItMi_Gold,random);
		Fester_Duell_Day = Wld_GetDay();
	};
	if(Npc_KnowsInfo(other,DIA_Fester_WasMitAbmachung) && (Fester_FightVerarscht == FALSE))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_01");	//Nemám rád, když si ze mě někdo dělá šoufky.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_02");	//Už se bojím, už se bojím!
		Fester_FightVerarscht = TRUE;
	}
	else if(Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_03");	//Neudělals dobře, že ses spolčil se Sylviem.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_04");	//Tys jeden z těch Leeových vlezdoprdelků, co? Tak tos narazil na toho nepravého!
		Fester_FightSylvio = TRUE;
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_05");	//Co po mně k čertu chceš?
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_06");	//Jenom se mi líbí, když si mácháš hubu v blátě!
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_07");	//Ty to nechápeš, co?
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Fester_PICKPOCKET(C_Info)
{
	npc = Sld_816_Fester;
	nr = 900;
	condition = DIA_Fester_PICKPOCKET_Condition;
	information = DIA_Fester_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Fester_PICKPOCKET_Condition()
{
	return C_Beklauen(27,45);
};

func void DIA_Fester_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
	Info_AddChoice(DIA_Fester_PICKPOCKET,Dialog_Back,DIA_Fester_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fester_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fester_PICKPOCKET_DoIt);
};

func void DIA_Fester_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
};

func void DIA_Fester_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
};

