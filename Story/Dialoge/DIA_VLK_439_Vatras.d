
var int Vatras_SchickeLeuteWeg;
var int Vatras_LaresExit;
var int Vatras_MORE;

instance DIA_Addon_Vatras_KillerWarning(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_KillerWarning_Condition;
	information = DIA_Addon_Vatras_KillerWarning_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_KillerWarning_Condition()
{
	if((Kapitel >= 5) && (MadKillerCount >= 3) && (MadKillerCount < 7) && (VatrasPissedOffForever == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_KillerWarning_Info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_00");	//Hodně zvěstí se o tobě v Khorinisu šíří.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_01");	//Říká se, že jsi zapleten do vrařd nevinných lidí.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_02");	//Mohu tě jen varovat synu, doufaje že správně.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_03");	//Nesestupuj z cesty rovnováhy a záchrany tohoto světa. Jinak se budeš muset připravit nést následky.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_04");	//Jak mohu být mimo službu?
};


instance DIA_Addon_Vatras_LastWarning(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_LastWarning_Condition;
	information = DIA_Addon_Vatras_LastWarning_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_LastWarning_Condition()
{
	if((Kapitel >= 5) && (MadKillerCount >= 7) && (VatrasPissedOffForever == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_LastWarning_Info()
{
	B_LastWarningVatras();
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_06");	//Je něco, co bys chtěl dodat?
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning,"Vypadni",DIA_Addon_Vatras_LastWarning_Arsch);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning,"Je mi líto. Nevěděl jsem co dělám.",DIA_Addon_Vatras_LastWarning_Reue);
};

func void DIA_Addon_Vatras_LastWarning_Arsch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00");	//Vypadni
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00");	//Ve tvých slovech není žádný náznak lítosti.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01");	//Nedal jsi mi jinou možnost.
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff();
};

func void DIA_Addon_Vatras_LastWarning_Reue()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00");	//Je mi líto. Nevěděl jsem co dělám.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00");	//Budu se za tebe modlit a doufat, že jednoho dne opět najdeš rovnováhu.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01");	//Buď opatrný a opovaž se ještě někdy zaplést do vraždy.
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	VatrasMadKillerCount = MadKillerCount;
};


instance DIA_Addon_Vatras_PissedOff(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_PissedOff_Condition;
	information = DIA_Addon_Vatras_PissedOff_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_PissedOff_Condition()
{
	if((MadKillerCount > VatrasMadKillerCount) && Npc_KnowsInfo(other,DIA_Addon_Vatras_LastWarning) && (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PissedOff_Info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_00");	//Tvá slova jsou stejně špatná jako tvé činy.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_01");	//Tvé necitelné vraždění zjevně nikdy neskončí.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_02");	//Nedáváš mi jinou možnost.
	B_VatrasPissedOff();
};


instance DIA_Vatras_EXIT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 999;
	condition = DIA_Vatras_EXIT_Condition;
	information = DIA_Vatras_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_EXIT_Info()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && (Vatras_LaresExit == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_00");	//Počkej!
		if(Vatras_GehZuLares == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_01");	//Pokud se setkáš s Laresem....
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_02");	//Je tu jedna malá věc, o kterou bych tě chtěl požádat.
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_03");	//Běž do přístavu. Najdeš tam chlapíka jménem Lares.
			Vatras_GehZuLares = TRUE;
		};
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_04");	//Doruč mu tento ornament a pověz mu, aby ho odnesl zpět. Bude vědět, co udělat dál.
		CreateInvItems(self,ItMi_Ornament_Addon_Vatras,1);
		B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
		Vatras_LaresExit = TRUE;
	};
	AI_StopProcessInfos(self);
	Vatras_MORE = FALSE;
	if(Vatras_SchickeLeuteWeg == TRUE)
	{
		B_StartOtherRoutine(VLK_455_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_454_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_428_Buergerin,"VATRASAWAY");
		B_StartOtherRoutine(VLK_450_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_426_Buergerin,"VATRASAWAY");
		B_StartOtherRoutine(VLK_421_Valentino,"VATRASAWAY");
		Vatras_SchickeLeuteWeg = FALSE;
	};
};


instance DIA_Vatras_PICKPOCKET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 900;
	condition = DIA_Vatras_PICKPOCKET_Condition;
	information = DIA_Vatras_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Vatras_PICKPOCKET_Condition()
{
	return C_Beklauen(91,250);
};

func void DIA_Vatras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,Dialog_Back,DIA_Vatras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Vatras_PICKPOCKET_DoIt);
};

func void DIA_Vatras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};

func void DIA_Vatras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};


instance DIA_Vatras_GREET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_GREET_Condition;
	information = DIA_Vatras_GREET_Info;
	important = TRUE;
};


func int DIA_Vatras_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_GREET_Info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Adanos tě provázej.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Jsem Vatras, služebník Adanosův, strážce božské i pozemské rovnováhy.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Co pro tebe mohu udělat?
};


instance DIA_Addon_Vatras_Cavalorn(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Cavalorn_Condition;
	information = DIA_Addon_Vatras_Cavalorn_Info;
	description = "Mám pro tebe dopis.";
};


func int DIA_Addon_Vatras_Cavalorn_Condition()
{
	if(((Npc_HasItems(other,ItWr_SaturasFirstMessage_Addon_Sealed) >= 1) && (MIS_Addon_Cavalorn_Letter2Vatras == LOG_Running)) || (Npc_HasItems(other,ItWr_SaturasFirstMessage_Addon) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Cavalorn_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_15_00");	//Mám pro tebe dopis.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_01");	//Pro mě?
	if(SaturasFirstMessageOpened == FALSE)
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras);
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon_Sealed,1);
	}
	else
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras_Opened);
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon,1);
		AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_02");	//Jo, ale...byl otevřen. Doufám že ho nečetl nikdo, kdo ho nemá vidět.
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_03");	//Vskutku. To je opravdu důležitá zpráva.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_04");	//Divím se, že se ti ta zpráva dostala vůbec do rukou.
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice(DIA_Addon_Vatras_Cavalorn,"Sebral jsem to banditům",DIA_Addon_Vatras_Cavalorn_Bandit);
	if(MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Addon_Vatras_Cavalorn,"Dal mi ji Cavalorn.",DIA_Addon_Vatras_Cavalorn_Cavalorn);
	};
	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};

func void DIA_Addon_Vatras_Cavalorn_Bandit()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Bandit_15_00");	//Sebral jsem to banditům
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_01");	//(znepokojeně) U Adanose! To není dobré. To vůbec není dobré.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_02");	//Pokud je tvé vyprávění pravdivé, pak máme obrovský problém.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_03");	//Budu se tím zabývat hned, jak to bude možné.
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
};

func void DIA_Addon_Vatras_Cavalorn_Cavalorn()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00");	//Dal mi ji Cavalorn.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01");	//(překvapeně) Cavalorn? Kde je?
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02");	//Řekl mi, abych ti vyřídil, že nemohl dopis doručit. Nyní je na cestě k místu obvyklého setkání. Ať už je to cokoliv.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03");	//Vidím, že sis získal jeho důvěru. Měl bych ti také věřit synu.
	B_GivePlayerXP(XP_Addon_CavalornTrust);
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
};


var int Vatras_Why;

instance DIA_Addon_Vatras_CavalornSentMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_CavalornSentMe_Condition;
	information = DIA_Addon_Vatras_CavalornSentMe_Info;
	permanent = FALSE;
	description = "Cavalorn mě za tebou poslal!";
};


func int DIA_Addon_Vatras_CavalornSentMe_Condition()
{
	if((SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ring) && (Vatras_Why == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CavalornSentMe_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_00");	//Cavalorn mě za tebou poslal!
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_01");	//A co říkal?
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_02");	//Zmínil se, že máš kolem sebe několik schopných lidí, co ti pomáhají. Prý bych se mohl taky přidat.
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_03");	//(usměv)Tak .... chtěl by ses k nám přidat synu?
};


instance DIA_Addon_Vatras_TellMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_TellMe_Condition;
	information = DIA_Addon_Vatras_TellMe_Info;
	permanent = TRUE;
	description = "Pověz mi něco o Kruhu Vody.";
};


func int DIA_Addon_Vatras_TellMe_Condition()
{
	if((SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_TellMe_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_15_00");	//Pověz mi něco o Kruhu Vody.
	if(!Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_01");	//(netrpělivě) A proč bych ti měl něco říkat?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_02");	//Nemusíš vědět VŠECHNO, dokud nejsi jedním z nás.
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_03");	//Řeknu ti vše, co mohu.
		Info_ClearChoices(DIA_Addon_Vatras_TellMe);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,Dialog_Back,DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Tak co máte nyní v plánu?",DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Kde jsou ostatní mágové Vody?",DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Kdo jsou členové Kruhu Vody?",DIA_Addon_Vatras_TellMe_WerNoch);
	};
};

func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_TellMe);
};

func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Philo_15_00");	//Tak co máte nyní v plánu?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_01");	//Stojíme mezi řádem Innose a chaosem Beliara.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_02");	//Pokud by jedna strana převažovala, mělo by to za následek buď ztrátu svobody nebo příchod smrtnesoucího chaosu.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_03");	//A pokoušíme se zajistit rovnováhu. Je to jediná cesta pro život na tomto světě.
	if(MIS_Vatras_FindTheBanditTrader == 0)
	{
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Mohl bys být trochu víc konkrétní?",DIA_Addon_Vatras_TellMe_Konkret);
	};
};

func void DIA_Addon_Vatras_TellMe_Konkret()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Konkret_15_00");	//(udiveně) Mohl bys být trochu víc konkrétní?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_01");	//Po té, co bariera padla to tu je velmi nebezpečné.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_02");	//Jedna z největších hrozeb jsou zjevně banditi.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_03");	//Je skoro nemožné cestovat po ostrově neozbrojen ...
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_04");	//... ve městě je dokonce někdo, kdo bandity podporuje!
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Add_05_00");	//Zjistili jsme, že bandité nakupují zbraně od jednoho z místních obchodníků.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_05");	//Například takové lidi se snažíme najít, abychom zabránili jakémukoliv zlu ve městě.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_06");	//Pokud by si se o tom chceš dozvědět víc, tak mi řekni.
	MIS_Vatras_FindTheBanditTrader = LOG_Running;
	Vatras_ToMartin = TRUE;
	Log_CreateTopic(TOPIC_Addon_Bandittrader,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Bandittrader,LOG_Running);
	B_LogEntry(TOPIC_Addon_Bandittrader,"V Khorinisu je dodavatel zbraní pro bandity. Vatras mě pověřil vyšetřováním.");
	B_LogEntry(TOPIC_Addon_Bandittrader,"Martin, proviantmistr paladinů, o dodavateli zbraní něco ví. Najdu ho ve skladu paladinů v přístavu.");
	B_LogEntry(TOPIC_Addon_RingOfWater,"Kruh Vody se zabývá problémem s bandity v okolí města Khorinis.");
};

func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_OtherKdW_15_00");	//Kde jsou ostatní mágové Vody?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_01");	//Na severovýchodě zkoumají ruiny prastarého národa.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_02");	//Domníváme se, že v ruinách je vchod na doposud neobjevenou část ostrova.
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_KDW,"Ostatní mágové Vody prozkoumávají ruiny starého národa na severovýchodě Khorinisu.  Je to asi vstup do doposud neobjevených částí Khorinisu.");
	Info_AddChoice(DIA_Addon_Vatras_TellMe,"Řekni mi víc o té neprozkoumané části.",DIA_Addon_Vatras_TellMe_Unexplored);
};

func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_00");	//Řekni mi víc o té neprozkoumané části.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_01");	//Mohu napsat dopis a poslat tě s ním za Saturasem, máš-li zajem o připojení se k výpravě.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_02");	//Samozřejmě, že se na tom můžeš podílet jen jako jeden z nás.
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_03");	//Jistě.
	B_LogEntry(TOPIC_Addon_KDW,"Dříve než se mohu připojit k mágské expedici, musím se podle Vatrase stát členem Kruhu Vody.");
};

func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_WerNoch_15_00");	//Kdo jsou členové Kruhu Vody?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_01");	//To se dozvíš, až budeš jedním z nás.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_02");	//Jsem si jist, že se s někým z nás setkáš.
};


instance DIA_Addon_Vatras_WannaBeRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_WannaBeRanger_Condition;
	information = DIA_Addon_Vatras_WannaBeRanger_Info;
	description = "Chci se přidat ke  Kruhu Vody!";
};


func int DIA_Addon_Vatras_WannaBeRanger_Condition()
{
	if(SC_KnowsRanger == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_WannaBeRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_00");	//Chci se přidat ke  Kruhu Vody!
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ring))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_01");	//Ano? Dobře, již jsi splnil první požadavek.
		AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_02");	//O čem to mluvíš?
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_03");	//Někdo z nás ti věří. Jinak bys o nás vůbec nevěděl.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_04");	//Ale 'já' o tobě nic nevím ...
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//Co bys rád věděl?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//No, mohl bys mi prozradit, odkud přicházíš a proč jsi vkročil do města.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//Nesu důležitou zprávu veliteli paladinů.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Co je to za zprávu?
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Objevili se tu draci...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Brzy se stanou hrozné věci.",DIA_Vatras_INFLUENCE_FIRST_LIE);
};

func void DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Zatímco tu spolu hovoříme, sbírá se proti nám obrovská armáda, kterou vedou draci a která si chce podmanit celou zemi.
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Pokud je to skutečně pravda, pak by to mohlo narušit rovnováhu celé země. Kdo ti to řekl?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//(přemýšlivě) Draci? Myslíš ty tvory, o kterých se vyprávějí legendy? Jak jsi na to přišel?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"No, někde jsem něco zaslechl.",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Pověděl mi to mág Xardas...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = TRUE;
};

func void DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Brzy se stanou hrozné věci.
	if(Vatras_First == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//(rozlíceně) Aha. A kdo ti to řekl?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Hrozné věci, hmmm... a jak to víš?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"No, někde jsem něco zaslechl.",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Pověděl mi to mág Xardas...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = 2;
};

func void DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Pověděl mi to mág Xardas a také mi nakázal, abych varoval paladiny.
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//Vím, že tento muž je moudrý a mocný mistr magických věd. A odkud přicházíš ty?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Nekromant... takže žije... (přemýšlivě) a poslal tě sem? Kdo doopravdy jsi?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Jsem pouhým dobrodruhem z jihu...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Jsem bývalý trestanec...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = TRUE;
};

func void DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//No, někde jsem něco zaslechl.
	if(Vatras_Second == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//(otráveně) Pamatuješ si alespoň, odkud přicházíš?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Aha. A právě proto jsi podnikl tuhle cestu. Kdo doopravdy jsi?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Jsem dobrodruhem z dalekého jihu.",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Jsem bývalý trestanec...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = 2;
};

func void B_Vatras_INFLUENCE_REPEAT()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Dobře, tak si to shrňme:
	if(Vatras_Third == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Jsi bývalý trestanec,
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Jsi dobrodruhem z dalekého jihu,
	};
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//kterého sem poslal nekromant Xardas,
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//který se někde doslechl,
	};
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//že naši zemi napadnou draci.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//že se v brzké době stanou hrozné věci.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//A tak jsi to přišel ohlásit paladinům.
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//To zní sice fantasticky, ale nezdá se mi, že bys mi lhal.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Proto musím uznat, že tvé pohnutky jsou ušlechtilé.
		AI_Output(self,other,"DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11");	//Máš šanci připojit se ke 'Kruhu Vody'.
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//Myslím, že jsi mi neřekl úplně všechno.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//Jestli se bojíš, že bych mohl tvá slova někomu vyzradit, pak neměj strach.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//Přísahal jsem, že všechna tajemství, která mi někdo svěří, si ponechám pro sebe.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//A co zdejší lidé?
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//Ti rozumí pouze polovině toho, co jim KÁŽU, takže neměj obavy.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Začněme tedy znovu od začátku. Co je to za zprávu?
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Objevili se tu draci...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Brzy se stanou hrozné věci.",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
};

func void DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Jsem bývalý vězeň z trestanecké kolonie v Khorinisu.
	Vatras_Third = TRUE;
	B_Vatras_INFLUENCE_REPEAT();
};

func void DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Jsem dobrodruhem z dalekého jihu.
	Vatras_Third = FALSE;
	B_Vatras_INFLUENCE_REPEAT();
};


instance DIA_Addon_Vatras_HowToJoin(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_HowToJoin_Condition;
	information = DIA_Addon_Vatras_HowToJoin_Info;
	description = "Co musím udělat k přijetí?";
};


func int DIA_Addon_Vatras_HowToJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_HowToJoin_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_00");	//Co musím udělat k přijetí?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_01");	//Musíš si uvědomit, že vstupem mezi nás na sebe bereš velkou zodpovědnost.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_02");	//Nepřijmám kde koho, jen protože si o to řekne.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_03");	//Pokud chceš být jedním z nás, synu, chovej se tak, jako kdybys už byl jedním z nás.
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_04");	//Tím myslíš ... ?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_05");	//Každý mladý muž musí splnit hlavní úkol, než se může přidat.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_06");	//Pouze pak mohu uvažovat o tvém připojení k nám v našem úkolu udržování rovnováhy sil na tomto ostrově.
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"Dobře, jak tě můžu přesvědčit?",DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"Osvobodil jsem mnoho lidí. Bariéra byla zničena.",DIA_Addon_Vatras_HowToJoin_FreedMen);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"Porazil jsem Spáče. To by se dalo nazvat hlavní zkouška.",DIA_Addon_Vatras_HowToJoin_Sleeper);
};

func void DIA_Addon_Vatras_HowToJoin_Sleeper()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_Sleeper_15_00");	//Porazil jsem Spáče. To by se dalo nazvat hlavní zkouška.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_01");	//Slyším poslední dobou mnoho povídaček.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_02");	//Včetně té o monstru zvaném Spáč a jeho odstraněním z tohoto světa.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_03");	//Neslyšel jsem o tom, že jsi za to zodpovědný jen ty - ale přesto tvé oči říkají, že věříš v to, co říkáš.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_04");	//Poněkud mě to popuzuje, ale nejsem si jist, jestli mě mé smysly nezrazují.
};

func void DIA_Addon_Vatras_HowToJoin_FreedMen()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00");	//Osvobodil jsem mnoho lidí. Bariéra byla zničena.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01");	//Pokud za tím OPRAVDU stojíš ty...
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02");	//Lidém, kterým jsi dal svobodu nejsou jen mágové Vody či nevinní občané.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03");	//Zločinci z celé země jsou teď rozlezlí po celém ostrově a ohrožují občany tohoto města.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04");	//Také už kontrolují některé části ostrova blízko města. Je téměř nemožné opustit Khorinis beze úrazu.
};

func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00");	//Dobře, jak tě můžu přesvědčit?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01");	//Něco podivného se tyto dny děje v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02");	//Počet zmizelých lidí se zvyšuje každým dnem.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03");	//Pokud zjistíš, co se s nimi stalo, přijmeme tě rádi do Kruhu Vody.
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,LogText_Addon_KDWRight);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Vatras mě nepříjme dokud ta záležitost s Kruhem Vody a mizejícími lidmi nebude vyřešena.");
	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
	};
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_Running;
	SC_HearedAboutMissingPeople = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04");	//Ale ...
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05");	//Ano?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06");	//... měl by sis nejdříve promluvit s paladiny a říci jim o zprávě, kterou jim neseš.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07");	//Myslím, že to je neobyčejně důležité!
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08");	//Promluv si s Lordem Hagenem.
	B_LogEntry(TOPIC_Addon_RingOfWater,"Vatras chce, abych paladinům nejprve předal zprávu o dracích v Hornickém údolí.");
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
};


instance DIA_Addon_Vatras_GuildBypass(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_GuildBypass_Condition;
	information = DIA_Addon_Vatras_GuildBypass_Info;
	description = "Ale oni mě nepustí!";
};


func int DIA_Addon_Vatras_GuildBypass_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildBypass_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_15_00");	//Ale oni mě nepustí!
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_01");	//Pustí. Pokud jsi členem vlivné gildy.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_02");	//Kruh má pár užitečných kontaktů.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_03");	//Pokusíme se zajistit, aby jsi mohl doručit zprávu Lordu Hagenovi, co nejrychleji to bude možné.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_04");	//Měl by ses zeptat přítele Larese. Mohl by ti pomoci.
	B_LogEntry(TOPIC_Addon_RingOfWater,"Ke vstupu k Lordu Hagenovi musím být členem nějaké mocné khorinisské gildy.");
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"Udělám to.",DIA_Addon_Vatras_GuildBypass_BACK);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"Ke které gildě bych se měl přidat?",DIA_Addon_Vatras_GuildBypass_WhichGuild);
};

func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_BACK_15_00");	//Udělám to.
	Vatras_GehZuLares = TRUE;
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
};

func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00");	//Ke které gildě bych se měl přidat?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01");	//Jsou zde pouze tři gildy, které jsou dostatečně vlivné a silné.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02");	//Domobrana, mágové Ohně nebo žoldáci na Onarově farmě.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03");	//Je to tvá volba.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04");	//Myslím, že Lares ti může pomoci s tímto obtížným rozhodováním. Navrhuju, aby sis s ním promluvil.
	B_LogEntry(TOPIC_Addon_RingOfWater,"Jsou zde tři mocné gildy ke kterým se můžeš přidat: mágové Ohně, domobrana nebo žoldáci na velkostatkářově dvoře.");
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"Udělám to.",DIA_Addon_Vatras_GuildBypass_BACK);
};


instance DIA_Addon_Vatras_NowRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_NowRanger_Condition;
	information = DIA_Addon_Vatras_NowRanger_Info;
	permanent = TRUE;
	description = "Jsem připraven přidat se ke Kruhu!";
};


func int DIA_Addon_Vatras_NowRanger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && (SC_IsRanger == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_NowRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_00");	//Jsem připraven přidat se ke Kruhu!
	AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_01");	//Donesl jsi svou zprávu Lordu Hagenovi?
	if(Kapitel >= 2)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Ano.
		if(MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//Ale, řekl mi, že mám jít do hornického údolí a přinést důkaz sých tvrzní!
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_04");	//Musíš se rozhodnout, co dál.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_05");	//Doručení zprávy bylo důležité pro mě. Teď je na něm, aby si pospíšil, nebo počkal na tvůj důkaz.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_06");	//Co se týče tebe ...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Dobrá.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_08");	//Dokázal jsi, že můžeš být pro nás důležitý. Můžeš být jedním z nás. Chodit po světě a šířit Adanosovu vůli.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_09");	//Tímto ti uděluji prsten Kruhu Vody. Pomůže ti najít spojence a starat se s nimi o rovnováhu světa.
		CreateInvItems(self,ItRi_Ranger_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_10");	//Jsem velmi potěšen tím, že jsi prvním mágem Ohně, který se k nám přidal.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_11");	//Nechť tě Adanos ochraňuje. Nyní běž a setkej se svými bratry.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_12");	//Čekají tě v hostinci U mrtvé harpyje na přijmací rituál.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_13");	//Předpokladám, že ten hostince znáš. Procháziš kolem něj po cestě na Onarův statek.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_14");	//Nezapomeň si nasadit prsten, tak mohou bratři poznat, že jsi jeden z nich.
		B_LogEntry(TOPIC_Addon_RingOfWater,"Teď patřím ke Kruhu Vody a mám se setkat s naši partou v hospodě u Mrtvé Harpyje.");
		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_Running;
		B_GivePlayerXP(XP_Addon_SC_IsRanger);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//Ne. Ještě ne.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_16");	//Pak si pospěš. Tvá zpráva se zdá být velice důležitou!
	};
};


instance DIA_Addon_Vatras_CloseMeeting(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_CloseMeeting_Condition;
	information = DIA_Addon_Vatras_CloseMeeting_Info;
	description = "Bratři Kruhu mě poslali za tebou.";
};


func int DIA_Addon_Vatras_CloseMeeting_Condition()
{
	if(Lares_TakeFirstMissionFromVatras == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CloseMeeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_CloseMeeting_15_00");	//Bratři Kruhu mě poslali za tebou.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_01");	//Skvěle! Už jsem na tebe čekal!
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//Pošlu tě skrze portál s ostatními mágy Vody.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//Půjdeš po stopě rudobarona Ravena a vypátráš proč unáší občany Khorinisu.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//A my se pokusíme postarat o hrozbu, kterou skýtají bandité.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//Přines tuto zprávu Saturasovi. Od této chvíle budeš získávat úkoly od něj.
	if(MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_08");	//Lares tě tam zavede v případě, že ještě nepřinesl zpět ornament.
	};
	CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
	B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//Nechť Adanos vede tvou cestu.
	B_LogEntry(TOPIC_Addon_KDW,"Vatras mě poslal s dopisem za Saturasem. Měl bych teď jít s ostatními mágy Vody skrze portál a chytit bývalého rudobarona Ravena.");
	Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
	B_LogEntry(TOPIC_Addon_Sklaven,"Mám zjistit proč Raven unáší občany Khorinisu.");
	RangerMeetingRunning = LOG_SUCCESS;
	B_SchlussMitRangerMeeting();
	B_GivePlayerXP(XP_Ambient);
};



var int missingpeopleinfo[20];

instance DIA_Addon_Vatras_MissingPeople(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_MissingPeople_Condition;
	information = DIA_Addon_Vatras_MissingPeople_Info;
	permanent = TRUE;
	description = "O zmizelých lidech ...";
};


func int DIA_Addon_Vatras_MissingPeople_Condition()
{
	if(MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running)
	{
		return TRUE;
	};
};


var int DIA_Addon_Vatras_MissingPeople_Wo_NoPerm;

func void DIA_Addon_Vatras_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_15_00");	//O zmizelých lidech ...
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_05_01");	//Ano?
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice(DIA_Addon_Vatras_MissingPeople,Dialog_Back,DIA_Addon_Vatras_MissingPeople_BACK);
	if(SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Vím kde jsou.",DIA_Addon_Vatras_MissingPeople_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Povím ti, co jsem doposud vypátral ...",DIA_Addon_Vatras_MissingPeople_Report);
	};
	if(DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE)
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Kde bych měl začít hledat stopy?",DIA_Addon_Vatras_MissingPeople_Wo);
	};
};

func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
};

func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HintMissingPeople_Wo_15_00");	//Kde bych měl začít hledat stopy?
	AI_Output(self,other,"DIA_Addon_Vatras_HintMissingPeople_Wo_05_01");	//Většina zmizela v přístavu. To zní jako dobré místo pro začátek.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Nejvíce lidí zmizelo v khorinisském přístavu. Měl bych začít hledat tam.");
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};

func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	var int XP_Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_00");	//Povím ti, co jsem doposud našel ...
	if(((MIS_Akil_BringMissPeopleBack != 0) || (MIS_Bengar_BringMissPeopleBack != 0)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_01");	//Farmáři také postrádají několik lidí.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((Elvrich_GoesBack2Thorben == TRUE) || (Elvrich_SCKnowsPirats == TRUE) || (SC_KnowsDexterAsKidnapper == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_02");	//Taky jsem se doslechl, že jsou za to odpovědní bandité.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_03");	//Elvrich, učeň mistra Thorbena, mi řekl, že bandité odvážejí zajaté lidi na moře.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_04");	//Vypadá to, že s tím mají něco společného také piráti. Ale nejsem si jejich rolí v tom všem příliš jistý.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((Elvrich_GoesBack2Thorben == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_05");	//Osvobodil jsem Elvricha ze zajetí banditů.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KnowsLuciaCaughtByBandits == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_06");	//Dívka jménem Lucia byla taky unesena bandity.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if((Npc_HasItems(other,ItWr_LuciasLoveLetter_Addon) || (MIS_LuciasLetter == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_07");	//Unesená Lucia se vzápětí s bandity spolčila.
		if(MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_08");	//Vypadá to, že to udělala z vlastního přesvědčení.
		};
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KnowsDexterAsKidnapper == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_09");	//Dexter je vůdcem banditů. Je odpovědný za ty únosy.
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_10");	//Pamatuju si Dextera z kolonie. Pracoval tenkrát pro rudobarona Gomeze.
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_11");	//A on si určitě bude pamatovat tebe. Měl by sis dát pozor.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	if(Vatras_MissingPeopleReports != 0)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_12");	//Myslím, že jsi na dobré cestě. Drž se ji.
		XP_Vatras_MissingPeopleReports = XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports;
		B_GivePlayerXP(XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_13");	//Co jsi zjistil?
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_14");	//Bohužel, zatím nic směrodatného.
	};
};

func void DIA_Addon_Vatras_MissingPeople_Success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_00");	//Vím, kde jsou zmizelí lidé.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_01");	//Co jsi zjistil?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_02");	//Byli uneseni a vzati na vzdálené místo na ostrově chlápkem jménem Raven.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_03");	//A proč jsi si tím tak jistý?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_04");	//Četl jsem jeho rozkazy. Banditi všude okolo pracují pro něj.
	if(Npc_HasItems(other,ItWr_RavensKidnapperMission_Addon))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_05");	//Tady.
		B_UseFakeScroll();
	};
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_06");	//Dobře. Dobrá práce. Už jsem se bál, že nikdy nezjistíme pravdu.
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Vatras_WhereAreMissingPeople);
};


instance DIA_Addon_Vatras_Free(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Free_Condition;
	information = DIA_Addon_Vatras_Free_Info;
	permanent = FALSE;
	description = "Ztracení lidé se vrátili.";
};


func int DIA_Addon_Vatras_Free_Condition()
{
	if(MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Free_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Free_15_00");	//Ztracení lidé se vrátili.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_01");	//Ano, dokázal jsi to. Nakonec to dobře dopadlo.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_02");	//Avšak, tvá cesta ještě nekončí. Nechť ti Adanos požehná.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_03");	//(modlí se) Adanosi, požehnej tomuto muži. Osviť jeho pouť, dej mu sílu obstát všem nebezpečím.
	B_RaiseAttribute(other,ATR_MANA_MAX,3);
	other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("Levelup");
};


instance DIA_Addon_Vatras_Waffen(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Waffen_Condition;
	information = DIA_Addon_Vatras_Waffen_Info;
	permanent = TRUE;
	description = "O dodavateli zbraní.....";
};


func int DIA_Addon_Vatras_Waffen_Condition()
{
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Waffen_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_15_00");	//O dodavateli zbraní.....
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
	Info_AddChoice(DIA_Addon_Vatras_Waffen,Dialog_Back,DIA_Addon_Vatras_Waffen_BACK);
	if((Fernando_ImKnast == TRUE) || (Fernando_HatsZugegeben == TRUE))
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen,"Znám toho dodavatele zbraní pro bandity!",DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen,"Co víš o tom prodejci zbraní?",DIA_Addon_Vatras_Waffen_ToMartin);
	};
};

func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
};

func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_ToMartin_15_00");	//Co víš o tom prodejci zbraní?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_01");	//Promluv si s Martinem, proviantmistrem paladinů. Může mít nějaké informace.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_02");	//Obdržel úkol odhalit toho dodavatele.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_03");	//Martina najdeš v přístavu. Pokud poběžíš podel těch beden, zásob a paladinů, měl bys ho najít.
	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_00");	//Znám obchodníka, který dodává zbraně banditům!
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_01");	//Jmenuje se Fernando.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_02");	//Velmi dobře. Postaral se Martin o to, aby už Fernando nikdy nemohl prodávat zbraně?
	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_03");	//Jo. Martin se postaral, aby moc brzo neopustil kobky žaláře.
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_04");	//Skvělá práce, synu.
		if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger) && (SC_IsRanger == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_05");	//(směle) Znamená to, že jsem nyní připraven vstoupit do Kruhu Vody?
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_06");	//(usměv) To nebylo přesné znění naši dohody - a ty to moc dobře víš.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_07");	//Nechť Adanos osvítí tvou cestu.
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Vatras_FindTheBanditTrader);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_CaughtFernando_15_09");	//Ještě ne.
		AI_Output(self,other,"DIA_Addon_Vatras_CaughtFernando_05_10");	//Tak pospěš a zprav ho o tom! Toto musí být okamžitě zastaveno.
	};
};


instance DIA_Addon_Vatras_WISP(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_WISP_Condition;
	information = DIA_Addon_Vatras_WISP_Info;
	description = "Je něco, co by mi mohlo pomoct s hledáním?";
};


func int DIA_Addon_Vatras_WISP_Condition()
{
	if(MIS_Vatras_FindTheBanditTrader != 0)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_WISP_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_WISP_15_00");	//Je něco, co by mi mohlo pomoct s hledáním?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_01");	//Dost na tom trváš mladý muži. Nicméně, může tu být něco, co možná tvůj úkol trochu zlehčí.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_02");	//Dám ti tento amulet z rudy. Budeš ho určitě potřebovat.
	CreateInvItems(self,ItAm_Addon_WispDetector,1);
	B_GiveInvItems(self,other,ItAm_Addon_WispDetector,1);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_03");	//Je to amulet bludičky.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_04");	//Takových je velmi málo. Bludička v tomto amuletu má zvláštní schopnosti.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_05");	//Pomáhá to zviditelnit věci, které pouhým okem nespatříme.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_06");	//Funguje to, když si to nasadíš.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_07");	//Jestliže bludička zmizí, jednoduše si amulet nasaď znovu.
	B_LogEntry(TOPIC_Addon_Bandittrader,"Vatras mi dal 'Amulet Hledající bludičky'. Měl by mi pomoci v hledání dodavatele zbraní.");
	Log_CreateTopic(TOPIC_WispDetector,LOG_NOTE);
	B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned);
	B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_NF);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_08");	//Bludička umí najít zbraně.
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_09");	//Tahle věc se hodí na to patrání po dodavateli zbraní pro bandity.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_10");	//Zacházej s tím dobře a můžeš se na to vždy spolehnout.
	Info_ClearChoices(DIA_Addon_Vatras_WISP);
	Info_AddChoice(DIA_Addon_Vatras_WISP,"Díky! Budu si to pamatovat.",DIA_Addon_Vatras_WISP_Thanks);
	Info_AddChoice(DIA_Addon_Vatras_WISP,"Je to vše co ta bludička umí?",DIA_Addon_Vatras_WISP_MoreWISP);
	Info_AddChoice(DIA_Addon_Vatras_WISP,"V tom amuletu je bludička?",DIA_Addon_Vatras_WISP_Amulett);
	SC_GotWisp = TRUE;
};

func void DIA_Addon_Vatras_WISP_Thanks()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Thanks_15_00");	//Díky! Budu si to pamatovat.
	Info_ClearChoices(DIA_Addon_Vatras_WISP);
};

func void DIA_Addon_Vatras_WISP_MoreWISP()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_MoreWISP_15_00");	//Je to vše, co ta bludička umí?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_01");	//Víc než hledaní zbraní? Jen pokud ji naučíš novým dovednostem.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_02");	//Pokud vím, má o těchto věcech velmi dobré znalosti Riordian. Momentálně je ovšem se Saturasem.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_03");	//To je vše, co můžu říct.
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"Bludička umí víc než jen hledat zbraně. Riordian, mág Vody, může učit mou bludičku hledat další věci.");
	};
};

func void DIA_Addon_Vatras_WISP_Amulett()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WISPDETECTOR_was_15_00");	//V tom amuletu je bludička?
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_01");	//Bludičky jsou zajímavá stvoření. Skládají se z čisté magické energie.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_02");	//Jsou vázány k magické rudě tohoto světa. Je to přirozený zdroj jejich síly.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_03");	//Nepřekvapuje mě, že jsi o nich před tím neslyšel. Ukazují se pouze těm, co u sebe mají odpovídající množství rudy.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_04");	//Divoké bludičky byly násilně odstraněny z jejich přirozeného zdroje a tak útočí na každé stvoření, které se přiblíží.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_05");	//Těmto nebohým stvořením již není pomoci.  Měl by ses pokusit se jim vyhýbat.
};


instance DIA_Addon_Vatras_Stoneplate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_Stoneplate_Condition;
	information = DIA_Addon_Vatras_Stoneplate_Info;
	description = "Našel jsem tuhle kamennou desku...";
};


func int DIA_Addon_Vatras_Stoneplate_Condition()
{
	if((C_ScHasMagicStonePlate() == TRUE) && (Npc_HasItems(other,ItWr_StonePlateCommon_Addon) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Stoneplate_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Stoneplate_15_00");	//Našel jsem tuhle kamennou desku. Můžeš mi o ni něco říct?
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_01");	//Je to artefakt starobylé kultury, po které pátráme právě teď.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_02");	//Jsou jich různé druhy. Některé obsahují informace o historii národa.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_03");	//A to jsou ty, jenž mě zajímají. Přines všechny, které najdeš ke mně.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_04");	//Budeš odměněn.
	Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	B_LogEntry(TOPIC_Addon_Stoneplates,LogText_Addon_VatrasTrade);
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,LogText_Addon_VatrasTrade);
};


instance DIA_Addon_Vatras_SellStonplate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_SellStonplate_Condition;
	information = DIA_Addon_Vatras_SellStonplate_Info;
	permanent = TRUE;
	description = "Mám pro tebe další kamenné desky ...";
};


func int DIA_Addon_Vatras_SellStonplate_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_Stoneplate) && (Npc_HasItems(other,ItWr_StonePlateCommon_Addon) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_SellStonplate_Info()
{
	var int anzahl;
	anzahl = Npc_HasItems(other,ItWr_StonePlateCommon_Addon);
	if(anzahl == 1)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_SellStonplate_15_00");	//Mám pro tebe další kamenné desky ...
	}
	else
	{
	};
	B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,anzahl);
	AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_01");	//Výborně!
	if(anzahl >= 10)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_02");	//Zvýším tvou magickou sílu!
		B_RaiseAttribute(other,ATR_MANA_MAX,anzahl);
		Npc_ChangeAttribute(other,ATR_MANA,anzahl);
	}
	else if(anzahl >= 5)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_04");	//Tady, vem si za odměnu nějaké svitky ...
		B_GiveInvItems(self,other,ItSc_InstantFireball,anzahl);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_03");	//Tady, vem si za odměnu nějaké lektvary ...
		B_GiveInvItems(self,other,ItPo_Health_03,anzahl + 1);
	};
	B_GivePlayerXP(XP_Addon_VatrasStonplate * anzahl);
};


var int Vatras_SentToDaron;

instance DIA_Addon_Vatras_GuildHelp(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_GuildHelp_Condition;
	information = DIA_Addon_Vatras_GuildHelp_Info;
	description = "Lares říkal, že mi můžeš pomoci dostat se do kláštera mágů Ohně.";
};


func int DIA_Addon_Vatras_GuildHelp_Condition()
{
	if(RangerHelp_gildeKDF == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_00");	//Lares říkal, že mi můžeš pomoct dostat se do kláštera mágů Ohně.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_01");	//To je tá volba? Cesta Ohně?
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_02");	//Jo, hodlám se stát mágem Ohně.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_03");	//Pokud si dobře pamatuji, nepřestali příjmát novice. Proč chceš tedy mou pomoc?
	if(SC_KnowsKlosterTribut == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_04");	//Novic před klášterem po mně chce daň. Ovci a zlato.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_05");	//Lares se zmínil o dani na zaplacení ke vstupu do kláštera.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_06");	//No, nemohu ti přímo pomoci, protože jsem mágem Vody, jak víš. Ale znám velmi dobře mága Ohně Darona.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_07");	//Je obvykle blízko tržiště a vybírá dary.
	Vatras_SentToDaron = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_08");	//Ačkoliv to není jediná věc, o kterou se tady stará.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_09");	//Jednou mi říkal o sošce, kterou mu ukradli.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_10");	//Je to pro něj velmi důležité. Jsem si jist, že ti pomůže, pokud získáš jeho sošku zpět.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_11");	//Samozřejmě, tvé přijetí k mágům Ohně neznamená, že se nemůžeš připojit ke Kruhu.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_12");	//Pokud si to prokazatelně zasloužíš.
	MIS_Addon_Vatras_Go2Daron = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF,"Mág Ohně Daron na tržišti potřebuje pomoci s malou vzácnou soškou. Může mi pomoci dostat se rychle do kláštera.");
};


instance DIA_Vatras_MORE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 998;
	condition = DIA_Vatras_MORE_Condition;
	information = DIA_Vatras_MORE_Info;
	permanent = TRUE;
	description = "(Více)";
};


func int DIA_Vatras_MORE_Condition()
{
	if(Vatras_MORE == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_MORE_Info()
{
	Vatras_MORE = TRUE;
};


instance DIA_Vatras_INFLUENCE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 92;
	condition = DIA_Vatras_INFLUENCE_Condition;
	information = DIA_Vatras_INFLUENCE_Info;
	permanent = FALSE;
	description = "Dej mi prosím své požehnání.";
};


func int DIA_Vatras_INFLUENCE_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (Vatras_MORE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INFLUENCE_Info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Dej mi prosím své požehnání.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//A proč bych ti měl požehnat, cizinče?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Chci se stát učedníkem u jednoho z mistrů v dolní části města.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//Jdi s Adanosovým požehnáním, synu!
	Snd_Play("LevelUp");
	B_GivePlayerXP(XP_VatrasTruth);
	Vatras_Segen = TRUE;
	B_LogEntry(TOPIC_Thorben,"Mág vody Vatras mi požehnal.");
};


instance DIA_Vatras_WoKdF(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 93;
	condition = DIA_Vatras_WoKdF_Condition;
	information = DIA_Vatras_WoKdF_Info;
	permanent = FALSE;
	description = "Kde bych našel Innosova kněze?";
};


func int DIA_Vatras_WoKdF_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Vatras_Segen == TRUE) && (Vatras_SentToDaron == FALSE) && (Vatras_MORE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_WoKdF_Info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Kde bych našel Innosova kněze?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Nejlépe bude, když se rozhlédneš po tržišti. Tam na někoho z kláštera jistě narazíš.
};


instance DIA_Vatras_Spende(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 94;
	condition = DIA_Vatras_Spende_Condition;
	information = DIA_Vatras_Spende_Info;
	permanent = TRUE;
	description = "Rád bych Adanovi poskytl dar!";
};


func int DIA_Vatras_Spende_Condition()
{
	if(Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_Spende_Info()
{
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//Rád bych Adanosovi poskytl dar!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Darem Adanosovu chrámu smyješ část hříchů, které jsi možná spáchal, synu.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Kolik můžeš věnovat?
	Info_ClearChoices(DIA_Vatras_Spende);
	Info_AddChoice(DIA_Vatras_Spende,"Zrovna teď nemám peněz nazbyt...",DIA_Vatras_Spende_BACK);
	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Vatras_Spende,"Mám u sebe 50 zlaťáků...",DIA_Vatras_Spende_50);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Vatras_Spende,"Mám u sebe 100 zlaťáků...",DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Zrovna teď nemám peněz nazbyt.
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//To nevadí, své dobré úmysly můžeš vyjádřit později, synu.
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//Mám u sebe 50 zlaťáků.
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//Děkuji ti ve jménu Adanose, synu. Tvé zlato bude rozděleno mezi potřebné.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//Mám u sebe 100 zlaťáků.
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//Za tento šlechetný čin ti ve jménu Adanose žehnám!
	Snd_Play("LevelUp");
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Nechť ti Adanos na tvé cestě požehná!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	Vatras_Segen = TRUE;
	Info_ClearChoices(DIA_Vatras_Spende);
	if(MIS_Thorben_GetBlessings == LOG_Running)
	{
		B_LogEntry(TOPIC_Thorben,"Mág vody Vatras mi požehnal.");
	};
};


instance DIA_Vatras_CanTeach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 95;
	condition = DIA_Vatras_CanTeach_Condition;
	information = DIA_Vatras_CanTeach_Info;
	permanent = FALSE;
	description = "Můžeš mě naučit něco o magii?";
};


func int DIA_Vatras_CanTeach_Condition()
{
	if(Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//Můžeš mě naučit něco o magii?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Pouze vyvoleným Innose nebo Adanose je dovoleno používat runovou magii.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Ale obyčejní smrtelníci mohou používat magii za pomoci kouzelných svitků.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Mohu ti ukázat, jak lze získat a rozšiřovat magické schopnosti.
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Mág vody Vatras mi pomůže zvýšit magickou moc.");
};


instance DIA_Vatras_Teach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 100;
	condition = DIA_Vatras_Teach_Condition;
	information = DIA_Vatras_Teach_Info;
	permanent = TRUE;
	description = "Chtěl bych posílit svoji magickou moc.";
};


func int DIA_Vatras_Teach_Condition()
{
	if((Vatras_TeachMANA == TRUE) && (Vatras_MORE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_Teach_Info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Chtěl bych posílit svoji magickou moc.
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Tvá magická moc přesáhla mé schopnosti.
	};
	Info_ClearChoices(DIA_Vatras_Teach);
};

func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};


instance DIA_Vatras_GODS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 98;
	condition = DIA_Vatras_GODS_Condition;
	information = DIA_Vatras_GODS_Info;
	permanent = TRUE;
	description = "Řekni mi něco o bozích.";
};


func int DIA_Vatras_GODS_Condition()
{
	if(Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_GODS_Info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//Řekni mi něco o bozích.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//Co přesně bys chtěl vědět?
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Innosovi.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Adanovi.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Beliarovi.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices(DIA_Vatras_GODS);
};

func void DIA_Vatras_GODS_INNOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//Řekni mi něco o Innosovi.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Velmi dobře. (káže) Innos je prvním a nejvyšším bohem. Stvořil slunce a svět.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//Ovládá světlo a oheň, své dary lidstvu. Je ztělesněním řádu a spravedlnosti.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Jeho kněží jsou ohniví mágové, paladinové jsou jeho válečníky.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Innosovi.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Adanovi.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Beliarovi.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_ADANOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//Řekni mi něco o Adanosovi.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Adanos je bůh středu. Vymezuje právo a je strážcem rovnováhy mezi Innosem a Beliarem.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Ovládá sílu přeměn, jeho darem je voda všech oceánů, jezer a řek.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Jeho kněží jsou vodní mágové, stejně jako já jsem služebníkem a knězem Adanosovým.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Innosovi.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Adanovi.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Beliarovi.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BELIAR()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//Řekni mi něco o Beliarovi.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Beliar je temný bůh smrti, zkázy a všech nepřirozených věcí.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Vede věčnou válku s Innosem, ale Adanos bdí nad tím, aby byly jejich síly stále vyrovnané.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Pouze několik málo lidí následuje volání Beliara - nicméně on těm, kdo tak činí, zajistí velkou moc.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Innosovi.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Adanovi.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Beliarovi.",DIA_Vatras_GODS_BELIAR);
};


instance DIA_Vatras_HEAL(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 99;
	condition = DIA_Vatras_HEAL_Condition;
	information = DIA_Vatras_HEAL_Info;
	permanent = TRUE;
	description = "Můžeš mě vyléčit?";
};


func int DIA_Vatras_HEAL_Condition()
{
	if(Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_HEAL_Info()
{
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//Můžeš mě vyléčit?
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//(zbožně) Adanosi požehnej tomuto tělu. Zbav ho jeho zranění a posil ho novým životem.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//Právě teď nepotřebuješ žádné magické léčení.
	};
};


instance DIA_Vatras_MISSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_MISSION_Condition;
	information = DIA_Vatras_MISSION_Info;
	important = TRUE;
};


func int DIA_Vatras_MISSION_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MISSION_Info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//Mám zprávu pro mistra Isgarotha. Střeží svatyni před klášterem.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Když mu ji doručíš, získáš odměnu podle vlastního výběru.
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"Najdi si jinýho poslíčka, starochu!",DIA_Vatras_MISSION_NO);
	Info_AddChoice(DIA_Vatras_MISSION,"Udělám to.",DIA_Vatras_MISSION_YES);
};

func void B_SayVatrasGo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Dobře. Tak teď pokračuj ve své cestě k mistru Isgarothovi.
};

func void DIA_Vatras_MISSION_YES()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Udělám to.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//Dobrá, tak si vezmi tu zprávu a vyber si jeden z těchto kouzelných svitků.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//Až doručíš tu zprávu, čeká tě náležitá odměna.
	B_GiveInvItems(self,hero,ItWr_VatrasMessage,1);
	MIS_Vatras_Message = LOG_Running;
	Log_CreateTopic(TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Botschaft,LOG_Running);
	B_LogEntry(TOPIC_Botschaft,"Vatras mi předal zprávu pro mistra Isgarota, kterého najdu ve svatyni naproti klášteru.");
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"Vezmu si kouzlo Světla.",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice(DIA_Vatras_MISSION,"Vybral jsem si léčivý svitek.",DIA_Vatras_MISSION_HEAL);
	Info_AddChoice(DIA_Vatras_MISSION,"Dej mi Ledový šíp.",DIA_Vatras_MISSION_ICE);
};

func void DIA_Vatras_MISSION_NO()
{
	AI_Output(other,self,"DIA_ADDON_Vatras_MISSION_NO_15_00");	//Teď ne!
	AI_Output(self,other,"DIA_ADDON_Vatras_MISSION_NO_05_01");	//Žádný problém. Pošlu někoho jiného.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_HEAL()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Vybral jsem si léčivý svitek.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_LightHeal,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_ICE()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Dej mi Ledový šíp.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_Icebolt,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_LIGHT()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Vezmu si kouzlo Světla.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_Light,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};


instance DIA_Vatras_MESSAGE_SUCCESS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information = DIA_Vatras_MESSAGE_SUCCESS_Info;
	description = "Doručil jsem tvou zprávu.";
};


func int DIA_Vatras_MESSAGE_SUCCESS_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && (Vatras_Return == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MESSAGE_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Doručil jsem tvou zprávu.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//Přijmi mé díky. A teď si vezmi svou odměnu.
	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"1 královský šťovík",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"Prsten obratnosti.",DIA_Vatras_MESSAGE_SUCCESS_Ring);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"1 hrudka rudy",DIA_Vatras_MESSAGE_SUCCESS_Ore);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	B_GiveInvItems(self,hero,ItPl_Perm_Herb,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	B_GiveInvItems(self,hero,ItRi_Dex_01,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	B_GiveInvItems(self,hero,ItMi_Nugget,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};


const int kurz = 0;
const int lang = 1;
var int Vatras_einmalLangWeg;

func void B_Vatras_GeheWeg(var int dauer)
{
	if(Vatras_einmalLangWeg == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,ZS_Preach_Vatras))
	{
		B_StopLookAt(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//Slyšte, lidé! Je mě potřeba někde jinde.
		if(dauer == kurz)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//Nebude to mít dlouhého trvání. Až se vrátím, dopovím vám zbytek příběhu.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Nevím, jestli se ještě vrátím. Pokud chcete znát konec, přečtěte si ten příběh v Písmu.
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Adanos s vámi!
		B_TurnToNpc(self,other);
	};
	Vatras_SchickeLeuteWeg = TRUE;
};


instance DIA_Addon_Vatras_AbloesePre(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_AbloesePre_Condition;
	information = DIA_Addon_Vatras_AbloesePre_Info;
	description = "Mám problém s Innosovým Okem.";
};


func int DIA_Addon_Vatras_AbloesePre_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)) && (Kapitel == 3) && (VatrasCanLeaveTown_Kap3 == FALSE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_AbloesePre_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_00");	//Mám problém s Innosovým okem. Potřebuju tvoji podporu.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_01");	//Budu kvůli tomu muset opustit město?
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_02");	//To nevím. Možná.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_03");	//Čekám na svou náhradu už pár dní. Ostatní mágové Vody by se už měli vrátit.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_04");	//Ujisti se, že pošlou náhradníka a já ti pomohu.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	Log_CreateTopic(TOPIC_Addon_VatrasAbloesung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung,LOG_Running);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung,"Vatras mi nemůže pomoci s problémem 'Innosova Oka' dokud ve městě nebude jiný mág Vody, který ho zastoupí.");
};


instance DIA_Addon_Vatras_AddonSolved(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_AddonSolved_Condition;
	information = DIA_Addon_Vatras_AddonSolved_Info;
	description = "Náhrada dorazila.";
};


func int DIA_Addon_Vatras_AddonSolved_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_AddonSolved_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_00");	//Náhrada dorazila.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_01");	//Je vše v pořádku za severo-východními horami?
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_02");	//Ano. Raven je mrtvý a už nepředstavuje žádnou hrozbu.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_03");	//To je vskutku dobrá zpráva. Doufejme, že podobné věci se už nikdy nestanou.
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_04");	//TEĎ ti mohu pomoci s tvým malým problémem.
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_05");	//Pokud si dobře pamatuji, týkalo se to Innosova Oka že?
	};
	VatrasCanLeaveTown_Kap3 = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Vatras_INNOSEYEKAPUTT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information = DIA_Vatras_INNOSEYEKAPUTT_Info;
	description = "Innosovo oko je rozbité.";
};


func int DIA_Vatras_INNOSEYEKAPUTT_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)) && (Kapitel == 3) && (VatrasCanLeaveTown_Kap3 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info()
{
	if(MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Posílá mě Pyrokar.
	}
	else if(MIS_Xardas_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Posílá mě Xardas.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Innosovo oko je rozbité.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//Já vím. Slyšel jsem o tom od nějakých velmi rozrušených noviců.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//Pátrači zneužili Kruh slunce mágů Ohně ke zničení Oka.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//Řekl bych, že jsou ovládáni nepřítelem.
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Po tomhle městě se novinky šíří rychle.",DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten);
	if((hero.guild == GIL_KDF) && (MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running))
	{
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Proč si Pyrokar ze všech lidí vybral právě tebe?",DIA_Vatras_INNOSEYEKAPUTT_warumdu);
	};
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Co se stane s Okem teď?",DIA_Vatras_INNOSEYEKAPUTT_Auge);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Co se stane s Okem teď?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Musíme ho znovu spravit. Ale bojím se, že to nebude jen tak.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Objímka se rozbila na dva kusy. Zručný kovář by si s tím měl umět poradit.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Ale tohle není ten problém. Co mi dělá starosti, je samotný drahokam.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Je matný a bez moci. Zdá se, že nepřítel přesně věděl, jak ho oslabit.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Kde bych našel kováře, který by to dokázal opravit?",DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Jak může drahokam získat zpět svoji sílu?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Jak může drahokam získat zpět svoji sílu?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Vidím jen jedinou cestu. Spojení tří vládnoucích bohů by mohlo zajistit potřebný efekt.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//Dobře připravený rituál zvratu provedený na místě zničení vrátí drahokamu jeho sílu.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Nicméně, problém je, že na to místo musíš dostat pozemské zástupce každého ze tří bohů.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Navíc je potřeba mnoho trávy z bažin. Odhaduju, že to budou nejméně tři stébla.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Kdo by měli být ti tři pozemští zástupci bohů?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Kde najdu tu trávu z bažin?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Kde najdu tu trávu z bažin?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Slyšel jsem o staré mastičkářce v lesích, co si říká Sagitta. Mohla by ti ty rostliny prodat.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Ale taky bys mohl zkusit štěstí dole v přístavu.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Kdo by měli být ti tři pozemští zástupci bohů?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Adanose bych měl zastupovat já sám.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Pyrokar, nejvyšší ohnivý mág, bude ten pravý představitel boha Innose.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Ale pro Beliara nevím, koho vybrat. Musí to být někdo, kdo ovládá černou magii.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Černou magii? Co Xardas?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//Černou magii? Co Xardas?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//To je ono. To by mohlo fungovat.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Ale ptám se sám sebe, jak ty tři dostat k sobě.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Dokážu si představit, jak se Pyrokar bude tvářit, až se dozví, že musí spolupracovat s Xardasem.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Už musím jít.",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Kde najdu kováře schopného opravit objímku Oka?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Poptej se tady po okolí po někom, kdo umí opravit šperk.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Proč si Pyrokar ze všech lidí vybral právě tebe?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//Měl jsem podezření, že se dříve či později něco podobného přihodí.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Pyrokar se vždycky považoval za tak nezranitelného a mocného, že to skoro hraničilo s nerozvážností.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//Proto byla jeho opatření na ochranu Oka také tak... ehm, lajdácká.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//Prostě si myslím, že mimovolně spoléhal na schopnosti, jež mi Adanos propůjčil.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Raději ani nemyslím na to, co by se mohlo stát, kdybych teď nebyl k dispozici.
};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//Po tomhle městě se novinky šíří rychle.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//Taky dobře. Nepřítel se stejně bude mít na pozoru.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//Už musím jít.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Musím vyrazit a připravit v Kruhu slunce ten rituál.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Pošli tam Xardase a Pyrokara. A nezapomeň přinést trávu z bažin. Spoléhám na tebe.
	B_LogEntry(TOPIC_INNOSEYE,"Podle Vatrase mohu Oku navrátit moc pouze tak, že vykonám rituál v kruhu Slunce. Musím ovšem přimět Xardase a Pyrokara, aby se ho také zúčastnili, a zároveň najít kováře, který dokáže rozbitý amulet opravit.");
	MIS_RitualInnosEyeRepair = LOG_Running;
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	B_Vatras_GeheWeg(kurz);
	dmt_1201.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1202.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1203.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1204.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1205.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1206.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1207.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1208.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1209.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1210.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1211.aivar[AIV_EnemyOverride] = TRUE;
	B_StartOtherRoutine(dmt_1201,"AfterRitual");
	B_StartOtherRoutine(dmt_1202,"AfterRitual");
	B_StartOtherRoutine(dmt_1203,"AfterRitual");
	B_StartOtherRoutine(dmt_1204,"AfterRitual");
	B_StartOtherRoutine(dmt_1205,"AfterRitual");
	B_StartOtherRoutine(dmt_1206,"AfterRitual");
	B_StartOtherRoutine(dmt_1207,"AfterRitual");
	B_StartOtherRoutine(dmt_1208,"AfterRitual");
	B_StartOtherRoutine(dmt_1209,"AfterRitual");
	B_StartOtherRoutine(dmt_1210,"AfterRitual");
	B_StartOtherRoutine(dmt_1211,"AfterRitual");
};


instance DIA_Vatras_RitualInnosEyeRepair(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_RitualInnosEyeRepair_Condition;
	information = DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent = TRUE;
	description = "Jak se to má s Innosovým okem?";
};


func int DIA_Vatras_RitualInnosEyeRepair_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Vatras_RitualInnosEyeRepair_Info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//Jak se to má s Innosovým okem?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Pamatuj: jedině rituál zvratu v Kruhu slunce společně s Xardasem a Pyrokarem může Oku navrátit sílu.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//A nezapomeň přinést Oko s opravenou objímkou.
};


instance DIA_Vatras_BEGINN(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 31;
	condition = DIA_Vatras_BEGINN_Condition;
	information = DIA_Vatras_BEGINN_Info;
	description = "Udělal jsem vše, co jsi řekl. Tady je opravené Oko.";
};


func int DIA_Vatras_BEGINN_Condition()
{
	if((Kapitel == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,ItMi_InnosEye_Discharged_Mis) && (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Vatras_BEGINN_Info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Udělal jsem vše, co jsi řekl. Tady je opravené Oko.
	B_GivePlayerXP(XP_RitualInnosEyeRuns);
	B_GiveInvItems(other,self,ItMi_InnosEye_Discharged_Mis,1);
	Npc_RemoveInvItem(self,ItMi_InnosEye_Discharged_Mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//Teď už nic nebrání provedení rituálu.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//A co tráva z bažin?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//Á, ano. Tak máš ty tři rostlinky?
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Ahem. Ano. Tady jsou ty tři rostlinky.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//Výborně.
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Ne. Bohužel ne.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Dobrá. Tak to budeme muset udělat bez nich.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Udělals to dobře, ale teď se postav kousek stranou, ať můžeme začít s rituálem. Nechť se naše duše spojí.
	Info_ClearChoices(DIA_Vatras_BEGINN);
	Info_AddChoice(DIA_Vatras_BEGINN,Dialog_Ende,DIA_Vatras_BEGINN_los);
};

func void DIA_Vatras_BEGINN_los()
{
	AI_StopProcessInfos(self);
	Vatras_MORE = FALSE;
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	B_StartOtherRoutine(Xardas,"RITUALINNOSEYE");
	B_StartOtherRoutine(Pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RitualInnosEyeRuns = LOG_Running;
};


instance DIA_Vatras_AUGEGEHEILT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_AUGEGEHEILT_Condition;
	information = DIA_Vatras_AUGEGEHEILT_Info;
	important = TRUE;
};


func int DIA_Vatras_AUGEGEHEILT_Condition()
{
	if((Kapitel == 3) && (RitualInnosEyeRuns == LOG_Running) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_AUGEGEHEILT_Info()
{
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Hotovo. Podařilo se nám překazit nepříteli plány a opravit Oko.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//Ať ti Pyrokar vysvětlí, jak používat jeho sílu.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Doufám, že se ještě uvidíme, až dokončíš svou misi. Sbohem.
	B_LogEntry(TOPIC_INNOSEYE,"Oko je již v pořádku. Pyrokar mi je vydá a pak půjdu lovit draky.");
	AI_StopProcessInfos(self);
	Vatras_MORE = FALSE;
	RitualInnosEyeRuns = LOG_SUCCESS;
	MIS_RitualInnosEyeRepair = LOG_SUCCESS;
	B_StartOtherRoutine(Pyrokar,"RitualInnosEyeRepair");
	B_StartOtherRoutine(Xardas,"RitualInnosEyeRepair");
	B_StartOtherRoutine(VLK_455_Buerger,"START");
	B_StartOtherRoutine(VLK_454_Buerger,"START");
	B_StartOtherRoutine(VLK_428_Buergerin,"START");
	B_StartOtherRoutine(VLK_450_Buerger,"START");
	B_StartOtherRoutine(VLK_426_Buergerin,"START");
	B_StartOtherRoutine(VLK_421_Valentino,"START");
};


instance DIA_Vatras_PERMKAP3(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_PERMKAP3_Condition;
	information = DIA_Vatras_PERMKAP3_Info;
	description = "Díky za pomoc při obnovení síly Innosova oka.";
};


func int DIA_Vatras_PERMKAP3_Condition()
{
	if(MIS_RitualInnosEyeRepair == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Vatras_PERMKAP3_Info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//Díky za pomoc při obnovení síly Innosova oka.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Neplýtvej tak svými díky. Tvůj největší úkol na tebe ještě čeká.
	if(MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Promluv si s Pyrokarem, vysvětlí ti všechno ostatní.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Doufám, že tě ještě uvidím živého a zdravého, můj synu.
};


instance DIA_Vatras_HILDAKRANK(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 34;
	condition = DIA_Vatras_HILDAKRANK_Condition;
	information = DIA_Vatras_HILDAKRANK_Info;
	description = "Lobartově ženě Hildě je špatně.";
};


func int DIA_Vatras_HILDAKRANK_Condition()
{
	if((MIS_HealHilda == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_GREET))
	{
		return TRUE;
	};
};

func void DIA_Vatras_HILDAKRANK_Info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//Lobartově ženě Hildě je špatně.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Co? Už zase? Ta dobrá žena by na sebe měla dávat větší pozor.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Jedna tuhá zima a už tu s námi nebude. Dobrá, dám ti pro ni medicínu, co potlačí horečku.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//A víš, když už jsi v tom, měl bys na sebe taky dávat pozor.
	CreateInvItems(self,ItPo_HealHilda_MIS,1);
	B_GiveInvItems(self,other,ItPo_HealHilda_MIS,1);
};


instance DIA_Vatras_OBSESSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 35;
	condition = DIA_Vatras_OBSESSION_Condition;
	information = DIA_Vatras_OBSESSION_Info;
	description = "Mám podivné pocity úzkosti.";
};


func int DIA_Vatras_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (SC_ObsessionTimes < 1))
	{
		return TRUE;
	};
};

func void DIA_Vatras_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//Mám podivné pocity úzkosti.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Taky nevypadáš moc dobře. Byl jsi vystaven černému pohledu Pátračů příliš dlouhou dobu.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//Všechno, co svedu léčit, je tvoje tělo, ale jedině v klášteře mohou očistit tvou duši. Promluv si s Pyrokarem. Pomůže ti.
};


instance DIA_Vatras_AllDragonsDead(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 59;
	condition = DIA_Vatras_AllDragonsDead_Condition;
	information = DIA_Vatras_AllDragonsDead_Info;
	description = "Ti draci už žádnou spoušť nezpůsobí.";
};


func int DIA_Vatras_AllDragonsDead_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Vatras_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Ti draci už žádnou spoušť nezpůsobí.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//Věděl jsem, že se vrátíš živý a zdravý. Nicméně, ještě pořád máš tu největší překážku před sebou.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Já vím.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Tak se pořádně připrav a přijď za mnou, kdykoli budeš něco potřebovat. Také pořád u sebe nos Innosovo oko, slyšíš? Nechť ti Adanos žehná.
};


instance DIA_Vatras_KnowWhereEnemy(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_KnowWhereEnemy_Condition;
	information = DIA_Vatras_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Vím, kde jsou naši nepřátelé.";
};


func int DIA_Vatras_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Vatras_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//Vím, kde jsou naši nepřátelé.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Tak to už nesmíme ztrácet čas. Musíme je vyhledat dřív, než si pro nás přijdou.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Chceš se ke mně přidat?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//Dlouho jsem o tom přemýšlel a nikdy jsem si nebyl ničím tak jistý, příteli.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Vatras mi překvapivě nabídl, že mě na cestě doprovodí. Muž s jeho dovednostmi a zkušenostmi pro mě bude jistě velmi cenný.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//Už mám skupinu plnou. Obávám se, že pro tebe nezbylo místo.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Tak ho nějak udělej. Potřebuješ mě.
	}
	else
	{
		Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Ještě o tom popřemýšlím.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Považuju za velkou poctu mít tě po svém boku.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

func void DIA_Vatras_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Považuju za velkou poctu mít tě po svém boku. Uvidíme se v přístavu.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//Ať ti to netrvá moc dlouho. Nepřítel nikdy nespí, příteli.
	B_GivePlayerXP(XP_Crewmember_Success);
	self.flags = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	B_Vatras_GeheWeg(lang);
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};

func void DIA_Vatras_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Ještě o tom popřemýšlím.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Jak je libo. Vrať se, jestli si to rozmyslíš.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};


instance DIA_Vatras_LeaveMyShip(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_LeaveMyShip_Condition;
	information = DIA_Vatras_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Raději bys měl zůstat tady. Město tě potřebuje.";
};


func int DIA_Vatras_LeaveMyShip_Condition()
{
	if((Vatras_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Raději bys měl zůstat tady. Město tě potřebuje.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Možná máš pravdu. Ale stejně se k tobě přidám, jestli máš zájem. To snad víš.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_Vatras_StillNeedYou(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_StillNeedYou_Condition;
	information = DIA_Vatras_StillNeedYou_Info;
	permanent = TRUE;
	description = "Pojeď se mnou na nepřátelský ostrov.";
};


func int DIA_Vatras_StillNeedYou_Condition()
{
	if(((Vatras_IsOnBoard == LOG_OBSOLETE) || (Vatras_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Pojeď se mnou na nepřátelský ostrov.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//Moudré rozhodnutí. Doufám, že se toho budeš držet.
	self.flags = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_Vatras_GeheWeg(lang);
	AI_StopProcessInfos(self);
	Vatras_MORE = FALSE;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Addon_Vatras_PISSOFFFOREVVER(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_PISSOFFFOREVVER_Condition;
	information = DIA_Addon_Vatras_PISSOFFFOREVVER_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Vatras_PISSOFFFOREVVER_Condition()
{
	if((VatrasPissedOffForever == TRUE) && (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PISSOFFFOREVVER_Info()
{
	B_VatrasPissedOff();
	AI_StopProcessInfos(self);
	Vatras_MORE = FALSE;
};

