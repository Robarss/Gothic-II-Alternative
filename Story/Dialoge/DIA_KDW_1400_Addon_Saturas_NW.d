
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
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_01");	//Protože nemohu předvídat pracovitost ostatních mágu, doručíš jednomu z nich zprávu.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_02");	//Pověz Riordianovi, že s ním chci mluvit.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_03");	//Zdržuje se v zadní části kobky. Tam ho najdeš.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_Running;
		Log_CreateTopic(TOPIC_Addon_HolRiordian,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian,LOG_Running);
		B_LogEntry(TOPIC_Addon_HolRiordian,"Saturas ode mě chce, abych za ním poslal vodního mága, Riordiana. Ten je kdesi v hlubších částech podzemí.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Nefarius(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_Nefarius_Condition;
	information = DIA_Addon_Saturas_Nefarius_Info;
	description = "Měl bych najít ztracené části ornamentu pro Nefariuse.";
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
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_00");	//Měl bych najít ztracené části ornamentu pro Nefariuse.
	AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_01");	//Co? To je nemožné! Ty jsi do toho taky zapleten?
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_02");	//Ničeho se nebojím, donesu sem ty věci.
	if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_HasItems(other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_03");	//(vzdych) Víš aspoň, kde máš hledat?
		AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_04");	//Nefarius mi dal mapu ...
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_05");	//Ukaž mi ji!
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_06");	//Hmmm. Ve velkém lese je to velmi nebezpečné. Neměl bys tam jít sám.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_07");	//Zkus najít v Khorinisu někoho, kdo by šel s tebou.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_08");	//Nechci, aby tě zvířata sežrala - a ornament s tebou.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_09");	//Tady, vezmi si zpět mapu ...
		Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
		B_LogEntry(TOPIC_Addon_Ornament,"Saturas si myslí, že při hledání ornamentů bych neměl chodit do lesa sám. Mám si v Khorinisu najít někoho, kdo se mnou půjde.");
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

func void DIA_Addon_Saturas_Hallo_weißtdu()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_00");	//Máš vůbec ponětí o tom, co jsi udělal?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_01");	//Dostal jsi strukturu magie do takového chaosu, že se o tom dozví celý Khorinis.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_02");	//Můžeš děkovat nebesům, že bariéra padla.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_weißtdu_15_03");	//Proč si teda stěžuješ? Všechno dobře dopadlo.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_04");	//(vřísknutí) Buď ticho!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weißtdu_14_05");	//Co k čertu chceš?
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
};

func void DIA_Addon_Saturas_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_00");	//Zmiz odtud!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_01");	//V těchto kobkách je příliš nebezpečné hrát si na dobrodruha.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_02");	//(nahněvaně) Ale řekni mi. Známe se? Samozřejmě. Ty zkurvysynu...
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_03");	//Nemysli si, že jsme zapoměli, jak jsi nás tehdy v Novém táboře zradil!
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Já...",DIA_Addon_Saturas_Hallo_Video);
};

func void DIA_Addon_Saturas_Hallo_Video()
{
	PlayVideo("oreheap.bik");
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_00");	//Ty jsi vysál z naší rudy všechnu magickou sílu a pak zmizel!
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_01");	//(nahněvaně) Proč jsi to udělal?
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Je mi líto. Nevěděl jsem co dělám.",DIA_Addon_Saturas_Hallo_sorry);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Vaše plány by nefungovaly.",DIA_Addon_Saturas_Hallo_Spott);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Bylo to nevyhnutelné.",DIA_Addon_Saturas_Hallo_notwendig);
};

func void DIA_Addon_Saturas_Hallo_notwendig()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_notwendig_15_00");	//Bylo to nevyhnutelné. Bez síly rudy bych nebyl schopen porazit Spáče.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_notwendig_14_01");	//O čem to mluvíš? Spáč? Poražen?
	DIA_Addon_Saturas_Hallo_weißtdu();
};

func void DIA_Addon_Saturas_Hallo_Spott()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_00");	//Vaše plány by nefungovaly. Zničit bariéru s rudou - to je největší blbost, jakou jsem kdy slyšel.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_01");	//Spíš by jste zničili sami sebe.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_02");	//Jaká drzost. Kdo ti dal právo posuzovat nás a naše úmysly?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_03");	//Kdybys nebyl tak mírumilovný člověk, přivolal bych na tebe Adanosův hněv.
	DIA_Addon_Saturas_Hallo_weißtdu();
};

func void DIA_Addon_Saturas_Hallo_sorry()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_sorry_15_00");	//Je mi to líto. Nevěděl jsem co dělám.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_sorry_14_01");	//Líto? A ty si myslíš, že je teď všechno v pořádku?
	DIA_Addon_Saturas_Hallo_weißtdu();
};


instance DIA_Addon_Saturas_keineAhnung(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_keineAhnung_Condition;
	information = DIA_Addon_Saturas_keineAhnung_Info;
	description = "Nemám ponětí.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_keineAhnung_15_00");	//Nemám ponětí. Myslel jsem si, že se jen tak ukážu.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_01");	//Mrháš mým časem. Ztrať se.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_02");	//(sám pro sebe) Vyřídím si to s tebou později.
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_KDW,"Našel jsem vodní mágy v jejich vykopávkach. Nejdřív musím zjistit co tu dělají. Saturas nebyl ochoten mi to říct. Je stále naštvaný kvůli té věci v trestanecké kolonii.");
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
	AI_Output(self,other,"DIA_Addon_Saturas_raus_14_00");	//Vypadni odsud dřív, než se ti něco stane.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Lares(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Lares_Condition;
	information = DIA_Addon_Saturas_Lares_Info;
	description = "Přišel jsem s Laresem.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_00");	//Přišel jsem s Laresem.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_01");	//Lares? Skutečně? Kde je?
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_02");	//Jsem sám. Lares se vrací opět do města.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_03");	//He? A on tě sem poslal samotného? Co si vůbec myslí?
};


instance DIA_Addon_Saturas_Ornament(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Ornament_Condition;
	information = DIA_Addon_Saturas_Ornament_Info;
	description = "Přinesl jsem ti ornamenty.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_00");	//Přinesl jsem ti ornamenty.
	B_GiveInvItems(other,self,ItMi_Ornament_Addon_Vatras,1);
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_ADD_14_00");	//Jako teď?
	if(Lares_Angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_01");	//Kdo ti to dal? Neříkej, že ti to Lares jen tak nechal.
	};
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_02");	//Uklidni se. Já jsem to donesl tobě. Chceš to nebo ne?
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_03");	//Jistě. Ale znepokojuje mě, že jsi se do toho zapletl.
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_04");	//Proč děláš problémy, kvůli staré historce?
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_05");	//No, stejně jsem pro tebe pracoval naposled. Nepočítej se mnou do budoucna.
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_06");	//(vzdych) A co jsem získal? Pfff, nemysli si, že ti veřím.
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
	description = "Chci se přidat do 'Kruhu Vody'.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_00");	//Chci se přidat do 'Kruhu Vody'.
	if(Lares_Angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_01");	//(rozzuřeně) CO??? Odkud to víš? Kdo ... ? LARES ... já ho zabiju.
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_02");	//On porušil naše pravidlá. Nikdo nemluví o 'Kruhu Vody'.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_03");	//(končí) Nemám slov. Já ti věřím, jenom pokud mám nad tebou dohled.
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_04");	//Vatras mi řekl o prstenu.
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_05");	//(odevzdaně) Co? Vatras? (jedovatě) Paráda! Narazil jsi na mága Vody, který tě NEPOZNAL ...
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_06");	//Poslocuhej, neblázni!
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_07");	//(pokojně) Já se postarám ...
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Saturas není ochoten přijmout mě do 'Kruhu Vody'. Nechává rozhodnutí Vatrasovi.");
};


instance DIA_Addon_Saturas_wasmachstdu(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_wasmachstdu_Condition;
	information = DIA_Addon_Saturas_wasmachstdu_Info;
	description = "Co tu dole děláš?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_wasmachstdu_15_00");	//Co tu dole děláš?
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_01");	//(děsivě) Tyhle síně drží staré tajemství. Záhadné tajemství.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_02");	//Nápisy a fresky naznačují velmi starou kulturu.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_03");	//Všechno co uvidíš, je napsáno v neznámém jazyce.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_04");	//Naučili jsme se porozumět tomuto jazyku.
};


instance DIA_Addon_Saturas_Erdbeben(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 6;
	condition = DIA_Addon_Saturas_Erdbeben_Condition;
	information = DIA_Addon_Saturas_Erdbeben_Info;
	description = "Proč se stále objevují ta zemětřesení?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_Erdbeben_15_00");	//Proč se stále objevují ta zemětřesení?
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_01");	//To je záhada, kterou se pokouším vyřešit.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_02");	//Struktura magie je narušena kdesi za těmito horami.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_03");	//Zřejmě někdo použil magii a rozptýlil velmi silné kouzlo.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_04");	//Bojím se, že zanedlouho zemětřesení postihnou celý ostrov.
};


instance DIA_Addon_Saturas_WhatsOrnament(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_WhatsOrnament_Condition;
	information = DIA_Addon_Saturas_WhatsOrnament_Info;
	description = "Proč je tenhle ornament tak důležitý?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_WhatsOrnament_15_00");	//Proč je tenhle ornament tak důležitý?
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_01");	//(nervózně) Je to klíč k portálu.
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_02");	//Nic víc ti o tom neřeknu.
};


instance DIA_Addon_Saturas_ScRanger(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_ScRanger_Condition;
	information = DIA_Addon_Saturas_ScRanger_Info;
	permanent = TRUE;
	description = "Teď patřím do 'Kruhu Vody'.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_ScRanger_15_00");	//Teď patřím do 'Kruhu Vody'.
	itm = Npc_GetEquippedArmor(other);
	if(((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE)) || (Hlp_IsItem(itm,ITAR_RANGER_Addon) == TRUE))
	{
		if(Hlp_IsItem(itm,ITAR_RANGER_Addon) == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_01");	//Jak vidím, máš na sobě brnění našich dětí.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_02");	//Jak vidím, nosíš naše tajné charakteristické znamení. Akvamarínový prsten.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_03");	//Vidím v tvých očích, že nám říkaš pravdu.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_04");	//(mrmlá) V pořádku. Budu akceptovat tvůj vstup mezi nás.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_05");	//Prosím, uvědom si, že je to spojené s velkou zodpovědností.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_06");	//Doufám, že to zvládneš.
		SaturasKnows_SC_IsRanger = TRUE;
		B_LogEntry(TOPIC_Addon_RingOfWater,"Saturas akceptoval můj vstup do 'Kruhu Vody'.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_07");	//A jak zjistím, že jsi jeden z nás?
		if(RangerRingIsLaresRing == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_08");	//Akvamarínový prsten, který máš, patří Laresovi. Poznávám ho.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_09");	//Chceš mě podvést? Nečekal jsem nic jiného.
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
	description = "Dej mi klíč z ornamentů. Otevřu portál.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_00");	//Dej mi klíč z ornamentů. Otevřu portál.
	if(SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_01");	//Dobře! Jako novému členu našich dětí ti patří tahle pocta.
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_02");	//Ale stále čekám na zprávu od Vatrase. Dokud ji nedostanu, nemůžu jít dál.
		if((RangerMeetingRunning == LOG_SUCCESS) && (Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened)))
		{
			AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_03");	//Mám pro tebe zprávu od Vatrase.
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven,Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven));
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven_opened,Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened));
			B_UseFakeScroll();
			if(Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_04");	//(nahněvaně) Dobrá. A ty ses nemohl držet příkazu a neotevřít ji, že?
				AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_05");	//No, ehm...
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_06");	//(výhružně) Má velmi malá důvěra k tobě stále klesá. Jen doufám, už kvůli tobě, že mě již více nezklameš.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_07");	//(ohromen) Velmi zajímavé. Dobře.
				B_GivePlayerXP(XP_Ambient);
			};
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_08");	//Vezmi si tenhle kroužek z ornamentů. Potkáme se u portálu a počkáme na tebe.
			CreateInvItems(self,ItMi_PortalRing_Addon,1);
			B_GiveInvItems(self,other,ItMi_PortalRing_Addon,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_09");	//Pokud má Nefarius pravdu, portál se otevře, hned jak tam vložíš kroužek.
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry(TOPIC_Addon_Ornament,"Saturas mi dal ozdobný prsten. Chce, abych ho vložil do mechanismu, který ovládá portál a prošel ním.");
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
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_10");	//Ponechám si klíč z ornamentů, dokud mi Vatras neřekne, že ti mohu věřit.
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry(TOPIC_Addon_Ornament,"Saturas mi nechce dát prsten, dokud ho nepřesvědčím o tom, že mi může věřit. Musím donést zprávu od Vatrase.");
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
	description = "Můžeš mě naučit něco o magii?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_PERM_15_00");	//Můžeš mě naučit něco o magii?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_01");	//Vzhledem k tomu, že můžeš ještě více narušit stabilitu magie, myslím, že ne.
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_02");	//Na někoho takového, jako si ty, nemám čas.
};

