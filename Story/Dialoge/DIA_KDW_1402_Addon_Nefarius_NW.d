
instance DIA_Addon_Nefarius_EXIT(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 999;
	condition = DIA_Addon_Nefarius_EXIT_Condition;
	information = DIA_Addon_Nefarius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Nefarius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Nefarius_Hallo(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_Hallo_Condition;
	information = DIA_Addon_Nefarius_Hallo_Info;
	description = "Tak co?";
};


func int DIA_Addon_Nefarius_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_00");	//Tak co?
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_01");	//Co TY tady děláš? To je překvapení.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_02");	//Myslel jsem, že tě zabili.
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_03");	//Skoro.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_04");	//Byl kolem tebe velký poprask, víš to? Nemohl jsem Saturase vůbec poznat, byl vzteky bez sebe.
};


instance DIA_Addon_Nefarius_keineahnung(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_keineahnung_Condition;
	information = DIA_Addon_Nefarius_keineahnung_Info;
	description = "Co je to za portál?";
};


func int DIA_Addon_Nefarius_keineahnung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_keineahnung_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_keineahnung_15_00");	//Co je to za portál?
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_01");	//Předpokládáme, že vede do ztraceného údolí, ve kterém jsou postavena města starých kultur.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_02");	//Ale ten kámen za portálem je z masivní skály.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_03");	//Není tu ani zmínka o teleportační magii. Velmi záhadné ...
};


instance DIA_Addon_Nefarius_WieMechanik(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_WieMechanik_Condition;
	information = DIA_Addon_Nefarius_WieMechanik_Info;
	description = "Víte, jak ho aktivovat?";
};


func int DIA_Addon_Nefarius_WieMechanik_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_keineahnung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_WieMechanik_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WieMechanik_15_00");	//Víte, jak ho aktivovat?
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_01");	//Jeden z těch chybějících ornamentů vypadá jakou nějaký druh klíče.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_03");	//Budeme potřebovat kroužek, abychom se dostali dál.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_02");	//Musí sedět támhle do té jamky vedle portálu.
};


instance DIA_Addon_Nefarius_SCbringOrnaments(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_SCbringOrnaments_Condition;
	information = DIA_Addon_Nefarius_SCbringOrnaments_Info;
	description = "Mám tady část ornamentu.";
};


func int DIA_Addon_Nefarius_SCbringOrnaments_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_SCbringOrnaments_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_00");	//Nesu kousek toho ornamentu.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_01");	//(nadšeně) Fakt? Tak to je perfektní.
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_02");	//Máš nějaké vodítko, které by mi pomohlo najít ty ostatní části?
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_03");	//Podle tady toho nápisu se rozbil na čtyři části.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_04");	//A vypadá to, jako by byly stále ještě tady na tomhle ostrově.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_05");	//Merdarion mi pomohl přeložit něco z těch nápisů tady.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_06");	//Je tam nějaká stopa, podle které by se daly ty části najít.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_07");	//Tady. Na téhle mapě jsem označil nějaká místa.
	CreateInvItems(self,ItWr_Map_NewWorld_Ornaments_Addon,1);
	B_GiveInvItems(self,other,ItWr_Map_NewWorld_Ornaments_Addon,1);
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
	B_LogEntry(TOPIC_Addon_Ornament,"Mágové Vody našli portál, který prý vede do neprobádaných oblastí Khorinisu.");
	B_LogEntry(TOPIC_Addon_Ornament,"Nefarius plánuje aktivovat portál s pomocí ornamentového kruhu. Stále ješte potřebuje 3 části ke složení kruhu. Mým ukolem je mu je donést. Dal mi mapu s označenými místy, kde předpokládá, že by zbylé části měly být.");
	B_StartOtherRoutine(BAU_4300_Addon_Cavalorn,"OrnamentSteinring");
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_08");	//Porozhlédni se tam.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_09");	//Měl bys ses hlavně zaměřit na staré budovy a struktury. Měl bys je poznat na první pohled.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_10");	//Může to být cokoliv - bludný balvan, kamenný kruh, mauzoleum ... prostě něco takového.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_11");	//Ale proč ti to vlastně říkám. Stejně to najdeš. Hodně zdaru.
};


instance DIA_Addon_Nefarius_WhyPortalClosed(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_WhyPortalClosed_Condition;
	information = DIA_Addon_Nefarius_WhyPortalClosed_Info;
	description = "Proč se ten ornament rozbil?";
};


func int DIA_Addon_Nefarius_WhyPortalClosed_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_SCbringOrnaments))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_WhyPortalClosed_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WhyPortalClosed_15_00");	//Proč se ten ornament rozbil?
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_01");	//Ať už to udělal kdokoli, chtěl zabránit tomu, aby byl portál znovu aktivován.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_02");	//Čím více si prohlížím tyto nápisy, tím víc poznávám, že kněží staré kultury, nebyli vůbec žádní hlupáci.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_03");	//Museli mít dobrý důvod, aby tu oblast za portálem uchovali uzavřenou.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_04");	//Nevíme, co nás tam může čekat. Ale určitě to není nic dobrého ...
};


instance DIA_Addon_Nefarius_MissingOrnaments(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_MissingOrnaments_Condition;
	information = DIA_Addon_Nefarius_MissingOrnaments_Info;
	permanent = TRUE;
	description = "Ohledně těch částí ...";
};


func int DIA_Addon_Nefarius_MissingOrnaments_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
};


var int MissingOrnamentsCounter;
const int Addon_NefariussMissingOrnamentsOffer = 100;

func void DIA_Addon_Nefarius_MissingOrnaments_Info()
{
	var int MissingOrnamentsCount;
	var int XP_Addon_BringMissingOrnaments;
	var int MissingOrnamentsGeld;
	var string concatText;
	AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_00");	//Ohledně těch částí ...
	AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_01");	//(s nadějí v hlase) Ano?
	if(Npc_HasItems(other,ItMi_Ornament_Addon) >= 1)
	{
		MissingOrnamentsCount = Npc_HasItems(other,ItMi_Ornament_Addon);
		if(MissingOrnamentsCount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_02");	//Tady. Mám další.
			B_GivePlayerXP(XP_Addon_BringMissingOrnament);
			Npc_RemoveInvItems(other,ItMi_Ornament_Addon,1);
			AI_PrintScreen(PRINT_ItemGegeben,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
			MissingOrnamentsCounter = MissingOrnamentsCounter + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_03");	//Našel jsem je.
			Npc_RemoveInvItems(other,ItMi_Ornament_Addon,MissingOrnamentsCount);
			concatText = ConcatStrings(IntToString(MissingOrnamentsCount),PRINT_ItemsGegeben);
			AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
			XP_Addon_BringMissingOrnaments = MissingOrnamentsCount * XP_Addon_BringMissingOrnament;
			MissingOrnamentsCounter = MissingOrnamentsCounter + MissingOrnamentsCount;
			B_GivePlayerXP(XP_Addon_BringMissingOrnaments);
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_04");	//Perfektní.
		if(MissingOrnamentsCounter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_05");	//Ale pořád ještě dva chybí. Snad je také najdeš.
		}
		else if(MissingOrnamentsCounter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_06");	//Už jen jeden, pak je budeme mít všechny.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_07");	//Konečně jsou všechny. Teď už je jen spojit.
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_08");	//Abychom však ty části mohli opět spojit v kruh, musíme spojit i naše síly.
			MIS_Addon_Nefarius_BringMissingOrnaments = LOG_SUCCESS;
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_09");	//Tady. Nějaké zlaťáky za tvé úsilí.
		MissingOrnamentsGeld = MissingOrnamentsCount * Addon_NefariussMissingOrnamentsOffer;
		CreateInvItems(self,ItMi_Gold,MissingOrnamentsGeld);
		B_GiveInvItems(self,other,ItMi_Gold,MissingOrnamentsGeld);
		if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_10");	//Pojď za mnou!
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"PreRingritual");
			B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"PreRingritual");
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_11");	//Kolik jich bylo?
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_12");	//Dohromady čtyři ...
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_13");	//Ostatní bys měl najít tam, kde jsem ti to označil na mapě.
	};
};


instance DIA_Addon_Nefarius_Ringritual(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_Ringritual_Condition;
	information = DIA_Addon_Nefarius_Ringritual_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_Ringritual_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PORTALTEMPEL_42") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_Ringritual_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_Ringritual_05_00");	//Teď ustup.
	Npc_SetRefuseTalk(self,60);
	RitualRingRuns = LOG_Running;
	B_LogEntry(TOPIC_Addon_Ornament,"Donesl jsem Nefariovi všechny ztracené části ornamentu. Mágové Vody je chtějí složit zpět do kruhu.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ringritual");
	B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"Ringritual");
};


instance DIA_Addon_Nefarius_RingRitualEnds(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_RingRitualEnds_Condition;
	information = DIA_Addon_Nefarius_RingRitualEnds_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_RingRitualEnds_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (RitualRingRuns == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_RingRitualEnds_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_00");	//Ornamenty byly spojeny.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_01");	//Protože si nám přinesl nepostradatelné části, měl bys tedy vložit ornament do portálu.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_02");	//Řekni Saturasovi, ať ti dá ten ornamentový kruh.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_03");	//Potom se snad portál otevře.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"Start");
	B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"Start");
	B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"Start");
	B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"Start");
	B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"Start");
	RitualRingRuns = LOG_SUCCESS;
	B_LogEntry(TOPIC_Addon_Ornament,"Ornamentový kruh je zase složený. Vzal jsem si ho od Saturase.");
};


instance DIA_Addon_Nefarius_OpenedPortal(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_OpenedPortal_Condition;
	information = DIA_Addon_Nefarius_OpenedPortal_Info;
	description = "Co dál?";
};


func int DIA_Addon_Nefarius_OpenedPortal_Condition()
{
	if(RitualRingRuns == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_OpenedPortal_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_OpenedPortal_15_00");	//Co dál?
	AI_Output(self,other,"DIA_Addon_Nefarius_OpenedPortal_05_01");	//Na co čekáš? Jdi a otevři ten portál.
};

