
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
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_01");	//Co TY tady d?l??? To je p?ekvapen?.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_02");	//Myslel jsem, ?e t? zabili.
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_03");	//Skoro.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_04");	//Byl kolem tebe velk? poprask, v?? to? Nemohl jsem Saturase v?bec poznat, byl vzteky bez sebe.
};


instance DIA_Addon_Nefarius_keineahnung(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_keineahnung_Condition;
	information = DIA_Addon_Nefarius_keineahnung_Info;
	description = "Co je to za port?l?";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_keineahnung_15_00");	//Co je to za port?l?
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_01");	//P?edpokl?d?me, ?e vede do ztracen?ho ?dol?, ve kter?m jsou postavena m?sta star?ch kultur.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_02");	//Ale ten k?men za port?lem je z masivn? sk?ly.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_03");	//Nen? tu ani zm?nka o teleporta?n? magii. Velmi z?hadn? ...
};


instance DIA_Addon_Nefarius_WieMechanik(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_WieMechanik_Condition;
	information = DIA_Addon_Nefarius_WieMechanik_Info;
	description = "V?te, jak ho aktivovat?";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_WieMechanik_15_00");	//V?te, jak ho aktivovat?
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_01");	//Jeden z t?ch chyb?j?c?ch ornament? vypad? jakou n?jak? druh kl??e.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_03");	//Budeme pot?ebovat krou?ek, abychom se dostali d?l.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_02");	//Mus? sed?t t?mhle do t? jamky vedle port?lu.
};


instance DIA_Addon_Nefarius_SCbringOrnaments(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_SCbringOrnaments_Condition;
	information = DIA_Addon_Nefarius_SCbringOrnaments_Info;
	description = "M?m tady ??st ornamentu.";
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
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_01");	//(nad?en?) Fakt? Tak to je perfektn?.
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_02");	//M?? n?jak? vod?tko, kter? by mi pomohlo naj?t ty ostatn? ??sti?
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_03");	//Podle tady toho n?pisu se rozbil na ?ty?i ??sti.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_04");	//A vypad? to, jako by byly st?le je?t? tady na tomhle ostrov?.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_05");	//Merdarion mi pomohl p?elo?it n?co z t?ch n?pis? tady.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_06");	//Je tam n?jak? stopa, podle kter? by se daly ty ??sti naj?t.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_07");	//Tady. Na t?hle map? jsem ozna?il n?jak? m?sta.
	CreateInvItems(self,ItWr_Map_NewWorld_Ornaments_Addon,1);
	B_GiveInvItems(self,other,ItWr_Map_NewWorld_Ornaments_Addon,1);
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
	B_LogEntry(TOPIC_Addon_Ornament,"M?gov? Vody na?li port?l, kter? pr? vede do neprob?dan?ch oblast? Khorinisu.");
	B_LogEntry(TOPIC_Addon_Ornament,"Nefarius pl?nuje aktivovat port?l s pomoc? ornamentov?ho kruhu. St?le je?te pot?ebuje 3 ??sti ke slo?en? kruhu. M?m ukolem je mu je don?st. Dal mi mapu s ozna?en?mi m?sty, kde p?edpokl?d?, ?e by zbyl? ??sti m?ly b?t.");
	B_StartOtherRoutine(BAU_4300_Addon_Cavalorn,"OrnamentSteinring");
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_08");	//Porozhl?dni se tam.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_09");	//M?l bys ses hlavn? zam??it na star? budovy a struktury. M?l bys je poznat na prvn? pohled.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_10");	//M??e to b?t cokoliv - bludn? balvan, kamenn? kruh, mauzoleum ... prost? n?co takov?ho.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_11");	//Ale pro? ti to vlastn? ??k?m. Stejn? to najde?. Hodn? zdaru.
};


instance DIA_Addon_Nefarius_WhyPortalClosed(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_WhyPortalClosed_Condition;
	information = DIA_Addon_Nefarius_WhyPortalClosed_Info;
	description = "Pro? se ten ornament rozbil?";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_WhyPortalClosed_15_00");	//Pro? se ten ornament rozbil?
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_01");	//A? u? to ud?lal kdokoli, cht?l zabr?nit tomu, aby byl port?l znovu aktivov?n.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_02");	//??m v?ce si prohl???m tyto n?pisy, t?m v?c pozn?v?m, ?e kn??? star? kultury, nebyli v?bec ??dn? hlup?ci.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_03");	//Museli m?t dobr? d?vod, aby tu oblast za port?lem uchovali uzav?enou.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_04");	//Nev?me, co n?s tam m??e ?ekat. Ale ur?it? to nen? nic dobr?ho ...
};


instance DIA_Addon_Nefarius_MissingOrnaments(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_MissingOrnaments_Condition;
	information = DIA_Addon_Nefarius_MissingOrnaments_Info;
	permanent = TRUE;
	description = "Ohledn? t?ch ??st? ...";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_00");	//Ohledn? t?ch ??st? ...
	AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_01");	//(s nad?j? v hlase) Ano?
	if(Npc_HasItems(other,ItMi_Ornament_Addon) >= 1)
	{
		MissingOrnamentsCount = Npc_HasItems(other,ItMi_Ornament_Addon);
		if(MissingOrnamentsCount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_02");	//Tady. M?m dal??.
			B_GivePlayerXP(XP_Addon_BringMissingOrnament);
			Npc_RemoveInvItems(other,ItMi_Ornament_Addon,1);
			AI_PrintScreen(PRINT_ItemGegeben,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
			MissingOrnamentsCounter = MissingOrnamentsCounter + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_03");	//Na?el jsem je.
			Npc_RemoveInvItems(other,ItMi_Ornament_Addon,MissingOrnamentsCount);
			concatText = ConcatStrings(IntToString(MissingOrnamentsCount),PRINT_ItemsGegeben);
			AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
			XP_Addon_BringMissingOrnaments = MissingOrnamentsCount * XP_Addon_BringMissingOrnament;
			MissingOrnamentsCounter = MissingOrnamentsCounter + MissingOrnamentsCount;
			B_GivePlayerXP(XP_Addon_BringMissingOrnaments);
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_04");	//Perfektn?.
		if(MissingOrnamentsCounter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_05");	//Ale po??d je?t? dva chyb?. Snad je tak? najde?.
		}
		else if(MissingOrnamentsCounter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_06");	//U? jen jeden, pak je budeme m?t v?echny.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_07");	//Kone?n? jsou v?echny. Te? u? je jen spojit.
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_08");	//Abychom v?ak ty ??sti mohli op?t spojit v kruh, mus?me spojit i na?e s?ly.
			MIS_Addon_Nefarius_BringMissingOrnaments = LOG_SUCCESS;
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_09");	//Tady. N?jak? zla??ky za tv? ?sil?.
		MissingOrnamentsGeld = MissingOrnamentsCount * Addon_NefariussMissingOrnamentsOffer;
		CreateInvItems(self,ItMi_Gold,MissingOrnamentsGeld);
		B_GiveInvItems(self,other,ItMi_Gold,MissingOrnamentsGeld);
		if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_10");	//Poj? za mnou!
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
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_12");	//Dohromady ?ty?i ...
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_13");	//Ostatn? bys m?l naj?t tam, kde jsem ti to ozna?il na map?.
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
	AI_Output(self,other,"DIA_Addon_Nefarius_Ringritual_05_00");	//Te? ustup.
	Npc_SetRefuseTalk(self,60);
	RitualRingRuns = LOG_Running;
	B_LogEntry(TOPIC_Addon_Ornament,"Donesl jsem Nefariovi v?echny ztracen? ??sti ornamentu. M?gov? Vody je cht?j? slo?it zp?t do kruhu.");
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
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_01");	//Proto?e si n?m p?inesl nepostradateln? ??sti, m?l bys tedy vlo?it ornament do port?lu.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_02");	//?ekni Saturasovi, a? ti d? ten ornamentov? kruh.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_03");	//Potom se snad port?l otev?e.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"Start");
	B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"Start");
	B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"Start");
	B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"Start");
	B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"Start");
	RitualRingRuns = LOG_SUCCESS;
	B_LogEntry(TOPIC_Addon_Ornament,"Ornamentov? kruh je zase slo?en?. Vzal jsem si ho od Saturase.");
};


instance DIA_Addon_Nefarius_OpenedPortal(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_OpenedPortal_Condition;
	information = DIA_Addon_Nefarius_OpenedPortal_Info;
	description = "Co d?l?";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_OpenedPortal_15_00");	//Co d?l?
	AI_Output(self,other,"DIA_Addon_Nefarius_OpenedPortal_05_01");	//Na co ?ek??? Jdi a otev?i ten port?l.
};

