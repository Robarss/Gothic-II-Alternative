
instance DIA_Addon_BL_BDT_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_BL_BDT_1_EXIT_Condition;
	information = DIA_Addon_BL_BDT_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_BL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BL_BDT_1_Chef(C_Info)
{
	nr = 2;
	condition = DIA_Addon_BL_BDT_1_Chef_Condition;
	information = DIA_Addon_BL_BDT_1_Chef_Info;
	permanent = TRUE;
	description = "Kdo tomu tady vel??";
};


func int DIA_Addon_BL_BDT_1_Chef_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_Chef_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Chef_15_00");	//Kdo je tady ??f?
	if(RavenIsDead == TRUE)
	{
		if(Npc_IsDead(Thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_01");	//Hodn? se jich tu u? vyst??dalo ... nem??e? je v?echny zaregistrovat.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_02");	//V???m, ?e Thorus je te? n?? v?dce ...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_03");	//Raven je n?? v?dce. Dovedl n?s sem a zalo?il t?bor.
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_04");	//Kontroluje d?l, jinak by se ti psi tady mezi sebou pozab?jeli u? d?vno kv?li zlatu.
	};
};


instance DIA_Addon_BL_BDT_1_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_BL_BDT_1_Lager_Condition;
	information = DIA_Addon_BL_BDT_1_Lager_Info;
	permanent = FALSE;
	description = "Co v?? o dolu?";
};


func int DIA_Addon_BL_BDT_1_Lager_Condition()
{
	if((Sklaven_Flucht == FALSE) || !Npc_IsDead(Raven))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_1_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager_15_00");	//Co v?? o dolu?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_01");	//Jak se uk?zalo, ?e je tady zlat? d?l, tak se tady v?ichni navz?jem celkem sjednotili.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_02");	//Raven pak pozab?jel ty nejhor?? vzbou?ence a jejich kosti vyhodil z dolu.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_03");	//Od t? doby nikdo nem??e do vy??? ?tvrti. Jinak by byl vzat jako v?ze? a posl?n kopat do dolu.
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_BL_BDT_1_Lager2(C_Info)
{
	nr = 3;
	condition = DIA_Addon_BL_BDT_1_Lager2_Condition;
	information = DIA_Addon_BL_BDT_1_Lager2_Info;
	permanent = TRUE;
	description = "Co v?? o t?bo?e?";
};


func int DIA_Addon_BL_BDT_1_Lager2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BL_BDT_1_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_1_Lager2_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager2_15_00");	//Co v?? o t?bo?e?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_01");	//Kdy? na n?koho za?to???, V?ICHNI po tob? p?jdou.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_02");	//Pokud nem?? dobr? d?vod. To t? pak nebude nikdo trestat.
};


instance DIA_Addon_BL_BDT_1_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_BL_BDT_1_News_Condition;
	information = DIA_Addon_BL_BDT_1_News_Info;
	permanent = TRUE;
	description = "N?co nov?ho? ";
};


func int DIA_Addon_BL_BDT_1_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_News_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_News_15_00");	//N?co nov?ho?
	if(RavenIsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_01");	//Raven je mrtv?. Co te? budeme d?lat?
	};
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_02");	//Pir?ti n?s u? necht?j? p?ev??et, proto?e jsme jim za to neplatili.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_03");	//M?li bychom jednoho nebo dva znich prop?chnout, to by jsme pak m?li zaji?t?n? odvoz.
};


instance DIA_Addon_BL_BDT_1_Sklaven(C_Info)
{
	nr = 5;
	condition = DIA_Addon_BL_BDT_1_Sklaven_Condition;
	information = DIA_Addon_BL_BDT_1_Sklaven_Info;
	permanent = TRUE;
	description = "Co v?? o v?zn?ch?";
};


func int DIA_Addon_BL_BDT_1_Sklaven_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BL_BDT_1_Lager) && ((Sklaven_Flucht == FALSE) || (RavenIsDead == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_1_Sklaven_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_00");	//Co v?? o v?zn?ch?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_01");	//Raven cht?l n?co vykopat. Nejprve to m?li d?lat banditi, ale mnoh?m se to nel?bilo.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_02");	//To byl ten d?vod, pro? pot?eboval v?zn? - kdy? zem?eli oni, nikomu to nevadilo.
	if(BDT_1_Ausbuddeln == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_03");	//Co cht?l Raven vykopat?
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_04");	//Nem?m tu?en?, ale ?ekl bych, ?e n?co v?c ne? zlato.
		BDT_1_Ausbuddeln = TRUE;
	};
};

func void B_AssignAmbientInfos_Addon_BL_BDT_1(var C_Npc slf)
{
	DIA_Addon_BL_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Chef.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_News.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Sklaven.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager2.npc = Hlp_GetInstanceID(slf);
};

