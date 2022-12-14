
instance DIA_Addon_Cronos_EXIT(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 999;
	condition = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cronos_Hallo(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_Hallo_Condition;
	information = DIA_Addon_Cronos_Hallo_Info;
	description = "Mohu t? vyru?it?";
};


func int DIA_Addon_Cronos_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Hallo_15_00");	//Mohu t? vyru?it?
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_01");	//To jsi TY? Nemyslel jsem, ?e t? je?t? n?kdy uv?d?m.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_02");	//M?? odvahu tu zase ukazovat sv?j ksicht. Byly ?asy, kdy jsme t? cht?li st?hnout z k??e.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_03");	//M??e? b?t r?d, p?r t?dn? a ka?d? cht?l, aby byl zase klid.
};


instance DIA_Addon_Cronos_WasMachstdu(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_WasMachstdu_Condition;
	information = DIA_Addon_Cronos_WasMachstdu_Info;
	description = "Co to d?l???";
};


func int DIA_Addon_Cronos_WasMachstdu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_WasMachstdu_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WasMachstdu_15_00");	//Co to d?l???
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_01");	//(zmaten?) M?m ?kolem je zjistit v?ce o str??c?ch chr?mu.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_02");	//Maj? kamenit? t?lo, to d?v? smysl. Tyhle kamenn? str??ci maj? nezn?m?, d? se ??ct v?jime?n? schopnosti.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_03");	//Jednu chv?li nehnut? stoj? a ani se nestihne? nadechnout a u? se ??t? na tebe a ni?? v?e, co jim p?ijde do cesty, jsou n???m posedl?.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_04");	//Nep?i?el jsem je?t? na jejich ??d?c? s?lu, ale jedno je jist?. Jsou magick?ho p?vodu.
};


instance DIA_Addon_Cronos_Waechter(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_Waechter_Condition;
	information = DIA_Addon_Cronos_Waechter_Info;
	description = "Pov?dej mi o kamenn?ch str??c?ch.";
};


func int DIA_Addon_Cronos_Waechter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_Waechter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Waechter_15_00");	//Pov?dej mi o kamenn?ch str??c?ch.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_01");	//Ne?eknu ti mnoho. Nane?t?st? jsme je zni?ili. Nyn? jsou ne?kodn?.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_02");	//Sotva jsme sem p?i?li a u? jsme od nich dost?vali.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_03");	//??d? je prazvla?tn? s?la, ale to nen? d?le?it?. M?m strach, ?e na druh? stran? port?lu na n?s ?ek? je?t? n?co hor??ho.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_04");	//Tohle mus? b?t cesta k jejich ??d?c? s?le, ale pozor vypadaj? jako oby?ejn? sochy - ned??-li si pozor, m??ou ti p?kn? zatopit.
};


instance DIA_Addon_Cronos_NW_Trade(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_NW_Trade_Condition;
	information = DIA_Addon_Cronos_NW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Nem?l bys pro m? n?jak? vybaven??";
};


func int DIA_Addon_Cronos_NW_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
};


var int DIA_Addon_Cronos_NW_Trade_OneTime;

func void DIA_Addon_Cronos_NW_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Addon_Cronos_NW_Trade_15_00");	//Nem?l bys pro m? n?jak? vybaven??
	if(DIA_Addon_Cronos_NW_Trade_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_01");	//Pro? ne? Kdy? si to dob?e zapamatuji, n?co ?asem obstar?m.
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_02");	//Tak co bys r?d?
	Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
	B_LogEntry(Topic_OutTrader,LogText_Addon_CronosTrade);
};

