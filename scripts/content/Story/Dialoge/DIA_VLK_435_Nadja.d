
instance DIA_Nadja_EXIT(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 999;
	condition = DIA_Nadja_EXIT_Condition;
	information = DIA_Nadja_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Nadja_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Nadja_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Nadja_PICKPOCKET(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 900;
	condition = DIA_Nadja_PICKPOCKET_Condition;
	information = DIA_Nadja_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40_Female;
};


func int DIA_Nadja_PICKPOCKET_Condition()
{
	return C_Beklauen(40,40);
};

func void DIA_Nadja_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
	Info_AddChoice(DIA_Nadja_PICKPOCKET,Dialog_Back,DIA_Nadja_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Nadja_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Nadja_PICKPOCKET_DoIt);
};

func void DIA_Nadja_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
};

func void DIA_Nadja_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
};


instance DIA_Nadja_STANDARD(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_STANDARD_Condition;
	information = DIA_Nadja_STANDARD_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Nadja_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Bromor_Pay == FALSE))
	{
		return TRUE;
	};
};


var int Nadja_LuciaInfo;

func void DIA_Nadja_STANDARD_Info()
{
	if(Nadja_LuciaInfo == TRUE)
	{
		AI_EquipArmor(self,ithl_helm7);
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_00");	//Mus?? si nejprve promluvit s Bromorem.
	}
	else
	{
		AI_EquipArmor(self,ithl_helm7);
		AI_Output(self,other,"DIA_Nadja_STANDARD_16_00");	//Hele, te? zrovna se ti nem??u v?novat, fe??ku. Jestli se chce? pobavit, promluv si s Bromorem.
	};
	if((SC_HearedAboutMissingPeople == TRUE) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE) && (Nadja_LuciaInfo == FALSE))
	{
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_01");	//R?d bych se t? zeptal na p?r ot?zek ohledn? t?ch chyb?j?c?ch lid?.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_02");	//Dob?e, je tady n?co, co bych ti mohla ??ct, ale ne tady, drahou?ku.
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_03");	//OK, tak poj?me nahoru.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_04");	//Dob?e, ale to si mus?? prvn? za??dit s Bromorem. Nechci se dostat do probl?m?.
		Nadja_LuciaInfo = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Nadja_Danach(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_Danach_Condition;
	information = DIA_Nadja_Danach_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Nadja_Danach_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Bromor_Pay == FALSE) && (Nadja_Nacht == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Nadja_Danach_Info()
{
	AI_Output(self,other,"DIA_Nadja_Danach_16_00");	//P???t? p?ij? zase!
	Nadja_Nacht = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_Nadja_hochgehen(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_hochgehen_Condition;
	information = DIA_Nadja_hochgehen_Info;
	important = FALSE;
	permanent = TRUE;
	description = "Poj?me nahoru!";
};


func int DIA_Nadja_hochgehen_Condition()
{
	if(Bromor_Pay == 1)
	{
		return TRUE;
	};
};

func void DIA_Nadja_hochgehen_Info()
{
	AI_Output(other,self,"DIA_Nadja_hochgehen_15_00");	//Poj?me nahoru!
	AI_Output(self,other,"DIA_Nadja_hochgehen_16_01");	//Dneska m?? ??astn? den, fe??ku. Poj?me.
	Bromor_Pay = 2;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DANCE");
};


instance DIA_Addon_Nadja_LuciaInfo(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 5;
	condition = DIA_Addon_Nadja_LuciaInfo_Condition;
	information = DIA_Addon_Nadja_LuciaInfo_Info;
	description = "U? m??eme mluvit?";
};


func int DIA_Addon_Nadja_LuciaInfo_Condition()
{
	if((Bromor_Pay == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 200) && (Nadja_LuciaInfo == TRUE))
	{
		return TRUE;
	};
};


var int Nadja_GaveLuciaInfo;

func void DIA_Addon_Nadja_LuciaInfo_Info()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_15_00");	//U? m??eme mluvit?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_01");	//Nikdo n?s tu nebude ru?it.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_02");	//Bromor rozhodn? neoce?uje, kdy? si pov?d?me s hosty b?hem pr?ce - nevyd?l?v?me mu.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_03");	//Tak?e, ty bys r?d v?d?l n?co o t?ch zmizel?ch lidech z p??stavn? ?tvrti, ?e?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_04");	//Nev?m jestli ti to pom??e, ale m??u ti ??ct, kam ode?la Lucie.
	Nadja_GaveLuciaInfo = TRUE;
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Kam ode?la?",DIA_Addon_Nadja_LuciaInfo_wo);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"A co Lucie?",DIA_Addon_Nadja_LuciaInfo_lucia);
};

func void DIA_Addon_Nadja_LuciaInfo_lucia()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_00");	//A co Lucie?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_01");	//Nikomu moc nevad?, ?e u? tu nen?.
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_02");	//Pro??
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_03");	//M?la sklon zu?itkovat v?echny a v?echno.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_04");	//Fakt d?vka!
};

func void DIA_Addon_Nadja_LuciaInfo_wo()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_wo_15_00");	//Kam ode?la?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_01");	//?asto se sch?zela s Elvrichem, s t?m u?edn?kem Thorbena, ve spodn? ??sti m?sta.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_02");	//Vsadila bych se, ?e s n?m utekla.
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Ta bezstarostn? sle?na, Lucie, zmizela z Bromorova nev?stince p?es noc. ???? se zv?sti, ?e utekla s Torbenov?m tesa?sk?m u?edn?kem Elvrichem.");
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Kam mohli j?t?",DIA_Addon_Nadja_LuciaInfo_Elvrich);
};

func void DIA_Addon_Nadja_LuciaInfo_Elvrich()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00");	//Kam mohli j?t?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01");	//Mohli by b?t na n?jak? farm?, pokud je ov?em nese?rali vlci.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02");	//Kam jinam by mohli uprchnout?
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Je?t? n?co?",DIA_Addon_Nadja_LuciaInfo_sonst);
};

func void DIA_Addon_Nadja_LuciaInfo_sonst()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_sonst_15_00");	//Je?t? n?co?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_01");	//Zaslechla jsem p?r v?c? o t?ch chyb?j?c?ch lidech z p??stavn? ?tvrti.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_02");	//Ale nejsem si jist? nakolik jsou tyto zv?sti pravdiv?.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_03");	//M?l by sis promluvit s n?kter?m z obchodn?k?.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_04");	//Promi?, ale to je v?echno, co v?m.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_05");	//A co my dva, zlat??ko? Nakonec, za n?co jsi p?ece zaplatil.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_06");	//Opravdu se mnou nechce? str?vit p?r chvilek ne? zase odejde??
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,PRINT_Addon_NadjaWait,DIA_Addon_Nadja_WAIT);
	};
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"D?ky, ale u? opravdu mus?m j?t.",DIA_Addon_Nadja_LuciaInfo_weiter);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Pro? ne? ...",DIA_Nadja_Poppen_Start);
};

func void DIA_Addon_Nadja_LuciaInfo_weiter()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_weiter_15_00");	//D?ky, ale u? opravdu mus?m j?t.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_weiter_16_01");	//?koda. Mo?n? p???t?.
	Bromor_Pay = FALSE;
	Nadja_Nacht = Nadja_Nacht + 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Addon_Nadja_WAIT()
{
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
};


instance DIA_Nadja_Poppen(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_Poppen_Condition;
	information = DIA_Nadja_Poppen_Info;
	permanent = TRUE;
	description = "(U??t si)";
};


func int DIA_Nadja_Poppen_Condition()
{
	if((Bromor_Pay == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 300))
	{
		return TRUE;
	};
};

func void DIA_Nadja_Poppen_Info()
{
	AI_Output(self,other,"DIA_Nadja_Poppen_16_00");	//Dal??ch p?r hodin pat?? jen a jen n?m.
	AI_Output(self,other,"DIA_Nadja_Poppen_16_01");	//Jen se hezky uvolni. Lehni si a u?ij si to!
	Info_ClearChoices(DIA_Nadja_Poppen);
	Info_AddChoice(DIA_Nadja_Poppen,"Fajn...",DIA_Nadja_Poppen_Start);
};

func void DIA_Nadja_Poppen_Start()
{
	Bromor_Pay = FALSE;
	Nadja_Nacht = Nadja_Nacht + 1;
	PlayVideo("LOVESCENE.BIK");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Addon_Nadja_LuciaInfo_Pop()
{
	DIA_Nadja_Poppen_Start();
};


instance DIA_Nadja_BUYHERB(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_BUYHERB_Condition;
	information = DIA_Nadja_BUYHERB_Info;
	permanent = TRUE;
	description = "Kde bych tu koupil n?jak? drogy?";
};


func int DIA_Nadja_BUYHERB_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Npc_KnowsInfo(other,DIA_Nadja_WANT_HERB) == FALSE) && (Nadja_Money == FALSE) && (Undercover_Failed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nadja_BUYHERB_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_BUYHERB_15_00");	//Kde bych tu koupil n?jak? drogy?
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 500)
	{
		if(Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE)
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_01");	//Jak to m?m v?d?t? A i kdybych to v?d?la, ur?it? bych to ne?ekla n?komu od m?stsk? str??e.
			Undercover_Failed = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_02");	//Jestli ti v??n? m?m n?co sd?lit, bude? se muset vytasit s ??jakou tou ?kv?rou.
			AI_Output(other,self,"DIA_Nadja_BUYHERB_15_03");	//Kolik chce??
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_04");	//Spravilo by to 50 zla??k?.
			Nadja_Money = TRUE;
		};
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};
};


instance DIA_Nadja_WANT_HERB(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_WANT_HERB_Condition;
	information = DIA_Nadja_WANT_HERB_Info;
	permanent = FALSE;
	description = "Tak te? mi ?ekni, kde bych mohl koupit n?jakou tr?vu (zaplatit 50 zla??k?).";
};


func int DIA_Nadja_WANT_HERB_Condition()
{
	if((Npc_HasItems(other,ItMi_Gold) >= 50) && (Nadja_Money == TRUE) && (MIS_Andre_REDLIGHT == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Nadja_WANT_HERB_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_WANT_HERB_15_00");	//A te? mi pov?z, kde bych tu drogu koupil.
	if(Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE)
	{
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_01");	//Je mi l?to, ale prost? si to nepamatuju.
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,50);
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_02");	//Promluv si s Borkou, fe??ku. Ten by pro tebe mohl trochu drogy m?t.
		Knows_Borka_Dealer = TRUE;
	};
};

