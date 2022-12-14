
instance DIA_Mil_333_Stadtwache_EXIT(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 999;
	condition = DIA_Mil_333_Stadtwache_EXIT_Condition;
	information = DIA_Mil_333_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_333_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_333_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_333_Checkpoint = "NW_CITY_MERCHANT_PATH_29";

var int MIL_333_Personal_AbsolutionLevel;

instance DIA_Mil_333_Stadtwache_FirstWarn(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 1;
	condition = DIA_Mil_333_Stadtwache_FirstWarn_Condition;
	information = DIA_Mil_333_Stadtwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,Mil_333_Checkpoint) <= 1000)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (B_GetCurrentAbsolutionLevel(self) == MIL_333_Personal_AbsolutionLevel))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(Mil_333_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_FirstWarn_Info()
{
	var C_Item itm;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_00");	//ST?T!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_01");	//(vzdychne si) Co je?
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_02");	//Moc dob?e v?? co!
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_03");	//Po m?st? jsi hledan? pro vra?du!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_04");	//Nechceme tady ??dn? pra?iv? zlod?je!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_05");	//Pro pot??isty nen? ve m?st? m?sto!
		};
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_06");	//Pro? mysl??, ?e bychom t? m?li nechat j?t d?l?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);
		if((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(itm,ITAR_Bau_L) == TRUE) || (Hlp_IsItem(itm,ITAR_Bau_M) == TRUE) || Hlp_IsItem(itm,itar_pchero))
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_07");	//Ano?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_08");	//Vypad?? jako naprost? somr?k. V tomhle m?st? nem?me m?sto pro lidi bez pen?z.
			if(Npc_HasItems(other,ItWr_Passierschein))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_09");	//Ale j? m?m propustku!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_10");	//Tahle plat? jenom pro tu druhou br?nu!
			};
			if(Npc_KnowsInfo(other,DIA_Mil_310_Stadtwache_MilizWerden))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_11");	//Ale j? se chci p?idat k m?stsk? str??i!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_12");	//Haha! Necht?j m? rozesm?t! B?? ke druh? br?n? a zkus v??et bul?ky na nos zase JIM.
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_13");	//Tam u? jsem byl - a oni m? poslali sem.
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_14");	//(o?kliv? se zasm?je) No pot??! ?e oni n?m sem pos?laj? v?dycky samou smet?nku.
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_15");	//(ti?e) Co?e?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_16");	//Jen jsem se cht?l na tebe pod?vat. Tak dobr?, zd? se, ?e n?jak? ty pen?ze m??. M??e? j?t.
			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_310.aivar[AIV_PASSGATE] = TRUE;
			Mil_333_schonmalreingelassen = TRUE;
			AI_StopProcessInfos(self);
		};
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_333_Stadtwache_SecondWarn(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 2;
	condition = DIA_Mil_333_Stadtwache_SecondWarn_Condition;
	information = DIA_Mil_333_Stadtwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_333_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_SecondWarn_06_00");	//M?? snad n?co s u?ima? Je?t? jeden krok a ochutn?? m?j me?!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_333_Stadtwache_Attack(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 3;
	condition = DIA_Mil_333_Stadtwache_Attack_Condition;
	information = DIA_Mil_333_Stadtwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_333_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_Attack_06_00");	//?ekl sis o to.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Mil_333_Stadtwache_Bribe(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 5;
	condition = DIA_Mil_333_Stadtwache_Bribe_Condition;
	information = DIA_Mil_333_Stadtwache_Bribe_Info;
	permanent = TRUE;
	description = "Tady je 100 zlat?ch. Nech m? proj?t!";
};


func int DIA_Mil_333_Stadtwache_Bribe_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_Bribe_Info()
{
	AI_Output(other,self,"DIA_Mil_333_Stadtwache_Bribe_15_00");	//Tady je 100 zlat?ch. Nech m? proj?t!
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_01");	//(lakom?) 100 zlat?ch zn? hezky. Tak b?? dovnit?.
		if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_02");	//A jdi rovnou za Andrem! Nebo po tob? budu p???t? cht?t dal??ch 100 zlat?ch!
		};
		self.aivar[AIV_PASSGATE] = TRUE;
		Stadtwache_310.aivar[AIV_PASSGATE] = TRUE;
		Mil_333_schonmalreingelassen = TRUE;
		B_CheckLog();
		MIL_333_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_03");	//Co?! Kde?! Nevid?m ??dn? zla??ky. Zmiz!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Mil_333_Stadtwache_PERM(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 5;
	condition = DIA_Mil_333_Stadtwache_PERM_Condition;
	information = DIA_Mil_333_Stadtwache_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_PERM_Condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_PERM_Info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_PERM_06_00");	//Hni se!
	AI_StopProcessInfos(self);
};

