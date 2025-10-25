
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
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_00");	//Co pořád chceš? Táhni!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_01");	//Na co čekáš? Jdi do hospody!
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
	description = "Na první pohled je jasné, že víš co děláš.";
};


func int DIA_Addon_Huno_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Huno_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_00");	//Na první pohled je jasné, že víš co děáš.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_01");	//Jednou jsem to už slyšel ... přinesl jsi tu ocel?
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_02");	//Ocel? Ne, myslím, že si mě s někým pleteš ...
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_03");	//Hm ... připadáš mi známý. Nepotkali jsme se už?
	Info_ClearChoices(DIA_Addon_Huno_Hi);
	Info_AddChoice(DIA_Addon_Huno_Hi,"Jasně, ve Starém táboře.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice(DIA_Addon_Huno_Hi,"Nepamatuji se.",DIA_Addon_Huno_Hi_NO);
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Huno prodává kovářské vybavení.");
};

func void DIA_Addon_Huno_Hi_JA()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_00");	//Jasně, ve Starém táboře.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_01");	//Starý tábor ... aha ... ty jsi ten zvědavý chlápek ... myslel jsem, že jsi mrtvý.
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_02");	//No jo, to si myslí všichni. Kdo ještě přežil?
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_03");	//Pár lidí. Někteří prchli s Ravenem jako já. Hodně chlapů však zahynulo v táboře.
	Info_ClearChoices(DIA_Addon_Huno_Hi);
	Knows_Flucht = TRUE;
};

func void DIA_Addon_Huno_Hi_NO()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_NO_15_00");	//Nepamatuji se.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_NO_06_01");	//Hm ... mám hlavu jak střep ... k čertu s tím ...
	Info_ClearChoices(DIA_Addon_Huno_Hi);
};


instance DIA_Addon_Huno_Blitz(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 2;
	condition = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent = FALSE;
	description = "Řekni mi o tvém útěku.";
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
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_00");	//Řekni mi o tvém útěku.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_01");	//V den, kdy padla bariéra, nastal obrovský zmatek.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_02");	//Někteří se schovali - jiní utekli a všechno bylo vypleněno.
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_03");	//Co jsi udělal?
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_04");	//Zkusil jsem utéct z tábora, jenomže se náhle vyjasnilo a mou kůží projela žhavá bolest.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_05");	//trefil mě ten zatracený blesk! Ale vypadá to, že jsem neohluchl ...
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_06");	//Až později mi řekli, že mě Thorus našel a vzal s sebou.
};


var int Huno_ArmorPerm;

instance DIA_Addon_Huno_Armor(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 3;
	condition = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent = TRUE;
	description = "Potřebuju lepší zbroj.";
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
	AI_Output(other,self,"DIA_Addon_Huno_Armor_15_00");	//Potřebuju lepší zbroj.
	if(Huno_ArmorCheap == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_01");	//Takže - můžeš ho mít. To, že je tak drahé, je Estebanovo nařízení.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_02");	//Ten zmetek si bere podíl z každé zbroje, co prodám.
		BDT_Armor_H_Value = 2100;
		Info_AddChoice(DIA_Addon_Huno_Armor,Dialog_Back,DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice(DIA_Addon_Huno_Armor,"Koupit těžkou zbroj bandity (Ochrana proti zbraním: 50, šípům: 50, cena: 2100)",DIA_Addon_Huno_Armor_BUY);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Armor_15_03");	//Fisk mi řekl, že bys pro mě mohl udělat speciální cenu.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_04");	//Tak Fisk? Hm, fajn. Stejně mu dlužím laskavost.
		BDT_Armor_H_Value = 1400;
		Info_AddChoice(DIA_Addon_Huno_Armor,Dialog_Back,DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice(DIA_Addon_Huno_Armor,"Koupit těžkou zbroj bandity (Ochrana proti zbraním: 45, šípům: 45, cena: 1400)",DIA_Addon_Huno_Armor_BUY);
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
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_01");	//Vypadá dobře.
		B_GiveInvItems(self,other,ItAr_BDT_H,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_02");	//Nemáš peníze, nebude zbroj.
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
	description = "O tom pokusu zavraždit Estebana ...";
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
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_00");	//(výhružně) Co ode mě chceš?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_01");	//Hledám zaměstnavatele ...
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_02");	//A proč s tím lezeš za mnou?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_03");	//Myslel jsem, že o tom něco víš.
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_04");	//Kašlu ti na to!
};


var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;

func void B_Addon_Huno_Stress()
{
	AI_Output(self,other,"DIA_Addon_Huno_Stress_06_00");	//(vzdychá) Teď poslouchej! Ať už tě tu nevidím nebo se neznám!
	Huno_Angepisst = TRUE;
};


instance DIA_Addon_Huno_SomeThings(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 4;
	condition = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent = TRUE;
	description = "Slyšel jsem o tobě nějaké zvěsti ...";
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
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_00");	//Slyšel jsem o tobě nějaké zvěsti ...
	if(Huno_nochmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_01");	//No?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_02");	//Zase ty? (hrozí) Doufám, že tentokrát je to něco důležitého ...
	};
	Huno_Counter = 0;
	if(Finn_TellAll == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_03");	//Slyšel jsem, že v době toho pokusu o vraždu jsi nebyl tam kde bys měl ...
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_04");	//(výhružně) Pokračuj?
		Huno_Counter = Huno_Counter + 1;
	};
	if(Paul_TellAll == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_05");	//Paul říkal, že Estebana nenávidíš.
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_06");	//(výhružně) Jo? Opravdu? A co ještě říkal?
		Huno_Counter = Huno_Counter + 1;
	};
	if(Emilio_TellAll == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_07");	//Emilio tě prozradil! Tutově o té vraždě něco víš!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_08");	//(klidně) Tak ti jsi mluvil se starým Emiliem, jo??
		if(Huno_Counter > 0)
		{
			AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_09");	//A on není jediný, kdo tě podežrívá.
			AI_PlayAni(self,"T_SEARCH");
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_10");	//No a?
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices(DIA_Addon_Huno_SomeThings);
			Info_AddChoice(DIA_Addon_Huno_SomeThings,"Potřebuji si něco vyjasnit se zaměstnavatelem!",DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice(DIA_Addon_Huno_SomeThings,"Jestli jsi za tou vraždou, zaplatíš za to!",DIA_Addon_Huno_SomeThings_Pro);
			B_LogEntry(Topic_Addon_Esteban,"Vypadá to, že mám Huna v hrsti.");
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_11");	//(vyhrožuje) Možná by si si s ním měl promluvit ještě jednou. Jsem si jistý, že POZDĚJI bude tvrdit přesně opak!
			B_Addon_Huno_Stress();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_12");	//Nic dalšího ...
		B_Addon_Huno_Stress();
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Pro_15_00");	//Jestli jsi za tou vraždou, zaplatíš za to!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_01");	//(dochází mu trpělivost) Jsi idiot! Opravdu si myslíš, že se tím Estebanovi zavděčíš?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_02");	//Táhni!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Huno_SomeThings_Contra()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_00");	//Potřebuji si něco vyjasnit se zaměstnavatelem!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_01");	//S Estebanem? Fakt? Posluž si!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_02");	//Už na tu dodávku oceli od pirátů čekám příliš dlouho.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_03");	//Tipnul bych, že Esteban ji zabavil, aby mi ji pak mohl prodat dráž.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_04");	//Nedělá to osobně. Má na to pár prašivých banditů, kteří jsou na jeho výplatní pásce.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_05");	//Kde jsi to slyšel?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_06");	//Opilí banditi moc mluví ...
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_07");	//Znáš jméno toho sdílného bandity?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_08");	//To nestojí za pozornost. Ale ten chlápek, kterého hledáš, je Juan. Ale už jsem ho v táboře dlouho neviděl.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_09");	//Budeš ho muset najít někde v té žumpě venku.
	MIS_Huno_Stahl = LOG_Running;
	Huno_Angepisst = FALSE;
	Log_CreateTopic(Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Huno,LOG_Running);
	B_LogEntry(Topic_Addon_Huno,"Huno čeká na dodávku oceli od pirátů. Myslí si, že nějaký chlápek Juan ji zastavil na Estebanův příkaz a schovává se někde v bažinách.");
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	Info_AddChoice(DIA_Addon_Huno_SomeThings,"Nejprve mi řekni, kdo je ten, co tě zaměstnal!",DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice(DIA_Addon_Huno_SomeThings,"Ok, udělám to pro tebe!",DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Mission_15_00");	//Ok, udělám to pro tebe!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Mission_06_01");	//Dobře. Uvidíme, jestli se ti dá věřit.
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Huno_SomeThings_TellMeNow()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_00");	//Nejprve mi řekni, kdo je ten, co tě zaměstnal!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_01");	//Ne. Nevěřím ti.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_02");	//Dávej pozor. Další můj rozhovor bude s tím zaměstnavatelem nebo s Estebanem.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_03");	//S kým se bavíš je tvoje věc.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_04");	//(vzdychá) Tak dobře! Zprostředkuju ti s ním setkání. Ale bude po mém, rozumíš?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_05");	//Jdi do hospody a promluv si s barmanem. On ti řekne, co dál.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
	B_LogEntry(Topic_Addon_Esteban,"Huno mi řekl, že bych si měl promluvit se Snafem.");
};


instance DIA_Addon_Huno_Paket(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 3;
	condition = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent = FALSE;
	description = "Mám tu ocel.";
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
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_00");	//Mám tu ocel.
	B_GiveInvItems(other,self,ItMi_Addon_Steel_Paket,1);
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_01");	//A? Byl tam i Juan?
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_02");	//Byl.
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_03");	//Věděl jsem to. Ta krysa Esteban v tom byl namočený.
	if(Huno_zuSnaf == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_04");	//Jsi fajn. Abych byl upřímný, tak jsem to od tebe nečekal.
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_05");	//Tady, vezmi si tuhle odměnu.
		B_GiveInvItems(self,other,ItMi_Gold,200);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Paket_15_06");	//A co teď bude s naší dohodou?
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_07");	//Muž, se kterým chceš mluvit, tě čeká v hospodě. Promluv si s barmanem.
		Huno_zuSnaf = TRUE;
	};
	B_LogEntry(Topic_Addon_Esteban,"Huno mi řekl, že bych si měl promluvit se Snafem.");
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

