
instance DIA_Addon_Garaz_EXIT(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 999;
	condition = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Garaz_PICKPOCKET(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 900;
	condition = DIA_Addon_Garaz_PICKPOCKET_Condition;
	information = DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	return C_Beklauen(66,80);
};

func void DIA_Addon_Garaz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Garaz_PICKPOCKET,Dialog_Back,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Garaz_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
};

func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
};


instance DIA_Addon_Garaz_Probleme(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 2;
	condition = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Probleme_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_00");	//Po?kej chv?li.
	AI_Output(other,self,"DIA_Addon_Garaz_Probleme_15_01");	//N?jak? probl?m?
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_02");	//D?ln? ?ervi. Je jich p?kn? ??dka. Vypad? to, jako kdybychom narazili na hn?zdo.
};


instance DIA_Addon_Garaz_Hi(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent = FALSE;
	description = "Pro? neza?to??me na ty ?ervy?";
};


func int DIA_Addon_Garaz_Hi_Condition()
{
	if(!Npc_IsDead(Bloodwyn) && (Minecrawler_Killed < 9))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_00");	//Pro? ty ?ervy nezni??te?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_01");	//Tomu bych se dost divil. Str??e maj? pravd?podobn? jin? 'd?le?it?' v?ci na pr?ci.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_02");	//Bloodwyn mi nak?zal, zbavit se toho probl?mu.
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_03");	//Tu??m, ?e ve skute?nost? nezam??l?? s ?ervama bojovat.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_04");	//Pro? bych m?l? Copak takhle se m??eme dostat ke zlatu v jeskyni?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_05");	//Bloodwyn bude stejn? v?t?inu cht?t. A j? rozhodn? nehodl?m riskovat sv?j zadek pro tu trochu, co by zbyla.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_06");	//Pokud chce? TY s nimi bojovat - klidn?, b?? d?l. Hlavn? je nenal?kej sem nahoru.
};


instance DIA_Addon_Garaz_Bloodwyn(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 8;
	condition = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent = FALSE;
	description = "Je?t? n?co co mi m??e? ??ct o Bloodwynovi?";
};


func int DIA_Addon_Garaz_Bloodwyn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garaz_Hi) && (Minecrawler_Killed < 9) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_00");	//Je?t? n?co, co mi m??e? ??ct o Bloodwynovi?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_01");	//Jo, je to chamtiv? bastard. Kontroluje ka?dou zlatou ?ilku a hrudku.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_02");	//Zlato je to, co ho zaj?m?. N?m by nedal ani hovno.
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_03");	//Je?t? n?co?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_04");	//Mysl? si, ?e je nejlep??. Bloodwyn nedok??e vyst?t n?koho, kdo je lep?? ne? on. Jasn?, j? bych se mu rozhodn? netroufl vzep??t.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_05");	//Nejlep?? je vyhnout se jeho p??tomnosti a neprovokovat ho - leda ?e bys ho cht?l fakt nasrat.
	B_LogEntry(Topic_Addon_Tempel,"Bloodwyn ur?it? opust? chr?m, pokud se objev? pov?da?ky o nalezen? nov? zlat? ??ly tady v dole.");
	B_LogEntry(Topic_Addon_Tempel,"Pokud bude Bloodwyn p?ekvapen?, p?estane se ovl?dat. To se mi ur?it? bude hodit.");
};


instance DIA_Addon_Garaz_Sieg(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent = FALSE;
	description = "?ervi jsou mrtv?.";
};


func int DIA_Addon_Garaz_Sieg_Condition()
{
	if((Minecrawler_Killed >= 9) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Sieg_15_00");	//Skv?le, to je ono. ?ervi jsou mrtv?.
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_01");	//Bloodwyn je na cest? dol?. To je to, cos cht?l, ne?
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_02");	//T?m mysl?m - povra?dil jsi ty ?ervy, abys dostal Bloodwyna sem dol?, ne? Tak?e, cokoliv jsi zam??lel ud?lat, ud?lej to te?.
	B_StartOtherRoutine(Bloodwyn,"GOLD");
};


instance DIA_Addon_Garaz_Blood(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Blood_Condition()
{
	if(Npc_IsDead(Bloodwyn) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Blood_Info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_00");	//Dal jsi tomu bastardovi co proto. Dobr? pr?ce.
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_01");	//Nyn? se tedy pod?v?m tady okolo.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GOLD");
	B_StartOtherRoutine(Thorus,"TALK");
};


instance DIA_Addon_Garaz_Gold(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Gold_Condition()
{
	if((Npc_GetDistToWP(self,"ADW_MINE_MC_GARAZ") <= 500) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Gold_Info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_00");	//Wow, chlape, tady je spousta zlata.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_01");	//Pot?ebovali bychom se n?jak snadno k tomu zlatu naho?e dostat.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_02");	//Nicm?n?, nikdo u? ?eb??ky od p?du bari?ry nepou??v?....jak? ?koda...
};

