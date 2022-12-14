
instance DIA_Parcival_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_EXIT_Condition;
	information = DIA_Parcival_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Parcival_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_Schurfer(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_Schurfer_Condition;
	information = DIA_Parcival_Schurfer_Info;
	permanent = FALSE;
	description = "Co mi m??e? ??ct o horn?c?ch?";
};


func int DIA_Parcival_Schurfer_Condition()
{
	if(MIS_ScoutMine == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parcival_Schurfer_Info()
{
	AI_Output(other,self,"DIA_Parcival_Schurfer_15_00");	//Co mi m??e? ??ct o horn?c?ch?
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_01");	//Vypravil jsem t?i skupiny.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_02");	//Vedou je paladinov? Marcos, Fajeth a Silvestro.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_03");	//Marcosova skupina vyrazila sm?rem ke star?mu dolu - vedl ji star? kop?? jm?nem Grimes.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_04");	//Dal?? dv? skupiny ?ly spole?n?.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_05");	//Podle Jergana, jednoho z na?ich zv?d?, rozbili t?bor pobl?? velk? v??e.
	B_LogEntry(TOPIC_ScoutMine,"Ka?d? odd?l kop??? vede jeden z paladin? - Marcos, Fajeth a Silvestro.");
	B_LogEntry(TOPIC_ScoutMine,"Marcosova skupina se vydala tam, kde kdysi b?val star? d?l. Jejich vyzv?da?em je Grimes.");
	B_LogEntry(TOPIC_ScoutMine,"Dal?? dv? skupiny se spojily dohromady a usadily se pobl?? velk? v??e.");
};


instance DIA_Parcival_Diego(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 9;
	condition = DIA_Parcival_Diego_Condition;
	information = DIA_Parcival_Diego_Info;
	permanent = FALSE;
	description = "K jak? skupin? se p?ipojil Diego?";
};


func int DIA_Parcival_Diego_Condition()
{
	if((SearchForDiego == LOG_Running) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Diego_Info()
{
	AI_Output(other,self,"DIA_Parcival_Diego_15_00");	//K jak? skupin? se p?ipojil Diego?
	AI_Output(self,other,"DIA_Parcival_Diego_13_01");	//Ten trestanec - Diego? ?el se skupinou paladina Silvestra.
	B_LogEntry(TOPIC_ScoutMine,"Diego se p?ipojil ke skupin?, kterou vede paladin Silvestro.");
};


instance DIA_Parcival_Weg(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 8;
	condition = DIA_Parcival_Weg_Condition;
	information = DIA_Parcival_Weg_Info;
	permanent = FALSE;
	description = "V??, jak se dostat k dol?m?";
};


func int DIA_Parcival_Weg_Condition()
{
	if(MIS_ScoutMine == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parcival_Weg_Info()
{
	AI_Output(other,self,"DIA_Parcival_Weg_15_00");	//V??, jak se dostat k dol?m?
	AI_Output(self,other,"DIA_Parcival_Weg_13_01");	//Do toho ?dol? nevede ??dn? bezpe?n? cesta. Ale zd? se mi rozumn? nej?t p??m?m sm?rem.
	AI_Output(self,other,"DIA_Parcival_Weg_13_02");	//Sna? se vyhnout sk?et?m a les?m - a nech? t? Innos ochra?uje.
	B_LogEntry(TOPIC_ScoutMine,"Bude moud?ej?? nej?t nejkrat?? cestou, to by mohlo b?t nebezpe?n?. Zvl᚝ bych se m?l vyh?bat les?m a sk?et?m.");
};


instance DIA_Parcival_DRAGON(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_DRAGON_Condition;
	information = DIA_Parcival_DRAGON_Info;
	description = "Jak to vypad??";
};


func int DIA_Parcival_DRAGON_Condition()
{
	return TRUE;
};

func void DIA_Parcival_DRAGON_Info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGON_15_00");	//Jak to vypad??
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_01");	//T?bor obkl??ili sk?eti. Doslova se tam zakopali.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_02");	//Ale mnohem v?c znepokojuj?c? jsou ?toky drak?. Zpusto?ili u? cel? vn?j?? opevn?n?.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_03");	//Je?t? jeden dra?? ?tok a budeme m?t t??k? ztr?ty.
};


instance DIA_Parcival_DRAGONS(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_DRAGONS_Condition;
	information = DIA_Parcival_DRAGONS_Info;
	description = "Kolik drak? tu je?";
};


func int DIA_Parcival_DRAGONS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parcival_DRAGON) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Parcival_DRAGONS_Info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGONS_15_00");	//Kolik drak? tu je?
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_01");	//Netu??me, kolik jich je dohromady, ale ur?it? to je v?c ne? jeden.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_02");	//Ale to nen? v?echno. Cel? Hornick? ?dol? je pln? zl?ch stv?r, kter? drak?m slou??.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_03");	//Co si budeme namlouvat - bez posil zven?? jsou na?e ?ance dostat se odsud v jednom kuse miziv?.
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_BRAVE(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 8;
	condition = DIA_Parcival_BRAVE_Condition;
	information = DIA_Parcival_BRAVE_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Parcival_BRAVE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(hero,DIA_Parcival_DRAGONS) && (Kapitel < 3) && (Parcival_BRAVE_LaberCount <= 6))
	{
		return TRUE;
	};
};


var int Parcival_BRAVE_LaberCount;

func void DIA_Parcival_BRAVE_Info()
{
	var int randy;
	if(Parcival_BRAVE_LaberCount < 6)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_00");	//V?ude panuje klid. To se ale m??e rychle zm?nit.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_01");	//Zkus?me vydr?et tak dlouho, jak to jen p?jde.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_02");	//Innos n?m pom??e. Jeho sv?tlo z??? v na?ich srdc?ch!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_BRAVE_13_03");	//Hej! Nem?? na pr?ci nic d?le?it?j??ho, ne? se mnou po??d tlachat? Mazej!
		B_GivePlayerXP(XP_Ambient);
	};
	Parcival_BRAVE_LaberCount = Parcival_BRAVE_LaberCount + 1;
};


instance DIA_Parcival_KAP3_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP3_EXIT_Condition;
	information = DIA_Parcival_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_ALLESKLAR(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 31;
	condition = DIA_Parcival_ALLESKLAR_Condition;
	information = DIA_Parcival_ALLESKLAR_Info;
	permanent = TRUE;
	description = "Je v?echno v po??dku?";
};


func int DIA_Parcival_ALLESKLAR_Condition()
{
	if((Kapitel == 3) && (DIA_Parcival_ALLESKLAR_NervCounter < 3) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};


var int DIA_Parcival_ALLESKLAR_NervCounter;

func void DIA_Parcival_ALLESKLAR_Info()
{
	AI_Output(other,self,"DIA_Parcival_ALLESKLAR_15_00");	//Je v?echno v po??dku?
	if(DIA_Parcival_ALLESKLAR_NervCounter == 0)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_01");	//Zat?m jo!
	}
	else if(DIA_Parcival_ALLESKLAR_NervCounter == 1)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_02");	//Jo, zatracen?.
	}
	else if(Parcival_BRAVE_LaberCount > 6)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_03");	//(zasm?je se) Ale. Te? ch?pu, co m?? za lubem. Ne, p??teli. Tentokr?t ne.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_04");	//Neotravuj.
	};
	DIA_Parcival_ALLESKLAR_NervCounter = DIA_Parcival_ALLESKLAR_NervCounter + 1;
};


instance DIA_Parcival_KAP4_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP4_EXIT_Condition;
	information = DIA_Parcival_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_AnyNews(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_AnyNews_Condition;
	information = DIA_Parcival_AnyNews_Info;
	description = "Stalo se n?co d?le?it?ho?";
};


func int DIA_Parcival_AnyNews_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};

func void DIA_Parcival_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_15_00");	//Stalo se n?co d?le?it?ho?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_01");	//Ty pat??? k t? spodin?, co si ??k? drakobijci?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_02");	//V??n? jsem si myslel, ?e v sob? m?? dost cti, ne? aby ses spol?oval s takov?mi lidmi.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_03");	//D?l?m si starosti. Velk? starosti.
		AI_Output(other,self,"DIA_Parcival_AnyNews_15_04");	//Kv?li ?emu?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_05");	//Ned?vno p?i?li tihle chl?pci. ??kaj? si drakobijci.
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_06");	//Jak to vid?m j?, jsou to povale?i a zlo?inci.
	};
	AI_Output(self,other,"DIA_Parcival_AnyNews_13_07");	//Kdyby z?le?elo na mn?, vyhnal bych je z hradu. A? se o n? postaraj? sk?eti.
	Info_ClearChoices(DIA_Parcival_AnyNews);
	Info_AddChoice(DIA_Parcival_AnyNews,"Ale jsou tady, na rozd?l od lorda Hagena.",DIA_Parcival_AnyNews_LordHagen);
	Info_AddChoice(DIA_Parcival_AnyNews,"Mo?n? bys jim m?l d?t ?anci.",DIA_Parcival_AnyNews_Chance);
	Info_AddChoice(DIA_Parcival_AnyNews,"Nezd? se ti, ?e to p?eh?n???",DIA_Parcival_AnyNews_Overact);
};

func void DIA_Parcival_AnyNews_LordHagen()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_LordHagen_15_00");	//Ale jsou tady, na rozd?l od lorda Hagena.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_01");	//(trpce se zasm?je) Ano, bohu?el jsou to jedin?, co tady m?me.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_02");	//Innos n?s opravdu velice t??ce zkou??.
	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Chance()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Chance_15_00");	//Mo?n? bys jim m?l d?t ?anci.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_01");	//U? ji dostali. Bohu?el.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_02");	//Garond je p?esv?d?en, ?e by n?m mohli pomoci.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_03");	//Ale j? z nich nespust?m oko. M?me u? dost probl?m? se sk?ety, nepot?ebujeme dal?? pot??e.
	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Overact()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Overact_15_00");	//Nezd? se ti, ?e to p?eh?n???
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_01");	//To rozhodn? ne. V na?em postaven? pot?ebujeme mu?e, kte?? by st?li p??kladem.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_02");	//Bojovn?ky, kte?? by v srdc?ch na?ich voj?k? za?hnuli Innos?v ohe?.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_03");	//M?sto toho tahle sebranka podr?v? mor?lku na?eho mu?stva.
};


instance DIA_Parcival_Jan(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_Jan_Condition;
	information = DIA_Parcival_Jan_Info;
	permanent = FALSE;
	description = "Mus?m si s tebou promluvit o Janovi.";
};


func int DIA_Parcival_Jan_Condition()
{
	if((MIS_JanBecomesSmith == LOG_Running) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Jan_Info()
{
	AI_Output(other,self,"DIA_Parcival_Jan_15_00");	//Mus?m si s tebou promluvit o Janovi.
	AI_Output(self,other,"DIA_Parcival_Jan_13_01");	//Jan? Kdo je to?
	AI_Output(other,self,"DIA_Parcival_Jan_15_02");	//Drakobijec. Je kov??.
	AI_Output(self,other,"DIA_Parcival_Jan_13_03");	//No ano, u? si vzpom?n?m. Co je s n?m?
	AI_Output(other,self,"DIA_Parcival_Jan_15_04");	//Chce pracovat v kov?rn?.
	AI_Output(self,other,"DIA_Parcival_Jan_13_05");	//Nep?ipad? v ?vahu. Je jedn?m z nich a j? jim nev???m.
};


instance DIA_Parcival_ThinkAgain(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_ThinkAgain_Condition;
	information = DIA_Parcival_ThinkAgain_Info;
	permanent = TRUE;
	description = "Nem??e? tu v?c s Janem je?t? jednou zv??it?";
};


func int DIA_Parcival_ThinkAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_JanBecomesSmith == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Parcival_ThinkAgain_Info()
{
	AI_Output(other,self,"DIA_Parcival_ThinkAgain_15_00");	//Nem??e? tu v?c s Janem je?t? jednou zv??it?
	AI_Output(self,other,"DIA_Parcival_ThinkAgain_13_01");	//Ne, stoj?m si za sv?m rozhodnut?m.
};


instance DIA_Parcival_TalkedGarond(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_TalkedGarond_Condition;
	information = DIA_Parcival_TalkedGarond_Info;
	description = "Garond chce, aby se Jan staral o kov?rnu.";
};


func int DIA_Parcival_TalkedGarond_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};

func void DIA_Parcival_TalkedGarond_Info()
{
	AI_Output(other,self,"DIA_Parcival_TalkedGarond_15_00");	//Garond chce, aby se Jan staral o kov?rnu.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_01");	//Hmm. Pokud to je tak, a? si tu kov?rnu klidn? m?.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_02");	//I kdy? si mysl?m, ?e v??it tomu Janovi je velk? chyba.
};


instance DIA_Parcival_PERMKAP4(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 43;
	condition = DIA_Parcival_PERMKAP4_Condition;
	information = DIA_Parcival_PERMKAP4_Info;
	permanent = TRUE;
	description = "A krom? toho?";
};


func int DIA_Parcival_PERMKAP4_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Parcival_AnyNews))
	{
		return TRUE;
	};
};

func void DIA_Parcival_PERMKAP4_Info()
{
	AI_Output(other,self,"DIA_Parcival_PERMKAP4_15_00");	//A krom? toho?
	AI_Output(self,other,"DIA_Parcival_PERMKAP4_13_01");	//Ale, nech m? u? b?t!
};


instance DIA_Parcival_KAP5_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP5_EXIT_Condition;
	information = DIA_Parcival_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_VERRAETER(C_Info)
{
	npc = PAL_252_Parcival;
	condition = DIA_Parcival_VERRAETER_Condition;
	information = DIA_Parcival_VERRAETER_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Parcival_VERRAETER_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (MIS_OCGateOpen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_VERRAETER_Info()
{
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_00");	//Zr?dce! Jsem si jist?, ?es to byl TY, kdo otev?el br?nu.
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_01");	//Za to zaplat??.
	Npc_SetRefuseTalk(self,30);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Parcival_KAP6_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP6_EXIT_Condition;
	information = DIA_Parcival_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_PICKPOCKET(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 900;
	condition = DIA_Parcival_PICKPOCKET_Condition;
	information = DIA_Parcival_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Parcival_PICKPOCKET_Condition()
{
	return C_Beklauen(84,460);
};

func void DIA_Parcival_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
	Info_AddChoice(DIA_Parcival_PICKPOCKET,Dialog_Back,DIA_Parcival_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Parcival_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Parcival_PICKPOCKET_DoIt);
};

func void DIA_Parcival_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
};

func void DIA_Parcival_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
};

