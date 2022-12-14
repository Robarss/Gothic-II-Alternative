
instance DIA_Addon_Greg_EXIT(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 999;
	condition = DIA_Addon_Greg_EXIT_Condition;
	information = DIA_Addon_Greg_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_PICKPOCKET(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 900;
	condition = DIA_Addon_Greg_PICKPOCKET_Condition;
	information = DIA_Addon_Greg_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Addon_Greg_PICKPOCKET_Condition()
{
	return C_Beklauen(111,666);
};

func void DIA_Addon_Greg_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,Dialog_Back,DIA_Addon_Greg_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Greg_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};

func void DIA_Addon_Greg_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};


instance DIA_Addon_Greg_ImNew(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = DIA_Addon_Greg_ImNew_Condition;
	information = DIA_Addon_Greg_ImNew_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_ImNew_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_00");	//(hroziv?) Hej ty. Co d?l?? v m? chatr?i?
	AI_Output(other,self,"DIA_Addon_Greg_Hello_15_01");	//J? ...
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_02");	//(zu?iv?) Odejdu jen na p?r dn? a ka?d? si mysl?, ?e si m??e d?lat, co chce.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_03");	//Co se tady vlastn? d?je?
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_04");	//Co, palis?da je?t? nen? dokon?ena? Ka?on opl?va potvorama a ka?d? m? pohodu!!!
	GregIsBack = TRUE;
	if(!Npc_IsDead(Francis))
	{
		AI_TurnToNPC(self,Francis);
		AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_05");	//(?ve) Je to v?echno, co jsi ud?lal Francisi?
		if(C_BodyStateContains(Francis,BS_SIT))
		{
			AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_06");	//(?ve) Jdi z m? lavice, HNED!
		};
	};
	Npc_ExchangeRoutine(self,"HOME");
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_07");	//A TY? Co jsi TY d?lal?
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
	Info_AddChoice(DIA_Addon_Greg_ImNew,"Nic moc.",DIA_Addon_Greg_ImNew_nich);
	if((Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1) && Npc_IsDead(BeachShadowbeast1) && (MIS_Addon_MorganLurker != 0)) || (C_TowerBanditsDead() == TRUE))
	{
		Info_AddChoice(DIA_Addon_Greg_ImNew,"Pracoval.",DIA_Addon_Greg_ImNew_turm);
	};
};

func void B_UseRakeBilanz()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_00");	//Nev??il jsem ani na chv?li, ?e bys na mn? zapomn?l.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_01");	//Ty v?ci m?ly hodnotu n?kolika stovek zla??k?, kter? jsem ukryl v Khorinisu.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_02");	//Ty jsi je prost? v?echny vzal, co?
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_03");	//Bude? si muset odpracovat dluh.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_04");	//Brzy pochop??, co to znamen? pr?ce.
	};
	if(!Npc_IsDead(Francis))
	{
		Npc_ExchangeRoutine(Francis,"GREGISBACK");
		AI_StartState(Francis,ZS_Saw,1,"ADW_PIRATECAMP_BEACH_19");
		Francis_ausgeschissen = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
};

func void DIA_Addon_Greg_ImNew_nich()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_nich_15_00");	//Nic moc.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_nich_01_01");	//To nevad?. Najdu pro tebe n?co vhodn?ho, chlap?e.
	B_UseRakeBilanz();
};

func void DIA_Addon_Greg_ImNew_turm()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_00");	//Pracoval.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_01");	//Tak takhle? Co?
	if(C_TowerBanditsDead() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_02");	//Dostal jsem bandity z v??e.
	};
	if(Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1) && (MIS_Addon_MorganLurker != 0))
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_03");	//Pl?? na severu je vy?i?t?n? od potvor.
	};
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_04");	//Dobr?. To je za??tek.
	B_UseRakeBilanz();
};


instance DIA_Addon_Greg_JoinPirates(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_JoinPirates_Condition;
	information = DIA_Addon_Greg_JoinPirates_Info;
	permanent = FALSE;
	description = "Co m?m d?lat?";
};


func int DIA_Addon_Greg_JoinPirates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_ImNew) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_JoinPirates_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_15_00");	//Co m?m ud?lat?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_01");	//Prvn? ze v?eho mus?me do tohohle m?sta vn?st trochu ?ivota.
	if(Npc_IsDead(Morgan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_02");	//Morgan, ten l?n? blb, bude posl?n ?ezat fo?ny.
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_03");	//TY se postar?? o Morganovu pr?ci a vy??st?? ka?on od t?ch krvela?n?ch potvor.
	MIS_Addon_Greg_ClearCanyon = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_ClearCanyon,LOG_Running);
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Greg chce, abych vzal Morgan?v ?kol a vy?istil ka?on od potvor.");
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"Pak tedy jdu.",DIA_Addon_Greg_JoinPirates_Leave);
	if((Npc_IsDead(Brandon) == FALSE) || (Npc_IsDead(Matt) == FALSE))
	{
		Info_AddChoice(DIA_Addon_Greg_JoinPirates,"M?m to ud?lat s?m?",DIA_Addon_Greg_JoinPirates_Compadres);
	};
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"Jak? potvory?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

func void DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00");	//Pak tedy jdu.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01");	//Dr? se. Te? jsi jeden z n?s.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02");	//Vem si n?jak? lep?? oble?en? na lov.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03");	//Tady je jedno z na?ich brn?n?. Vypad? to, ?e ti sedne.
	CreateInvItems(self,ITAR_PIR_L_Addon,1);
	B_GiveInvItems(self,other,ITAR_PIR_L_Addon,1);
	AI_EquipArmor(hero,ITAR_PIR_L_Addon);
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04");	//A nefl?kej se s t?m, jasn??
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
};


instance DIA_ADDON_GREG_SELLWHAT(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = dia_addon_greg_sellwhat_condition;
	information = dia_addon_greg_sellwhat_info;
	permanent = FALSE;
	description = "Nem?l bys pro m? lep?? zbroj?";
};


func int dia_addon_greg_sellwhat_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_JoinPirates))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_addon_greg_sellwhat_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_SellWhat_15_00");	//Nem?l bys pro m? lep?? zbroj?
	AI_Output(self,other,"DIA_Addon_Greg_SellWhat_09_01");	//Ano ale ne zadarmo jestli chce? n?co lep??ho tak za 600 zlat?ch, nejsem charita.
};


var int addon_greg_leatherbought;

instance DIA_ADDON_GREG_LEATHER(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 650;
	condition = dia_addon_greg_leather_condition;
	information = dia_addon_greg_leather_info;
	permanent = TRUE;
	description = "Koupit Piratskou zbroj (600 zla??k?)";
};


func int dia_addon_greg_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_sellwhat) && (ADDON_GREG_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_leather_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_LEATHER_15_00");	//Tady jsou pen?ze za zbroj.
	if(B_GiveInvItems(other,self,ItMi_Gold,600))
	{
		AI_Output(self,other,"DIA_Addon_Greg_LEATHER_09_01");	//D?ky za dobr? obchod.
		CreateInvItems(other,ITAR_PIR_M_Addon,1);
		AI_PrintScreen("Zbroj od Addon_Greg z?sk?na.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		ADDON_GREG_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_LEATHER_09_02");	//Od?v m? svou cenu - a opravdu za to stoj?. Tak?e se vra?, a? d?? dohromady dost zlata.
	};
};

func void DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Compadres_15_00");	//M?m to ud?lat s?m?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01");	//Vem si p?r chlap?, pokud chce?.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02");	//M?li by rad?i makat, ne? se tady cel? den poflakovat.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Greg ?ekl, ?e si m??u vz?t na pomoc p?r chlap?.");
};

func void DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00");	//Jak? potvory?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01");	//B?itvy z ka?onu se dost?vaj? ka?d?m dnem bl??e k t?boru.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02");	//Nechci, aby byl n?kter? z m?ch chlap? se?r?n.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Jdeme jenom po b?itv?ch.");
};


instance DIA_Addon_Greg_AboutCanyon(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_AboutCanyon_Condition;
	information = DIA_Addon_Greg_AboutCanyon_Info;
	permanent = TRUE;
	description = "O pr?ci v ka?onu ...";
};


func int DIA_Addon_Greg_AboutCanyon_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_15_00");	//O ?kolu v ka?onu ...
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_01_01");	//Ano, co je s t?m?
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
	if(C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,Dialog_Back,DIA_Addon_Greg_AboutCanyon_Back);
		if((Npc_IsDead(Brandon) == FALSE) || (Npc_IsDead(Matt) == FALSE))
		{
			Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Kdo mi m??e pomoct?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Kter? nestv?ry m?m zab?t?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Zabil jsem v?echny b?itvy.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

func void DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00");	//Kdo mi m??e pomoci?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01");	//Vezmi s sebou p?r chlap?.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02");	//Stejnak jenom mrhaj? ?asem.
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Job_15_00");	//Kter? potvory m?m zab?t?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01");	//Zabij b?itvy! Zbytek toho zv??ince je ne?kodn?.
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00");	//Zabil jsem v?echny b?itvy.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01");	//Velmi dob?e. Vypad? to, ?e jsi docela u?ite?n?.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Greg vypad?, ?e je trochu ohromen? t?m, ?e jsem zabil v?echny b?itvy v ka?onu.");
	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP(XP_addon_ClearCanyon);
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};


instance DIA_Addon_Greg_BanditArmor(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditArmor_Condition;
	information = DIA_Addon_Greg_BanditArmor_Info;
	permanent = TRUE;
	description = "Pot?ebuji brn?n? bandit?.";
};


func int DIA_Addon_Greg_BanditArmor_Condition()
{
	if(MIS_Greg_ScoutBandits == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_00");	//Pot?ebuji brn?n? bandit?.
	if(MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_01");	//Bu? nejd??v u?ite?n?. Pot? si o tom m??eme promluvit.
		if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
		{
			AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_02");	//Nejd??v zabij v?echny b?itvy v ka?onu!
		};
		B_LogEntry(TOPIC_Addon_BDTRuestung,"Greg po m? chce, abych mu pomohl dostat t?bor na nohy. Pot? si m??eme promluvit o brn?n?.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_03");	//Jsi opravdu docela dobr?.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_04");	//Vlastn? chci, aby Bones pou?il tu zbroj ke ?pehov?n? bandit?.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_05");	//Ale bude lep??, kdy? ten ?kol d?m TOB?.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_06");	//M?? v?t?? ?anci se odtamtud dostat v jednom kuse.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_07");	//Promluv si s Bonesem. D? ti brn?n?. Vezmi ho, a vydej se do t?bora bandit?.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_08");	//Mus?m v?d?t, pro? se ti bastardi dostali do ?dol?, jako prvn?.
		AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_09");	//Ano, ano kapit?ne!
		B_LogEntry(TOPIC_Addon_BDTRuestung,"Te?, kdy? jsem skoncoval s b?itvami, m??u si vybrat brn?n? u Bonese.");
		Log_CreateTopic(TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_ScoutBandits,LOG_Running);
		B_LogEntry(TOPIC_Addon_ScoutBandits,"M?m pro Grega zjistit, pro? bandit? p?i?li do ?dol?.");
		MIS_Greg_ScoutBandits = LOG_Running;
	};
};


instance DIA_Addon_Greg_Auftraege2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Auftraege2_Condition;
	information = DIA_Addon_Greg_Auftraege2_Info;
	description = "Je tady je?t? n?co, co m?m ud?lat?";
};


func int DIA_Addon_Greg_Auftraege2_Condition()
{
	if((MIS_Greg_ScoutBandits != 0) && ((C_TowerBanditsDead() == FALSE) || ((Npc_IsDead(BeachLurker1) == FALSE) && (Npc_IsDead(BeachLurker2) == FALSE) && (Npc_IsDead(BeachLurker3) == FALSE) && (Npc_IsDead(BeachWaran1) == FALSE) && (Npc_IsDead(BeachWaran2) == FALSE) && (Npc_IsDead(BeachShadowbeast1) == FALSE))))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Auftraege2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Auftraege2_15_00");	//Je tady je?t? n?co, co m?m ud?lat?
	if((Npc_IsDead(BeachLurker1) == FALSE) && (Npc_IsDead(BeachLurker2) == FALSE) && (Npc_IsDead(BeachLurker3) == FALSE) && (Npc_IsDead(BeachWaran1) == FALSE) && (Npc_IsDead(BeachWaran2) == FALSE) && (Npc_IsDead(BeachShadowbeast1) == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_01");	//Z?padn? pl?? je st?le pln? potvor.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_02");	//Morgan opravdu nepohne ani prstem.
		Log_CreateTopic(TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MorganBeach,LOG_Running);
		B_LogEntry(TOPIC_Addon_MorganBeach,"Greg chce, abych se postaral o pl??. Je pln? nestv?r a pot?ebuje vy?istit.");
		MIS_Addon_MorganLurker = LOG_Running;
	};
	if(C_TowerBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_03");	//V ji?n? v??i na skal?ch jsou st?le bandit?.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_04");	//Vlastn?, Francis byl pov??en, aby se o to postaral.
		Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
		B_LogEntry(TOPIC_Addon_BanditsTower,"Greg chce, abych vyhnal bandity z v??e na v?chod od t?bora.");
		MIS_Henry_FreeBDTTower = LOG_Running;
	};
	AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_05");	//Jestli chce?, m??e? na to dohl?dnout.
};


instance DIA_Addon_Greg_Sauber2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Sauber2_Condition;
	information = DIA_Addon_Greg_Sauber2_Info;
	description = "Severn? pl?? je vy?i?t?n?.";
};


func int DIA_Addon_Greg_Sauber2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Sauber2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Sauber2_15_00");	//Severn? pl?? je vy?i?t?n?.
	AI_Output(self,other,"DIA_Addon_Greg_Sauber2_01_01");	//Velmi dob?e. Tady je odm?na.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_LogEntry(TOPIC_Addon_MorganBeach,"Ohl?sil jsem vy?i?t?n? severn? pl??e Gregovi.");
	MIS_Addon_MorganLurker = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
};


instance DIA_Addon_Greg_BanditPlatt2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditPlatt2_Condition;
	information = DIA_Addon_Greg_BanditPlatt2_Info;
	description = "Bandit? z v??e jsou pry?.";
};


func int DIA_Addon_Greg_BanditPlatt2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && (C_TowerBanditsDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditPlatt2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditPlatt2_15_00");	//Bandit? z v??e jsou pry?.
	AI_Output(self,other,"DIA_Addon_Greg_BanditPlatt2_01_01");	//Skv?l?. To byla dobr? pr?ce. Tady je tv?j plat.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_LogEntry(TOPIC_Addon_BanditsTower,"Bandit? z v??e jsou mrtv?. Greg je s t?m velmi spokojen?.");
	MIS_Henry_FreeBDTTower = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
};


instance DIA_Addon_Greg_BanditGoldmine(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditGoldmine_Condition;
	information = DIA_Addon_Greg_BanditGoldmine_Info;
	permanent = TRUE;
	description = "Bandit? nalezli zlat? d?l.";
};


func int DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if((SC_KnowsRavensGoldmine == TRUE) && (MIS_Greg_ScoutBandits == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditGoldmine_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditGoldmine_15_00");	//Bandit? nalezli zlat? d?l.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_01");	//V?d?l jsem to! TO je to, pro? sem p?i?li.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_02");	//Nikdo nebude dobrovoln? ??t v t? nestv?rami zamo?en? ba?in?.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_03");	//Dobr? pr?ce, tady n?co m??.
	B_GiveInvItems(self,other,ItRi_Addon_STR_01,1);
	B_LogEntry(TOPIC_Addon_ScoutBandits,"Informoval jsem Grega o zlat?m dole.");
	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Greg_ScoutBandits);
};


instance DIA_Addon_Greg_WhoAreYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_WhoAreYou_Condition;
	information = DIA_Addon_Greg_WhoAreYou_Info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int DIA_Addon_Greg_WhoAreYou_Condition()
{
	if((PlayerTalkedToGregNW == FALSE) && (SC_MeetsGregTime == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_WhoAreYou_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_01");	//Jsem Greg, velitel tohoto t?bora.
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_02");	//??astn??
};


instance DIA_Addon_Greg_NiceToSeeYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_NiceToSeeYou_Condition;
	information = DIA_Addon_Greg_NiceToSeeYou_Info;
	permanent = FALSE;
	description = "Jak jsi se sem vlasn? dostal?";
};


func int DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if((PlayerTalkedToGregNW == TRUE) && (MIS_Greg_ScoutBandits == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NiceToSeeYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NiceToSeeYou_15_00");	//Jak jsi se sem vlasn? dostal?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_01");	//Ne?ekal jsi, ?e m? tu uvid??, he?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_02");	//Jenom si to vyjasn?me. Jsem Greg a tohle je m?j t?bor.
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_03");	//??astn??
};


instance DIA_Addon_Greg_Story(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 99;
	condition = DIA_Addon_Greg_Story_Condition;
	information = DIA_Addon_Greg_Story_Info;
	permanent = TRUE;
	description = "Je tady je?t? jedna v?c, kterou chci v?d?t.";
};


func int DIA_Addon_Greg_Story_Condition()
{
	if(((Npc_KnowsInfo(other,DIA_Addon_Greg_WhoAreYou) == TRUE) || (Npc_KnowsInfo(other,DIA_Addon_Greg_NiceToSeeYou) == TRUE)) && (MIS_Greg_ScoutBandits != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Story_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_15_00");	//Je tady je?t? jedna v?c, kterou chci v?d?t.
	AI_Output(self,other,"DIA_Addon_Greg_Story_01_01");	//Co to je?
	Info_ClearChoices(DIA_Addon_Greg_Story);
	Info_AddChoice(DIA_Addon_Greg_Story,Dialog_Back,DIA_Addon_Greg_Story_Back);
	Info_AddChoice(DIA_Addon_Greg_Story,"Jak jsi se sem dostal?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice(DIA_Addon_Greg_Story,"Kde m?? lo??",DIA_Addon_Greg_Story_Ship);
	if(RavenIsDead == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_Story,"Co v?? o Ravenovi?",DIA_Addon_Greg_Story_Raven);
	};
};

func void DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_Story);
};

func void DIA_Addon_Greg_Story_Way()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Way_15_00");	//Jak jsi se sem dostal?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_01");	//Na?el jsem tunel. Ve star? pyramid?. Byl hl?dan? p?r m?gy.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_02");	//Ti slep? zasv?cenci o m? nezavadili ani pohledem.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_03");	//Nejd??v jsem si myslel, ?e to je jen poh?ebn? s?? a cht?l jsem se mrknou, jestli tam nen? n?co cenn?ho.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_04");	//Opravdu dost jsem z?ral, kdy? jsem vy?el ve sv?m milovan?m ?dol?.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_05");	//Za?al jsem si myslet, ?e jsem uniknul domobran? na zbytek sv?ho ?ivota.
};

func void DIA_Addon_Greg_Story_Ship()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_00");	//Kde je tvoje lo??
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_01");	//Nebude? tomu v??it. ??dn? lo? mezi pevninou a ostrovem nebyla v dohledu cel? m?s?ce.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_02");	//Cel? m?s?ce! - A prvn? lo?, kter? p?ipluje je pln? obsazen? v?le?n? lo? kr?le.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_03");	//Pln? paladin? od spodku a? po vr?ek sto??ru.
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_04");	//To je to, ?emu j? ??k?m sm?la.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_05");	//M??e? to ??ci znova. Stahlo n?s to jak nic. Jsem jedin?, kdo to zvl?dl na b?eh.
};

func void DIA_Addon_Greg_Story_Raven()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Raven_15_00");	//Co v?? o Ravenovi?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_01");	//V?m, ?e byl rudn? baron. Velk? ??slo v kolonii.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_02");	//Nev?m, pro? je tady, nebo pro? ho lid? n?sleduj?.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_03");	//Ale jsem si jist?, ?e n?co chyst?. Nen? typ, kter? by se schoval v ba?in?.
};


instance DIA_Addon_Greg_RavenDead(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_RavenDead_Condition;
	information = DIA_Addon_Greg_RavenDead_Info;
	description = "Raven pat?? minulosti.";
};


func int DIA_Addon_Greg_RavenDead_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_RavenDead_15_00");	//Raven pat?? minulosti.
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_01");	//ڞasn?! To jsem ne?ekal. Na?apal jsi ho se sta?enejma kalhotama, co?
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_02");	//Za to ti d?m 500 zla??k?.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_03");	//Jsi opravdov? ni?itel zla. To je dob?e.
	B_GivePlayerXP(XP_ADDON_GregRavenLohn);
};

