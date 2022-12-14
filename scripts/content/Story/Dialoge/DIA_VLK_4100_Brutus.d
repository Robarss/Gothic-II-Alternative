
instance DIA_Brutus_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_EXIT_Condition;
	information = DIA_Brutus_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Brutus_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_AFTER_FIGHT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 1;
	condition = DIA_Brutus_AFTER_FIGHT_Condition;
	information = DIA_Brutus_AFTER_FIGHT_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Brutus_AFTER_FIGHT_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && (self.aivar[AIV_LastFightComment] == FALSE) && Npc_IsInState(self,ZS_Talk) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_AFTER_FIGHT_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_00");	//Tak co, m?? je?t? po??d v?echny zuby?
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_01");	//Chlape, ty jsi p?kn? po??zek! Necht?l bych se s tebou utkat, to teda ne.
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_02");	//Mysl?m, ?e bys mi zlomil v?echny ?ebra, ne-li n?co hor??ho.
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_03");	//A j? t? taky neml?til plnou silou. No nevad?, m?m r?d chlapy, kter? n?jak? ta r?na hned tak neskl?t?.
		if(Brutus_einmalig == FALSE)
		{
			AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_04");	//Tenhle lektvar t? zase postav? na nohy a s ?trobami d?l? hotov? z?zraky!
			CreateInvItems(self,ItPo_Health_01,1);
			B_GiveInvItems(self,hero,ItPo_Health_01,1);
			Brutus_einmalig = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_05");	//Nem?m nic proti dobr?mu boji, ale kdy? se za?nu b?t, tak taky v?m, kdy skon?it.
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};


instance DIA_Brutus_PRISONER(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_PRISONER_Condition;
	information = DIA_Brutus_PRISONER_Info;
	description = "Co tu m?? na pr?ci?";
};


func int DIA_Brutus_PRISONER_Condition()
{
	if((Kapitel < 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PRISONER_Info()
{
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_00");	//Co tu m?? na pr?ci?
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_01");	//Co m?m na pr?ci? Cvi??m tyhle ho?any. U??m je, jak z?skat ocelov? svaly.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_02");	//Taky se star?m o v?zn?, jsem pro ty bastardy n?co jako zatracen? p??sn? otec!
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_03");	//Ale opravdov? um?n? je p?im?t je k hovoru. A v?? mi - j? rozv??u jazyk ?pln? ka?d?mu.
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_04");	//To zn? d?siv? hezky.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_05");	//Ale ti zable?en? zabedn?nci, kter? jsme te? zab?sli, n?m toho moc ne?eknou - ani nemaj? co.
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Brutus_PRISONER_06_06");	//A tak se nebudu moci vypo??dat s t?m Gornem.
		KnowsAboutGorn = TRUE;
	};
};


instance DIA_Brutus_PERM(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 90;
	condition = DIA_Brutus_PERM_Condition;
	information = DIA_Brutus_PERM_Info;
	permanent = TRUE;
	description = "N?co nov?ho?";
};


func int DIA_Brutus_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brutus_PRISONER) && (Kapitel < 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PERM_Info()
{
	AI_Output(other,self,"DIA_Brutus_PERM_15_00");	//N?co nov?ho?
	AI_Output(self,other,"DIA_Brutus_PERM_06_01");	//V?ecko vypad? klidn?. ??dn? nov? v?zni - nikomu nem??u pom?hat hledat spr?vn? slova - je to prost? zl?.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_Kasse(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Kasse_Condition;
	information = DIA_Brutus_Kasse_Info;
	permanent = FALSE;
	description = "Mohl bys m? cvi?it?";
};


func int DIA_Brutus_Kasse_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brutus_PRISONER) && (Kapitel < 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Kasse_Info()
{
	AI_Output(other,self,"DIA_Brutus_Kasse_15_00");	//Mohl bys m? cvi?it?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_01");	//Jasn? - m??u ti pomoci zv??it s?lu, ale zadarmo ani ku?e nehrabe.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_02");	//Kolik chce??
	AI_Output(self,other,"DIA_Brutus_Kasse_06_03");	//Hmm, tys pob?hal kolem toho hradu, ?e jo? Tak ti navrhnu tohle.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_04");	//M?j asistent Den se p?i posledn?m ?toku ?pln? vypa?il - prost? nevydr?el.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_05");	//Ale neode?el s pr?zdnou. Odnesl si i obsah na?? pokladnice.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_06");	//Jak? pokladnice?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_07");	//V t?hle truhlici jsme schov?vali zbo??, kter? jsme ?asem, ehm, vybrali.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_08");	//Byla to p?kn? zaokrouhlen? sumi?ka - 200 zla??k?, a to nepo??t?m je?t? vz?cn? klenoty.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_09");	//Jestli mi vr?t?? to zlato, bude? si moci nechat ty klenoty a je?t? k tomu t? budu cvi?it.
	Log_CreateTopic(TopicBrutusKasse,LOG_MISSION);
	Log_SetTopicStatus(TopicBrutusKasse,LOG_Running);
	B_LogEntry(TopicBrutusKasse,"Brut?v partner Den se ztratil i s 200 zla??k? a n?jak?mi klenoty. Kdy? Brutovi p?inesu aspo? ty dv? stovky, pom??e mi zv??it s?lu.");
};


instance DIA_Brutus_Den(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Den_Condition;
	information = DIA_Brutus_Den_Info;
	permanent = FALSE;
	description = "Nev??, kam Den m??il?";
};


func int DIA_Brutus_Den_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brutus_Kasse) && (Kapitel < 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Den_Info()
{
	AI_Output(other,self,"DIA_Brutus_Den_15_00");	//Nev??, kam Den m??il?
	AI_Output(self,other,"DIA_Brutus_Den_06_01");	//Nejsp?? co nejd?l odsud. Mo?n? se pokusil proj?t pr?smykem.
	AI_Output(other,self,"DIA_Brutus_Den_15_02");	//D?ky, fakt jsi mi moc pomohl.
	AI_Output(self,other,"DIA_Brutus_Den_06_03");	//No co m??u ??ct? Nem?m ani potuchy, kam mohl j?t.
	B_LogEntry(TopicBrutusKasse,"Den se sna?il proj?t pr?smykem.");
};


instance DIA_Brutus_Gold(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Gold_Condition;
	information = DIA_Brutus_Gold_Info;
	permanent = TRUE;
	description = "N?co tu pro tebe m?m (p?edat 200 zla??k?).";
};


func int DIA_Brutus_Gold_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brutus_Kasse) && (NpcObsessedByDMT_Brutus == FALSE) && (Brutus_TeachSTR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Gold_Info()
{
	AI_Output(other,self,"DIA_Brutus_Gold_15_00");	//N?co tu pro tebe m?m.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_01");	//V?born?. Nyn? t? m??u vycvi?it, jestli tedy chce?.
		Brutus_TeachSTR = TRUE;
		Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
		B_LogEntry(TOPIC_Teacher_OC,"S pomoc? Bruta se mohu st?t siln?j??m.");
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_02");	//Posly?, prost? mi p?ines 200 zla??k?. Nezaj?m? m?, kde si je opat??? - zla??k jako zla??k.
	};
};


instance DIA_Brutus_Teach(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 7;
	condition = DIA_Brutus_Teach_Condition;
	information = DIA_Brutus_Teach_Info;
	permanent = TRUE;
	description = "Cht?l bych se st?t siln?j??m.";
};


func int DIA_Brutus_Teach_Condition()
{
	if((Brutus_TeachSTR == TRUE) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Teach_Info()
{
	AI_Output(other,self,"DIA_Brutus_Teach_15_00");	//Cht?l bych se st?t siln?j??m.
	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach,Dialog_Back,DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Brutus_Teach_STR_5);
};

func void DIA_Brutus_Teach_Back()
{
	Info_ClearChoices(DIA_Brutus_Teach);
};

func void DIA_Brutus_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach,Dialog_Back,DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Brutus_Teach_STR_5);
};

func void DIA_Brutus_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach,Dialog_Back,DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Brutus_Teach_STR_5);
};


instance DIA_Brutus_KAP3_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_KAP3_EXIT_Condition;
	information = DIA_Brutus_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_DUSCHONWIEDER(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 30;
	condition = DIA_Brutus_DUSCHONWIEDER_Condition;
	information = DIA_Brutus_DUSCHONWIEDER_Info;
	permanent = TRUE;
	description = "Mu?il jsi dneska n?koho?";
};


func int DIA_Brutus_DUSCHONWIEDER_Condition()
{
	if((Kapitel == 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_DUSCHONWIEDER_Info()
{
	AI_Output(other,self,"DIA_Brutus_DUSCHONWIEDER_15_00");	//Mu?il jsi dneska n?koho?
	AI_Output(self,other,"DIA_Brutus_DUSCHONWIEDER_06_01");	//Copak nevid??, ?e m?m pr?ci? Vra? se pozd?ji.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_KAP4_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_KAP4_EXIT_Condition;
	information = DIA_Brutus_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_WARUMNICHTARBBEIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 40;
	condition = DIA_Brutus_WARUMNICHTARBBEIT_Condition;
	information = DIA_Brutus_WARUMNICHTARBBEIT_Info;
	description = "Jak to, ?e nejsi v pr?ci?";
};


func int DIA_Brutus_WARUMNICHTARBBEIT_Condition()
{
	if((Kapitel >= 4) && (NpcObsessedByDMT_Brutus == FALSE) && (MIS_OCGateOpen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_WARUMNICHTARBBEIT_Info()
{
	AI_Output(other,self,"DIA_Brutus_WARUMNICHTARBBEIT_15_00");	//Jak to, ?e nejsi v pr?ci?
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_01");	//(?zkostn?) To je ale nechutn?!
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_02");	//Vid?ls, jak to u m? vypad?? Ty hnusn? ?rav? ?t?nice jsou ?pln? v?ude!
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_03");	//Nem?m ani ?ajna, kdo tam co d?lal, ale j? se tam ur?it? nevr?t?m, dokud tam bude ten hnusn? hmyz.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_04");	//J? ty potvory prost? nesn???m. A p?esta? se tak blb? k?enit.
	Log_CreateTopic(TOPIC_BrutusMeatbugs,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrutusMeatbugs,LOG_Running);
	B_LogEntry(TOPIC_BrutusMeatbugs,"Hradn? mu?itel Brutus se mi sv??il, ?e mu ne?kodn? ?rav? ?t?nice v mu??rn? nah?n?j? hus? k??i. Je to prost? drs??k ka?d?m coulem.");
};


instance DIA_Brutus_MEATBUGSWEG(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 31;
	condition = DIA_Brutus_MEATBUGSWEG_Condition;
	information = DIA_Brutus_MEATBUGSWEG_Info;
	description = "U? je po ?t?nic?ch. M??e? se vr?tit a le?tit v?echny ty pale?nice a ostatn? mu??c? n?stroje.";
};


func int DIA_Brutus_MEATBUGSWEG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brutus_WARUMNICHTARBBEIT) && Npc_IsDead(Meatbug_Brutus1) && Npc_IsDead(Meatbug_Brutus2) && Npc_IsDead(Meatbug_Brutus3) && Npc_IsDead(Meatbug_Brutus4) && (Kapitel >= 4) && (NpcObsessedByDMT_Brutus == FALSE) && (MIS_OCGateOpen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_MEATBUGSWEG_Info()
{
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_00");	//U? je po ?t?nic?ch. M??e? se vr?tit a le?tit v?echny ty pale?nice a ostatn? mu??c? n?stroje.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_01");	//V?? opravdu jist?, ?e tam ani jedna z t?ch potvor nezbyla?
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_02");	//Naprosto jist?.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_03");	//No tak tedy dob?e. Tum??, za odm?nu si vezmi tohle zlato.
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_04");	//U?, jenom m? tu nerozbre?.
	TOPIC_END_BrutusMeatbugs = TRUE;
	B_GivePlayerXP(XP_BrutusMeatbugs);
	B_NpcClearObsessionByDMT(self);
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Brutus_PERM4(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 32;
	condition = DIA_Brutus_PERM4_Condition;
	information = DIA_Brutus_PERM4_Info;
	permanent = TRUE;
	description = "Jsi v po??dku?";
};


func int DIA_Brutus_PERM4_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Brutus_MEATBUGSWEG) || (MIS_OCGateOpen == TRUE)) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PERM4_Info()
{
	if((MIS_OCGateOpen == TRUE) || ((hero.guild == GIL_KDF) && (Kapitel >= 5)))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_PERM4_15_00");	//Jsi v po??dku?
		AI_Output(self,other,"DIA_Brutus_PERM4_06_01");	//(znepokojen?) A v?? ur?it?, ?e u? tam ??dn? ?rav? ?t?nice nejsou?
		AI_Output(other,self,"DIA_Brutus_PERM4_15_02");	//Ehm, pod?vej, jednu m?? p??mo za sebou!
		AI_Output(self,other,"DIA_Brutus_PERM4_06_03");	//(je??) Co?e?
		B_NpcClearObsessionByDMT(self);
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,ZS_Flee,0,"");
	};
};


instance DIA_Brutus_BESSEN(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 55;
	condition = DIA_Brutus_BESSEN_Condition;
	information = DIA_Brutus_BESSEN_Info;
	permanent = TRUE;
	description = "Ty jsi posedl?!";
};


func int DIA_Brutus_BESSEN_Condition()
{
	if((NpcObsessedByDMT_Brutus == TRUE) && (NpcObsessedByDMT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_BESSEN_Info()
{
	AI_Output(other,self,"DIA_Brutus_BESSEN_15_00");	//Ty jsi posedl?!
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_01");	//B?? do kl??tera, a? t? tam vyl???.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_02");	//Mn? u? nen? pomoci, b?? pry?!
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_03");	//N?kdo ti mus? z hlavy vypudit ty d?mony.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_04");	//(k?i??) NE!
		B_NpcClearObsessionByDMT(self);
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,ZS_Flee,0,"");
	};
};


instance DIA_Brutus_KAP5_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_KAP5_EXIT_Condition;
	information = DIA_Brutus_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_KAP5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_PICKPOCKET(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 900;
	condition = DIA_Brutus_PICKPOCKET_Condition;
	information = DIA_Brutus_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Brutus_PICKPOCKET_Condition()
{
	return C_Beklauen(14,35);
};

func void DIA_Brutus_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
	Info_AddChoice(DIA_Brutus_PICKPOCKET,Dialog_Back,DIA_Brutus_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brutus_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brutus_PICKPOCKET_DoIt);
};

func void DIA_Brutus_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
};

func void DIA_Brutus_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
};

