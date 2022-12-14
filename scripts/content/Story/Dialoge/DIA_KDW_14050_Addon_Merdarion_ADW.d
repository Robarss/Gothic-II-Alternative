
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
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_Back_15_00");	//Sly?el jsem dost.
	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
};

func void DIA_Addon_Merdarion_ADWHello_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_01");	//(poslouchej) Sly?els to? ... Ciz?, ne?
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_02");	//Hmmmm ...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_03");	//Tyto teleporta?n? kameny vypadaj?, jako kdyby ji? nefungovali, ale n?kdy jde sly?et, jak vr??.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_04");	//I kdy? jsou ne?inn?, skr?v? se v nich mnoho energie.
	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Co poh?n? teleporta?n? kameny?",DIA_Addon_Merdarion_ADWHello_reaktor);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Co si mysl??, ?e by je mohlo aktivovat?",DIA_Addon_Merdarion_ADWHello_was);
};

func void DIA_Addon_Merdarion_ADWHello_was()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_was_15_00");	//Co si mysl??, ?e by je mohlo aktivovat?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_01");	//M?m n?pad. Pot?eboval bych ale dok?zat svou teorii.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_02");	//P?ed p?r dny, jsem m?l pocit, jako kdybych styl t?chto budov u? vid?l.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_03");	//Mysl?m, ?e jim budeme muset dodat velk? mno?stv? magick? energie, abychom je znovu zprovoznili.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Kde jsi u? vid?l tyto teleporta?n? kameny?",DIA_Addon_Merdarion_ADWHello_wo);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Jakou magickou energii bychom jim mohli dodat ...",DIA_Addon_Merdarion_ADWHello_focus);
};

func void DIA_Addon_Merdarion_ADWHello_focus()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_00");	//Jakou magickou energii bychom jim mohli dodat ...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_01");	//Mysl?m, ?e pouze jedin?. A to energie z Ohniskov?ch kamen?.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_02");	//Mysl?m ty ohniskov? kameny, kter? byly pou?ity k vytvo?en? magick? bari?ry v Hornick?m ?dol?.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_03");	//Pokud v?m, tak jsi je pro n?s ned?vno sb?ral.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_04");	//Ano, vzpom?n?m si.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"??k??, ?e pot?ebuje? ov??it svou teorii.",DIA_Addon_Merdarion_ADWHello_focusProof);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Kde jsou nyn? ohniskov? kameny?",DIA_Addon_Merdarion_ADWHello_focusWo);
};

func void DIA_Addon_Merdarion_ADWHello_focusWo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusWo_15_00");	//Kde jsou nyn? ohniskov? kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_01");	//Byly mi sv??eny. M?l jsem je opatrovat dokud pro n? nenajdeme dal?? vyu?it?.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_02");	//Mysl?m, ?e jsme jej pr?v? na?li.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Sly?el jsem dost.",DIA_Addon_Merdarion_ADWHello_Back);
};

func void DIA_Addon_Merdarion_ADWHello_focusProof()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusProof_15_00");	//??k??, ?e pot?ebuje? ov??it svou teorii.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_01");	//N?kdo by musel um?stit ohniskov? kamen k teleporta?n?mu kamenu.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_02");	//Ale nev?m kam.
};

func void DIA_Addon_Merdarion_ADWHello_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_wo_15_00");	//Kde jsi vid?l tyto teleporta?n? kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_01");	//Byl jsi tak? v trestaneck? kolonii? Tos nikdy nenarazil na teleporta?n? kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_02");	//Jsem si celkem jist?, ?e tam mohou b?t i nyn?.
};

func void DIA_Addon_Merdarion_ADWHello_reaktor()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_reaktor_15_00");	//Co poh?n? teleporta?n? kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_01");	//Stavitel? byli velmi pokrokov? lid?.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_02");	//Pou??vali magii takov?m zp?sobem, jak? jsem nevid?l nikdy p?edt?m.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_03");	//S?? teleporta?n?ch kamen? byla postavena tak, aby dopravovala rychle po m?st?.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_04");	//Kameny na TOMTO m?st? se zdaj? jako v?choz? m?sto pro ostatn?.
};


instance DIA_Addon_Merdarion_FokusGeben(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_FokusGeben_Condition;
	information = DIA_Addon_Merdarion_FokusGeben_Info;
	description = "Dej mi ohniskov? k?men. Uvid?m, zda-li budu moci teleport zprovoznit.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_FokusGeben_15_00");	//Dej mi ohniskov? k?men. Uvid?m, zda-li budu moci teleport zprovoznit.
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_01");	//Dobr? tedy, vpo??dku. Ale starej se o n?j dob?e, sly????
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_02");	//Saturas by mi rozbil hlavu, kdybychom je ztratili.
	CreateInvItems(self,ItMi_Focus,1);
	B_GiveInvItems(self,other,ItMi_Focus,1);
	Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsADW,"Vodn? m?g Merdarion mi dal jeden star? ohniskov? k?men, kter? byl pou?it k vzty?en? magick? bari?ry v ?dol? dol?. Chce abych s n?m aktivoval jeden teleporta?n? k?men.");
};


instance DIA_Addon_Merdarion_FirstFocus(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_FirstFocus_Condition;
	information = DIA_Addon_Merdarion_FirstFocus_Info;
	description = "Aktivoval jsem jeden teleporta?n? k?men.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_00");	//Aktivoval jsem jeden teleporta?n? k?men.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_01");	//A jak vid?m, jsi st?le je?t? v po??dku.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_02");	//U? jsem o tom mluvil s ostatn?mi.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_03");	//Chceme zkusit aktivovat i ostatn? teleporta?n? kameny.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_04");	//Velmi n?m to pom??e v na?ich studi?ch, pokud se budeme moci rychle pohybovat z jedn? ??sti m?sta na jin?.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_05");	//Zde je dal?? ohniskov? k?men.
	CreateInvItems(self,ItMi_Focus,1);
	B_GiveInvItems(self,other,ItMi_Focus,1);
	Merdarion_GotFocusCount = 1;
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_06");	//Aktivuj ostatn?, pokud bude? moci.
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_07");	//Uvid?m, co budu moct ud?lat.
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	B_LogEntry(TOPIC_Addon_TeleportsADW,"Merdarion mi dal dal?? ohnisko. Chce, abych aktivoval i dal?? teleporta?n? kameny. Poka?d? kdy? aktivuji dal??, dostanu i dal?? ohnisko.");
};


instance DIA_Addon_Merdarion_ActivateTeleports(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ActivateTeleports_Condition;
	information = DIA_Addon_Merdarion_ActivateTeleports_Info;
	permanent = TRUE;
	description = "Aktivoval jsem dal?? teleporta?n? k?men.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_00");	//Aktivoval jsem dal?? teleporta?n? k?men.
	if(SC_ADW_ActivatedAllTelePortStones == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_01");	//Dej mi dal?? ohnisko.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_02");	//Samoz?ejm?, tady je.
		CreateInvItems(self,ItMi_Focus,1);
		B_GiveInvItems(self,other,ItMi_Focus,1);
	};
	if(DIA_Addon_Merdarion_ActivateTeleports_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_03");	//Bylo to obt??n??
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_04");	//Ano a ne. Mohl bych dostat malou podporu?
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_05");	//M??u ti d?t trochu pen?z. Pomohlo by?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_06");	//To nem??e ?kodit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_07");	//Pod?vejme se ...
		DIA_Addon_Merdarion_ActivateTeleports_OneTime = TRUE;
	};
	if(SC_ADW_ActivatedAllTelePortStones == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_08");	//Ud?lals to opravdu dob?e. M??u ti pouze pogratulovat k tv? pr?ci.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_09");	//Nyn? v?echny znovu funguj?. N?dhern? pohled, nemysl???
	};
	AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_10");	//Zde je p?r zlat?ch minc?.
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Merdarion_GotFocusCount = Merdarion_GotFocusCount + 1;
	if((Merdarion_GotFocusCount >= 1) && (Saturas_SCBroughtAllToken == FALSE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE) && (MIS_Saturas_LookingForHousesOfRulers == 0))
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_11");	//O, m?lem bych zapom?l. Saturas s tebou cht?l mluvit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_12");	//M?l bys za n?m j?t, hned jak bude? moci.
	};
};


instance DIA_Addon_Merdarion_ADW_PreTeachMana(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADW_PreTeachMana_Condition;
	information = DIA_Addon_Merdarion_ADW_PreTeachMana_Info;
	description = "M??e? m? nau?it n?co ze sv?ch magick?ch schopnost??";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PreTeachMana_15_00");	//M??e? m? nau?it n?co ze sv?ch magick?ch schopnost??
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PreTeachMana_06_01");	//M??u t? nau?it, jak zvednout tvou magickou moc.
	Merdarion_Addon_TeachMana = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,"Merdarion mi m??e zvednout manu.");
};


instance DIA_Addon_Merdarion_ADW_TEACH_MANA(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 99;
	condition = DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition;
	information = DIA_Addon_Merdarion_ADW_TEACH_MANA_Info;
	permanent = TRUE;
	description = "Chci zv??it svou magickou moc.";
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
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00");	//Chci zv??it svou magickou moc.
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00");	//??d?? po mn? v?c, ne? m??u splnit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01");	//U? t? v?c nemohu nau?it.
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

