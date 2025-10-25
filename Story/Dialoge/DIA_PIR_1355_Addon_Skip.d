
instance DIA_Addon_Skip_EXIT(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 999;
	condition = DIA_Addon_Skip_EXIT_Condition;
	information = DIA_Addon_Skip_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_PICKPOCKET(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 900;
	condition = DIA_Addon_Skip_PICKPOCKET_Condition;
	information = DIA_Addon_Skip_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Skip_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void DIA_Addon_Skip_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Skip_PICKPOCKET,Dialog_Back,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Skip_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
};

func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
};


instance DIA_Addon_Skip_Hello(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Hello_Condition;
	information = DIA_Addon_Skip_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Skip_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerTalkedToSkipNW == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_00");	//No kdo to zase kříží cestu se starým Skipem?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_01");	//(přehnaně) Já tě znám!
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_02");	//Zátoka poblíž města, pamatuješ?
	AI_Output(other,self,"DIA_Addon_Skip_Hello_15_03");	//Skip! Správně?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_04");	//(hrdě) Můžu říci, že jsem ti to natrvalo vtiskl.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_05");	//Ale mezitím jsem tvoji tvář musel vidět někde JINDE ...
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_06");	//Ah! Jasně!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_07");	//Tak dobrá. Špatně nakreslené, ale jsi to TY.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_08");	//Neboj. Mé plakáty vypadají stejně hloupě.
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Addon_SkipADW_BaltramPaket(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 2;
	condition = DIA_Addon_SkipADW_BaltramPaket_Condition;
	information = DIA_Addon_SkipADW_BaltramPaket_Info;
	description = "Mám pro tebe balík od Baltrama.";
};


func int DIA_Addon_SkipADW_BaltramPaket_Condition()
{
	if(Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_SkipADW_BaltramPaket_Info()
{
	AI_Output(other,self,"DIA_Addon_SkipADW_BaltramPaket_15_00");	//Mám pro tebe balík od Baltrama.
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_01");	//(šklebí se) Musí být velmi chtivý po našem rumu, nebo by neměl posílat věci TOUHLE CESTOU.
	B_GiveInvItems(other,self,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_02");	//Tady jsou pro něj 2 láhve rumu. Třetí jsem vypil, když jsem na něj čekal.
	B_GiveInvItems(self,other,ItFo_Addon_Rum,2);
	B_GivePlayerXP(XP_Addon_Skip_BaltramPaket);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram);
	Skip_Rum4Baltram = TRUE;
};


instance DIA_Addon_Skip_Job(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 3;
	condition = DIA_Addon_Skip_Job_Condition;
	information = DIA_Addon_Skip_Job_Info;
	description = "Co tady děláš?";
};


func int DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_Job_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Job_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Addon_Skip_Job_08_01");	//Zrovna jsem se vrátil z Khorinisu a teď čekám, až se Greg vrátí.
};


instance DIA_Addon_Skip_ADW_GregGetroffen(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 4;
	condition = DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information = DIA_Addon_Skip_ADW_GregGetroffen_Info;
	description = "Viděl jsem Grega v Khorinisu.";
};


func int DIA_Addon_Skip_ADW_GregGetroffen_Condition()
{
	if((PlayerTalkedToGregNW == TRUE) && (GregIsBack == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_ADW_GregGetroffen_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ADW_GregGetroffen_15_00");	//Viděl jsem Grega v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_01");	//Opravdu? Zatraceně! Něco musí být špatně.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_02");	//Měl by být zpět s naší lodí.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_03");	//(zamyšleně) Bude nejlepší, když se vrátím do Khorinisu a počkám tam na něho ...
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_04");	//(povzdech) Ale určitě ne dnes. Zrovna jsem přijel.
	B_GivePlayerXP(XP_Ambient);
};


var int Skip_Transport_Variation;

instance DIA_Addon_Skip_Transport(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 99;
	condition = DIA_Addon_Skip_Transport_Condition;
	information = DIA_Addon_Skip_Transport_Info;
	permanent = TRUE;
	description = "Můžeš mě vzít zpět do Khorinisu?";
};


func int DIA_Addon_Skip_Transport_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Job) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Transport_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Transport_15_00");	//Můžeš mě vzít zpět do Khorinisu?
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_01");	//Ne. Ještě nejdu. Nejdřív si dám pořádný hlt grogu.
	}
	else if(Skip_Transport_Variation == 0)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_02");	//Zbláznil jsi se? Ztratili jsme naši loď, chlape!
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_03");	//Nebudu používat naši poslední loď na plavbu pro potěšení, jenom proto, že ty jsi moc líný dostat tvůj zadek do Khorinisu SÁM!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_04");	//Kolikrát? NE!
	};
};


instance DIA_Addon_Skip_Bandits(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_Bandits_Condition;
	information = DIA_Addon_Skip_Bandits_Info;
	description = "Co mi můžeš říct o banditech?";
};


func int DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Bandits_15_00");	//Co mi můžeš říct o banditech?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_01");	//Bandité? ÚTOČÍ na nás!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_02");	//Proč by jsme jinak stavili palisády?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_03");	//Vlastně jsme ty šmejdy sem přivedli my.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_04");	//Také jsme s nimi obchodovali. Chlapče, měli moc zlata, měli ho i za ušima!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_05");	//Byli připraveni zaplatit barel rumu za jakkoukoli cenu.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_06");	//Ale tyhle dny skončili. Teď je válka!
	AI_Output(other,self,"DIA_Addon_Erol_Bandits_15_06");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_07");	//Ti teplouši nezaplatili poslední zásilku.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_08");	//Tak jsem se tam byl podívat, co se děje s naším zlatem.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_09");	//Ale když jsem vstoupil do močálu, ti bastardi na mě začali útočit!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_10");	//To ale není vše. Odstranili Agnuse a Hanka! Dva z našich nejlepších chlapců!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_11");	//Nechoď do močálu, to ti řeknu!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_12");	//Zaútočí na vše, co není tak otrhané jako oni sami.
};


instance DIA_Addon_Skip_ArmorPrice(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_ArmorPrice_Condition;
	information = DIA_Addon_Skip_ArmorPrice_Info;
	description = "Potřebuji zbroj banditů.";
};


func int DIA_Addon_Skip_ArmorPrice_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_ArmorPrice_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_00");	//Potřebuji zbroj banditů.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_01");	//Ty tam chceš jít? Jsi úplně ztratil rozum.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_02");	//Jestli tihle chlapi zjistí, že nejsi jeden z nich, nakrmí s tebou bažinné žraloky!
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_02");	//Nějaký nápad, kde mohu najít takové brnění?
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_03");	//(povzdech) Ty to nevzdáš, že? Dobrá. Měli jsme jedno.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_04");	//Greg ho možná má ve své chatrči.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_05");	//Když se vrátí, možná ti ho prodá ...
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Skip předpokládá, že zbroj bude v Gregově chatrči.");
};


instance DIA_Addon_Skip_GregsHut(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_GregsHut_Condition;
	information = DIA_Addon_Skip_GregsHut_Info;
	permanent = FALSE;
	description = "Nějaký nápad, jak se můžu dostat do chatrče?";
};


func int DIA_Addon_Skip_GregsHut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_ArmorPrice) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_GregsHut_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GregsHut_15_00");	//Nějaký nápad, jak se můžu dostat do chatrče?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_01");	//Hahaha! Spolehlivý!
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_02");	//Chystáš se šlohnout něco z Gregovy sbírky?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_03");	//Když odešel, dal Francisovi klíče a příkaz, že NIKDO nesmí vstoupit do chatrče.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Francis má klíč od Gregovy chatrče. Má příkaz nikoho nepouštět dovnitř.");
	Knows_GregsHut = TRUE;
};


instance DIA_Addon_Skip_Francis(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_Francis_Condition;
	information = DIA_Addon_Skip_Francis_Info;
	permanent = FALSE;
	description = "Co mi můžeš říct o Francisovi?";
};


func int DIA_Addon_Skip_Francis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Francis_15_00");	//Co mi můžeš říct o Francisovi?
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_01");	//Francis je náš pokladník.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_02");	//Kapitán mu věří. Proto mu svěřil velení.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_03");	//I když ho nikdo nebere vážně.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_04");	//Jestli se chceš dovědět víc, promluv se Samuelem.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_05");	//Jeho destilátor je v malé jeskyni na severu.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_06");	//V tomhle táboře není nikdo, o kom by Samuel NĚCO zajímavýho nevěděl.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Měl bych si promluvit se Samuelem. Možná mě může dát tip.");
};


instance DIA_Addon_Skip_Raven(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_Raven_Condition;
	information = DIA_Addon_Skip_Raven_Info;
	permanent = FALSE;
	description = "Setkal jsi se někdy s Ravenem?";
};


func int DIA_Addon_Skip_Raven_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Raven_15_00");	//Setkal jsi se někdy s Ravenem?
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_01");	//Jasně. Byl jsem u přední brány s Henrym. Mohli jsme vidět Ravena, jak posílal některé ze svých lidí do věže na východ odsud.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_02");	//Opravdu blízko k našemu táboru. (směje se) Hádám, že jsou tam proto, aby nás špehovali.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_03");	//Také jsem viděl, jak ošetřuje lidi, kteří nedělají, co jim přikáže.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_04");	//Každý kdo neposlechne na slovo, je bez rozmýšlení zabit.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_05");	//Vyvaruj se Ravena, to ti povím.
};


instance DIA_Addon_Skip_AngusHank(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHank_Condition;
	information = DIA_Addon_Skip_AngusHank_Info;
	description = "Řekni mi více o Agnusovi a Hankovi.";
};


func int DIA_Addon_Skip_AngusHank_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AngusHank_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHank_15_00");	//Řekni mi více o Agnusovi a Hankovi.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_01");	//Angus a Hank se byli pravděpodobně setkat s pár bandity za táborem.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_02");	//Měli s sebou všechno možné. Vše, o co si ti bastardi řekli.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_03");	//Surovou ocel a paklíče.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_04");	//Ale nikdy se nevrátili. Ty banditské svině je musely odpravit!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_05");	//Morgand a Bill se po nich byli podívat - bez výsledku.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_06");	//Bill byl z toho pěkně špatný. Kamarádil se s nimi.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_07");	//Je stále mladý a tenhle incident ho hodně poznamenal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_08");	//Ostatní to brali v klidu. Ztráta věci je snadná. (povzdech) Ale grog co měli s sebou ...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_09");	//(kysele) Mluvíme nejméně o 20 láhvích!
	MIS_ADDON_SkipsGrog = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_SkipsGrog,LOG_Running);
	B_LogEntry(TOPIC_Addon_SkipsGrog,"Jak se zdá, tak Skip ztratil 20 láhví grogu. Chce je zpátky.");
	Log_AddEntry(TOPIC_Addon_SkipsGrog,"Angus a Hank byli vysláni za pár bandity na obchod. Potom už nebyli znovu spatřeni.");
	Log_AddEntry(TOPIC_Addon_SkipsGrog,"Morganovo a Billovo pátrání nepřineslo žádné výsledky ...");
};


instance DIA_Addon_Skip_AngusHankDead(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHankDead_Condition;
	information = DIA_Addon_Skip_AngusHankDead_Info;
	permanent = FALSE;
	description = "O Angusovi a Hankovi ...";
};


func int DIA_Addon_Skip_AngusHankDead_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) && !Npc_HasItems(Angus,ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AngusHankDead_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_00");	//O Angusovi a Hankovi ...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_01");	//Co?
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_01");	//Našel jsem je.
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_03");	//Jsou mrtví.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_03");	//(pro sebe) Mrtvý jako dveřní hřebík - ubozí chlapi!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_04");	//Dobrá, nic víc jsem nečekal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_05");	//Měl bys dát Billovi vědět, pokud jsi to už neudělal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_06");	//Ale řekni mu to jemně - je stále mladý.
};


instance DIA_Addon_Skip_AngusHankMurder(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHankMurder_Condition;
	information = DIA_Addon_Skip_AngusHankMurder_Info;
	permanent = FALSE;
	description = "Znám vraha Agnuse a Hanka.";
};


func int DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_AngusHankDead) && (SC_Knows_JuanMurderedAngus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AngusHankMurder_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_JuanMurder_15_00");	//Znám vraha Agnuse a Hanka.
	if(MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_01");	//Dobře pro tebe. Jsou oba mrtví. Kdo se o něj postará?
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_02");	//Pomsta nikdy neudělá piráta bohatého.
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_03");	//Nejdůležitější je, že mám svůj grog zpátky.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_04");	//Vrah mě nezajímá! Co můj grog?!
	};
};


instance DIA_Addon_Skip_Grog(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 9;
	condition = DIA_Addon_Skip_Grog_Condition;
	information = DIA_Addon_Skip_Grog_Info;
	permanent = TRUE;
	description = "O grogu ...";
};


func int DIA_Addon_Skip_Grog_Condition()
{
	if(MIS_ADDON_SkipsGrog == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Grog_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_15_00");	//O grogu ...
	if(Npc_HasItems(other,ItFo_Addon_Grog) >= 20)
	{
		Info_ClearChoices(DIA_Addon_Skip_Grog);
		Info_AddChoice(DIA_Addon_Skip_Grog,Dialog_Back,DIA_Addon_Skip_Grog_back);
		Info_AddChoice(DIA_Addon_Skip_Grog,"Tady je tvých 20 láhví.",DIA_Addon_Skip_Grog_geben);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Skip_Grog_15_01");	//Postrádáš 20 láhví, že?
		AI_Output(self,other,"DIA_Addon_Skip_Grog_08_02");	//Ano, zatraceně. To byly naše úplné zásoby.
	};
};

func void DIA_Addon_Skip_Grog_back()
{
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_geben()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_00");	//Tady je tvých 20 láhví.
	B_GiveInvItems(other,self,ItFo_Addon_Grog,20);
	B_LogEntry(TOPIC_Addon_SkipsGrog,"Skip má svých 20 láhví grogu a je spokojený.");
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_SkipsGrog);
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_01");	//Co to? Za nic?
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_02");	//Noo ...
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_03");	//Dobrá. Zaplatím ti.
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_04");	//Máš něco více zajímavějšího, než je zlato?
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_05");	//Hmm. Nech mě se kouknout. Mám tu tady ten prsten.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_06");	//Vyhrál jsem ho před mnoha roky v jednom dusném přístavním baru při hře na šanci.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_07");	//Staroch řekl, že je magický. Což se zdá.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_08");	//Chceš ho, nebo chceš zlato?
	Info_ClearChoices(DIA_Addon_Skip_Grog);
	Info_AddChoice(DIA_Addon_Skip_Grog,"Dej mi peníze.",DIA_Addon_Skip_Grog_gold);
	Info_AddChoice(DIA_Addon_Skip_Grog,"Dej mi prsten.",DIA_Addon_Skip_Grog_ring);
};

func void DIA_Addon_Skip_Grog_ring()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_ring_15_00");	//Dej mi prsten.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_ring_08_01");	//Tady máš.
	B_GiveInvItems(self,other,ItRi_Prot_Edge_02,1);
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_gold()
{
	var int GrogKohle;
	AI_Output(other,self,"DIA_Addon_Skip_Grog_gold_15_00");	//Dej mi peníze.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_gold_08_01");	//Jasně.
	GrogKohle = Value_Grog * 20;
	B_GiveInvItems(self,other,ItMi_Gold,GrogKohle);
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};


instance DIA_Addon_Skip_News(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 888;
	condition = DIA_Addon_Skip_News_Condition;
	information = DIA_Addon_Skip_News_Info;
	permanent = FALSE;
	description = "Máš něco k prodeji?";
};


func int DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_News_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_News_15_00");	//Máš něco k prodeji?
	AI_Output(self,other,"DIA_Addon_Skip_News_08_01");	//Jestli chceš obchodovat, promluv si s Garettem. Stará se o zásoby.
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};


instance DIA_Addon_Skip_Anheuern(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 11;
	condition = DIA_Addon_Skip_Anheuern_Condition;
	information = DIA_Addon_Skip_Anheuern_Info;
	permanent = FALSE;
	description = "Pojď, pomož mi.";
};


func int DIA_Addon_Skip_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_00");	//Pojď, pomož mi.
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_01");	//Co se děje?
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_01");	//Kaňon čeká.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_02");	//Vidím, že jsi shromáždil pár chlapců. To je dobře!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_03");	//Radši s sebou vezmi víc chlapců!
	};
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_04");	//Kaňon je smrtící!
};


instance DIA_Addon_Skip_ComeOn(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 12;
	condition = DIA_Addon_Skip_ComeOn_Condition;
	information = DIA_Addon_Skip_ComeOn_Info;
	permanent = TRUE;
	description = "Pojď se mnou.";
};


func int DIA_Addon_Skip_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ComeOn_15_00");	//Pojď se mnou.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_02");	//Počkej. Nejdřív se vraťme do kaňonu ...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_01");	//Jasně!
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,other);
		};
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_Skip_GoHome(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 13;
	condition = DIA_Addon_Skip_GoHome_Condition;
	information = DIA_Addon_Skip_GoHome_Info;
	permanent = TRUE;
	description = "Už tě více nepotřebuji.";
};


func int DIA_Addon_Skip_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GoHome_15_00");	//Už tě více nepotřebuji.
	AI_Output(self,other,"DIA_Addon_Skip_GoHome_08_01");	//Pak dobrá. Jsem v táboře.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Skip_TooFar(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 14;
	condition = DIA_Addon_Skip_TooFar_Condition;
	information = DIA_Addon_Skip_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Skip_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_01");	//To je dost daleko!
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_02");	//Jestli opravdu chceš jít dál, udělej to bez nás!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_03");	//Jestli opravdu chceš jít dál, udělej to beze mě.
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_Treffpunkt(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Treffpunkt_Condition;
	information = DIA_Addon_Skip_Treffpunkt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Skip_Treffpunkt_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 800) && (C_AllCanyonRazorDead() == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Treffpunkt_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_00");	//Pokud se rozdělíme, setkáme se u tohohle jezírka.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_02");	//Pojďme!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_Orks(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Orks_Condition;
	information = DIA_Addon_Skip_Orks_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Skip_Orks_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Orks_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_01");	//Skřeti! Nenávidím tyhle bestie!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_AllRazorsDead(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_AllRazorsDead_Condition;
	information = DIA_Addon_Skip_AllRazorsDead_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_AllCanyonRazorDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AllRazorsDead_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_03");	//Vypadá to, že jsme dostali všechny břitvy.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_04");	//Můžeme se tu ještě trochu potulovat, jestli chceš.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_05");	//Tak dlouho dokud zůstaneme v kaňonu.
	AI_StopProcessInfos(self);
};

