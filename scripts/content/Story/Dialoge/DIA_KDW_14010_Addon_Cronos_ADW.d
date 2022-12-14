
instance DIA_Addon_Cronos_ADW_EXIT(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 999;
	condition = DIA_Addon_Cronos_ADW_EXIT_Condition;
	information = DIA_Addon_Cronos_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cronos_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cronos_ADWHello(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 1;
	condition = DIA_Addon_Cronos_ADWHello_Condition;
	information = DIA_Addon_Cronos_ADWHello_Info;
	important = TRUE;
};


func int DIA_Addon_Cronos_ADWHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_ADWHello_Info()
{
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_00");	//Je?t? ?e jsi tu. M?me stra?n? strach.
	AI_Output(other,self,"DIA_Addon_Cronos_ADWHello_15_01");	//To sotva. Co se d?je?
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_02");	//M?j o?? nastra?en? a j?lec p?i ruce, je tu velmi nebezpe?no.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_03");	//N?kter? zv??ata jsme p?edt?m nikdy nevid?li.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_04");	//Nedaleko je rozlehl? t??, m??e tam b?t u? stovky let.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_05");	//Nebylo dne, kdy na n?s bestie od t?n? ne?to?ily.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_06");	//Varuji t?, bu? opatrn? kdykoli kolem proch?z??.
};


instance DIA_Addon_Cronos_WaechterADW(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 5;
	condition = DIA_Addon_Cronos_WaechterADW_Condition;
	information = DIA_Addon_Cronos_WaechterADW_Info;
	description = "V?? n?co nov?ho ohledn? kamenn?ch str??c??";
};


func int DIA_Addon_Cronos_WaechterADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_WaechterADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WaechterADW_15_00");	//V?? n?co nov?ho ohledn? kamenn?ch str??c??
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_01");	//??st jsme jich zne?kodnili.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_02");	//Stoj? jako kamenn? sochy a za boha se nepohnou.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_03");	//Vzhled dok??e oklamat. Octne?-li se moc bl?zko, za?to?? na tebe.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_04");	//Tedy nen? pochybnost?. Zdroj jejich s?ly mus? b?t n?kde tady, kdekoli.
};


instance DIA_Addon_Cronos_ADW_Trade(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 99;
	condition = DIA_Addon_Cronos_ADW_Trade_Condition;
	information = DIA_Addon_Cronos_ADW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Cht?l bych n?co koupit.";
};


func int DIA_Addon_Cronos_ADW_Trade_Condition()
{
	return TRUE;
};


var int DIA_Addon_Cronos_ADW_Trade_OneTime;

func void DIA_Addon_Cronos_ADW_Trade_Info()
{
	B_GiveTradeInv(self);
	B_Say(other,self,"$TRADE_1");
};

