
instance DIA_Addon_Myxir_ADW_EXIT(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 999;
	condition = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_ADWHello(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_ADWHello_Condition;
	information = DIA_Addon_Myxir_ADWHello_Info;
	description = "Máš nějaké zprávy?";
};


func int DIA_Addon_Myxir_ADWHello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_00");	//Máš nějaké zprávy?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_01");	//Stavitelé těchto ruin mě fascinují!
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_02");	//Je to škoda, že jejich jazyk je mrtví jako oni sami.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_03");	//(zamyšleně) Jejich pozoruhodné rituály a také přivolávání pro ně nebyli žádnou záchranou.
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_04");	//Přivolávání?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_05");	//Stavitelé měli silné spojení se světem duchů.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_06");	//Jestli jsem pochopil správně jejich myšlení, měli spojení se svými předky celou dobu.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_07");	//Kvůli tomu pravidelně pořádali přivolávání a rituály, aby dostali radu.
	Info_ClearChoices(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello,"Jak funguje to přivolávání?",DIA_Addon_Myxir_ADWHello_wie);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello,"Nemrtví, co já vím, toho moc nenamluví.",DIA_Addon_Myxir_ADWHello_Watt);
};

func void DIA_Addon_Myxir_ADWHello_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_wie_15_00");	//Jak funguje to přivolávání?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_01");	//Strážci mrtvých měli svá speciální kouzla, kterými klidnili duchy.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_02");	//Texty, které se zde dají najít, jsou docela zmatené. Přesné odpověďi na mé otázky nenalézám jen velmi málo kdy.
};

func void DIA_Addon_Myxir_ADWHello_Watt()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_Watt_15_00");	//Nemrtví, co já vím, toho moc nenamluví.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_01");	//Stavitelé nestvořili bezduché nemrtvé jako zombie nebo jiné zlé nestvůry.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_02");	//S duchy jsou duše velkých bojovníků, kněží a vládců.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_03");	//Doteď nemám žádné pochybnosti, že opravdu existují.
};


instance DIA_Addon_Myxir_PermADW(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 10;
	condition = DIA_Addon_Myxir_PermADW_Condition;
	information = DIA_Addon_Myxir_PermADW_Info;
	permanent = TRUE;
	description = "Pokud potkám ducha, dám ti vědět.";
};


func int DIA_Addon_Myxir_PermADW_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello) && (Saturas_RiesenPlan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_PermADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_PermADW_15_00");	//Pokud potkám ducha, dám ti vědět.
	AI_Output(self,other,"DIA_Addon_Myxir_PermADW_12_01");	//(směje se) Ano, to určitě udělej.
};


instance DIA_Addon_Myxir_GeistTafel(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_GeistTafel_Condition;
	information = DIA_Addon_Myxir_GeistTafel_Info;
	description = "Saturas mě poslal.";
};


func int DIA_Addon_Myxir_GeistTafel_Condition()
{
	if((Saturas_RiesenPlan == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_GeistTafel_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_00");	//Saturas mě poslal.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_01");	//Raven se ukryl do chrámu a zavřel za sebou portál.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_02");	//Saturas se domnívá, že získal znalosti o chrámu od ducha!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_03");	//(zdrcený) Oh Adanosi!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_04");	//Musel přivolat vrchního kněze Khardimona, aby se ho zeptal na cestu do chrámu.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_05");	//Podle zaznamů má hrob v jeskyních pod pevností!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_06");	//Musíš udělat to samé.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_07");	//Ale Khardimona se už zeptat nemůžeš ...
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_08");	//Hrob válečníka Quarhodrona leží na západě údolí.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_09");	//Musíš ho najít ... a probudit Quarhodrona.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_10");	//V těchto nápisech je napsáno, jak věřící Adanose může přivolat ducha.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_11");	//Myslíš, že opravdu fungují?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_12");	//Přečetl jsem hodně písma.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_13");	//Například zápisi Y'Beriona, vůdce Bratrstva Spáče.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_14");	//Ale věřím každému slovu autora TĚCHTO spisků!
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_Running;
	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Myslíš to vážně?",DIA_Addon_Myxir_GeistTafel_geist);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Proč Quarhodron? Proč ne vrchní kněz Khardimon osobně?",DIA_Addon_Myxir_GeistTafel_Khardimon);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Bratrstvo Spáče neříkalo jenom lži.",DIA_Addon_Myxir_GeistTafel_psi);
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_Khardimon_15_00");	//Proč Quarhodron? Proč ne vrchní kněz Khardimon osobně?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_01");	//Raven znesvětil hrob svým přivoláváním. To je jisté.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_02");	//Musíme se podívat po jiném duchovi.
};

func void DIA_Addon_Myxir_GeistTafel_psi()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_psi_15_00");	//Bratrstvo Spáče neříkalo jenom lži. A navíc jejich mysl ovládal Spáč.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_01");	//To nebyly jenom jejich lži, to je nepravděpodobné, byla to jejich víra.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_02");	//Slova byla spíše nepochopitelná, než-li přesvědčivá. Byli ovlivnění nadměrným používáním trávy z bažin, kterou kouřili.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_03");	//Ovšem ten, kdo psal tyto kamenné desky, psal vše rozvážně a dopodrobna. A to mě přesvědčilo o tom, že je to pravda.
};

func void DIA_Addon_Myxir_GeistTafel_geist()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_geist_15_00");	//Myslíš to vážně?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_01");	//Nechci nechat jediný kámen nerozluštěný.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_02");	//I jestli pro nás existuje jenom nádech šance potkat jednoho ze stavitelů, pak to musíme zkusit.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_03");	//Raven to také dokázal.
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Souhlasím, přivolám ducha. Co mám udělat?",DIA_Addon_Myxir_GeistTafel_wie);
};

func void DIA_Addon_Myxir_GeistTafel_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_wie_15_00");	//Souhlasím, přivolám ducha. Co mám udělat?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_01");	//Najdi Quarhodronův hrob na západě údolí.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_02");	//Se slovy Strážců mrtvých, které jsem napsal, bude jeho duch přivolán.
	CreateInvItems(self,ItWr_Addon_SUMMONANCIENTGHOST,1);
	B_GiveInvItems(self,other,ItWr_Addon_SUMMONANCIENTGHOST,1);
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_03");	//Toť vše. Teď musíme najít jeho hrob.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_04");	//Hodně štěstí synu!
	B_LogEntry(TOPIC_Addon_Quarhodron,"Myxir chce abych probudil ducha pradávného válečníka Quadrohona a zeptal se ho na radu. Dal mi dokument s magickou formulí, kterou mám nahlas přečíst v Quarhodronově hrobě na západě.");
	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
};


instance DIA_Addon_Myxir_GeistPerm(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_GeistPerm_Condition;
	information = DIA_Addon_Myxir_GeistPerm_Info;
	description = "Jak to bylo znovu o válečníkovi 'Quarhodronovi'?";
};


func int DIA_Addon_Myxir_GeistPerm_Condition()
{
	if(MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_GeistPerm_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistPerm_15_00");	//Jak to bylo znovu o válečníkovi 'Quarhodronovi'?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_01");	//Měl bys najít jeho hrob a přivolat ho pomocí slov Strážců mrtvých.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_02");	//Napsal jsem ty slova. Musíš je jenom nahlas přečíst.
};


instance DIA_Addon_Myxir_TalkedToGhost(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_TalkedToGhost_Condition;
	information = DIA_Addon_Myxir_TalkedToGhost_Info;
	description = "Promluvil jsem s Quarhodronem.";
};


func int DIA_Addon_Myxir_TalkedToGhost_Condition()
{
	if((MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running) && (SC_TalkedToGhost == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_TalkedToGhost_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_00");	//Promluvil jsem s Quarhodronem.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_01");	//(nadšený) Pak ho opravdu můžeš probudit z království mrtvých?
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_02");	//To je opravdu zajímavé. Obdivuji tyto stavitele čím dál víc.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_03");	//Kdo ví, čeho mohli dosáhnout, pokud by stále existovali ...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Myxir_GeistBeschwoeren);
	if((Saturas_KnowsHow2GetInTempel == FALSE) && (Ghost_SCKnowsHow2GetInAdanosTempel == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_04");	//Co ten duch říkal?
		AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_05");	//Dal mi něco, s čím se mohu dostat do chrámu.
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_06");	//Pak jdi přímo k Saturasovi. Bude se o to zajímat.
		B_LogEntry(TOPIC_Addon_Quarhodron,"Měl bych ohlásit Saturasovi, že jsem probudil Quarhodrona.");
	};
};


instance DIA_Addon_Myxir_ADW_Teach(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 90;
	condition = DIA_Addon_Myxir_ADW_Teach_Condition;
	information = DIA_Addon_Myxir_ADW_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě cizí jazyk.";
};


var int DIA_Addon_Myxir_ADW_Teach_NoPerm;
var int DIA_Addon_Myxir_ADW_Teach_OneTime;

func int DIA_Addon_Myxir_ADW_Teach_Condition()
{
	if((DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE) && (DIA_Addon_Myxir_Teach_NoPerm == FALSE) && (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_ADW_Teach_Info()
{
	B_DIA_Addon_Myxir_TeachRequest();
	if(DIA_Addon_Myxir_ADW_Teach_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
		DIA_Addon_Myxir_ADW_Teach_OneTime = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,Dialog_Back,DIA_Addon_Myxir_ADW_Teach_BACK);
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1();
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL2();
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL3();
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
	}
	else
	{
		B_DIA_Addon_Myxir_TeachNoMore();
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X();
};

func void DIA_Addon_Myxir_ADW_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

