
instance DIA_Addon_Samuel_EXIT(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 999;
	condition = DIA_Addon_Samuel_EXIT_Condition;
	information = DIA_Addon_Samuel_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Samuel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Samuel_Hello(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 1;
	condition = DIA_Addon_Samuel_Hello_Condition;
	information = DIA_Addon_Samuel_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Samuel_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_00");	//Ah, nová tvář!
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_01");	//Chceš rum - anebo něco silnějšího?
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};


instance DIA_Addon_Samuel_Francis(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 2;
	condition = DIA_Addon_Samuel_Francis_Condition;
	information = DIA_Addon_Samuel_Francis_Info;
	description = "Chci si s tebou promluvit o Francisovi.";
};


func int DIA_Addon_Samuel_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Samuel_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_00");	//Chci si s tebou promluvit o Francisovi.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_01");	//Nezačínej o tom rádoby-kapitánovi!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_02");	//Celý den vysedává na lavičce a cítí se důležitě!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_03");	//Všechny zajíma, kterému čertu jsem dlužni, že kapitán vybral zrovna jeho!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_04");	//Co chceš od toho malého nafoukance?
};


instance DIA_Addon_Samuel_Versteck(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 3;
	condition = DIA_Addon_Samuel_Versteck_Condition;
	information = DIA_Addon_Samuel_Versteck_Info;
	description = "Potřebuji se dostat do Gregovy chatrče.";
};


func int DIA_Addon_Samuel_Versteck_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Samuel_Francis) && (Francis_ausgeschissen == FALSE) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Versteck_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_02");	//Potřebuji se dostat do Gregovy chatrče.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_05");	//(šibalsky) Jo? Proč?
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_01");	//Potřebuji zbroj banditů.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_06");	//(smích) Francis tě nikdy dobrovolně do chatrče nepustí, aby sis mohl šlohnout Gregovy věci.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_07");	//Jedině, že by ...
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_03");	//Ano?
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_08");	//... jsi měl něco, co skutečně shaní.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_09");	//Vím, že Francis něco ukrývá v opuštěném dole v kaňonu.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_10");	//Měli jsme jednou spolu stráž. Usnul a mluvil o tom ze spaní.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_11");	//Nemám ponětí, co tam zahrabal, ale pokud je to dostatečně důležité, pak tě dovnitř pustí ...
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_12");	//Až se kapitán vrátí a zjistí, že jeho věci chybí, dá Francisovi víc než pořádnej výprask.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Samuel mi řekl o tajné Francisově skrýši v jednom dolu v kaňonu. Možná najdu něco, co mi pomůže dostat se do chatrče.");
};


var int Samuel_Knows_LousHammer;
var int Samuel_Knows_SchlafHammer;

instance DIA_Addon_Samuel_Recipe(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 4;
	condition = DIA_Addon_Samuel_Recipe_Condition;
	information = DIA_Addon_Samuel_Recipe_Info;
	permanent = TRUE;
	description = "Mám pro tebe recept!";
};


func int DIA_Addon_Samuel_Recipe_Condition()
{
	if(((Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept) > 0)) || ((Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept2) > 0)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Recipe_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_15_00");	//Mám pro tebe recept!
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_14_01");	//Oh, nech mě podívat, co za recept to je?
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);
	if((Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept) > 0))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe,"Louovo Kladivo",DIA_Addon_Samuel_Recipe_LousHammer);
	};
	if((Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept2) > 0))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe,"Louovo dvojité kladivo",DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};

func void DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);
};

func void DIA_Addon_Samuel_Recipe_LousHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousHammer_15_00");	//Je to od Snafa.
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04");	//Zní to úplně hrozně. Hned to jdu zkusit.
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};

func void DIA_Addon_Samuel_Recipe_LousDoubleHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00");	//Je to skutečnej zabiják, dej si pozor!
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept2,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04");	//Začínám se bát. Myslím, že to i tak vyzkouším.
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_SchlafHammer = TRUE;
};


var int Samuel_Grog_Varianz;

instance DIA_Addon_Samuel_Grog(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 5;
	condition = DIA_Addon_Samuel_Grog_Condition;
	information = DIA_Addon_Samuel_Grog_Info;
	permanent = TRUE;
	description = "Chci si vzít svůj podíl grogu. (10 zlata)";
};


func int DIA_Addon_Samuel_Grog_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Grog_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Grog_15_00");	//Chci si vzít svůj podíl grogu.
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		if(Samuel_Grog_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_01");	//Vy mladíci nepohnete ani prstem bez grogu co? A to je správně.
			Samuel_Grog_Varianz = 1;
		}
		else if(Samuel_Grog_Varianz == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_02");	//Doufám, že to je přijatelné. Nemám dostatek čisté vody. Ale trochu slané tomu neublíží, ne?
			Samuel_Grog_Varianz = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_03");	//Můžeš mít tolik grogu, kolik chceš.
		};
		B_GiveInvItems(self,other,ItFo_Addon_Grog,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_04");	//Prodávám to levně, ale ne zadarmo! Sežeň si nejdřív zlato, mladíku!
	};
};


var int Samuel_Rum_Varianz;

instance DIA_Addon_Samuel_Rum(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 6;
	condition = DIA_Addon_Samuel_Rum_Condition;
	information = DIA_Addon_Samuel_Rum_Info;
	permanent = TRUE;
	description = "Dej mi rum (30 zlata)";
};


func int DIA_Addon_Samuel_Rum_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Rum_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Rum_15_00");	//Dej mi rum!
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		if(Samuel_Rum_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_01");	//Ah! Mateřské mléko námořníka. Tady máš!
			Samuel_Rum_Varianz = 1;
		}
		else if(Samuel_Rum_Varianz == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_02");	//Rum může trošku smrdět rybinou. Máme jen staré sudy od sleďů. Ale rum zůstane rumem. Nechť ti chutná.
			Samuel_Rum_Varianz = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_03");	//Tady máš!
		};
		B_GiveInvItems(self,other,ItFo_Addon_Rum,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_04");	//Nemáš dost zlata, mladíku! Což takhle dát si grog?
	};
};


var int Samuel_Stronger_Varianz;
var int Samuel_DoppelHammer_Varianz;

instance DIA_Addon_Samuel_Stronger(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 7;
	condition = DIA_Addon_Samuel_Stronger_Condition;
	information = DIA_Addon_Samuel_Stronger_Info;
	permanent = TRUE;
	description = "Potřebuji něco silnějšího!";
};


func int DIA_Addon_Samuel_Stronger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Stronger_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_00");	//Potřebuji něco silnějšího!
	if(Samuel_Stronger_Varianz == 0)
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_01");	//Áá, dobrodružná duše! Ja vždy hledám nové recepty!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_02");	//Pořádná kořalka má být čistá a silná. Musí projít hrdlem jako tekutý oheň.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_03");	//Je to dost těžké. Ale už moc řečním. Ty chceš pít!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_04");	//Tady! Můj vlastní recept! Chutná ti to? Jmenuje se to 'Rychlý sleď'
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
		B_UseItem(other,ItFo_Addon_SchnellerHering);
		AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_05");	//Působivé!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_06");	//(smích) Řekl bych, že jo.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_07");	//Neznáš náhodou nějakej dobrej recept na kořalku? Pokud jo, tak mi řekni.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_08");	//Chceš další?
		Samuel_Stronger_Varianz = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_09");	//Co můžu dostat?
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo dvojité kladivo (60 zlata)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo kladivo (30 zlata)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Rychlý sleď (30 zlata)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void B_Addon_Samuel_NoGold()
{
	AI_Output(self,other,"DIA_Addon_Samuel_NoGold_14_00");	//Není zlato, není pití!
};

func void DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
};

func void DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00");	//Dej mi trošku z toho rychlého sledě.
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01");	//Silná věcička, ale udělá svoje!
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo Dvojité kladivo (60 zlata)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo Kladivo (30 zlata)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Rychlý sleď (30 zlata)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousHammer_15_00");	//Chci Louovo kladivo!
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01");	//Dobrá věc! Na ochranu!
		B_GiveInvItems(self,other,ItFo_Addon_LousHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo Dvojité kladivo (60 zlata)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo Kladivo (30 zlata)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Rychlý sleď (30 zlata)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00");	//(nenuceně) Dej mi dvojité. Dvojité kladivo.
	if(B_GiveInvItems(other,self,ItMi_Gold,Value_SchlafHammer))
	{
		if(Samuel_DoppelHammer_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01");	//Neudělej ze sebe ubožáka. Doufám, že to není pro tebe.
		}
		else
		{
			AI_Output(self,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02");	//Ano! To bude duševní tanec!
		};
		B_GiveInvItems(self,other,ItFo_Addon_SchlafHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo Dvojité kladivo (60 zlata)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Louovo Kladivo (30 zlata)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Rychlý sleď (30 zlata)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};


instance DIA_Addon_Samuel_Trade(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 8;
	condition = DIA_Addon_Samuel_Trade_Condition;
	information = DIA_Addon_Samuel_Trade_Info;
	permanent = TRUE;
	description = "Co ještě máš?";
	trade = TRUE;
};


func int DIA_Addon_Samuel_Trade_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Trade_Info()
{
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItFo_Addon_Grog,Npc_HasItems(self,ItFo_Addon_Grog));
	CreateInvItems(self,ItFo_Addon_Grog,15);
	AI_Output(other,self,"DIA_Addon_Samuel_Trade_15_00");	//Co ještě máš?
	AI_Output(self,other,"DIA_Addon_Samuel_Trade_14_01");	//Dodávám všechno, co pirát potřebuje pro přežití.
};


instance DIA_Addon_Samuel_News(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 99;
	condition = DIA_Addon_Samuel_News_Condition;
	information = DIA_Addon_Samuel_News_Info;
	permanent = TRUE;
	description = "Něco nového v táboře?";
};


func int DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_News_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_News_15_00");	//Něco nového v táboře?
	if(Npc_IsDead(Francis) || (Francis_ausgeschissen == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_01");	//Francis dostal řádnej trest! Ani nevíš, jak jsem rád!
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_02");	//Ty jsi v pohodě. Pojď, vypijeme něco!
		if(GregIsBack == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_03");	//A Greg je konečně zpátky. Sice ztratil loď, ale aspoň udělal pořádek v táboře.
		};
	}
	else
	{
		if(!Npc_IsDead(Morgan))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_04");	//Od Gregova odjezdu se nic moc neděje. Morgan a většina jeho chlapu jenom chlastají.
		};
		if(!Npc_IsDead(Henry))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_05");	//Jediný, kdo něco dělá je Henry. On a jeho chlapci stavějí palisádu.
		};
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_06");	//Už je načase, aby se kapitán Greg vrátil a nakopal Francisovi řiť.
	};
};

