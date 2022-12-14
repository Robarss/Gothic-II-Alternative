
instance DIA_Addon_BL_BDT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_BL_BDT_13_EXIT_Condition;
	information = DIA_Addon_BL_BDT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_BL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_EXIT_Info()
{
	BDT_13_Nerver = 0;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BL_BDT_13_Chef(C_Info)
{
	nr = 2;
	condition = DIA_Addon_BL_BDT_13_Chef_Condition;
	information = DIA_Addon_BL_BDT_13_Chef_Info;
	permanent = TRUE;
	description = "Kdo tomu tady ??fuje?";
};


func int DIA_Addon_BL_BDT_13_Chef_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_Chef_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Chef_15_00");	//Kdo tomu tady ??fuje?
	if(RavenIsDead == TRUE)
	{
		if(Npc_IsDead(Thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_01");	//N?? skv?l? v?dce Thorus. Ud?l? z n?s boh??e!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_02");	//N?? skv?l? v?dce ... uh ... nev?m ...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_03");	//N?? skv?l? v?dce Raven. Ud?l? z n?s boh??e!
	};
};


instance DIA_Addon_BL_BDT_13_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_BL_BDT_13_Lager_Condition;
	information = DIA_Addon_BL_BDT_13_Lager_Info;
	permanent = TRUE;
	description = "Co v?? o t?bo?e?";
};


func int DIA_Addon_BL_BDT_13_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Lager_15_00");	//Co v?? o t?bo?e?
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_01");	//Promluv si se Snafem, kdy? chce? n?co v?d?t. Ten tlust? kucha? v? fakt hodn?.
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_02");	//Kdy? chce? n?co koupit, jdi za Fiskem. M??e sehnat t?m?? cokoliv ...
};


instance DIA_Addon_BL_BDT_13_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_BL_BDT_13_News_Condition;
	information = DIA_Addon_BL_BDT_13_News_Info;
	permanent = TRUE;
	description = "N?co nov?ho?";
};


func int DIA_Addon_BL_BDT_13_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_News_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_News_15_00");	//N?co nov?ho?
	if(RavenIsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_01");	//Raven je mrtv?. Te? u? se odtud NIKDY nedostaneme.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_02");	//Pir?ti st?hli ocasy a vydali se na plavbu.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_03");	//Tak?e tam na pl??i zbyla jen banda idiot?, kte?? nemaj? ani po??dnou lo?.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_04");	//Ba ani Beliar nev?, jak se z tohoto ostrova dostat.
	};
};


instance DIA_Addon_BL_BDT_13_Gold(C_Info)
{
	nr = 5;
	condition = DIA_Addon_BL_BDT_13_Gold_Condition;
	information = DIA_Addon_BL_BDT_13_Gold_Info;
	permanent = TRUE;
	description = "Jak m??u rychle dostat hodn? zlata?";
};


func int DIA_Addon_BL_BDT_13_Gold_Condition()
{
	if((MIS_Send_Buddler != LOG_Running) || (MIS_Send_Buddler != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_13_Gold_Info()
{
	BDT_13_Nerver = BDT_13_Nerver + 1;
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Gold_15_00");	//Jak m??u rychle dostat hodn? zlata?
	if(BDT_13_Nerver <= 2)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_01");	//Dobr? ot?zka. Nen? to d?vod, pro? tu v?ichni jsme?
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_02");	//Se?e? si ?erven? k?men od Thoruse a m??e? vstoupit do dolu.
	}
	else if(BDT_13_Kill == FALSE)
	{
		BDT_13_Nerver = 0;
		BDT_13_Kill = TRUE;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_03");	//D?l?? si srandu? Vypadni!
		AI_StopProcessInfos(self);
	}
	else
	{
		BDT_13_Nerver = 0;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_04");	//Tak?e - ji? nic, pane ڞasn?!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void B_AssignAmbientInfos_Addon_BL_BDT_13(var C_Npc slf)
{
	DIA_Addon_BL_BDT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Chef.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_News.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Gold.npc = Hlp_GetInstanceID(slf);
};

