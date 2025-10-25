
instance DIA_Addon_Riordian_ADW_EXIT(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 999;
	condition = DIA_Addon_Riordian_ADW_EXIT_Condition;
	information = DIA_Addon_Riordian_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Riordian_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_HelloADW(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_HelloADW_Condition;
	information = DIA_Addon_Riordian_HelloADW_Info;
	description = "Čekal jsi něco takového?";
};


func int DIA_Addon_Riordian_HelloADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_HelloADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HelloADW_15_00");	//Čekal si něco takového?
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_01");	//Ne. Jsem ohromený, jak velké muselo být to město.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_02");	//Většina budov je pochovaná pod kameňím a hlínou, ale ruiny, které přežily dlouhé věky, jsou roztroušené po celé krajině.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_03");	//Žilo jich tu tisíce.
};


instance DIA_Addon_Riordian_WhatToFind(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhatToFind_Condition;
	information = DIA_Addon_Riordian_WhatToFind_Info;
	description = "S čím vším se můžu potkat zde v údolí?";
};


func int DIA_Addon_Riordian_WhatToFind_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_HelloADW))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_WhatToFind_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhatToFind_15_00");	//S čím vším se můžu potkat zde v údolí?
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_01");	//Na východě leží velká pevnost v bažině.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_02");	//Domníváme se, že se zde utábořili banditi.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_03");	//Kdyby jsem byl na tvojem místě, nešel bych tam dolů. Postavili tam mnoho stráží.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_04");	//Vyhýbej se močálu, pokud nemáš víc zkušeností, nebo si nájdi cestu, jak se dostat okolo banditů.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_05");	//Objevili jsme piráty na západě.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_06");	//Nejsem si jistý, ale myslím, že nás spozorovali.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_07");	//Vypadá to tak, že je naše přítomnost ruší.
};


instance DIA_Addon_Riordian_Gegend(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_Gegend_Condition;
	information = DIA_Addon_Riordian_Gegend_Info;
	permanent = TRUE;
	description = "Pověz mi víc o této oblasti.";
};


func int DIA_Addon_Riordian_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_WhatToFind) && (Saturas_RiesenPlan == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Addon_Riordian_Gegend_Info_OneTime;

func void DIA_Addon_Riordian_Gegend_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_15_00");	//Pověz mi víc o této oblasti.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_10_01");	//Co by si chtěl vědět?
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,Dialog_Back,DIA_Addon_Riordian_Gegend_Back);
	if((DIA_Addon_Riordian_Gegend_Info_OneTime == FALSE) && (Npc_HasItems(other,ItWr_Map_AddonWorld) == FALSE))
	{
		Info_AddChoice(DIA_Addon_Riordian_Gegend,"Je nějaká mapa oblasti?",DIA_Addon_Riordian_Gegend_map);
		DIA_Addon_Riordian_Gegend_Info_OneTime = TRUE;
	};
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Kde si viděl piráty?",DIA_Addon_Riordian_Gegend_Piraten);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Ještě jednou, kdeže jsou ti banditi?",DIA_Addon_Riordian_Gegend_bandits);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Byl si už na západě?",DIA_Addon_Riordian_Gegend_west);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Co leží na východě?",DIA_Addon_Riordian_Gegend_ost);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Kam se dostanu, když půjdu na jih?",DIA_Addon_Riordian_Gegend_sued);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Co je na severu?",DIA_Addon_Riordian_Gegend_nord);
};

func void DIA_Addon_Riordian_Gegend_Back()
{
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
};

func void DIA_Addon_Riordian_Gegend_map()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_map_15_00");	//Je nějaká mapa oblasti?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_map_10_01");	//Cronos jednu udělal. Určite ti ji přenechá.
};

func void DIA_Addon_Riordian_Gegend_bandits()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_bandits_15_00");	//Ještě jednou, kdeže jsou ti banditi?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_01");	//Mají jakousi pevnost s velkým množstvím strážních věží na východě.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_02");	//Aby si se tam dostal, musíš přejít přes velký močál.
};

func void DIA_Addon_Riordian_Gegend_Piraten()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_Piraten_15_00");	//Kde si viděl piráty?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_01");	//Byli na západě.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_02");	//Myslím, že lovili.
};

func void DIA_Addon_Riordian_Gegend_nord()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_nord_15_00");	//Co je na severu?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_01");	//Pokud mám veřit záznamům Stavitelů, nájdeš tam dlouhé údolí obklopené vysokými skálami.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_02");	//Tamnější povrch je jen poušť.
};

func void DIA_Addon_Riordian_Gegend_sued()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_sued_15_00");	//Kam se dostanu, když  půjdu na jih?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_01");	//Krajina na jihu je veľmi divoká.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_02");	//Nájdeš tam klikaté cestičky, vodopády a ruiny z kamení.
};

func void DIA_Addon_Riordian_Gegend_ost()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_ost_15_00");	//Co leží na východě?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_01");	//Velký močál, ta oblast je velmi nebezpečná.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_02");	//Nestřetneš tam jen bandity, ale i velmi nebezpečnou zvěř.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_03");	//Měl by si si dávat pozor.
};


var int DIA_Addon_Riordian_Gegend_west_OneTime;

func void DIA_Addon_Riordian_Gegend_west()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_west_15_00");	//Byl si už na západě?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_01");	//Ne. Podle všeho tam musí být pobřeží.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_02");	//Předpokládám, že piráti tam mají svůj tábor.
	if((DIA_Addon_Riordian_Gegend_west_OneTime == FALSE) && Npc_HasItems(VLK_4304_Addon_William,ITWr_Addon_William_01))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_03");	//Našli jsme tělo rybáře nedaleko odtud.
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_04");	//Měl by si se na to jít podívat.
		B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche);
		DIA_Addon_Riordian_Gegend_west_OneTime = TRUE;
	};
};


instance DIA_Addon_Riordian_HousesOfRulers(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_HousesOfRulers_Condition;
	information = DIA_Addon_Riordian_HousesOfRulers_Info;
	description = "Posílá mě Saturas. Hledám 5 učení Jharkendaru.";
};


func int DIA_Addon_Riordian_HousesOfRulers_Condition()
{
	if(MIS_Saturas_LookingForHousesOfRulers == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_HousesOfRulers_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HousesOfRulers_15_00");	//Posílá mě Saturas. Hledám 5 učení Jharkendaru?
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_01");	//Budu potřebovat mnoho času na najití učení podle záznamů.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_02");	//Ale teď ti to už můžu říct přesně.
	MIS_Riordian_HousesOfRulers = LOG_Running;
};


instance DIA_Addon_Riordian_WhereAreHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhereAreHouses_Condition;
	information = DIA_Addon_Riordian_WhereAreHouses_Info;
	description = "Kde můžu najít 5 učení Jharkendaru?";
};


func int DIA_Addon_Riordian_WhereAreHouses_Condition()
{
	if((MIS_Riordian_HousesOfRulers == LOG_Running) && (Saturas_SCBroughtAllToken == FALSE))
	{
		return TRUE;
	};
};


var int B_WhreAreHousesOfRulersOneTime;

func void B_WhreAreHousesOfRulers()
{
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_00");	//Dům učenců je velká budova. Musí byt někde na severu.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_01");	//Dům válečníků je pevnost obklopená kamením na východe.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_02");	//Knězi a strážcové měli svoje budovy blízko sebe. Měl by si je najít na jihozápadě.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_03");	//Léčitelé měli svoje obydlí na jihovýchodě.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_04");	//Pokud budou tyto budovy stát, poznáš je podle stylu v jakém jsou postavené.
		B_WhreAreHousesOfRulersOneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_05");	//Jsou vyvýšené. Schody vedou do vchodu krytého vysokým podloubím.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_06");	//Doufám, že ti to pomůže.
	};
	Log_CreateTopic(TOPIC_Addon_HousesOfRulers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers,LOG_Running);
	B_LogEntry(TOPIC_Addon_HousesOfRulers,"Dům učenců je velká budova. Musí být někde na severu.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"Dům válečníků je pevnost na východě, obklopená útesy.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"Kněží a strážcové byli blízko při sobě, měl by jsem je najít na jihozápadě.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"Dům lečitelů byl na jihovýchodě.");
};

func void DIA_Addon_Riordian_WhereAreHouses_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhereAreHouses_15_00");	//Kde můžu najít 5 učení Jharkendaru?
	B_WhreAreHousesOfRulers();
};


instance DIA_Addon_Riordian_FoundHouse(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundHouse_Condition;
	information = DIA_Addon_Riordian_FoundHouse_Info;
	permanent = TRUE;
	description = "Hmm, o těch učení...";
};


func int DIA_Addon_Riordian_FoundHouse_Condition()
{
	if((MIS_Riordian_HousesOfRulers == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Riordian_WhereAreHouses) && (RiordianHousesFoundCount < 5))
	{
		return TRUE;
	};
};



var int foundhouseinfo[6];
const int Library = 1;
const int heiler = 2;
const int Warrior = 3;
const int Priest = 4;
const int Totenw = 5;
var int RiordianHouseNeuigkeit;
var int RiordianHousesFoundCount;

func void DIA_Addon_Riordian_FoundHouse_Info()
{
	var int RiordianHouseXPs;
	RiordianHouseNeuigkeit = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_00");	//Hmmm, o těch učení...
	AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_01");	//Ano?
	if((SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == TRUE) && (FOUNDHOUSEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_02");	//Skřeti mají zjevně zájem o knihovnu Učenců.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_03");	//Myslíš si, že umí číst ve starém jazyce?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_04");	//Nemyslím, ale kdo ví.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_05");	//Takže by si se měl raději postarat, aby zmizli.
		FOUNDHOUSEINFO[1] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
		Log_CreateTopic(TOPIC_Addon_CanyonOrcs,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CanyonOrcs,LOG_Running);
		B_LogEntry(TOPIC_Addon_CanyonOrcs,"Mág Vody Riordian by se reději zbavil skřetů v kaňonu.");
	};
	if((Npc_IsDead(Stoneguardian_Heiler) || Npc_HasItems(other,ItMi_Addon_Stone_04) || (Saturas_SCFound_ItMi_Addon_Stone_04 == TRUE)) && (FOUNDHOUSEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_06");	//Domov lečitelů je uprostřed močálu a hlídá ho mnoho kamenných strážců.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_07");	//Stále stojí?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_08");	//Ano, ale do kdy?
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_09");	//Bolí mě, když vidím důkazy o minulosti v takovém stavu.
		FOUNDHOUSEINFO[2] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((RavenIsInTempel == TRUE) && (FOUNDHOUSEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_10");	//Sídlo válečníků použil Raven jako úkryt.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_11");	//(cynicky) Vybral si dobře.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_12");	//Je to nejbezpečnější pevnost v této oblasti.
		FOUNDHOUSEINFO[3] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((Npc_IsDead(Minecrawler_Priest) || Npc_HasItems(other,ItMi_Addon_Stone_03) || (Saturas_SCFound_ItMi_Addon_Stone_03 == TRUE)) && (FOUNDHOUSEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_13");	//V domě kněžích je mnoho důlních červů.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_14");	//Není tato oblast nepřirozená pro tato zvířata?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_15");	//Rozhodně.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_16");	//Och Adanosi, strašné věci se dějí v tomto kraji.
		FOUNDHOUSEINFO[4] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((Npc_IsDead(MayaZombie04_Totenw) || Npc_HasItems(other,ItMi_Addon_Stone_02) || (Saturas_SCFound_ItMi_Addon_Stone_02 == TRUE)) && (FOUNDHOUSEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_17");	//Obydlí strážců smrti, co byli ovládaní silou ďábla.
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_18");	//Myslím, že jsem ještě neviděl tolik zombií jako tady.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_19");	//Toto je neštěstí. Strážcové smrti se jistě stali vládci svojich schopností.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_20");	//Jejich solidarita k světu mrtvých jim uškodila. Doufám, že je dokážeš vyvést z omylu.
		FOUNDHOUSEINFO[5] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if(RiordianHouseNeuigkeit > 0)
	{
		RiordianHouseXPs = XP_Addon_Riordian_FoundHouse * RiordianHouseNeuigkeit;
		B_GivePlayerXP(RiordianHouseXPs);
		RiordianHousesFoundCount = RiordianHousesFoundCount + RiordianHouseNeuigkeit;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_21");	//Pověz mi ještě jednou, kde je každá čast.
		B_WhreAreHousesOfRulers();
	};
};


instance DIA_Addon_Riordian_OrksWeg(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_OrksWeg_Condition;
	information = DIA_Addon_Riordian_OrksWeg_Info;
	description = "Skřeti již brzy ztratí zájem o tento kraj.";
};


func int DIA_Addon_Riordian_OrksWeg_Condition()
{
	if(Npc_IsDead(OrcShaman_Sit_CanyonLibraryKey) && (FOUNDHOUSEINFO[1] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_OrksWeg_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_00");	//Skřeti již brzy ztratí zájem o tento kraj.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_01");	//Co tím myslíš?
	if(OrcShaman_Sit_CanyonLibraryKey.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_02");	//Zabil jsem jejich velitele.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_03");	//Jejich vůdce je mrtvý.
	};
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_04");	//Doufám, že máš pravdu.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_05");	//Opravdu nemůžeme vyvolat takové nepokoje.
	TOPIC_END_CanyonOrcs = TRUE;
	B_GivePlayerXP(XP_Addon_Riordian_OrksWeg);
};


instance DIA_Addon_Riordian_FoundAllHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundAllHouses_Condition;
	information = DIA_Addon_Riordian_FoundAllHouses_Info;
	description = "Našel jsem všechna učení.";
};


func int DIA_Addon_Riordian_FoundAllHouses_Condition()
{
	if((RiordianHousesFoundCount >= 5) && (MIS_Riordian_HousesOfRulers == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_FoundAllHouses_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_00");	//Našel jsem všecky učení.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_01");	//Byla všechna tam, kde jsem ti řekl?
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_02");	//Ano, víceméně.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_03");	//Fajn, tak moje práce měla význam.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_04");	//Díky.
	MIS_Riordian_HousesOfRulers = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_FoundAllHouses);
};


instance DIA_Addon_Riordian_ADW_PreTeach(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_ADW_PreTeach_Condition;
	information = DIA_Addon_Riordian_ADW_PreTeach_Info;
	description = "Můžeš mě naučit něco z tvých schopnosti?";
};


func int DIA_Addon_Riordian_ADW_PreTeach_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_PreTeach_15_00");	//Můžeš mě naučit něco z tvých schopnosti?
	AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_01");	//Můžu tě naučit alchymii.
	if(Npc_HasItems(other,ItAm_Addon_WispDetector) && (DIA_Addon_Riordian_Teach_NoPerm == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_02");	//A můžu ti ukázat, jak může tvoje bludička hledat věci.
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		Log_AddEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeach);
	};
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeachAlchemy);
	Riordian_ADW_ADDON_TeachWisp = TRUE;
	Riordian_ADW_ADDON_TeachAlchemy = TRUE;
};


instance DIA_Addon_Riordian_ADW_Teach(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 90;
	condition = DIA_Addon_Riordian_ADW_Teach_Condition;
	information = DIA_Addon_Riordian_ADW_Teach_Info;
	permanent = TRUE;
	description = "Ukáž mi, jak mám trénovat mou bludičku.";
};


var int DIA_Addon_Riordian_ADW_Teach_NoPerm;

func int DIA_Addon_Riordian_ADW_Teach_Condition()
{
	if((DIA_Addon_Riordian_ADW_Teach_NoPerm == FALSE) && (DIA_Addon_Riordian_Teach_NoPerm == FALSE) && (Riordian_ADW_ADDON_TeachWisp == TRUE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_ADW_Teach_Info()
{
	B_DIA_Addon_Riordian_Teach_15_00();
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
		Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,Dialog_Back,DIA_Addon_Riordian_ADW_Teach_BACK);
		B_DIA_Addon_Riordian_Teach_10_01();
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_FF,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF);
		};
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_NONE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_RUNE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_MAGIC,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_FOOD,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_POTIONS,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_Addon_Riordian_ADW_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void DIA_Addon_Riordian_ADW_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FOOD))
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_POTIONS))
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};


instance DIA_Riordian_ADW_TeachAlchemy(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 2;
	condition = DIA_Riordian_ADW_TeachAlchemy_Condition;
	information = DIA_Riordian_ADW_TeachAlchemy_Info;
	permanent = TRUE;
	description = "Ukáž mi, jak namíchat magické lektvary.";
};


var int DIA_Riordian_ADW_TeachAlchemy_permanent;

func int DIA_Riordian_ADW_TeachAlchemy_Condition()
{
	if((DIA_Riordian_ADW_TeachAlchemy_permanent == FALSE) && (Riordian_ADW_ADDON_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");	//Ukáž mi, jak namíchat magické lektvary.
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE))
	{
		Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,Dialog_Back,DIA_Riordian_ADW_TeachAlchemy_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Esence životní síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Riordian_ADW_TeachAlchemy_Health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Extrakt životní síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Riordian_ADW_TeachAlchemy_Health_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Esence many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Riordian_ADW_TeachAlchemy_Mana_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Extrakt many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Riordian_ADW_TeachAlchemy_Mana_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Elixír many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Riordian_ADW_TeachAlchemy_Mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Elixír ducha",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Riordian_ADW_TeachAlchemy_Perm_Mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Elixír síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),DIA_Riordian_ADW_TeachAlchemy_Perm_STR);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01");	//Magické nápoje se připravují v alchymistické koloně, jedna je ve tvém obydlí v poschodí.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02");	//Potřebuješ ale také prázdnou nádobu, ingredience a vědomosti jak magický lektvar připravit.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03");	//Ode mě můžeš mít vědomosti, ale ostatní věci si musíš opatřit sám.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04");	//Co chceš připravit?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05");	//Nemůžu tě naučit už nic, co by si neuměl.
		DIA_Riordian_ADW_TeachAlchemy_permanent = TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_BACK()
{
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_STR()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

