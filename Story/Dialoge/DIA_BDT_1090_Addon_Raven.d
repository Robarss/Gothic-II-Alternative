
instance DIA_Addon_Raven_EXIT(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 999;
	condition = DIA_Addon_Raven_EXIT_Condition;
	information = DIA_Addon_Raven_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Raven_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Raven_Hi(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 1;
	condition = DIA_Addon_Raven_Hi_Condition;
	information = DIA_Addon_Raven_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Raven_Hi_Condition()
{
	if(RVN_START == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Raven_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_00");	//Á, podívejme se, kdo to sem přišel.
	if(C_BodyStateContains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_01");	//Můj pán mě varoval, že Innos na mě pošle svého oblíbence.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_02");	//Neočekával jsem tě ale tak brzy.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_03");	//Dobře, nyní když jsi tu tak rychle, můžu tě ujistit, že zemřeš stejně.
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Ty jsi ten, kdo zemře.",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Tys zaprodal svou duši Beliarovi!",DIA_Addon_Raven_Hi_Soul);
};

func void DIA_Addon_Raven_Hi_DU()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_00");	//Ty jsi ten, kdo zemře.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_04");	//(posměšně) Ty pro mě nejsi hrozba. Já ovládám Beliarův dráp.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_05");	//Já povedu draky na pevninu. Společně pak přinesem temnotu na svět lidí.
};

func void DIA_Addon_Raven_Hi_Soul()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_01");	//Tys zaprodal svou duši Beliarovi!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_06");	//Byl to ale dobrý obchod. Budu hlavním vůdcem jeho armád.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_07");	//A ty? Jaká je cena za TVOU duši?
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Okay, slyšel jsem dost. Pojďme na to ...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Dělám pouze to, co musí být uděláno.",DIA_Addon_Raven_Hi_only);
};

func void DIA_Addon_Raven_Hi_only()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_02");	//Dělám pouze to, co musí být uděláno.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_08");	//(usměvavě) Poslouchej ho. Opravdový služebníku Innosův! (hlasitý smích)
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Okay, slyšel jsem dost. Pojďme na to ...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Jsi si jistý, že jsem Innosův služebník?",DIA_Addon_Raven_Hi_Sure);
};

func void DIA_Addon_Raven_Hi_Sure()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_03");	//Jsi si jistý, že jsem Innosův služebník?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_09");	//Co? O čem to mluvíš?
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_04");	//A co když jsem služebník Adanose?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_10");	//(posměšně) Nesmysl!
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_05");	//Možná 'JÁ' také sloužím Beliarovi - nebo pouze sám sobě.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_11");	//(posmívá se) Dobře, když je to tak, pak pro mě nejsi vůbec nepřítel.
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Okay, slyšel jsem dost. Pojďme na to ...",DIA_Addon_Raven_Hi_Attack);
};

func void DIA_Addon_Raven_Hi_Attack()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_06");	//Dobrá, slyšel jsem dost. Pojďme na to ...
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_12");	//(posmívá se) Ty fakt chceš tak rychle zemřít? Dobrá, když to tak chceš ...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

