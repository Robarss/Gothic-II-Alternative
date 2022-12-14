
instance DIA_Addon_Lucia_EXIT(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 999;
	condition = DIA_Addon_Lucia_EXIT_Condition;
	information = DIA_Addon_Lucia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lucia_PICKPOCKET(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 900;
	condition = DIA_Addon_Lucia_PICKPOCKET_Condition;
	information = DIA_Addon_Lucia_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80_Female;
};


func int DIA_Addon_Lucia_PICKPOCKET_Condition()
{
	return C_Beklauen(80,100);
};

func void DIA_Addon_Lucia_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Lucia_PICKPOCKET,Dialog_Back,DIA_Addon_Lucia_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Lucia_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Lucia_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lucia_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
};

func void DIA_Addon_Lucia_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
};


instance DIA_Addon_Lucia_Hi(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Hi_Condition;
	information = DIA_Addon_Lucia_Hi_Info;
	permanent = FALSE;
	description = "A? Jak to jde?";
};


func int DIA_Addon_Lucia_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Hi_15_00");	//A? Jak to jde?
	AI_Output(self,other,"DIA_Addon_Lucia_Hi_16_01");	//Poslouchej, jestli bys r?d n?co k j?dlu, obra? se tam na Snafa. Jestli chce? n?co k pit?, pak mluv?? se spr?vnou osobou.
};


instance DIA_Addon_Lucia_was(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_was_Condition;
	information = DIA_Addon_Lucia_was_Info;
	permanent = FALSE;
	description = "Tak co mi m??e? nab?dnout?";
};


func int DIA_Addon_Lucia_was_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_was_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_was_15_00");	//Tak co mi m??e? nab?dnout?
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_01");	//Bohu?el nem?me dost piva. Dostupn? je jenom na ostrovech, kam ho p?ivezli paladinov?.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_02");	//Tak dobr?, alespo? na n?co byli dob?? ...
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_03");	//A mimo to my obvykle pijeme ko?alku. M?m ko?alku vlastn? v?roby, grog a b?l? rum.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_04");	//(chutn?) hmmm ... Opravdu bys m?l zkusit TOTO. M?m recept od Samuela. Ten star? chl?pek fakt v?, jak m?chat pit?.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Lucia obchoduje s tvrd?m chlastem - ko?alkou.");
};


instance DIA_Addon_Lucia_Khorinis(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Khorinis_Condition;
	information = DIA_Addon_Lucia_Khorinis_Info;
	permanent = FALSE;
	description = "Hej, nejsi z Khorinisu?";
};


func int DIA_Addon_Lucia_Khorinis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bromor_Lucia) || (Nadja_GaveLuciaInfo == TRUE) || Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Khorinis_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_00");	//Hej, nejsi z Khorinisu?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_01");	//Nep?ipom?nej mi to m?sto! M?j ?ivot tam byl stra?n?.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_02");	//Pod?vej, byla to velk? akce, kdy? dorazila lo? s nov?mi odsouzenci.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_03");	//Ale tito ostatn? chlapi ... (sm?je se) Ne, d?ky. Mo?n? proto, ?e jsme na ostrov?. No dobr?, ty ?asy jsou pry?.
	if((MIS_LuciasLetter != 0) || (SC_KnowsLuciaCaughtByBandits != 0) || (Nadja_GaveLuciaInfo != 0))
	{
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_06");	//Mluvila jsem s Elvrichem!
		AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_04");	//Pro??
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_05");	//Jak? zbab?lost. Neud?lal nic, kdy? banditi p?i?li a zajali m?.
		TOPIC_END_Lucia = TRUE;
		B_GivePlayerXP(XP_Ambient);
	};
	TOPIC_END_Lucia = TRUE;
};


instance DIA_Addon_Lucia_Jetzt(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Jetzt_Condition;
	information = DIA_Addon_Lucia_Jetzt_Info;
	permanent = FALSE;
	description = "A co pl?nuje? ud?lat nyn??";
};


func int DIA_Addon_Lucia_Jetzt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Khorinis))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Jetzt_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Jetzt_15_00");	//A co pl?nuje? ud?lat nyn??
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_01");	//Uvid?me. Pr?v? nyn? mi vyhovuje b?t zde se Snafem, Fiskem a ostatn?mi.
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_02");	//Ji? jsi hovo?il s Thorusem? (omdl?) ? bo?e, to je fakt chlap!
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_03");	//(se sm?chem) Sorry ... zp?t k tvoj? ot?zce ... Nem?m ??dn? c?l, nech?v?m v?e n?hod?.
};


instance DIA_Addon_Lucia_Paladine(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Paladine_Condition;
	information = DIA_Addon_Lucia_Paladine_Info;
	permanent = FALSE;
	description = "Nem?? moc v l?sce paladiny, ?e?";
};


func int DIA_Addon_Lucia_Paladine_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Paladine_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_15_00");	//Nem?? moc v l?sce paladiny, ?e?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_01");	//Fanatick? vrahy ovl?dan? M?gy ohn?? Ne.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_02");	//Tento Lord Hagen a jeho nohsledi maj? kontrolu nad m?stem a ka?d?m ob?anem.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_03");	//A to je to, co m? v?bec nezaj?m?. Nechci ?ekat U ?erven? lucerny a? m? zav?ou.
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_DJG))
	{
		Info_ClearChoices(DIA_Addon_Lucia_Paladine);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"KONEC",DIA_Addon_Lucia_Paladine_BACK);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"Paladinov? nebojuj? ve jm?nu Innose. On si vyb?r? sv? bojovn?ky s?m.",DIA_Addon_Lucia_Paladine_WAHL);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"Paladinov? jsou bojovn?ci Innose, ne vrazi.",DIA_Addon_Lucia_Paladine_MURDER);
	};
};

func void DIA_Addon_Lucia_Paladine_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WAHL()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WAHL_15_00");	//Paladinov? nebojuj? ve jm?nu Innose. On si vyb?r? sv? bojovn?ky s?m.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_01");	//Opravdu? Mysl?m, ?e lid? si vyb?raj? sv?j osud.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_02");	//Nicm?n?, tv? slova m? p?ekvapuj?. Mluv??, jako bys byl jedn?m z nich.
	Info_AddChoice(DIA_Addon_Lucia_Paladine,"U? jsi n?kdy n?koho zabila?",DIA_Addon_Lucia_Paladine_KILL);
};

func void DIA_Addon_Lucia_Paladine_KILL()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_KILL_15_00");	//U? jsi n?kdy n?koho zabila?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_01");	//Ne, a jsem docela r?da, ?e je to tak.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_02");	//Pros?m, nemluvme u? o takov?ch v?cech.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_03");	//Vychutnejme si pit? a u?ime ka?dou chvilku, kterou n?m bohov? dali.
	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WEIB()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WEIB_15_00");	//Ty chce? po?pinit jm?no Innosovo, ?eno?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_01");	//Jak to m??u ud?lat? To jsou mu?i, kte?? d?laj? zlo v jeho jm?n?.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_02");	//J? nicm?n? nepochybuji o Innosov? bo?stv?.
};

func void DIA_Addon_Lucia_Paladine_MURDER()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_MURDER_15_00");	//Paladinov? jsou Innosovi v?le?n?ci. Nejsou vrazi.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_01");	//Opravdu? Jejich zbran? jsou poskvrn?ny krv? stejn? jako zbran? bandit? a pir?t?.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_02");	//Jedin?m rozd?lem je to, ?e oni to d?laj? ve jm?nu Innose. Ne proto, aby p?e?ili.
	Info_AddChoice(DIA_Addon_Lucia_Paladine,"Ty chce? po?pinit jm?no Innosovo, ?eno?",DIA_Addon_Lucia_Paladine_WEIB);
};


instance DIA_Addon_Lucia_Attentat(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 9;
	condition = DIA_Addon_Lucia_Attentat_Condition;
	information = DIA_Addon_Lucia_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Lucia_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Lucia_Attentat_16_00");	//Nic.
};


instance DIA_Addon_Lucia_Trade(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 99;
	condition = DIA_Addon_Lucia_Trade_Condition;
	information = DIA_Addon_Lucia_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Chci n?co k pit?.";
};


func int DIA_Addon_Lucia_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Trade_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Trade_15_00");	//Chci n?co k pit?.
	B_GiveTradeInv(self);
};


instance DIA_Addon_Lucia_lernen(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 19;
	condition = DIA_Addon_Lucia_lernen_Condition;
	information = DIA_Addon_Lucia_lernen_Info;
	permanent = FALSE;
	description = "Je je?t? n?co, co m? m??e? nau?it?";
};


func int DIA_Addon_Lucia_lernen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_lernen_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_lernen_15_00");	//Je je?t? n?co, co m? m??e? nau?it?
	AI_Output(self,other,"DIA_Addon_Lucia_lernen_16_01");	//(sm?je se) Ur?it?. M??u ti pomoct zv??it OBRATNOST.
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher,"Lucia mi m??e zv??it obratnost.");
};


instance DIA_Addon_Lucia_TEACH(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 101;
	condition = DIA_Addon_Lucia_TEACH_Condition;
	information = DIA_Addon_Lucia_TEACH_Info;
	permanent = TRUE;
	description = "Chci b?t obratn?j??.";
};


func int DIA_Addon_Lucia_TEACH_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_lernen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_TEACH_15_00");	//Chci b?t obratn?j??.
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Lucia_TEACH_5);
};

func void DIA_Addon_Lucia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
};

func void DIA_Addon_Lucia_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Lucia_TEACH_5);
};

func void DIA_Addon_Lucia_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Lucia_TEACH_5);
};

