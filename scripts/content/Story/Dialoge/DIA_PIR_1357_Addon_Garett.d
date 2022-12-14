
instance DIA_Addon_Garett_EXIT(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 999;
	condition = DIA_Addon_Garett_EXIT_Condition;
	information = DIA_Addon_Garett_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Garett_PICKPOCKET(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 900;
	condition = DIA_Addon_Garett_PICKPOCKET_Condition;
	information = DIA_Addon_Garett_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Garett_PICKPOCKET_Condition()
{
	return C_Beklauen(36,55);
};

func void DIA_Addon_Garett_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Garett_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Garett_PICKPOCKET,Dialog_Back,DIA_Addon_Garett_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Garett_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Garett_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garett_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Garett_PICKPOCKET);
};

func void DIA_Addon_Garett_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Garett_PICKPOCKET);
};


instance DIA_Addon_Garett_Anheuern(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 1;
	condition = DIA_Addon_Garett_Anheuern_Condition;
	information = DIA_Addon_Garett_Anheuern_Info;
	important = TRUE;
};


func int DIA_Addon_Garett_Anheuern_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Anheuern_Info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_00");	//Ani se m? neptej, jestli s tebou p?jdu na lov.
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_01");	//Co si mysl??, ?e by si tu beze m? po?ali, co?
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_02");	//Ne? bych se vr?til, nezbyla by mi tu ani JEDNA pln? krabice!
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_03");	//Z?st?v?m tady a budu se starat o z?soby!
};


instance DIA_Addon_Garett_Hello(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 1;
	condition = DIA_Addon_Garett_Hello_Condition;
	information = DIA_Addon_Garett_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Garett_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_Addon_Greg_ClearCanyon != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_00");	//Copak to tu m?me, nov? tv??? Douf?m, ?e nejsi ??dn? z t?ch v?iv?ch bandit?!
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_01");	//J? jsem Garett. Kdy? bude? n?co pot?ebovat, p?ij? nejprve za mnou.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_02");	//M?m t?m?? v?echno. V?no, zbran? a je?t? mnoho dal??ho, co lid? pot?ebuj?.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_03");	//Krom? ko?alky - jestli hled?? kvalitn? ko?alku, jdi za Samuelem.
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};


instance DIA_Addon_Garett_Samuel(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 2;
	condition = DIA_Addon_Garett_Samuel_Condition;
	information = DIA_Addon_Garett_Samuel_Info;
	permanent = FALSE;
	description = "Kdo je Samuel?";
};


func int DIA_Addon_Garett_Samuel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) && (Samuel.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Samuel_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Samuel_15_00");	//Kdo je Samuel?
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_01");	//N?? pali?. Jeho jeskyn? je t?mhle o kousek d?l, napravo od pl??e.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_02");	//Nen? t??k? to naj?t, jdi prost? na sever.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_03");	//Ale n?co ti porad?m - z?sob se grogem.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_04");	//N?kte?? mlad?ci tady nemaj? moc r?di nov? chlapy, jestli ch?pe? ...
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_05");	//V tom p??pad? m??e tro?ka kvalitn?ho grogu urovnat situaci!
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};


instance DIA_Addon_Garett_Warez(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 3;
	condition = DIA_Addon_Garett_Warez_Condition;
	information = DIA_Addon_Garett_Warez_Info;
	description = "Od koho bere? sv? zbo???";
};


func int DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_Warez_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Warez_15_00");	//Od koho bere? sv? zbo???
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_01");	//Skip v?dycky doveze hodn? z Khorinisu, kam chod?v?.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_02");	//A? do te? prod?val hodn? v?c? bandit?m.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_03");	//Ale jak te? s bandity v?l??me, v?echno to zbo?? kon?? u m?.
};


instance DIA_Addon_Garett_Bandits(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 3;
	condition = DIA_Addon_Garett_Bandits_Condition;
	information = DIA_Addon_Garett_Bandits_Info;
	description = "Co v?? o banditech?";
};


func int DIA_Addon_Garett_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Bandits_15_00");	//Co v?? o banditech?
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_01");	//Na to je odborn?k Skip.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_02");	//?eknu ti, on m?l s t?mi idioty hodn? sch?zek.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_03");	//Greg rozk?zal zlikvidovat ka?d?ho banditu, co se p?ibl??? k t?boru.
};


instance DIA_Addon_Garett_Greg(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 4;
	condition = DIA_Addon_Garett_Greg_Condition;
	information = DIA_Addon_Garett_Greg_Info;
	permanent = FALSE;
	description = "Tv?j kapit?n Greg. Jak? je?";
};


func int DIA_Addon_Garett_Greg_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Greg_15_00");	//Tv?j kapit?n Greg. Jak? je?
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_01");	//Je to tuh? chl?pek, to ur?it?.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_02");	//A chamtiv? jako nikdo jin?.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_03");	//Nechal na?eho pokladn?ka Francise, aby n?m platil akor?t tolik, abychom se nevzbou?ili.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_04");	//A kdy? jeden z n?s n?co opravdu zam??lel, postaral se o n?ho osobn?.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_05");	//Jednou jsem ukradl kompas z jedn? kr?lovk? fregaty.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_06");	//Greg, ten bastard, mi ho samoz?ejm? zabavil.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_07");	//Pf! Asi ho n?kam schoval, jako v?echny jeho poklady.
};


instance DIA_Addon_Garett_Tips(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 5;
	condition = DIA_Addon_Garett_Tips_Condition;
	information = DIA_Addon_Garett_Tips_Info;
	description = "Kde mohl Greg ukr?t ten kompas?";
};


func int DIA_Addon_Garett_Tips_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Tips_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_00");	//Kde mohl Greg ukr?t ten kompas?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_01");	//Greg mi jednou ?ekl, ?e o m?j kompas se star? smrt a pak se za?al sm?t.
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_02");	//N?co dal??ho?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_03");	//Na ji?n?m pob?e?? je pl??. D? se tam dostat jen po mo?i.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_04");	//??k? se, ?e Greg tam ob?as chod?. Mo?n? bys tam n?co na?el.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_05");	//Jednou jsem tam byl, ale je tam plno potvor.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_06");	//Jestli to chce? opravdu risknout, nezapome? si krump??.
	MIS_ADDON_GARett_BringKompass = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kompass,LOG_Running);
	B_LogEntry(TOPIC_Addon_Kompass,"Greg sebral Garretovi vz?cn? kompas. Garett si mysl?, ?e ho schoval n?kde na ji?n? pl??i.");
};


instance DIA_Addon_Garett_GiveKompass(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 6;
	condition = DIA_Addon_Garett_GiveKompass_Condition;
	information = DIA_Addon_Garett_GiveKompass_Info;
	permanent = FALSE;
	description = "Tady je tv?j kompas.";
};


func int DIA_Addon_Garett_GiveKompass_Condition()
{
	if((Npc_HasItems(other,ItMI_Addon_Kompass_Mis) >= 1) && (MIS_ADDON_GARett_BringKompass == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_GiveKompass_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_GiveKompass_15_00");	//Tady je tv?j kompas.
	if(B_GiveInvItems(other,self,ItMI_Addon_Kompass_Mis,1))
	{
		Npc_RemoveInvItems(self,ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_01");	//(raduje se) Jo, to je on. Ne?ekal jsem, ?e ho je?t? n?kdy uvid?m.
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_02");	//D?ky, chlape!
	if(Npc_HasItems(self,ItBe_Addon_Prot_EdgPoi) > 0)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_03");	//Tentokr?t u? ho Greg NEDOSTANE ...
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_04");	//Tady, vezmi si za to tenhle opasek. Je celkem cenn?.
		B_GiveInvItems(self,other,ItBe_Addon_Prot_EdgPoi,1);
	}
	else if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_05");	//Tento p?sek si ode m? koupil, pamatuje??
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_06");	//Zaplatil jsi za n?j hodn? - (rychle) a je opravdu cenn?. Tady - vezmi si ty pen?ze zp?t.
		B_GiveInvItems(self,other,ItMi_Gold,Value_ItBE_Addon_Prot_EdgPoi);
	};
	B_LogEntry(TOPIC_Addon_Kompass,"Garret byl velmi pot??en, kdy? jsem mu vr?til jeho kompas.");
	MIS_ADDON_GARett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP(XP_ADDON_Garett_Bring_Kompass);
};


instance DIA_Addon_Garett_Francis(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 7;
	condition = DIA_Addon_Garett_Francis_Condition;
	information = DIA_Addon_Garett_Francis_Info;
	permanent = FALSE;
	description = "Co mi m??e? ??ct o Francisovi?";
};


func int DIA_Addon_Garett_Francis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Francis_15_00");	//Co mi m??e? ??ct o Francisovi?
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_01");	//Greg mu p?edal velen?, dokud tu nen?.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_02");	//Ale jako kapit?n je Francis absolutn? nemo?n?!
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_03");	//Ani nedok?zal vyt?hnout Morgana z postele.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_04");	//Henry a jeho chlapci jsou jedin?, kdo tu n?co d?l?.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_05");	//Ti ostatn? se jen fl?kaj?.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_06");	//Douf?m, ?e se Greg vr?t? brzy.
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_07");	//Pak je p?kn? nakope do zadku.
	};
};


instance DIA_Addon_Garett_PERM(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 99;
	condition = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent = TRUE;
	description = "N?co nov?ho?";
};


func int DIA_Addon_Garett_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_PERM_15_00");	//N?co nov?ho?
	if((GregIsBack == FALSE) || Npc_IsDead(Greg))
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_02");	//Dokud bude Greg pry?, nic se tu d?t nebude.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_01");	//Te?, kdy? je Greg zp?t, v?ci se vrac? do norm?lu.
	};
};


instance DIA_Addon_Garett_Trade(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 888;
	condition = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent = TRUE;
	description = DIALOG_TRADE;
	trade = TRUE;
};


func int DIA_Addon_Garett_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Trade_Info()
{
	var int Garett_Random;
	var int McBolzenAmount;
	var int McArrowAmount;
	Garett_Random = Hlp_Random(3);
	if(Garett_Random == 0)
	{
		B_Say(other,self,"$TRADE_1");
	}
	else if(Garett_Random == 1)
	{
		B_Say(other,self,"$TRADE_2");
	}
	else
	{
		B_Say(other,self,"$TRADE_3");
	};
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItRw_Bolt,Npc_HasItems(self,ItRw_Bolt));
	McBolzenAmount = Kapitel * 25;
	CreateInvItems(self,ItRw_Bolt,McBolzenAmount);
	Npc_RemoveInvItems(self,ItRw_Arrow,Npc_HasItems(self,ItRw_Arrow));
	McArrowAmount = Kapitel * 25;
	CreateInvItems(self,ItRw_Arrow,McArrowAmount);
};

