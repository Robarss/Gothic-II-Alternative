
instance DIA_Addon_Merdarion_ADW_EXIT(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 999;
	condition = DIA_Addon_Merdarion_ADW_EXIT_Condition;
	information = DIA_Addon_Merdarion_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Merdarion_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Merdarion_ADWHello(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADWHello_Condition;
	information = DIA_Addon_Merdarion_ADWHello_Info;
	description = "Jak to jde?";
};


func int DIA_Addon_Merdarion_ADWHello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADWHello_Back()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_Back_15_00");	//Slyšel jsem dost.
	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
};

func void DIA_Addon_Merdarion_ADWHello_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_01");	//(poslouchej) Slyšels to? ... Cizí, ne?
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_02");	//Hmmmm ...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_03");	//Tyto teleportační kameny vypadají, jako kdyby již nefungovali, ale někdy jde slyšet, jak vrčí.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_04");	//I když jsou nečinné, skrývá se v nich mnoho energie.
	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Co pohání teleportační kameny?",DIA_Addon_Merdarion_ADWHello_reaktor);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Co si myslíš, že by je mohlo aktivovat?",DIA_Addon_Merdarion_ADWHello_was);
};

func void DIA_Addon_Merdarion_ADWHello_was()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_was_15_00");	//Co si myslíš, že by je mohlo aktivovat?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_01");	//Mám nápad. Potřeboval bych ale dokázat svou teorii.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_02");	//Před pár dny, jsem měl pocit, jako kdybych styl těchto budov už viděl.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_03");	//Myslím, že jim budeme muset dodat velké množství magické energie, abychom je znovu zprovoznili.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Kde jsi už viděl tyto teleportační kameny?",DIA_Addon_Merdarion_ADWHello_wo);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Jakou magickou energii bychom jim mohli dodat ...",DIA_Addon_Merdarion_ADWHello_focus);
};

func void DIA_Addon_Merdarion_ADWHello_focus()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_00");	//Jakou magickou energii bychom jim mohli dodat ...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_01");	//Myslím, že pouze jediná. A to energie z Ohniskových kamenů.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_02");	//Myslím ty ohniskové kameny, které byly použity k vytvoření magické bariéry v Hornickém údolí.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_03");	//Pokud vím, tak jsi je pro nás nedávno sbíral.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_04");	//Ano, vzpomínám si.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Říkáš, že potřebuješ ověřit svou teorii.",DIA_Addon_Merdarion_ADWHello_focusProof);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Kde jsou nyní ohniskové kameny?",DIA_Addon_Merdarion_ADWHello_focusWo);
};

func void DIA_Addon_Merdarion_ADWHello_focusWo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusWo_15_00");	//Kde jsou nyní ohniskové kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_01");	//Byly mi svěřeny. Měl jsem je opatrovat dokud pro ně nenajdeme další využití.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_02");	//Myslím, že jsme jej právě našli.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Slyšel jsem dost.",DIA_Addon_Merdarion_ADWHello_Back);
};

func void DIA_Addon_Merdarion_ADWHello_focusProof()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusProof_15_00");	//Říkáš, že potřebuješ ověřit svou teorii.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_01");	//Někdo by musel umístit ohniskový kamen k teleportačnímu kamenu.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_02");	//Ale nevím kam.
};

func void DIA_Addon_Merdarion_ADWHello_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_wo_15_00");	//Kde jsi viděl tyto teleportační kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_01");	//Byl jsi také v trestanecké kolonii? Tos nikdy nenarazil na teleportační kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_02");	//Jsem si celkem jistý, že tam mohou být i nyní.
};

func void DIA_Addon_Merdarion_ADWHello_reaktor()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_reaktor_15_00");	//Co pohání teleportační kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_01");	//Stavitelé byli velmi pokrokoví lidé.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_02");	//Používali magii takovým způsobem, jaký jsem neviděl nikdy předtím.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_03");	//Síť teleportačních kamenů byla postavena tak, aby dopravovala rychle po městě.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_04");	//Kameny na TOMTO místě se zdají jako výchozí místo pro ostatní.
};


instance DIA_Addon_Merdarion_FokusGeben(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_FokusGeben_Condition;
	information = DIA_Addon_Merdarion_FokusGeben_Info;
	description = "Dej mi ohniskový kámen. Uvidím, zda-li budu moci teleport zprovoznit.";
};


func int DIA_Addon_Merdarion_FokusGeben_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_FokusGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FokusGeben_15_00");	//Dej mi ohniskový kámen. Uvidím, zda-li budu moci teleport zprovoznit.
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_01");	//Dobrá tedy, vpořádku. Ale starej se o něj dobře, slyšíš?
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_02");	//Saturas by mi rozbil hlavu, kdybychom je ztratili.
	CreateInvItems(self,ItMi_Focus,1);
	B_GiveInvItems(self,other,ItMi_Focus,1);
	Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsADW,"Vodní mág Merdarion mi dal jeden starý ohniskový kámen, který byl použit k vztyčení magické bariéry v Údolí dolů. Chce abych s ním aktivoval jeden teleportační kámen.");
};


instance DIA_Addon_Merdarion_FirstFocus(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_FirstFocus_Condition;
	information = DIA_Addon_Merdarion_FirstFocus_Info;
	description = "Aktivoval jsem jeden teleportační kámen.";
};


func int DIA_Addon_Merdarion_FirstFocus_Condition()
{
	if(TriggeredTeleporterADW != 0)
	{
		return TRUE;
	};
};


var int Merdarion_GotFocusCount;

func void DIA_Addon_Merdarion_FirstFocus_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_00");	//Aktivoval jsem jeden teleportační kámen.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_01");	//A jak vidím, jsi stále ještě v pořádku.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_02");	//Už jsem o tom mluvil s ostatními.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_03");	//Chceme zkusit aktivovat i ostatní teleportační kameny.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_04");	//Velmi nám to pomůže v našich studiích, pokud se budeme moci rychle pohybovat z jedné části města na jiné.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_05");	//Zde je další ohniskový kámen.
	CreateInvItems(self,ItMi_Focus,1);
	B_GiveInvItems(self,other,ItMi_Focus,1);
	Merdarion_GotFocusCount = 1;
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_06");	//Aktivuj ostatní, pokud budeš moci.
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_07");	//Uvidím, co budu moct udělat.
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	B_LogEntry(TOPIC_Addon_TeleportsADW,"Merdarion mi dal další ohnisko. Chce, abych aktivoval i další teleportační kameny. Pokaždé když aktivuji další, dostanu i další ohnisko.");
};


instance DIA_Addon_Merdarion_ActivateTeleports(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ActivateTeleports_Condition;
	information = DIA_Addon_Merdarion_ActivateTeleports_Info;
	permanent = TRUE;
	description = "Aktivoval jsem další teleportační kámen.";
};


func int DIA_Addon_Merdarion_ActivateTeleports_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_FirstFocus) && (TriggeredTeleporterADW > Merdarion_GotFocusCount) && (Merdarion_GotFocusCount < 6))
	{
		return TRUE;
	};
};


var int DIA_Addon_Merdarion_ActivateTeleports_OneTime;

func void DIA_Addon_Merdarion_ActivateTeleports_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_00");	//Aktivoval jsem další teleportační kámen.
	if(SC_ADW_ActivatedAllTelePortStones == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_01");	//Dej mi další ohnisko.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_02");	//Samozřejmě, tady je.
		CreateInvItems(self,ItMi_Focus,1);
		B_GiveInvItems(self,other,ItMi_Focus,1);
	};
	if(DIA_Addon_Merdarion_ActivateTeleports_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_03");	//Bylo to obtížné?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_04");	//Ano a ne. Mohl bych dostat malou podporu?
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_05");	//Můžu ti dát trochu peněz. Pomohlo by?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_06");	//To nemůže škodit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_07");	//Podívejme se ...
		DIA_Addon_Merdarion_ActivateTeleports_OneTime = TRUE;
	};
	if(SC_ADW_ActivatedAllTelePortStones == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_08");	//Udělals to opravdu dobře. Můžu ti pouze pogratulovat k tvé práci.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_09");	//Nyní všechny znovu fungují. Nádherný pohled, nemyslíš?
	};
	AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_10");	//Zde je pár zlatých mincí.
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Merdarion_GotFocusCount = Merdarion_GotFocusCount + 1;
	if((Merdarion_GotFocusCount >= 1) && (Saturas_SCBroughtAllToken == FALSE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE) && (MIS_Saturas_LookingForHousesOfRulers == 0))
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_11");	//O, málem bych zapoměl. Saturas s tebou chtěl mluvit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_12");	//Měl bys za ním jít, hned jak budeš moci.
	};
};


instance DIA_Addon_Merdarion_ADW_PreTeachMana(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADW_PreTeachMana_Condition;
	information = DIA_Addon_Merdarion_ADW_PreTeachMana_Info;
	description = "Můžeš mě naučit něco ze svých magických schopností?";
};


func int DIA_Addon_Merdarion_ADW_PreTeachMana_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_PreTeachMana_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PreTeachMana_15_00");	//Můžeš mě naučit něco ze svých magických schopností?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PreTeachMana_06_01");	//Můžu tě naučit, jak zvednout tvou magickou moc.
	Merdarion_Addon_TeachMana = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,"Merdarion mi může zvednout manu.");
};


instance DIA_Addon_Merdarion_ADW_TEACH_MANA(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 99;
	condition = DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition;
	information = DIA_Addon_Merdarion_ADW_TEACH_MANA_Info;
	permanent = TRUE;
	description = "Chci zvýšit svou magickou moc.";
};


var int Merdarion_ADW_Empty;

func int DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition()
{
	if((Merdarion_ADW_Empty == FALSE) && (Merdarion_Addon_TeachMana == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00");	//Chci zvýšit svou magickou moc.
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00");	//Žádáš po mně víc, než můžu splnit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01");	//Už tě víc nemohu naučit.
		Merdarion_ADW_Empty = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};

