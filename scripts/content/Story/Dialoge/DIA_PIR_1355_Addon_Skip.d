
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
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_00");	//No kdo to zase k???? cestu se star?m Skipem?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_01");	//(p?ehnan?) J? t? zn?m!
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_02");	//Z?toka pobl?? m?sta, pamatuje??
	AI_Output(other,self,"DIA_Addon_Skip_Hello_15_03");	//Skip! Spr?vn??
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_04");	//(hrd?) M??u ??ci, ?e jsem ti to natrvalo vtiskl.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_05");	//Ale mezit?m jsem tvoji tv?? musel vid?t n?kde JINDE ...
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_06");	//Ah! Jasn?!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_07");	//Tak dobr?. ?patn? nakreslen?, ale jsi to TY.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_08");	//Neboj. M? plak?ty vypadaj? stejn? hloup?.
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Addon_SkipADW_BaltramPaket(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 2;
	condition = DIA_Addon_SkipADW_BaltramPaket_Condition;
	information = DIA_Addon_SkipADW_BaltramPaket_Info;
	description = "M?m pro tebe bal?k od Baltrama.";
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
	AI_Output(other,self,"DIA_Addon_SkipADW_BaltramPaket_15_00");	//M?m pro tebe bal?k od Baltrama.
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_01");	//(?kleb? se) Mus? b?t velmi chtiv? po na?em rumu, nebo by nem?l pos?lat v?ci TOUHLE CESTOU.
	B_GiveInvItems(other,self,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_02");	//Tady jsou pro n?j 2 l?hve rumu. T?et? jsem vypil, kdy? jsem na n?j ?ekal.
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
	description = "Co tady d?l???";
};


func int DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_Job_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Job_15_00");	//Co tady d?l???
	AI_Output(self,other,"DIA_Addon_Skip_Job_08_01");	//Zrovna jsem se vr?til z Khorinisu a te? ?ek?m, a? se Greg vr?t?.
};


instance DIA_Addon_Skip_ADW_GregGetroffen(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 4;
	condition = DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information = DIA_Addon_Skip_ADW_GregGetroffen_Info;
	description = "Vid?l jsem Grega v Khorinisu.";
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
	AI_Output(other,self,"DIA_Addon_Skip_ADW_GregGetroffen_15_00");	//Vid?l jsem Grega v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_01");	//Opravdu? Zatracen?! N?co mus? b?t ?patn?.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_02");	//M?l by b?t zp?t s na?? lod?.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_03");	//(zamy?len?) Bude nejlep??, kdy? se vr?t?m do Khorinisu a po?k?m tam na n?ho ...
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_04");	//(povzdech) Ale ur?it? ne dnes. Zrovna jsem p?ijel.
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
	description = "M??e? m? vz?t zp?t do Khorinisu?";
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
	AI_Output(other,self,"DIA_Addon_Skip_Transport_15_00");	//M??e? m? vz?t zp?t do Khorinisu?
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_01");	//Ne. Je?t? nejdu. Nejd??v si d?m po??dn? hlt grogu.
	}
	else if(Skip_Transport_Variation == 0)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_02");	//Zbl?znil jsi se? Ztratili jsme na?i lo?, chlape!
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_03");	//Nebudu pou??vat na?i posledn? lo? na plavbu pro pot??en?, jenom proto, ?e ty jsi moc l?n? dostat tv?j zadek do Khorinisu S?M!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_04");	//Kolikr?t? NE!
	};
};


instance DIA_Addon_Skip_Bandits(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_Bandits_Condition;
	information = DIA_Addon_Skip_Bandits_Info;
	description = "Co mi m??e? ??ct o banditech?";
};


func int DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Bandits_15_00");	//Co mi m??e? ??ct o banditech?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_01");	//Bandit?? ?TO?? na n?s!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_02");	//Pro? by jsme jinak stavili palis?dy?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_03");	//Vlastn? jsme ty ?mejdy sem p?ivedli my.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_04");	//Tak? jsme s nimi obchodovali. Chlap?e, m?li moc zlata, m?li ho i za u?ima!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_05");	//Byli p?ipraveni zaplatit barel rumu za jakkoukoli cenu.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_06");	//Ale tyhle dny skon?ili. Te? je v?lka!
	AI_Output(other,self,"DIA_Addon_Erol_Bandits_15_06");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_07");	//Ti teplou?i nezaplatili posledn? z?silku.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_08");	//Tak jsem se tam byl pod?vat, co se d?je s na??m zlatem.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_09");	//Ale kdy? jsem vstoupil do mo??lu, ti bastardi na m? za?ali ?to?it!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_10");	//To ale nen? v?e. Odstranili Agnuse a Hanka! Dva z na?ich nejlep??ch chlapc?!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_11");	//Necho? do mo??lu, to ti ?eknu!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_12");	//Za?to?? na v?e, co nen? tak otrhan? jako oni sami.
};


instance DIA_Addon_Skip_ArmorPrice(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_ArmorPrice_Condition;
	information = DIA_Addon_Skip_ArmorPrice_Info;
	description = "Pot?ebuji zbroj bandit?.";
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
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_00");	//Pot?ebuji zbroj bandit?.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_01");	//Ty tam chce? j?t? Jsi ?pln? ztratil rozum.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_02");	//Jestli tihle chlapi zjist?, ?e nejsi jeden z nich, nakrm? s tebou ba?inn? ?raloky!
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_02");	//N?jak? n?pad, kde mohu naj?t takov? brn?n??
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_03");	//(povzdech) Ty to nevzd??, ?e? Dobr?. M?li jsme jedno.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_04");	//Greg ho mo?n? m? ve sv? chatr?i.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_05");	//Kdy? se vr?t?, mo?n? ti ho prod? ...
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Skip p?edpokl?d?, ?e zbroj bude v Gregov? chatr?i.");
};


instance DIA_Addon_Skip_GregsHut(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_GregsHut_Condition;
	information = DIA_Addon_Skip_GregsHut_Info;
	permanent = FALSE;
	description = "N?jak? n?pad, jak se m??u dostat do chatr?e?";
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
	AI_Output(other,self,"DIA_Addon_Skip_GregsHut_15_00");	//N?jak? n?pad, jak se m??u dostat do chatr?e?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_01");	//Hahaha! Spolehliv?!
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_02");	//Chyst?? se ?lohnout n?co z Gregovy sb?rky?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_03");	//Kdy? ode?el, dal Francisovi kl??e a p??kaz, ?e NIKDO nesm? vstoupit do chatr?e.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Francis m? kl?? od Gregovy chatr?e. M? p??kaz nikoho nepou?t?t dovnit?.");
	Knows_GregsHut = TRUE;
};


instance DIA_Addon_Skip_Francis(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_Francis_Condition;
	information = DIA_Addon_Skip_Francis_Info;
	permanent = FALSE;
	description = "Co mi m??e? ??ct o Francisovi?";
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
	AI_Output(other,self,"DIA_Addon_Skip_Francis_15_00");	//Co mi m??e? ??ct o Francisovi?
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_01");	//Francis je n?? pokladn?k.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_02");	//Kapit?n mu v???. Proto mu sv??il velen?.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_03");	//I kdy? ho nikdo nebere v??n?.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_04");	//Jestli se chce? dov?d?t v?c, promluv se Samuelem.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_05");	//Jeho destil?tor je v mal? jeskyni na severu.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_06");	//V tomhle t?bo?e nen? nikdo, o kom by Samuel N?CO zaj?mav?ho nev?d?l.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"M?l bych si promluvit se Samuelem. Mo?n? m? m??e d?t tip.");
};


instance DIA_Addon_Skip_Raven(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_Raven_Condition;
	information = DIA_Addon_Skip_Raven_Info;
	permanent = FALSE;
	description = "Setkal jsi se n?kdy s Ravenem?";
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
	AI_Output(other,self,"DIA_Addon_Skip_Raven_15_00");	//Setkal jsi se n?kdy s Ravenem?
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_01");	//Jasn?. Byl jsem u p?edn? br?ny s Henrym. Mohli jsme vid?t Ravena, jak pos?lal n?kter? ze sv?ch lid? do v??e na v?chod odsud.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_02");	//Opravdu bl?zko k na?emu t?boru. (sm?je se) H?d?m, ?e jsou tam proto, aby n?s ?pehovali.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_03");	//Tak? jsem vid?l, jak o?et?uje lidi, kte?? ned?laj?, co jim p?ik??e.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_04");	//Ka?d? kdo neposlechne na slovo, je bez rozm??len? zabit.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_05");	//Vyvaruj se Ravena, to ti pov?m.
};


instance DIA_Addon_Skip_AngusHank(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHank_Condition;
	information = DIA_Addon_Skip_AngusHank_Info;
	description = "?ekni mi v?ce o Agnusovi a Hankovi.";
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
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHank_15_00");	//?ekni mi v?ce o Agnusovi a Hankovi.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_01");	//Angus a Hank se byli pravd?podobn? setkat s p?r bandity za t?borem.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_02");	//M?li s sebou v?echno mo?n?. V?e, o co si ti bastardi ?ekli.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_03");	//Surovou ocel a pakl??e.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_04");	//Ale nikdy se nevr?tili. Ty banditsk? svin? je musely odpravit!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_05");	//Morgand a Bill se po nich byli pod?vat - bez v?sledku.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_06");	//Bill byl z toho p?kn? ?patn?. Kamar?dil se s nimi.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_07");	//Je st?le mlad? a tenhle incident ho hodn? poznamenal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_08");	//Ostatn? to brali v klidu. Ztr?ta v?ci je snadn?. (povzdech) Ale grog co m?li s sebou ...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_09");	//(kysele) Mluv?me nejm?n? o 20 l?hv?ch!
	MIS_ADDON_SkipsGrog = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_SkipsGrog,LOG_Running);
	B_LogEntry(TOPIC_Addon_SkipsGrog,"Jak se zd?, tak Skip ztratil 20 l?hv? grogu. Chce je zp?tky.");
	Log_AddEntry(TOPIC_Addon_SkipsGrog,"Angus a Hank byli vysl?ni za p?r bandity na obchod. Potom u? nebyli znovu spat?eni.");
	Log_AddEntry(TOPIC_Addon_SkipsGrog,"Morganovo a Billovo p?tr?n? nep?ineslo ??dn? v?sledky ...");
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
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_01");	//Na?el jsem je.
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_03");	//Jsou mrtv?.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_03");	//(pro sebe) Mrtv? jako dve?n? h?eb?k - uboz? chlapi!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_04");	//Dobr?, nic v?c jsem ne?ekal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_05");	//M?l bys d?t Billovi v?d?t, pokud jsi to u? neud?lal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_06");	//Ale ?ekni mu to jemn? - je st?le mlad?.
};


instance DIA_Addon_Skip_AngusHankMurder(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHankMurder_Condition;
	information = DIA_Addon_Skip_AngusHankMurder_Info;
	permanent = FALSE;
	description = "Zn?m vraha Agnuse a Hanka.";
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
	AI_Output(other,self,"DIA_Addon_Skip_JuanMurder_15_00");	//Zn?m vraha Agnuse a Hanka.
	if(MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_01");	//Dob?e pro tebe. Jsou oba mrtv?. Kdo se o n?j postar??
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_02");	//Pomsta nikdy neud?l? pir?ta bohat?ho.
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_03");	//Nejd?le?it?j?? je, ?e m?m sv?j grog zp?tky.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_04");	//Vrah m? nezaj?m?! Co m?j grog?!
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
		Info_AddChoice(DIA_Addon_Skip_Grog,"Tady je tv?ch 20 l?hv?.",DIA_Addon_Skip_Grog_geben);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Skip_Grog_15_01");	//Postr?d?? 20 l?hv?, ?e?
		AI_Output(self,other,"DIA_Addon_Skip_Grog_08_02");	//Ano, zatracen?. To byly na?e ?pln? z?soby.
	};
};

func void DIA_Addon_Skip_Grog_back()
{
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_geben()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_00");	//Tady je tv?ch 20 l?hv?.
	B_GiveInvItems(other,self,ItFo_Addon_Grog,20);
	B_LogEntry(TOPIC_Addon_SkipsGrog,"Skip m? sv?ch 20 l?hv? grogu a je spokojen?.");
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_SkipsGrog);
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_01");	//Co to? Za nic?
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_02");	//Noo ...
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_03");	//Dobr?. Zaplat?m ti.
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_04");	//M?? n?co v?ce zaj?mav?j??ho, ne? je zlato?
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_05");	//Hmm. Nech m? se kouknout. M?m tu tady ten prsten.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_06");	//Vyhr?l jsem ho p?ed mnoha roky v jednom dusn?m p??stavn?m baru p?i h?e na ?anci.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_07");	//Staroch ?ekl, ?e je magick?. Co? se zd?.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_08");	//Chce? ho, nebo chce? zlato?
	Info_ClearChoices(DIA_Addon_Skip_Grog);
	Info_AddChoice(DIA_Addon_Skip_Grog,"Dej mi pen?ze.",DIA_Addon_Skip_Grog_gold);
	Info_AddChoice(DIA_Addon_Skip_Grog,"Dej mi prsten.",DIA_Addon_Skip_Grog_ring);
};

func void DIA_Addon_Skip_Grog_ring()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_ring_15_00");	//Dej mi prsten.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_ring_08_01");	//Tady m??.
	B_GiveInvItems(self,other,ItRi_Prot_Edge_02,1);
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_gold()
{
	var int GrogKohle;
	AI_Output(other,self,"DIA_Addon_Skip_Grog_gold_15_00");	//Dej mi pen?ze.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_gold_08_01");	//Jasn?.
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
	description = "M?? n?co k prodeji?";
};


func int DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_News_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_News_15_00");	//M?? n?co k prodeji?
	AI_Output(self,other,"DIA_Addon_Skip_News_08_01");	//Jestli chce? obchodovat, promluv si s Garettem. Star? se o z?soby.
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
	description = "Poj?, pomo? mi.";
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
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_00");	//Poj?, pomo? mi.
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_01");	//Co se d?je?
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_01");	//Ka?on ?ek?.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_02");	//Vid?m, ?e jsi shrom??dil p?r chlapc?. To je dob?e!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_03");	//Rad?i s sebou vezmi v?c chlapc?!
	};
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_04");	//Ka?on je smrt?c?!
};


instance DIA_Addon_Skip_ComeOn(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 12;
	condition = DIA_Addon_Skip_ComeOn_Condition;
	information = DIA_Addon_Skip_ComeOn_Info;
	permanent = TRUE;
	description = "Poj? se mnou.";
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
	AI_Output(other,self,"DIA_Addon_Skip_ComeOn_15_00");	//Poj? se mnou.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_02");	//Po?kej. Nejd??v se vra?me do ka?onu ...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_01");	//Jasn?!
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
	description = "U? t? v?ce nepot?ebuji.";
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
	AI_Output(other,self,"DIA_Addon_Skip_GoHome_15_00");	//U? t? v?ce nepot?ebuji.
	AI_Output(self,other,"DIA_Addon_Skip_GoHome_08_01");	//Pak dobr?. Jsem v t?bo?e.
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
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_02");	//Jestli opravdu chce? j?t d?l, ud?lej to bez n?s!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_03");	//Jestli opravdu chce? j?t d?l, ud?lej to beze m?.
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
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_00");	//Pokud se rozd?l?me, setk?me se u tohohle jez?rka.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_02");	//Poj?me!
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
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_01");	//Sk?eti! Nen?vid?m tyhle bestie!
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
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_03");	//Vypad? to, ?e jsme dostali v?echny b?itvy.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_04");	//M??eme se tu je?t? trochu potulovat, jestli chce?.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_05");	//Tak dlouho dokud z?staneme v ka?onu.
	AI_StopProcessInfos(self);
};

