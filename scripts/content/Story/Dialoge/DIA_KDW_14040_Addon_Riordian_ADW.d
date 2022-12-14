
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
	description = "?ekal jsi n?co takov?ho?";
};


func int DIA_Addon_Riordian_HelloADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_HelloADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HelloADW_15_00");	//?ekal si n?co takov?ho?
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_01");	//Ne. Jsem ohromen?, jak velk? muselo b?t to m?sto.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_02");	//V?t?ina budov je pochovan? pod kame??m a hl?nou, ale ruiny, kter? p?e?ily dlouh? v?ky, jsou roztrou?en? po cel? krajin?.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_03");	//?ilo jich tu tis?ce.
};


instance DIA_Addon_Riordian_WhatToFind(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhatToFind_Condition;
	information = DIA_Addon_Riordian_WhatToFind_Info;
	description = "S ??m v??m se m??u potkat zde v ?dol??";
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
	AI_Output(other,self,"DIA_Addon_Riordian_WhatToFind_15_00");	//S ??m v??m se m??u potkat zde v ?dol??
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_01");	//Na v?chod? le?? velk? pevnost v ba?in?.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_02");	//Domn?v?me se, ?e se zde ut?bo?ili banditi.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_03");	//Kdyby jsem byl na tvojem m?st?, ne?el bych tam dol?. Postavili tam mnoho str???.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_04");	//Vyh?bej se mo??lu, pokud nem?? v?c zku?enost?, nebo si n?jdi cestu, jak se dostat okolo bandit?.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_05");	//Objevili jsme pir?ty na z?pad?.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_06");	//Nejsem si jist?, ale mysl?m, ?e n?s spozorovali.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_07");	//Vypad? to tak, ?e je na?e p??tomnost ru??.
};


instance DIA_Addon_Riordian_Gegend(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_Gegend_Condition;
	information = DIA_Addon_Riordian_Gegend_Info;
	permanent = TRUE;
	description = "Pov?z mi v?c o t?to oblasti.";
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
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_15_00");	//Pov?z mi v?c o t?to oblasti.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_10_01");	//Co by si cht?l v?d?t?
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,Dialog_Back,DIA_Addon_Riordian_Gegend_Back);
	if((DIA_Addon_Riordian_Gegend_Info_OneTime == FALSE) && (Npc_HasItems(other,ItWr_Map_AddonWorld) == FALSE))
	{
		Info_AddChoice(DIA_Addon_Riordian_Gegend,"Je n?jak? mapa oblasti?",DIA_Addon_Riordian_Gegend_map);
		DIA_Addon_Riordian_Gegend_Info_OneTime = TRUE;
	};
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Kde si vid?l pir?ty?",DIA_Addon_Riordian_Gegend_Piraten);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Je?t? jednou, kde?e jsou ti banditi?",DIA_Addon_Riordian_Gegend_bandits);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Byl si u? na z?pad??",DIA_Addon_Riordian_Gegend_west);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Co le?? na v?chod??",DIA_Addon_Riordian_Gegend_ost);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Kam se dostanu, kdy? p?jdu na jih?",DIA_Addon_Riordian_Gegend_sued);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Co je na severu?",DIA_Addon_Riordian_Gegend_nord);
};

func void DIA_Addon_Riordian_Gegend_Back()
{
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
};

func void DIA_Addon_Riordian_Gegend_map()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_map_15_00");	//Je n?jak? mapa oblasti?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_map_10_01");	//Cronos jednu ud?lal. Ur?ite ti ji p?enech?.
};

func void DIA_Addon_Riordian_Gegend_bandits()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_bandits_15_00");	//Je?t? jednou, kde?e jsou ti banditi?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_01");	//Maj? jakousi pevnost s velk?m mno?stv?m str??n?ch v??? na v?chod?.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_02");	//Aby si se tam dostal, mus?? p?ej?t p?es velk? mo??l.
};

func void DIA_Addon_Riordian_Gegend_Piraten()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_Piraten_15_00");	//Kde si vid?l pir?ty?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_01");	//Byli na z?pad?.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_02");	//Mysl?m, ?e lovili.
};

func void DIA_Addon_Riordian_Gegend_nord()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_nord_15_00");	//Co je na severu?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_01");	//Pokud m?m ve?it z?znam?m Stavitel?, n?jde? tam dlouh? ?dol? obklopen? vysok?mi sk?lami.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_02");	//Tamn?j?? povrch je jen pou??.
};

func void DIA_Addon_Riordian_Gegend_sued()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_sued_15_00");	//Kam se dostanu, kdy?  p?jdu na jih?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_01");	//Krajina na jihu je ve?mi divok?.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_02");	//N?jde? tam klikat? cesti?ky, vodop?dy a ruiny z kamen?.
};

func void DIA_Addon_Riordian_Gegend_ost()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_ost_15_00");	//Co le?? na v?chod??
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_01");	//Velk? mo??l, ta oblast je velmi nebezpe?n?.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_02");	//Nest?etne? tam jen bandity, ale i velmi nebezpe?nou zv??.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_03");	//M?l by si si d?vat pozor.
};


var int DIA_Addon_Riordian_Gegend_west_OneTime;

func void DIA_Addon_Riordian_Gegend_west()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_west_15_00");	//Byl si u? na z?pad??
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_01");	//Ne. Podle v?eho tam mus? b?t pob?e??.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_02");	//P?edpokl?d?m, ?e pir?ti tam maj? sv?j t?bor.
	if((DIA_Addon_Riordian_Gegend_west_OneTime == FALSE) && Npc_HasItems(VLK_4304_Addon_William,ITWr_Addon_William_01))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_03");	//Na?li jsme t?lo ryb??e nedaleko odtud.
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_04");	//M?l by si se na to j?t pod?vat.
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
	description = "Pos?l? m? Saturas. Hled?m 5 u?en? Jharkendaru.";
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
	AI_Output(other,self,"DIA_Addon_Riordian_HousesOfRulers_15_00");	//Pos?l? m? Saturas. Hled?m 5 u?en? Jharkendaru?
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_01");	//Budu pot?ebovat mnoho ?asu na najit? u?en? podle z?znam?.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_02");	//Ale te? ti to u? m??u ??ct p?esn?.
	MIS_Riordian_HousesOfRulers = LOG_Running;
};


instance DIA_Addon_Riordian_WhereAreHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhereAreHouses_Condition;
	information = DIA_Addon_Riordian_WhereAreHouses_Info;
	description = "Kde m??u naj?t 5 u?en? Jharkendaru?";
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
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_00");	//D?m u?enc? je velk? budova. Mus? byt n?kde na severu.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_01");	//D?m v?le?n?k? je pevnost obklopen? kamen?m na v?chode.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_02");	//Kn?zi a str??cov? m?li svoje budovy bl?zko sebe. M?l by si je naj?t na jihoz?pad?.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_03");	//L??itel? m?li svoje obydl? na jihov?chod?.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_04");	//Pokud budou tyto budovy st?t, pozn?? je podle stylu v jak?m jsou postaven?.
		B_WhreAreHousesOfRulersOneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_05");	//Jsou vyv??en?. Schody vedou do vchodu kryt?ho vysok?m podloub?m.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_06");	//Douf?m, ?e ti to pom??e.
	};
	Log_CreateTopic(TOPIC_Addon_HousesOfRulers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers,LOG_Running);
	B_LogEntry(TOPIC_Addon_HousesOfRulers,"D?m u?enc? je velk? budova. Mus? b?t n?kde na severu.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"D?m v?le?n?k? je pevnost na v?chod?, obklopen? ?tesy.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"Kn??? a str??cov? byli bl?zko p?i sob?, m?l by jsem je naj?t na jihoz?pad?.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"D?m le?itel? byl na jihov?chod?.");
};

func void DIA_Addon_Riordian_WhereAreHouses_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhereAreHouses_15_00");	//Kde m??u naj?t 5 u?en? Jharkendaru?
	B_WhreAreHousesOfRulers();
};


instance DIA_Addon_Riordian_FoundHouse(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundHouse_Condition;
	information = DIA_Addon_Riordian_FoundHouse_Info;
	permanent = TRUE;
	description = "Hmm, o t?ch u?en?...";
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
	AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_00");	//Hmmm, o t?ch u?en?...
	AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_01");	//Ano?
	if((SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == TRUE) && (FOUNDHOUSEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_02");	//Sk?eti maj? zjevn? z?jem o knihovnu U?enc?.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_03");	//Mysl?? si, ?e um? ??st ve star?m jazyce?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_04");	//Nemysl?m, ale kdo v?.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_05");	//Tak?e by si se m?l rad?ji postarat, aby zmizli.
		FOUNDHOUSEINFO[1] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
		Log_CreateTopic(TOPIC_Addon_CanyonOrcs,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CanyonOrcs,LOG_Running);
		B_LogEntry(TOPIC_Addon_CanyonOrcs,"M?g Vody Riordian by se red?ji zbavil sk?et? v ka?onu.");
	};
	if((Npc_IsDead(Stoneguardian_Heiler) || Npc_HasItems(other,ItMi_Addon_Stone_04) || (Saturas_SCFound_ItMi_Addon_Stone_04 == TRUE)) && (FOUNDHOUSEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_06");	//Domov le?itel? je uprost?ed mo??lu a hl?d? ho mnoho kamenn?ch str??c?.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_07");	//St?le stoj??
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_08");	//Ano, ale do kdy?
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_09");	//Bol? m?, kdy? vid?m d?kazy o minulosti v takov?m stavu.
		FOUNDHOUSEINFO[2] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((RavenIsInTempel == TRUE) && (FOUNDHOUSEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_10");	//S?dlo v?le?n?k? pou?il Raven jako ?kryt.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_11");	//(cynicky) Vybral si dob?e.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_12");	//Je to nejbezpe?n?j?? pevnost v t?to oblasti.
		FOUNDHOUSEINFO[3] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((Npc_IsDead(Minecrawler_Priest) || Npc_HasItems(other,ItMi_Addon_Stone_03) || (Saturas_SCFound_ItMi_Addon_Stone_03 == TRUE)) && (FOUNDHOUSEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_13");	//V dom? kn???ch je mnoho d?ln?ch ?erv?.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_14");	//Nen? tato oblast nep?irozen? pro tato zv??ata?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_15");	//Rozhodn?.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_16");	//Och Adanosi, stra?n? v?ci se d?j? v tomto kraji.
		FOUNDHOUSEINFO[4] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((Npc_IsDead(MayaZombie04_Totenw) || Npc_HasItems(other,ItMi_Addon_Stone_02) || (Saturas_SCFound_ItMi_Addon_Stone_02 == TRUE)) && (FOUNDHOUSEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_17");	//Obydl? str??c? smrti, co byli ovl?dan? silou ??bla.
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_18");	//Mysl?m, ?e jsem je?t? nevid?l tolik zombi? jako tady.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_19");	//Toto je ne?t?st?. Str??cov? smrti se jist? stali vl?dci svojich schopnost?.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_20");	//Jejich solidarita k sv?tu mrtv?ch jim u?kodila. Douf?m, ?e je dok??e? vyv?st z omylu.
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
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_21");	//Pov?z mi je?t? jednou, kde je ka?d? ?ast.
		B_WhreAreHousesOfRulers();
	};
};


instance DIA_Addon_Riordian_OrksWeg(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_OrksWeg_Condition;
	information = DIA_Addon_Riordian_OrksWeg_Info;
	description = "Sk?eti ji? brzy ztrat? z?jem o tento kraj.";
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
	AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_00");	//Sk?eti ji? brzy ztrat? z?jem o tento kraj.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_01");	//Co t?m mysl???
	if(OrcShaman_Sit_CanyonLibraryKey.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_02");	//Zabil jsem jejich velitele.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_03");	//Jejich v?dce je mrtv?.
	};
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_04");	//Douf?m, ?e m?? pravdu.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_05");	//Opravdu nem??eme vyvolat takov? nepokoje.
	TOPIC_END_CanyonOrcs = TRUE;
	B_GivePlayerXP(XP_Addon_Riordian_OrksWeg);
};


instance DIA_Addon_Riordian_FoundAllHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundAllHouses_Condition;
	information = DIA_Addon_Riordian_FoundAllHouses_Info;
	description = "Na?el jsem v?echna u?en?.";
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
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_00");	//Na?el jsem v?ecky u?en?.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_01");	//Byla v?echna tam, kde jsem ti ?ekl?
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_02");	//Ano, v?cem?n?.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_03");	//Fajn, tak moje pr?ce m?la v?znam.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_04");	//D?ky.
	MIS_Riordian_HousesOfRulers = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_FoundAllHouses);
};


instance DIA_Addon_Riordian_ADW_PreTeach(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_ADW_PreTeach_Condition;
	information = DIA_Addon_Riordian_ADW_PreTeach_Info;
	description = "M??e? m? nau?it n?co z tv?ch schopnosti?";
};


func int DIA_Addon_Riordian_ADW_PreTeach_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_PreTeach_15_00");	//M??e? m? nau?it n?co z tv?ch schopnosti?
	AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_01");	//M??u t? nau?it alchymii.
	if(Npc_HasItems(other,ItAm_Addon_WispDetector) && (DIA_Addon_Riordian_Teach_NoPerm == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_02");	//A m??u ti uk?zat, jak m??e tvoje bludi?ka hledat v?ci.
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
	description = "Uk?? mi, jak m?m tr?novat mou bludi?ku.";
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
	description = "Uk?? mi, jak nam?chat magick? lektvary.";
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
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");	//Uk?? mi, jak nam?chat magick? lektvary.
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE))
	{
		Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,Dialog_Back,DIA_Riordian_ADW_TeachAlchemy_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Esence ?ivotn? s?ly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Riordian_ADW_TeachAlchemy_Health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Extrakt ?ivotn? s?ly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Riordian_ADW_TeachAlchemy_Health_02);
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
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Elix?r many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Riordian_ADW_TeachAlchemy_Mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Elix?r ducha",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Riordian_ADW_TeachAlchemy_Perm_Mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString("Elix?r obratnosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Riordian_ADW_TeachAlchemy_Perm_DEX);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01");	//Magick? n?poje se p?ipravuj? v alchymistick? kolon?, jedna je ve tv?m obydl? v poschod?.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02");	//Pot?ebuje? ale tak? pr?zdnou n?dobu, ingredience a v?domosti jak magick? lektvar p?ipravit.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03");	//Ode m? m??e? m?t v?domosti, ale ostatn? v?ci si mus?? opat?it s?m.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04");	//Co chce? p?ipravit?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05");	//Nem??u t? nau?it u? nic, co by si neum?l.
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

func void DIA_Riordian_ADW_TeachAlchemy_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

