
instance DIA_Addon_Saturas_ADW_EXIT(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 999;
	condition = DIA_Addon_Saturas_ADW_EXIT_Condition;
	information = DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXIT_14_00");	//Nech? t? Adanos ochra?uje.
};


instance DIA_Addon_Saturas_ADWStart(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADWStart_Condition;
	information = DIA_Addon_Saturas_ADWStart_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_ADWStart_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_ADWStart_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_00");	//D?ky Adanosovi. Kone?ne jsi tady. Mysleli jsme, ?e u? se neuk??e?.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_01");	//(rozzloben?) Co?e? Jakto ?e u? tady jste?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_02");	//Kdy? jsi pro?el skrz port?l, tak jsme t? n?sledovali. Kr?tce pot? jsme se objevili zde.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_03");	//Ale ty jsi tady nebyl. U? jsme tady n?kolik dn?.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_04");	//(p?ekvapen?) N?KOLIK DN?? Jak se to mohlo st?t?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_05");	//Nebyl jsi k nalezen?, Nefarius se sna?il zjistit, co se mohlo pokazit. Nev?d?l si s t?m rady.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_06");	//Dob?e. Te? jsi tady a m??eme za??t s na?? prac?.
	Wld_InsertNpc(Giant_Rat,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc(Giant_Rat,"ADW_PORTALTEMPEL_11");
	Info_ClearChoices(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Co se mezit?m stalo?",DIA_Addon_Saturas_ADWStart_was);
};

func void DIA_Addon_Saturas_ADWStart_was()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_was_15_00");	//Co se mezit?m stalo?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_01");	//Zjistili jsme toho docela dost.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_02");	//Z?m?t?esen? st?le s?l?. Nejsme daleko od epicentra.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_03");	//Stavitel? t?chto star?ch staveb tu nejd??v postavili tohle m?sto, jen? jsme ji? objevili.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_04");	//Bez zjevn?ch d?vod? jejich kultura zanikla.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_05");	//Te? bychom mohli u? jenom spekulovat pro?.
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Na?li jste n?co nov?ho ohledn? t?ch ztracen?ch lid??",DIA_Addon_Saturas_ADWStart_missingPeople);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Co se d?je s Ravenem?",DIA_Addon_Saturas_ADWStart_Raven);
};

func void DIA_Addon_Saturas_ADWStart_Raven()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_Raven_15_00");	//Co se d?je s Ravenem?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_01");	//V Ravenov? dopise se hovo?? o n?jak? svatyni, do kter? se pokou?? dostat.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_02");	//Shodli jsme se na tom, ?e by to mohl b?t Adanos?v chr?m a Raven se jej pokus? znesv?tit.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_03");	//Zem?t?esen? jsou z?ejm? d?sledkem poskvr?uj?c?ho zakl?nadla, kter? neust?le nar??? na mocn? protikouzla.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_04");	//Br?ny tohoto chr?mu jsou magicky uzav?en? a p?i pokusech o sejmut? kouzla o?ivuj? kamenn? str??ce.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_05");	//Chr?m zat?m odol?v?. Mus?me zastavit Ravena d??ve, ne? se dostane dovnit?.
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Co te? ud?l?me?",DIA_Addon_Saturas_ADWStart_wastun);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Raven je jen rudobaron, ne m?g. Jak by mohl ses?lat takov? zakl?nadla?",DIA_Addon_Saturas_ADWStart_RavenOnlyBaron);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Pro? se chce Raven do chr?mu dostat?",DIA_Addon_Saturas_ADWStart_RavenAim);
};

func void DIA_Addon_Saturas_ADWStart_RavenAim()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenAim_15_00");	//Pro? se chce Raven do chr?mu dostat?
	AI_Output(self,other,"DIA_Addon_Bodo_14_01");	//V?me jen to, ?e mu jde o mocn? artefakt, kter? n?jak souvis? s Adanosem a Beliarem.
	AI_Output(self,other,"DIA_Addon_Bodo_14_02");	//(rozzu?en?) M?li jsme v?d?t, ?e m? n?co za lubem.
};

func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00");	//Raven je jen rudobaron, ne m?g. Jak by mohl ses?lat takov? zakl?nadla?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01");	//Mo?n? to ned?l? on. Mo?n? je to jin? m?g, kter? poslouch? jeho rozkazy.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02");	//Ka?dop?dn? mus?me odvr?tit tohle zlo.
};

func void DIA_Addon_Saturas_ADWStart_missingPeople()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_missingPeople_15_00");	//Na?li jste n?co nov?ho, ohledn? t?ch ztracen?ch lid??
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_01");	//Zrovna v?era jsme na?li mrtvolu ryb??e. Le?? v ruin?ch na v?chod.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_02");	//Vypad? jako ryb?? z Khorinisu. M?l by ses tam j?t pod?vat.
	Saturas_AboutWilliam = TRUE;
	B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche);
};

func void DIA_Addon_Saturas_ADWStart_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun_15_00");	//Co te? ud?l?me?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_01");	//My tady z?staneme a budeme nad?le studovat tuhle kulturu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_02");	//Star? svitky stavitel? zachov?vaj? mnoho tajemstv?, kter? mus?me vy?e?it - pokud chceme zjistit, co se tu v minulosti stalo.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_03");	//Ty mus?? pro n?s je?t? ud?lat p?r v?c?.
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Co bych m?l ud?lat?",DIA_Addon_Saturas_ADWStart_wastun2);
};

func void DIA_Addon_Saturas_ADWStart_wastun2()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_00");	//Co bych m?l ud?lat?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_01");	//Najdi Ravena a nedovol mu znesv?tit chr?m.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_02");	//??ka? ?e ho m?m zab?t?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_03");	//Pokud to bude jedin? mo?n? cesta jak ho zastavit, tak ve jm?nu Adanosov?... Ano!
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_04");	//Posb?rej v?echny poz?statky po stavitel?ch, kter? najde? a p?ines n?m je.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_05");	//Mus?me se dozv?d?t n?co v?c o tomto n?rod? a jeho osudu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_06");	//Jestli chceme Ravena zastavit, mus?me v?d?t, co pl?nuje.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_07");	//Nav?c mus?? n?jak?m zp?sobem osvobodit otroky.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_08");	//(cynicky) To je v?echno? To ud?l?m i se zav?zan?ma o?ima.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_09");	//(mrzut?) V?m, ?e to bude tvrd? o???ek, ale pod?vej - m?? ?anci z?skat si mou d?v?ru.
	MIS_ADDON_Saturas_GoToRaven = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_RavenKDW,"Raven znesv?cuje Adanos?v chr?m. Mus?m ho zastavit. I kdybych ho m?l zab?t.");
	Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Sklaven,"Saturas chce, abych osvobodil v?zn?.");
	Log_CreateTopic(TOPIC_Addon_Relicts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Relicts,"Saturas chce, abych mu donesl v?echno, co by mohlo souviset se star?mi staviteli t?chto budov.");
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Ja tedy u? p?jdu.",DIA_Addon_Saturas_ADWStart_back);
};

func void DIA_Addon_Saturas_ADWStart_back()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_back_15_00");	//Ja tedy u? p?jdu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_01");	//Je?t? n?co ... pro Ravena pracuje mnoho bandit?.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_02");	//Po dobu tv? nep??tomnosti jsme p?ijali dal??ho ?lena 'Kruhu vody'
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_03");	//Poslali jsme ho do ba?in. Je?t? se nevr?til.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_04");	//P?edpokl?d?me, ?e bandit? ?to?? na v?echno, co nevypad? jako oni.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_05");	//Obstarej si zbroj bandit?.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_06");	//Bude? m?t ?anci dostat se bl?? bez toho, aby na tebe za?to?ili.
	Log_CreateTopic(TOPIC_Addon_BDTRuestung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung,LOG_Running);
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Bandit? ?to?? na v?echno co nevypad? jako oni. Mus?m si naj?t bandit? zbroj, abych se mohl dostat bl??.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Addon_Saturas_PoorRanger(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_PoorRanger_Condition;
	information = DIA_Addon_Saturas_PoorRanger_Info;
	description = "Co za bl?zna jsi poslal do mo??lu?";
};


func int DIA_Addon_Saturas_PoorRanger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PoorRanger_15_00");	//Co za bl?zna jsi poslal do mo??lu?
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_01");	//Jmenuje se Lance.
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_02");	//Mysl?m, ?e se nedostal moc daleko.
	Log_CreateTopic(TOPIC_Addon_Lance,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Lance,"Saturas poslal do mo??lu n?koho jm?nem Lance. Ob?v? se, ?e se nedostal moc daleko.");
};


instance DIA_Addon_Saturas_Piraten(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_Piraten_Condition;
	information = DIA_Addon_Saturas_Piraten_Info;
	description = "Kde z?skam tu pot?ebnou zbroj bandit??";
};


func int DIA_Addon_Saturas_Piraten_Condition()
{
	if((AlligatorJack.aivar[AIV_TalkedToPlayer] == FALSE) && (Greg.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Piraten_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Piraten_15_00");	//Kde z?skam tu pot?ebnou zbroj bandit??
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_01");	//Na zapad? je t?bor pir?t?.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_02");	//Pokud v?m, maj? s bandity n?jak? kontakty.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_03");	//Nemysl?m, ?e na tebe za?to?i, kdy? t? spozoruj?.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_04");	//Mo?n? ti tam pomohou.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Saturas v???, ?e pir?ti mi pomohou z?skat banditskou zbroj.");
};


instance DIA_Addon_Saturas_LanceLeiche(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_LanceLeiche_Condition;
	information = DIA_Addon_Saturas_LanceLeiche_Info;
	description = "Na?el jsem Lanceho mrtvolu.";
};


func int DIA_Addon_Saturas_LanceLeiche_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_PoorRanger) && (Npc_HasItems(NONE_Addon_114_Lance_ADW,ItRi_LanceRing) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_LanceLeiche_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceLeiche_15_00");	//Na?el jsem Lanceho mrtvolu.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_01");	//Nech? jeho du?e vstoup? do ???e Adanosovy.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_02");	//Bu? opatrn? synu. Nechci p?ij?t o dal??ho ?lena.
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP(XP_Addon_LanceLeiche);
};


instance DIA_Addon_Saturas_LanceRing(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_LanceRing_Condition;
	information = DIA_Addon_Saturas_LanceRing_Info;
	description = "M?m Lanceho akvamar?nov? prsten.";
};


func int DIA_Addon_Saturas_LanceRing_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_LanceLeiche) && Npc_HasItems(other,ItRi_LanceRing))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_LanceRing_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceRing_15_00");	//M?m Lanceho akvamar?nov? prsten.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceRing_14_01");	//Bude nejlep??, kdy? mi ho d?? d??v, ne? se dostane do nespr?vn?ch rukou.
	B_GiveInvItems(other,self,ItRi_LanceRing,1);
	B_GivePlayerXP(XP_Addon_LanceRing);
};


instance DIA_Addon_Saturas_Tokens(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 10;
	condition = DIA_Addon_Saturas_Tokens_Condition;
	information = DIA_Addon_Saturas_Tokens_Info;
	permanent = TRUE;
	description = "O relikvi?ch ...";
};


func int DIA_Addon_Saturas_Tokens_Condition()
{
	if(Saturas_SCBroughtAllToken == FALSE)
	{
		return TRUE;
	};
};


var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info()
{
	var int BroughtToken;
	var int XP_BroughtTokens;
	var int Kohle;
	AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_00");	//O relikvi?ch ...
	if((DIA_Addon_Saturas_Tokens_OneTime == FALSE) && (C_ScHasMagicStonePlate() || Npc_HasItems(other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_01");	//Mysl?m, ?e tady pro tebe n?co m?m.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_02");	//O t?chto kamenn?ch desk?ch u? v?me. Ty n?m ji? nepom??ou.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_03");	//Mus? tam toho b?t v?c ne? jen tohle.
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	BroughtToken = 0;
	XP_BroughtTokens = 0;
	if((Npc_HasItems(other,ItMi_Addon_Stone_01) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_02) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_03) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_04) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_05) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_04");	//M?? pro to vyu?it??
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_05");	//Vypad? to dob?e. Kde jsi to na?el?
		B_LogEntry(TOPIC_Addon_Relicts,"Saturas si odemne vzal tato u?en?:");
		if(Npc_HasItems(other,ItMi_Addon_Stone_01) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
			Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_06");	//Bandit? pou??vali tyhle kamenn? desky jako n?jak? druh pen?z.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_07");	//Desky nesou symbol Quarhodona, velk?ho bojovn?ka.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_08");	//Byl to vojev?dce a jeho syn Rhademes zni?il cel? m?sto.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_09");	//(opovr?en?) Tse. Vsad?m se, ?e bandit? ani netu??, s ??m to obchoduj?.
			Log_AddEntry(TOPIC_Addon_Relicts,"- ?ervenou kamennou desku, kterou bandit? pou??vaj? jako pen?ze. Je na n? zobrazen velk? v?le?n?k Quarhodon.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_02) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_02,1);
			Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_10");	//Tuhle desku jsem na?el v jedn? budov? na jihu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_11");	//Ach! Deska str??c? smrti. Pomoc? n? vyvol?vali duchy smrti.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_12");	//Souvislost mezi staviteli a jejich p?vodem je velmi bl?zk?.
			Log_AddEntry(TOPIC_Addon_Relicts,"- Fialov?ou kamennou desku ze s?dla Str??c? smrti na jihu.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_03) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_03,1);
			Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_13");	//Na?el jsem tuhle desku v budov? na jihoz?pad?.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_14");	//Soud? podle toho, co ??ka tahle deska, byl to D?m kn?ze ve m?st?.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_15");	//Velekn?z se jmenoval KHARDIMON. Zat?m toho o n?m moc nev?me.
			Log_AddEntry(TOPIC_Addon_Relicts,"- Modrou kamenou desku z obydl? velekn?ze na jihoz?pad?.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_04) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_04,1);
			Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_15");	//Tahle v?c le?ela v budov? bl?zko mo??lu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_16");	//To by mohl b?t D?m l??itel?.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_17");	//Zat?m o nich moc nev?me. Zd? se, ?e byli prvn?, co odsud zmizeli.
			Log_AddEntry(TOPIC_Addon_Relicts,"- Zelenou kamennou desku z Domu l??itel? v ji?n? ??sti ba?iny.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_05) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_05,1);
			Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_18");	//Tahle ??st le?ela ve velk? budov? v ka?onu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_19");	//Tohle je z knihovny star?ho n?roda.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_20");	//Podle v?eho je to deska u?enc?.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_80");	//V?t?ina rukopis?, kter? jsme na?li se vztahovaly na v?dce 'Domu u?enc?'
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_81");	//Zvl??tn?, ?e na t?ch z?pisc?ch nenechal sv? jm?no ...
			Log_AddEntry(TOPIC_Addon_Relicts,"- ?lutou kamenou desku z knihovny u?enc? na severu.");
		};
		if(SC_Knows_WeaponInAdanosTempel == TRUE)
		{
		};
		XP_BroughtTokens = XP_Addon_ForOneToken * BroughtToken;
		B_GivePlayerXP(XP_BroughtTokens);
		Saturas_BroughtTokenAmount = Saturas_BroughtTokenAmount + BroughtToken;
		if(Saturas_BroughtTokenAmount < 5)
		{
			if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_21");	//Velmi dob?e. Obr?zek m?sta se po??d vyjas?uje, ale st?le toho nev?me dost.
			};
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_22");	//V t?hle oblasti mus? b?t ukryto p?t kamenn?ch desek.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_23");	//N?jdi je a p?ines je sem.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_24");	//P??jmi tohle zlato za svou ochotu.
		Kohle = 200 * BroughtToken;
		CreateInvItems(self,ItMi_Gold,Kohle);
		B_GiveInvItems(self,other,ItMi_Gold,Kohle);
		ScBroughtToken = TRUE;
	};
	if(Saturas_BroughtTokenAmount == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_25");	//Te? jsme u? posb?rali v?echna u?en?, kter? pot?ebujeme.
		if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_26");	//Ud?lal jsi pro n?s velkou slu?bu, d?ky ti.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_27");	//Je to velik? pokrok pro na?e studia.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_28");	//Uvid?m, jestli se mi n?co poda?? naj?t.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_29");	//Dob?e. Posp?? si. ?as ut?k?.
	};
};


instance DIA_Addon_Saturas_StonePlateHint(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_StonePlateHint_Condition;
	information = DIA_Addon_Saturas_StonePlateHint_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_StonePlateHint_Condition()
{
	if(((Merdarion_GotFocusCount >= 2) || (RavenIsInTempel == TRUE)) && (Saturas_SCBroughtAllToken == FALSE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_StonePlateHint_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_00");	//Dob?e ?e ses vr?til. Mus?m ti ??ct n?co nov?ho.
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_15_01");	//Poslouch?m.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_02");	//Ztracene m?sto se jmenovalo Jharkendar. Bylo tady p?t vl?dc?, kte?? ??dili sv?j lid.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_03");	//Ka?d? s t?chto vl?dc? m?l sv? s?dlo, ve kter?m ?il a m?l sv?j majetek.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_04");	//Mysl?m si, ?e by jsi m?l hledat ona u?en? po star? kultu?e zrovna v t?chto m?stech.
	MIS_Saturas_LookingForHousesOfRulers = LOG_Running;
	Info_ClearChoices(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint,"Co kdy? u? ta u?en? neexistuj??",DIA_Addon_Saturas_StonePlateHint_unter);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint,"Kde p?esn? bych m?l ta u?en? hledat?",DIA_Addon_Saturas_StonePlateHint_wo);
};

func void DIA_Addon_Saturas_StonePlateHint_wo()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_wo_15_00");	//Kde p?esn? bych m?l ta u?en? hledat?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_01");	//Riordian t? obezn?m? s uspo??d?n?m staveb v Jharkendaru.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_02");	//Pov? ti, kde je m?? hledat.
	Log_CreateTopic(TOPIC_Addon_HousesOfRulers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers,LOG_Running);
	B_LogEntry(TOPIC_Addon_HousesOfRulers,"Saturas chce, abych se poohl?dl po n?jakych u?ite?n?ch z?znamech stavitel?. Riordian mi pov?, kde je m?m hledat.");
};

func void DIA_Addon_Saturas_StonePlateHint_unter()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_unter_15_00");	//Co kdy? u? ta u?en? neexistuj??
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_01");	//Jestli nenajde? n?kter? z on?ch Dom?, tak potom byly zrejm? zni?eny spolu s m?stem.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_02");	//Ale pokud je?t? st?le existuj?, budou neocenitelnou pomoc? pro na?e studium.
};


instance DIA_Addon_Saturas_SCBroughtAllToken(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information = DIA_Addon_Saturas_SCBroughtAllToken_Info;
	description = "Na co pot?ebuje? t?ch p?t kamenn?ch desek?";
};


func int DIA_Addon_Saturas_SCBroughtAllToken_Condition()
{
	if((ScBroughtToken == TRUE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_SCBroughtAllToken_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_SCBroughtAllToken_15_00");	//Na co pot?ebuje? t?ch p?t kamenn?ch desek?
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_01");	//Z?znamy, kter? jsi na?el v ruin?ch nejsou kompletn?.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_02");	//Ale v z?pisech stavitel? se ??ka o p?ti vl?dc?ch, kte?? ??dili m?sto.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_03");	//Ka?d? z t?chto vl?dc? m?l jednu z desek, kter? symbolizovali jeho autoritu.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_04");	//Mysl?m, ?e tyhle desky jsou kl??em na m? ot?zky.
};


instance DIA_Addon_Saturas_Flut(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_Flut_Condition;
	information = DIA_Addon_Saturas_Flut_Info;
	description = "Nefarius mi ?ekl o p??livu.";
};


func int DIA_Addon_Saturas_Flut_Condition()
{
	if((NefariusADW_Talk2Saturas == TRUE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Flut_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Flut_15_00");	//Nefarius mi ?ekl o p??livu.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_02");	//Uk?zalo se, ?e Adanos sestoupil z nebes, aby potrestal nev???c?ch a vyhnal je do sv?ta mrtv?ch.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_03");	//Ve sv?m svat?m hn?vu nechal mo?em pohltit m?sto a smetl jej pry?.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_04");	//Ba?ina na v?chod? je je?t? st?le sv?dectv?m t?chto ud?lost?.
	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Saturas_AdanosZorn(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_AdanosZorn_Condition;
	information = DIA_Addon_Saturas_AdanosZorn_Info;
	description = "Co se Adanosovi stalo, ?e se tak rozhn?val?";
};


func int DIA_Addon_Saturas_AdanosZorn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_Flut) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_AdanosZorn_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_AdanosZorn_15_00");	//Co se Adanosovi stalo, ?e se tak rozhn?val?
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_01");	//Chr?mem tohoto m?sta byla kdysi velk? z??iv? budova.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_02");	//V?ichni ji obdivovali a modlili se k n??emu bohu Adanosovi.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_03");	//Rhademes, syn vojev?dce Quarhodrona, znesv?til chr?m.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_04");	//Jeden po druh?m podlehli zlu.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_05");	//P?edpokl?dam, ?e Adanos jim nemohl odpustit a jeho pomsta postihla cel? kraj.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_06");	//Proto je tak d?le?it?, aby jsme Ravena zastavili.
};


instance DIA_Addon_Saturas_RavenInfos(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 9;
	condition = DIA_Addon_Saturas_RavenInfos_Condition;
	information = DIA_Addon_Saturas_RavenInfos_Info;
	permanent = TRUE;
	description = "Ohledn? Ravena ...";
};


var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;
var int Addon_Saturas_Fortuno;

func int DIA_Addon_Saturas_RavenInfos_Condition()
{
	if((MIS_ADDON_Saturas_GoToRaven == LOG_Running) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RavenInfos_Info()
{
	var int RavenNeuigkeit;
	var int XP_RavenNeuigkeit;
	AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_00");	//Ohledn? Ravena ...
	RavenNeuigkeit = 0;
	if((Thorus.aivar[AIV_TalkedToPlayer] == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE) && (RavenIsInTempel == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_01");	//Byl jsem v t?bo?e bandit?. Raven je jejich v?dce.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_02");	//Ale na to, abych se dostal bl?? k Ravenovi, se budu muset zbavit n?kolika bandit?.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_03");	//Dob?e. Hodn? ?t?st?. Ale nezapom??, ?e to mus?? ud?lat rychle.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_04");	//Raven nesm? za ??dnych okolnost? dos?hnout sv?ho c?le.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if((SC_KnowsRavensGoldmine == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_05");	//M? sv?j zlat? d?l, a nut? zajatce hledat zlato.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_06");	//To se mu podob?. Mus?? zajatce osvobodit.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_07");	//(povzdych) Jasn?. Pracuji na tom.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if((SC_KnowsFortunoInfos == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_08");	//Mezi bandity je jeden chlap, kter? tvrd?, ?e zn? Raven?v pl?n.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_09");	//Jmenuje se Fortuno. Mysl? si, ?e Raven se chce dostat do chr?mu, aby z?skal mocn? artefakt.
		AI_Output(self,other,"DIA_Addon_Bodo_14_03");	//A? V? n?co v?c o tom artefaktu?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_11");	//?ekl mi jen to, ?e Raven nechal vykopat hrob jednoho z Adanosov?ch kne??.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_12");	//Mo?n? ten hrob obsahuje kl?? ke chr?mu. Snad bychom se tam m?li porozhl?dnout.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_13");	//Raven p?inutil zajatce, aby hrob vykopali.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_14");	//To je zl?. Mus?? si posp??it a zastavit Ravena.
		Addon_Saturas_Fortuno = TRUE;
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if((RavenIsInTempel == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_15");	//Vtrhl jsem do Ravenova doup?te.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_16");	//A? Co se stalo?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_17");	//P?i?el jsem pozd?. Ztratil se v Adanosov? chr?mu p??mo p?ed m?ma o?ima.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_18");	//(rozzu?ene) Co?e? To je KATASTROFA! Pro? jsi ho nen?sledoval?!
		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if(RavenNeuigkeit != 0)
	{
		XP_RavenNeuigkeit = RavenNeuigkeit * XP_Ambient;
		B_GivePlayerXP(XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_19");	//P?i?el jsi ozn?mit n?jak? nov? zpr?vy?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_20");	//Zat?m ne.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_21");	//D?m ti radu. Nepodce?uj Ravena, rozum???
	};
};


instance DIA_Addon_Saturas_TuerZu(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_TuerZu_Condition;
	information = DIA_Addon_Saturas_TuerZu_Info;
	description = "Nemohu Ravena sledovat. Uzav?el br?nu zevnit?.";
};


func int DIA_Addon_Saturas_TuerZu_Condition()
{
	if((MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_TuerZu_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_00");	//Nemohu Ravena sledovat. Uzav?el br?nu zevnit?.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_02");	//(rozru?en?) Mus?m p?em??let ...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_03");	//Ot?zkou je, jak se Raven dostal dovnit? ...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_04");	//Co ud?lal p?edt?m, ne? pro?el skrz br?nu?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_05");	//Vyslovil na br?nu zakl?nadlo.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_06");	//A p?ed t?m?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_07");	//Otev?el hrob.
	if(Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_09");	//U? jsem ti to jednou ??kal.
		AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_10");	//Spr?vn?!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_08");	//U? v?m, musel tam vykonat n?jak? ritual.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_11");	//Ritu?l ...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_12");	//Ano! To je ono!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_13");	//Ob?v?m se, ?e Raven z?skal s?lu Str??c? smrti.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_14");	//A te? z?sk? v?domosti ze svatyn?!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_15");	//Mus?? j?t za Myxirem a ??ct mu to!
	Log_CreateTopic(TOPIC_Addon_Quarhodron,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron,LOG_Running);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Raven ovl?dl Str??ce smrti. Taky z?skal od ducha informace o Adanosov? chr?mu. M?l bych to ozn?mit Myxirovi.");
	Saturas_RiesenPlan = TRUE;
};


instance DIA_Addon_Saturas_GhostQuestions(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_GhostQuestions_Condition;
	information = DIA_Addon_Saturas_GhostQuestions_Info;
	description = "Mluvil jsem s Quarhodronem.";
};


func int DIA_Addon_Saturas_GhostQuestions_Condition()
{
	if((Npc_IsDead(Quarhodron) == FALSE) && (SC_TalkedToGhost == TRUE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_GhostQuestions_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_00");	//Mluvil jsem s Quarhodronem.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_01");	//A co ??kal?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_02");	//Pom??e mi, jen kdy? mu odpov?m na jeho ot?zky.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_03");	//V ?em je probl?m?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_04");	//Nev?m spr?vn? odpov?di.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_05");	//Hmm ... v?me, ?e u?enci z tohoto m?sta postavili na severu knihovnu.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_06");	//Byli velice usilovn? a sna?ili se zapisovat v?echny sv? d?jiny.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_07");	//Mo?n? nalezne? odpov?di na Quarhodronovy ot?zky prav? tam.
	B_LogEntry(TOPIC_Addon_Quarhodron,"Saturas p?edpokl?d?, ?e bych mohl naj?t odpov?di na Quarhodronovy ot?zky v knihovn? u?enc?. Ta je daleko na severu.");
};


instance DIA_Addon_Saturas_TalkedToGhost(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_TalkedToGhost_Condition;
	information = DIA_Addon_Saturas_TalkedToGhost_Info;
	description = "Probl?m se vstupem do chr?mu jsem vy?e?il.";
};


func int DIA_Addon_Saturas_TalkedToGhost_Condition()
{
	if((Ghost_SCKnowsHow2GetInAdanosTempel == TRUE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_TalkedToGhost_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_00");	//Probl?m se vstupem do chr?mu jsem vy?e?il.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_01");	//Duch promluvil?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_02");	//Ano, promluvil.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_03");	//V?? jak se dostat do chr?mu?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_04");	//Ano. A nav?c mi prozradil, co se skr?v? uvnit?.
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_05");	//??kal n?co o mocn?m me?i a o komnat?ch Adanose.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_06");	//(zoufale) Ach Adanosi. Jsme ale hlup?ci. Jakto ?e jsme nic netu?ili?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_07");	//(?okovan?) Podle tv?ch slov ...
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_08");	//Ten me? m??e b?t jedin? 'Beliar?v dr?p'.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_09");	//Mus?me p?ekonat komnaty tak rychle, jak to jen jde a z?skat tu zbra?.
	Info_ClearChoices(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost,"Co je to 'Beliar?v dr?p'?",DIA_Addon_Saturas_TalkedToGhost_wasistdas);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost,"Co jsou Adanosovy komnaty?",DIA_Addon_Saturas_TalkedToGhost_kammern);
};

func void DIA_Addon_Saturas_TalkedToGhost_wasistdas()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00");	//Co je to 'Beliar?v dr?p'?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01");	//Je to p?evt?len? zlo. Sestrojil ho s?m Beliar.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02");	//Ka?d? kdo ho pou??v?, m? hroznou zbra? ni?en?.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03");	//??m silnej?? je nositel, t?m mocn?j?? je i 'dr?p'.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04");	//Jen ten, kdo m? siln?ho ducha a pevnou v?li, m??e odolat kletb?.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05");	//Te? je mi u? jasn?, pro? stavitel? zablokovali tohle ?dol?.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06");	//P?inesli tuto ??belskou zbra? do sv?ho m?sta a oddali se jej?mu kouzlu.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07");	//Ti arogantn? bl?zni zabili jeden druh?ho kv?li nenasytnosti.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08");	//Krutost neskon?ila, Adanos?v hn?v se st?hnul okolo t?to krajiny a v?e se potopilo do hlubin mo?e.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09");	//Vskutku. Stavitel? port?lu velmi dob?e ukryli tyto v?ci p?ed zbytkem sv?ta.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10");	//Jak tragick? konec pro tak ??asnou kulturu.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11");	//Pochopil jsi nal?havost na?? mise?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12");	//Raven je siln? bojovn?k a je zaslepen touhou po moci.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13");	//V jeho rukou se 'dr?p' st?v? n?strojem zk?zy.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14");	//Nesm? z?skat tu zbra?, jinak jsme v?ichni odsouzeni k z?hub?.
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	B_LogEntry(TOPIC_Addon_Klaue,"V Adanosov? chr?mu je siln? zbra?. Jmenuje se 'Beliar?v dr?p'. Raven se ji nesm? zmocnit.");
};

func void DIA_Addon_Saturas_TalkedToGhost_kammern()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_kammern_15_00");	//Co jsou Adanosovy komnaty?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_01");	//Zjistili jsme, ?e br?na nen? jedin? p?ek??ka na cest? do svatyn?.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_02");	//V chr?mu jsou t?i komnaty, jen? maj? zastavit vet?elce.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_03");	//Barevn? kamenn? desky stavitel? jsou kl??em.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_04");	//Jen kdy? m?? v?echny desky a vy?e??? jejich h?danku, sm?? vstoupit dovnit?.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_05");	//Nev?m, jestli Raven rozlu?til tajemstv? chr?mu, ale pokud ano, tak m?me velk? probl?m.
	Log_CreateTopic(TOPIC_Addon_Kammern,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern,LOG_Running);
	B_LogEntry(TOPIC_Addon_Kammern,LogText_Addon_Relicts);
	Log_CreateTopic(TOPIC_Addon_Relicts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Relicts,LogText_Addon_Relicts);
	Saturas_KnowsHow2GetInTempel = TRUE;
};


instance DIA_Addon_Saturas_RelictsBack(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_RelictsBack_Condition;
	information = DIA_Addon_Saturas_RelictsBack_Info;
	description = "Co p?esn? m?m  v chr?mu s u?en?mi ud?lat?";
};


func int DIA_Addon_Saturas_RelictsBack_Condition()
{
	if((Saturas_SCBroughtAllToken == TRUE) && (Saturas_KnowsHow2GetInTempel == TRUE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RelictsBack_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_RelictsBack_15_00");	//Co p?esn? m?m  v chr?mu s u?en?mi ud?lat?
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_03");	//To zat?m nev?me. Ale doufame, ?e to zjist??, hned jak vstoup?? dovnit?.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_05");	//Je mi l?to, ?e ti nemohu ??ct v?c. Te? u? je v?echno jenom na tob?.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_06");	//Vem si ta u?en? a okam?it? b?? do chr?mu.
	CreateInvItems(hero,ItMi_Addon_Stone_01,1);
	CreateInvItems(hero,ItMi_Addon_Stone_02,1);
	CreateInvItems(hero,ItMi_Addon_Stone_03,1);
	CreateInvItems(hero,ItMi_Addon_Stone_04,1);
	CreateInvItems(hero,ItMi_Addon_Stone_05,1);
	AI_PrintScreen(PRINT_ItemsErhalten,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	B_LogEntry(TOPIC_Addon_Kammern,"Saturas m? pos?la do Adonosova chr?mu s p?ti relikviemi po stavitel?ch. Mus?m se dostat dovnit? a zastavit Ravena.");
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_07");	//Adanosi slituj se nad n?m a ochra? n?s v?echny.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_08");	//Mo?n? je?t? nen? pozd?.
};


instance DIA_Addon_Saturas_RavensDead(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_RavensDead_Condition;
	information = DIA_Addon_Saturas_RavensDead_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_RavensDead_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RavensDead_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_00");	//Zem?t?esen? se zastavilo a ty jsi je?t? st?le na?ivu.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_01");	//Splnil jsi sv?j ?kol?
	AI_Output(other,self,"DIA_Addon_Saturas_RavensDead_15_02");	//Ano. Raven je mrtev.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_03");	//Potom je u? po v?em. D?ky Adanosovi.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_04");	//Vedl sis dob?e synu. Jsme tv?mi dlu?n?ky.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_05");	//Zbav se t?to zl? a mocn? zban? a p?ines rovnov?hu zp?t do t?hle ??sti sv?ta.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_06");	//Po dobu zem?t?esen? jsme se radili, co budeme d?lat d?l. A m?me v?sledek.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_07");	//B?? a z?skej 'Beliar?v dr?p'. Je ti p?edur?en.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_08");	//V tv?ch ruk?ch, by mohl b?t mocn?m spojencem pro n?s v?echny.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_09");	//Pou??vej jej moud?e, m?j synu. Adanos ti bude pomahat.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_11");	//Z?staneme zde, a ujist?me se, ?e chr?m bude znovu z??it tak jako kdysi.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_12");	//Jen Myxir p?jde do Khorinisu a ozn?m? Vatrasovi.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_13");	//Vatras byl velmi dlouho v tom m?st? s?m.
	Log_CreateTopic(TOPIC_Addon_VatrasAbloesung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung,LOG_Running);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung,"Myxir ?el do m?sta vyst??dat Vatrase.");
	B_GivePlayerXP(XP_Addon_Saturas_RavensDead);
};


instance DIA_Addon_Saturas_FreedMissingPeople(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information = DIA_Addon_Saturas_FreedMissingPeople_Info;
	description = "Osvobodil jsem v?zn?.";
};


func int DIA_Addon_Saturas_FreedMissingPeople_Condition()
{
	if(MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_FreedMissingPeople_15_00");	//Osvobodil jsem v?zn?.
	AI_Output(self,other,"DIA_Addon_Saturas_FreedMissingPeople_14_01");	//Velmi dob?e. Te? se mohou vr?tit zp?t dom?.
	B_GivePlayerXP(XP_Addon_Saturas_FreedMissingPeople);
};


instance DIA_Addon_Saturas_BeliarsWeapon(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information = DIA_Addon_Saturas_BeliarsWeapon_Info;
	description = "Na?el jsem 'Beliar?v dr?p'.";
};


func int DIA_Addon_Saturas_BeliarsWeapon_Condition()
{
	if(C_ScHasBeliarsWeapon() && (RavenIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info()
{
	AI_UnequipWeapons(hero);
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_00");	//Na?el jsem 'Beliar?v dr?p'.
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) && (SC_FailedToEquipBeliarsWeapon == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_01");	//Ale nemohu ho pou??t.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_02");	//Beliar?v dr?p je velice zvl??tn? zbra?.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_03");	//M? vlastn? v?li i ducha.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_04");	//Ty, majitel t?to mocn? zbran?, jsi jej? p?n.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_05");	//Ta zbra? je ?as?? tebe a p?izp?sobuje se tv?m schopnostem.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_06");	//Ale nem??e? ji donutit, aby d?lala, co si zamane?.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_07");	//Jenom s?m Beliar ji m??e donutit, aby t? poslouchala.
	Info_ClearChoices(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon,"Pro? by mi m?l Beliar pomoci?",DIA_Addon_Saturas_BeliarsWeapon_besser);
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon,"Co m??u d?lat s touhle zbran??",DIA_Addon_Saturas_BeliarsWeapon_wastun);
};

func void DIA_Addon_Saturas_BeliarsWeapon_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00");	//Co m??u d?lat s touhle zbran??
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01");	//To z?le?? na tob?. Ovl?dl jsi tu zbra? a te? jsi jej? p?n.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02");	//Mohu ti d?t jenom radu, co s n? m??e? ud?lat.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03");	//Bu? mi ji odevzd??, a j? zaru??m, ?e u? nikdy nezp?sob? ??dnou ?kodu ...
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04");	//... nebo vyu?ije? jej? moc a pou?ije? ji k boji.
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon,"Nem??e? si tu zbra? nechat?",DIA_Addon_Saturas_BeliarsWeapon_geben);
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_geben_15_00");	//Nem??e? si tu zbra? nechat?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_03");	//Pokud mi ji d??, zni??m ji, tak?e u? ji nikdo nebude moci zneu??t.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_04");	//Tak?e si promysli, co chce?.
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	B_LogEntry(TOPIC_Addon_Klaue,"M??u 'Beliar?v dr?p' odevzdat Saturasovi anebo si ho nechat.");
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_besser_15_00");	//Pro? by mi m?l Beliar pomoci?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_01");	//Jenom pobo?n? ?lov?k ho m??e vyprovokovat.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_02");	//Bu? opatrn?. Beliar je nejhor??.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_03");	//Pokud ho rozzu???, brzo to poc?t??.
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Klaue,"Abych mohl ovl?dat 'Beliar?v dr?p', mus?m se pomodlit k Beliarovi.");
	B_Say(other,self,"$VERSTEHE");
};


instance DIA_Addon_Saturas_PermENDE_ADDON(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information = DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent = TRUE;
	description = "Co te? budete d?lat?";
};


func int DIA_Addon_Saturas_PermENDE_ADDON_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_RavensDead))
	{
		return TRUE;
	};
};


var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;

func void DIA_Addon_Saturas_PermENDE_ADDON_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PermENDE_ADDON_15_00");	//Co te? budete d?lat?
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_01");	//Z?staneme tady a zajist?me, aby chr?m op?t odhalil svou kr?su a velikost.
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_02");	//P??l?? dlouho tyto zdi ch?traj?.
	if(DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_03");	//D?ky ti synu ...
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_04");	//Velmi jsem se v tob? m?lil. Jsi ochr?nce rovnov?hy. O tom nen? pochyb.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_05");	//Bez tv? pomoci a state?nosti by ostrov Khorinis zanikl. D?kujeme ti a budeme oslavovat tvou ?est.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_06");	//Soust?e? se na sv? dal?? ?lohy, kter? le?? p?ed tebou a udr?uj tento sv?t v rovnov?ze a m?ru.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_07");	//Jdi a p??jmi sv?j osud ochr?nce. Budeme se za tebe modlit.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};


instance DIA_Addon_Saturas_BeliarWeapGeben(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information = DIA_Addon_Saturas_BeliarWeapGeben_Info;
	description = "Vem si 'Beliar?v dr?p' a zni? ho.";
};


func int DIA_Addon_Saturas_BeliarWeapGeben_Condition()
{
	if(C_ScHasBeliarsWeapon() && (RavenIsDead == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Saturas_BeliarsWeapon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGeben_15_00");	//Vem si 'Beliar?v dr?p' a zni? ho.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_01");	//Jak chce?, synu. Dej mi ho.
	B_ClearBeliarsWeapon();
	AI_PrintScreen(PRINT_ItemGegeben,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_02");	//U? nikdy nikomu neubl???. Zahod?m ho do hlubin mo?e.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_03");	//Adanos na to dohl?dne.
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP(XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};


instance DIA_Addon_Saturas_ADW_PreTeachCircle(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 10;
	condition = DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information = DIA_Addon_Saturas_ADW_PreTeachCircle_Info;
	description = "M??e? m? nau?it kruhy magie?";
};


func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_00");	//M??e? m? nau?it kruhy magie?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_01");	//Jsi m?g Ohn?. Co by ?ekl Pyrokar?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_02");	//To nemus? nikdo v?d?t.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_03");	//(povzdych) Vid?m, ?e to opravdu mysl?? v??n?, jsem opravdu p?ekvapen tvoj? ??dost?.
	if(RavenIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_04");	//Pokud budu m?t dojem, ?e svoje v?domosti pou??v?? k ubli?ov?n? nevinn?m, tak se mnou v?c nepo??tej.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_05");	//Douf?m, ?e m? nezklame?.
	};
	Saturas_Addon_TeachCircle = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_SaturasTeach);
};


instance DIA_Addon_Saturas_ADW_CIRCLE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 99;
	condition = DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information = DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent = TRUE;
	description = "Chci se nau?it dal?? kruh magie.";
};


var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;

func int DIA_Addon_Saturas_ADW_CIRCLE_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 6) && (Saturas_Addon_TeachCircle == TRUE) && (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_CIRCLE_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CIRCLE_15_00");	//Chci se nau?it dal?? kruh magie.
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		if(B_TeachMagicCircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_01");	//Ano, jsi pripraven nau?it se o tom n?co v?c.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_02");	//Vstoupils do druh?ho kruhu magie. Adanos ti d?v? moudrost, abys pou?il svou novou moc chyt?e.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		if(B_TeachMagicCircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_03");	//Ano, nastal spr?vn? ?as. Vstup do t?et?ho kruhu magie.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_04");	//Tv? v?domosti ti dovoluj? pou??vat nov? kouzla. Pou??vej je opatrn?.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		if(B_TeachMagicCircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_05");	//U? je na?ase. Jsi p?ipraven, abys vstoupil do ?tvrt?ho kruhu magie.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_06");	//Tv? slova a ?iny jsou te? velmi mocn?. Vyb?rej si sv? nov? kouzla opatrn? a s rozumem.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		if(B_TeachMagicCircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_07");	//Dostal jsi opr?vn?n? vstoupit do p?t?ho kruhu magie.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_08");	//Kouzla, kter? te? dostane?, jsou velice ni?iv?.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_09");	//Uv?dom si svou moc a nepodl?hej zlu.
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_10");	//To u? te? nen? m? ?loha.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_11");	//Na to, aby ses nau?il ?est? a z?rove? posledn? kruh magie, bys m?l nav?t?vit kla?ter m?g? Ohn?.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_12");	//Je je?t? st?le p??l?? brzy. Vra? se pozd?ji.
	};
};

