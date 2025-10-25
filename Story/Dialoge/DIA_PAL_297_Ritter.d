
instance DIA_PAL_297_EXIT(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 999;
	condition = DIA_PAL_297_EXIT_Condition;
	information = DIA_PAL_297_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_297_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_297_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_297_TRESPAS(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 2;
	condition = DIA_PAL_297_TRESPAS_Condition;
	information = DIA_PAL_297_TRESPAS_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_PAL_297_TRESPAS_Condition()
{
	return TRUE;
};

func void DIA_PAL_297_TRESPAS_Info()
{
	AI_Output(other,self,"DIA_PAL_297_TRESPAS_15_00");	//Jak se vede?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_01");	//Okolí je hodně nebezpečné, takže by ses měl možná vrátit - rozhodně nechceme, aby se ti něco stalo.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_02");	//Vstoupit do údolí chce hodně odvahy. Alespoň že u sebe máš dostatek léčivých lektvarů.
	};
};


instance DIA_Addon_PAL_297_Rangerbandits(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 5;
	condition = DIA_Addon_PAL_297_Rangerbandits_Condition;
	information = DIA_Addon_PAL_297_Rangerbandits_Info;
	description = "Prošli tudy v poslední době nějací banditi?";
};


func int DIA_Addon_PAL_297_Rangerbandits_Condition()
{
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_PAL_297_Rangerbandits_Info()
{
	AI_Output(other,self,"DIA_Addon_PAL_297_Rangerbandits_15_00");	//Prošli tudy v poslední době nějací banditi?
	AI_Output(self,other,"DIA_Addon_PAL_297_Rangerbandits_04_01");	//Nevím o čem to mluvíš. Za tu dobu, co jsme tu na stráži tudy nikdo neprošel. A už vůbec ne nikdo z těch všivých banditů.
	AI_Output(self,other,"DIA_Addon_PAL_297_Rangerbandits_04_02");	//Farmáři na otázky moc odpovídat nechtějí. Možná něco zahlédli.
};

