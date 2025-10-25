
instance DIA_Akil_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_EXIT_Condition;
	information = DIA_Akil_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_EXIT_Info()
{
	AI_Output(other,self,"DIA_Akil_EXIT_15_00");	//Už musím jít.
	if(Akil_Sauer == TRUE)
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_01");	//Nenech se zdržovat.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_02");	//Tak zatím. Rád bych pro tebe udělal něco víc.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Akil_Hallo(C_Info)
{
	npc = BAU_940_Akil;
	nr = 4;
	condition = DIA_Akil_Hallo_Condition;
	information = DIA_Akil_Hallo_Info;
	permanent = FALSE;
	description = "Nějaké problémy?";
};


func int DIA_Akil_Hallo_Condition()
{
	if(!Npc_IsDead(Alvares) && !Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Akil_Hallo_Info()
{
	AI_Output(other,self,"DIA_Akil_Hallo_15_00");	//Nějaké problémy?
	AI_Output(self,other,"DIA_Akil_Hallo_13_01");	//(potí se)... Eh... ne, ne... Všechno v pořádku. (nervózně) Bylo... bylo by lepší, kdybys hned odešel.
	AI_Output(other,self,"DIA_Akil_Hallo_15_02");	//Jsi si jistý?
	AI_Output(self,other,"DIA_Akil_Hallo_13_03");	//Eh... jo, jo... všechno je dobrý. Ty... eh... Já... teď s tebou nemůžu mluvit.
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere,"Akilův statek ohrožují žoldáci.");
	Akils_SLDStillthere = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Akil_Nichtjetzt(C_Info)
{
	npc = BAU_940_Akil;
	nr = 7;
	condition = DIA_Akil_Nichtjetzt_Condition;
	information = DIA_Akil_Nichtjetzt_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Akil_Nichtjetzt_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_IsDead(Alvares) && !Npc_IsDead(Engardo) && Npc_KnowsInfo(other,DIA_Akil_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Akil_Nichtjetzt_Info()
{
	AI_Output(self,other,"DIA_Akil_Nichtjetzt_13_00");	//Eh... teď ne, teď s tebou nemůžu mluvit.
	AI_StopProcessInfos(self);
};


instance DIA_Akil_NachKampf(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Akil_NachKampf_Condition;
	information = DIA_Akil_NachKampf_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Akil_NachKampf_Condition()
{
	if(Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Akil_NachKampf_Info()
{
	AI_Output(self,other,"DIA_Akil_NachKampf_13_00");	//Díky Innosovi. Už jsem si myslel, že je se mnou konec.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_01");	//Jmenuju se Akil. Obdělávám tenhle skromnej kousek půdy.
	AI_Output(other,self,"DIA_Akil_NachKampf_15_02");	//Kdo byli ti lidé?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_03");	//Ty bys je měl znát. Byli to žoldnéři z Onarovy farmy. Jako ty.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_04");	//To byli žoldáci z Onarovy farmy. Ti bastardi neznají nic než vraždění a rabování.
	};
	AI_Output(self,other,"DIA_Akil_NachKampf_13_05");	//Obával jsem se nejhoršího.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_06");	//(hluboký povzdech)... Dobrá, díky Innosovi, žes nepřišel pozdě. Řekni mi, proč jsi to pro mě udělal?
	Info_ClearChoices(DIA_Akil_NachKampf);
	Info_AddChoice(DIA_Akil_NachKampf,"Jen tak. Prostě abys to přečkal ve zdraví.",DIA_Akil_NachKampf_Ehre);
	Info_AddChoice(DIA_Akil_NachKampf,"Co takhle trochu zlata?",DIA_Akil_NachKampf_Gold);
	Npc_ExchangeRoutine(self,"Start");
	self.flags = 0;
	if(Hlp_IsValidNpc(Kati) && !Npc_IsDead(Kati))
	{
		Npc_ExchangeRoutine(Kati,"Start");
		AI_ContinueRoutine(Kati);
		Kati.flags = 0;
	};
	if(Hlp_IsValidNpc(Randolph) && !Npc_IsDead(Randolph))
	{
		Npc_ExchangeRoutine(Randolph,"Start");
		AI_ContinueRoutine(Randolph);
		Randolph.flags = 0;
	};
	TOPIC_END_AkilsSLDStillthere = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Akil_NachKampf_Ehre()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Ehre_15_00");	//Jen tak. Prostě abys to přečkal ve zdraví.
	AI_Output(self,other,"DIA_Akil_NachKampf_Ehre_13_01");	//Takoví chlapi se už jen tak nevidí. Ať tě na tvých cestách Innos provází.
	B_GivePlayerXP(XP_Akil_SLDWegVomHofEhre);
	Info_ClearChoices(DIA_Akil_NachKampf);
};

func void DIA_Akil_NachKampf_Gold()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Gold_15_00");	//Co takhle trochu zlata?
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_01");	//Je mi líto, ale asi tě zklamu - jsme jen chudí farmáři. Je to tak akorát pro skromné živobytí.
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_02");	//Všechno, co ti můžu nabídnout, je něco k jídlu. Zajdi za Kati, ať se o tebe postará.
	B_GivePlayerXP(XP_Akil_SLDWegVomHof);
	Info_ClearChoices(DIA_Akil_NachKampf);
	Kati_Mahlzeit = TRUE;
};


instance DIA_Akil_Soeldner(C_Info)
{
	npc = BAU_940_Akil;
	nr = 7;
	condition = DIA_Akil_Soeldner_Condition;
	information = DIA_Akil_Soeldner_Info;
	permanent = FALSE;
	description = "Co po tobě ti žoldáci chtěli?";
};


func int DIA_Akil_Soeldner_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf))
	{
		return TRUE;
	};
};

func void DIA_Akil_Soeldner_Info()
{
	AI_Output(other,self,"DIA_Akil_Soeldner_15_00");	//Co po tobě ti žoldáci chtěli?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_01");	//Ty si ze mě utahuješ. Chtěli ode mě vybrat nájem.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_02");	//Ty to nevíš? Najal je Onar, ten velkostatkář. Hlídají jeho farmu a vybírají pro něj renty.
		AI_Output(self,other,"DIA_Akil_Soeldner_13_03");	//To znamená, že chodí od farmy k farmě a berou si vše, co se jim líbí. A jediné, čím platí, je chuť jejich oceli.
	};
};


instance DIA_Addon_Akil_MissingPeople(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Addon_Akil_MissingPeople_Condition;
	information = DIA_Addon_Akil_MissingPeople_Info;
	description = "Slyšels něco o mizejících lidech?";
};


func int DIA_Addon_Akil_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Akil_MissingPeople_15_00");	//Slyšels něco o mizejících obyvatelích?
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_01");	//Ty jsi ale vtipálek. Jestli slyšel? Několik mých vlastních lidí se ztratilo.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_02");	//Tonak a Tabor pracovali na mých polích ještě před 3 dny.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_03");	//A vím jistě, že by farmu neopustili beze slova.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_04");	//Nicméně zmizeli a nikdo mi neřekel, co se stalo.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_05");	//Pokud najdeš alespoň nějaké znamení, že žijí, tak mi to přijď říct. Přijdeš, že?
	B_GivePlayerXP(XP_Ambient);
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Farmář Akil postrádá své dva lidi : Tonaka a Telbora.");
	MIS_Akil_BringMissPeopleBack = LOG_Running;
};


instance DIA_Addon_Akil_ReturnPeople(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Addon_Akil_ReturnPeople_Condition;
	information = DIA_Addon_Akil_ReturnPeople_Info;
	permanent = FALSE;
	description = "O těch farmářích ...";
};


func int DIA_Addon_Akil_ReturnPeople_Condition()
{
	if((MIS_Akil_BringMissPeopleBack == LOG_Running) && (MissingPeopleReturnedHome == TRUE) && ((Npc_GetDistToWP(Tonak_NW,"NW_FARM2_FIELD_TANOK") <= 1000) || (Npc_GetDistToWP(Telbor_NW,"NW_FARM2_FIELD_TELBOR") <= 1000)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_ReturnPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Akil_ReturnPeople_15_00");	//O těch farmářích ...
	if((Npc_GetDistToWP(Tonak_NW,"NW_FARM2_FIELD_TANOK") <= 1000) && (Npc_GetDistToWP(Telbor_NW,"NW_FARM2_FIELD_TELBOR") <= 1000))
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_01");	//Tys je přivedl zpět - ty jsi ale blázen.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_02");	//Aspoň jeden přežil přechod.
	};
	AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_03");	//Vezmi si toto zlato jako vyjádření mých díků
	B_GiveInvItems(self,other,ItMi_Gold,100);
	B_GivePlayerXP(XP_Ambient);
	MIS_Akil_BringMissPeopleBack = LOG_SUCCESS;
};


instance DIA_Akil_Lieferung(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Lieferung_Condition;
	information = DIA_Akil_Lieferung_Info;
	permanent = FALSE;
	description = "Poslal mě Baltram...";
};


func int DIA_Akil_Lieferung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf) && (MIS_Baltram_ScoutAkil == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Akil_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Akil_Lieferung_15_00");	//Poslal mě Baltram. Mám tu pro něj vyzvednout nějaký balík.
	AI_Output(self,other,"DIA_Akil_Lieferung_13_01");	//Tak ty jsi teď jeho nový poslíček. Fajn, už jsem to připravil.
	CreateInvItems(self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
	B_LogEntry(TOPIC_Baltram,"Získal jsem tu zásilku. Teď už ji mohu přinést Baltramovi.");
	B_LogEntry(TOPIC_Nagur,"Získal jsem tu zásilku. Teď už ji mohu přinést Nagurovi.");
};


instance DIA_Akil_Gegend(C_Info)
{
	npc = BAU_940_Akil;
	nr = 90;
	condition = DIA_Akil_Gegend_Condition;
	information = DIA_Akil_Gegend_Info;
	permanent = FALSE;
	description = "Určitě se tady kolem vyznáš.";
};


func int DIA_Akil_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Soeldner) && (Kapitel < 3))
	{
		return TRUE;
	};
};


var int Knows_Taverne;

func void DIA_Akil_Gegend_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_15_00");	//Určitě se tady kolem vyznáš.
	AI_Output(self,other,"DIA_Akil_Gegend_13_01");	//Jasně, co potřebuješ vědět?
};


instance DIA_Akil_Hof(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Hof_Condition;
	information = DIA_Akil_Hof_Info;
	permanent = FALSE;
	description = "Kde najdu Onarovu farmu?";
};


func int DIA_Akil_Hof_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Gegend))
	{
		return TRUE;
	};
};

func void DIA_Akil_Hof_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Onar_15_00");	//Kde najdu Onarovu farmu?
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_01");	//Stačí se vrátit ke kamenným schodům a jít po cestě na východ.
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_02");	//Stejnou cestou se dostaneš i do krčmy. Odsud půjdeš dál na východ, dokud nedorazíš k obrovským lánům. To je místo, kde se poflakují žoldáci.
	Knows_Taverne = TRUE;
};


instance DIA_Akil_Taverne(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Taverne_Condition;
	information = DIA_Akil_Taverne_Info;
	permanent = FALSE;
	description = "Co je to za krčmu na východ odsud?";
};


func int DIA_Akil_Taverne_Condition()
{
	if(Knows_Taverne == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Akil_Taverne_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Taverne_15_00");	//Co je to za krčmu na východ odsud?
	AI_Output(self,other,"DIA_Akil_Gegend_Taverne_13_01");	//Zeptej se Randolpha. Ví o tom víc než já. Několikrát se tam stavil.
};


instance DIA_Akil_Wald(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Wald_Condition;
	information = DIA_Akil_Wald_Info;
	permanent = FALSE;
	description = "Co je v těch lesích za farmou?";
};


func int DIA_Akil_Wald_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Gegend))
	{
		return TRUE;
	};
};

func void DIA_Akil_Wald_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Wald_15_00");	//Co je v těch lesích za farmou?
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_01");	//Jenom nějaký příšery - a vlci jsou z nich ti nejmíň nebezpečný.
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_02");	//Taky se povídá, že tam má úkryt několik banditů. No, ale už pěkně dlouho nechali moji farmu na pokoji.
};


instance DIA_Akil_Perm(C_Info)
{
	npc = BAU_940_Akil;
	nr = 32;
	condition = DIA_Akil_Perm_Condition;
	information = DIA_Akil_Perm_Info;
	permanent = TRUE;
	description = "Stalo se ještě něco?";
};


func int DIA_Akil_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Soeldner) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Akil_Perm_Info()
{
	AI_Output(other,self,"DIA_Akil_Perm_15_00");	//Stalo se ještě něco?
	if(Kapitel == 3)
	{
		if(MIS_Akil_SchafDiebe == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_01");	//Ne. Doufám, že ovce zůstanou tam, co jsou teď.
		}
		else
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_02");	//Moje ovce zmizely. Za chvíli nebudu mít co do úst.
		};
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_03");	//Všude se objevují skřeti. Kdosi něco říkal o jejich základně. Zeptej se na to farmáře Lobarta.
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_04");	//Taky tu spatřili spoustu ještěranů. Být tebou, do jeskyní bych vůbec nechodil.
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_05");	//Hledají tě zakuklenci v černých kápích.
			AI_Output(other,self,"DIA_Akil_Perm_15_06");	//No tak to je novinka.
			AI_Output(self,other,"DIA_Akil_Perm_13_07");	//Dobrá. Prostě jsem myslel, že bych se o tom měl zmínit.
		};
	};
};


instance DIA_Akil_KAP3_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP3_EXIT_Condition;
	information = DIA_Akil_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_SCHAFDIEB(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_SCHAFDIEB_Condition;
	information = DIA_Akil_SCHAFDIEB_Info;
	description = "Ještě nějaký zprávy?";
};


func int DIA_Akil_SCHAFDIEB_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_SCHAFDIEB_Info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_15_00");	//Ještě nějaký zprávy?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_13_01");	//Poslední dobou mi pořád někdo krade ovce. Už celé noci jsem se pořádně nevyspal.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"To není můj problém.",DIA_Akil_SCHAFDIEB_nein);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"Kolik ovcí ti chybí?",DIA_Akil_SCHAFDIEB_wieviel);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"Kdo by to mohl dělat?",DIA_Akil_SCHAFDIEB_wer);
	MIS_Akil_SchafDiebe = LOG_Running;
	Log_CreateTopic(TOPIC_AkilSchafDiebe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilSchafDiebe,LOG_Running);
	B_LogEntry(TOPIC_AkilSchafDiebe,"Akilovi někdo stále krade ovce. Domnívá se, že to mají na svědomí banditi z jeskyně v nedalekém lese.");
};

func void DIA_Akil_SCHAFDIEB_wer()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wer_15_00");	//Kdo by to mohl dělat?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_01");	//Tak to nemám ani tušení.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_02");	//Nějaký fakt odporný chlápci se usadili v jeskyních za tím lesem.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_03");	//Nechce se mi věřit, že by se živili jen bobulema. Jsem si skoro jistej, že oni jsou ten důvod, proč se mi ztrácejí ovce.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};

func void DIA_Akil_SCHAFDIEB_wieviel()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wieviel_15_00");	//Kolik ovcí ti chybí?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wieviel_13_01");	//Teď se mi ztratily minimálně tři.
};

func void DIA_Akil_SCHAFDIEB_nein()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_nein_15_00");	//To není můj problém.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_nein_13_01");	//Rozumím. Máš na práci jiné věci.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};


instance DIA_Akil_SCHAFDIEBEPLATT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_SCHAFDIEBEPLATT_Condition;
	information = DIA_Akil_SCHAFDIEBEPLATT_Info;
	description = "Našel jsem ty zloděje ovcí.";
};


func int DIA_Akil_SCHAFDIEBEPLATT_Condition()
{
	if((Kapitel >= 3) && (MIS_Akil_SchafDiebe == LOG_Running) && Npc_IsDead(BDT_1025_Bandit_H) && Npc_IsDead(BDT_1026_Bandit_H) && Npc_IsDead(BDT_1027_Bandit_H))
	{
		return TRUE;
	};
};

func void DIA_Akil_SCHAFDIEBEPLATT_Info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_00");	//Našel jsem ty zloděje ovcí.
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_01");	//Měl jsi pravdu. Dělali to ti chlápci z lesní jeskyně. Už ti žádnou další ovci nevezmou.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_02");	//Díky ti, šlechetný služebníku Innose.
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03");	//Díky. Tak se přece jen domobrana dokáže postarat o nás, malé farmáře.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_04");	//Díky. Vážně jsi divnej žoldák. Vůbec ne jako ti ostatní, co znám.
	};
	AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_05");	//Vezmi si tohle jako malé vyjádření mých díků za tvou nezištnou pomoc.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	MIS_Akil_SchafDiebe = LOG_SUCCESS;
	B_GivePlayerXP(XP_Akil_SchafDiebe);
};


instance DIA_Akil_AkilsSchaf(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_AkilsSchaf_Condition;
	information = DIA_Akil_AkilsSchaf_Info;
	description = "(Vrátit Akilovi ovci.)";
};


func int DIA_Akil_AkilsSchaf_Condition()
{
	if((Kapitel >= 3) && (Npc_GetDistToNpc(self,Follow_Sheep_AKIL) < 1000) && (MIS_Akil_SchafDiebe != 0))
	{
		return TRUE;
	};
};

func void DIA_Akil_AkilsSchaf_Info()
{
	AI_Output(self,other,"DIA_Akil_AkilsSchaf_13_01");	//Výborně. Tady máš trochu zlata. Doufám, že to stačí.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Follow_Sheep_AKIL.aivar[AIV_PARTYMEMBER] = FALSE;
	Follow_Sheep_AKIL.wp = "NW_FARM2_OUT_02";
	Follow_Sheep_AKIL.start_aistate = ZS_MM_AllScheduler;
	B_GivePlayerXP(XP_AkilsSchaf);
};


instance DIA_Akil_KAP4_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP4_EXIT_Condition;
	information = DIA_Akil_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_KAP5_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP5_EXIT_Condition;
	information = DIA_Akil_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_KAP6_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP6_EXIT_Condition;
	information = DIA_Akil_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_PICKPOCKET(C_Info)
{
	npc = BAU_940_Akil;
	nr = 900;
	condition = DIA_Akil_PICKPOCKET_Condition;
	information = DIA_Akil_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Akil_PICKPOCKET_Condition()
{
	return C_Beklauen(37,30);
};

func void DIA_Akil_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
	Info_AddChoice(DIA_Akil_PICKPOCKET,Dialog_Back,DIA_Akil_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Akil_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Akil_PICKPOCKET_DoIt);
};

func void DIA_Akil_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
};

func void DIA_Akil_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
};

