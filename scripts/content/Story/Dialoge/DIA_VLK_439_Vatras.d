
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
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_00");	//Hodn? zv?st? se o tob? v Khorinisu ????.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_01");	//??k? se, ?e jsi zapleten do vra?d nevinn?ch lid?.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_02");	//Mohu t? jen varovat synu, doufaje ?e spr?vn?.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_03");	//Nesestupuj z cesty rovnov?hy a z?chrany tohoto sv?ta. Jinak se bude? muset p?ipravit n?st n?sledky.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_04");	//Jak mohu b?t mimo slu?bu?
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
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_06");	//Je n?co, co bys cht?l dodat?
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning,"Vypadni",DIA_Addon_Vatras_LastWarning_Arsch);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning,"Je mi l?to. Nev?d?l jsem co d?l?m.",DIA_Addon_Vatras_LastWarning_Reue);
};

func void DIA_Addon_Vatras_LastWarning_Arsch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00");	//Vypadni
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00");	//Ve tv?ch slovech nen? ??dn? n?znak l?tosti.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01");	//Nedal jsi mi jinou mo?nost.
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff();
};

func void DIA_Addon_Vatras_LastWarning_Reue()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00");	//Je mi l?to. Nev?d?l jsem co d?l?m.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00");	//Budu se za tebe modlit a doufat, ?e jednoho dne op?t najde? rovnov?hu.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01");	//Bu? opatrn? a opova? se je?t? n?kdy zapl?st do vra?dy.
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
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_00");	//Tv? slova jsou stejn? ?patn? jako tv? ?iny.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_01");	//Tv? neciteln? vra?d?n? zjevn? nikdy neskon??.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_02");	//Ned?v?? mi jinou mo?nost.
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
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_00");	//Po?kej!
		if(Vatras_GehZuLares == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_01");	//Pokud se setk?? s Laresem....
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_02");	//Je tu jedna mal? v?c, o kterou bych t? cht?l po??dat.
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_03");	//B?? do p??stavu. Najde? tam chlap?ka jm?nem Lares.
			Vatras_GehZuLares = TRUE;
		};
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_04");	//Doru? mu tento ornament a pov?z mu, aby ho odnesl zp?t. Bude v?d?t, co ud?lat d?l.
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
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Adanos t? prov?zej.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Jsem Vatras, slu?ebn?k Adanos?v, str??ce bo?sk? i pozemsk? rovnov?hy.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Co pro tebe mohu ud?lat?
};


instance DIA_Addon_Vatras_Cavalorn(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Cavalorn_Condition;
	information = DIA_Addon_Vatras_Cavalorn_Info;
	description = "M?m pro tebe dopis.";
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
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_15_00");	//M?m pro tebe dopis.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_01");	//Pro m??
	if(SaturasFirstMessageOpened == FALSE)
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras);
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon_Sealed,1);
	}
	else
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras_Opened);
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon,1);
		AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_02");	//Jo, ale...byl otev?en. Douf?m ?e ho ne?etl nikdo, kdo ho nem? vid?t.
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_03");	//Vskutku. To je opravdu d?le?it? zpr?va.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_04");	//Div?m se, ?e se ti ta zpr?va dostala v?bec do rukou.
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice(DIA_Addon_Vatras_Cavalorn,"Sebral jsem to bandit?m",DIA_Addon_Vatras_Cavalorn_Bandit);
	if(MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Addon_Vatras_Cavalorn,"Dal mi ji Cavalorn.",DIA_Addon_Vatras_Cavalorn_Cavalorn);
	};
	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};

func void DIA_Addon_Vatras_Cavalorn_Bandit()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Bandit_15_00");	//Sebral jsem to bandit?m
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_01");	//(znepokojen?) U Adanose! To nen? dobr?. To v?bec nen? dobr?.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_02");	//Pokud je tv? vypr?v?n? pravdiv?, pak m?me obrovsk? probl?m.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_03");	//Budu se t?m zab?vat hned, jak to bude mo?n?.
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
};

func void DIA_Addon_Vatras_Cavalorn_Cavalorn()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00");	//Dal mi ji Cavalorn.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01");	//(p?ekvapen?) Cavalorn? Kde je?
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02");	//?ekl mi, abych ti vy??dil, ?e nemohl dopis doru?it. Nyn? je na cest? k m?stu obvykl?ho setk?n?. A? u? je to cokoliv.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03");	//Vid?m, ?e sis z?skal jeho d?v?ru. M?l bych ti tak? v??it synu.
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
	description = "Cavalorn m? za tebou poslal!";
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
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_00");	//Cavalorn m? za tebou poslal!
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_01");	//A co ??kal?
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_02");	//Zm?nil se, ?e m?? kolem sebe n?kolik schopn?ch lid?, co ti pom?haj?. Pr? bych se mohl taky p?idat.
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_03");	//(usm?v)Tak .... cht?l by ses k n?m p?idat synu?
};


instance DIA_Addon_Vatras_TellMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_TellMe_Condition;
	information = DIA_Addon_Vatras_TellMe_Info;
	permanent = TRUE;
	description = "Pov?z mi n?co o Kruhu Vody.";
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
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_15_00");	//Pov?z mi n?co o Kruhu Vody.
	if(!Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_01");	//(netrp?liv?) A pro? bych ti m?l n?co ??kat?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_02");	//Nemus?? v?d?t V?ECHNO, dokud nejsi jedn?m z n?s.
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_03");	//?eknu ti v?e, co mohu.
		Info_ClearChoices(DIA_Addon_Vatras_TellMe);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,Dialog_Back,DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Tak co m?te nyn? v pl?nu?",DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Kde jsou ostatn? m?gov? Vody?",DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Kdo jsou ?lenov? Kruhu Vody?",DIA_Addon_Vatras_TellMe_WerNoch);
	};
};

func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_TellMe);
};

func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Philo_15_00");	//Tak co m?te nyn? v pl?nu?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_01");	//Stoj?me mezi ??dem Innose a chaosem Beliara.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_02");	//Pokud by jedna strana p?eva?ovala, m?lo by to za n?sledek bu? ztr?tu svobody nebo p??chod smrtnesouc?ho chaosu.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_03");	//A pokou??me se zajistit rovnov?hu. Je to jedin? cesta pro ?ivot na tomto sv?t?.
	if(MIS_Vatras_FindTheBanditTrader == 0)
	{
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Mohl bys b?t trochu v?c konkr?tn??",DIA_Addon_Vatras_TellMe_Konkret);
	};
};

func void DIA_Addon_Vatras_TellMe_Konkret()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Konkret_15_00");	//(udiven?) Mohl bys b?t trochu v?c konkr?tn??
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_01");	//Po t?, co bariera padla to tu je velmi nebezpe?n?.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_02");	//Jedna z nejv?t??ch hrozeb jsou zjevn? banditi.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_03");	//Je skoro nemo?n? cestovat po ostrov? neozbrojen ...
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_04");	//... ve m?st? je dokonce n?kdo, kdo bandity podporuje!
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Add_05_00");	//Zjistili jsme, ?e bandit? nakupuj? zbran? od jednoho z m?stn?ch obchodn?k?.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_05");	//Nap??klad takov? lidi se sna??me naj?t, abychom zabr?nili jak?mukoliv zlu ve m?st?.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_06");	//Pokud by si se o tom chce? dozv?d?t v?c, tak mi ?ekni.
	MIS_Vatras_FindTheBanditTrader = LOG_Running;
	Vatras_ToMartin = TRUE;
	Log_CreateTopic(TOPIC_Addon_Bandittrader,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Bandittrader,LOG_Running);
	B_LogEntry(TOPIC_Addon_Bandittrader,"V Khorinisu je dodavatel zbran? pro bandity. Vatras m? pov??il vy?et?ov?n?m.");
	B_LogEntry(TOPIC_Addon_Bandittrader,"Martin, proviantmistr paladin?, o dodavateli zbran? n?co v?. Najdu ho ve skladu paladin? v p??stavu.");
	B_LogEntry(TOPIC_Addon_RingOfWater,"Kruh Vody se zab?v? probl?mem s bandity v okol? m?sta Khorinis.");
};

func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_OtherKdW_15_00");	//Kde jsou ostatn? m?gov? Vody?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_01");	//Na severov?chod? zkoumaj? ruiny prastar?ho n?roda.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_02");	//Domn?v?me se, ?e v ruin?ch je vchod na doposud neobjevenou ??st ostrova.
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_KDW,"Ostatn? m?gov? Vody prozkoum?vaj? ruiny star?ho n?roda na severov?chod? Khorinisu.  Je to asi vstup do doposud neobjeven?ch ??st? Khorinisu.");
	Info_AddChoice(DIA_Addon_Vatras_TellMe,"?ekni mi v?c o t? neprozkouman? ??sti.",DIA_Addon_Vatras_TellMe_Unexplored);
};

func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_00");	//?ekni mi v?c o t? neprozkouman? ??sti.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_01");	//Mohu napsat dopis a poslat t? s n?m za Saturasem, m??-li zajem o p?ipojen? se k v?prav?.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_02");	//Samoz?ejm?, ?e se na tom m??e? pod?let jen jako jeden z n?s.
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_03");	//Jist?.
	B_LogEntry(TOPIC_Addon_KDW,"D??ve ne? se mohu p?ipojit k m?gsk? expedici, mus?m se podle Vatrase st?t ?lenem Kruhu Vody.");
};

func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_WerNoch_15_00");	//Kdo jsou ?lenov? Kruhu Vody?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_01");	//To se dozv??, a? bude? jedn?m z n?s.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_02");	//Jsem si jist, ?e se s n?k?m z n?s setk??.
};


instance DIA_Addon_Vatras_WannaBeRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_WannaBeRanger_Condition;
	information = DIA_Addon_Vatras_WannaBeRanger_Info;
	description = "Chci se p?idat ke  Kruhu Vody!";
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
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_00");	//Chci se p?idat ke  Kruhu Vody!
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ring))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_01");	//Ano? Dob?e, ji? jsi splnil prvn? po?adavek.
		AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_02");	//O ?em to mluv???
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_03");	//N?kdo z n?s ti v???. Jinak bys o n?s v?bec nev?d?l.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_04");	//Ale 'j?' o tob? nic nev?m ...
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//Co bys r?d v?d?l?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//No, mohl bys mi prozradit, odkud p?ich?z?? a pro? jsi vkro?il do m?sta.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//Nesu d?le?itou zpr?vu veliteli paladin?.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Co je to za zpr?vu?
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Objevili se tu draci...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Brzy se stanou hrozn? v?ci.",DIA_Vatras_INFLUENCE_FIRST_LIE);
};

func void DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Zat?mco tu spolu hovo??me, sb?r? se proti n?m obrovsk? arm?da, kterou vedou draci a kter? si chce podmanit celou zemi.
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Pokud je to skute?n? pravda, pak by to mohlo naru?it rovnov?hu cel? zem?. Kdo ti to ?ekl?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//(p?em??liv?) Draci? Mysl?? ty tvory, o kter?ch se vypr?v?j? legendy? Jak jsi na to p?i?el?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"No, n?kde jsem n?co zaslechl.",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Pov?d?l mi to m?g Xardas...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = TRUE;
};

func void DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Brzy se stanou hrozn? v?ci.
	if(Vatras_First == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//(rozl?cen?) Aha. A kdo ti to ?ekl?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Hrozn? v?ci, hmmm... a jak to v???
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"No, n?kde jsem n?co zaslechl.",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Pov?d?l mi to m?g Xardas...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = 2;
};

func void DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Pov?d?l mi to m?g Xardas a tak? mi nak?zal, abych varoval paladiny.
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//V?m, ?e tento mu? je moudr? a mocn? mistr magick?ch v?d. A odkud p?ich?z?? ty?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Nekromant... tak?e ?ije... (p?em??liv?) a poslal t? sem? Kdo doopravdy jsi?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Jsem pouh?m dobrodruhem z jihu...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Jsem b?val? trestanec...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = TRUE;
};

func void DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//No, n?kde jsem n?co zaslechl.
	if(Vatras_Second == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//(otr?ven?) Pamatuje? si alespo?, odkud p?ich?z???
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Aha. A pr?v? proto jsi podnikl tuhle cestu. Kdo doopravdy jsi?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Jsem dobrodruhem z dalek?ho jihu.",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Jsem b?val? trestanec...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = 2;
};

func void B_Vatras_INFLUENCE_REPEAT()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Dob?e, tak si to shr?me:
	if(Vatras_Third == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Jsi b?val? trestanec,
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Jsi dobrodruhem z dalek?ho jihu,
	};
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//kter?ho sem poslal nekromant Xardas,
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//kter? se n?kde doslechl,
	};
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//?e na?i zemi napadnou draci.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//?e se v brzk? dob? stanou hrozn? v?ci.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//A tak jsi to p?i?el ohl?sit paladin?m.
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//To zn? sice fantasticky, ale nezd? se mi, ?e bys mi lhal.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Proto mus?m uznat, ?e tv? pohnutky jsou u?lechtil?.
		AI_Output(self,other,"DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11");	//M?? ?anci p?ipojit se ke 'Kruhu Vody'.
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//Mysl?m, ?e jsi mi ne?ekl ?pln? v?echno.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//Jestli se boj??, ?e bych mohl tv? slova n?komu vyzradit, pak nem?j strach.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//P??sahal jsem, ?e v?echna tajemstv?, kter? mi n?kdo sv???, si ponech?m pro sebe.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//A co zdej?? lid??
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//Ti rozum? pouze polovin? toho, co jim K??U, tak?e nem?j obavy.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Za?n?me tedy znovu od za??tku. Co je to za zpr?vu?
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Objevili se tu draci...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Brzy se stanou hrozn? v?ci.",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
};

func void DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Jsem b?val? v?ze? z trestaneck? kolonie v Khorinisu.
	Vatras_Third = TRUE;
	B_Vatras_INFLUENCE_REPEAT();
};

func void DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Jsem dobrodruhem z dalek?ho jihu.
	Vatras_Third = FALSE;
	B_Vatras_INFLUENCE_REPEAT();
};


instance DIA_Addon_Vatras_HowToJoin(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_HowToJoin_Condition;
	information = DIA_Addon_Vatras_HowToJoin_Info;
	description = "Co mus?m ud?lat k p?ijet??";
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
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_00");	//Co mus?m ud?lat k p?ijet??
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_01");	//Mus?? si uv?domit, ?e vstupem mezi n?s na sebe bere? velkou zodpov?dnost.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_02");	//Nep?ijm?m kde koho, jen proto?e si o to ?ekne.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_03");	//Pokud chce? b?t jedn?m z n?s, synu, chovej se tak, jako kdybys u? byl jedn?m z n?s.
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_04");	//T?m mysl?? ... ?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_05");	//Ka?d? mlad? mu? mus? splnit hlavn? ?kol, ne? se m??e p?idat.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_06");	//Pouze pak mohu uva?ovat o tv?m p?ipojen? k n?m v na?em ?kolu udr?ov?n? rovnov?hy sil na tomto ostrov?.
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"Dob?e, jak t? m??u p?esv?d?it?",DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"Osvobodil jsem mnoho lid?. Bari?ra byla zni?ena.",DIA_Addon_Vatras_HowToJoin_FreedMen);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"Porazil jsem Sp??e. To by se dalo nazvat hlavn? zkou?ka.",DIA_Addon_Vatras_HowToJoin_Sleeper);
};

func void DIA_Addon_Vatras_HowToJoin_Sleeper()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_Sleeper_15_00");	//Porazil jsem Sp??e. To by se dalo nazvat hlavn? zkou?ka.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_01");	//Sly??m posledn? dobou mnoho pov?da?ek.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_02");	//V?etn? t? o monstru zvan?m Sp?? a jeho odstran?n?m z tohoto sv?ta.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_03");	//Nesly?el jsem o tom, ?e jsi za to zodpov?dn? jen ty - ale p?esto tv? o?i ??kaj?, ?e v???? v to, co ??k??.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_04");	//Pon?kud m? to popuzuje, ale nejsem si jist, jestli m? m? smysly nezrazuj?.
};

func void DIA_Addon_Vatras_HowToJoin_FreedMen()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00");	//Osvobodil jsem mnoho lid?. Bari?ra byla zni?ena.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01");	//Pokud za t?m OPRAVDU stoj?? ty...
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02");	//Lid?m, kter?m jsi dal svobodu nejsou jen m?gov? Vody ?i nevinn? ob?an?.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03");	//Zlo?inci z cel? zem? jsou te? rozlezl? po cel?m ostrov? a ohro?uj? ob?any tohoto m?sta.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04");	//Tak? u? kontroluj? n?kter? ??sti ostrova bl?zko m?sta. Je t?m?? nemo?n? opustit Khorinis beze ?razu.
};

func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00");	//Dob?e, jak t? m??u p?esv?d?it?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01");	//N?co podivn?ho se tyto dny d?je v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02");	//Po?et zmizel?ch lid? se zvy?uje ka?d?m dnem.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03");	//Pokud zjist??, co se s nimi stalo, p?ijmeme t? r?di do Kruhu Vody.
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,LogText_Addon_KDWRight);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Vatras m? nep??jme dokud ta z?le?itost s Kruhem Vody a mizej?c?mi lidmi nebude vy?e?ena.");
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
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06");	//... m?l by sis nejd??ve promluvit s paladiny a ??ci jim o zpr?v?, kterou jim nese?.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07");	//Mysl?m, ?e to je neoby?ejn? d?le?it?!
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08");	//Promluv si s Lordem Hagenem.
	B_LogEntry(TOPIC_Addon_RingOfWater,"Vatras chce, abych paladin?m nejprve p?edal zpr?vu o drac?ch v Hornick?m ?dol?.");
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
};


instance DIA_Addon_Vatras_GuildBypass(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_GuildBypass_Condition;
	information = DIA_Addon_Vatras_GuildBypass_Info;
	description = "Ale oni m? nepust?!";
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
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_15_00");	//Ale oni m? nepust?!
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_01");	//Pust?. Pokud jsi ?lenem vlivn? gildy.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_02");	//Kruh m? p?r u?ite?n?ch kontakt?.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_03");	//Pokus?me se zajistit, aby jsi mohl doru?it zpr?vu Lordu Hagenovi, co nejrychleji to bude mo?n?.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_04");	//M?l by ses zeptat p??tele Larese. Mohl by ti pomoci.
	B_LogEntry(TOPIC_Addon_RingOfWater,"Ke vstupu k Lordu Hagenovi mus?m b?t ?lenem n?jak? mocn? khorinissk? gildy.");
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"Ud?l?m to.",DIA_Addon_Vatras_GuildBypass_BACK);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"Ke kter? gild? bych se m?l p?idat?",DIA_Addon_Vatras_GuildBypass_WhichGuild);
};

func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_BACK_15_00");	//Ud?l?m to.
	Vatras_GehZuLares = TRUE;
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
};

func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00");	//Ke kter? gild? bych se m?l p?idat?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01");	//Jsou zde pouze t?i gildy, kter? jsou dostate?n? vlivn? a siln?.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02");	//Domobrana, m?gov? Ohn? nebo ?old?ci na Onarov? farm?.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03");	//Je to tv? volba.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04");	//Mysl?m, ?e Lares ti m??e pomoci s t?mto obt??n?m rozhodov?n?m. Navrhuju, aby sis s n?m promluvil.
	B_LogEntry(TOPIC_Addon_RingOfWater,"Jsou zde t?i mocn? gildy ke kter?m se m??e? p?idat: m?gov? Ohn?, domobrana nebo ?old?ci na velkostatk??ov? dvo?e.");
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"Ud?l?m to.",DIA_Addon_Vatras_GuildBypass_BACK);
};


instance DIA_Addon_Vatras_NowRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_NowRanger_Condition;
	information = DIA_Addon_Vatras_NowRanger_Info;
	permanent = TRUE;
	description = "Jsem p?ipraven p?idat se ke Kruhu!";
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
	AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_00");	//Jsem p?ipraven p?idat se ke Kruhu!
	AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_01");	//Donesl jsi svou zpr?vu Lordu Hagenovi?
	if(Kapitel >= 2)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Ano.
		if(MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//Ale, ?ekl mi, ?e m?m j?t do hornick?ho ?dol? a p?in?st d?kaz s?ch tvrzn?!
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_04");	//Mus?? se rozhodnout, co d?l.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_05");	//Doru?en? zpr?vy bylo d?le?it? pro m?. Te? je na n?m, aby si posp??il, nebo po?kal na tv?j d?kaz.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_06");	//Co se t??e tebe ...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Dobr?.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_08");	//Dok?zal jsi, ?e m??e? b?t pro n?s d?le?it?. M??e? b?t jedn?m z n?s. Chodit po sv?t? a ???it Adanosovu v?li.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_09");	//T?mto ti ud?luji prsten Kruhu Vody. Pom??e ti naj?t spojence a starat se s nimi o rovnov?hu sv?ta.
		CreateInvItems(self,ItRi_Ranger_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_10");	//Jsem velmi pot??en t?m, ?e jsi prvn?m m?gem Ohn?, kter? se k n?m p?idal.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_11");	//Nech? t? Adanos ochra?uje. Nyn? b?? a setkej se sv?mi bratry.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_12");	//?ekaj? t? v hostinci U mrtv? harpyje na p?ijmac? ritu?l.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_13");	//P?edpoklad?m, ?e ten hostince zn??. Proch?zi? kolem n?j po cest? na Onar?v statek.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_14");	//Nezapome? si nasadit prsten, tak mohou brat?i poznat, ?e jsi jeden z nich.
		B_LogEntry(TOPIC_Addon_RingOfWater,"Te? pat??m ke Kruhu Vody a m?m se setkat s na?i partou v hospod? u Mrtv? Harpyje.");
		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_Running;
		B_GivePlayerXP(XP_Addon_SC_IsRanger);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//Ne. Je?t? ne.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_16");	//Pak si posp??. Tv? zpr?va se zd? b?t velice d?le?itou!
	};
};


instance DIA_Addon_Vatras_CloseMeeting(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_CloseMeeting_Condition;
	information = DIA_Addon_Vatras_CloseMeeting_Info;
	description = "Brat?i Kruhu m? poslali za tebou.";
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
	AI_Output(other,self,"DIA_Addon_Vatras_CloseMeeting_15_00");	//Brat?i Kruhu m? poslali za tebou.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_01");	//Skv?le! U? jsem na tebe ?ekal!
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//Po?lu t? skrze port?l s ostatn?mi m?gy Vody.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//P?jde? po stop? rudobarona Ravena a vyp?tr?? pro? un??? ob?any Khorinisu.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//A my se pokus?me postarat o hrozbu, kterou sk?taj? bandit?.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//P?ines tuto zpr?vu Saturasovi. Od t?to chv?le bude? z?sk?vat ?koly od n?j.
	if(MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_08");	//Lares t? tam zavede v p??pad?, ?e je?t? nep?inesl zp?t ornament.
	};
	CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
	B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//Nech? Adanos vede tvou cestu.
	B_LogEntry(TOPIC_Addon_KDW,"Vatras m? poslal s dopisem za Saturasem. M?l bych te? j?t s ostatn?mi m?gy Vody skrze port?l a chytit b?val?ho rudobarona Ravena.");
	Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
	B_LogEntry(TOPIC_Addon_Sklaven,"M?m zjistit pro? Raven un??? ob?any Khorinisu.");
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
	description = "O zmizel?ch lidech ...";
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
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_15_00");	//O zmizel?ch lidech ...
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_05_01");	//Ano?
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice(DIA_Addon_Vatras_MissingPeople,Dialog_Back,DIA_Addon_Vatras_MissingPeople_BACK);
	if(SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"V?m kde jsou.",DIA_Addon_Vatras_MissingPeople_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Pov?m ti, co jsem doposud vyp?tral ...",DIA_Addon_Vatras_MissingPeople_Report);
	};
	if(DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE)
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Kde bych m?l za??t hledat stopy?",DIA_Addon_Vatras_MissingPeople_Wo);
	};
};

func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
};

func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HintMissingPeople_Wo_15_00");	//Kde bych m?l za??t hledat stopy?
	AI_Output(self,other,"DIA_Addon_Vatras_HintMissingPeople_Wo_05_01");	//V?t?ina zmizela v p??stavu. To zn? jako dobr? m?sto pro za??tek.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Nejv?ce lid? zmizelo v khorinissk?m p??stavu. M?l bych za??t hledat tam.");
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};

func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	var int XP_Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_00");	//Pov?m ti, co jsem doposud na?el ...
	if(((MIS_Akil_BringMissPeopleBack != 0) || (MIS_Bengar_BringMissPeopleBack != 0)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_01");	//Farm??i tak? postr?daj? n?kolik lid?.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((Elvrich_GoesBack2Thorben == TRUE) || (Elvrich_SCKnowsPirats == TRUE) || (SC_KnowsDexterAsKidnapper == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_02");	//Taky jsem se doslechl, ?e jsou za to odpov?dn? bandit?.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_03");	//Elvrich, u?e? mistra Thorbena, mi ?ekl, ?e bandit? odv??ej? zajat? lidi na mo?e.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_04");	//Vypad? to, ?e s t?m maj? n?co spole?n?ho tak? pir?ti. Ale nejsem si jejich rol? v tom v?em p??li? jist?.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((Elvrich_GoesBack2Thorben == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_05");	//Osvobodil jsem Elvricha ze zajet? bandit?.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KnowsLuciaCaughtByBandits == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_06");	//D?vka jm?nem Lucia byla taky unesena bandity.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if((Npc_HasItems(other,ItWr_LuciasLoveLetter_Addon) || (MIS_LuciasLetter == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_07");	//Unesen? Lucia se vz?p?t? s bandity spol?ila.
		if(MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_08");	//Vypad? to, ?e to ud?lala z vlastn?ho p?esv?d?en?.
		};
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KnowsDexterAsKidnapper == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_09");	//Dexter je v?dcem bandit?. Je odpov?dn? za ty ?nosy.
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_10");	//Pamatuju si Dextera z kolonie. Pracoval tenkr?t pro rudobarona Gomeze.
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_11");	//A on si ur?it? bude pamatovat tebe. M?l by sis d?t pozor.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	if(Vatras_MissingPeopleReports != 0)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_12");	//Mysl?m, ?e jsi na dobr? cest?. Dr? se ji.
		XP_Vatras_MissingPeopleReports = XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports;
		B_GivePlayerXP(XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_13");	//Co jsi zjistil?
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_14");	//Bohu?el, zat?m nic sm?rodatn?ho.
	};
};

func void DIA_Addon_Vatras_MissingPeople_Success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_00");	//V?m, kde jsou zmizel? lid?.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_01");	//Co jsi zjistil?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_02");	//Byli uneseni a vzati na vzd?len? m?sto na ostrov? chl?pkem jm?nem Raven.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_03");	//A pro? jsi si t?m tak jist??
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_04");	//?etl jsem jeho rozkazy. Banditi v?ude okolo pracuj? pro n?j.
	if(Npc_HasItems(other,ItWr_RavensKidnapperMission_Addon))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_05");	//Tady.
		B_UseFakeScroll();
	};
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_06");	//Dob?e. Dobr? pr?ce. U? jsem se b?l, ?e nikdy nezjist?me pravdu.
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
	description = "Ztracen? lid? se vr?tili.";
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
	AI_Output(other,self,"DIA_Addon_Vatras_Free_15_00");	//Ztracen? lid? se vr?tili.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_01");	//Ano, dok?zal jsi to. Nakonec to dob?e dopadlo.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_02");	//Av?ak, tv? cesta je?t? nekon??. Nech? ti Adanos po?ehn?.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_03");	//(modl? se) Adanosi, po?ehnej tomuto mu?i. Osvi? jeho pou?, dej mu s?lu obst?t v?em nebezpe??m.
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
	description = "O dodavateli zbran?.....";
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
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_15_00");	//O dodavateli zbran?.....
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
	Info_AddChoice(DIA_Addon_Vatras_Waffen,Dialog_Back,DIA_Addon_Vatras_Waffen_BACK);
	if((Fernando_ImKnast == TRUE) || (Fernando_HatsZugegeben == TRUE))
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen,"Zn?m toho dodavatele zbran? pro bandity!",DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen,"Co v?? o tom prodejci zbran??",DIA_Addon_Vatras_Waffen_ToMartin);
	};
};

func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
};

func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_ToMartin_15_00");	//Co v?? o tom prodejci zbran??
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_01");	//Promluv si s Martinem, proviantmistrem paladin?. M??e m?t n?jak? informace.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_02");	//Obdr?el ?kol odhalit toho dodavatele.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_03");	//Martina najde? v p??stavu. Pokud pob???? podel t?ch beden, z?sob a paladin?, m?l bys ho naj?t.
	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_00");	//Zn?m obchodn?ka, kter? dod?v? zbran? bandit?m!
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_01");	//Jmenuje se Fernando.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_02");	//Velmi dob?e. Postaral se Martin o to, aby u? Fernando nikdy nemohl prod?vat zbran??
	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_03");	//Jo. Martin se postaral, aby moc brzo neopustil kobky ?al??e.
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_04");	//Skv?l? pr?ce, synu.
		if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger) && (SC_IsRanger == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_05");	//(sm?le) Znamen? to, ?e jsem nyn? p?ipraven vstoupit do Kruhu Vody?
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_06");	//(usm?v) To nebylo p?esn? zn?n? na?i dohody - a ty to moc dob?e v??.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_07");	//Nech? Adanos osv?t? tvou cestu.
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Vatras_FindTheBanditTrader);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_CaughtFernando_15_09");	//Je?t? ne.
		AI_Output(self,other,"DIA_Addon_Vatras_CaughtFernando_05_10");	//Tak posp?? a zprav ho o tom! Toto mus? b?t okam?it? zastaveno.
	};
};


instance DIA_Addon_Vatras_WISP(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_WISP_Condition;
	information = DIA_Addon_Vatras_WISP_Info;
	description = "Je n?co, co by mi mohlo pomoct s hled?n?m?";
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
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_WISP_15_00");	//Je n?co, co by mi mohlo pomoct s hled?n?m?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_01");	//Dost na tom trv?? mlad? mu?i. Nicm?n?, m??e tu b?t n?co, co mo?n? tv?j ?kol trochu zleh??.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_02");	//D?m ti tento amulet z rudy. Bude? ho ur?it? pot?ebovat.
	CreateInvItems(self,ItAm_Addon_WispDetector,1);
	B_GiveInvItems(self,other,ItAm_Addon_WispDetector,1);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_03");	//Je to amulet bludi?ky.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_04");	//Takov?ch je velmi m?lo. Bludi?ka v tomto amuletu m? zvl??tn? schopnosti.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_05");	//Pom?h? to zviditelnit v?ci, kter? pouh?m okem nespat??me.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_06");	//Funguje to, kdy? si to nasad??.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_07");	//Jestli?e bludi?ka zmiz?, jednodu?e si amulet nasa? znovu.
	B_LogEntry(TOPIC_Addon_Bandittrader,"Vatras mi dal 'Amulet Hledaj?c? bludi?ky'. M?l by mi pomoci v hled?n? dodavatele zbran?.");
	Log_CreateTopic(TOPIC_WispDetector,LOG_NOTE);
	B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned);
	B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_NF);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_08");	//Bludi?ka um? naj?t zbran?.
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_09");	//Tahle v?c se hod? na to patr?n? po dodavateli zbran? pro bandity.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_10");	//Zach?zej s t?m dob?e a m??e? se na to v?dy spolehnout.
	Info_ClearChoices(DIA_Addon_Vatras_WISP);
	Info_AddChoice(DIA_Addon_Vatras_WISP,"D?ky! Budu si to pamatovat.",DIA_Addon_Vatras_WISP_Thanks);
	Info_AddChoice(DIA_Addon_Vatras_WISP,"Je to v?e co ta bludi?ka um??",DIA_Addon_Vatras_WISP_MoreWISP);
	Info_AddChoice(DIA_Addon_Vatras_WISP,"V tom amuletu je bludi?ka?",DIA_Addon_Vatras_WISP_Amulett);
	SC_GotWisp = TRUE;
};

func void DIA_Addon_Vatras_WISP_Thanks()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Thanks_15_00");	//D?ky! Budu si to pamatovat.
	Info_ClearChoices(DIA_Addon_Vatras_WISP);
};

func void DIA_Addon_Vatras_WISP_MoreWISP()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_MoreWISP_15_00");	//Je to v?e, co ta bludi?ka um??
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_01");	//V?c ne? hledan? zbran?? Jen pokud ji nau??? nov?m dovednostem.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_02");	//Pokud v?m, m? o t?chto v?cech velmi dobr? znalosti Riordian. Moment?ln? je ov?em se Saturasem.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_03");	//To je v?e, co m??u ??ct.
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"Bludi?ka um? v?c ne? jen hledat zbran?. Riordian, m?g Vody, m??e u?it mou bludi?ku hledat dal?? v?ci.");
	};
};

func void DIA_Addon_Vatras_WISP_Amulett()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WISPDETECTOR_was_15_00");	//V tom amuletu je bludi?ka?
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_01");	//Bludi?ky jsou zaj?mav? stvo?en?. Skl?daj? se z ?ist? magick? energie.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_02");	//Jsou v?z?ny k magick? rud? tohoto sv?ta. Je to p?irozen? zdroj jejich s?ly.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_03");	//Nep?ekvapuje m?, ?e jsi o nich p?ed t?m nesly?el. Ukazuj? se pouze t?m, co u sebe maj? odpov?daj?c? mno?stv? rudy.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_04");	//Divok? bludi?ky byly n?siln? odstran?ny z jejich p?irozen?ho zdroje a tak ?to?? na ka?d? stvo?en?, kter? se p?ibl???.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_05");	//T?mto neboh?m stvo?en?m ji? nen? pomoci.  M?l by ses pokusit se jim vyh?bat.
};


instance DIA_Addon_Vatras_Stoneplate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_Stoneplate_Condition;
	information = DIA_Addon_Vatras_Stoneplate_Info;
	description = "Na?el jsem tuhle kamennou desku...";
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
	AI_Output(other,self,"DIA_Addon_Vatras_Stoneplate_15_00");	//Na?el jsem tuhle kamennou desku. M??e? mi o ni n?co ??ct?
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_01");	//Je to artefakt starobyl? kultury, po kter? p?tr?me pr?v? te?.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_02");	//Jsou jich r?zn? druhy. N?kter? obsahuj? informace o historii n?roda.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_03");	//A to jsou ty, jen? m? zaj?maj?. P?ines v?echny, kter? najde? ke mn?.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_04");	//Bude? odm?n?n.
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
	description = "M?m pro tebe dal?? kamenn? desky ...";
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
		AI_Output(other,self,"DIA_Addon_Vatras_SellStonplate_15_00");	//M?m pro tebe dal?? kamenn? desky ...
	}
	else
	{
	};
	B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,anzahl);
	AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_01");	//V?born?!
	if(anzahl >= 10)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_02");	//Zv???m tvou magickou s?lu!
		B_RaiseAttribute(other,ATR_MANA_MAX,anzahl);
		Npc_ChangeAttribute(other,ATR_MANA,anzahl);
	}
	else if(anzahl >= 5)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_04");	//Tady, vem si za odm?nu n?jak? svitky ...
		B_GiveInvItems(self,other,ItSc_InstantFireball,anzahl);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_03");	//Tady, vem si za odm?nu n?jak? lektvary ...
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
	description = "Lares ??kal, ?e mi m??e? pomoci dostat se do kl??tera m?g? Ohn?.";
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
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_00");	//Lares ??kal, ?e mi m??e? pomoct dostat se do kl??tera m?g? Ohn?.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_01");	//To je t? volba? Cesta Ohn??
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_02");	//Jo, hodl?m se st?t m?gem Ohn?.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_03");	//Pokud si dob?e pamatuji, nep?estali p??jm?t novice. Pro? chce? tedy mou pomoc?
	if(SC_KnowsKlosterTribut == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_04");	//Novic p?ed kl??terem po mn? chce da?. Ovci a zlato.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_05");	//Lares se zm?nil o dani na zaplacen? ke vstupu do kl??tera.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_06");	//No, nemohu ti p??mo pomoci, proto?e jsem m?gem Vody, jak v??. Ale zn?m velmi dob?e m?ga Ohn? Darona.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_07");	//Je obvykle bl?zko tr?i?t? a vyb?r? dary.
	Vatras_SentToDaron = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_08");	//A?koliv to nen? jedin? v?c, o kterou se tady star?.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_09");	//Jednou mi ??kal o so?ce, kterou mu ukradli.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_10");	//Je to pro n?j velmi d?le?it?. Jsem si jist, ?e ti pom??e, pokud z?sk?? jeho so?ku zp?t.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_11");	//Samoz?ejm?, tv? p?ijet? k m?g?m Ohn? neznamen?, ?e se nem??e? p?ipojit ke Kruhu.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_12");	//Pokud si to prokazateln? zaslou???.
	MIS_Addon_Vatras_Go2Daron = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF,"M?g Ohn? Daron na tr?i?ti pot?ebuje pomoci s malou vz?cnou so?kou. M??e mi pomoci dostat se rychle do kl??tera.");
};


instance DIA_Vatras_MORE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 998;
	condition = DIA_Vatras_MORE_Condition;
	information = DIA_Vatras_MORE_Info;
	permanent = TRUE;
	description = "(V?ce)";
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
	description = "Dej mi pros?m sv? po?ehn?n?.";
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
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Dej mi pros?m sv? po?ehn?n?.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//A pro? bych ti m?l po?ehnat, cizin?e?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Chci se st?t u?edn?kem u jednoho z mistr? v doln? ??sti m?sta.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//Jdi s Adanosov?m po?ehn?n?m, synu!
	Snd_Play("LevelUp");
	B_GivePlayerXP(XP_VatrasTruth);
	Vatras_Segen = TRUE;
	B_LogEntry(TOPIC_Thorben,"M?g vody Vatras mi po?ehnal.");
};


instance DIA_Vatras_WoKdF(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 93;
	condition = DIA_Vatras_WoKdF_Condition;
	information = DIA_Vatras_WoKdF_Info;
	permanent = FALSE;
	description = "Kde bych na?el Innosova kn?ze?";
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
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Kde bych na?el Innosova kn?ze?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Nejl?pe bude, kdy? se rozhl?dne? po tr?i?ti. Tam na n?koho z kl??tera jist? naraz??.
};


instance DIA_Vatras_Spende(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 94;
	condition = DIA_Vatras_Spende_Condition;
	information = DIA_Vatras_Spende_Info;
	permanent = TRUE;
	description = "R?d bych Adanovi poskytl dar!";
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
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//R?d bych Adanosovi poskytl dar!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Darem Adanosovu chr?mu smyje? ??st h??ch?, kter? jsi mo?n? sp?chal, synu.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Kolik m??e? v?novat?
	Info_ClearChoices(DIA_Vatras_Spende);
	Info_AddChoice(DIA_Vatras_Spende,"Zrovna te? nem?m pen?z nazbyt...",DIA_Vatras_Spende_BACK);
	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Vatras_Spende,"M?m u sebe 50 zla??k?...",DIA_Vatras_Spende_50);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Vatras_Spende,"M?m u sebe 100 zla??k?...",DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Zrovna te? nem?m pen?z nazbyt.
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//To nevad?, sv? dobr? ?mysly m??e? vyj?d?it pozd?ji, synu.
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//M?m u sebe 50 zla??k?.
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//D?kuji ti ve jm?nu Adanose, synu. Tv? zlato bude rozd?leno mezi pot?ebn?.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//M?m u sebe 100 zla??k?.
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//Za tento ?lechetn? ?in ti ve jm?nu Adanose ?ehn?m!
	Snd_Play("LevelUp");
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Nech? ti Adanos na tv? cest? po?ehn?!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	Vatras_Segen = TRUE;
	Info_ClearChoices(DIA_Vatras_Spende);
	if(MIS_Thorben_GetBlessings == LOG_Running)
	{
		B_LogEntry(TOPIC_Thorben,"M?g vody Vatras mi po?ehnal.");
	};
};


instance DIA_Vatras_CanTeach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 95;
	condition = DIA_Vatras_CanTeach_Condition;
	information = DIA_Vatras_CanTeach_Info;
	permanent = FALSE;
	description = "M??e? m? nau?it n?co o magii?";
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
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//M??e? m? nau?it n?co o magii?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Pouze vyvolen?m Innose nebo Adanose je dovoleno pou??vat runovou magii.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Ale oby?ejn? smrteln?ci mohou pou??vat magii za pomoci kouzeln?ch svitk?.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Mohu ti uk?zat, jak lze z?skat a roz?i?ovat magick? schopnosti.
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"M?g vody Vatras mi pom??e zv??it magickou moc.");
};


instance DIA_Vatras_Teach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 100;
	condition = DIA_Vatras_Teach_Condition;
	information = DIA_Vatras_Teach_Info;
	permanent = TRUE;
	description = "Cht?l bych pos?lit svoji magickou moc.";
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
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Cht?l bych pos?lit svoji magickou moc.
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Tv? magick? moc p?es?hla m? schopnosti.
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
	description = "?ekni mi n?co o boz?ch.";
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
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//?ekni mi n?co o boz?ch.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//Co p?esn? bys cht?l v?d?t?
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"?ekni mi n?co o Innosovi.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"?ekni mi n?co o Adanovi.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"?ekni mi n?co o Beliarovi.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices(DIA_Vatras_GODS);
};

func void DIA_Vatras_GODS_INNOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//?ekni mi n?co o Innosovi.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Velmi dob?e. (k??e) Innos je prvn?m a nejvy???m bohem. Stvo?il slunce a sv?t.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//Ovl?d? sv?tlo a ohe?, sv? dary lidstvu. Je zt?lesn?n?m ??du a spravedlnosti.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Jeho kn??? jsou ohniv? m?gov?, paladinov? jsou jeho v?le?n?ky.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"?ekni mi n?co o Innosovi.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"?ekni mi n?co o Adanovi.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"?ekni mi n?co o Beliarovi.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_ADANOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//?ekni mi n?co o Adanosovi.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Adanos je b?h st?edu. Vymezuje pr?vo a je str??cem rovnov?hy mezi Innosem a Beliarem.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Ovl?d? s?lu p?em?n, jeho darem je voda v?ech oce?n?, jezer a ?ek.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Jeho kn??? jsou vodn? m?gov?, stejn? jako j? jsem slu?ebn?kem a kn?zem Adanosov?m.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"?ekni mi n?co o Innosovi.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"?ekni mi n?co o Adanovi.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"?ekni mi n?co o Beliarovi.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BELIAR()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//?ekni mi n?co o Beliarovi.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Beliar je temn? b?h smrti, zk?zy a v?ech nep?irozen?ch v?c?.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Vede v??nou v?lku s Innosem, ale Adanos bd? nad t?m, aby byly jejich s?ly st?le vyrovnan?.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Pouze n?kolik m?lo lid? n?sleduje vol?n? Beliara - nicm?n? on t?m, kdo tak ?in?, zajist? velkou moc.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"?ekni mi n?co o Innosovi.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"?ekni mi n?co o Adanovi.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"?ekni mi n?co o Beliarovi.",DIA_Vatras_GODS_BELIAR);
};


instance DIA_Vatras_HEAL(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 99;
	condition = DIA_Vatras_HEAL_Condition;
	information = DIA_Vatras_HEAL_Info;
	permanent = TRUE;
	description = "M??e? m? vyl??it?";
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
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//M??e? m? vyl??it?
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//(zbo?n?) Adanosi po?ehnej tomuto t?lu. Zbav ho jeho zran?n? a posil ho nov?m ?ivotem.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//Pr?v? te? nepot?ebuje? ??dn? magick? l??en?.
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
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//M?m zpr?vu pro mistra Isgarotha. St?e?? svatyni p?ed kl??terem.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Kdy? mu ji doru???, z?sk?? odm?nu podle vlastn?ho v?b?ru.
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"Najdi si jin?ho posl??ka, starochu!",DIA_Vatras_MISSION_NO);
	Info_AddChoice(DIA_Vatras_MISSION,"Ud?l?m to.",DIA_Vatras_MISSION_YES);
};

func void B_SayVatrasGo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Dob?e. Tak te? pokra?uj ve sv? cest? k mistru Isgarothovi.
};

func void DIA_Vatras_MISSION_YES()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Ud?l?m to.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//Dobr?, tak si vezmi tu zpr?vu a vyber si jeden z t?chto kouzeln?ch svitk?.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//A? doru??? tu zpr?vu, ?ek? t? n?le?it? odm?na.
	B_GiveInvItems(self,hero,ItWr_VatrasMessage,1);
	MIS_Vatras_Message = LOG_Running;
	Log_CreateTopic(TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Botschaft,LOG_Running);
	B_LogEntry(TOPIC_Botschaft,"Vatras mi p?edal zpr?vu pro mistra Isgarota, kter?ho najdu ve svatyni naproti kl??teru.");
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"Vezmu si kouzlo Sv?tla.",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice(DIA_Vatras_MISSION,"Vybral jsem si l??iv? svitek.",DIA_Vatras_MISSION_HEAL);
	Info_AddChoice(DIA_Vatras_MISSION,"Dej mi Ledov? ??p.",DIA_Vatras_MISSION_ICE);
};

func void DIA_Vatras_MISSION_NO()
{
	AI_Output(other,self,"DIA_ADDON_Vatras_MISSION_NO_15_00");	//Te? ne!
	AI_Output(self,other,"DIA_ADDON_Vatras_MISSION_NO_05_01");	//??dn? probl?m. Po?lu n?koho jin?ho.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_HEAL()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Vybral jsem si l??iv? svitek.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_LightHeal,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_ICE()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Dej mi Ledov? ??p.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_Icebolt,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_LIGHT()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Vezmu si kouzlo Sv?tla.
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
	description = "Doru?il jsem tvou zpr?vu.";
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
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Doru?il jsem tvou zpr?vu.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//P?ijmi m? d?ky. A te? si vezmi svou odm?nu.
	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"1 kr?lovsk? ??ov?k",DIA_Vatras_MESSAGE_SUCCESS_Plant);
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
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//Sly?te, lid?! Je m? pot?eba n?kde jinde.
		if(dauer == kurz)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//Nebude to m?t dlouh?ho trv?n?. A? se vr?t?m, dopov?m v?m zbytek p??b?hu.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Nev?m, jestli se je?t? vr?t?m. Pokud chcete zn?t konec, p?e?t?te si ten p??b?h v P?smu.
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Adanos s v?mi!
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
	description = "M?m probl?m s Innosov?m Okem.";
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
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_00");	//M?m probl?m s Innosov?m okem. Pot?ebuju tvoji podporu.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_01");	//Budu kv?li tomu muset opustit m?sto?
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_02");	//To nev?m. Mo?n?.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_03");	//?ek?m na svou n?hradu u? p?r dn?. Ostatn? m?gov? Vody by se u? m?li vr?tit.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_04");	//Ujisti se, ?e po?lou n?hradn?ka a j? ti pomohu.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	Log_CreateTopic(TOPIC_Addon_VatrasAbloesung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung,LOG_Running);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung,"Vatras mi nem??e pomoci s probl?mem 'Innosova Oka' dokud ve m?st? nebude jin? m?g Vody, kter? ho zastoup?.");
};


instance DIA_Addon_Vatras_AddonSolved(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_AddonSolved_Condition;
	information = DIA_Addon_Vatras_AddonSolved_Info;
	description = "N?hrada dorazila.";
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
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_00");	//N?hrada dorazila.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_01");	//Je v?e v po??dku za severo-v?chodn?mi horami?
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_02");	//Ano. Raven je mrtv? a u? nep?edstavuje ??dnou hrozbu.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_03");	//To je vskutku dobr? zpr?va. Doufejme, ?e podobn? v?ci se u? nikdy nestanou.
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_04");	//TE? ti mohu pomoci s tv?m mal?m probl?mem.
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_05");	//Pokud si dob?e pamatuji, t?kalo se to Innosova Oka ?e?
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
	description = "Innosovo oko je rozbit?.";
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
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Pos?l? m? Pyrokar.
	}
	else if(MIS_Xardas_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Pos?l? m? Xardas.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Innosovo oko je rozbit?.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//J? v?m. Sly?el jsem o tom od n?jak?ch velmi rozru?en?ch novic?.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//P?tra?i zneu?ili Kruh slunce m?g? Ohn? ke zni?en? Oka.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//?ekl bych, ?e jsou ovl?d?ni nep??telem.
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Po tomhle m?st? se novinky ???? rychle.",DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten);
	if((hero.guild == GIL_KDF) && (MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running))
	{
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Pro? si Pyrokar ze v?ech lid? vybral pr?v? tebe?",DIA_Vatras_INNOSEYEKAPUTT_warumdu);
	};
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Co se stane s Okem te??",DIA_Vatras_INNOSEYEKAPUTT_Auge);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Co se stane s Okem te??
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Mus?me ho znovu spravit. Ale boj?m se, ?e to nebude jen tak.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Obj?mka se rozbila na dva kusy. Zru?n? kov?? by si s t?m m?l um?t poradit.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Ale tohle nen? ten probl?m. Co mi d?l? starosti, je samotn? drahokam.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Je matn? a bez moci. Zd? se, ?e nep??tel p?esn? v?d?l, jak ho oslabit.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Kde bych na?el kov??e, kter? by to dok?zal opravit?",DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Jak m??e drahokam z?skat zp?t svoji s?lu?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Jak m??e drahokam z?skat zp?t svoji s?lu?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Vid?m jen jedinou cestu. Spojen? t?? vl?dnouc?ch boh? by mohlo zajistit pot?ebn? efekt.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//Dob?e p?ipraven? ritu?l zvratu proveden? na m?st? zni?en? vr?t? drahokamu jeho s?lu.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Nicm?n?, probl?m je, ?e na to m?sto mus?? dostat pozemsk? z?stupce ka?d?ho ze t?? boh?.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Nav?c je pot?eba mnoho tr?vy z ba?in. Odhaduju, ?e to budou nejm?n? t?i st?bla.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Kdo by m?li b?t ti t?i pozem?t? z?stupci boh??",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Kde najdu tu tr?vu z ba?in?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Kde najdu tu tr?vu z ba?in?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Sly?el jsem o star? masti?k??ce v les?ch, co si ??k? Sagitta. Mohla by ti ty rostliny prodat.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Ale taky bys mohl zkusit ?t?st? dole v p??stavu.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Kdo by m?li b?t ti t?i pozem?t? z?stupci boh??
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Adanose bych m?l zastupovat j? s?m.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Pyrokar, nejvy??? ohniv? m?g, bude ten prav? p?edstavitel boha Innose.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Ale pro Beliara nev?m, koho vybrat. Mus? to b?t n?kdo, kdo ovl?d? ?ernou magii.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"?ernou magii? Co Xardas?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//?ernou magii? Co Xardas?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//To je ono. To by mohlo fungovat.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Ale pt?m se s?m sebe, jak ty t?i dostat k sob?.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Dok??u si p?edstavit, jak se Pyrokar bude tv??it, a? se dozv?, ?e mus? spolupracovat s Xardasem.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"U? mus?m j?t.",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Kde najdu kov??e schopn?ho opravit obj?mku Oka?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Poptej se tady po okol? po n?kom, kdo um? opravit ?perk.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Pro? si Pyrokar ze v?ech lid? vybral pr?v? tebe?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//M?l jsem podez?en?, ?e se d??ve ?i pozd?ji n?co podobn?ho p?ihod?.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Pyrokar se v?dycky pova?oval za tak nezraniteln?ho a mocn?ho, ?e to skoro hrani?ilo s nerozv??nost?.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//Proto byla jeho opat?en? na ochranu Oka tak? tak... ehm, lajd?ck?.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//Prost? si mysl?m, ?e mimovoln? spol?hal na schopnosti, je? mi Adanos prop?j?il.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Rad?ji ani nemysl?m na to, co by se mohlo st?t, kdybych te? nebyl k dispozici.
};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//Po tomhle m?st? se novinky ???? rychle.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//Taky dob?e. Nep??tel se stejn? bude m?t na pozoru.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//U? mus?m j?t.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Mus?m vyrazit a p?ipravit v Kruhu slunce ten ritu?l.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Po?li tam Xardase a Pyrokara. A nezapome? p?in?st tr?vu z ba?in. Spol?h?m na tebe.
	B_LogEntry(TOPIC_INNOSEYE,"Podle Vatrase mohu Oku navr?tit moc pouze tak, ?e vykon?m ritu?l v kruhu Slunce. Mus?m ov?em p?im?t Xardase a Pyrokara, aby se ho tak? z??astnili, a z?rove? naj?t kov??e, kter? dok??e rozbit? amulet opravit.");
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
	description = "Jak se to m? s Innosov?m okem?";
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
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//Jak se to m? s Innosov?m okem?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Pamatuj: jedin? ritu?l zvratu v Kruhu slunce spole?n? s Xardasem a Pyrokarem m??e Oku navr?tit s?lu.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//A nezapome? p?in?st Oko s opravenou obj?mkou.
};


instance DIA_Vatras_BEGINN(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 31;
	condition = DIA_Vatras_BEGINN_Condition;
	information = DIA_Vatras_BEGINN_Info;
	description = "Ud?lal jsem v?e, co jsi ?ekl. Tady je opraven? Oko.";
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
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Ud?lal jsem v?e, co jsi ?ekl. Tady je opraven? Oko.
	B_GivePlayerXP(XP_RitualInnosEyeRuns);
	B_GiveInvItems(other,self,ItMi_InnosEye_Discharged_Mis,1);
	Npc_RemoveInvItem(self,ItMi_InnosEye_Discharged_Mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//Te? u? nic nebr?n? proveden? ritu?lu.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//A co tr?va z ba?in?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//?, ano. Tak m?? ty t?i rostlinky?
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Ahem. Ano. Tady jsou ty t?i rostlinky.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//V?born?.
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Ne. Bohu?el ne.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Dobr?. Tak to budeme muset ud?lat bez nich.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Ud?lals to dob?e, ale te? se postav kousek stranou, a? m??eme za??t s ritu?lem. Nech? se na?e du?e spoj?.
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
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Hotovo. Poda?ilo se n?m p?ekazit nep??teli pl?ny a opravit Oko.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//A? ti Pyrokar vysv?tl?, jak pou??vat jeho s?lu.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Douf?m, ?e se je?t? uvid?me, a? dokon??? svou misi. Sbohem.
	B_LogEntry(TOPIC_INNOSEYE,"Oko je ji? v po??dku. Pyrokar mi je vyd? a pak p?jdu lovit draky.");
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
	description = "D?ky za pomoc p?i obnoven? s?ly Innosova oka.";
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
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//D?ky za pomoc p?i obnoven? s?ly Innosova oka.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Nepl?tvej tak sv?mi d?ky. Tv?j nejv?t?? ?kol na tebe je?t? ?ek?.
	if(MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Promluv si s Pyrokarem, vysv?tl? ti v?echno ostatn?.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Douf?m, ?e t? je?t? uvid?m ?iv?ho a zdrav?ho, m?j synu.
};


instance DIA_Vatras_HILDAKRANK(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 34;
	condition = DIA_Vatras_HILDAKRANK_Condition;
	information = DIA_Vatras_HILDAKRANK_Info;
	description = "Lobartov? ?en? Hild? je ?patn?.";
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
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//Lobartov? ?en? Hild? je ?patn?.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Co? U? zase? Ta dobr? ?ena by na sebe m?la d?vat v?t?? pozor.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Jedna tuh? zima a u? tu s n?mi nebude. Dobr?, d?m ti pro ni medic?nu, co potla?? hore?ku.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//A v??, kdy? u? jsi v tom, m?l bys na sebe taky d?vat pozor.
	CreateInvItems(self,ItPo_HealHilda_MIS,1);
	B_GiveInvItems(self,other,ItPo_HealHilda_MIS,1);
};


instance DIA_Vatras_OBSESSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 35;
	condition = DIA_Vatras_OBSESSION_Condition;
	information = DIA_Vatras_OBSESSION_Info;
	description = "M?m podivn? pocity ?zkosti.";
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
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//M?m podivn? pocity ?zkosti.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Taky nevypad?? moc dob?e. Byl jsi vystaven ?ern?mu pohledu P?tra?? p??li? dlouhou dobu.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//V?echno, co svedu l??it, je tvoje t?lo, ale jedin? v kl??te?e mohou o?istit tvou du?i. Promluv si s Pyrokarem. Pom??e ti.
};


instance DIA_Vatras_AllDragonsDead(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 59;
	condition = DIA_Vatras_AllDragonsDead_Condition;
	information = DIA_Vatras_AllDragonsDead_Info;
	description = "Ti draci u? ??dnou spou?? nezp?sob?.";
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
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Ti draci u? ??dnou spou?? nezp?sob?.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//V?d?l jsem, ?e se vr?t?? ?iv? a zdrav?. Nicm?n?, je?t? po??d m?? tu nejv?t?? p?ek??ku p?ed sebou.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//J? v?m.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Tak se po??dn? p?iprav a p?ij? za mnou, kdykoli bude? n?co pot?ebovat. Tak? po??d u sebe nos Innosovo oko, sly???? Nech? ti Adanos ?ehn?.
};


instance DIA_Vatras_KnowWhereEnemy(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_KnowWhereEnemy_Condition;
	information = DIA_Vatras_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "V?m, kde jsou na?i nep??tel?.";
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
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//V?m, kde jsou na?i nep??tel?.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Tak to u? nesm?me ztr?cet ?as. Mus?me je vyhledat d??v, ne? si pro n?s p?ijdou.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Chce? se ke mn? p?idat?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//Dlouho jsem o tom p?em??lel a nikdy jsem si nebyl ni??m tak jist?, p??teli.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Vatras mi p?ekvapiv? nab?dl, ?e m? na cest? doprovod?. Mu? s jeho dovednostmi a zku?enostmi pro m? bude jist? velmi cenn?.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//U? m?m skupinu plnou. Ob?v?m se, ?e pro tebe nezbylo m?sto.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Tak ho n?jak ud?lej. Pot?ebuje? m?.
	}
	else
	{
		Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Je?t? o tom pop?em??l?m.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Pova?uju za velkou poctu m?t t? po sv?m boku.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

func void DIA_Vatras_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Pova?uju za velkou poctu m?t t? po sv?m boku. Uvid?me se v p??stavu.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//A? ti to netrv? moc dlouho. Nep??tel nikdy nesp?, p??teli.
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
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Je?t? o tom pop?em??l?m.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Jak je libo. Vra? se, jestli si to rozmysl??.
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
	description = "Rad?ji bys m?l z?stat tady. M?sto t? pot?ebuje.";
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
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Rad?ji bys m?l z?stat tady. M?sto t? pot?ebuje.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Mo?n? m?? pravdu. Ale stejn? se k tob? p?id?m, jestli m?? z?jem. To snad v??.
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
	description = "Poje? se mnou na nep??telsk? ostrov.";
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
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Poje? se mnou na nep??telsk? ostrov.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//Moudr? rozhodnut?. Douf?m, ?e se toho bude? dr?et.
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

