
instance DIA_Addon_RoastPirate_EXIT(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 999;
	condition = DIA_Addon_RoastPirate_EXIT_Condition;
	information = DIA_Addon_RoastPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_RoastPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_RoastPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int PIR_1364_Grog;

instance DIA_Addon_RoastPirate_GimmeGrog(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 1;
	condition = DIA_Addon_RoastPirate_GimmeGrog_Condition;
	information = DIA_Addon_RoastPirate_GimmeGrog_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_RoastPirate_GimmeGrog_Condition()
{
	if((Npc_IsInState(self,ZS_Talk) == TRUE) && (Npc_WasInState(self,ZS_Roast_Scavenger) == TRUE) && (PIR_1364_Grog == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_GimmeGrog_Info()
{
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_00");	//O, od toho ohn? jde horko. M?m ??ze?.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_01");	//Hej ty, d?? mi grog?
	Log_CreateTopic(TOPIC_Addon_RoastGrog,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RoastGrog,LOG_Running);
	B_LogEntry(TOPIC_Addon_RoastGrog,"Pir?t u t?borov?ho ohn? nutn? pot?ebuj? grog.");
	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	Info_AddChoice(DIA_Addon_RoastPirate_GimmeGrog,"Ne, nic nem?m.",DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny);
	if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		Info_AddChoice(DIA_Addon_RoastPirate_GimmeGrog,"Tady, dej si hlta.",DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog);
	};
};

func void DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_15_00");	//Ne, nic nem?m.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_06_00");	//Sakra, j? snad ??zn? um?u.
	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_15_00");	//Tady, dej si hlta.
	B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_06_01");	//D?k.
	B_UseItem(self,ItFo_Addon_Grog);
	PIR_1364_Grog = TRUE;
	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	B_LogEntry(TOPIC_Addon_RoastGrog,"Zd? se, ?e grog ho zachr?nil od smrti ??zn?.");
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_RoastPirate_SeichtesWasser(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 2;
	condition = DIA_Addon_RoastPirate_SeichtesWasser_Condition;
	information = DIA_Addon_RoastPirate_SeichtesWasser_Info;
	description = "Co d?l???";
};


func int DIA_Addon_RoastPirate_SeichtesWasser_Condition()
{
	return TRUE;
};

func void DIA_Addon_RoastPirate_SeichtesWasser_Info()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_SeichtesWasser_15_00");	//Co d?l???
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_01");	//Mus?m nasytit hladov? mu?stvo.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_02");	//To je , pro? tu sed?m ve dne v noci, star? vlku.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_03");	//Nam?sto toho bych byl mnohem rad?ji na m?l?in? u pl??e a hledal vyplaven? zbo??.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_04");	//Minul? t?den velk? obchodn? lo? najela na kor?lov? ?tes.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_05");	//A n?klad je nyn? vyplavov?n na b?eh.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_06");	//Douf?m, ?e odsud jednou vypadnu.
};


instance DIA_Addon_RoastPirate_Francis(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 3;
	condition = DIA_Addon_RoastPirate_Francis_Condition;
	information = DIA_Addon_RoastPirate_Francis_Info;
	permanent = FALSE;
	description = "Co mi m??e? ??ci o Francisovi?";
};


func int DIA_Addon_RoastPirate_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_RoastPirate_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_FRANCIS_15_00");	//Co mi m??e? ??ci o Francisovi?
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_01");	//Francis? Jedn? s n?mi jako by byl n?? kapit?n, kter? ale okam?it? zastav?, kdy? bude Greg zp?tky.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_02");	//Pak by se plazil zp?t pod jeho sk?lu jako rak.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_04");	//Kdy? se m? pt??, mysl?m, ?e s n?mi v?emi chce vyb?hnout. Vsadil bych se, ?e pracuje jen pro svou vlastn? kapsu.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_05");	//Tohle ze m? nedostane?. A dokud to nebude podlo?en?, nechal bych si to pro sebe, b?t tebou.
};


instance DIA_Addon_RoastPirate_PERM(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 99;
	condition = DIA_Addon_RoastPirate_PERM_Condition;
	information = DIA_Addon_RoastPirate_PERM_Info;
	permanent = TRUE;
	description = "A jinak?";
};


func int DIA_Addon_RoastPirate_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_RoastPirate_SeichtesWasser))
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_PERM_Info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Matt_Job_15_00");	//A jinak?
	randy = Hlp_Random(3);
	if(GregIsBack == TRUE)
	{
		if((randy == 0) && !Npc_IsDead(Francis))
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_02");	//Poslal bych Francise na Gregov? m?st? do mo??lu.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_03");	//Nyn? kdy? je Greg zp?t, pochybuji, ?e na n?s banditi za?to??.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_01");	//Greg?v n?vrat bude ur?it? znamenat v?c pr?ce, ale aspo? dostaneme dost pen?z.
		};
	}
	else if((randy == 0) && !Npc_IsDead(Francis))
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_06");	//Francis je velk? tlu?huba. V?e se zde rozpad? od doby, kdy se stal v?dcem t?bora.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_05");	//Jen a? bandit? za?to??. Budou nemile p?ekvapeni.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_04");	//Douf?m, ?e se Greg vr?t?. Cht?l bych b?t zp?t na otev?en?m mo?i.
	};
};


instance DIA_Addon_RoastPirate_Anheuern(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 11;
	condition = DIA_Addon_RoastPirate_Anheuern_Condition;
	information = DIA_Addon_RoastPirate_Anheuern_Info;
	permanent = FALSE;
	description = "M?l bys mi pomoct.";
};


func int DIA_Addon_RoastPirate_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_01");	//M?l bys mi pomoct.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_03");	//P??kaz od Grega.
	B_Say(self,other,"$ABS_GOOD");
};


instance DIA_Addon_RoastPirate_ComeOn(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 12;
	condition = DIA_Addon_RoastPirate_ComeOn_Condition;
	information = DIA_Addon_RoastPirate_ComeOn_Info;
	permanent = TRUE;
	description = "Poj?.";
};


func int DIA_Addon_RoastPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_RoastPirate_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_RoastPirate_ComeOn_15_00");	//Poj?.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_RoastPirate_GoHome(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 13;
	condition = DIA_Addon_RoastPirate_GoHome_Condition;
	information = DIA_Addon_RoastPirate_GoHome_Info;
	permanent = TRUE;
	description = "U? t? v?c nepot?ebuji.";
};


func int DIA_Addon_RoastPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_RoastPirate_GoHome_15_00");	//U? t? v?c nepot?ebuji.
	B_Say(self,other,"$ABS_GOOD");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_RoastPirate_TooFar(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 14;
	condition = DIA_Addon_RoastPirate_TooFar_Condition;
	information = DIA_Addon_RoastPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_RoastPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_TooFar_Info()
{
	B_Say(self,other,"$RUNAWAY");
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

