
instance DIA_Addon_Matt_EXIT(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 999;
	condition = DIA_Addon_Matt_EXIT_Condition;
	information = DIA_Addon_Matt_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Matt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Matt_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Matt_PICKPOCKET(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 900;
	condition = DIA_Addon_Matt_PICKPOCKET_Condition;
	information = DIA_Addon_Matt_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Matt_PICKPOCKET_Condition()
{
	return C_Beklauen(55,91);
};

func void DIA_Addon_Matt_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Matt_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Matt_PICKPOCKET,Dialog_Back,DIA_Addon_Matt_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Matt_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Matt_PICKPOCKET_DoIt);
};

func void DIA_Addon_Matt_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Matt_PICKPOCKET);
};

func void DIA_Addon_Matt_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Matt_PICKPOCKET);
};


instance DIA_Addon_Matt_Hello(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 1;
	condition = DIA_Addon_Matt_Hello_Condition;
	information = DIA_Addon_Matt_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Matt_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Matt_Hello_10_01");	//?, nov??ek? Dobr?. M??e se hodit ka?dej novej dobrej chlap, ce se k n?m p?id?.
};


instance DIA_Addon_Matt_PERM(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 2;
	condition = DIA_Addon_Matt_PERM_Condition;
	information = DIA_Addon_Matt_PERM_Info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int DIA_Addon_Matt_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Matt_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_Alright_15_01");	//Jak to jde?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Matt_Alright_10_02");	//L??IV? LEKTVAR! Co tak l??iv? lektvar, nerozum???
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Matt_Alright_10_01");	//V?e v po??dku - (cynicky) kapit?ne!
		};
	}
	else if((GregIsBack == TRUE) && !Npc_IsDead(Greg))
	{
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_01");	//Neotravuj m?! Nem?me ??dn? dal?? lod?.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_02");	//Po?k?m, abych uvid?l, co Greg ud?l? d?le.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_03");	//Nyn? je v?e v t?bo?e v po??dku. M??u si nyn? na chv?li odpo?inout.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_04");	//A kdybych byl na tv?m m?st?, doporu?il bych ti to sam?.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_05");	//Od t? doby, co zde jsou banditi, v?e, co je n?m drah?, se m??e rychle zm?nit.
	};
};


instance DIA_Addon_Matt_Bandits(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 3;
	condition = DIA_Addon_Matt_Bandits_Condition;
	information = DIA_Addon_Matt_Bandits_Info;
	description = "Co v?? o banditech?";
};


func int DIA_Addon_Matt_Bandits_Condition()
{
	return TRUE;
};

func void DIA_Addon_Matt_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_Bandits_15_03");	//Co v?? o banditech?
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_01");	//Mysl?? s vyj?mkou toho, ?e jsou nebezpe?n?mi vrahy a po?etn? n?s p?evy?uj??
	AI_Output(other,self,"DIA_Addon_Matt_Bandits_15_02");	//Ano.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_02");	//Maj? dost pen?z.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_03");	//Dob?e, m?v?vali alespo? dost pen?z. Ale nezaplatili n?m posledn? dod?vku.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_04");	//Nicm?n?, pochybuji ?e to bude, proto?e ti bastardi spot?ebovali v?echno zlato.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_05");	//Pravd?podobn? si mysl?, ?e se nyn? m??ou dostat pry? s ??mkoliv.
};


instance DIA_Addon_Matt_Francis(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 4;
	condition = DIA_Addon_Matt_Francis_Condition;
	information = DIA_Addon_Matt_Francis_Info;
	description = "Co v?? o Francisovi?";
};


func int DIA_Addon_Matt_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Matt_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_Matt_15_00");	//Co v?? o Francisovi?
	AI_Output(self,other,"DIA_Addon_Matt_Francis_10_01");	//Mysl?? krom? toho, ?e je shnil? a neschpn??
	AI_Output(other,self,"DIA_Addon_Brandon_Matt_15_02");	//Ano.
	AI_Output(self,other,"DIA_Addon_Matt_Francis_10_03");	//Nech m? chv?li p?em??let. Hmmm .... Ne, nic dal??ho m? nenapad?.
};


instance DIA_Addon_Matt_Anheuern(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 11;
	condition = DIA_Addon_Matt_Anheuern_Condition;
	information = DIA_Addon_Matt_Anheuern_Info;
	permanent = FALSE;
	description = "Poj?.";
};


func int DIA_Addon_Matt_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_00");	//Poj? se mnou.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_01");	//Nevid??, ?e si zde zkou??m odpo?inout?
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_02");	//Na Greg?v rozkaz.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_03");	//(usp?chan?) Pro? jsi to ne?ek d??v? Samoz?ejm?, ?e p?jdu.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_04");	//Kam bychom m?li j?t pak?
	Info_ClearChoices(DIA_Addon_Matt_Anheuern);
	Info_AddChoice(DIA_Addon_Matt_Anheuern,"Dr? hubu a poj?.",DIA_Addon_Matt_Anheuern_ShutUp);
	Info_AddChoice(DIA_Addon_Matt_Anheuern,"M?li bychom vy?istit ka?on.",DIA_Addon_Matt_Anheuern_ClearCanyon);
};

func void DIA_Addon_Matt_Anheuern_ShutUp()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ShutUp_15_00");	//Dr? hubu a poj?.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ShutUp_10_01");	//(mrzut?) ?, ? - (sarkasticky) Kapit?n!
	Info_ClearChoices(DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

func void DIA_Addon_Matt_Anheuern_ClearCanyon()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_00");	//M?li bychom vy?istit ka?on.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_01");	//D?l?? si srandu. Tam je kopa p???er. A b?itvy, ty jsou n?co.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_02");	//V?m o tom, poj?.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_03");	//(povzdechne si) Rad?ji vezmi v?c l??iv?ch lektvar?, budeme je pot?ebovat!
	Info_ClearChoices(DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_Addon_Matt_ComeOn(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 12;
	condition = DIA_Addon_Matt_ComeOn_Condition;
	information = DIA_Addon_Matt_ComeOn_Info;
	permanent = TRUE;
	description = "Poj?.";
};


func int DIA_Addon_Matt_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Matt_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_ComeOn_15_00");	//Poj?.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_ComeOn_10_01");	//?, ? - (cynicky) Kapit?n!
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_Matt_GoHome(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 13;
	condition = DIA_Addon_Matt_GoHome_Condition;
	information = DIA_Addon_Matt_GoHome_Info;
	permanent = TRUE;
	description = "U? t? nepot?ebuji.";
};


func int DIA_Addon_Matt_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_DontNeedYou_15_00");	//U? t? nepot?ebuji.
	AI_Output(self,other,"DIA_Addon_Matt_GoHome_10_01");	//(zb?dovan?) Pot?ebuji po??dn? hlt grogu!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Matt_TooFar(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 14;
	condition = DIA_Addon_Matt_TooFar_Condition;
	information = DIA_Addon_Matt_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Matt_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_01");	//M??e? z tadyma pokra?ovat s?m, (cynicky) Kapit?ne.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_03");	//J? a ostatn? mu?i se vr?t?me do t?bora.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_02");	//Vr?t?m se do t?bora!
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Matt_Healing(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 15;
	condition = DIA_Addon_Matt_Healing_Condition;
	information = DIA_Addon_Matt_Healing_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Matt_Healing_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] - 100)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_Healing_Info()
{
	AI_Output(self,other,"DIA_Addon_Matt_Healing_10_01");	//(cynicky) Hal? kapit?ne! Mohl bych pot?ebovat l??iv? lektvar!
};

