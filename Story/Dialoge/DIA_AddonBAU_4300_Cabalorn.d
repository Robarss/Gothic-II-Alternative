
func int C_BragoBanditsDead()
{
	if((Npc_IsDead(Ambusher_1013) || (Bdt_1013_Away == TRUE)) && Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015))
	{
		return TRUE;
	};
	return FALSE;
};


instance DIA_Addon_Cavalorn_EXIT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 999;
	condition = DIA_Addon_Cavalorn_EXIT_Condition;
	information = DIA_Addon_Cavalorn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cavalorn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cavalorn_PICKPOCKET(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 900;
	condition = DIA_Addon_Cavalorn_PICKPOCKET_Condition;
	information = DIA_Addon_Cavalorn_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Tyto šípy se dají snadno štípnout)";
};


func int DIA_Addon_Cavalorn_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (25 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Cavalorn_PICKPOCKET,Dialog_Back,DIA_Addon_Cavalorn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Cavalorn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Cavalorn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cavalorn_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 25)
	{
		B_GiveInvItems(self,other,ItRw_Arrow,44);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Addon_Cavalorn_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Addon_Cavalorn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_PICKPOCKET);
};


instance DIA_Addon_Cavalorn_MeetingIsRunning(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = DIA_Addon_Cavalorn_MeetingIsRunning_Condition;
	information = DIA_Addon_Cavalorn_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Cavalorn_MeetingIsRunning_OneTime;

func int DIA_Addon_Cavalorn_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_MeetingIsRunning_Info()
{
	if(DIA_Addon_Cavalorn_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_MeetingIsRunning_08_00");	//Vítej v 'Kruhu' příteli.
		DIA_Addon_Cavalorn_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_08_01");	//Vatras mi dal jinej úkol.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cavalorn_HALLO(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HALLO_Condition;
	information = DIA_Addon_Cavalorn_HALLO_Info;
	description = "Problémy?";
};


func int DIA_Addon_Cavalorn_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_HALLO_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_15_00");	//Problémy?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_01");	//Zatraceně. Nevěděl jsem, kde se schovávaj. Dostal jsi jednoho a za chvíli budou zpátky.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_02");	//(uličnicky) Moment. Já tě znám. Ty jsi ten chlápek, který u mě stále žebral v kolonii šípy.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Jmenuješ se Cavalorn, že?",DIA_Addon_Cavalorn_HALLO_Ja);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Těžko si vzpomínám.",DIA_Addon_Cavalorn_HALLO_weissNicht);
};

func void DIA_Addon_Cavalorn_HALLO_weissNicht()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_weissNicht_15_00");	//Těžko si vzpomínám.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_weissNicht_08_01");	//No tak! Učil jsem tě lukostřelbu a plížení v mé chatrči blízko Starého tábora. Už ti svítá?
};

func void DIA_Addon_Cavalorn_HALLO_Ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Ja_15_00");	//Jmenuješ se Cavalorn, že?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_01");	//Á. Vidím, že jsi na mě nezapomněl po tom všem, čím jsme prošli v té zatracené kolonii.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_02");	//Kam jinak jdeš?
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Nemám žádný určitý cíl.",DIA_Addon_Cavalorn_HALLO_keinZiel);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Zpátky do Hornického údolí. ",DIA_Addon_Cavalorn_HALLO_Bauern);
	if(Mil_310_Stadtwache.aivar[AIV_PASSGATE] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Do města.",DIA_Addon_Cavalorn_HALLO_Stadt);
	};
};

func void DIA_Addon_Cavalorn_HALLO_Stadt()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Stadt_15_00");	//Do města.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_01");	//(směje se) To vidím. Do města.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_02");	//Můžeš se dostat do problémů s městskou stráží. Nenechají kdekoho projít po tom, co bylo tohle místo zamořeno bandity.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_03");	//Jeden z těch starých Sektářů z Hornického údolí přišel před několika dny. Řekl, že se dostane do Khorinisu a ven kdy chce.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_04");	//Vydal se do údolí pod tou velkou věží. Někde tam blízko vodopádu musí být cesta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_05");	//Možná by sis s ním měl promluvit.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_Bauern()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Bauern_15_00");	//Zpátky do Hornického údolí.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_01");	//(překvapeně) Opravdu? Hmm. Rád bych, můžu tě následovat, ale musím si ještě vyjasnit pár věcí.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_02");	//Pokud se dostaneš do Hornického údolí - mohl bys zjistit jestli má chatrč ještě stojí? Rád bych se tam jednoho dne vrátil.
	MIS_Addon_Cavalorn_TheHut = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_CavalornTheHut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut,LOG_Running);
	B_LogEntry(TOPIC_Addon_CavalornTheHut,"Lovec Cavalorn mě požádal, abych se v případě, že se dostanu do hornického údolí, podíval, jestli ještě stojí jeho lovecká chata, ležící severně od bývalého Starého tábora.");
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_keinZiel()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_keinZiel_15_00");	//Nemám žádný určitý cíl.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_keinZiel_08_01");	//Nechceš mi to říct - správně? Žádný problém.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};


instance DIA_Addon_Cavalorn_Beutel(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Beutel_Condition;
	information = DIA_Addon_Cavalorn_Beutel_Info;
	description = "Byl jsem v tvé chatrči v Hornickém údolí.";
};


func int DIA_Addon_Cavalorn_Beutel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || (SC_OpenedCavalornsBeutel == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Beutel_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_00");	//Byl jsem v tvé chatrči v Hornickém údolí.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_01");	//Takže to stále stojí.
	if(MIS_Addon_Cavalorn_TheHut == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_02");	//Ano. A také vím, co jsi tam chtěl.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_03");	//Našel jsi to?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_04");	//Pokud myslíš tvůj sáček s hrudkami rudy ... ano, mám ho.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_05");	//Jsi starej lišák, víš o tom.
	if(MIS_Addon_Cavalorn_TheHut == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_06");	//Co dalšího chceš z té staré chatrče. Nic tam nezbylo.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_07");	//Máš to s sebou? Dám ti za to 100 zlaťáků.
	TOPIC_End_CavalornTheHut = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	if(Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Jasně.",DIA_Addon_Cavalorn_Beutel_ja);
	}
	else if(Npc_HasItems(other,ItMi_Nugget))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Ne, ale mám tady tuhle hroudu rudy.",DIA_Addon_Cavalorn_Beutel_jaerz);
	};
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Ne.",DIA_Addon_Cavalorn_Beutel_no);
};

func void DIA_Addon_Cavalorn_Beutel_back()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	AI_Output(self,other,"DIA_Addon_Cavalorn_back_08_00");	//Doufám, že to brzy dostanu zpět.
};

func void DIA_Addon_Cavalorn_Beutel_jaerz()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_jaerz_15_00");	//Ne, ale mám tady tuhle hroudu rudy.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_jaerz_08_01");	//Taky dobře.
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Tak jako tak, proč jsi si to nevzal?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_ja_15_00");	//Jasně.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_ja_08_01");	//Super.
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Tak jako tak, proč jsi si to nevzal?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_no()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_00");	//Ne.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_no_08_01");	//Tak se vrať pro tu věc ZNOVU. Přes veškeré úsilí pro to asi budu muset do toho zatraceného údolí sám.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_02");	//Jsem tak dotčen.
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Tak jako tak, proč jsi si to nevzal?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_why()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_why_15_00");	//Tak jako tak, proč jsi si to nevzal?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//Kdo si mohl myslet, že ruda je tady v Khorinisu tak cenná?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//V kolonii jsi nedostal za takovouhle hrudku rudy ani místo na spaní.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//V přístavu ti témeř rozbijou hlavu, pokud zjití, že máš u sebe rudu.
};


instance DIA_Addon_Cavalorn_ErzGeben(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ErzGeben_Condition;
	information = DIA_Addon_Cavalorn_ErzGeben_Info;
	description = "Dej mi 100 zlaťáků, pak ti vrátím rudu.";
};


func int DIA_Addon_Cavalorn_ErzGeben_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Beutel) && (Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || Npc_HasItems(other,ItMi_Nugget)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ErzGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ErzGeben_15_00");	//Dej mi 100 zlaťáků, pak ti vrátím rudu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_01");	//Ujednáno. Tady máš.
	CreateInvItems(self,ItMi_Gold,100);
	B_GiveInvItems(self,other,ItMi_Gold,100);
	if(B_GiveInvItems(other,self,ItSe_ADDON_CavalornsBeutel,1) == FALSE)
	{
		B_GiveInvItems(other,self,ItMi_Nugget,1);
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_02");	//Jsi opravdový přítel. Děkuji ti.
	MIS_Addon_Cavalorn_TheHut = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_CavalornsBeutel);
};


instance DIA_Addon_Cavalorn_WASMACHSTDU(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_WASMACHSTDU_Condition;
	information = DIA_Addon_Cavalorn_WASMACHSTDU_Info;
	description = "Co tady děláš?";
};


func int DIA_Addon_Cavalorn_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WASMACHSTDU_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WASMACHSTDU_08_01");	//Uvízl jsem. Kdyby to nebylo těch zatraceným banditů, asi bych tu nebyl.
};


instance DIA_Addon_Cavalorn_Banditen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 10;
	condition = DIA_Addon_Cavalorn_Banditen_Condition;
	information = DIA_Addon_Cavalorn_Banditen_Info;
	description = "Co banditi?";
};


func int DIA_Addon_Cavalorn_Banditen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_WASMACHSTDU) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Banditen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_00");	//Co banditi?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_01");	//Zaspal jsi snad celý minulý týden?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_02");	//Ehm ...
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_03");	//Mluvím o té havěti z trestanecké kolonie - rozlézají se po krajině, drancují a vraždí.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_04");	//(povzdech) Jsem rád, že mě nechali naživu. Jednou nedávám pozor a oni mě praští zezadu do hlavy.
	if(C_BragoBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_05");	//Nenapadá mě žádný způsob, jak dostat moje věci zpět.
	};
};


instance DIA_Addon_Cavalorn_ARTEFAKT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ARTEFAKT_Condition;
	information = DIA_Addon_Cavalorn_ARTEFAKT_Info;
	description = "Ty jsi byl okraden bandity?";
};


func int DIA_Addon_Cavalorn_ARTEFAKT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen) && (MIS_Addon_Cavalorn_KillBrago != LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ARTEFAKT_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ARTEFAKT_15_00");	//Ty jsi byl okraden bandity?
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_01");	//(zachmuřeně) Jo. Srazili mě a nechali jako jídlo pro gobliny.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_02");	//Byly tam zatraceně důležité věci. Dopis a všechny moje peníze. Prostě to musím dostat zpět.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_03");	//Nicméně, bez podpory tam nejdu. Ta zbabělá tlupa kriminálníků ...
};


instance DIA_Addon_Cavalorn_HELFEN(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HELFEN_Condition;
	information = DIA_Addon_Cavalorn_HELFEN_Info;
	description = "Můžu ti pomoci s bandity?";
};


func int DIA_Addon_Cavalorn_HELFEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_ARTEFAKT) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS) && (C_BragoBanditsDead() == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_HELFEN_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HELFEN_15_00");	//Můžu ti pomoci s bandity?
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_01");	//(uličnicky) Možná. Ale z tvého ztrápeného zjevu ti můžu říct, že jsi nedržel opravdový meč celé týdny.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_02");	//Dobrá. Pravděpodobně nemám jinou volbu než přijmout tvoji nabídku. Nemám moc času.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_03");	//Takže poslouchej. Dole po tehle cestě je jedna z těch špinavých děr v zemi, ve kterých se banditi rádi schovávají.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_04");	//Ti kriminálníci tady, jsou ti, kteří mi ukradli moje věci.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_05");	//Řekni mi až budeš připraven a půjdem na tu pakáž.
	MIS_Addon_Cavalorn_KillBrago = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_KillBrago,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillBrago,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillBrago,"Cavalorn byl okraden bandity o velmi důležité věci. Odmítá s nimi bojovat sám a tak mě požádal o pomoc.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_Addon_Cavalorn_AUSRUESTUNG(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_AUSRUESTUNG_Condition;
	information = DIA_Addon_Cavalorn_AUSRUESTUNG_Info;
	description = "Potřebuju lepší vybavení.";
};


func int DIA_Addon_Cavalorn_AUSRUESTUNG_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago != 0) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_AUSRUESTUNG_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_00");	//Potřebuju lepší vybavení.
	if(C_BragoBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_01");	//Ty prasata mě toho moc nenechali.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_02");	//Můžu ti dát vlčí nůž. Stačí to?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_03");	//Nůž stačí.
	CreateInvItems(self,ItMW_Addon_Knife01,1);
	B_GiveInvItems(self,other,ItMW_Addon_Knife01,1);
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_04");	//Ale co nějaké lektvary?
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_05");	//Zbyly mi dva léčivé lektvary. Máš zájem?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_06");	//Jasně. Vezmu si je.
	CreateInvItems(self,ItPo_Health_01,2);
	B_GiveInvItems(self,other,ItPo_Health_01,2);
};


instance DIA_Addon_Cavalorn_LETSKILLBANDITS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition;
	information = DIA_Addon_Cavalorn_LETSKILLBANDITS_Info;
	description = "Pojďme zabít ty flákače.";
};


func int DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago == LOG_Running) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS) && (C_BragoBanditsDead() == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_LETSKILLBANDITS_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00");	//Pojďme zabít ty flákače.
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01");	//Dobrá. Prostě mi hlídej záda, jasné?
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02");	//To mají za to sprosté přepadení.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KillBandits");
	if(Bdt_1013_Away == FALSE)
	{
		Ambusher_1013.aivar[AIV_EnemyOverride] = FALSE;
	};
	Ambusher_1014.aivar[AIV_EnemyOverride] = FALSE;
	Ambusher_1015.aivar[AIV_EnemyOverride] = FALSE;
};

func void B_Addon_Cavalorn_VatrasBrief()
{
	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_00");	//Na poslední chvíli můžu svoje poslání dokončit. Už jsem ztratil moc času.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_01");	//Jaký rozkaz?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_02");	//(pro sebe) Oh. Ano. Musím se dostat do města a později ...
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_03");	//(povzdech) Jenom nevím, jak to splnit včas.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_04");	//A co já?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_05");	//(přemýšlí) Hmm. Proč ne. Ty můžeš doručit dopis do města.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_06");	//To mě dá trochu času, abych se mohl podívat po svém vybavení.
	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_07");	//Jeden z banditů by měl mít dopis v kapse.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_08");	//Dones to Vatrasovi, mágovi Vody ve městě. Zastihneš ho v Adanosově chrámu, kde celý den káže.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_09");	//Řekni mu, že jsem to nezvládl včas.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_10");	//A když se zeptá, kde jsem - řekni mu, že mířím na místo setkání.
		B_LogEntry(TOPIC_Addon_KDW,"Mága Vody Vatrase můžu najít v přístavním městě Khorinis. Dělá kázání v Adanosově chrámu.");
	};
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE) && (Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_11");	//A ještě jedna věc: Kup si nějaký vhodný oděv od farmáře.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_12");	//Jinak si budou myslet, že jsi bandita. Tady máš trochu peněz.
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
	};
	MIS_Addon_Cavalorn_KillBrago = LOG_SUCCESS;
	if(MIS_Addon_Cavalorn_Letter2Vatras == 0)
	{
		MIS_Addon_Cavalorn_Letter2Vatras = LOG_Running;
	};
	Npc_ExchangeRoutine(self,"Start");
	B_GivePlayerXP(XP_Addon_Cavalorn_KillBrago);
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_Addon_Cavalorn_BragoKilled(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BragoKilled_Condition;
	information = DIA_Addon_Cavalorn_BragoKilled_Info;
	important = TRUE;
};


func int DIA_Addon_Cavalorn_BragoKilled_Condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") < 500) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running) && (C_BragoBanditsDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BragoKilled_Info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_BragoKilled_08_00");	//Tak je to odbytý. Hehe. Neměli si se mnou hrát.
	B_Addon_Cavalorn_VatrasBrief();
};


instance DIA_Addon_Cavalorn_PCKilledBrago(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_PCKilledBrago_Condition;
	information = DIA_Addon_Cavalorn_PCKilledBrago_Info;
	description = "Banditi jsou usmažení.";
};


func int DIA_Addon_Cavalorn_PCKilledBrago_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago == 0) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen) && (C_BragoBanditsDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_PCKilledBrago_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_PCKilledBrago_15_00");	//Banditi jsou usmažení
	B_Addon_Cavalorn_VatrasBrief();
};


instance DIA_Addon_Cavalorn_JUNGS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_JUNGS_Condition;
	information = DIA_Addon_Cavalorn_JUNGS_Info;
	description = "Zajímavé brnění, co nosíš. Už nepatříš ke Stínům?";
};


func int DIA_Addon_Cavalorn_JUNGS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_JUNGS_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_JUNGS_15_00");	//Zajímavé brnění, co nosíš. Už nepatříš ke Stínům?
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_01");	//Stínové? Ti už neexistují po tom, co padla bariéra.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_02");	//V momentě, když jsme mohli opustit Hornické údolí, nebyl žádný důvod lpět na tom.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_03");	//Teď pracuji pro mágy Vody. Patřím do 'Kruhu vody'.
	SC_KnowsRanger = TRUE;
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Cavalorn mi řekl o tajné gildě, do které sám patří. O takzvaném 'Kruhu vody'.");
	Cavalorn_RangerHint = TRUE;
};


instance DIA_Addon_Cavalorn_Ring(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Ring_Condition;
	information = DIA_Addon_Cavalorn_Ring_Info;
	permanent = FALSE;
	description = "Řekni mi více o 'Kruhu Vody'.";
};


func int DIA_Addon_Cavalorn_Ring_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ring_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ring_15_00");	//Řekni mi více o 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_01");	//Nemám povolení se o tom s tebou bavit.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_02");	//Všechno co můžu udělat, je poslat tě za Vatrasem. Je zástupcem mágů Vody v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_03");	//Bude nejlepší, když si s ním promluvíš. Řekni mu, že jsem tě poslal.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_04");	//Možná, že tě přijme do Kruhu. Zoufale potřebujeme dobré lidi ...
	B_LogEntry(TOPIC_Addon_RingOfWater,"Mág Vody Vatras mě může příjmout do 'Kruhu vody'. Mám se u něj zastavit a říct, že mě posílá Cavalorn.");
};


instance DIA_Addon_Cavalorn_Feinde(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_Feinde_Condition;
	information = DIA_Addon_Cavalorn_Feinde_Info;
	permanent = FALSE;
	description = "Nebyl jsi ty a vaši lidé nepřátelmi mágů Vody?.";
};


func int DIA_Addon_Cavalorn_Feinde_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Feinde_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Feinde_15_00");	//Nebyl jsi ty a vaši lidé nepřátelé mágů Vody?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_01");	//Ta debilní minulost skončila. Už není žádný "Nový" nebo "Starý" tábor.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_02");	//Teď - protože už není žádná trestanecká kolonie, každý je zodpovědný sám za sebe.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_03");	//Mnoho z bývalých trestanců je ale pořád ještě stíháno.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_04");	//Mágové Vody byli schopní pro mě sehnat odpuštění - takže se můžu teď volně pohybovat.
};


instance DIA_Addon_Cavalorn_KdWTask(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_KdWTask_Condition;
	information = DIA_Addon_Cavalorn_KdWTask_Info;
	permanent = FALSE;
	description = "Co dělají mágové Vody teď?";
};


func int DIA_Addon_Cavalorn_KdWTask_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_KdWTask_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_00");	//Co dělají mágové Vody teď?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_01");	//Jdou po něčem velkém. Je to o neznámé části ostrova.
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_02");	//Neznámá část? Kde může být?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_03");	//Nemůžu ti říct víc. Promluv si s Vatrasem v Khorinisu.
};


instance DIA_Addon_Cavalorn_BroughtLetter(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BroughtLetter_Condition;
	information = DIA_Addon_Cavalorn_BroughtLetter_Info;
	description = "Dal jsem Vatrasovi tvůj dopis.";
};


func int DIA_Addon_Cavalorn_BroughtLetter_Condition()
{
	if((MIS_Addon_Cavalorn_Letter2Vatras == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BroughtLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BroughtLetter_15_00");	//Dal jsem Vatrasovi tvůj dopis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BroughtLetter_08_01");	//Neočekával jsem od tebe nic jiného. Děkuju ti.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Cavalorn_Ornament(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_Ornament_Condition;
	information = DIA_Addon_Cavalorn_Ornament_Info;
	description = "Hledáš něco?";
};


func int DIA_Addon_Cavalorn_Ornament_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_00");	//Hledáš něco?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_01");	//Tak zřejmé? Ano, poslali mě mágové Vody, abych našel ornamenty.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_02");	//To je náhoda. Dostal jsem ten samý úkol od Nefaria.
	if(SC_KnowsRanger == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_03");	//Ty tedy patříš do 'Kruhu vody'?
		if(SC_IsRanger == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_04");	//Ano.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_05");	//Zatím ne, ale pracuji na tom.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_06");	//To je dobře. Pak to nemusím dělat sám.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_07");	//Už jsi našel ornament?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_08");	//Našel jsem místo, kde pravděpodobně jeden najdeme.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_09");	//Tyhle kamenné kruhy můžou být jedny z těch stavení, které Nefarius popisoval.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_10");	//Teď potřebujeme jen najít mechanismus.
};


instance DIA_Addon_Cavalorn_Triggered(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Triggered_Condition;
	information = DIA_Addon_Cavalorn_Triggered_Info;
	description = "Aktivoval jsem mechanizmus. Nic se ale nestalo.";
};


func int DIA_Addon_Cavalorn_Triggered_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ornament) && (ORNAMENT_SWITCHED_FARM == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Triggered_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_15_00");	//Aktivoval jsem mechanizmus. Nic se ale nestalo.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_01");	//Potom měli Lobartovi rolníci pravdu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_02");	//Řekli, že někdo jiný se potloukal okolo těch kamenů.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_03");	//Najednou se objevil kamenný strážce a zaútočil na ně.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_04");	//Farmáři zavolali pro domobranu, vojáci domobrany paladiny, kteří přišli a zničili to monstrum.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_05");	//Už jsem prohledal celé okolí. Jestli tady byl oranment, mají ho teď paladinové.
	Info_ClearChoices(DIA_Addon_Cavalorn_Triggered);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"Pak se jeden z nás musí dostat do horní části města.",DIA_Addon_Cavalorn_Triggered_Pal);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"Pak za nimi zajdu a získám ornament.",DIA_Addon_Cavalorn_Triggered_OBack);
};

func void B_Cavalorn_Triggered_Wohin()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Wohin_08_00");	//Půjdu teď do města. Setkáme se u Vatrase.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Stadt");
	Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
	B_LogEntry(TOPIC_Addon_Ornament,"Jeden ze ztracených ornamentů mají paladinové ve městě.");
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_Running;
	self.flags = 0;
};

func void DIA_Addon_Cavalorn_Triggered_OBack()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,ITAR_Bau_L,1);
	Npc_RemoveInvItems(self,ITAR_RANGER_Addon,Npc_HasItems(self,ITAR_RANGER_Addon));
	Npc_RemoveInvItems(self,ITAR_Fake_RANGER,Npc_HasItems(self,ITAR_Fake_RANGER));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_OBack_15_00");	//Pak za nimi zajdu a získám ornament.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_OBack_08_01");	//Dobře.
	B_Cavalorn_Triggered_Wohin();
};

func void DIA_Addon_Cavalorn_Triggered_Pal()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,ITAR_Bau_L,1);
	Npc_RemoveInvItems(self,ITAR_RANGER_Addon,Npc_HasItems(self,ITAR_RANGER_Addon));
	Npc_RemoveInvItems(self,ITAR_Fake_RANGER,Npc_HasItems(self,ITAR_Fake_RANGER));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_Pal_15_00");	//Pak se jeden z nás musí dostat do horní části města.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Pal_08_01");	//Já na to nemám čas. Musíš to udělat ty.
	B_Cavalorn_Triggered_Wohin();
};


instance DIA_Addon_Cavalorn_GotOrnaFromHagen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition;
	information = DIA_Addon_Cavalorn_GotOrnaFromHagen_Info;
	description = "Získal jsem chybějící ornament od Lorda Hagena.";
};


func int DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition()
{
	if(Lord_Hagen_GotOrnament == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_GotOrnaFromHagen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00");	//Získal jsem chybějící ornament od Lorda Hagena.
	AI_Output(self,other,"DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01");	//Vidíš? Já věděl, že ho paladinové mají.
	B_GivePlayerXP(XP_Ambient);
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_SUCCESS;
};


instance DIA_Addon_Cavalorn_WannaLearn(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 7;
	condition = DIA_Addon_Cavalorn_WannaLearn_Condition;
	information = DIA_Addon_Cavalorn_WannaLearn_Info;
	permanent = FALSE;
	description = "Můžeš mě něco naučit?";
};


func int DIA_Addon_Cavalorn_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (C_BragoBanditsDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WannaLearn_15_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01");	//Jasně. Znám to. Chlape - pronásledovali tě za dobré, co?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_02");	//Nic si nepamatuješ, že?
	Cavalorn_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(Topic_OutTeacher,LOG_NOTE);
	B_LogEntry(Topic_OutTeacher,LogText_Addon_Cavalorn_Teach);
};


var int Addon_Cavalorn_Merke_Bow;
var int Addon_Cavalorn_Merke_1h;

instance DIA_Addon_Cavalorn_TEACH(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 8;
	condition = DIA_Addon_Cavalorn_TEACH_Condition;
	information = DIA_Addon_Cavalorn_TEACH_Info;
	permanent = TRUE;
	description = "Chci se naučit tvoje schopnosti.";
};


func int DIA_Addon_Cavalorn_TEACH_Condition()
{
	if(Cavalorn_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_TEACH_Choices()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,Dialog_Back,DIA_Addon_Cavalorn_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString("Plížení",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),DIA_Addon_Cavalorn_Teach_Sneak);
	};
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Addon_Cavalorn_Teach_Bow_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Addon_Cavalorn_Teach_Bow_5);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Cavalorn_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Cavalorn_Teach_1H_5);
};

func void DIA_Addon_Cavalorn_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//Chci se naučit tvoje schopnosti.
	AI_Output(self,other,"DIA_Addon_Cavalorn_TEACH_08_01");	//Jasně, co chceš vědět?
	Addon_Cavalorn_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Addon_Cavalorn_Merke_1h = other.HitChance[NPC_TALENT_1H];
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Sneak()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_Sneak_08_00");	//S lehkým našlapováním, budeš mít lepší šanci se k nepříteli dostat nezpozorován.
	};
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,30);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,30);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Back()
{
	if((Addon_Cavalorn_Merke_Bow < other.HitChance[NPC_TALENT_BOW]) || (Addon_Cavalorn_Merke_1h < other.HitChance[NPC_TALENT_1H]))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00");	//Mnohem lepší. Zapomněl jsi hodně, ale dostaneme tě zpět do formy.
	};
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
};

