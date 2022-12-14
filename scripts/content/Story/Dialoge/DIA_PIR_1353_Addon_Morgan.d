
var int Morgan_Perm_Counter;

instance DIA_Addon_Morgan_EXIT(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 999;
	condition = DIA_Addon_Morgan_EXIT_Condition;
	information = DIA_Addon_Morgan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Morgan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Morgan_EXIT_Info()
{
	if(GregIsBack == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Morgan_Perm_15_00");	//Nebudu t? d?le ru?it.
		if(Morgan_Perm_Counter == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_01");	//(z?v?) Bezvadn? n?pad.
			Morgan_Perm_Counter = 1;
		}
		else if(Morgan_Perm_Counter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_02");	//(ospale) Tak tedy dobrou noc.
			Morgan_Perm_Counter = 2;
		}
		else if(Morgan_Perm_Counter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_03");	//(unaven?) Nic, rad?i to ud?l?m.
			Morgan_Perm_Counter = 3;
		}
		else if(Morgan_Perm_Counter == 3)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_04");	//Vzbu? m?, jestli se n?co p?ihod?.
			Morgan_Perm_Counter = 0;
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Morgan_PICKPOCKET(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 900;
	condition = DIA_Addon_Morgan_PICKPOCKET_Condition;
	information = DIA_Addon_Morgan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Morgan_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void DIA_Addon_Morgan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Morgan_PICKPOCKET,Dialog_Back,DIA_Addon_Morgan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Morgan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Morgan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Morgan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
};

func void DIA_Addon_Morgan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
};


instance DIA_Addon_Morgan_Anheuern(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 1;
	condition = DIA_Addon_Morgan_Anheuern_Condition;
	information = DIA_Addon_Morgan_Anheuern_Info;
	important = TRUE;
};


func int DIA_Addon_Morgan_Anheuern_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GregIsBack == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Anheuern_Info()
{
	AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_00");	//Skv?le! Te? m? Greg poslal ?ezat kl?dy!
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_01");	//(sarkasticky) U?ij si pob?jen? monster!
	};
};


instance DIA_Addon_Morgan_Hello(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 1;
	condition = DIA_Addon_Morgan_Hello_Condition;
	information = DIA_Addon_Morgan_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Morgan_Hello_Condition()
{
	if((MIS_AlligatorJack_BringMeat == FALSE) && Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(AlligatorJack) == FALSE) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Hello_15_00");	//Hej ty!
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_01");	//(ospale) Huh? Co chce??
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_02");	//(ospale) Je Alligator Jack u? zp?tky?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_03");	//(ospale) Ne? Dobr?, asi se vr?t? pozd?ji. Dobrou noc.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Morgan_Meat(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 2;
	condition = DIA_Addon_Morgan_Meat_Condition;
	information = DIA_Addon_Morgan_Meat_Info;
	description = "P?inesl jsem z?silku masa.";
};


func int DIA_Addon_Morgan_Meat_Condition()
{
	if((MIS_AlligatorJack_BringMeat == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Meat_Info()
{
	var int GivenMeat;
	AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_00");	//P?inesl jsem z?silku masa.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_01");	//(Vzbuzen?) Uah. Nejd??v pot?ebuju dou?ek na probuzen?.
		CreateInvItems(self,ItFo_Booze,3);
		B_UseItem(self,ItFo_Booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_02");	//Ahh, to je lep??. Dobr?, znova. Co chce??
		AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_03");	//P?inesl jsem ti tuhle z?silku masa. Od Alligatora Jacka.
	};
	AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_04");	//U? si vzpom?n?m. Ano, p?esn?, maso. Dej mi to!
	GivenMeat = Npc_HasItems(other,ItFoMuttonRaw);
	if(GivenMeat > 10)
	{
		GivenMeat = 10;
	};
	B_GiveInvItems(other,self,ItFoMuttonRaw,GivenMeat);
	if(GivenMeat < 10)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_05");	//Co, to je v?e? Se?vejkal si v?echno ostatn?? Ahh, nevad? ...
	};
	B_LogEntry(TOPIC_Addon_BringMeat,"Dal jsem Moranovi maso.");
	MIS_AlligatorJack_BringMeat = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_AlligatorJAck_BringMeat);
};


instance DIA_Addon_Morgan_Job(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 3;
	condition = DIA_Addon_Morgan_Job_Condition;
	information = DIA_Addon_Morgan_Job_Info;
	description = "Co tady d?l???";
};


func int DIA_Addon_Morgan_Job_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Meat))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Job_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Job_15_01");	//Co tady d?l???
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_01");	//Greg mi dal velen? jedn? hrani?n? skupiny.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_02");	//Jsem zodpov?dn? za proviant v t?bo?e - Alligator Jack se o to pro m? star?.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_03");	//Jsem tak? zodpov?dn? za potvory, kter? jsou p??li? bl?zko t?bora.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_04");	//M? chlapci se o to staraj? za m?.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Job_07_05");	//?ekl jsem jim, nechci tady vid?t jedinou potvoru (z?v?) Kdy? se Greg vr?t?.
	};
};


instance DIA_Addon_Morgan_Sleep(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 4;
	condition = DIA_Addon_Morgan_Sleep_Condition;
	information = DIA_Addon_Morgan_Sleep_Info;
	description = "D?l?? te? n?co?";
};


func int DIA_Addon_Morgan_Sleep_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Job))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Sleep_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Sleep_15_00");	//D?l?? te? n?co?
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_01");	//Hej, koukej!
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_02");	//M?m nejd?le?it?j?? ?kol ze v?ech.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_03");	//Star?m se o tr?nov?n? na?ich lid?.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_04");	//D?l?m z nich nejlep?? a nejv?ce ob?van? pir?ty, kte?? kdy k?i?ovaly tyhle vody.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_05");	//Nen? nic, co by chlapy donutilo, aby se vr?tili ke sv? pr?ci.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_06");	//Dostali za to p?kn? v??ek se zlatem.
};


instance DIA_Addon_Morgan_JoinMorgan(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_JoinMorgan_Condition;
	information = DIA_Addon_Morgan_JoinMorgan_Info;
	description = "Chci se p?ipojit k tv? skupin?.";
};


func int DIA_Addon_Morgan_JoinMorgan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Sleep) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_JoinMorgan_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_JoinMorgan_15_00");	//Chci se p?ipojit k tv? skupin?.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_01");	//(sm?je se) Moje Skupina? Moje skupina se povaluje okolo na pl??i.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_03");	//Chlapy nezvednou ani prst dokud se kapit?n nevr?t?. M??u ti nasl?bovat hodn?.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_04");	//Ale jestli n?m chce? uk?zat, co jsi vlastn? za?, postar?? se o pl?? na severu.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_05");	//Je pln? ??havc? a kdo v? ?eho je?t?.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_06");	//Odstra? je s?m a z?sk?? respekt (z?v?) od chlapc? ...
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_07");	//V?tej v m? skupin?. Ha! Jsem zp?t na leh?tkov? slu?b? ...
	Log_CreateTopic(TOPIC_Addon_MorganBeach,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MorganBeach,LOG_Running);
	B_LogEntry(TOPIC_Addon_MorganBeach,"Te?, kdy? jsem v Morganov? skupin?, chce abych vy?istil severn? pl?? od potvor.");
	MIS_Addon_MorganLurker = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Morgan_LurkerPlatt(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 6;
	condition = DIA_Addon_Morgan_LurkerPlatt_Condition;
	information = DIA_Addon_Morgan_LurkerPlatt_Info;
	permanent = TRUE;
	description = "Severn? pl?? je ??st?.";
};


func int DIA_Addon_Morgan_LurkerPlatt_Condition()
{
	if(Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && (MIS_Addon_MorganLurker == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_LurkerPlatt_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_00");	//Severn? pl?? je ??st?.
	AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_01");	//A co jeskyn?. ?el jsi tam taky?
	if(Npc_IsDead(BeachShadowbeast1))
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_02");	//Jasn?.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_03");	//T??da. Jsi dobr? chlap.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_04");	//Tady je tvoje odm?na.
		CreateInvItems(self,ItMi_Gold,150);
		B_GiveInvItems(self,other,ItMi_Gold,150);
		B_LogEntry(TOPIC_Addon_MorganBeach,"Pl?? je vy?i?t?na. V?ichni tvorov? jsou mrtv?.");
		MIS_Addon_MorganLurker = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_05");	//Au ...
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_06");	//To je ??st pr?ce. P?ij? zp?t, a? se postar?? i o to.
		B_LogEntry(TOPIC_Addon_MorganBeach,"Morgan tak? chce, abych se postaral o jeskyni.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Morgan_Auftrag2(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 99;
	condition = DIA_Addon_Morgan_Auftrag2_Condition;
	information = DIA_Addon_Morgan_Auftrag2_Info;
	permanent = TRUE;
	description = "Je tady n?co, co m??u ud?lat?";
};


func int DIA_Addon_Morgan_Auftrag2_Condition()
{
	if(MIS_Addon_MorganLurker == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Auftrag2_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Auftrag2_15_00");	//Je tady n?co, co m??u ud?lat?
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_01");	//Te? zrovna ne.
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_02");	//Zajisti si l??ko a dej si p?knou l?hev rumu!
		CreateInvItems(self,ItFo_Booze,3);
		B_UseItem(self,ItFo_Booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_03");	//Aaah. To je dobr? v?c.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_04");	//Nejl?pe, kdy? se na to zept?? kapit?na.
	};
	AI_StopProcessInfos(self);
};


var int Morgan_AngusStory;

instance DIA_Addon_Morgan_FOUNDTHEM(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 7;
	condition = DIA_Addon_Morgan_FOUNDTHEM_Condition;
	information = DIA_Addon_Morgan_FOUNDTHEM_Info;
	permanent = TRUE;
	description = "O Agnusovi a Hankovi ...";
};


func int DIA_Addon_Morgan_FOUNDTHEM_Condition()
{
	if((MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Skip_AngusHank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_FOUNDTHEM_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_00");	//O Agnusovi a Hankovi ...
	if(Morgan_AngusStory == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_01");	//Neza??nej s T?M p??b?hem.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_02");	//Pravd?podobn? byli zabiti bandity.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_03");	//A Agnus m?l u sebe m?j prsten.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_04");	//Dob?e, vlastn? to byl JEHO prsten. Vyhr?l ho v kostk?ch.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_05");	//Ale cht?l jsem ho vyhr?t nazp?t, ale te? je PRY?!
		Morgan_AngusStory = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	if(Npc_HasItems(other,ItRi_Addon_MorgansRing_Mission) > 0)
	{
		Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"Na?el jsem je.",DIA_Addon_Morgan_FOUNDTHEM_Now);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_06");	//Jestli najde? m?j prsten, p?ines mi ho. Nebude to za nic, slibuju!
	};
};

func void DIA_Addon_Morgan_FOUNDTHEM_Now()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_01");	//Na?el jsem je.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_07");	//M?m ti zaplatit ka?d? slovo? Kde jsou?
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_03");	//Jsou mrtv?.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_08");	//Prsten. Kde je prsten?
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"Tady to je.",DIA_Addon_Morgan_FOUNDTHEM_GiveRing);
	Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"Nem?li to u sebe.",DIA_Addon_Morgan_FOUNDTHEM_NoRing);
};

func void DIA_Addon_Morgan_FOUNDTHEM_NoRing()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00");	//Nem?li to u sebe.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01");	//(zd??en?) Co? Jdi zp?t a pod?vej se znova. Musej? ho m?t.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02");	//Je to mal? prsten s mnoha ornamenty.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03");	//MUS͊ ho naj?t. MUS͊!
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
};

func void DIA_Addon_Morgan_FOUNDTHEM_GiveRing()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00");	//Tady je.
	B_GiveInvItems(other,self,ItRi_Addon_MorgansRing_Mission,1);
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01");	//(??astn? jak bl?zen) Ano, to je ono. Hodn? chlapec!
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02");	//Tady, vem si tuhle kamennou desku. Vypad? jak star? odpad, ale Garett ti za ni dob?e zaplat?.
	MIS_Addon_Morgan_SeekTraitor = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_MorgansRing);
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	B_GiveInvItems(self,other,ItWr_StonePlateCommon_Addon,1);
};


instance DIA_Addon_Morgan_Francis(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_Francis_Condition;
	information = DIA_Addon_Morgan_Francis_Info;
	description = "Co si mysl?? o Francisovi?";
};


func int DIA_Addon_Morgan_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Morgan_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_00");	//Co si mysl?? o Francisovi?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_01");	//Nestar?m se, (nebezpe?n?) tak dlouho dokud m? nech? na pokoji!
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_02");	//Nen? tady ??fem?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_03");	//(drsn? se sm?je) On si MYSL?, ?e je tady ??fem.
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_04");	//(radostn?) Ale jen co se Greg vr?t?, bude Francis  znovu a velmi piln?  ?ezat kl?dy.
};


instance DIA_Addon_Morgan_TRAIN(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_TRAIN_Condition;
	information = DIA_Addon_Morgan_TRAIN_Info;
	description = "M??e? m? taky tr?novat?";
};


func int DIA_Addon_Morgan_TRAIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Sleep))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_TRAIN_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_TRAIN_15_00");	//M??e? m? taky tr?novat?
	AI_Output(self,other,"DIA_Addon_Morgan_TRAIN_07_01");	//Jasn?, m??u ti uk?zat, jak bojovat s jednoru?n?mi zbran?mi.
	Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);
	Morgan_Addon_TeachPlayer = TRUE;
};


var int Morgan_merke1h;
var int Morgan_Labercount;

instance DIA_Addon_Morgan_Teach(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 99;
	condition = DIA_Addon_Morgan_Teach_Condition;
	information = DIA_Addon_Morgan_Teach_Info;
	permanent = TRUE;
	description = "Tr?nuj m?!";
};


func int DIA_Addon_Morgan_Teach_Condition()
{
	if(Morgan_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Teach_15_00");	//Tr?nuj m?!
	Morgan_merke1h = other.HitChance[NPC_TALENT_1H];
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

func void DIA_Addon_Morgan_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_1H] > Morgan_merke1h)
	{
		if(Morgan_Labercount == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_00");	//M?j jednu v?c na pam?ti. V?echna ?e? o sl?v? je ztr?ta ?asu. Bu? ty zabije? jeho, nebo on zabije tebe.
			Morgan_Labercount = 1;
		}
		else if(Morgan_Labercount == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_01");	//V budoucnu se bude? muset nau?it, jak do sv?ch ?der? d?t v?ce s?ly.
			Morgan_Labercount = 2;
		}
		else if(Morgan_Labercount == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_02");	//Hahaha, nakonec jsi se nau?il, jak dr?et me?.
			Morgan_Labercount = 0;
		};
	}
	else if(other.HitChance[NPC_TALENT_1H] >= 75)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Teach_Back_07_00");	//Jestli bude? cht?t b?t lep??, bude? si muset naj?t n?koho jin?ho.
	};
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
};

func void DIA_Addon_Morgan_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,75);
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

func void DIA_Addon_Morgan_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,75);
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

