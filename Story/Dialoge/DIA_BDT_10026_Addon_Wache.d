
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
	description = "Co se děje?";
};


func int DIA_Addon_10026_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Wache_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Hi_15_00");	//Co se děje?
	if(Sklaven_Flucht == FALSE)
	{
		CreateInvItems(self,ItFo_Bacon,1);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_01");	//Škoda, že jich pár chcíplo. Budeme muset někde najít nové.
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_02");	//Tito chlapi jsou úplně vyčerpaní. Mohlo by to být tím, že dostávají málo najíst. (směje se)
		B_UseItem(self,ItFo_Bacon);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_03");	//Nicméně raději bych je poslal zpátky do dolu, než jim dávat maso.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_04");	//Ti minulí otroci odpadli příliš brzy. Tak to vypadá, že budeme muset kopáče znovu ztlouct.
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
	description = "Co víš o kryptě?";
};


func int DIA_Addon_10026_Wache_Gruft_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Wache_Gruft_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Gruft_15_00");	//Co víš o kryptě?
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_01");	//Na konci této cesty je krypta.
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_02");	//(bez starostí) Sleduj mrtvé těla a najdeš to.
};

