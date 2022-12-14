
instance DIA_Addon_Huno_EXIT(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 999;
	condition = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Huno_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Huno_PICKPOCKET(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 900;
	condition = DIA_Addon_Huno_PICKPOCKET_Condition;
	information = DIA_Addon_Huno_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Addon_Huno_PICKPOCKET_Condition()
{
	return C_Beklauen(85,102);
};

func void DIA_Addon_Huno_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Huno_PICKPOCKET,Dialog_Back,DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Huno_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Huno_PICKPOCKET);
};

func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Huno_PICKPOCKET);
};


instance DIA_Addon_Huno_Abwimmeln(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 1;
	condition = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Huno_Abwimmeln_Condition()
{
	if(Huno_MEGA_Angepisst == TRUE)
	{
		return TRUE;
	};
	if((Huno_zuSnaf == TRUE) && !Npc_KnowsInfo(other,DIA_Addon_Fisk_Meeting) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Abwimmeln_Info()
{
	if(Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_00");	//Co po??d chce?? T?hni!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_01");	//Na co ?ek??? Jdi do hospody!
	};
	AI_StopProcessInfos(self);
};


var int Knows_Flucht;
var int Huno_Angepisst;

instance DIA_Addon_Huno_Hi(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 1;
	condition = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent = FALSE;
	description = "Na prvn? pohled je jasn?, ?e v?? co d?l??.";
};


func int DIA_Addon_Huno_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Huno_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_00");	//Na prvn? pohled je jasn?, ?e v?? co d???.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_01");	//Jednou jsem to u? sly?el ... p?inesl jsi tu ocel?
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_02");	//Ocel? Ne, mysl?m, ?e si m? s n?k?m plete? ...
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_03");	//Hm ... p?ipad?? mi zn?m?. Nepotkali jsme se u??
	Info_ClearChoices(DIA_Addon_Huno_Hi);
	Info_AddChoice(DIA_Addon_Huno_Hi,"Jasn?, ve Star?m t?bo?e.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice(DIA_Addon_Huno_Hi,"Nepamatuji se.",DIA_Addon_Huno_Hi_NO);
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Huno prod?v? kov??sk? vybaven?.");
};

func void DIA_Addon_Huno_Hi_JA()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_00");	//Jasn?, ve Star?m t?bo?e.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_01");	//Star? t?bor ... aha ... ty jsi ten zv?dav? chl?pek ... myslel jsem, ?e jsi mrtv?.
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_02");	//No jo, to si mysl? v?ichni. Kdo je?t? p?e?il?
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_03");	//P?r lid?. N?kte?? prchli s Ravenem jako j?. Hodn? chlap? v?ak zahynulo v t?bo?e.
	Info_ClearChoices(DIA_Addon_Huno_Hi);
	Knows_Flucht = TRUE;
};

func void DIA_Addon_Huno_Hi_NO()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_NO_15_00");	//Nepamatuji se.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_NO_06_01");	//Hm ... m?m hlavu jak st?ep ... k ?ertu s t?m ...
	Info_ClearChoices(DIA_Addon_Huno_Hi);
};


instance DIA_Addon_Huno_Blitz(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 2;
	condition = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent = FALSE;
	description = "?ekni mi o tv?m ?t?ku.";
};


func int DIA_Addon_Huno_Blitz_Condition()
{
	if((Knows_Flucht == TRUE) && (Huno_Angepisst == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Blitz_Info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_00");	//?ekni mi o tv?m ?t?ku.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_01");	//V den, kdy padla bari?ra, nastal obrovsk? zmatek.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_02");	//N?kte?? se schovali - jin? utekli a v?echno bylo vyplen?no.
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_03");	//Co jsi ud?lal?
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_04");	//Zkusil jsem ut?ct z t?bora, jenom?e se n?hle vyjasnilo a mou k??? projela ?hav? bolest.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_05");	//trefil m? ten zatracen? blesk! Ale vypad? to, ?e jsem neohluchl ...
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_06");	//A? pozd?ji mi ?ekli, ?e m? Thorus na?el a vzal s sebou.
};


var int Huno_ArmorPerm;

instance DIA_Addon_Huno_Armor(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 3;
	condition = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent = TRUE;
	description = "Pot?ebuju lep?? zbroj.";
};


func int DIA_Addon_Huno_Armor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Huno_Hi) && (Huno_ArmorPerm == FALSE) && (Huno_Angepisst == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Armor_Info()
{
	Info_ClearChoices(DIA_Addon_Huno_Armor);
	AI_Output(other,self,"DIA_Addon_Huno_Armor_15_00");	//Pot?ebuju lep?? zbroj.
	if(Huno_ArmorCheap == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_01");	//Tak?e - m??e? ho m?t. To, ?e je tak drah?, je Estebanovo na??zen?.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_02");	//Ten zmetek si bere pod?l z ka?d? zbroje, co prod?m.
		BDT_Armor_H_Value = 2100;
		Info_AddChoice(DIA_Addon_Huno_Armor,Dialog_Back,DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice(DIA_Addon_Huno_Armor,"Koupit t??kou zbroj bandity (Ochrana proti zbran?m: 50, ??p?m: 50, cena: 2100)",DIA_Addon_Huno_Armor_BUY);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Armor_15_03");	//Fisk mi ?ekl, ?e bys pro m? mohl ud?lat speci?ln? cenu.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_04");	//Tak Fisk? Hm, fajn. Stejn? mu dlu??m laskavost.
		BDT_Armor_H_Value = 1400;
		Info_AddChoice(DIA_Addon_Huno_Armor,Dialog_Back,DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice(DIA_Addon_Huno_Armor,"Koupit t??kou zbroj bandity (Ochrana proti zbran?m: 45, ??p?m: 45, cena: 1400)",DIA_Addon_Huno_Armor_BUY);
	};
};

func void DIA_Addon_Huno_Armor_BACK()
{
	Info_ClearChoices(DIA_Addon_Huno_Armor);
};

func void DIA_Addon_Huno_Armor_BUY()
{
	AI_Output(other,self,"DIA_Addon_Huno_Armor_Buy_15_00");	//Ok, vezmu si tu zbroj.
	if(B_GiveInvItems(other,self,ItMi_Gold,BDT_Armor_H_Value))
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_01");	//Vypad? dob?e.
		B_GiveInvItems(self,other,ItAr_BDT_H,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_02");	//Nem?? pen?ze, nebude zbroj.
	};
	if(BDT_Armor_H_Value < 2100)
	{
		Huno_ArmorPerm = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Huno_Armor);
};


instance DIA_Addon_Huno_Attentat(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 4;
	condition = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent = FALSE;
	description = "O tom pokusu zavra?dit Estebana ...";
};


func int DIA_Addon_Huno_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_00");	//(v?hru?n?) Co ode m? chce??
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_01");	//Hled?m zam?stnavatele ...
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_02");	//A pro? s t?m leze? za mnou?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_03");	//Myslel jsem, ?e o tom n?co v??.
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_04");	//Ka?lu ti na to!
};


var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;

func void B_Addon_Huno_Stress()
{
	AI_Output(self,other,"DIA_Addon_Huno_Stress_06_00");	//(vzdych?) Te? poslouchej! A? u? t? tu nevid?m nebo se nezn?m!
	Huno_Angepisst = TRUE;
};


instance DIA_Addon_Huno_SomeThings(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 4;
	condition = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent = TRUE;
	description = "Sly?el jsem o tob? n?jak? zv?sti ...";
};


func int DIA_Addon_Huno_SomeThings_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Huno_Attentat) && (Huno_SomeThings_PERM == FALSE) && ((Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_SomeThings_Info()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_00");	//Sly?el jsem o tob? n?jak? zv?sti ...
	if(Huno_nochmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_01");	//No?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_02");	//Zase ty? (hroz?) Douf?m, ?e tentokr?t je to n?co d?le?it?ho ...
	};
	Huno_Counter = 0;
	if(Finn_TellAll == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_03");	//Sly?el jsem, ?e v dob? toho pokusu o vra?du jsi nebyl tam kde bys m?l ...
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_04");	//(v?hru?n?) Pokra?uj?
		Huno_Counter = Huno_Counter + 1;
	};
	if(Paul_TellAll == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_05");	//Paul ??kal, ?e Estebana nen?vid??.
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_06");	//(v?hru?n?) Jo? Opravdu? A co je?t? ??kal?
		Huno_Counter = Huno_Counter + 1;
	};
	if(Emilio_TellAll == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_07");	//Emilio t? prozradil! Tutov? o t? vra?d? n?co v??!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_08");	//(klidn?) Tak ti jsi mluvil se star?m Emiliem, jo??
		if(Huno_Counter > 0)
		{
			AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_09");	//A on nen? jedin?, kdo t? pode?r?v?.
			AI_PlayAni(self,"T_SEARCH");
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_10");	//No a?
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices(DIA_Addon_Huno_SomeThings);
			Info_AddChoice(DIA_Addon_Huno_SomeThings,"Pot?ebuji si n?co vyjasnit se zam?stnavatelem!",DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice(DIA_Addon_Huno_SomeThings,"Jestli jsi za tou vra?dou, zaplat?? za to!",DIA_Addon_Huno_SomeThings_Pro);
			B_LogEntry(Topic_Addon_Esteban,"Vypad? to, ?e m?m Huna v hrsti.");
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_11");	//(vyhro?uje) Mo?n? by si si s n?m m?l promluvit je?t? jednou. Jsem si jist?, ?e POZD?JI bude tvrdit p?esn? opak!
			B_Addon_Huno_Stress();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_12");	//Nic dal??ho ...
		B_Addon_Huno_Stress();
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Pro_15_00");	//Jestli jsi za tou vra?dou, zaplat?? za to!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_01");	//(doch?z? mu trp?livost) Jsi idiot! Opravdu si mysl??, ?e se t?m Estebanovi zavd?????
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_02");	//T?hni!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Huno_SomeThings_Contra()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_00");	//Pot?ebuji si n?co vyjasnit se zam?stnavatelem!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_01");	//S Estebanem? Fakt? Poslu? si!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_02");	//U? na tu dod?vku oceli od pir?t? ?ek?m p??li? dlouho.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_03");	//Tipnul bych, ?e Esteban ji zabavil, aby mi ji pak mohl prodat dr??.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_04");	//Ned?l? to osobn?. M? na to p?r pra?iv?ch bandit?, kte?? jsou na jeho v?platn? p?sce.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_05");	//Kde jsi to sly?el?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_06");	//Opil? banditi moc mluv? ...
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_07");	//Zn?? jm?no toho sd?ln?ho bandity?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_08");	//To nestoj? za pozornost. Ale ten chl?pek, kter?ho hled??, je Juan. Ale u? jsem ho v t?bo?e dlouho nevid?l.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_09");	//Bude? ho muset naj?t n?kde v t? ?ump? venku.
	MIS_Huno_Stahl = LOG_Running;
	Huno_Angepisst = FALSE;
	Log_CreateTopic(Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Huno,LOG_Running);
	B_LogEntry(Topic_Addon_Huno,"Huno ?ek? na dod?vku oceli od pir?t?. Mysl? si, ?e n?jak? chl?pek Juan ji zastavil na Esteban?v p??kaz a schov?v? se n?kde v ba?in?ch.");
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	Info_AddChoice(DIA_Addon_Huno_SomeThings,"Nejprve mi ?ekni, kdo je ten, co t? zam?stnal!",DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice(DIA_Addon_Huno_SomeThings,"Ok, ud?l?m to pro tebe!",DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Mission_15_00");	//Ok, ud?l?m to pro tebe!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Mission_06_01");	//Dob?e. Uvid?me, jestli se ti d? v??it.
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Huno_SomeThings_TellMeNow()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_00");	//Nejprve mi ?ekni, kdo je ten, co t? zam?stnal!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_01");	//Ne. Nev???m ti.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_02");	//D?vej pozor. Dal?? m?j rozhovor bude s t?m zam?stnavatelem nebo s Estebanem.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_03");	//S k?m se bav?? je tvoje v?c.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_04");	//(vzdych?) Tak dob?e! Zprost?edkuju ti s n?m setk?n?. Ale bude po m?m, rozum???
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_05");	//Jdi do hospody a promluv si s barmanem. On ti ?ekne, co d?l.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
	B_LogEntry(Topic_Addon_Esteban,"Huno mi ?ekl, ?e bych si m?l promluvit se Snafem.");
};


instance DIA_Addon_Huno_Paket(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 3;
	condition = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent = FALSE;
	description = "M?m tu ocel.";
};


func int DIA_Addon_Huno_Paket_Condition()
{
	if((MIS_Huno_Stahl == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Steel_Paket) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Paket_Info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_00");	//M?m tu ocel.
	B_GiveInvItems(other,self,ItMi_Addon_Steel_Paket,1);
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_01");	//A? Byl tam i Juan?
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_02");	//Byl.
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_03");	//V?d?l jsem to. Ta krysa Esteban v tom byl namo?en?.
	if(Huno_zuSnaf == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_04");	//Jsi fajn. Abych byl up??mn?, tak jsem to od tebe ne?ekal.
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_05");	//Tady, vezmi si tuhle odm?nu.
		B_GiveInvItems(self,other,ItMi_Gold,200);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Paket_15_06");	//A co te? bude s na?? dohodou?
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_07");	//Mu?, se kter?m chce? mluvit, t? ?ek? v hospod?. Promluv si s barmanem.
		Huno_zuSnaf = TRUE;
	};
	B_LogEntry(Topic_Addon_Esteban,"Huno mi ?ekl, ?e bych si m?l promluvit se Snafem.");
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_HunoStahl);
};


instance DIA_Addon_Huno_Trade(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 888;
	condition = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Huno_Trade_Condition()
{
	if(Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Trade_Info()
{
	B_Say(other,self,"$TRADE_3");
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItMiSwordrawhot,100);
};

