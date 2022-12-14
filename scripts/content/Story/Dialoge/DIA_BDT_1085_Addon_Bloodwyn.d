
instance DIA_Addon_Bloodwyn_EXIT(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 999;
	condition = DIA_Addon_Bloodwyn_EXIT_Condition;
	information = DIA_Addon_Bloodwyn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bloodwyn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bloodwyn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Bloodwyn_PICKPOCKET(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 900;
	condition = DIA_Addon_Bloodwyn_PICKPOCKET_Condition;
	information = DIA_Addon_Bloodwyn_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Addon_Bloodwyn_PICKPOCKET_Condition()
{
	return C_Beklauen(90,250);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Bloodwyn_PICKPOCKET,Dialog_Back,DIA_Addon_Bloodwyn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Bloodwyn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Bloodwyn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
};


instance DIA_Addon_Bloodwyn_Dead(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 2;
	condition = DIA_Addon_Bloodwyn_Dead_Condition;
	information = DIA_Addon_Bloodwyn_Dead_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bloodwyn_Dead_Condition()
{
	if(Npc_GetDistToWP(self,"BL_RAVEN_09") <= 1000)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bloodwyn_Dead_Info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_00");	//Hej, jakses sem dostal?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Dead_15_01");	//Skrz vchod.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_02");	//Vt?pkuje?? Nesn???m vtipy.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void Bloodwyn_Choices_1()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"A tady jsem myslel, ?e t? dostanu.",DIA_Addon_Bloodwyn_Wait_GOOD1);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"V?echno m? sv?j konec.",DIA_Addon_Bloodwyn_Wait_BAD1);
};

func void Bloodwyn_Choices_2()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"A kdo je podle tebe zodpov?dn? za zni?en? bari?ry?",DIA_Addon_Bloodwyn_Wait_GOOD2);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Ty a mnoho ostatn?ch chl?pk? taky ...",DIA_Addon_Bloodwyn_Wait_BAD2);
};

func void Bloodwyn_Choices_3()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Nemysl?m, ?e m?l ?as b?t vyb?rav? ...",DIA_Addon_Bloodwyn_Wait_GOOD3);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Ano, to byla jeho n?jv?t?? chyba ...",DIA_Addon_Bloodwyn_Wait_BAD3);
};


instance DIA_Addon_Bloodwyn_Wait(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 2;
	condition = DIA_Addon_Bloodwyn_Wait_Condition;
	information = DIA_Addon_Bloodwyn_Wait_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bloodwyn_Wait_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Minecrawler_Killed >= 9))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bloodwyn_Wait_Info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_00");	//Zabils d?ln? ?ervy? Dob?e. Postar?m se o zbytek. Ztra? se.
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_01");	//Ne tak rychle.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_02");	//Ty tu je?t? jsi?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_03");	//Je tu n?co, o ?em si mus?me promluvit.
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Hled?m Ravena.",DIA_Addon_Bloodwyn_Wait_Raven);
};

func void DIA_Addon_Bloodwyn_Wait_Raven()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_00");	//Hled?m Ravena.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_01");	//Ano ... a pro? by se o TEBE m?l Raven zaj?mat ... po?kej chvili?ku ... TY jsi ...  to jsi TY???
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_02");	//?pinav? hajzl, kter?ho hled?me u? celu v??nost. Co tady d?l??? M?ls b?t u? d?vno mrtev!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_03");	//To nen? poprv?, co jsem to sly?el.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_04");	//V?ichni tito dob??-nanic zklamali ... ale ty p?es m? neprojde?. Tentokr?t skon??m tvou cestu!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_05");	//Jak u? jsem ?ekl, hled?m Ravena, ty m? nezaj?m??.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_06");	//P?i?el jsem t? zab?t - p?e?il jsem zat?m ka?d? souboj!
	Bloodwyn_Choices_1();
};

func void DIA_Addon_Bloodwyn_Wait_FIGHT()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_15_00");	//Dost ?e??, skon?eme to.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_04_01");	//(triumf?ln?) P?i?el jsi pozd?! Raven otev?el chr?m, zat?mco my tady spolu mluv?me. Hahaha - zem?i, hrdino.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void Bloodwyn_Lach()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Lach_04_00");	//HAHAHA - stejn? zv?t?z?m!
};

func void Bloodwyn_Wut()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wut_04_00");	//AARGH! TY synu prasete!
	self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] - 5;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;
};

func void Bloodwyn_Next_1()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_2_04_00");	//A p?e?il jsem p?d bari?ry bez sebemen??ho ?kr?bnut?!
};

func void Bloodwyn_Next_2()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_3_04_00");	//Nem??e? m? porazit! Jsem Raven?v d?v?ryhodn? spole?n?k! Jeho prav? ruka!
};

func void DIA_Addon_Bloodwyn_Wait_GOOD1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD1_15_00");	//A tady jsem t? dostal.
	Bloodwyn_Wut();
	Bloodwyn_Next_1();
	Bloodwyn_Choices_2();
};

func void DIA_Addon_Bloodwyn_Wait_BAD1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD1_15_00");	//V?e jednou skon??.
	Bloodwyn_Lach();
	Bloodwyn_Next_1();
	Bloodwyn_Choices_2();
};

func void DIA_Addon_Bloodwyn_Wait_GOOD2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD2_15_00");	//A kdo je podle tebe zodpov?dn? za p?d bari?ry?
	Bloodwyn_Wut();
	Bloodwyn_Next_2();
	Bloodwyn_Choices_3();
};

func void DIA_Addon_Bloodwyn_Wait_BAD2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD2_15_00");	//Ty a mnoho ostatn?ch chl?pk? taky ...
	Bloodwyn_Lach();
	Bloodwyn_Next_2();
	Bloodwyn_Choices_3();
};

func void DIA_Addon_Bloodwyn_Wait_GOOD3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD3_15_00");	//Nemysl?m, ?e m?l ?as b?t vyb?rav? ...
	Bloodwyn_Wut();
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};

func void DIA_Addon_Bloodwyn_Wait_BAD3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD3_15_00");	//Ano, to byla jeho nejv?t?? chyba ...
	Bloodwyn_Wut();
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};

