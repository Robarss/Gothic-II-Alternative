
instance DIA_Addon_Myxir_ADW_EXIT(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 999;
	condition = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_ADWHello(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_ADWHello_Condition;
	information = DIA_Addon_Myxir_ADWHello_Info;
	description = "M?? n?jak? zpr?vy?";
};


func int DIA_Addon_Myxir_ADWHello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_00");	//M?? n?jak? zpr?vy?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_01");	//Stavitel? t?chto ruin m? fascinuj?!
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_02");	//Je to ?koda, ?e jejich jazyk je mrtv? jako oni sami.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_03");	//(zamy?len?) Jejich pozoruhodn? ritu?ly a tak? p?ivol?v?n? pro n? nebyli ??dnou z?chranou.
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_04");	//P?ivol?v?n??
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_05");	//Stavitel? m?li siln? spojen? se sv?tem duch?.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_06");	//Jestli jsem pochopil spr?vn? jejich my?len?, m?li spojen? se sv?mi p?edky celou dobu.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_07");	//Kv?li tomu pravideln? po??dali p?ivol?v?n? a ritu?ly, aby dostali radu.
	Info_ClearChoices(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello,"Jak funguje to p?ivol?v?n??",DIA_Addon_Myxir_ADWHello_wie);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello,"Nemrtv?, co j? v?m, toho moc nenamluv?.",DIA_Addon_Myxir_ADWHello_Watt);
};

func void DIA_Addon_Myxir_ADWHello_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_wie_15_00");	//Jak funguje to p?ivol?v?n??
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_01");	//Str??ci mrtv?ch m?li sv? speci?ln? kouzla, kter?mi klidnili duchy.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_02");	//Texty, kter? se zde daj? naj?t, jsou docela zmaten?. P?esn? odpov??i na m? ot?zky nenal?z?m jen velmi m?lo kdy.
};

func void DIA_Addon_Myxir_ADWHello_Watt()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_Watt_15_00");	//Nemrtv?, co j? v?m, toho moc nenamluv?.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_01");	//Stavitel? nestvo?ili bezduch? nemrtv? jako zombie nebo jin? zl? nestv?ry.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_02");	//S duchy jsou du?e velk?ch bojovn?k?, kn??? a vl?dc?.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_03");	//Dote? nem?m ??dn? pochybnosti, ?e opravdu existuj?.
};


instance DIA_Addon_Myxir_PermADW(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 10;
	condition = DIA_Addon_Myxir_PermADW_Condition;
	information = DIA_Addon_Myxir_PermADW_Info;
	permanent = TRUE;
	description = "Pokud potk?m ducha, d?m ti v?d?t.";
};


func int DIA_Addon_Myxir_PermADW_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello) && (Saturas_RiesenPlan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_PermADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_PermADW_15_00");	//Pokud potk?m ducha, d?m ti v?d?t.
	AI_Output(self,other,"DIA_Addon_Myxir_PermADW_12_01");	//(sm?je se) Ano, to ur?it? ud?lej.
};


instance DIA_Addon_Myxir_GeistTafel(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_GeistTafel_Condition;
	information = DIA_Addon_Myxir_GeistTafel_Info;
	description = "Saturas m? poslal.";
};


func int DIA_Addon_Myxir_GeistTafel_Condition()
{
	if((Saturas_RiesenPlan == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_GeistTafel_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_00");	//Saturas m? poslal.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_01");	//Raven se ukryl do chr?mu a zav?el za sebou port?l.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_02");	//Saturas se domn?v?, ?e z?skal znalosti o chr?mu od ducha!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_03");	//(zdrcen?) Oh Adanosi!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_04");	//Musel p?ivolat vrchn?ho kn?ze Khardimona, aby se ho zeptal na cestu do chr?mu.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_05");	//Podle zaznam? m? hrob v jeskyn?ch pod pevnost?!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_06");	//Mus?? ud?lat to sam?.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_07");	//Ale Khardimona se u? zeptat nem??e? ...
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_08");	//Hrob v?le?n?ka Quarhodrona le?? na z?pad? ?dol?.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_09");	//Mus?? ho naj?t ... a probudit Quarhodrona.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_10");	//V t?chto n?pisech je naps?no, jak v???c? Adanose m??e p?ivolat ducha.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_11");	//Mysl??, ?e opravdu funguj??
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_12");	//P?e?etl jsem hodn? p?sma.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_13");	//Nap??klad z?pisi Y'Beriona, v?dce Bratrstva Sp??e.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_14");	//Ale v???m ka?d?mu slovu autora T?CHTO spisk?!
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_Running;
	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Mysl?? to v??n??",DIA_Addon_Myxir_GeistTafel_geist);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Pro? Quarhodron? Pro? ne vrchn? kn?z Khardimon osobn??",DIA_Addon_Myxir_GeistTafel_Khardimon);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Bratrstvo Sp??e ne??kalo jenom l?i.",DIA_Addon_Myxir_GeistTafel_psi);
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_Khardimon_15_00");	//Pro? Quarhodron? Pro? ne vrchn? kn?z Khardimon osobn??
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_01");	//Raven znesv?til hrob sv?m p?ivol?v?n?m. To je jist?.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_02");	//Mus?me se pod?vat po jin?m duchovi.
};

func void DIA_Addon_Myxir_GeistTafel_psi()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_psi_15_00");	//Bratrstvo Sp??e ne??kalo jenom l?i. A nav?c jejich mysl ovl?dal Sp??.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_01");	//To nebyly jenom jejich l?i, to je nepravd?podobn?, byla to jejich v?ra.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_02");	//Slova byla sp??e nepochopiteln?, ne?-li p?esv?d?iv?. Byli ovlivn?n? nadm?rn?m pou??v?n?m tr?vy z ba?in, kterou kou?ili.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_03");	//Ov?em ten, kdo psal tyto kamenn? desky, psal v?e rozv??n? a dopodrobna. A to m? p?esv?d?ilo o tom, ?e je to pravda.
};

func void DIA_Addon_Myxir_GeistTafel_geist()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_geist_15_00");	//Mysl?? to v??n??
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_01");	//Nechci nechat jedin? k?men nerozlu?t?n?.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_02");	//I jestli pro n?s existuje jenom n?dech ?ance potkat jednoho ze stavitel?, pak to mus?me zkusit.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_03");	//Raven to tak? dok?zal.
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Souhlas?m, p?ivol?m ducha. Co m?m ud?lat?",DIA_Addon_Myxir_GeistTafel_wie);
};

func void DIA_Addon_Myxir_GeistTafel_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_wie_15_00");	//Souhlas?m, p?ivol?m ducha. Co m?m ud?lat?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_01");	//Najdi Quarhodron?v hrob na z?pad? ?dol?.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_02");	//Se slovy Str??c? mrtv?ch, kter? jsem napsal, bude jeho duch p?ivol?n.
	CreateInvItems(self,ItWr_Addon_SUMMONANCIENTGHOST,1);
	B_GiveInvItems(self,other,ItWr_Addon_SUMMONANCIENTGHOST,1);
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_03");	//To? v?e. Te? mus?me naj?t jeho hrob.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_04");	//Hodn? ?t?st? synu!
	B_LogEntry(TOPIC_Addon_Quarhodron,"Myxir chce abych probudil ducha prad?vn?ho v?le?n?ka Quadrohona a zeptal se ho na radu. Dal mi dokument s magickou formul?, kterou m?m nahlas p?e??st v Quarhodronov? hrob? na z?pad?.");
	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
};


instance DIA_Addon_Myxir_GeistPerm(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_GeistPerm_Condition;
	information = DIA_Addon_Myxir_GeistPerm_Info;
	description = "Jak to bylo znovu o v?le?n?kovi 'Quarhodronovi'?";
};


func int DIA_Addon_Myxir_GeistPerm_Condition()
{
	if(MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_GeistPerm_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistPerm_15_00");	//Jak to bylo znovu o v?le?n?kovi 'Quarhodronovi'?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_01");	//M?l bys naj?t jeho hrob a p?ivolat ho pomoc? slov Str??c? mrtv?ch.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_02");	//Napsal jsem ty slova. Mus?? je jenom nahlas p?e??st.
};


instance DIA_Addon_Myxir_TalkedToGhost(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_TalkedToGhost_Condition;
	information = DIA_Addon_Myxir_TalkedToGhost_Info;
	description = "Promluvil jsem s Quarhodronem.";
};


func int DIA_Addon_Myxir_TalkedToGhost_Condition()
{
	if((MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running) && (SC_TalkedToGhost == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_TalkedToGhost_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_00");	//Promluvil jsem s Quarhodronem.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_01");	//(nad?en?) Pak ho opravdu m??e? probudit z kr?lovstv? mrtv?ch?
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_02");	//To je opravdu zaj?mav?. Obdivuji tyto stavitele ??m d?l v?c.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_03");	//Kdo v?, ?eho mohli dos?hnout, pokud by st?le existovali ...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Myxir_GeistBeschwoeren);
	if((Saturas_KnowsHow2GetInTempel == FALSE) && (Ghost_SCKnowsHow2GetInAdanosTempel == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_04");	//Co ten duch ??kal?
		AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_05");	//Dal mi n?co, s ??m se mohu dostat do chr?mu.
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_06");	//Pak jdi p??mo k Saturasovi. Bude se o to zaj?mat.
		B_LogEntry(TOPIC_Addon_Quarhodron,"M?l bych ohl?sit Saturasovi, ?e jsem probudil Quarhodrona.");
	};
};


instance DIA_Addon_Myxir_ADW_Teach(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 90;
	condition = DIA_Addon_Myxir_ADW_Teach_Condition;
	information = DIA_Addon_Myxir_ADW_Teach_Info;
	permanent = TRUE;
	description = "Nau? m? ciz? jazyk.";
};


var int DIA_Addon_Myxir_ADW_Teach_NoPerm;
var int DIA_Addon_Myxir_ADW_Teach_OneTime;

func int DIA_Addon_Myxir_ADW_Teach_Condition()
{
	if((DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE) && (DIA_Addon_Myxir_Teach_NoPerm == FALSE) && (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_ADW_Teach_Info()
{
	B_DIA_Addon_Myxir_TeachRequest();
	if(DIA_Addon_Myxir_ADW_Teach_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
		DIA_Addon_Myxir_ADW_Teach_OneTime = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,Dialog_Back,DIA_Addon_Myxir_ADW_Teach_BACK);
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1();
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL2();
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL3();
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
	}
	else
	{
		B_DIA_Addon_Myxir_TeachNoMore();
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X();
};

func void DIA_Addon_Myxir_ADW_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

