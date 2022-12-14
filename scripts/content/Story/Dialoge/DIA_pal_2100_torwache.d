
instance DIA_PAL_2100_TORWACHE_EXIT(C_Info)
{
	npc = pal_2100_torwache;
	nr = 999;
	condition = dia_pal_2100_torwache_exit_condition;
	information = dia_pal_2100_torwache_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2100_torwache_exit_condition()
{
	return TRUE;
};

func void dia_pal_2100_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string PAL_2100_CHECKPOINT = "NW_CITY_CASTLE_GUARD_01";

var int pal_2100_schonmalreingelassen;

instance DIA_PAL_2100_TORWACHE_FIRSTWARN(C_Info)
{
	npc = pal_2100_torwache;
	nr = 1;
	condition = dia_pal_2100_torwache_firstwarn_condition;
	information = dia_pal_2100_torwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_2100_torwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,PAL_205_Checkpoint) <= 550)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (PAL_205_schonmalreingelassen == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(PAL_205_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_2100_torwache_firstwarn_info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_00");	//STÁT!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_01");	//Porušil bych svou svatou povinnost, kdybych nechal vejít vraha.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_02");	//Jsi obvinìn z krádeže. Dokud naøèení trvá, nemùžeš vstoupit!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_03");	//Jsi známý jako rváè. Nepustím tì dovnitø.
		};
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_04");	//Bìž za lordem Andrem a urovnej celou tu záležitost!
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_05");	//Na radnici mohou vejít jen ti, kdo jsou v královských službách.
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	PrintScreen("",-1,-1,FONT_Screen,0);
};


instance DIA_PAL_2100_TORWACHE_SECONDWARN(C_Info)
{
	npc = pal_2100_torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_SecondWarn_Condition;
	information = DIA_PAL_205_Torwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_2100_torwache_secondwarn_condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_2100_torwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_SecondWarn_12_00");	//Ještì jeden krok a pøísahám k Innosovi, že to bude krok poslední!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2100_TORWACHE_ATTACK(C_Info)
{
	npc = pal_2100_torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_Attack_Condition;
	information = DIA_PAL_205_Torwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_2100_torwache_attack_condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_2100_torwache_attack_info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_PAL_2100_TORWACHE_PASSASMIL(C_Info)
{
	npc = pal_2100_torwache;
	nr = 3;
	condition = dia_pal_2100_torwache_passasmil_condition;
	information = dia_pal_2100_torwache_passasmil_info;
	permanent = TRUE;
	description = "Jsem èlenem domobrany.";
};


func int dia_pal_2100_torwache_passasmil_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_MIL) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_2100_torwache_passasmil_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMil_15_00");	//Jsem èlenem domobrany.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMil_12_01");	//Dobrá, mùžeš dovnitø.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2100_TORWACHE_PASSASMAGE(C_Info)
{
	npc = pal_2100_torwache;
	nr = 3;
	condition = dia_pal_2100_torwache_passasmage_condition;
	information = dia_pal_2100_torwache_passasmage_info;
	permanent = TRUE;
	description = "Jsem mág ohnì.";
};


func int dia_pal_2100_torwache_passasmage_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_KDF) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_2100_torwache_passasmage_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMage_15_00");	//Jsem mág ohnì.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMage_12_01");	//Ano, samozøejmì. Odpus, vyvolený, konám jen svou povinnost.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2100_TORWACHE_PERM(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_PERM_Condition;
	information = DIA_PAL_205_Torwache_PERM_Info;
	permanent = TRUE;
	description = "Jak jde služba?";
};


func int dia_pal_2100_torwache_perm_condition()
{
	if((PAL_205_schonmalreingelassen == TRUE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_2100_torwache_perm_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PERM_15_00");	//Jak jde služba?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_01");	//Máme všechno pod kontrolou.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_02");	//Má služba mì plnì uspokojuje, Vyvolený.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_03");	//Mazej dovnitø a sklapni.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_04");	//Co chceš?
	};
	AI_StopProcessInfos(self);
};

