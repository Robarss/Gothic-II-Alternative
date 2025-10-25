
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
	description = "Co je nového?";
};


func int DIA_Addon_TAL_BDT_13_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Hi_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_01");	//Buď tě zvíře sní, nebo tě sní zvíře.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_02");	//Tahle bažina bude našim hrobem ...
};


instance DIA_Addon_TAL_BDT_13_Tal(C_Info)
{
	nr = 3;
	condition = DIA_Addon_TAL_BDT_13_Tal_Condition;
	information = DIA_Addon_TAL_BDT_13_Tal_Info;
	permanent = TRUE;
	description = "Co víš o tomhle údolí?";
};


func int DIA_Addon_TAL_BDT_13_Tal_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Tal_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Tal_15_00");	//Co víš o tomhle údolí?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_01");	//Tady je hodně starých krámů. Raven nám nařídil sesbírat všechno.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_02");	//Nemám tušení, co s tím chtěl, ale nikdo komu zůstal aspoň malej mozek, nebude riskovat krk kvůli několika kamenným deskám ...
};


instance DIA_Addon_TAL_BDT_13_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_TAL_BDT_13_News_Condition;
	information = DIA_Addon_TAL_BDT_13_News_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_Addon_TAL_BDT_13_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_News_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_News_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_01");	//Máme se líp než tihle piráti.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_02");	//Zásobovali nás vězni, ale nikdy za to nedostali ani minci. Není divu, že jsou naštavný.
	if(BDT_13_einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_03");	//Ale proč by to dělali? Útočili na tábor? (smích) HAHAHA.
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

