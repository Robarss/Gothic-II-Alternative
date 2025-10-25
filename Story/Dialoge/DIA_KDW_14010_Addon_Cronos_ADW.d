
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
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_00");	//Ještě že jsi tu. Máme strašný strach.
	AI_Output(other,self,"DIA_Addon_Cronos_ADWHello_15_01");	//To sotva. Co se děje?
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_02");	//Měj očí nastražené a jílec při ruce, je tu velmi nebezpečno.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_03");	//Některá zvířata jsme předtím nikdy neviděli.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_04");	//Nedaleko je rozlehlá tůň, může tam být už stovky let.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_05");	//Nebylo dne, kdy na nás bestie od tůně neútočily.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_06");	//Varuji tě, buď opatrný kdykoli kolem procházíš.
};


instance DIA_Addon_Cronos_WaechterADW(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 5;
	condition = DIA_Addon_Cronos_WaechterADW_Condition;
	information = DIA_Addon_Cronos_WaechterADW_Info;
	description = "Víš něco nového ohledně kamenných strážců?";
};


func int DIA_Addon_Cronos_WaechterADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_WaechterADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WaechterADW_15_00");	//Víš něco nového ohledně kamenných strážců?
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_01");	//Část jsme jich zneškodnili.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_02");	//Stojí jako kamenné sochy a za boha se nepohnou.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_03");	//Vzhled dokáže oklamat. Octneš-li se moc blízko, zaútočí na tebe.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_04");	//Tedy není pochybností. Zdroj jejich síly musí být někde tady, kdekoli.
};


instance DIA_Addon_Cronos_ADW_Trade(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 99;
	condition = DIA_Addon_Cronos_ADW_Trade_Condition;
	information = DIA_Addon_Cronos_ADW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Chtěl bych něco koupit.";
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

