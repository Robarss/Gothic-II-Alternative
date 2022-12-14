
instance DIA_Addon_HammerPirate_EXIT(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 999;
	condition = DIA_Addon_HammerPirate_EXIT_Condition;
	information = DIA_Addon_HammerPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_HammerPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_HammerPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_HammerPirate_Hello(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 1;
	condition = DIA_Addon_HammerPirate_Hello_Condition;
	information = DIA_Addon_HammerPirate_Hello_Info;
	permanent = TRUE;
	description = "V?echno v po??dku?";
};


func int DIA_Addon_HammerPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_HammerPirate_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_Hello_15_00");	//V?echno v po??dku?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(C_TowerBanditsDead() == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_01");	//Dostali jsme je! Ti bastardi byli bez ?ance!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_02");	//Ok, poj?me to skoncovat!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_03");	//Ne! Nem?m r?d rva?ky!
	};
};


instance DIA_Addon_HammerPirate_Anheuern(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 11;
	condition = DIA_Addon_HammerPirate_Anheuern_Condition;
	information = DIA_Addon_HammerPirate_Anheuern_Info;
	permanent = FALSE;
	description = "M?l bys mi pomoci.";
};


func int DIA_Addon_HammerPirate_Anheuern_Condition()
{
	if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_Anheuern_Info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_00");	//Nic ne??kej! Cht?l jsi, abych s tebou bojoval proti t?m bandit?m!
	AI_Output(other,self,"DIA_Addon_PIR_6_JoinHenry_15_08");	//Dostals je.
	if(!Npc_IsDead(SawPirate))
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_01");	//Pro? se nezept?? t?ch t?pk? na pile?
	};
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_02");	//J? ... nechci ??dn? probl?my ...
};


instance DIA_Addon_HammerPirate_ComeOn(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 12;
	condition = DIA_Addon_HammerPirate_ComeOn_Condition;
	information = DIA_Addon_HammerPirate_ComeOn_Info;
	permanent = TRUE;
	description = "Poj? se mnou.";
};


func int DIA_Addon_HammerPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Henry_FreeBDTTower == LOG_Running) && (C_TowerBanditsDead() == FALSE) && Npc_KnowsInfo(other,DIA_Addon_HammerPirate_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_ComeOn_15_00");	//Poj? se mnou.
	if(SawPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_01");	//Henry pot?ebuje jednoho z n?s TADY ...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_02");	//Vra?me se trochu bl?? k t?boru.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_03");	//(vzdych?) no jo ...
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_HammerPirate_GoHome(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 13;
	condition = DIA_Addon_HammerPirate_GoHome_Condition;
	information = DIA_Addon_HammerPirate_GoHome_Info;
	permanent = TRUE;
	description = "U? t? nepot?ebuju.";
};


func int DIA_Addon_HammerPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_GoHome_15_00");	//U? t? nepot?ebuju.
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_01");	//Jak chce? ...
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_HammerPirate_TooFar(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_HammerPirate_TooFar_Condition;
	information = DIA_Addon_HammerPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_HammerPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_TooFar_07_01");	//Jestli tam chce? j?t, necht?j, abych t? musel zastavit ...
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_02");	//Rad?i se vr?t?m.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_HammerPirate_Success(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_HammerPirate_Success_Condition;
	information = DIA_Addon_HammerPirate_Success_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_HammerPirate_Success_Condition()
{
	if((C_TowerBanditsDead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_Success_Info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_01");	//V?? co, p?em??lel jsem o tom. M?? vlastn? pravdu!
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_02");	//Jdu zase do t?bora. Uvid?me se!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

