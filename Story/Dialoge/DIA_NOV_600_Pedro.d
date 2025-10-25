
instance DIA_Pedro_EXIT(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 999;
	condition = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pedro_WELCOME(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 1;
	condition = DIA_Pedro_WELCOME_Condition;
	information = DIA_Pedro_WELCOME_Info;
	important = TRUE;
};


func int DIA_Pedro_WELCOME_Condition()
{
	return TRUE;
};

func void DIA_Pedro_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_00");	//Vítej v Innosovu klášteře, cizinče.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_01");	//Jsem bratr Pedro, ponížený služebník Innose a strážce brány do svatého kláštera.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//Co potřebuješ?
};


instance DIA_Pedro_Wurst(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_Wurst_Condition;
	information = DIA_Pedro_Wurst_Info;
	permanent = FALSE;
	description = "Tady máš klobásu, bratře.";
};


func int DIA_Pedro_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Pedro_Wurst_15_00");	//Tady máš klobásu, bratře.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_01");	//Je od tebe hezké, žes na mě myslel. Každý na mě většinou zapomene.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_02");	//Možná bys mi mohl dát ještě jednu.
	AI_Output(other,self,"DIA_Pedro_Wurst_15_03");	//Na to zapomeň, pak bych jich neměl dost.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_04");	//No co, jedna klobáska - toho si nikdo nevšimne. Něco za to dostaneš - vím o místě, kde rostou ohnivé kopřivy.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_05");	//Když je doneseš Neorasovi, určitě ti dá klíč od knihovny. Co na to říkáš?
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	Info_ClearChoices(DIA_Pedro_Wurst);
	Info_AddChoice(DIA_Pedro_Wurst,"Fajn, tady máš další klobásu.",DIA_Pedro_Wurst_JA);
	Info_AddChoice(DIA_Pedro_Wurst,"Ne, na to zapomeň.",DIA_Pedro_Wurst_NEIN);
};

func void DIA_Pedro_Wurst_JA()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_JA_15_00");	//Fajn, tady máš další klobásu.
	AI_Output(self,other,"DIA_Pedro_Wurst_JA_09_01");	//Tak. Několik ohnivých kopřiv roste nalevo a napravo od můstku na druhém břehu.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Info_ClearChoices(DIA_Pedro_Wurst);
};

func void DIA_Pedro_Wurst_NEIN()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_NEIN_15_00");	//Ne, na to zapomeň.
	AI_Output(self,other,"DIA_Pedro_Wurst_NEIN_09_01");	//Chceš dobře vycházet s Goraxem, co? S novými novici to je vždycky stejné.
	Info_ClearChoices(DIA_Pedro_Wurst);
};


instance DIA_Pedro_EINLASS(C_Info)
{
	npc = NOV_600_Pedro;
	condition = DIA_Pedro_EINLASS_Condition;
	information = DIA_Pedro_EINLASS_Info;
	permanent = FALSE;
	description = "Chci vstoupit do kláštera.";
};


func int DIA_Pedro_EINLASS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pedro_WELCOME))
	{
		return TRUE;
	};
};

func void DIA_Pedro_EINLASS_Info()
{
	AI_Output(other,self,"DIA_Pedro_EINLASS_15_00");	//Chci vstoupit do kláštera.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_01");	//Do kláštera mohou vstoupit jen služebníci Innosovi.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_02");	//Jestli se chceš pomodlit k Innosovi, můžeš si najít nějakou svatyni u cesty. Na modlitby tam je dostatečný klid.
};


instance DIA_Pedro_TEMPEL(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_TEMPEL_Condition;
	information = DIA_Pedro_TEMPEL_Info;
	permanent = FALSE;
	description = "Co musím udělat, aby mě přijali do kláštera?";
};


func int DIA_Pedro_TEMPEL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_EINLASS) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pedro_TEMPEL_Info()
{
	AI_Output(other,self,"DIA_Pedro_TEMPEL_15_00");	//Co musím udělat, aby mě přijali do kláštera?
	if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_01");	//Přístup do kláštera ti je zapovězen - svou cestu sis již zvolil.
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_02");	//Pokud chceš vstoupit do Bratrstva Innosova, musíš se naučit a dodržovat pravidla kláštera.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_03");	//Navíc žádame po každém novém novici dárek Innosovi.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_04");	//Ovci a 1000 zlaťáků.
		AI_Output(other,self,"DIA_Pedro_TEMPEL_15_04");	//To je spousta zlata.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_05");	//Je to na znamení toho, že začínáš nový život jako Innosův služebník. Když tě klášter přijme, budou ti všechny tvoje předchozí hříchy odpuštěny.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_06");	//Ale rozmysli si to - jakmile se jednou staneš Innosovým služebníkem, nemůžeš to vzít zpět.
		SC_KnowsKlosterTribut = TRUE;
		Log_CreateTopic(Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus(Topic_Kloster,LOG_Running);
		B_LogEntry(Topic_Kloster,"Chci-li se stát novicem v Innosově klášteře, potřebuji ovci a velkou částku peněz.");
	};
};


instance DIA_Addon_Pedro_Statuette(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Addon_Pedro_Statuette_Condition;
	information = DIA_Addon_Pedro_Statuette_Info;
	permanent = FALSE;
	description = "Mám tady tuhle sošku...";
};


func int DIA_Addon_Pedro_Statuette_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && (MIS_Addon_Daron_GetStatue == LOG_Running) && Npc_KnowsInfo(other,DIA_Pedro_Rules) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pedro_Statuette_Info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_00");	//Mám tady tuhle sošku. Mám dojem, že ji postrádají v klášteře.
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_01");	//Můžu teď projít?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_02");	//Takže, za tohoto stavu věcí už ti nic nebrání stát se novicem.
		Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
		B_LogEntry(TOPIC_Addon_RangerHelpKDF,"Novic Pedro mě pustil do kláštera, protože jsem měl tu chybějící sošku. Měl bych ji doručit někomu v klášteře.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_03");	//Bojím se ale, že dokonce i s tímto vzácným skvostem tě nemůžu přijmout.
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_04");	//Už jsi se rozhodl pro jinou cestu. Cesta do kláštera pro tebe zůstává uzavřena.
	};
};


instance DIA_Addon_Pedro_Statuette_Abgeben(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information = DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent = FALSE;
	description = "Můžu ti tu sošku tady nechat?";
};


func int DIA_Addon_Pedro_Statuette_Abgeben_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette) && (hero.guild != GIL_NONE) && (hero.guild != GIL_NOV) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pedro_Statuette_Abgeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_Abgeben_15_00");	//Můžu ti tu sošku tady nechat?
	AI_Output(self,other,"DIA_Addon_Pedro_Statuette_Abgeben_09_01");	//Samozřejmě, okamžitě se o ni postarám. Díky za tvůj nesobecký skutek.
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_ReportLostInnosStatue2Daron);
};


instance DIA_Pedro_Rules(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_Rules_Condition;
	information = DIA_Pedro_Rules_Info;
	permanent = FALSE;
	description = "Podle jakých pravidel žijete?";
};


func int DIA_Pedro_Rules_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_TEMPEL))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Rules_Info()
{
	AI_Output(other,self,"DIA_Pedro_Rules_15_00");	//Podle jakých pravidel žijete?
	AI_Output(self,other,"DIA_Pedro_Rules_09_01");	//Innos je bůh pravdy a řádu, takže NIKDY nesmíš zalhat nebo spáchat nějaký zločin.
	AI_Output(self,other,"DIA_Pedro_Rules_09_02");	//Pokud se prohřešíš proti svému bratru nebo ukradneš něco z našich věcí, zaplatíš za to.
	AI_Output(self,other,"DIA_Pedro_Rules_09_03");	//Innos je také bůh vlády a ohně.
	AI_Output(self,other,"DIA_Pedro_Rules_09_04");	//Jakožto novic musíš prokazovat POSLUŠNOST a ÚCTU všem ohnivým mágům.
	AI_Output(other,self,"DIA_Pedro_Rules_15_05");	//Aha.
	AI_Output(self,other,"DIA_Pedro_Rules_09_06");	//Dále je POVINNOSTÍ novice vykonávat v klášteře všechny práce pro dobro našeho společenství.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_Rules_09_07");	//Pokud jsi připraven se těmito pravidly řídit a máš dar pro Innose, rádi tě přijmeme do kláštera jako novice.
	};
};


instance DIA_Pedro_AUFNAHME(C_Info)
{
	npc = NOV_600_Pedro;
	condition = DIA_Pedro_AUFNAHME_Condition;
	information = DIA_Pedro_AUFNAHME_Info;
	permanent = TRUE;
	description = "Chci se stát novicem.";
};


var int DIA_Pedro_AUFNAHME_NOPERM;

func int DIA_Pedro_AUFNAHME_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pedro_Rules) && (DIA_Pedro_AUFNAHME_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void B_DIA_Pedro_AUFNAHME_Choice()
{
	Info_ClearChoices(DIA_Pedro_AUFNAHME);
	Info_AddChoice(DIA_Pedro_AUFNAHME,"Ještě si to nechám projít hlavou.",DIA_Pedro_AUFNAHME_NO);
	Info_AddChoice(DIA_Pedro_AUFNAHME,"Ano, chci zasvětit svůj život službě Innosovi.",DIA_Pedro_AUFNAHME_YES);
};

func void DIA_Pedro_AUFNAHME_Info()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_15_00");	//Chci se stát novicem.
	Npc_PerceiveAll(self);
	if(hero.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_01");	//Svou cestu sis již zvolil. Cesta magie ti je uzavřena.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	else if(Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette))
	{
		AI_Output(self,other,"DIA_Addon_Pedro_AUFNAHME_09_02");	//Je to opravdu tvoje přání? Uvědom si ale jednu věc. Všechny ostatní cesty pro tebe zůstanou navždy uzavřeny.
		B_DIA_Pedro_AUFNAHME_Choice();
	}
	else if((hero.guild == GIL_NONE) && (Npc_HasItems(hero,ItMi_Gold) >= Summe_Kloster) && Wld_DetectNpc(self,Follow_Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_03");	//Vidím, žes přinesl požadovaný dar. Pokud opravdu chceš, můžeš se stát novicem.
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_04");	//Ale pokud se tak rozhodneš, už není cesty zpět - zvaž dobře, zda je toto cesta, po níž toužíš!
		B_DIA_Pedro_AUFNAHME_Choice();
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_02");	//Nepřinesl jsi požadovaný dar.
	};
};

func void DIA_Pedro_AUFNAHME_YES()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_00");	//Ano, chci zasvětit svůj život službě Innosovi.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_01");	//V tom případě vítej, bratře. Dám ti klíč ke klášterní bráně.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_02");	//Na důkaz své svobodné vůle sám otevři bránu a projdi dovnitř.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_03");	//Nyní jsi novic. Nos tento šat na znamení, že jsi teď členem bratrstva.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_04");	//Až budeš v klášteře, jdi za Parlanem. Od nynějška se bude starat o to, abys měl, co potřebuješ.
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_05");	//Budou teď mé prohřešky odpuštěny?
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_06");	//Ještě ne. Promluv si s mistrem Parlanem. Požehná ti a očistí tě od hříchů.
	CreateInvItems(self,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,hero,ItKe_Innos_MIS,1);
	CreateInvItems(other,ItAr_NOV_L,1);
	AI_EquipArmor(other,ItAr_NOV_L);
	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other,GIL_NOV);
	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = TRUE;
	B_GivePlayerXP(XP_AufnahmeNovize);
	if(Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette))
	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE;
	};
	Wld_AssignRoomToGuild("Kloster02",GIL_KDF);
	AI_StopProcessInfos(self);
};

func void DIA_Pedro_AUFNAHME_NO()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_NO_15_00");	//Ještě si to nechám projít hlavou.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_NO_09_01");	//Vrať se, až budeš připraven.
	Info_ClearChoices(DIA_Pedro_AUFNAHME);
};


instance DIA_Pedro_Monastery(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 90;
	condition = DIA_Pedro_Monastery_Condition;
	information = DIA_Pedro_Monastery_Info;
	permanent = TRUE;
	description = "Pověz mi o životě v klášteře.";
};


func int DIA_Pedro_Monastery_Condition()
{
	return TRUE;
};

func void DIA_Pedro_Monastery_Info()
{
	AI_Output(other,self,"DIA_Pedro_Monastery_15_00");	//Pověz mi o životě v klášteře.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_01");	//Žijeme v klášteře, abychom sloužili Innosovi. My novicové vykonáváme všechny práce a kdykoliv můžeme, studujeme posvátné knihy.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_02");	//Na nás dohlížejí mágové a ti zase zkoumají umění magie.
};


instance DIA_Pedro_PICKPOCKET(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 900;
	condition = DIA_Pedro_PICKPOCKET_Condition;
	information = DIA_Pedro_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Pedro_PICKPOCKET_Condition()
{
	return C_Beklauen(45,60);
};

func void DIA_Pedro_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
	Info_AddChoice(DIA_Pedro_PICKPOCKET,Dialog_Back,DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pedro_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
};

func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
};

