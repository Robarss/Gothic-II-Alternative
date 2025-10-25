
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
	description = "Mohu tě vyrušit?";
};


func int DIA_Addon_Cronos_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Hallo_15_00");	//Mohu tě vyrušit?
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_01");	//To jsi TY? Nemyslel jsem, že tě ještě někdy uvídím.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_02");	//Máš odvahu tu zase ukazovat svůj ksicht. Byly časy, kdy jsme tě chtěli stáhnout z kůže.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_03");	//Můžeš být rád, pár týdnů a každý chtěl, aby byl zase klid.
};


instance DIA_Addon_Cronos_WasMachstdu(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_WasMachstdu_Condition;
	information = DIA_Addon_Cronos_WasMachstdu_Info;
	description = "Co to děláš?";
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
	AI_Output(other,self,"DIA_Addon_Cronos_WasMachstdu_15_00");	//Co to děláš?
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_01");	//(zmateně) Mým úkolem je zjistit více o strážcích chrámu.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_02");	//Mají kamenité tělo, to dává smysl. Tyhle kamenní strážci mají neznámé, dá se říct výjimečné schopnosti.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_03");	//Jednu chvíli nehnutě stojí a ani se nestihneš nadechnout a už se řítí na tebe a ničí vše, co jim přijde do cesty, jsou něčím posedlí.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_04");	//Nepřišel jsem ještě na jejich řídící sílu, ale jedno je jisté. Jsou magického původu.
};


instance DIA_Addon_Cronos_Waechter(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_Waechter_Condition;
	information = DIA_Addon_Cronos_Waechter_Info;
	description = "Povídej mi o kamenných strážcích.";
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
	AI_Output(other,self,"DIA_Addon_Cronos_Waechter_15_00");	//Povídej mi o kamenných strážcích.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_01");	//Neřeknu ti mnoho. Naneštěstí jsme je zničili. Nyní jsou neškodní.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_02");	//Sotva jsme sem přišli a už jsme od nich dostávali.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_03");	//Řídí je prazvlaštní síla, ale to není důležité. Mám strach, že na druhé straně portálu na nás čeká ještě něco horšího.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_04");	//Tohle musí být cesta k jejich řídící síle, ale pozor vypadají jako obyčejné sochy - nedáš-li si pozor, můžou ti pěkně zatopit.
};


instance DIA_Addon_Cronos_NW_Trade(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_NW_Trade_Condition;
	information = DIA_Addon_Cronos_NW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Neměl bys pro mě nějaký vybavení?";
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
	AI_Output(other,self,"DIA_Addon_Cronos_NW_Trade_15_00");	//Neměl bys pro mě nějaký vybavení?
	if(DIA_Addon_Cronos_NW_Trade_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_01");	//Proč ne? Když si to dobře zapamatuji, něco časem obstarám.
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_02");	//Tak co bys rád?
	Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
	B_LogEntry(Topic_OutTrader,LogText_Addon_CronosTrade);
};

