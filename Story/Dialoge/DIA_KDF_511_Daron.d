
func void B_DaronSegen()
{
	var string concatText;
	var int Bonus_1;
	var int Bonus_2;
	var int Bonus_3;
	Daron_Segen = TRUE;
	if(Daron_Spende < 100)
	{
		if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
		};
	}
	else if((Daron_Spende < 250) && (Bonus_1 == FALSE))
	{
		B_RaiseAttribute(other,ATR_MANA_MAX,2);
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		Bonus_1 = TRUE;
	}
	else if((Daron_Spende < 500) && (Bonus_2 == FALSE))
	{
		B_GivePlayerXP(XP_Ambient);
		Bonus_2 = TRUE;
	}
	else if((Daron_Spende >= 750) && (Daron_Spende < 1000) && (Bonus_3 == FALSE))
	{
		other.lp = other.lp + 1;
		concatText = ConcatStrings(PRINT_LearnLP,IntToString(1));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
		Bonus_3 = TRUE;
	}
	else
	{
		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		other.attribute[ATR_HITPOINTS_MAX] = other.attribute[ATR_HITPOINTS_MAX] + 5;
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(5));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
};


instance DIA_Daron_EXIT(C_Info)
{
	npc = KDF_511_Daron;
	nr = 999;
	condition = DIA_Daron_EXIT_Condition;
	information = DIA_Daron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Daron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Daron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Daron_Hallo(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_Hallo_Condition;
	information = DIA_Daron_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Daron_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Hallo_Info()
{
	AI_Output(self,other,"DIA_Daron_Hallo_10_00");	//Co pro tebe mohu udělat? Hledáš duchovní útěchu?
	AI_Output(self,other,"DIA_Daron_Hallo_10_01");	//Chceš odeslat modlitbu našemu Pánu Innosovi, nebo darovat kostelu nějaké peníze?
};


instance DIA_Daron_Paladine(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_Paladine_Condition;
	information = DIA_Daron_Paladine_Info;
	permanent = FALSE;
	description = "Potřeboval bych si promluvit s paladiny...";
};


func int DIA_Daron_Paladine_Condition()
{
	if((other.guild != GIL_KDF) && (Kapitel < 2))
	{
		return TRUE;
	};
};

func void DIA_Daron_Paladine_Info()
{
	AI_Output(other,self,"DIA_Daron_Paladine_15_00");	//Potřeboval bych si promluvit s paladiny. Můžeš mě k nim nějak dostat?
	AI_Output(self,other,"DIA_Daron_Paladine_10_01");	//No, budeš potřebovat povolení ke vstupu do horní části města. To však mají jen občané města a městská stráž.
	AI_Output(self,other,"DIA_Daron_Paladine_10_02");	//A pochopitelně my, ohniví mágové.
	AI_Output(other,self,"DIA_Daron_Paladine_15_03");	//Jak bych se mohl stát ohnivým mágem?
	AI_Output(self,other,"DIA_Daron_Paladine_10_04");	//Musíš se připojit k našemu řádu jako novic. Až budeš sloužit určitý čas, možná budeš přijat do řad mágů.
	AI_Output(self,other,"DIA_Daron_Paladine_10_05");	//Tahle cesta je ovšem dlouhá a plná práce a studia.
};


instance DIA_Daron_AboutSegen(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_AboutSegen_Condition;
	information = DIA_Daron_AboutSegen_Info;
	permanent = FALSE;
	description = "Přišel jsem si pro tvé požehnání!";
};


func int DIA_Daron_AboutSegen_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_AboutSegen_Info()
{
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_00");	//Přišel jsem si pro tvé požehnání!
	AI_Output(self,other,"DIA_Daron_AboutSegen_10_01");	//To je dobře, to je dobře - v tom případě bys jistě chtěl přispět nějakým tím zlaťákem ve prospěch svaté církve Innosovy, že?
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_02");	//No, ve skutečnosti bych rád dostal tvé požehnání, abych se mohl zapsat jako učedník v dolní části města.
	if(Daron_Segen == TRUE)
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_03");	//Ale já už ti své požehnání dal, můj synu.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_04");	//Nechť tě Innos doprovází, můj synu!
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_05");	//Ale můj synu! Bez přiměřeného daru církvi ti požehnání dát nemohu.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_06");	//Jak jinak bych si mohl být jistý tvými dobrými úmysly?
	};
};


instance DIA_Daron_Spenden(C_Info)
{
	npc = KDF_511_Daron;
	nr = 3;
	condition = DIA_Daron_Spenden_Condition;
	information = DIA_Daron_Spenden_Info;
	permanent = FALSE;
	description = "Takže jak vysoký dar se tady většinou dává?";
};


func int DIA_Daron_Spenden_Condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Daron_Spenden_Info()
{
	AI_Output(other,self,"DIA_Daron_Spenden_15_00");	//Takže jak vysoký dar se tady většinou dává?
	AI_Output(self,other,"DIA_Daron_Spenden_10_01");	//No, to záleží na tom, jak velký majetek máš. Nech mě se podívat, kolik u sebe máš.
	AI_Output(self,other,"DIA_Daron_Spenden_10_02");	//(nahlíží do měšce) Mmmmh hmmm...
	if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		AI_Output(self,other,"DIA_Daron_Spenden_10_03");	//Hm, jsi ubohá duše, že? Nech si to málo, co máš.
		if(MIS_Thorben_GetBlessings == LOG_Running)
		{
			B_LogEntry(TOPIC_Thorben,"Daron, mág ohně, mi nechtěl požehnat. Nejspíš mu budu muset nejdřív poskytnout nějaké zlato jako milodar.");
		};
	}
	else
	{
		if(Npc_HasItems(other,ItMi_Gold) < 50)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_04");	//No, nemáš mnoho, ale ani nejsi chudý. 10 zlatých pro Innose - žijeme skromně.
			B_GiveInvItems(other,self,ItMi_Gold,10);
		}
		else if(Npc_HasItems(other,ItMi_Gold) < 100)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_05");	//Máš víc než 50 zlatých. Daruj Innosovi 25 a dostaneš jeho požehnání.
			B_GiveInvItems(other,self,ItMi_Gold,25);
		}
		else
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_06");	//Máš víc než sto zlatých - Pán říká, že když máš, měl bys dát.
			AI_Output(self,other,"DIA_Daron_Spenden_10_07");	//Církev přijímá tvůj štědrý dar.
			B_GiveInvItems(other,self,ItMi_Gold,50);
		};
		AI_Output(self,other,"DIA_Daron_Spenden_10_08");	//Žehnám ti ve jménu Innosově. On je světlo a spravedlnost.
		Daron_Segen = TRUE;
		B_GivePlayerXP(XP_InnosSegen);
		if(MIS_Thorben_GetBlessings == LOG_Running)
		{
			B_LogEntry(TOPIC_Thorben,"Daron, mág ohně, mi dal své požehnání.");
		};
	};
};


instance DIA_Daron_Woher(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Woher_Condition;
	information = DIA_Daron_Woher_Info;
	permanent = FALSE;
	description = "Odkud jsi přišel?";
};


func int DIA_Daron_Woher_Condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Daron_Woher_Info()
{
	AI_Output(other,self,"DIA_Daron_Woher_15_00");	//Odkud jsi přišel?
	AI_Output(self,other,"DIA_Daron_Woher_10_01");	//Přicházím z kláštera mágů, který leží v horách.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Woher_10_02");	//U nás je vítán každý, jehož srdce je čisté a cítí potřebu sloužit našemu všemocnému Pánu Innosovi.
	};
};


instance DIA_Daron_Innos(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Innos_Condition;
	information = DIA_Daron_Innos_Info;
	permanent = FALSE;
	description = "Řekni mi něco o Innosovi.";
};


func int DIA_Daron_Innos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher) && (other.guild != GIL_KDF) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Daron_Innos_Info()
{
	AI_Output(other,self,"DIA_Daron_Innos_15_00");	//Řekni mi něco o Innosovi.
	AI_Output(self,other,"DIA_Daron_Innos_10_01");	//Innos, náš všemocný pán, je světlo a oheň.
	AI_Output(self,other,"DIA_Daron_Innos_10_02");	//Rozhodl se, že lidé budou jeho nástrojem, a dal jim magii a zákony.
	AI_Output(self,other,"DIA_Daron_Innos_10_03");	//Jednáme jeho jménem. Vykonáváme spravedlnost dle jeho vůle a kážeme jeho slovo.
};


instance DIA_Daron_Kloster(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Kloster_Condition;
	information = DIA_Daron_Kloster_Info;
	permanent = FALSE;
	description = "Pověz mi o klášteře.";
};


func int DIA_Daron_Kloster_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher) || (Npc_KnowsInfo(other,DIA_Daron_Paladine) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Daron_Kloster_Info()
{
	AI_Output(other,self,"DIA_Daron_Kloster_15_00");	//Pověz mi o klášteře.
	AI_Output(self,other,"DIA_Daron_Kloster_10_01");	//Učíme naše studenty všechny formy magie. Ale umění ohnivých mágů spočívá i v něčem jiném než jen v tomhle.
	AI_Output(self,other,"DIA_Daron_Kloster_10_02");	//Jsme též zběhlí v umění alchymie a ve vytváření mocných run.
	AI_Output(self,other,"DIA_Daron_Kloster_10_03");	//Také děláme skvělé víno.
};


instance DIA_Daron_Stadt(C_Info)
{
	npc = KDF_511_Daron;
	nr = 99;
	condition = DIA_Daron_Stadt_Condition;
	information = DIA_Daron_Stadt_Info;
	permanent = FALSE;
	description = "Co děláš ve městě?";
};


func int DIA_Daron_Stadt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher))
	{
		return TRUE;
	};
};

func void DIA_Daron_Stadt_Info()
{
	AI_Output(other,self,"DIA_Daron_Stadt_15_00");	//Co děláš ve městě?
	AI_Output(self,other,"DIA_Daron_Stadt_10_01");	//Vedu jednání s paladiny a jsem nápomocen občanům radou a můžu tu tam ztratit slovo.
	AI_Output(self,other,"DIA_Daron_Stadt_10_02");	//Obzvláště v takovýchto těžkých dobách je naší povinností být lidu ku pomoci a starat se o chudé.
};


instance DIA_Addon_Daron_GuildHelp(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Addon_Daron_GuildHelp_Condition;
	information = DIA_Addon_Daron_GuildHelp_Info;
	description = "Slyšel jsem něco o té sošce. Jediné, co to bylo je, že jsi ji ztratil.";
};


func int DIA_Addon_Daron_GuildHelp_Condition()
{
	if((MIS_Addon_Vatras_Go2Daron == LOG_Running) && Npc_KnowsInfo(other,DIA_Daron_Stadt))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_GuildHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_00");	//Slyšel jsem něco o té sošce. Jediné, co to bylo je, že jsi ji ztratil.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_01");	//Taktak. Tos mohl slyšet pouze od mága Vody Vatrase.
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_02");	//Jaký je problém?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_03");	//Cenná soška byla poslána do kláštera z pevniny. Nikdy jsem ji ale nedonesl do kláštera.
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_04");	//Byla loď vyloděna?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_05");	//(vyveden z míry) Ne. Přistála bezpečně v Khorinisu a bezpečně jsem ji vyzvedl.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_06");	//Nicméně skončila v rukou nějakých goblinů, když jsem ji nesl do kláštera.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_07");	//(nevrle) Nedívej se na mě takto. My mágové také nejsme neomylní.
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_Running;
	Info_ClearChoices(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Říkáš, že ji nyní mají goblini?",DIA_Addon_Daron_GuildHelp_gobbos);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Kde jsi tu sošku ztratil?",DIA_Addon_Daron_GuildHelp_wo);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Nezkoušels dostat tu sošku zpět?",DIA_Addon_Daron_GuildHelp_wiederholen);
};

func void DIA_Addon_Daron_GuildHelp_wiederholen()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wiederholen_15_00");	//Nezkoušels dostat tu sošku zpátky?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wiederholen_10_01");	//Samozřejmě! Prozkoumal jsem vstup do jeskyně, ale bez úspěchu.
};

func void DIA_Addon_Daron_GuildHelp_gobbos()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_gobbos_15_00");	//Říkáš, že ji nyní mají goblini?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_01");	//Vzali ji a zmizeli s ní kdesi v křoví.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_02");	//Už jsem ji znovu neviděl. Mohli se odplazit do nějaké díry.
};

func void DIA_Addon_Daron_GuildHelp_wo()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wo_15_00");	//Kde jsi tu sošku ztratil?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wo_10_01");	//Blízko Orlanovy hospody. Je to na cestě do kláštera.
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Slyšel jsem dost. Najdu to pro tebe.",DIA_Addon_Daron_GuildHelp_auftrag);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Orlanova hospoda? Kde je to?",DIA_Addon_Daron_GuildHelp_woTaverne);
};

func void DIA_Addon_Daron_GuildHelp_woTaverne()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_woTaverne_15_00");	//Orlanova hospoda? Kde to je?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_01");	//Vyjdeš tady tou branou a půjdeš dokud neuvidíš osamělý barák.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_02");	//To je Orlanova hospoda. 'U mrtvé harpyje'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_auftrag_15_00");	//Slyšel jsem už dost. Najdu tu sošku.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_auftrag_10_01");	//Ať tě Innos vede a odvrátí od tebe všechna nebezpečí, která na tebe číhají za těmito vraty.
	Info_ClearChoices(DIA_Addon_Daron_GuildHelp);
	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF,"Daron byl okraden nějakými gobliny. Od té doby postrádá cennou sošku, která něco pro klášter znamenala. Daron věří, že goblini se skrývají nedaleko hospody 'U mrtvé harpyje'.");
};


instance DIA_Addon_Daron_FoundStatue(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Addon_Daron_FoundStatue_Condition;
	information = DIA_Addon_Daron_FoundStatue_Info;
	description = "Našel jsem tvou sošku.";
};


func int DIA_Addon_Daron_FoundStatue_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && (DIA_Gorax_GOLD_perm == FALSE) && (MIS_Addon_Daron_GetStatue == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_FoundStatue_Info()
{
	AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_00");	//Našel jsem tu sošku.
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_01");	//Díky Innosovi!
	AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_02");	//Co s tím budeš dělat nyní?
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_03");	//Přineslo mi to pouze neštěstí.
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_04");	//Dones to do kláštera, synu.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_05");	//(Uznale) Můžeš být vpuštěn dovnitř jestli zasvětíš zbytek svého života klášteru.
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_06");	//Ale jsem si jist; když jsi řádně splnil MŮJ požadavek, jsi už připraven, neníliž pravda?
	};
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_07");	//Innos s tebou, synu!
};


instance DIA_Addon_Daron_ReturnedStatue(C_Info)
{
	npc = KDF_511_Daron;
	nr = 5;
	condition = DIA_Addon_Daron_ReturnedStatue_Condition;
	information = DIA_Addon_Daron_ReturnedStatue_Info;
	description = "Donesl jsem tu sošku do kláštera, nyní můžeš v klidu odpočívat.";
};


func int DIA_Addon_Daron_ReturnedStatue_Condition()
{
	if((DIA_Gorax_GOLD_perm == TRUE) && (MIS_Addon_Daron_GetStatue == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_ReturnedStatue_Info()
{
	AI_Output(other,self,"DIA_Addon_Daron_ReturnedStatue_15_00");	//Donesl jsem tu sošku do kláštera, nyní můžeš v klidu odpočívat.
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_01");	//Konečně dobrá zpráva. Ať tě Innos ochraňuje.
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_02");	//Přijmi toto jako malou odměnu, synu.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	TOPIC_End_RangerHelpKDF = TRUE;
	B_GivePlayerXP(XP_Addon_ReportLostInnosStatue2Daron);
};


instance DIA_Daron_arm(C_Info)
{
	npc = KDF_511_Daron;
	nr = 10;
	condition = DIA_Daron_arm_Condition;
	information = DIA_Daron_arm_Info;
	permanent = FALSE;
	description = "Já jsem chudý!";
};


func int DIA_Daron_arm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Stadt) && (Npc_HasItems(other,ItMi_Gold) < 10) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Daron_arm_Info()
{
	AI_Output(other,self,"DIA_Daron_arm_15_00");	//Já jsem chudý!
	AI_Output(self,other,"DIA_Daron_arm_10_01");	//Vida, jsi bez peněz. Žádný div, v takovéto době. Vezmi si tyhle zlaťáky, snad ti budou ku prospěchu.
	AI_Output(self,other,"DIA_Daron_arm_10_02");	//Ale měl by ses pokusit najít si práci, peníze se k tobě pak jen pohrnou. A pak bys mohl obdarovat Innosovu církev, stejně jako ona obdarovala tebe.
	B_GiveInvItems(self,other,ItMi_Gold,20);
};


instance DIA_Daron_Spende(C_Info)
{
	npc = KDF_511_Daron;
	nr = 990;
	condition = DIA_Daron_Spende_Condition;
	information = DIA_Daron_Spende_Info;
	permanent = TRUE;
	description = "Rád bych věnoval nějaký dar.";
};


var int DIA_Daron_Spende_permanent;

func int DIA_Daron_Spende_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Daron_Spende_permanent == FALSE) && Npc_KnowsInfo(other,DIA_Daron_Spenden) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Spende_Info()
{
	AI_Output(other,self,"DIA_Daron_Spende_15_00");	//Rád bych věnoval nějaký dar.
	Info_ClearChoices(DIA_Daron_Spende);
	if(Daron_Spende < 1000)
	{
		Info_AddChoice(DIA_Daron_Spende,"Ale nemám dost zlata... (ZPĚT)",DIA_Daron_Spende_BACK);
		Info_AddChoice(DIA_Daron_Spende,"(50 zlatých)",DIA_Daron_Spende_50);
		Info_AddChoice(DIA_Daron_Spende,"(100 zlatých)",DIA_Daron_Spende_100);
		Info_AddChoice(DIA_Daron_Spende,"(200 zlatých)",DIA_Daron_Spende_200);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_10_01");	//Celkem jsi mi daroval více než 1000 zlatých.
		AI_Output(self,other,"DIA_Daron_Spende_10_02");	//Požehnání Pána Innose bude neustále s tebou.
		DIA_Daron_Spende_permanent = TRUE;
		B_DaronSegen();
	};
};

func void DIA_Daron_Spende_BACK()
{
	AI_Output(other,self,"DIA_Daron_Spende_BACK_15_00");	//Ale nepřinesl jsem dost peněz.
	AI_Output(self,other,"DIA_Daron_Spende_BACK_10_01");	//To nevadí, můj synu. Můžeš dát později, kolik jen budeš chtít.
	Info_ClearChoices(DIA_Daron_Spende);
};


var int Daron_Spende;

func void DIA_Daron_Spende_50()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_00");	//Žehnám ti ve jménu Innosově. On je světlo a spravedlnost.
		Daron_Spende = Daron_Spende + 50;
		B_DaronSegen();
		Daron_Segen = TRUE;
		if(MIS_Thorben_GetBlessings == LOG_Running)
		{
			B_LogEntry(TOPIC_Thorben,"Daron, mág ohně, mi dal své požehnání.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_01");	//Svůj dar můžeš dát kdykoliv později, až u sebe budeš mít dost peněz.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_100()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_00");	//Innosi, jsi světlo, jež září na cestu spravedlivých.
		AI_Output(self,other,"DIA_Daron_Spende_100_10_01");	//Tvým jménem žehnám tomuto muži. Nechť na něj září tvé světlo.
		Daron_Spende = Daron_Spende + 100;
		B_DaronSegen();
		Daron_Segen = TRUE;
		if(MIS_Thorben_GetBlessings == LOG_Running)
		{
			B_LogEntry(TOPIC_Thorben,"Daron, mág ohně, mi dal své požehnání.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_02");	//Pán říká - chceš-li se modlit, otevři svou duši. A chceš-li věnovat dar, přines jej s sebou.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_200()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_00");	//Innos, požehnej tomuto muži. Nechť na něj září tvé světlo.
		AI_Output(self,other,"DIA_Daron_Spende_200_10_01");	//Dej mu sílu chovat se spravedlivě.
		Daron_Spende = Daron_Spende + 200;
		B_DaronSegen();
		Daron_Segen = TRUE;
		if(MIS_Thorben_GetBlessings == LOG_Running)
		{
			B_LogEntry(TOPIC_Thorben,"Daron, mág ohně, mi dal své požehnání.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_02");	//Pokud bys chtěl darovat tolik peněz, měl bys je s sebou také přinést.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};


instance DIA_Daron_PICKPOCKET(C_Info)
{
	npc = KDF_511_Daron;
	nr = 900;
	condition = DIA_Daron_PICKPOCKET_Condition;
	information = DIA_Daron_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Daron_PICKPOCKET_Condition()
{
	return C_Beklauen(47,80);
};

func void DIA_Daron_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Daron_PICKPOCKET);
	Info_AddChoice(DIA_Daron_PICKPOCKET,Dialog_Back,DIA_Daron_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Daron_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Daron_PICKPOCKET_DoIt);
};

func void DIA_Daron_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Daron_PICKPOCKET);
};

func void DIA_Daron_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Daron_PICKPOCKET);
};

