
instance DIA_PAL_263_EXIT(C_Info)
{
	npc = PAL_263_Wache;
	nr = 999;
	condition = DIA_PAL_263_EXIT_Condition;
	information = DIA_PAL_263_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_263_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_263_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_263_PERM(C_Info)
{
	npc = PAL_263_Wache;
	nr = 2;
	condition = DIA_PAL_263_PERM_Condition;
	information = DIA_PAL_263_PERM_Info;
	permanent = TRUE;
	description = "Podej hl??en?, voj?ku!";
};


func int DIA_PAL_263_PERM_Condition()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_PAL_263_PERM_Info()
{
	AI_Output(other,self,"DIA_PAL_263_PERM_15_00");	//Podej hl??en?, voj?ku!
	AI_Output(self,other,"DIA_PAL_263_PERM_04_01");	//Ano, pane! Dr??me pozice dle rozkaz?. ??dn? dal?? ztr?ty. Proviant doch?z?, sk?eti se dr?? zp?tky.
	AI_Output(self,other,"DIA_PAL_263_PERM_04_02");	//Posledn? dra?? ?tok kompletn? zni?il vn?j?? opevn?n?. Od t? doby se ale nic zvl??tn?ho nestalo.
	AI_Output(other,self,"DIA_PAL_263_PERM_15_03");	//Dobr?, pokra?uj.
};


instance DIA_PAL_263_PERM_OTH(C_Info)
{
	npc = PAL_263_Wache;
	nr = 2;
	condition = DIA_PAL_263_PERM_OTH_Condition;
	information = DIA_PAL_263_PERM_OTH_Info;
	permanent = TRUE;
	description = "Jak to vypad??";
};


func int DIA_PAL_263_PERM_OTH_Condition()
{
	if((hero.guild != GIL_MIL) || (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_PAL_263_PERM_OTH_Info()
{
	AI_Output(other,self,"DIA_PAL_263_PERM_OTH_15_00");	//Jak to vypad??
	AI_Output(self,other,"DIA_PAL_263_PERM_OTH_04_01");	//M?me situaci pod kontrolou. Ned?lej si vr?sky, civile. V?echno bude v po??dku.
};

