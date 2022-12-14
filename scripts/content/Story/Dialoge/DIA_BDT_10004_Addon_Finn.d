
instance DIA_Addon_Finn_EXIT(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 999;
	condition = DIA_Addon_Finn_EXIT_Condition;
	information = DIA_Addon_Finn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Finn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Finn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Finn_PICKPOCKET(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 900;
	condition = DIA_Addon_Finn_PICKPOCKET_Condition;
	information = DIA_Addon_Finn_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Finn_PICKPOCKET_Condition()
{
	return C_Beklauen(35,50);
};

func void DIA_Addon_Finn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Finn_PICKPOCKET,Dialog_Back,DIA_Addon_Finn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Finn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Finn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Finn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
};

func void DIA_Addon_Finn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
};


instance DIA_Addon_Finn_Hacker(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 9;
	condition = DIA_Addon_Finn_Hacker_Condition;
	information = DIA_Addon_Finn_Hacker_Info;
	permanent = TRUE;
	description = "Znova v pr?ci?";
};


func int DIA_Addon_Finn_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_06") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hacker_15_00");	//Znova v pr?ci?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hacker_07_01");	//Nyn? dostanu tady z toho dolu posledn? kousek zlata.
};


instance DIA_Addon_Finn_Hi(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 1;
	condition = DIA_Addon_Finn_Hi_Condition;
	information = DIA_Addon_Finn_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Finn_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hi_15_00");	//Zdar!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hi_07_01");	//Co bys r?d?
};


instance DIA_Addon_Finn_Hacke(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 2;
	condition = DIA_Addon_Finn_Hacke_Condition;
	information = DIA_Addon_Finn_Hacke_Info;
	permanent = FALSE;
	description = "Kde tady se?enu krump???";
};


func int DIA_Addon_Finn_Hacke_Condition()
{
	return TRUE;
};

func void DIA_Addon_Finn_Hacke_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Hacke_15_00");	//Kde tady se?enu krump???
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_01");	//B?? za Hunem - je to kov??. Ale to ?e m?? krump?? je?t? neznamen?, ?e se dostane? do dolu.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_02");	//Jestli chce? vstoupit, mus?? prvn? promluvit s Estebanem.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_03");	//Ani necho? za Thorusem - nepust? t?, dokud nebude? m?t ?erven? k?men.
};


instance DIA_Addon_Finn_Esteban(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 3;
	condition = DIA_Addon_Finn_Esteban_Condition;
	information = DIA_Addon_Finn_Esteban_Info;
	permanent = FALSE;
	description = "Co si mysl?? o Estebanovi?";
};


func int DIA_Addon_Finn_Esteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Hacke))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Esteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Esteban_15_00");	//Co si mysl?? o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_01");	//(pomalu) Hmm ... je tady boss ... on ... mysl?m, ?e je v klidu.
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_02");	//(v?hav?) Pos?l? v?dy nejlep?? mu?e do dolu. Mysl?m - jako ty, co v? n?co o dolov?n?.
};


instance DIA_Addon_Finn_Profi(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 4;
	condition = DIA_Addon_Finn_Profi_Condition;
	information = DIA_Addon_Finn_Profi_Info;
	permanent = FALSE;
	description = "A ty v?? n?co o dolov?n??";
};


func int DIA_Addon_Finn_Profi_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Profi_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Profi_15_00");	//A ty v?? n?co o dolov?n??
	AI_Output(self,other,"DIA_Addon_Finn_Profi_07_01");	//Jsem nejlep??!
};


instance DIA_Addon_BDT_10004_Finn_Mine(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 5;
	condition = DIA_Addon_Finn_Mine_Condition;
	information = DIA_Addon_Finn_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Finn_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_00");	//Dobr?, ??fe. Chce? v?d?t, kdo nejl?pe pracuje v dole? Tak tady je ...
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_01");	//A dal?? v?c: ?eknu ti Kop??ovo tajemstv?.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_02");	//Ob?as je lep?? d?t do toho i po??dnou r?nu.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_03");	//Jestli u? dlouho doluje? a nevypadlo ti nic, tak bouchni krump??em ?ikmo p?es sk?lu.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_04");	//S trochou ?t?st? n?co t?mto zp?sobem vyd?l??.
	B_Upgrade_Hero_HackChance(10);
	Knows_Truemmerschlag = TRUE;
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Finn_Gold(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 6;
	condition = DIA_Addon_Finn_Gold_Condition;
	information = DIA_Addon_Finn_Gold_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int DIA_Addon_Finn_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Gold_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_00");	//Je tu je?t? n?kolik v?c?, kter? bys m?l v?d?t: zlato nen? magick? ruda - to je obrovsk? rozd?l.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_01");	//Mysl?m - kter? ?ena m? ?et?z z rudy na krku???
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_02");	//Kopej zhora dol?. Tak ti to p?jde nejl?pe.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_03");	//N?kte?? kop??i to d?laj? jinak - ale je to mnohem t잚?.
	B_Upgrade_Hero_HackChance(10);
};


instance DIA_Addon_Finn_ein(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 7;
	condition = DIA_Addon_Finn_ein_Condition;
	information = DIA_Addon_Finn_ein_Info;
	permanent = TRUE;
	description = "M??e? ohodnotit mou techniku dolov?n??";
};


func int DIA_Addon_Finn_ein_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};


var int Finn_einmal;
var int Finn_Gratulation;

func void DIA_Addon_Finn_ein_Info()
{
	var string concatText;
	AI_Output(other,self,"DIA_Addon_Finn_ein_15_00");	//M??e? ohodnotit mou techniku dolov?n??
	if(Finn_einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_01");	//Jist?. D?l?m to u? 35 let. Nen? tu nic, co bych nepoznal!
		Finn_einmal = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Finn_ein_07_02");	//O tob? bych ?ekl, ?e jsi ...
	if(Hero_HackChance < 20)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_03");	//t??k? za??te?n?k.
	}
	else if(Hero_HackChance < 40)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_04");	//?plnej za??te?n?k.
	}
	else if(Hero_HackChance < 55)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_05");	//velice dobr? kop??.
	}
	else if(Hero_HackChance < 75)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_06");	//rozen? kop??.
	}
	else if(Hero_HackChance < 90)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_07");	//Neskute?n? dobr? kop??.
	}
	else if(Hero_HackChance < 98)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_08");	//P?n kop??.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_09");	//Zlatokopec-guru.
		if(Finn_Gratulation == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Finn_ein_07_10");	//Nyn? jsi tak dobr? jako j?. Blahop?eji par??ku!
			B_GivePlayerXP(XP_Ambient * 2);
			Snd_Play("LevelUP");
			Finn_Gratulation = TRUE;
		};
	};
	concatText = ConcatStrings("T??ba zlata: ",IntToString(Hero_HackChance));
	concatText = ConcatStrings(concatText," procent");
	PrintScreen(concatText,-1,-1,FONT_ScreenSmall,2);
};


instance DIA_Addon_Finn_Attentat(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 8;
	condition = DIA_Addon_Finn_Attentat_Condition;
	information = DIA_Addon_Finn_Attentat_Info;
	permanent = FALSE;
	description = "O pokusu o atent?t na Estebana ...";
};


func int DIA_Addon_Finn_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_00");	//(ned?v??iv?) Fakt?
	AI_Output(other,self,"DIA_Addon_Finn_Attentat_15_01");	//Nic o tom nev???
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_02");	//Pro? to chce? v?d?t?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Chci mluvit s t?m chl?pkem ...",DIA_Addon_Finn_Attentat_WannaTalk);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Esteban chce vid?t jeho smrt!",DIA_Addon_Finn_Attentat_ForTheBoss);
};

func void B_Addon_Finn_TellAll()
{
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_00");	//(vysv?tluje) Kdy? se m?l st?t atent?t, ?el jsem za Hunem - kov??em.
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_01");	//Nicm?n? tam nikdo nebyl.
	AI_Output(other,self,"DIA_Addon_Finn_TellAll_15_02");	//A?
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_03");	//V?DYCKY tam je. DOCELA podez?el?, kdy? se m? pt??.
	Finn_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban,"Finn mi ?ekl, ?e Huno v dob? pokusu o atent?t nebyl v pr?ci. Zd? se mu to podez?el?.");
};

func void DIA_Addon_Finn_Attentat_ForTheBoss()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForTheBoss_15_00");	//Esteban chce vid?t jeho smrt!
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_01");	//Oh! Ty pracuje? pro ??fa?
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_02");	//Pak ti ?eknu, co v?m.
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};

func void DIA_Addon_Finn_Attentat_WannaTalk()
{
	AI_Output(other,self,"DIA_Addon_Finn_WannaTalk_15_00");	//Chci mluvit s t?m chl?pkem ...
	AI_Output(self,other,"DIA_Addon_Finn_WannaTalk_07_01");	//(ned?v??iv?) A? Co od n?j chce??
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"To nen? tv? starost!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"M?m pro n?j zaj?mav? informace.",DIA_Addon_Finn_Attentat_HaveInfos);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Chci odstranit Estebana a hled?m spojence!",DIA_Addon_Finn_Attentat_KillEsteban);
};

func void DIA_Addon_Finn_Attentat_KillEsteban()
{
	AI_Output(other,self,"DIA_Addon_Finn_KillEsteban_15_00");	//Chci odstranit Estebana a hled?m spojence!
	AI_Output(self,other,"DIA_Addon_Finn_KillEsteban_07_01");	//Nechci s t?m nic m?t!
	Finn_Petzt = TRUE;
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Finn_Attentat_HaveInfos()
{
	AI_Output(other,self,"DIA_Addon_Finn_HaveInfos_15_00");	//M?m pro n?j zaj?mav? informace.
	AI_Output(self,other,"DIA_Addon_Finn_HaveInfos_07_01");	//Ty s n?m nejsi spojenec, nebo snad ano?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Chci odstranit Estebana a hled?m spojence!",DIA_Addon_Finn_Attentat_KillEsteban);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"To nen? tv? starost!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Nikdy!",DIA_Addon_Finn_Attentat_NoNo);
};

func void DIA_Addon_Finn_Attentat_NoNo()
{
	AI_Output(other,self,"DIA_Addon_Finn_NoNo_15_00");	//Nikdy!
	AI_Output(self,other,"DIA_Addon_Finn_NoNo_07_01");	//(uctiv?) Dob?e! ?eknu ti, co v?m.
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};

func void DIA_Addon_Finn_Attentat_ForgetIt()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForgetIt_15_00");	//To nen? tv? starost!
	AI_Output(self,other,"DIA_Addon_Finn_ForgetIt_07_01");	//Jak? Pak o tom nic nev?m.
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};


instance DIA_Addon_Finn_Again(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 9;
	condition = DIA_Addon_Finn_Again_Condition;
	information = DIA_Addon_Finn_Again_Info;
	permanent = TRUE;
	description = "Je?t? k tomu atent?tu ...";
};


func int DIA_Addon_Finn_Again_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Attentat) && !Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Again_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_15_00");	//Je?t? k tomu atent?tu ...
	if(Finn_TellAll == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_01");	//?ekl jsem ti v?e, co v?m.
		Info_ClearChoices(DIA_Addon_Finn_Again);
		Info_AddChoice(DIA_Addon_Finn_Again,"Vpo??dku ... (ZP?T)",DIA_Addon_Finn_Again_Exit);
		Info_AddChoice(DIA_Addon_Finn_Again,"Zopakuj mi to!",DIA_Addon_Finn_Again_Nochmal);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_02");	//S t?m nechci nic m?t!
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Finn_Again_Exit()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Exit_15_00");	//(uctiv?) Vpo??dku ...
	Info_ClearChoices(DIA_Addon_Finn_Again);
};

func void DIA_Addon_Finn_Again_Nochmal()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Nochmal_15_00");	//Zopakuj mi to!
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Again);
};

