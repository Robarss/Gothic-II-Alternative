
instance DIA_Bengar_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_EXIT_Condition;
	information = DIA_Bengar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_HALLO(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 3;
	condition = DIA_Bengar_HALLO_Condition;
	information = DIA_Bengar_HALLO_Info;
	description = "Ty jsi tady farmářem?";
};


func int DIA_Bengar_HALLO_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_HALLO_Info()
{
	AI_Output(other,self,"DIA_Bengar_HALLO_15_00");	//Ty jsi tady farmářem?
	AI_Output(self,other,"DIA_Bengar_HALLO_10_01");	//Dalo by se to tak říct, ale jsem jen nájemce.
	AI_Output(self,other,"DIA_Bengar_HALLO_10_02");	//Veškeré pozemky patří velkostatkáři.
};


instance DIA_Bengar_WOVONLEBTIHR(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Bengar_WOVONLEBTIHR_Condition;
	information = DIA_Bengar_WOVONLEBTIHR_Info;
	description = "Jak si obstaráváš obživu?";
};


func int DIA_Bengar_WOVONLEBTIHR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_HALLO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_WOVONLEBTIHR_Info()
{
	AI_Output(other,self,"DIA_Bengar_WOVONLEBTIHR_15_00");	//Jak si obstaráváš obživu?
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_01");	//Většinou lovem a kácením stromů. Taky samozřejmě chováme ovce a obděláváme půdu.
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_02");	//Onar mi sem poslal všechny tyhle lidi a já je musím živit. A jen málo z nich umí vzít za práci, jak sis asi sám všiml.
};


instance DIA_Bengar_TAGELOEHNER(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 6;
	condition = DIA_Bengar_TAGELOEHNER_Condition;
	information = DIA_Bengar_TAGELOEHNER_Info;
	description = "Zaměstnáváš nádeníky?";
};


func int DIA_Bengar_TAGELOEHNER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_TAGELOEHNER_Info()
{
	AI_Output(other,self,"DIA_Bengar_TAGELOEHNER_15_00");	//Zaměstnáváš nádeníky?
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_01");	//Onar vyhodil lidi, co mu na jeho farmě nebyli k ničemu.
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_02");	//Pak je poslal ke mně. Dávám jim najíst a oni pro mě pracují.
};


instance DIA_Addon_Bengar_MissingPeople(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_MissingPeople_Condition;
	information = DIA_Addon_Bengar_MissingPeople_Info;
	description = "Stalo se v poslední době něco divného?";
};


func int DIA_Addon_Bengar_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_15_00");	//Stalo se v poslední době něco divného?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_01");	//Vypadá to, že celkem dost věcí.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_02");	//Ale nejpodivnější z nich je záhadné zmizení Pardose.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_03");	//Je jeden z mých nejlepších farmářů. Není ten typ, že by hodil ručník do ringu a zmizel přes noc, víš??
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Farmář Bengar postrádá svého dělníka Pardose.");
	MIS_Bengar_BringMissPeopleBack = LOG_Running;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,Dialog_Back,DIA_Addon_Bengar_MissingPeople_back);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"Nějaké důvody, které by ho vedly k útěku?",DIA_Addon_Bengar_MissingPeople_Hint);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"Možná toho tady měl jenom dost.",DIA_Addon_Bengar_MissingPeople_voll);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"Co je přesně tak zvláštního na jeho zmizení?",DIA_Addon_Bengar_MissingPeople_was);
};

func void DIA_Addon_Bengar_MissingPeople_was()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_00");	//Co je přesně tak zvláštního na jeho zmizení?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_01");	//Pardos je starostlivý typ. Nikdy se nezatoulal dál, než jsou hranice mého pozemku.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_02");	//Vzal by nohy na ramena, kdyby viděl žravou štěnici plazit se jeho směrem.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_03");	//Ikdyž to nejsou pěkná stvoření, nejsou vůbec nebezpečná.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_04");	//(zhnuseně) Dokonce jsem slyšel, že je někdo i jí. Odporné.
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_05");	//Zvykneš si na to.
};

func void DIA_Addon_Bengar_MissingPeople_voll()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_voll_15_00");	//Možná toho tady měl jenom dost.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_01");	//Práce na poli byla pro něho vším. Neumím si představit, že teď pracuje pro jiného farmáře.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_02");	//Mohl si dělat, co chtěl.
};

func void DIA_Addon_Bengar_MissingPeople_Hint()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Hint_15_00");	//Nějaké důvody, které by ho vedly k útěku?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_01");	//Předpokládám, že ho sebrali banditi. Toulali se tu pár dní okolo.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_02");	//Jednou jsem viděl, jak vzali občana města a táhli si ho do tábora.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_03");	//Vypadá to, jako by ho chtěli zotročit..
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"Kde je tábor banditů?",DIA_Addon_Bengar_MissingPeople_Lager);
};


var int Bengar_ToldAboutRangerBandits;

func void DIA_Addon_Bengar_MissingPeople_Lager()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Lager_15_00");	//Kde je tábor banditů?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_01");	//Na konci mojeho pole jsou schody vedoucí dolů do malé kotliny. Tak tam se utábořili.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_02");	//Rád bych se tam šel podívat a Pardose najít, ale nechci se zaplést s těmi hrdlořezy.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_03");	//Na tvém místě bych se od nich držel dál. Nekladou otázky.
	Bengar_ToldAboutRangerBandits = TRUE;
};

func void DIA_Addon_Bengar_MissingPeople_back()
{
	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
};


instance DIA_Addon_Bengar_ReturnPardos(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_ReturnPardos_Condition;
	information = DIA_Addon_Bengar_ReturnPardos_Info;
	description = "Už se Pardos vrátil?";
};


func int DIA_Addon_Bengar_ReturnPardos_Condition()
{
	if((MIS_Bengar_BringMissPeopleBack == LOG_Running) && (Npc_GetDistToWP(Pardos_NW,"NW_FARM3_HOUSE_IN_NAVI_2") <= 1000) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_00");	//Už se Pardos vrátil?
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_01");	//Ano, odpočívá vevnitř. Díky za všechno ...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_02");	//Není zač.
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_03");	//Počkej, rád bych tě odměnil, ale nemám toho dost ani pro sebe ...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_04");	//Zapomeň na to.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Bengar_FernandosWeapons(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_FernandosWeapons_Condition;
	information = DIA_Addon_Bengar_FernandosWeapons_Info;
	description = "Měli banditi zbraně, když tudy naposledy šli?";
};


func int DIA_Addon_Bengar_FernandosWeapons_Condition()
{
	if((Bengar_ToldAboutRangerBandits == TRUE) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_00");	//Měli banditi zbraně, když tudy naposledy šli?
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_01");	//Co je to za blbou otázku? Už jsi někdy viděl bandity beze zbraní?
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_02");	//Myslím velmi MNOHO zbraní. Něco jako dodávka zbraní.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_03");	//Jo, pravda. Teď už vím. Měli těch zbraní spousty.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_04");	//Některé v sudech, jiné v balících na vozíku.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_REBELLIEREN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 8;
	condition = DIA_Bengar_REBELLIEREN_Condition;
	information = DIA_Bengar_REBELLIEREN_Info;
	description = "Co si myslíš o Onarovi?";
};


func int DIA_Bengar_REBELLIEREN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBELLIEREN_Info()
{
	AI_Output(other,self,"DIA_Bengar_REBELLIEREN_15_00");	//Co si myslíš o Onarovi?
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_01");	//Je to nenažranej parchant, co nás nakonec všechny dostane na šibenici.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_02");	//Jednou sem paladinové z města dorazí a kvůli tomu bastardovi nás porubají.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_03");	//Ale já nemám na výběr. Domobrana si sem chodí jen, aby si odnesla naše zboží, ale chránit nás ji ani nenapadne.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_04");	//Kdybych zůstal věrný městu, byl bych na to teď sám.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_05");	//Když už nic jiného, Onar pošle pár svých žoldáků hned a pak, aby se podívali, jak jsme dopadli.
};


instance DIA_Bengar_PALADINE(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 9;
	condition = DIA_Bengar_PALADINE_Condition;
	information = DIA_Bengar_PALADINE_Info;
	description = "Co máš proti královským vojskům?";
};


func int DIA_Bengar_PALADINE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_REBELLIEREN) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PALADINE_Info()
{
	AI_Output(other,self,"DIA_Bengar_PALADINE_15_00");	//Co máš proti královským vojskům?
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_01");	//To je přece jasný. Od tý doby, co jsou paladinové ve městě, se nic nezlepšilo. Právě naopak.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_02");	//Teď ti zatracení vojáci z domobrany přicházejí na naše pozemky stále častěji a kradou, co se jim zachce. A paladinové proti tomu nehnou ani prstem.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_03");	//Jediní paladinové, které jsem kdy viděl, jsou ti dva strážci u průsmyku.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_04");	//Nehodlají hnout ani prstem, dokud nás domobrana všechny nepovraždí.
};


instance DIA_Bengar_PASS(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 10;
	condition = DIA_Bengar_PASS_Condition;
	information = DIA_Bengar_PASS_Info;
	description = "Průsmyk?";
};


func int DIA_Bengar_PASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_PALADINE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PASS_Info()
{
	AI_Output(other,self,"DIA_Bengar_PASS_15_00");	//Průsmyk?
	AI_Output(self,other,"DIA_Bengar_PASS_10_01");	//Jo. Průsmyk do starého Hornického údolí u vodopádů na druhém konci náhorních pastvin.
	AI_Output(self,other,"DIA_Bengar_PASS_10_02");	//Zeptej se na to Malaka. Poslední týden má spoustu času.
};


instance DIA_Bengar_MILIZ(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 11;
	condition = DIA_Bengar_MILIZ_Condition;
	information = DIA_Bengar_MILIZ_Info;
	permanent = FALSE;
	description = "Řekněme, že se na ten váš problém s domobranou podívám.";
};


func int DIA_Bengar_MILIZ_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZ_15_00");	//Řekněme, že se na ten váš problém s domobranou podívám.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_01");	//Co? Řekl jsem Onarovi, že by měl poslat pár ŽOLDÁKŮ.
		AI_Output(other,self,"DIA_Bengar_MILIZ_15_02");	//Je to příležitost, jak se přesvědčit o svých kvalitách.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_03");	//Výborně. Je ti jasné, co se mnou domobrana udělá, když to spackáš?
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_04");	//Neměl jsem dojem, že by sem teď chtěl někdo z nich přijít.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_05");	//Už jsem o tom Onarovi říkal před pár dny. Za co mu tu rentu teda platím?
	};
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_06");	//Ti bastardi sem chodí jednou do týdne a vybírají daně pro město.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_07");	//Je fajn, žes přišel právě teď. V tuhle dobu obvykle přicházejí.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_08");	//Měli by tu být každou chvíli.
};


instance DIA_Bengar_Selber(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 11;
	condition = DIA_Bengar_Selber_Condition;
	information = DIA_Bengar_Selber_Info;
	permanent = FALSE;
	description = "Je vás tu tolik. Proč se domobraně prostě nepostavíte sami?";
};


func int DIA_Bengar_Selber_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && (Bengar_MilSuccess == FALSE) && Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_Selber_Info()
{
	AI_Output(other,self,"DIA_Bengar_Selber_15_00");	//Je vás tu tolik. Proč se domobraně prostě nepostavíte sami?
	AI_Output(self,other,"DIA_Bengar_Selber_10_01");	//Je pravda, že nás tu je jak psů. Ale nemáme výcvik na boj s domobranou.
};


instance DIA_Bengar_MILIZKLATSCHEN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 12;
	condition = DIA_Bengar_MILIZKLATSCHEN_Condition;
	information = DIA_Bengar_MILIZKLATSCHEN_Info;
	permanent = FALSE;
	description = "Jen ať si teda domobrana dorazí, já už to s nimi vyřídím!";
};


func int DIA_Bengar_MILIZKLATSCHEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_MILIZ) && !Npc_IsDead(Rick) && !Npc_IsDead(Rumbold) && (Rumbold_Bezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZKLATSCHEN_15_00");	//Jen ať si teda domobrana dorazí, já už to s nimi vyřídím!
	AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_01");	//Nemůžu se dočkat. Už přicházejí. Říkal jsem ti to.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_02");	//Jen to nezpackej!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_03");	//Tak dobrá, hodně štěstí! Ukaž jim to.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MilComing");
	if(Hlp_IsValidNpc(Rick) && !Npc_IsDead(Rick))
	{
		Npc_ExchangeRoutine(Rick,"MilComing");
		AI_ContinueRoutine(Rick);
	};
	if(Hlp_IsValidNpc(Rumbold) && !Npc_IsDead(Rumbold))
	{
		Npc_ExchangeRoutine(Rumbold,"MilComing");
		AI_ContinueRoutine(Rumbold);
	};
};


var int Bengar_MilSuccess;

instance DIA_Bengar_MILIZWEG(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 12;
	condition = DIA_Bengar_MILIZWEG_Condition;
	information = DIA_Bengar_MILIZWEG_Info;
	permanent = TRUE;
	description = "Váš problém s domobranou už je minulostí.";
};


func int DIA_Bengar_MILIZWEG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_MILIZ) && (Bengar_MilSuccess == FALSE))
	{
		if((Npc_IsDead(Rick) && Npc_IsDead(Rumbold)) || (Rumbold_Bezahlt == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZWEG_15_00");	//Váš problém s domobranou už je minulostí.
	if((Rumbold_Bezahlt == TRUE) && (Npc_IsDead(Rumbold) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_01");	//Jsi blázen? Víš, co mi ti chlapi udělají, až odsud odejdeš?
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_02");	//Zůstávají pořád poblíž. Řekni jim, ať odtáhnou ÚPLNĚ!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_03");	//To není špatné. Možná nám teď na konci měsíce zbude něco i pro obchod. Díky.
		if(Rumbold_Bezahlt == TRUE)
		{
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_04");	//Dokonce jsi za mě chtěl zaplatit. To je od tebe velmi milé.
			B_GivePlayerXP(XP_Bengar_MILIZKLATSCHEN + 50);
		}
		else
		{
			B_GivePlayerXP(XP_Bengar_MILIZKLATSCHEN);
		};
		Bengar_MilSuccess = TRUE;
	};
};


instance DIA_Bengar_BALTHASAR(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 13;
	condition = DIA_Bengar_BALTHASAR_Condition;
	information = DIA_Bengar_BALTHASAR_Info;
	description = "Ovčák Balthazar na vaše pastviny nesmí?";
};


func int DIA_Bengar_BALTHASAR_Condition()
{
	if((MIS_Balthasar_BengarsWeide == LOG_Running) && Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR))
	{
		return TRUE;
	};
};

func void DIA_Bengar_BALTHASAR_Info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASAR_15_00");	//Ovčák Balthazar na vaše pastviny nesmí?
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_01");	//No, ano. To je tak. Řekl jsem Sekobovi, že by mi měl platit, když chce své ovce pást na mých pozemcích.
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_02");	//Abych řekl pravdu, chtěl jsem to jen proto, aby už sem nechodil. Nemůžu Balthazara vystát.
	B_LogEntry(TOPIC_BalthasarsSchafe,"Mám-li přesvědčit Bengara, aby Balthazara pustil na své pastviny, musím mu učinit laskavost. Určitě se k tomu nějaká příležitost naskytne.");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_BALTHASARDARFAUFWEIDE(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 14;
	condition = DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information = DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;
	description = "Domobrana je pryč a Balthazar může tvoji pastvinu znovu používat.";
};


func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_BALTHASAR) && (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS) && (Bengar_MilSuccess == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00");	//Domobrana je pryč a Balthazar může tvoji pastvinu znovu používat.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01");	//Proč?
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02");	//(výhružně) Protože jsem to řekl.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03");	//Mmh. Dobrá, jak chceš.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04");	//Ať si najde místo pro svoje zvířata někde mezi poli.
	MIS_Balthasar_BengarsWeide = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_PERMKAP1(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 15;
	condition = DIA_Bengar_PERMKAP1_Condition;
	information = DIA_Bengar_PERMKAP1_Info;
	permanent = TRUE;
	description = "Dávej na sebe pozor.";
};


func int DIA_Bengar_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_BALTHASARDARFAUFWEIDE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Bengar_PERMKAP1_15_00");	//Dávej na sebe pozor.
	AI_Output(self,other,"DIA_Bengar_PERMKAP1_10_01");	//Ty taky.
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP3_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP3_EXIT_Condition;
	information = DIA_Bengar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_ALLEIN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 30;
	condition = DIA_Bengar_ALLEIN_Condition;
	information = DIA_Bengar_ALLEIN_Info;
	description = "Jak to vypadá?";
};


func int DIA_Bengar_ALLEIN_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_ALLEIN_Info()
{
	AI_Output(other,self,"DIA_Bengar_ALLEIN_15_00");	//Jak to vypadá?
	if((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3") < 3000) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_01");	//Malak zmizel a vzal s sebou všechno a každého, kdo pro mě pracoval. Říkal, že má namířeno do hor.
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_02");	//Už to tu nemohl vydržet.
		MIS_GetMalakBack = LOG_Running;
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_03");	//Časy jsou zlé. Nevím, jak dlouho tu ještě vydržím.
	};
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_04");	//Vytáčí mě, jak z průsmyku teď proudí záplavy příšer, aby plundrovaly náhorní pastviny.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_05");	//Kdybych tu tak alespoň měl nějakou pomoc do žoldáků.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_06");	//Jeden z nich se chystal, že pro mě bude pracovat. Asi změnil názor. Mám dojem, že se jmenoval "Wolf".
	MIS_BengarsHelpingSLD = LOG_Running;
	Log_CreateTopic(TOPIC_BengarALLEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN,LOG_Running);
	B_LogEntry(TOPIC_BengarALLEIN,"Bengar zůstal na svém statku docela sám. Jeho přítel Malak zmizel a všichni ostatní odešli s ním. Podle Bengara se nejspíš uchýlili do hor.");
	B_LogEntry(TOPIC_BengarALLEIN,"Jeho statek je teď úplně nechráněný a potřebuje pomoc. Zmiňoval se o nějakém žoldnéři jménem Wolf. Copak já toho chlápka neznám?");
};


instance DIA_Bengar_MALAKTOT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 32;
	condition = DIA_Bengar_MALAKTOT_Condition;
	information = DIA_Bengar_MALAKTOT_Info;
	description = "Malak je mrtvý.";
};


func int DIA_Bengar_MALAKTOT_Condition()
{
	if(Npc_IsDead(Malak) && (Malak_isAlive_Kap3 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MALAKTOT_Info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKTOT_15_00");	//Malak je mrtvý.
	AI_Output(self,other,"DIA_Bengar_MALAKTOT_10_01");	//Teď se všechno obrací k horšímu.
};


instance DIA_Bengar_SLDDA(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 32;
	condition = DIA_Bengar_SLDDA_Condition;
	information = DIA_Bengar_SLDDA_Info;
	description = "Najal jsem ty žoldáky, které jsi chtěl.";
};


func int DIA_Bengar_SLDDA_Condition()
{
	if((Npc_GetDistToWP(SLD_Wolf,"FARM3") < 3000) && (MIS_BengarsHelpingSLD == LOG_SUCCESS) && (Npc_IsDead(SLD_Wolf) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_SLDDA_Info()
{
	AI_Output(other,self,"DIA_Bengar_SLDDA_15_00");	//Najal jsem ty žoldáky, které jsi chtěl.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_01");	//Nikdy jsem na své farmě nikoho podobného neměl. Jen doufám, že to bude fungovat.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_02");	//Tady, vezmi si tohle. Mám dojem, že se ti to bude hodit.
	CreateInvItems(self,ItMi_Gold,400);
	B_GiveInvItems(self,other,ItMi_Gold,400);
	B_GivePlayerXP(XP_BengarsHelpingSLDArrived);
};


instance DIA_Bengar_MALAKWIEDERDA(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 35;
	condition = DIA_Bengar_MALAKWIEDERDA_Condition;
	information = DIA_Bengar_MALAKWIEDERDA_Info;
	description = "Malak se vrátil.";
};


func int DIA_Bengar_MALAKWIEDERDA_Condition()
{
	if((Npc_GetDistToWP(Malak,"FARM3") < 3000) && ((MIS_GetMalakBack == LOG_SUCCESS) || (NpcObsessedByDMT_Malak == TRUE)) && (Npc_IsDead(Malak) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MALAKWIEDERDA_Info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_15_00");	//Malak se vrátil.
	AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_10_01");	//Už bylo načase. Myslel jsem, že už ho víckrát neuvidím.
	B_GivePlayerXP(XP_GetMalakBack);
};


instance DIA_Bengar_PERM(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 80;
	condition = DIA_Bengar_PERM_Condition;
	information = DIA_Bengar_PERM_Info;
	permanent = TRUE;
	description = "To bude v pořádku.";
};


func int DIA_Bengar_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_ALLEIN) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERM_Info()
{
	AI_Output(other,self,"DIA_Bengar_PERM_15_00");	//To bude v pořádku.
	if((Npc_GetDistToWP(Malak,"FARM3") < 3000) && (Npc_IsDead(Malak) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_01");	//Malak se sice vrátil, ale na situaci to moc nemění.
		AI_Output(self,other,"DIA_Bengar_PERM_10_02");	//Pokud se nestane nějaký zázrak, všichni to tu odskáčeme.
	}
	else if(Npc_KnowsInfo(other,DIA_Bengar_SLDDA) && (Npc_IsDead(SLD_Wolf) == FALSE) && (Npc_GetDistToWP(SLD_Wolf,"FARM3") < 3000))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_03");	//Wolf je divnej chlap, ale myslím, že to nějak zvládneme.
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_04");	//Bez Malaka tu nic nefunguje. Jestli se brzy něco nestane, vzdám se farmy.
		if((Malak_isAlive_Kap3 == TRUE) && (Npc_IsDead(Malak) == FALSE))
		{
			AI_Output(self,other,"DIA_Bengar_PERM_10_05");	//Snad se brzy vrátí.
		};
	};
	AI_StopProcessInfos(self);
	if(Npc_IsDead(SLD_Wolf) && (MIS_BengarsHelpingSLD == LOG_SUCCESS))
	{
		B_StartOtherRoutine(SLD_815_Soeldner,"Start");
		B_StartOtherRoutine(SLD_817_Soeldner,"Start");
	};
};


instance DIA_Bengar_KAP4_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP4_EXIT_Condition;
	information = DIA_Bengar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP5_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP5_EXIT_Condition;
	information = DIA_Bengar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP6_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP6_EXIT_Condition;
	information = DIA_Bengar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_PICKPOCKET(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 900;
	condition = DIA_Bengar_PICKPOCKET_Condition;
	information = DIA_Bengar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Bengar_PICKPOCKET_Condition()
{
	return C_Beklauen(28,50);
};

func void DIA_Bengar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
	Info_AddChoice(DIA_Bengar_PICKPOCKET,Dialog_Back,DIA_Bengar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bengar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bengar_PICKPOCKET_DoIt);
};

func void DIA_Bengar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
};

func void DIA_Bengar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
};

