
instance DIA_Addon_Saturas_EXIT(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 999;
	condition = DIA_Addon_Saturas_EXIT_Condition;
	information = DIA_Addon_Saturas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Saturas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_EXIT_Info()
{
	if(MIS_Addon_Saturas_BringRiordian2Me == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_01");	//Proto?e nemohu p?edv?dat pracovitost ostatn?ch m?gu, doru??? jednomu z nich zpr?vu.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_02");	//Pov?z Riordianovi, ?e s n?m chci mluvit.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_03");	//Zdr?uje se v zadn? ??sti kobky. Tam ho najde?.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_Running;
		Log_CreateTopic(TOPIC_Addon_HolRiordian,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian,LOG_Running);
		B_LogEntry(TOPIC_Addon_HolRiordian,"Saturas ode m? chce, abych za n?m poslal vodn?ho m?ga, Riordiana. Ten je kdesi v hlub??ch ??stech podzem?.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Nefarius(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_Nefarius_Condition;
	information = DIA_Addon_Saturas_Nefarius_Info;
	description = "M?l bych naj?t ztracen? ??sti ornamentu pro Nefariuse.";
};


func int DIA_Addon_Saturas_Nefarius_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Nefarius_Info()
{
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_00");	//M?l bych naj?t ztracen? ??sti ornamentu pro Nefariuse.
	AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_01");	//Co? To je nemo?n?! Ty jsi do toho taky zapleten?
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_02");	//Ni?eho se neboj?m, donesu sem ty v?ci.
	if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_HasItems(other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_03");	//(vzdych) V?? aspo?, kde m?? hledat?
		AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_04");	//Nefarius mi dal mapu ...
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_05");	//Uka? mi ji!
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_06");	//Hmmm. Ve velk?m lese je to velmi nebezpe?n?. Nem?l bys tam j?t s?m.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_07");	//Zkus naj?t v Khorinisu n?koho, kdo by ?el s tebou.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_08");	//Nechci, aby t? zv??ata se?rala - a ornament s tebou.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_09");	//Tady, vezmi si zp?t mapu ...
		Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
		B_LogEntry(TOPIC_Addon_Ornament,"Saturas si mysl?, ?e p?i hled?n? ornament? bych nem?l chodit do lesa s?m. M?m si v Khorinisu naj?t n?koho, kdo se mnou p?jde.");
	};
};


instance DIA_Addon_Saturas_Hallo(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_Hallo_Condition;
	information = DIA_Addon_Saturas_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Saturas_Hallo_Condition()
{
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,Gobbo_Skeleton,ZS_MM_Attack,-1) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Hallo_wei?tdu()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_wei?tdu_14_00");	//M?? v?bec pon?t? o tom, co jsi ud?lal?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_wei?tdu_14_01");	//Dostal jsi strukturu magie do takov?ho chaosu, ?e se o tom dozv? cel? Khorinis.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_wei?tdu_14_02");	//M??e? d?kovat nebes?m, ?e bari?ra padla.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_wei?tdu_15_03");	//Pro? si teda st??uje?? V?echno dob?e dopadlo.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_wei?tdu_14_04");	//(v??sknut?) Bu? ticho!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_wei?tdu_14_05");	//Co k ?ertu chce??
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
};

func void DIA_Addon_Saturas_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_00");	//Zmiz odtud!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_01");	//V t?chto kobk?ch je p??li? nebezpe?n? hr?t si na dobrodruha.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_02");	//(nahn?van?) Ale ?ekni mi. Zn?me se? Samoz?ejm?. Ty zkurvysynu...
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_03");	//Nemysli si, ?e jsme zapom?li, jak jsi n?s tehdy v Nov?m t?bo?e zradil!
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"J?...",DIA_Addon_Saturas_Hallo_Video);
};

func void DIA_Addon_Saturas_Hallo_Video()
{
	PlayVideo("oreheap.bik");
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_00");	//Ty jsi vys?l z na?? rudy v?echnu magickou s?lu a pak zmizel!
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_01");	//(nahn?van?) Pro? jsi to ud?lal?
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Je mi l?to. Nev?d?l jsem co d?l?m.",DIA_Addon_Saturas_Hallo_sorry);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Va?e pl?ny by nefungovaly.",DIA_Addon_Saturas_Hallo_Spott);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Bylo to nevyhnuteln?.",DIA_Addon_Saturas_Hallo_notwendig);
};

func void DIA_Addon_Saturas_Hallo_notwendig()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_notwendig_15_00");	//Bylo to nevyhnuteln?. Bez s?ly rudy bych nebyl schopen porazit Sp??e.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_notwendig_14_01");	//O ?em to mluv??? Sp??? Pora?en?
	DIA_Addon_Saturas_Hallo_wei?tdu();
};

func void DIA_Addon_Saturas_Hallo_Spott()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_00");	//Va?e pl?ny by nefungovaly. Zni?it bari?ru s rudou - to je nejv?t?? blbost, jakou jsem kdy sly?el.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_01");	//Sp?? by jste zni?ili sami sebe.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_02");	//Jak? drzost. Kdo ti dal pr?vo posuzovat n?s a na?e ?mysly?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_03");	//Kdybys nebyl tak m?rumilovn? ?lov?k, p?ivolal bych na tebe Adanos?v hn?v.
	DIA_Addon_Saturas_Hallo_wei?tdu();
};

func void DIA_Addon_Saturas_Hallo_sorry()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_sorry_15_00");	//Je mi to l?to. Nev?d?l jsem co d?l?m.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_sorry_14_01");	//L?to? A ty si mysl??, ?e je te? v?echno v po??dku?
	DIA_Addon_Saturas_Hallo_wei?tdu();
};


instance DIA_Addon_Saturas_keineAhnung(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_keineAhnung_Condition;
	information = DIA_Addon_Saturas_keineAhnung_Info;
	description = "Nem?m pon?t?.";
};


func int DIA_Addon_Saturas_keineAhnung_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == 0)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_keineAhnung_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_keineAhnung_15_00");	//Nem?m pon?t?. Myslel jsem si, ?e se jen tak uk??u.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_01");	//Mrh?? m?m ?asem. Ztra? se.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_02");	//(s?m pro sebe) Vy??d?m si to s tebou pozd?ji.
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_KDW,"Na?el jsem vodn? m?gy v jejich vykop?vkach. Nejd??v mus?m zjistit co tu d?laj?. Saturas nebyl ochoten mi to ??ct. Je st?le na?tvan? kv?li t? v?ci v trestaneck? kolonii.");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_raus(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_raus_Condition;
	information = DIA_Addon_Saturas_raus_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Saturas_raus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_keineAhnung) && (MIS_Addon_Lares_Ornament2Saturas == 0) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_raus_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_raus_14_00");	//Vypadni odsud d??v, ne? se ti n?co stane.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Lares(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Lares_Condition;
	information = DIA_Addon_Saturas_Lares_Info;
	description = "P?i?el jsem s Laresem.";
};


func int DIA_Addon_Saturas_Lares_Condition()
{
	if(Lares_Angekommen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Lares_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_00");	//P?i?el jsem s Laresem.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_01");	//Lares? Skute?n?? Kde je?
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_02");	//Jsem s?m. Lares se vrac? op?t do m?sta.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_03");	//He? A on t? sem poslal samotn?ho? Co si v?bec mysl??
};


instance DIA_Addon_Saturas_Ornament(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Ornament_Condition;
	information = DIA_Addon_Saturas_Ornament_Info;
	description = "P?inesl jsem ti ornamenty.";
};


func int DIA_Addon_Saturas_Ornament_Condition()
{
	if((Npc_HasItems(other,ItMi_Ornament_Addon_Vatras) && (Lares_Angekommen == FALSE)) || ((Lares_Angekommen == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Saturas_Lares) && Npc_HasItems(other,ItMi_Ornament_Addon_Vatras)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_00");	//P?inesl jsem ti ornamenty.
	B_GiveInvItems(other,self,ItMi_Ornament_Addon_Vatras,1);
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_ADD_14_00");	//Jako te??
	if(Lares_Angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_01");	//Kdo ti to dal? Ne??kej, ?e ti to Lares jen tak nechal.
	};
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_02");	//Uklidni se. J? jsem to donesl tob?. Chce? to nebo ne?
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_03");	//Jist?. Ale znepokojuje m?, ?e jsi se do toho zapletl.
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_04");	//Pro? d?l?? probl?my, kv?li star? historce?
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_05");	//No, stejn? jsem pro tebe pracoval naposled. Nepo??tej se mnou do budoucna.
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_06");	//(vzdych) A co jsem z?skal? Pfff, nemysli si, ?e ti ve??m.
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;
	Wld_InsertNpc(Bloodfly,"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc(Giant_Bug,"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc(Lurker,"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FARM2_02");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
};


instance DIA_Addon_Saturas_geheimbund(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_geheimbund_Condition;
	information = DIA_Addon_Saturas_geheimbund_Info;
	description = "Chci se p?idat do 'Kruhu Vody'.";
};


func int DIA_Addon_Saturas_geheimbund_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_geheimbund_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_00");	//Chci se p?idat do 'Kruhu Vody'.
	if(Lares_Angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_01");	//(rozzu?en?) CO??? Odkud to v??? Kdo ... ? LARES ... j? ho zabiju.
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_02");	//On poru?il na?e pravidl?. Nikdo nemluv? o 'Kruhu Vody'.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_03");	//(kon??) Nem?m slov. J? ti v???m, jenom pokud m?m nad tebou dohled.
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_04");	//Vatras mi ?ekl o prstenu.
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_05");	//(odevzdan?) Co? Vatras? (jedovat?) Par?da! Narazil jsi na m?ga Vody, kter? t? NEPOZNAL ...
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_06");	//Poslocuhej, nebl?zni!
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_07");	//(pokojn?) J? se postar?m ...
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Saturas nen? ochoten p?ijmout m? do 'Kruhu Vody'. Nech?v? rozhodnut? Vatrasovi.");
};


instance DIA_Addon_Saturas_wasmachstdu(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_wasmachstdu_Condition;
	information = DIA_Addon_Saturas_wasmachstdu_Info;
	description = "Co tu dole d?l???";
};


func int DIA_Addon_Saturas_wasmachstdu_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_wasmachstdu_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_wasmachstdu_15_00");	//Co tu dole d?l???
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_01");	//(d?siv?) Tyhle s?n? dr?? star? tajemstv?. Z?hadn? tajemstv?.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_02");	//N?pisy a fresky nazna?uj? velmi starou kulturu.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_03");	//V?echno co uvid??, je naps?no v nezn?m?m jazyce.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_04");	//Nau?ili jsme se porozum?t tomuto jazyku.
};


instance DIA_Addon_Saturas_Erdbeben(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 6;
	condition = DIA_Addon_Saturas_Erdbeben_Condition;
	information = DIA_Addon_Saturas_Erdbeben_Info;
	description = "Pro? se st?le objevuj? ta zem?t?esen??";
};


func int DIA_Addon_Saturas_Erdbeben_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Saturas_wasmachstdu) && Npc_KnowsInfo(other,DIA_Addon_Merdarion_Bedrohung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Erdbeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Erdbeben_15_00");	//Pro? se st?le objevuj? ta zem?t?esen??
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_01");	//To je z?hada, kterou se pokou??m vy?e?it.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_02");	//Struktura magie je naru?ena kdesi za t?mito horami.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_03");	//Z?ejm? n?kdo pou?il magii a rozpt?lil velmi siln? kouzlo.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_04");	//Boj?m se, ?e zanedlouho zem?t?esen? postihnou cel? ostrov.
};


instance DIA_Addon_Saturas_WhatsOrnament(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_WhatsOrnament_Condition;
	information = DIA_Addon_Saturas_WhatsOrnament_Info;
	description = "Pro? je tenhle ornament tak d?le?it??";
};


func int DIA_Addon_Saturas_WhatsOrnament_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SC_KnowsOrnament == FALSE) && (RitualRingRuns == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_WhatsOrnament_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_WhatsOrnament_15_00");	//Pro? je tenhle ornament tak d?le?it??
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_01");	//(nerv?zn?) Je to kl?? k port?lu.
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_02");	//Nic v?c ti o tom ne?eknu.
};


instance DIA_Addon_Saturas_ScRanger(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_ScRanger_Condition;
	information = DIA_Addon_Saturas_ScRanger_Info;
	permanent = TRUE;
	description = "Te? pat??m do 'Kruhu Vody'.";
};


func int DIA_Addon_Saturas_ScRanger_Condition()
{
	if((SaturasKnows_SC_IsRanger == FALSE) && (SC_IsRanger == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ScRanger_Info()
{
	var C_Item itm;
	AI_Output(other,self,"DIA_Addon_Saturas_ScRanger_15_00");	//Te? pat??m do 'Kruhu Vody'.
	itm = Npc_GetEquippedArmor(other);
	if(((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE)) || (Hlp_IsItem(itm,ITAR_RANGER_Addon) == TRUE))
	{
		if(Hlp_IsItem(itm,ITAR_RANGER_Addon) == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_01");	//Jak vid?m, m?? na sob? brn?n? na?ich d?t?.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_02");	//Jak vid?m, nos?? na?e tajn? charakteristick? znamen?. Akvamar?nov? prsten.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_03");	//Vid?m v tv?ch o??ch, ?e n?m ??ka? pravdu.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_04");	//(mrml?) V po??dku. Budu akceptovat tv?j vstup mezi n?s.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_05");	//Pros?m, uv?dom si, ?e je to spojen? s velkou zodpov?dnost?.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_06");	//Douf?m, ?e to zvl?dne?.
		SaturasKnows_SC_IsRanger = TRUE;
		B_LogEntry(TOPIC_Addon_RingOfWater,"Saturas akceptoval m?j vstup do 'Kruhu Vody'.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_07");	//A jak zjist?m, ?e jsi jeden z n?s?
		if(RangerRingIsLaresRing == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_08");	//Akvamar?nov? prsten, kter? m??, pat?? Laresovi. Pozn?v?m ho.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_09");	//Chce? m? podv?st? Ne?ekal jsem nic jin?ho.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Saturas_OpenPortal(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_OpenPortal_Condition;
	information = DIA_Addon_Saturas_OpenPortal_Info;
	permanent = TRUE;
	description = "Dej mi kl?? z ornament?. Otev?u port?l.";
};


var int DIA_Addon_Saturas_OpenPortal_NoPerm;

func int DIA_Addon_Saturas_OpenPortal_Condition()
{
	if((RitualRingRuns == LOG_SUCCESS) && (DIA_Addon_Saturas_OpenPortal_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_OpenPortal_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_00");	//Dej mi kl?? z ornament?. Otev?u port?l.
	if(SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_01");	//Dob?e! Jako nov?mu ?lenu na?ich d?t? ti pat?? tahle pocta.
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_02");	//Ale st?le ?ek?m na zpr?vu od Vatrase. Dokud ji nedostanu, nem??u j?t d?l.
		if((RangerMeetingRunning == LOG_SUCCESS) && (Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened)))
		{
			AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_03");	//M?m pro tebe zpr?vu od Vatrase.
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven,Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven));
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven_opened,Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened));
			B_UseFakeScroll();
			if(Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_04");	//(nahn?van?) Dobr?. A ty ses nemohl dr?et p??kazu a neotev??t ji, ?e?
				AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_05");	//No, ehm...
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_06");	//(v?hru?n?) M? velmi mal? d?v?ra k tob? st?le kles?. Jen douf?m, u? kv?li tob?, ?e m? ji? v?ce nezklame?.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_07");	//(ohromen) Velmi zaj?mav?. Dob?e.
				B_GivePlayerXP(XP_Ambient);
			};
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_08");	//Vezmi si tenhle krou?ek z ornament?. Potk?me se u port?lu a po?k?me na tebe.
			CreateInvItems(self,ItMi_PortalRing_Addon,1);
			B_GiveInvItems(self,other,ItMi_PortalRing_Addon,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_09");	//Pokud m? Nefarius pravdu, port?l se otev?e, hned jak tam vlo??? krou?ek.
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry(TOPIC_Addon_Ornament,"Saturas mi dal ozdobn? prsten. Chce, abych ho vlo?il do mechanismu, kter? ovl?d? port?l a pro?el n?m.");
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"OpenPortal");
			B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1402_Addon_Nefarius_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"OpenPortal");
		}
		else
		{
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_10");	//Ponech?m si kl?? z ornament?, dokud mi Vatras ne?ekne, ?e ti mohu v??it.
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry(TOPIC_Addon_Ornament,"Saturas mi nechce d?t prsten, dokud ho nep?esv?d??m o tom, ?e mi m??e v??it. Mus?m don?st zpr?vu od Vatrase.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Saturas_PERM(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 99;
	condition = DIA_Addon_Saturas_PERM_Condition;
	information = DIA_Addon_Saturas_PERM_Info;
	permanent = TRUE;
	description = "M??e? m? nau?it n?co o magii?";
};


func int DIA_Addon_Saturas_PERM_Condition()
{
	if(MIS_Addon_Saturas_BringRiordian2Me != 0)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PERM_15_00");	//M??e? m? nau?it n?co o magii?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_01");	//Vzhledem k tomu, ?e m??e? je?t? v?ce naru?it stabilitu magie, mysl?m, ?e ne.
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_02");	//Na n?koho takov?ho, jako si ty, nem?m ?as.
};

