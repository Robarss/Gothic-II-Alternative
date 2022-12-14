
instance DIA_Addon_Paul_EXIT(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 999;
	condition = DIA_Addon_Paul_EXIT_Condition;
	information = DIA_Addon_Paul_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Paul_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_PICKPOCKET(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 900;
	condition = DIA_Addon_Paul_PICKPOCKET_Condition;
	information = DIA_Addon_Paul_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Paul_PICKPOCKET_Condition()
{
	return C_Beklauen(22,19);
};

func void DIA_Addon_Paul_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Paul_PICKPOCKET,Dialog_Back,DIA_Addon_Paul_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Paul_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Paul_PICKPOCKET_DoIt);
};

func void DIA_Addon_Paul_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
};

func void DIA_Addon_Paul_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
};


instance DIA_Addon_Paul_Hi(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 1;
	condition = DIA_Addon_Paul_Hi_Condition;
	information = DIA_Addon_Paul_Hi_Info;
	permanent = FALSE;
	description = "Prod?v?? tak? kov??sk? n??in??";
};


func int DIA_Addon_Paul_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Hi_15_00");	//Prod?v?? tak? kov??sk? n??in??
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_01");	//Huno m??e nab?dnout n?jakou ocel na kov?n?. J? m?m pouze p?r kousk? rudy.
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_02");	//Ale ta nen? na prodej, je to jedin? cenn? v?c, kterou vlastn?m.
};


instance DIA_Addon_Paul_Huno(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 2;
	condition = DIA_Addon_Paul_Huno_Condition;
	information = DIA_Addon_Paul_Huno_Info;
	permanent = FALSE;
	description = "Pracuje? pro Huna?";
};


func int DIA_Addon_Paul_Huno_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Huno_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Huno_15_00");	//Pracuje? pro Huna?
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_01");	//Chci si vyd?lat trochu pen?z a za??t pracovat pro Huna. Ale nedostal jsem nic od Estebana od t? doby.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_02");	//?ekl mi, ?e tam nen? pr?ce pro mne.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_03");	//Tak pracovat pro Huna je jedin? mo?nost volby.
};


instance DIA_Addon_Paul_Attentat(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 3;
	condition = DIA_Addon_Paul_Attentat_Condition;
	information = DIA_Addon_Paul_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Paul_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Paul_Attentat_03_00");	//Nic! J? s t?m nem?m nic spole?n?ho. Co ode m? chce??
};


instance DIA_Addon_Paul_HunoVerdacht(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 4;
	condition = DIA_Addon_Paul_HunoVerdacht_Condition;
	information = DIA_Addon_Paul_HunoVerdacht_Info;
	permanent = FALSE;
	description = "Huno je podez??v?n ze zapleten? se do ?kladn? vra?dy...";
};


func int DIA_Addon_Paul_HunoVerdacht_Condition()
{
	if(((Finn_TellAll == TRUE) || (Emilio_TellAll == TRUE)) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_HunoVerdacht_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoVerdacht_15_00");	//Huno je podez??v?n ze zapleten? se do ?kladn? vra?dy...
	AI_Output(self,other,"DIA_Addon_Paul_HunoVerdacht_03_01");	//Nic o tom nev?m.
};


instance DIA_Addon_Paul_HunoArbeit(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_HunoArbeit_Condition;
	information = DIA_Addon_Paul_HunoArbeit_Info;
	permanent = FALSE;
	description = "Pracuje? pro n?j. Mus?? n?co v?d?t!!!";
};


func int DIA_Addon_Paul_HunoArbeit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Huno) && Npc_KnowsInfo(other,DIA_Addon_Paul_HunoVerdacht) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_HunoArbeit_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoArbeit_15_00");	//Pracuje? pro n?j. Mus?? n?co v?d?t!!!
	AI_Output(self,other,"DIA_Addon_Paul_HunoArbeit_03_01");	//(zoufale) Nic nev?m - opravdu! Mus?m pokra?ovat v pr?ci.
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_FearEsteban(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_FearEsteban_Condition;
	information = DIA_Addon_Paul_FearEsteban_Info;
	permanent = FALSE;
	description = "V??, co ti ud?l? Esteban, kdy? se dov?, ?e kryje? Huna?";
};


func int DIA_Addon_Paul_FearEsteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_HunoArbeit) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_FearEsteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_FearEsteban_15_00");	//V??, co ti ud?l? Esteban, kdy? se dov?, ?e kryje? Huna?
	AI_Output(self,other,"DIA_Addon_Paul_FearEsteban_03_01");	//Pros?m, nech m?. J? do toho nejsem zapleten!
	Npc_ExchangeRoutine(self,"PRESTART");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_MaulPaul(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_MaulPaul_Condition;
	information = DIA_Addon_Paul_MaulPaul_Info;
	permanent = FALSE;
	description = "Dob?e, tak mi ?ekni v?e, co v??.";
};


func int DIA_Addon_Paul_MaulPaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_FearEsteban) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_MaulPaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_00");	//(p??telsky) Dob?e, te? mi ?ekne? v?e, co v??, nebo t? budu muset zml?tit!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_01");	//Hej, nem??e? se mnou jednat jen tak jen proto, ?e pracuje? pro ??fa!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_02");	//(p??telsky) Ale m??u!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_03");	//Necho? bl??!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_04");	//(netrp?liv?) Paul ...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_05");	//(vzru?en?) V?e, co v?m je, ?e Huno nem? r?d Estebana.
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_06");	//(vzru?en?) Za??n? mi j?t na nervy, jak Esteban st?le ni?? Hun?v obchod...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_07");	//J? se opravdu nikdy nem?ch?m do t?chto v?c?.
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_08");	//Tak bych ?ekl, ?e to nebylo ani tak t??k?.
	Npc_ExchangeRoutine(self,"START");
	Paul_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban,"Paul ??k?, ?e Huno nesn??? Estebana za to, ?e ruinuje jeho pr?ci.");
};


instance DIA_Addon_BDT_1070_Paul_Mine(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 2;
	condition = DIA_Addon_Paul_Mine_Condition;
	information = DIA_Addon_Paul_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Paul_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1070_Paul_Mine_03_00");	//Kone?n?! Zde je tv? ruda.
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Paul_PERM(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 99;
	condition = DIA_Addon_Paul_PERM_Condition;
	information = DIA_Addon_Paul_PERM_Info;
	permanent = TRUE;
	description = "V?e v po??dku?";
};


func int DIA_Addon_Paul_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Huno))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_PERM_15_00");	//V?e v po??dku?
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_01");	//Ano, chyst?m se dostat zlato z t? sk?ly!
	}
	else if((Paul_TellAll == TRUE) && (Huno_zuSnaf == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_02");	//U? jsem ti ?ekl v?e, co jsem v?d?l!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_03");	//Hej j? zde chci pouze pracovat!
	};
};

