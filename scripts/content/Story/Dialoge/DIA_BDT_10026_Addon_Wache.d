
instance DIA_Addon_BDT_10026_Wache_EXIT(C_Info)
{
	npc = BDT_10026_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10026_Wache_EXIT_Condition;
	information = DIA_Addon_10026_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10026_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10026_Wache_Hi(C_Info)
{
	npc = BDT_10026_Addon_Wache;
	nr = 99;
	condition = DIA_Addon_10026_Wache_Hi_Condition;
	information = DIA_Addon_10026_Wache_Hi_Info;
	permanent = TRUE;
	description = "Co se d?je?";
};


func int DIA_Addon_10026_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Wache_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Hi_15_00");	//Co se d?je?
	if(Sklaven_Flucht == FALSE)
	{
		CreateInvItems(self,ItFo_Bacon,1);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_01");	//?koda, ?e jich p?r chc?plo. Budeme muset n?kde naj?t nov?.
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_02");	//Tito chlapi jsou ?pln? vy?erpan?. Mohlo by to b?t t?m, ?e dost?vaj? m?lo naj?st. (sm?je se)
		B_UseItem(self,ItFo_Bacon);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_03");	//Nicm?n? rad?ji bych je poslal zp?tky do dolu, ne? jim d?vat maso.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_04");	//Ti minul? otroci odpadli p??li? brzy. Tak to vypad?, ?e budeme muset kop??e znovu ztlouct.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10026_Wache_Gruft(C_Info)
{
	npc = BDT_10026_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10026_Wache_Gruft_Condition;
	information = DIA_Addon_10026_Wache_Gruft_Info;
	permanent = TRUE;
	description = "Co v?? o krypt??";
};


func int DIA_Addon_10026_Wache_Gruft_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Wache_Gruft_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Gruft_15_00");	//Co v?? o krypt??
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_01");	//Na konci t?to cesty je krypta.
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_02");	//(bez starost?) Sleduj mrtv? t?la a najde? to.
};

