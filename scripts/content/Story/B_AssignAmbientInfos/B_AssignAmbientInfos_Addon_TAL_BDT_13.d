
instance DIA_Addon_TAL_BDT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_TAL_BDT_13_EXIT_Condition;
	information = DIA_Addon_TAL_BDT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_TAL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_TAL_BDT_13_Hi(C_Info)
{
	nr = 2;
	condition = DIA_Addon_TAL_BDT_13_Hi_Condition;
	information = DIA_Addon_TAL_BDT_13_Hi_Info;
	permanent = TRUE;
	description = "Co je nov?ho?";
};


func int DIA_Addon_TAL_BDT_13_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Hi_15_00");	//Co je nov?ho?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_01");	//Bu? t? zv??e sn?, nebo t? sn? zv??e.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_02");	//Tahle ba?ina bude na?im hrobem ...
};


instance DIA_Addon_TAL_BDT_13_Tal(C_Info)
{
	nr = 3;
	condition = DIA_Addon_TAL_BDT_13_Tal_Condition;
	information = DIA_Addon_TAL_BDT_13_Tal_Info;
	permanent = TRUE;
	description = "Co v?? o tomhle ?dol??";
};


func int DIA_Addon_TAL_BDT_13_Tal_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Tal_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Tal_15_00");	//Co v?? o tomhle ?dol??
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_01");	//Tady je hodn? star?ch kr?m?. Raven n?m na??dil sesb?rat v?echno.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_02");	//Nem?m tu?en?, co s t?m cht?l, ale nikdo komu z?stal aspo? malej mozek, nebude riskovat krk kv?li n?kolika kamenn?m desk?m ...
};


instance DIA_Addon_TAL_BDT_13_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_TAL_BDT_13_News_Condition;
	information = DIA_Addon_TAL_BDT_13_News_Info;
	permanent = TRUE;
	description = "Co je nov?ho?";
};


func int DIA_Addon_TAL_BDT_13_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_News_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_News_15_00");	//Co je nov?ho?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_01");	//M?me se l?p ne? tihle pir?ti.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_02");	//Z?sobovali n?s v?zni, ale nikdy za to nedostali ani minci. Nen? divu, ?e jsou na?tavn?.
	if(BDT_13_einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_03");	//Ale pro? by to d?lali? ?to?ili na t?bor? (sm?ch) HAHAHA.
		BDT_13_einmal = TRUE;
	};
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_13(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_Hi.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_Tal.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_News.npc = Hlp_GetInstanceID(slf);
};

