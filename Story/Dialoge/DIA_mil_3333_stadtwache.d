
instance DIA_MIL_3333_STADTWACHE_EXIT(C_Info)
{
	npc = mil_3333_stadtwache;
	nr = 999;
	condition = dia_mil_3333_stadtwache_exit_condition;
	information = dia_mil_3333_stadtwache_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_mil_3333_stadtwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_3333_stadtwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_3333_STADTWACHE_FIRSTWARN(C_Info)
{
	npc = mil_3333_stadtwache;
	nr = 1;
	condition = DIA_Mil_310_Stadtwache_FirstWarn_Condition;
	information = DIA_Mil_310_Stadtwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_3333_stadtwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,Mil_310_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (B_GetCurrentAbsolutionLevel(self) == MIL_310_Personal_AbsolutionLevel))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(Mil_310_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};


instance DIA_MIL_3333_STADTWACHE_BRIBE(C_Info)
{
	npc = mil_3333_stadtwache;
	nr = 5;
	condition = dia_mil_3333_stadtwache_bribe_condition;
	information = dia_mil_3333_stadtwache_bribe_info;
	permanent = TRUE;
	description = "Tady je 100 zlatých. Nech mě projít!";
};


func int dia_mil_3333_stadtwache_bribe_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_3333_stadtwache_bribe_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Bribe_15_00");	//Tady je 100 zlatých. Nech mě projít!
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_01");	//(hamižně) 100 zlatých zní dobře. Tak běž.
		if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_02");	//A jdi rovnou za lordem Andrem! Jinak tě to bude příště stát dalších 100 zlatých!
		};
		self.aivar[AIV_PASSGATE] = TRUE;
		Stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
		Mil_310_schonmalreingelassen = TRUE;
		B_CheckLog();
		MIL_310_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_03");	//Co?! Kde?! Nevidím žádných 100 zlatých. Zmiz!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MIL_3333_STADTWACHE_PASSIERSCHEIN(C_Info)
{
	npc = mil_3333_stadtwache;
	nr = 4;
	condition = DIA_Mil_310_Stadtwache_Passierschein_Condition;
	information = DIA_Mil_310_Stadtwache_Passierschein_Info;
	permanent = FALSE;
	description = "Mám propustku!";
};


func int dia_mil_3333_stadtwache_passierschein_condition()
{
	if(Npc_HasItems(other,ItWr_Passierschein) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) && (Mil_310_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_3333_stadtwache_passierschein_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_00");	//Mám propustku!
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_01");	//Vážně? A koho jsi kvůli ní zamordoval, ty vrahoune?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_02");	//Tak necháte mě projít, nebo ne?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_03");	//No, běž dál, než si to rozmyslím!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_04");	//Zdá se, že to je v pořádku. Tak běž.
	};
	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
	Mil_310_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos(self);
};

