
instance DIA_Addon_Juan_EXIT(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 999;
	condition = DIA_Addon_Juan_EXIT_Condition;
	information = DIA_Addon_Juan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Juan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Juan_PICKPOCKET(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 900;
	condition = DIA_Addon_Juan_PICKPOCKET_Condition;
	information = DIA_Addon_Juan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Juan_PICKPOCKET_Condition()
{
	return C_Beklauen(65,73);
};

func void DIA_Addon_Juan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Juan_PICKPOCKET,Dialog_Back,DIA_Addon_Juan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Juan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Juan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Juan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
};

func void DIA_Addon_Juan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
};


instance DIA_Addon_Juan_HI(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_HI_Condition;
	information = DIA_Addon_Juan_HI_Info;
	permanent = FALSE;
	description = "N?jak? blafy?";
};


func int DIA_Addon_Juan_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_HI_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_HI_15_00");	//N?jak? blafy?
	AI_Output(self,other,"DIA_Addon_Juan_HI_13_01");	//Co otravuje?? Chce? mi n?co ??ct? Jestli ne, tak si dej odchod.
	if(!Npc_IsDead(Freund))
	{
		AI_Output(self,other,"DIA_Addon_Juan_HI_13_02");	//Moji kam?di by si t? mohli hodit do par?dy, tak co ode m? chce?.
		B_StartOtherRoutine(Freund,"STAND");
	};
};


instance DIA_Addon_Juan_Losung(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_Losung_Condition;
	information = DIA_Addon_Juan_Losung_Info;
	permanent = FALSE;
	description = "Sly?el jsem, ?e m?? zaj?mav? zbo??.";
};


func int DIA_Addon_Juan_Losung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_HI) && ((Tom_Tells == TRUE) || (MIS_Huno_Stahl == LOG_Running)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_Losung_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_00");	//Sly?el jsem, ?e m?? zaj?mav? zbo??.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_01");	//Co? Esteban na m? n?co zkou??? M?m plno pr?ce a k??i sed?enou, jsem po??d v dole a mak?m, sly??? MAK?M.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_02");	//...a on n?koho po?le pro materi?l? J? nejsem skladi?t?!
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_03");	//No? Tak to nen? m?j probl?m.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_04");	//UD?L?M z toho TV?J probl?m. Chce? tedy z?silku - ok, m??e? si ji koupit.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_05");	//Vem si zlato od Estbana nebo Ravena nebo jin?ho, je mi to jedno, ale kdo n?co chce, ten si za to zaplat?.
};


instance DIA_Addon_Juan_AufsMaul(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_AufsMaul_Condition;
	information = DIA_Addon_Juan_AufsMaul_Info;
	permanent = FALSE;
	description = "Nejsem esteban?v poskok!";
};


func int DIA_Addon_Juan_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_AufsMaul_15_00");	//Nejsem esteban?v poskok!
	AI_Output(self,other,"DIA_Addon_Juan_AufsMaul_13_01");	//Oh? Dobr? ...  eh ... po?kej! Post?j tu na chv?li...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Juan_Trade(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 99;
	condition = DIA_Addon_Juan_Trade_Condition;
	information = DIA_Addon_Juan_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Juan_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_Trade_Info()
{
	B_Say(other,self,"$TRADE_3");
};

