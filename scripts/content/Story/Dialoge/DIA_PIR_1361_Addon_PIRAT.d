
instance DIA_Addon_SawPirate_EXIT(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 999;
	condition = DIA_Addon_SawPirate_EXIT_Condition;
	information = DIA_Addon_SawPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_SawPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_SawPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_SawPirate_Hello(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 1;
	condition = DIA_Addon_SawPirate_Hello_Condition;
	information = DIA_Addon_SawPirate_Hello_Info;
	permanent = TRUE;
	description = "Jak to vypad??";
};


func int DIA_Addon_SawPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_SawPirate_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_Hello_15_00");	//Jak to vypad??
	AI_Output(self,other,"DIA_Addon_SawPirate_Hello_09_01");	//P?esta? kecat!
};


instance DIA_Addon_SawPirate_Anheuern(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 11;
	condition = DIA_Addon_SawPirate_Anheuern_Condition;
	information = DIA_Addon_SawPirate_Anheuern_Info;
	permanent = FALSE;
	description = "Jsi jedn?m z Henryho lid??";
};


func int DIA_Addon_SawPirate_Anheuern_Condition()
{
	if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_00");	//Jsi jedn?m z Henryho lid??
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_01");	//Ne. J? jenom ?e?u tohle d?evo pro z?bavu, v??? Opravdu.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_02");	//Co se d?je? Henry ?ekl, co m?? d?lat?
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_04");	//Ano. Pot?ebuji se zbavit n?kolika bandit?.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_03");	//(Obran?) ?le n?! NED?VEJ se na m? tak! Nechci s t?m m?t nic spole?n?ho.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_04");	//Rad?ji m? nech ?ezat, ano?
};


var int SawPirate_ComeOn_Once;

instance DIA_Addon_SawPirate_ComeOn(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 12;
	condition = DIA_Addon_SawPirate_ComeOn_Condition;
	information = DIA_Addon_SawPirate_ComeOn_Info;
	permanent = TRUE;
	description = "Poj? d?l.";
};


func int DIA_Addon_SawPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Henry_FreeBDTTower == LOG_Running) && (C_TowerBanditsDead() == FALSE) && Npc_KnowsInfo(other,DIA_Addon_SawPirate_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_ComeOn_15_00");	//Poj? d?l.
	if(HammerPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_01");	//Pro?? U? m?? p?r lid? pobl?? ...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_04");	//Nejd??ve poj?me trochu zp?t k t?boru ...
		AI_StopProcessInfos(self);
	}
	else if(!Npc_IsDead(HammerPirate) && (SawPirate_ComeOn_Once == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_02");	//(Pro sebe) Pro? se nezeptal ostatn?ch ...
		SawPirate_ComeOn_Once = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_03");	//(povzdech) Ach jo ...
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_SawPirate_GoHome(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 13;
	condition = DIA_Addon_SawPirate_GoHome_Condition;
	information = DIA_Addon_SawPirate_GoHome_Info;
	permanent = TRUE;
	description = "U? t? d?le nepot?ebuji.";
};


func int DIA_Addon_SawPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_GoHome_15_00");	//U? t? d?le nepot?ebuji.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_01");	//Tak tedy budu ?ezat trochu d?le!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_SawPirate_TooFar(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_SawPirate_TooFar_Condition;
	information = DIA_Addon_SawPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_SawPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_SawPirate_TooFar_09_01");	//Jsme moc daleko od t?bora.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_02");	//To m? prost? odhod?. Jednou se vr?t?m.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_SawPirate_Success(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_SawPirate_Success_Condition;
	information = DIA_Addon_SawPirate_Success_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_SawPirate_Success_Condition()
{
	if((C_TowerBanditsDead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_Success_Info()
{
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_01");	//V?? co, mysl?m, ?e jsi kret?n!
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_02");	//Vr?t?m se do t?bora. Doufejme, ?e se u? nikdy neuvid?me!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

