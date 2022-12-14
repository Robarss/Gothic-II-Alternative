
instance DIA_Addon_Senyan_EXIT(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 999;
	condition = DIA_Addon_Senyan_EXIT_Condition;
	information = DIA_Addon_Senyan_EXIT_Info;
	permanent = TRUE;
	description = "Uvid?me se ...";
};


func int DIA_Addon_Senyan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Senyan_EXIT_Info()
{
	if(Senyan_Erpressung == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Senyan_EXIT_12_00");	//V?? co d?lat ...
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Senyan_PICKPOCKET(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 900;
	condition = DIA_Addon_Senyan_PICKPOCKET_Condition;
	information = DIA_Addon_Senyan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Senyan_PICKPOCKET_Condition()
{
	return C_Beklauen(45,88);
};

func void DIA_Addon_Senyan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Senyan_PICKPOCKET,Dialog_Back,DIA_Addon_Senyan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Senyan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Senyan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Senyan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
};

func void DIA_Addon_Senyan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
};

func void B_Senyan_Attack()
{
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_00");	//(podce?uje) Jak mi m??e? b?t n?pomocen, pane k ni?emu?
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_01");	//(vol?) Hej lidi, pod?vejte, kdo to je!
	Senyan_Called = TRUE;
	Senyan_Erpressung = LOG_OBSOLETE;
	B_CheckLog();
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void B_Senyan_Erpressung()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_00");	//Kolik chce??
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_01");	//(hraje provinil?ho) Ale ne, pros?m. Nikdy by m? nenapadlo t? vyd?rat. Nikdy.
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_02");	//Kolik?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_03");	//Ned?vno se n?kdo pokusil zab?t Estebana. Nicm?n? byl zabit jeho str??ci.
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_04");	//Jdi k Estebanovi a promluv s n?m. Popov?d?me si po tom.
	AI_StopProcessInfos(self);
	Log_CreateTopic(Topic_Addon_Senyan,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Senyan,LOG_Running);
	B_LogEntry(Topic_Addon_Senyan,"Seynan m? poznal. V? kdo jsem. Chce to pou??t pro sv? vlastn? pl?ny. Pl?nuje n?co a te? chce abych si promluvil s Estebanem.");
};


instance DIA_Addon_BDT_1084_Senyan_Hi(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 1;
	condition = DIA_Addon_Senyan_Hi_Condition;
	information = DIA_Addon_Senyan_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Senyan_Hi_Condition()
{
	return TRUE;
};


var int Senyan_Msg;
var int Senyan_Bad;
var int Senyan_Good;

func void DIA_Addon_Senyan_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_00");	//Ah! Pod?vejme, kdo to je.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_01");	//Dobr?, dobr?, jestlipak to nejsi ty. M?m pro tebe p?r dobr?ch a ?patn?ch zpr?v.
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"Chci nejd??v sly?et dobr? zpr?vy.",DIA_Addon_BDT_1084_Senyan_Hi_good);
	Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"Chci nejd??v sly?et ?patn? zpr?vy.",DIA_Addon_BDT_1084_Senyan_Hi_bad);
};

func void DIA_Addon_BDT_1084_Senyan_Hi_good()
{
	if(Senyan_Msg == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_00");	//Chci nejd??v sly?et dobr? zpr?vy.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_01");	//A co dobr? zpr?vy?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_02");	//Nev?m jist? pro?, ale bu? si jist?, ?e tu m?? vlivn? nep??tele.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_03");	//Pova? s?m, ?e jsi m?l ?t?st?, ?e jsem t? poznal jako prvn?, a ne n?kdo jin?.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_04");	//Jsem velmi rozumn?, ch?pav? a spole?ensk? osoba.
	Senyan_Good = TRUE;
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	if(Senyan_Bad == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"A co ?patn? zpr?vy?",DIA_Addon_BDT_1084_Senyan_Hi_bad);
	};
};

func void DIA_Addon_BDT_1084_Senyan_Hi_bad()
{
	if(Senyan_Msg == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00");	//Chci nejd??v sly?et ?patn? zpr?vy.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01");	//A co ?patn? zpr?vy?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02");	//Raven t? hled?. Jeho str??e t? hledaj?. Vlastn?, v?ichni bandit? ...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03");	//Zabij? t?, pokud na n? naraz??.
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04");	//Nebudou prvn?, kdo to zkou??.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05");	//Tvoje bojov? schopnosti jsou pozoruhodn? jako tvoje chytrost. Nasadit si jedno z na?ich brn?n? a p?ij?t k n?m do t?bora je jako ...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06");	//... kdy? ovce vejde vlkovi p??mo do tlamy. Chod?? po tenk?m led?, chlape.
	Senyan_Bad = TRUE;
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	if(Senyan_Good == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"A co dobr? zpr?vy?",DIA_Addon_BDT_1084_Senyan_Hi_good);
	};
};


instance DIA_Addon_Senyan_unterwegs(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 99;
	condition = DIA_Addon_Senyan_unterwegs_Condition;
	information = DIA_Addon_Senyan_unterwegs_Info;
	permanent = TRUE;
	description = "O Estebanovi ...";
};


func int DIA_Addon_Senyan_unterwegs_Condition()
{
	if((MIS_Judas != LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Senyan_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_unterwegs_Info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_00");	//O Estebanovi ...
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_01");	//U? jsi s n?m promluvil?
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_02");	//Je?t? ne.
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_03");	//Dobr?, ne?ekej p??li? dlouho.
};


instance DIA_Addon_Senyan_Attentat(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 2;
	condition = DIA_Addon_Senyan_Attentat_Condition;
	information = DIA_Addon_Senyan_Attentat_Info;
	permanent = FALSE;
	description = "U? jsem s n?m promluvil.";
};


func int DIA_Addon_Senyan_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Senyan_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_00");	//U? jsem s n?m promluvil.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_01");	//Zm?nil se o pokuse o vra?du?
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_02");	//Je m?m ?kolem naj?t osobu, kter? je za to zodpov?dn?. Nev?? o tom n?co?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_03");	//Ne v?c ne? ty. Osobn? hled?m pachatele. A zaj?mav? ??st je ...
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_04");	//ANO?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_05");	//Chci, aby si tu pr?ci ud?lal ty a po??dn?. Chci, abys na?el toho zr?dce.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_06");	//(chladn?) A jen, co ho najde?, zabij ho - pro m?.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_07");	//'J?' budu odm?n?n.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_08");	//M?j st?le na pam?ti, ?e m?m tv?j plak?t. Ud?lej svoji pr?ci a ud?lej ji dob?e. M??e? h?dat, co by se jinak stalo.
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
	Info_AddChoice(DIA_Addon_Senyan_Attentat,"Pak nem?m jinou volbu ...",DIA_Addon_Senyan_Attentat_JA);
	Info_AddChoice(DIA_Addon_Senyan_Attentat,"Nen? cesty!",DIA_Addon_Senyan_Attentat_NO);
};

func void DIA_Addon_Senyan_Attentat_NO()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_NO_15_00");	//Nen? cesty!
	B_Senyan_Attack();
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
};

func void DIA_Addon_Senyan_Attentat_JA()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_JA_15_00");	//Pak nem?m jinou volbu ...
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_01");	//V?d?l jsem, ?e bude? souhlasit.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_02");	//(nevrle) Jestli n?co zjist?? o jeho identit?, p?jdem zab?t toho bastarda spole?n?. A te? se ztra?!
	Senyan_Erpressung = LOG_Running;
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
	B_LogEntry(Topic_Addon_Senyan,"Seynan chce abych na?el a zabil spiklence. Jenom pro n?j z?skat odm?nu.");
};


instance DIA_Addon_Senyan_ChangePlan(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 3;
	condition = DIA_Addon_Senyan_ChangePlan_Condition;
	information = DIA_Addon_Senyan_ChangePlan_Info;
	permanent = FALSE;
	description = "Je?t? jsem si to promyslel. Nechci s tebou d?le pracovat!";
};


func int DIA_Addon_Senyan_ChangePlan_Condition()
{
	if((Senyan_Erpressung == LOG_Running) && (Snaf_Tip_Senyan == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_ChangePlan_Info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_ChangePlan_15_00");	//Je?t? jsem si to promyslel. Nechci s tebou d?le pracovat!
	B_Senyan_Attack();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_1084_Senyan_Found(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 3;
	condition = DIA_Addon_Senyan_Found_Condition;
	information = DIA_Addon_Senyan_Found_Info;
	permanent = FALSE;
	description = "Na?el jsem zr?dce. Je to Fisk.";
};


func int DIA_Addon_Senyan_Found_Condition()
{
	if((Senyan_Erpressung == LOG_Running) && (MIS_Judas == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_Found_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Found_15_00");	//Na?el jsem zr?dce. Je to Fisk.
	B_Senyan_Attack();
};


instance DIA_Addon_BDT_1084_Senyan_derbe(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 1;
	condition = DIA_Addon_Senyan_derbe_Condition;
	information = DIA_Addon_Senyan_derbe_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Senyan_derbe_Condition()
{
	if((Senyan_Erpressung == LOG_Running) && (MIS_Judas == LOG_SUCCESS) && (Npc_IsDead(Fisk) || Npc_IsDead(Esteban)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_derbe_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_derbe_12_00");	//(na?tvan?) Zni?il jsi na?i dohodu.
	B_Senyan_Attack();
};

