
instance DIA_Alwin_EXIT(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 999;
	condition = DIA_Alwin_EXIT_Condition;
	information = DIA_Alwin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alwin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alwin_PICKPOCKET(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 900;
	condition = DIA_Alwin_PICKPOCKET_Condition;
	information = DIA_Alwin_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Alwin_PICKPOCKET_Condition()
{
	return C_Beklauen(20,10);
};

func void DIA_Alwin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,Dialog_Back,DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};

func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};


instance DIA_Alwin_Sheep(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 3;
	condition = DIA_Alwin_Sheep_Condition;
	information = DIA_Alwin_Sheep_Info;
	permanent = FALSE;
	description = "Tohle jsou tvoje ovce?";
};


func int DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};

func void DIA_Alwin_Sheep_Info()
{
	AI_Output(other,self,"DIA_Alwin_Sheep_15_00");	//Tohle jsou tvoje ovce?
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//Ke mn? pat?? jenom ta, kter? nese jm?no Lucy (usm?je se) - a to je moje ?ena.
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//Ovce jsou majetkem domobrany - hned, jak je z?skaj? od farm???, p?ivedou je ke mn?.
};


instance DIA_Alwin_Fellan(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_Fellan_Condition;
	information = DIA_Alwin_Fellan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alwin_Fellan_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Fellan_Info()
{
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//Hochu, to ??len? ml?cen? kladivem m? p?ivede do hrobu.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//O ?em to mluv???
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//Copak nesly??? ty r?ny? Kdo asi tak m??e v p??stavn? ?tvrti od r?na do ve?era bu?it kladivem?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//Mysl?m toho cvoka Fellana. Ka?d? den si do t? sv? chatr?e bere kladivo.
};


instance DIA_Alwin_FellanRunning(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_FellanRunning_Condition;
	information = DIA_Alwin_FellanRunning_Info;
	permanent = FALSE;
	description = "Mohl bych se o Fellana postarat.";
};


func int DIA_Alwin_FellanRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanRunning_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_00");	//Mohl bych se o Fellana postarat.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//Ty mi chce? pomoct? A co z toho bude? m?t?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//To mi pov?z ty.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//Aha, tak je to! No dob?e - kdy? to jeho bu?en? n?jak uml???, zaplat?m ti 25 zla??k?.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//Ale upozor?uju t?, ?e s n?m rozumnou domluvou nic nesvede? - je to tot?ln? magor. Jedin? v?c, kter? by mu pomohla, je p?r dob?e m??en?ch facek!
	MIS_AttackFellan = LOG_Running;
	Log_CreateTopic(TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Alwin,LOG_Running);
	B_LogEntry(TOPIC_Alwin,"Alwin m? po??dal, zda bych nep?im?l Fellana, aby p?estal bu?it kladivem. Zab?t ho ale nebude zrovna to nejlep?? ?e?en?.");
	Info_ClearChoices(DIA_Alwin_FellanRunning);
	Info_AddChoice(DIA_Alwin_FellanRunning,"Uvid?m, co se d? d?lat...",DIA_Alwin_FellanRunning_Ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		Info_AddChoice(DIA_Alwin_FellanRunning,"Kdy? ho zml?t?m, budu z toho m?t jenom opleta?ky s domobranou...",DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//Uvid?m, co se d? d?lat.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//Jen si to rozmysli a pamatuj si, ?e jsem ti sl?bil 25 zla??k?.
	Info_ClearChoices(DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//Kdy? ho zml?t?m, budu z toho m?t jenom opleta?ky s domobranou.
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//Tady v p??stavu se n?jak? ta rva?ka tak tragicky nebere.
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//Ale jestli tu n?kde n?co ?lohne? nebo mi ??hne? na ovce, bude? v p?kn?m pr??vihu.
};


instance DIA_Alwin_FellanSuccess(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 4;
	condition = DIA_Alwin_FellanSuccess_Condition;
	information = DIA_Alwin_FellanSuccess_Info;
	permanent = FALSE;
	description = "Fellan u? kladivem tlouci nebude.";
};


func int DIA_Alwin_FellanSuccess_Condition()
{
	if((MIS_AttackFellan == LOG_Running) && ((FellanGeschlagen == TRUE) || Npc_IsDead(Fellan)))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanSuccess_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//Fellan u? kladivem tlouci nebude.
	AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//Sly??? to? Ticho - ??dn? r?ny. Kone?n?. Myslel jsem, ?e ten chlap nikdy nezmlkne.
	if(Npc_IsDead(Fellan) == FALSE)
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//Prok?zals mi velkou laskavost. V?? co? D?m ti cel?ch 30 zla??k?.
		B_GiveInvItems(self,other,ItMi_Gold,30);
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};


instance DIA_Alwin_Endlos(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 8;
	condition = DIA_Alwin_Endlos_Condition;
	information = DIA_Alwin_Endlos_Info;
	permanent = TRUE;
	description = "A jak se da?? ovc?m?";
};


func int DIA_Alwin_Endlos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Endlos_Info()
{
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//A jak se da?? ovc?m?
	if((MIS_AttackFellan != LOG_SUCCESS) && (Npc_IsDead(Fellan) == FALSE))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//Z toho Fellanova ml?cen? u? pomalu ??l?. Je?t? p?r dn? a budou ?pln? na?rot.
	}
	else if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//Ovce se jen cpou a jsou ??m d?l t?m tlust??. Stejn? jako moje ?ena. HAHAHA (hlasit? se sm?je).
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//Mo?n? bych m?l jednu z nich klepnout - jako posledn? ve?e?i!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//Jako co?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//Pro jednoho ?old?ka, kter? zabil paladina. Samoz?ejm? ho za to poprav?.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//Jen se mus?m rozhodnout, kter? z nich p?jde na poprav?? ?palek.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//Lucy m? opravdu ?t?st?, ?e je je?t? na?ivu.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//Myslel jsem, ?e jsi ??kal, ?e Lucy je tv? ?ena.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//Spr?vn?, ale jedna z ovc? se taky jmenuje Lucy. Pr?v? ona m?la b?t posledn?m j?dlem pro Benneta.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//Ale nakonec se to v?echno vy?e?ilo a Lucy m??e b?t r?da.
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//?asem je ale pozorov?n? pasouc?ch se ovc? docela nuda.
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//Tak se s nimi lou??m. Lord Hagen rozk?zal, ?e v?echny ovce poslou?? jako z?soby pro jeho arm?du.
		AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//Ale aspo? budu m?t v?c ?asu na svou ?enu.
	};
};


instance DIA_ALWIN_JOB(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 4;
	condition = dia_alwin_job_condition;
	information = dia_alwin_job_info;
	permanent = FALSE;
	description = "M??u si od tebe koupit n?jak? maso?";
};


func int dia_alwin_job_condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_alwin_job_info()
{
	AI_Output(other,self,"DIA_Alwin_Job_15_00");	//M??u si od tebe koupit n?jak? maso?
	AI_Output(self,other,"DIA_Alwin_Job_01_01");	//Ano pokud m?? ??m platit nen? problem.
	AI_Output(self,other,"DIA_Alwin_Job_01_02");	//Tady najde? jen to nej?erstv?j?? zbo??.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Cestou do p??stavi?t? Alwin prod?v? maso.");
};


instance DIA_ALWIN_TRADE(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 99;
	condition = dia_alwin_trade_condition;
	information = dia_alwin_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka? mi sv? zbo??.";
};


func int dia_alwin_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_alwin_job))
	{
		return TRUE;
	};
};

func void dia_alwin_trade_info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Alwin_Trade_15_00");	//Uka? mi sv? zbo??.
};

