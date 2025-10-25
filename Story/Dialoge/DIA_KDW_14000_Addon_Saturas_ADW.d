
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
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXIT_14_00");	//Nechť tě Adanos ochraňuje.
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
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_00");	//Díky Adanosovi. Konečne jsi tady. Mysleli jsme, že už se neukážeš.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_01");	//(rozzlobeně) Cože? Jakto že už tady jste?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_02");	//Když jsi prošel skrz portál, tak jsme tě následovali. Krátce poté jsme se objevili zde.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_03");	//Ale ty jsi tady nebyl. Už jsme tady několik dní.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_04");	//(překvapeně) NĚKOLIK DNÍ? Jak se to mohlo stát?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_05");	//Nebyl jsi k nalezení, Nefarius se snažil zjistit, co se mohlo pokazit. Nevěděl si s tím rady.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_06");	//Dobře. Teď jsi tady a můžeme začít s naší prací.
	Wld_InsertNpc(Giant_Rat,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc(Giant_Rat,"ADW_PORTALTEMPEL_11");
	Info_ClearChoices(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Co se mezitím stalo?",DIA_Addon_Saturas_ADWStart_was);
};

func void DIA_Addon_Saturas_ADWStart_was()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_was_15_00");	//Co se mezitím stalo?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_01");	//Zjistili jsme toho docela dost.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_02");	//Zěmětřesení stále sílí. Nejsme daleko od epicentra.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_03");	//Stavitelé těchto starých staveb tu nejdřív postavili tohle město, jenž jsme již objevili.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_04");	//Bez zjevných důvodů jejich kultura zanikla.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_05");	//Teď bychom mohli už jenom spekulovat proč.
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Našli jste něco nového ohledně těch ztracených lidí?",DIA_Addon_Saturas_ADWStart_missingPeople);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Co se děje s Ravenem?",DIA_Addon_Saturas_ADWStart_Raven);
};

func void DIA_Addon_Saturas_ADWStart_Raven()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_Raven_15_00");	//Co se děje s Ravenem?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_01");	//V Ravenově dopise se hovoří o nějaké svatyni, do které se pokouší dostat.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_02");	//Shodli jsme se na tom, že by to mohl být Adanosův chrám a Raven se jej pokusí znesvětit.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_03");	//Zemětřesení jsou zřejmě důsledkem poskvrňujícího zaklínadla, které neustále naráží na mocná protikouzla.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_04");	//Brány tohoto chrámu jsou magicky uzavřené a při pokusech o sejmutí kouzla oživují kamenné strážce.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_05");	//Chrám zatím odolává. Musíme zastavit Ravena dříve, než se dostane dovnitř.
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Co teď uděláme?",DIA_Addon_Saturas_ADWStart_wastun);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Raven je jen rudobaron, ne mág. Jak by mohl sesílat taková zaklínadla?",DIA_Addon_Saturas_ADWStart_RavenOnlyBaron);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Proč se chce Raven do chrámu dostat?",DIA_Addon_Saturas_ADWStart_RavenAim);
};

func void DIA_Addon_Saturas_ADWStart_RavenAim()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenAim_15_00");	//Proč se chce Raven do chrámu dostat?
	AI_Output(self,other,"DIA_Addon_Bodo_14_01");	//Víme jen to, že mu jde o mocný artefakt, který nějak souvisí s Adanosem a Beliarem.
	AI_Output(self,other,"DIA_Addon_Bodo_14_02");	//(rozzuřeně) Měli jsme vědět, že má něco za lubem.
};

func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00");	//Raven je jen rudobaron, ne mág. Jak by mohl sesílat taková zaklínadla?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01");	//Možná to nedělá on. Možná je to jiný mág, který poslouchá jeho rozkazy.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02");	//Každopádně musíme odvrátit tohle zlo.
};

func void DIA_Addon_Saturas_ADWStart_missingPeople()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_missingPeople_15_00");	//Našli jste něco nového, ohledně těch ztracených lidí?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_01");	//Zrovna včera jsme našli mrtvolu rybáře. Leží v ruinách na východ.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_02");	//Vypadá jako rybář z Khorinisu. Měl by ses tam jít podívat.
	Saturas_AboutWilliam = TRUE;
	B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche);
};

func void DIA_Addon_Saturas_ADWStart_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun_15_00");	//Co teď uděláme?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_01");	//My tady zůstaneme a budeme nadále studovat tuhle kulturu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_02");	//Staré svitky stavitelů zachovávají mnoho tajemství, které musíme vyřešit - pokud chceme zjistit, co se tu v minulosti stalo.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_03");	//Ty musíš pro nás ještě udělat pár věcí.
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Co bych měl udělat?",DIA_Addon_Saturas_ADWStart_wastun2);
};

func void DIA_Addon_Saturas_ADWStart_wastun2()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_00");	//Co bych měl udělat?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_01");	//Najdi Ravena a nedovol mu znesvětit chrám.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_02");	//Říkaš že ho mám zabít?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_03");	//Pokud to bude jediná možná cesta jak ho zastavit, tak ve jménu Adanosově... Ano!
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_04");	//Posbírej všechny pozůstatky po stavitelích, které najdeš a přines nám je.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_05");	//Musíme se dozvědět něco víc o tomto národě a jeho osudu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_06");	//Jestli chceme Ravena zastavit, musíme vědět, co plánuje.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_07");	//Navíc musíš nějakým způsobem osvobodit otroky.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_08");	//(cynicky) To je všechno? To udělám i se zavázanýma očima.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_09");	//(mrzutě) Vím, že to bude tvrdý oříšek, ale podívej - máš šanci získat si mou důvěru.
	MIS_ADDON_Saturas_GoToRaven = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_RavenKDW,"Raven znesvěcuje Adanosův chrám. Musím ho zastavit. I kdybych ho měl zabít.");
	Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Sklaven,"Saturas chce, abych osvobodil vězně.");
	Log_CreateTopic(TOPIC_Addon_Relicts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Relicts,"Saturas chce, abych mu donesl všechno, co by mohlo souviset se starými staviteli těchto budov.");
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Ja tedy už půjdu.",DIA_Addon_Saturas_ADWStart_back);
};

func void DIA_Addon_Saturas_ADWStart_back()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_back_15_00");	//Ja tedy už půjdu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_01");	//Ještě něco ... pro Ravena pracuje mnoho banditů.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_02");	//Po dobu tvé nepřítomnosti jsme přijali dalšího člena 'Kruhu vody'
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_03");	//Poslali jsme ho do bažin. Ještě se nevrátil.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_04");	//Předpokládáme, že bandité útočí na všechno, co nevypadá jako oni.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_05");	//Obstarej si zbroj banditů.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_06");	//Budeš mít šanci dostat se blíž bez toho, aby na tebe zaútočili.
	Log_CreateTopic(TOPIC_Addon_BDTRuestung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung,LOG_Running);
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Bandité útočí na všechno co nevypadá jako oni. Musím si najít bandití zbroj, abych se mohl dostat blíž.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Addon_Saturas_PoorRanger(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_PoorRanger_Condition;
	information = DIA_Addon_Saturas_PoorRanger_Info;
	description = "Co za blázna jsi poslal do močálu?";
};


func int DIA_Addon_Saturas_PoorRanger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PoorRanger_15_00");	//Co za blázna jsi poslal do močálu?
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_01");	//Jmenuje se Lance.
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_02");	//Myslím, že se nedostal moc daleko.
	Log_CreateTopic(TOPIC_Addon_Lance,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Lance,"Saturas poslal do močálu někoho jménem Lance. Obává se, že se nedostal moc daleko.");
};


instance DIA_Addon_Saturas_Piraten(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_Piraten_Condition;
	information = DIA_Addon_Saturas_Piraten_Info;
	description = "Kde získam tu potřebnou zbroj banditů?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_Piraten_15_00");	//Kde získam tu potřebnou zbroj banditů?
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_01");	//Na zapadě je tábor pirátů.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_02");	//Pokud vím, mají s bandity nějaké kontakty.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_03");	//Nemyslím, že na tebe zaútoči, když tě spozorují.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_04");	//Možná ti tam pomohou.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Saturas věří, že piráti mi pomohou získat banditskou zbroj.");
};


instance DIA_Addon_Saturas_LanceLeiche(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_LanceLeiche_Condition;
	information = DIA_Addon_Saturas_LanceLeiche_Info;
	description = "Našel jsem Lanceho mrtvolu.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_LanceLeiche_15_00");	//Našel jsem Lanceho mrtvolu.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_01");	//Nechť jeho duše vstoupí do říše Adanosovy.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_02");	//Buď opatrný synu. Nechci přijít o dalšího člena.
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP(XP_Addon_LanceLeiche);
};


instance DIA_Addon_Saturas_LanceRing(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_LanceRing_Condition;
	information = DIA_Addon_Saturas_LanceRing_Info;
	description = "Mám Lanceho akvamarínový prsten.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_LanceRing_15_00");	//Mám Lanceho akvamarínový prsten.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceRing_14_01");	//Bude nejlepší, když mi ho dáš dřív, než se dostane do nesprávných rukou.
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
	description = "O relikviích ...";
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
	AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_00");	//O relikviích ...
	if((DIA_Addon_Saturas_Tokens_OneTime == FALSE) && (C_ScHasMagicStonePlate() || Npc_HasItems(other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_01");	//Myslím, že tady pro tebe něco mám.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_02");	//O těchto kamenných deskách už víme. Ty nám již nepomůžou.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_03");	//Musí tam toho být víc než jen tohle.
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	BroughtToken = 0;
	XP_BroughtTokens = 0;
	if((Npc_HasItems(other,ItMi_Addon_Stone_01) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_02) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_03) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_04) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_05) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_04");	//Máš pro to využití?
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_05");	//Vypadá to dobře. Kde jsi to našel?
		B_LogEntry(TOPIC_Addon_Relicts,"Saturas si odemne vzal tato učení:");
		if(Npc_HasItems(other,ItMi_Addon_Stone_01) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
			Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_06");	//Bandité používali tyhle kamenné desky jako nějaký druh peněz.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_07");	//Desky nesou symbol Quarhodona, velkého bojovníka.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_08");	//Byl to vojevůdce a jeho syn Rhademes zničil celé město.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_09");	//(opovrženě) Tse. Vsadím se, že bandité ani netuší, s čím to obchodují.
			Log_AddEntry(TOPIC_Addon_Relicts,"- Červenou kamennou desku, kterou bandité používají jako peníze. Je na ní zobrazen velký válečník Quarhodon.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_02) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_02,1);
			Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_10");	//Tuhle desku jsem našel v jedné budově na jihu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_11");	//Ach! Deska strážců smrti. Pomocí ní vyvolávali duchy smrti.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_12");	//Souvislost mezi staviteli a jejich původem je velmi blízká.
			Log_AddEntry(TOPIC_Addon_Relicts,"- Fialováou kamennou desku ze sídla Strážců smrti na jihu.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_03) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_03,1);
			Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_13");	//Našel jsem tuhle desku v budově na jihozápadě.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_14");	//Soudě podle toho, co říka tahle deska, byl to Dům kněze ve městě.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_15");	//Velekněz se jmenoval KHARDIMON. Zatím toho o něm moc nevíme.
			Log_AddEntry(TOPIC_Addon_Relicts,"- Modrou kamenou desku z obydlí velekněze na jihozápadě.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_04) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_04,1);
			Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_15");	//Tahle věc ležela v budově blízko močálu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_16");	//To by mohl být Dům léčitelů.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_17");	//Zatím o nich moc nevíme. Zdá se, že byli první, co odsud zmizeli.
			Log_AddEntry(TOPIC_Addon_Relicts,"- Zelenou kamennou desku z Domu léčitelů v jižní části bažiny.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_05) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_05,1);
			Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_18");	//Tahle část ležela ve velké budově v kaňonu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_19");	//Tohle je z knihovny starého národa.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_20");	//Podle všeho je to deska učenců.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_80");	//Většina rukopisů, které jsme našli se vztahovaly na vůdce 'Domu učenců'
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_81");	//Zvláštní, že na těch zápiscích nenechal své jméno ...
			Log_AddEntry(TOPIC_Addon_Relicts,"- Žlutou kamenou desku z knihovny učenců na severu.");
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
				AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_21");	//Velmi dobře. Obrázek města se pořád vyjasňuje, ale stále toho nevíme dost.
			};
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_22");	//V téhle oblasti musí být ukryto pět kamenných desek.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_23");	//Nájdi je a přines je sem.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_24");	//Příjmi tohle zlato za svou ochotu.
		Kohle = 200 * BroughtToken;
		CreateInvItems(self,ItMi_Gold,Kohle);
		B_GiveInvItems(self,other,ItMi_Gold,Kohle);
		ScBroughtToken = TRUE;
	};
	if(Saturas_BroughtTokenAmount == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_25");	//Teď jsme už posbírali všechna učení, která potřebujeme.
		if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_26");	//Udělal jsi pro nás velkou službu, díky ti.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_27");	//Je to veliký pokrok pro naše studia.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_28");	//Uvidím, jestli se mi něco podaří najít.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_29");	//Dobře. Pospěš si. Čas utíká.
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
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_00");	//Dobře že ses vrátil. Musím ti říct něco nového.
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_15_01");	//Poslouchám.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_02");	//Ztracene město se jmenovalo Jharkendar. Bylo tady pět vládců, kteří řídili svůj lid.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_03");	//Každý s těchto vládců měl své sídlo, ve kterém žil a měl svůj majetek.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_04");	//Myslím si, že by jsi měl hledat ona učení po staré kultuře zrovna v těchto místech.
	MIS_Saturas_LookingForHousesOfRulers = LOG_Running;
	Info_ClearChoices(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint,"Co když už ta učení neexistují?",DIA_Addon_Saturas_StonePlateHint_unter);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint,"Kde přesně bych měl ta učení hledat?",DIA_Addon_Saturas_StonePlateHint_wo);
};

func void DIA_Addon_Saturas_StonePlateHint_wo()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_wo_15_00");	//Kde přesně bych měl ta učení hledat?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_01");	//Riordian tě obeznámí s uspořádáním staveb v Jharkendaru.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_02");	//Poví ti, kde je máš hledat.
	Log_CreateTopic(TOPIC_Addon_HousesOfRulers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers,LOG_Running);
	B_LogEntry(TOPIC_Addon_HousesOfRulers,"Saturas chce, abych se poohlédl po nějakych užitečných záznamech stavitelů. Riordian mi poví, kde je mám hledat.");
};

func void DIA_Addon_Saturas_StonePlateHint_unter()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_unter_15_00");	//Co když už ta učení neexistují?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_01");	//Jestli nenajdeš některý z oněch Domů, tak potom byly zrejmě zničeny spolu s městem.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_02");	//Ale pokud ještě stále existují, budou neocenitelnou pomocí pro naše studium.
};


instance DIA_Addon_Saturas_SCBroughtAllToken(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information = DIA_Addon_Saturas_SCBroughtAllToken_Info;
	description = "Na co potřebuješ těch pět kamenných desek?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_SCBroughtAllToken_15_00");	//Na co potřebuješ těch pět kamenných desek?
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_01");	//Záznamy, které jsi našel v ruinách nejsou kompletní.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_02");	//Ale v zápisech stavitelů se říka o pěti vládcích, kteří řídili město.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_03");	//Každý z těchto vládců měl jednu z desek, které symbolizovali jeho autoritu.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_04");	//Myslím, že tyhle desky jsou klíčem na mé otázky.
};


instance DIA_Addon_Saturas_Flut(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_Flut_Condition;
	information = DIA_Addon_Saturas_Flut_Info;
	description = "Nefarius mi řekl o přílivu.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_Flut_15_00");	//Nefarius mi řekl o přílivu.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_02");	//Ukázalo se, že Adanos sestoupil z nebes, aby potrestal nevěřících a vyhnal je do světa mrtvých.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_03");	//Ve svém svatém hněvu nechal mořem pohltit město a smetl jej pryč.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_04");	//Bažina na východě je ještě stále svědectvím těchto událostí.
	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Saturas_AdanosZorn(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_AdanosZorn_Condition;
	information = DIA_Addon_Saturas_AdanosZorn_Info;
	description = "Co se Adanosovi stalo, že se tak rozhněval?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_AdanosZorn_15_00");	//Co se Adanosovi stalo, že se tak rozhněval?
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_01");	//Chrámem tohoto města byla kdysi velká zářivá budova.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_02");	//Všichni ji obdivovali a modlili se k nášemu bohu Adanosovi.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_03");	//Rhademes, syn vojevůdce Quarhodrona, znesvětil chrám.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_04");	//Jeden po druhém podlehli zlu.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_05");	//Předpokládam, že Adanos jim nemohl odpustit a jeho pomsta postihla celý kraj.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_06");	//Proto je tak důležité, aby jsme Ravena zastavili.
};


instance DIA_Addon_Saturas_RavenInfos(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 9;
	condition = DIA_Addon_Saturas_RavenInfos_Condition;
	information = DIA_Addon_Saturas_RavenInfos_Info;
	permanent = TRUE;
	description = "Ohledně Ravena ...";
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
	AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_00");	//Ohledně Ravena ...
	RavenNeuigkeit = 0;
	if((Thorus.aivar[AIV_TalkedToPlayer] == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE) && (RavenIsInTempel == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_01");	//Byl jsem v táboře banditú. Raven je jejich vůdce.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_02");	//Ale na to, abych se dostal blíž k Ravenovi, se budu muset zbavit několika banditů.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_03");	//Dobře. Hodně štěstí. Ale nezapoměň, že to musíš udělat rychle.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_04");	//Raven nesmí za žádnych okolností dosáhnout svého cíle.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if((SC_KnowsRavensGoldmine == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_05");	//Má svůj zlatý důl, a nutí zajatce hledat zlato.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_06");	//To se mu podobá. Musíš zajatce osvobodit.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_07");	//(povzdych) Jasně. Pracuji na tom.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if((SC_KnowsFortunoInfos == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_08");	//Mezi bandity je jeden chlap, který tvrdí, že zná Ravenův plán.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_09");	//Jmenuje se Fortuno. Myslí si, že Raven se chce dostat do chrámu, aby získal mocný artefakt.
		AI_Output(self,other,"DIA_Addon_Bodo_14_03");	//A? Ví něco víc o tom artefaktu?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_11");	//Řekl mi jen to, že Raven nechal vykopat hrob jednoho z Adanosových kneží.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_12");	//Možná ten hrob obsahuje klíč ke chrámu. Snad bychom se tam měli porozhlédnout.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_13");	//Raven přinutil zajatce, aby hrob vykopali.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_14");	//To je zlé. Musíš si pospíšit a zastavit Ravena.
		Addon_Saturas_Fortuno = TRUE;
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if((RavenIsInTempel == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_15");	//Vtrhl jsem do Ravenova doupěte.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_16");	//A? Co se stalo?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_17");	//Přišel jsem pozdě. Ztratil se v Adanosově chrámu přímo před mýma očima.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_18");	//(rozzuřene) Cože? To je KATASTROFA! Proč jsi ho nenásledoval?!
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
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_19");	//Přišel jsi oznámit nějaké nové zprávy?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_20");	//Zatím ne.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_21");	//Dám ti radu. Nepodceňuj Ravena, rozumíš?
	};
};


instance DIA_Addon_Saturas_TuerZu(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_TuerZu_Condition;
	information = DIA_Addon_Saturas_TuerZu_Info;
	description = "Nemohu Ravena sledovat. Uzavřel bránu zevnitř.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_00");	//Nemohu Ravena sledovat. Uzavřel bránu zevnitř.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_02");	//(rozrušeně) Musím přemýšlet ...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_03");	//Otázkou je, jak se Raven dostal dovnitř ...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_04");	//Co udělal předtím, než prošel skrz bránu?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_05");	//Vyslovil na bránu zaklínadlo.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_06");	//A před tím?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_07");	//Otevřel hrob.
	if(Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_09");	//Už jsem ti to jednou říkal.
		AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_10");	//Správně!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_08");	//Už vím, musel tam vykonat nějaký ritual.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_11");	//Rituál ...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_12");	//Ano! To je ono!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_13");	//Obávám se, že Raven získal sílu Strážců smrti.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_14");	//A teď získá vědomosti ze svatyně!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_15");	//Musíš jít za Myxirem a říct mu to!
	Log_CreateTopic(TOPIC_Addon_Quarhodron,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron,LOG_Running);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Raven ovládl Strážce smrti. Taky získal od ducha informace o Adanosově chrámu. Měl bych to oznámit Myxirovi.");
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
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_01");	//A co říkal?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_02");	//Pomůže mi, jen když mu odpovím na jeho otázky.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_03");	//V čem je problém?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_04");	//Nevím správné odpovědi.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_05");	//Hmm ... víme, že učenci z tohoto města postavili na severu knihovnu.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_06");	//Byli velice usilovní a snažili se zapisovat všechny své dějiny.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_07");	//Možná nalezneš odpovědi na Quarhodronovy otázky pravě tam.
	B_LogEntry(TOPIC_Addon_Quarhodron,"Saturas předpokládá, že bych mohl najít odpovědi na Quarhodronovy otázky v knihovně učenců. Ta je daleko na severu.");
};


instance DIA_Addon_Saturas_TalkedToGhost(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_TalkedToGhost_Condition;
	information = DIA_Addon_Saturas_TalkedToGhost_Info;
	description = "Problém se vstupem do chrámu jsem vyřešil.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_00");	//Problém se vstupem do chrámu jsem vyřešil.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_01");	//Duch promluvil?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_02");	//Ano, promluvil.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_03");	//Víš jak se dostat do chrámu?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_04");	//Ano. A navíc mi prozradil, co se skrývá uvnitř.
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_05");	//Říkal něco o mocném meči a o komnatách Adanose.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_06");	//(zoufale) Ach Adanosi. Jsme ale hlupáci. Jakto že jsme nic netušili?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_07");	//(šokovaně) Podle tvých slov ...
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_08");	//Ten meč může být jedině 'Beliarův dráp'.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_09");	//Musíme překonat komnaty tak rychle, jak to jen jde a získat tu zbraň.
	Info_ClearChoices(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost,"Co je to 'Beliarův dráp'?",DIA_Addon_Saturas_TalkedToGhost_wasistdas);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost,"Co jsou Adanosovy komnaty?",DIA_Addon_Saturas_TalkedToGhost_kammern);
};

func void DIA_Addon_Saturas_TalkedToGhost_wasistdas()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00");	//Co je to 'Beliarův dráp'?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01");	//Je to převtělené zlo. Sestrojil ho sám Beliar.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02");	//Každý kdo ho používá, má hroznou zbraň ničení.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03");	//Čím silnejší je nositel, tím mocnější je i 'dráp'.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04");	//Jen ten, kdo má silného ducha a pevnou vůli, může odolat kletbě.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05");	//Teď je mi už jasné, proč stavitelé zablokovali tohle údolí.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06");	//Přinesli tuto ďábelskou zbraň do svého města a oddali se jejímu kouzlu.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07");	//Ti arogantní blázni zabili jeden druhého kvůli nenasytnosti.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08");	//Krutost neskončila, Adanosův hněv se stáhnul okolo této krajiny a vše se potopilo do hlubin moře.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09");	//Vskutku. Stavitelé portálu velmi dobře ukryli tyto věci před zbytkem světa.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10");	//Jak tragický konec pro tak úžasnou kulturu.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11");	//Pochopil jsi naléhavost naší mise?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12");	//Raven je silný bojovník a je zaslepen touhou po moci.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13");	//V jeho rukou se 'dráp' stává nástrojem zkázy.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14");	//Nesmí získat tu zbraň, jinak jsme všichni odsouzeni k záhubě.
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	B_LogEntry(TOPIC_Addon_Klaue,"V Adanosově chrámu je silná zbraň. Jmenuje se 'Beliarův dráp'. Raven se ji nesmí zmocnit.");
};

func void DIA_Addon_Saturas_TalkedToGhost_kammern()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_kammern_15_00");	//Co jsou Adanosovy komnaty?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_01");	//Zjistili jsme, že brána není jediná překážka na cestě do svatyně.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_02");	//V chrámu jsou tři komnaty, jenž mají zastavit vetřelce.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_03");	//Barevné kamenné desky stavitelů jsou klíčem.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_04");	//Jen když máš všechny desky a vyřešíš jejich hádanku, smíš vstoupit dovnitř.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_05");	//Nevím, jestli Raven rozluštil tajemství chrámu, ale pokud ano, tak máme velký problém.
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
	description = "Co přesně mám  v chrámu s učeními udělat?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_RelictsBack_15_00");	//Co přesně mám  v chrámu s učeními udělat?
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_03");	//To zatím nevíme. Ale doufame, že to zjistíš, hned jak vstoupíš dovnitř.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_05");	//Je mi líto, že ti nemohu říct víc. Teď už je všechno jenom na tobě.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_06");	//Vem si ta učení a okamžitě běž do chrámu.
	CreateInvItems(hero,ItMi_Addon_Stone_01,1);
	CreateInvItems(hero,ItMi_Addon_Stone_02,1);
	CreateInvItems(hero,ItMi_Addon_Stone_03,1);
	CreateInvItems(hero,ItMi_Addon_Stone_04,1);
	CreateInvItems(hero,ItMi_Addon_Stone_05,1);
	AI_PrintScreen(PRINT_ItemsErhalten,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	B_LogEntry(TOPIC_Addon_Kammern,"Saturas mě posíla do Adonosova chrámu s pěti relikviemi po stavitelích. Musím se dostat dovnitř a zastavit Ravena.");
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_07");	//Adanosi slituj se nad ním a ochraň nás všechny.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_08");	//Možná ještě není pozdě.
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
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_00");	//Zemětřesení se zastavilo a ty jsi ještě stále naživu.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_01");	//Splnil jsi svůj úkol?
	AI_Output(other,self,"DIA_Addon_Saturas_RavensDead_15_02");	//Ano. Raven je mrtev.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_03");	//Potom je už po všem. Díky Adanosovi.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_04");	//Vedl sis dobře synu. Jsme tvými dlužníky.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_05");	//Zbav se této zlé a mocné zbaně a přines rovnováhu zpět do téhle části světa.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_06");	//Po dobu zemětřesení jsme se radili, co budeme dělat dál. A máme výsledek.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_07");	//Běž a získej 'Beliarův dráp'. Je ti předurčen.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_08");	//V tvých rukách, by mohl být mocným spojencem pro nás všechny.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_09");	//Používej jej moudře, můj synu. Adanos ti bude pomahat.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_11");	//Zůstaneme zde, a ujistíme se, že chrám bude znovu zářit tak jako kdysi.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_12");	//Jen Myxir půjde do Khorinisu a oznámí Vatrasovi.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_13");	//Vatras byl velmi dlouho v tom městě sám.
	Log_CreateTopic(TOPIC_Addon_VatrasAbloesung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung,LOG_Running);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung,"Myxir šel do města vystřídat Vatrase.");
	B_GivePlayerXP(XP_Addon_Saturas_RavensDead);
};


instance DIA_Addon_Saturas_FreedMissingPeople(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information = DIA_Addon_Saturas_FreedMissingPeople_Info;
	description = "Osvobodil jsem vězně.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_FreedMissingPeople_15_00");	//Osvobodil jsem vězně.
	AI_Output(self,other,"DIA_Addon_Saturas_FreedMissingPeople_14_01");	//Velmi dobře. Teď se mohou vrátit zpět domú.
	B_GivePlayerXP(XP_Addon_Saturas_FreedMissingPeople);
};


instance DIA_Addon_Saturas_BeliarsWeapon(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information = DIA_Addon_Saturas_BeliarsWeapon_Info;
	description = "Našel jsem 'Beliarův dráp'.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_00");	//Našel jsem 'Beliarův dráp'.
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) && (SC_FailedToEquipBeliarsWeapon == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_01");	//Ale nemohu ho použít.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_02");	//Beliarův dráp je velice zvláštní zbraň.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_03");	//Má vlastní vůli i ducha.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_04");	//Ty, majitel této mocné zbraně, jsi její pán.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_05");	//Ta zbraň je časťí tebe a přizpůsobuje se tvým schopnostem.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_06");	//Ale nemůžeš ji donutit, aby dělala, co si zamaneš.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_07");	//Jenom sám Beliar ji může donutit, aby tě poslouchala.
	Info_ClearChoices(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon,"Proč by mi měl Beliar pomoci?",DIA_Addon_Saturas_BeliarsWeapon_besser);
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon,"Co můžu dělat s touhle zbraní?",DIA_Addon_Saturas_BeliarsWeapon_wastun);
};

func void DIA_Addon_Saturas_BeliarsWeapon_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00");	//Co můžu dělat s touhle zbraní?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01");	//To záleží na tobě. Ovládl jsi tu zbraň a teď jsi její pán.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02");	//Mohu ti dát jenom radu, co s ní můžeš udělat.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03");	//Buď mi ji odevzdáš, a já zaručím, že už nikdy nezpůsobí žádnou škodu ...
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04");	//... nebo využiješ její moc a použiješ ji k boji.
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon,"Nemůžeš si tu zbraň nechat?",DIA_Addon_Saturas_BeliarsWeapon_geben);
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_geben_15_00");	//Nemůžeš si tu zbraň nechat?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_03");	//Pokud mi ji dáš, zničím ji, takže už ji nikdo nebude moci zneužít.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_04");	//Takže si promysli, co chceš.
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	B_LogEntry(TOPIC_Addon_Klaue,"Můžu 'Beliarův dráp' odevzdat Saturasovi anebo si ho nechat.");
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_besser_15_00");	//Proč by mi měl Beliar pomoci?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_01");	//Jenom pobožný člověk ho může vyprovokovat.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_02");	//Buď opatrný. Beliar je nejhorší.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_03");	//Pokud ho rozzuříš, brzo to pocítíš.
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Klaue,"Abych mohl ovládat 'Beliarův dráp', musím se pomodlit k Beliarovi.");
	B_Say(other,self,"$VERSTEHE");
};


instance DIA_Addon_Saturas_PermENDE_ADDON(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information = DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent = TRUE;
	description = "Co teď budete dělat?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_PermENDE_ADDON_15_00");	//Co teď budete dělat?
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_01");	//Zůstaneme tady a zajistíme, aby chrám opět odhalil svou krásu a velikost.
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_02");	//Přílíš dlouho tyto zdi chátrají.
	if(DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_03");	//Díky ti synu ...
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_04");	//Velmi jsem se v tobě mýlil. Jsi ochránce rovnováhy. O tom není pochyb.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_05");	//Bez tvé pomoci a statečnosti by ostrov Khorinis zanikl. Děkujeme ti a budeme oslavovat tvou čest.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_06");	//Soustřeď se na své další úlohy, které leží před tebou a udržuj tento svět v rovnováze a míru.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_07");	//Jdi a příjmi svůj osud ochránce. Budeme se za tebe modlit.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};


instance DIA_Addon_Saturas_BeliarWeapGeben(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information = DIA_Addon_Saturas_BeliarWeapGeben_Info;
	description = "Vem si 'Beliarův dráp' a znič ho.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGeben_15_00");	//Vem si 'Beliarův dráp' a znič ho.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_01");	//Jak chceš, synu. Dej mi ho.
	B_ClearBeliarsWeapon();
	AI_PrintScreen(PRINT_ItemGegeben,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_02");	//Už nikdy nikomu neublíží. Zahodím ho do hlubin moře.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_03");	//Adanos na to dohlédne.
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
	description = "Můžeš mě naučit kruhy magie?";
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
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_00");	//Můžeš mě naučit kruhy magie?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_01");	//Jsi mág Ohně. Co by řekl Pyrokar?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_02");	//To nemusí nikdo vědět.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_03");	//(povzdych) Vidím, že to opravdu myslíš vážně, jsem opravdu překvapen tvojí žádostí.
	if(RavenIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_04");	//Pokud budu mít dojem, že svoje vědomosti používáš k ubližování nevinným, tak se mnou víc nepočítej.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_05");	//Doufám, že mě nezklameš.
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
	description = "Chci se naučit další kruh magie.";
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
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CIRCLE_15_00");	//Chci se naučit další kruh magie.
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		if(B_TeachMagicCircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_01");	//Ano, jsi pripraven naučit se o tom něco víc.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_02");	//Vstoupils do druhého kruhu magie. Adanos ti dává moudrost, abys použil svou novou moc chytře.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		if(B_TeachMagicCircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_03");	//Ano, nastal správný čas. Vstup do třetího kruhu magie.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_04");	//Tvé vědomosti ti dovolují používat nová kouzla. Používej je opatrně.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		if(B_TeachMagicCircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_05");	//Už je načase. Jsi připraven, abys vstoupil do čtvrtého kruhu magie.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_06");	//Tvá slova a činy jsou teď velmi mocná. Vybírej si svá nová kouzla opatrně a s rozumem.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		if(B_TeachMagicCircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_07");	//Dostal jsi oprávnění vstoupit do pátého kruhu magie.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_08");	//Kouzla, která teď dostaneš, jsou velice ničivá.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_09");	//Uvědom si svou moc a nepodléhej zlu.
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_10");	//To už teď není má úloha.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_11");	//Na to, aby ses naučil šestý a zároveň poslední kruh magie, bys měl navštívit klašter mágů Ohně.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_12");	//Je ještě stále přílíš brzy. Vrať se později.
	};
};

