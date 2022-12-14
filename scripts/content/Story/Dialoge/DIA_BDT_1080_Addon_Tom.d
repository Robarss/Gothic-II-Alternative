
instance DIA_Addon_Tom_EXIT(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 999;
	condition = DIA_Addon_Tom_EXIT_Condition;
	information = DIA_Addon_Tom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Tom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Tom_PICKPOCKET(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 900;
	condition = DIA_Addon_Tom_PICKPOCKET_Condition;
	information = DIA_Addon_Tom_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Tom_PICKPOCKET_Condition()
{
	return C_Beklauen(40,52);
};

func void DIA_Addon_Tom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Tom_PICKPOCKET,Dialog_Back,DIA_Addon_Tom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Tom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Tom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
};

func void DIA_Addon_Tom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
};


instance DIA_Addon_Tom_HI(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 1;
	condition = DIA_Addon_Tom_HI_Condition;
	information = DIA_Addon_Tom_HI_Info;
	permanent = FALSE;
	description = "Pro? tu sed???";
};


func int DIA_Addon_Tom_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Tom_HI_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_00");	//Pro? tu sed???
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_01");	//Dostal jsem se do probl?m?. Te? m??e b?t chozen? do t?bora ?patn? n?pad.
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_02");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_03");	//M?l jsem slu?n? spojen? s n?kolika pir?ty, v???
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_04");	//Poka?d? jsem potkal chlapy nedaleko t?bora kv?li obchodu.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_05");	//Chlape, kupoval jsem proviant pro polovinu lid? z t?bora. 'Tome, obstarej mi tohle - Tome, obstarej mi tamto'.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_06");	//A potom to bylo v?e ztraceno kv?li tomu zatracen?mu Estebanovi!
};


instance DIA_Addon_Tom_Juan(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 2;
	condition = DIA_Addon_Tom_Juan_Condition;
	information = DIA_Addon_Tom_Juan_Info;
	permanent = FALSE;
	description = "Jak to?";
};


func int DIA_Addon_Tom_Juan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Tom_HI))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_Juan_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Juan_15_00");	//Jak to?
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_01");	//Esteban poslal jednoho z jeho lid?, Juana. On n?s pozoroval.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_02");	//A potom, zrovna kdy? jsem smlouval obchod s pir?ty, ten chlap vylezl ze sv?ho ?krytu a srazil je k zemi.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_03");	//Chlap?e, ten chlap byl rychl?! Ale ne dost rychl?. Mohl jsem ut?ct.
	SC_Knows_JuanMurderedAngus = TRUE;
	B_LogEntry(TOPIC_Addon_KillJuan,"Tak je to Juan, kdo je zodpov?dn? za vra?du Hanka a Agnuse. P?epadl je a zabil je.");
};


instance DIA_Addon_Tom_Esteban(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 3;
	condition = DIA_Addon_Tom_Esteban_Condition;
	information = DIA_Addon_Tom_Esteban_Info;
	permanent = FALSE;
	description = "A od t? doby se tu schov?v???";
};


func int DIA_Addon_Tom_Esteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Tom_Juan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_Esteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Esteban_15_00");	//A od t? doby se tu schov?v???
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_01");	//Nejd??v jsem se vr?til do t?bora, abych to ?ekl Fiskovi, Hunovi a ostatn?m, kte?? ?ekali na z?silku.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_02");	//A Esteban je za to zodpov?dn?.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_03");	//Asi budu mrtv?, jetli Esteban zjist?, ?e jsem jim ?ekl, ?e je za t?m on.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_04");	//Proto nejdu zp?tky do t?bora.
	Tom_Tells = TRUE;
};


instance DIA_Addon_Tom_Dead(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 4;
	condition = DIA_Addon_Tom_Dead_Condition;
	information = DIA_Addon_Tom_Dead_Info;
	permanent = FALSE;
	description = "Esteban je mrtv?.";
};


func int DIA_Addon_Tom_Dead_Condition()
{
	if(Npc_IsDead(Esteban) && Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_Dead_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_00");	//Esteban je mrtv?.
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_01");	//Opravdu? Chlape, to je to, ?emu ??k?m ?t?st?!
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_02");	//Kdo ho zabil?
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_03");	//(?kleb? se) Noo, ?ekn?me jenom, ?e to byl n?kdo, koho zn?? ...
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_04");	//D?kuji mnohokr?t, ?e jsi sem za?el. Te? se m??u vr?tit do t?bora ...
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LAGER");
};


instance DIA_Addon_Tom_PERM(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 5;
	condition = DIA_Addon_Tom_PERM_Condition;
	information = DIA_Addon_Tom_PERM_Info;
	permanent = TRUE;
	description = "Je?t? n?co?";
};


func int DIA_Addon_Tom_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_PERM_15_00");	//Je?t? n?co?
	if(Npc_GetDistToWP(self,"BL_INN_05_B") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_01");	//Te? si m??u u??t pit? Luciin?ho drinku bez starost?.
	}
	else if(Npc_KnowsInfo(other,DIA_Addon_Tom_Dead))
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_02");	//Kone?n? se m??u vr?tit!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_03");	//Hm? Obvykle tu sed?m a po??t?m kameny ...
	};
};

