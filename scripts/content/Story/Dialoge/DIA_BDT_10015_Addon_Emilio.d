
instance DIA_Addon_Emilio_EXIT(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 999;
	condition = DIA_Addon_Emilio_EXIT_Condition;
	information = DIA_Addon_Emilio_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Emilio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Emilio_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Emilio_PICKPOCKET(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 900;
	condition = DIA_Addon_Emilio_PICKPOCKET_Condition;
	information = DIA_Addon_Emilio_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Addon_Emilio_PICKPOCKET_Condition()
{
	return C_Beklauen(76,112);
};

func void DIA_Addon_Emilio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Emilio_PICKPOCKET,Dialog_Back,DIA_Addon_Emilio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Emilio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Emilio_PICKPOCKET_DoIt);
};

func void DIA_Addon_Emilio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
};

func void DIA_Addon_Emilio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
};


instance DIA_Addon_BDT_10015_Emilio_Hi(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 1;
	condition = DIA_Addon_Emilio_Hi_Condition;
	information = DIA_Addon_Emilio_Hi_Info;
	permanent = FALSE;
	description = "Vypad?? jako kop??.";
};


func int DIA_Addon_Emilio_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Emilio_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Hi_15_00");	//Vypad?? jako kop??.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Hi_10_01");	//J? JSEM kop??. Kdy? jsem byl naposled v dole, namakal jsem se jako k??.
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_BDT_10015_Emilio_Gold(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 2;
	condition = DIA_Addon_Emilio_Gold_Condition;
	information = DIA_Addon_Emilio_Gold_Info;
	permanent = FALSE;
	description = "Co se d?je se zlatem z dolu?";
};


func int DIA_Addon_Emilio_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10015_Emilio_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Gold_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Gold_15_00");	//Co se d?je se zlatem z dolu?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_01");	//Thorus ho hl?d? a pos?l? d?l.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_02");	//Ka?d? dost?v? pouze ??st zlata - tak aby lovci a str??e neode?li s pr?zdn?ma rukama.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_03");	//?ekl bych, ?e je to v pohod?. Od t? doby, co m?me tohle pravidlo, je tu m?n? vra?d a kop??i po??d dost?vaj? v?ce ne? ti, co se tu jen poflakuj?.
};


instance DIA_Addon_BDT_10015_Emilio_Stein(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 3;
	condition = DIA_Addon_Emilio_Stein_Condition;
	information = DIA_Addon_Emilio_Stein_Info;
	permanent = FALSE;
	description = "A ty ?erven? kameny?";
};


func int DIA_Addon_Emilio_Stein_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Emilio_Jetzt))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Stein_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Stein_15_00");	//A ty ?erven? kameny?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_01");	//To vymyslel Thorus s Estebanem.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_02");	//Thorus ??d? rozd?lov?n? zlata a Esteban organizuje d?ln?ky v dole.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_03");	//Samo?rejm? nechce b?hat za Thorusem poka?d?, kdy? po?le n?koho do dolu.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_04");	//Takhle mu d? jeden z t?ch ?erven?ch kamen? a Thorus ho pust?. Je to jako vstupenka.
};


var int Emilio_Switch;

instance DIA_Addon_Emilio_Attentat(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 4;
	condition = DIA_Addon_Emilio_Attentat_Condition;
	information = DIA_Addon_Emilio_Attentat_Info;
	permanent = TRUE;
	description = "Co v?? o tom atent?tu?";
};


func int DIA_Addon_Emilio_Attentat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Emilio_VonEmilio) && Npc_IsDead(Senyan))
	{
		return FALSE;
	}
	else if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Emilio_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Attentat_15_00");	//Co v?? o tom atent?tu?
	if(Emilio_Switch == 0)
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_01");	//(?zkustliv?) Hej, j? s t?m nic nem?m!
		Emilio_Switch = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_02");	//(?zkostliv?) PRANIC!!
		Emilio_Switch = 0;
	};
};


instance DIA_Addon_BDT_10015_Emilio_Senyan(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 1;
	condition = DIA_Addon_Emilio_Senyan_Condition;
	information = DIA_Addon_Emilio_Senyan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Emilio_Senyan_Condition()
{
	if(Npc_IsDead(Senyan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Senyan_Info()
{
	if(Senyan_Called == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_00");	//(t?zav?) ?ekni mi PRO? Senyan volal: 'Pod?vejme se kohopak to tu m?me'?
		AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_01");	//(su?e) Nevyrovnan? ??ty.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_02");	//Tys zabil Senyana!
	};
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_03");	//A jako co?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_04");	//(usp?chan?) Bez probl?mu.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_05");	//Na druhou stranu. (sarkasticky) Je to kus pr?ce pro Estebana.
	Senyan_CONTRA = LOG_SUCCESS;
	B_LogEntry(Topic_Addon_Esteban,"Emilio nen? na Estebanov? stran?.");
};


instance DIA_Addon_Emilio_Jetzt(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 5;
	condition = DIA_Addon_Emilio_Jetzt_Condition;
	information = DIA_Addon_Emilio_Jetzt_Info;
	permanent = FALSE;
	description = "Pro? nejsi v dole?";
};


func int DIA_Addon_Emilio_Jetzt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10015_Emilio_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Jetzt_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Jetzt_15_00");	//Pro? te? nejsi v dole?
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_01");	//Byl jsem v dole dost dlouho. Nyn? si pot?ebuji p?r dn? odpo?inout.
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_02");	//Tedy dokud nedostanu dal?? ?erven? k?men.
};


instance DIA_Addon_Emilio_VonEmilio(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 6;
	condition = DIA_Addon_Emilio_VonEmilio_Condition;
	information = DIA_Addon_Emilio_VonEmilio_Info;
	permanent = FALSE;
	description = "Lennar mi neco o tob? ?ekl ...";
};


func int DIA_Addon_Emilio_VonEmilio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Emilio_Jetzt) && Npc_KnowsInfo(other,DIA_Addon_Lennar_Attentat))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_VonEmilio_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_00");	//Lennar mi n?co o tob? ?ekl ...
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_01");	//Lennar? Ten chlap je idiot! To mus?? uznat.
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_02");	//?ekl ?es nebyl v dole od toho pokusu o atent?t.
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_03");	//(vystra?en?) J? ... nic nev?m!
	if(!Npc_IsDead(Senyan))
	{
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_04");	//Pracuje? s Senyanem, nebo ne?
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_05");	//Oba jste se spojili s Estebanem. Sly?el jsem, co jste si pov?dali.
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_06");	//Dosud jsem s Estebanem nem?l nic spole?n?ho. Pro? bych m?l v??it jeho lidem?
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_07");	//Nech m? o samot?!
		AI_StopProcessInfos(self);
	};
	B_LogEntry(Topic_Addon_Esteban,"Emilio si mysl?, ?e Lennar je idiot.");
};


instance DIA_Addon_Emilio_HilfMir(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 7;
	condition = DIA_Addon_Emilio_HilfMir_Condition;
	information = DIA_Addon_Emilio_HilfMir_Info;
	permanent = FALSE;
	description = "Pomoz mi naj?t lidi, co maj? n?co spole?n?ho s atent?tem na Estebana !";
};


func int DIA_Addon_Emilio_HilfMir_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Emilio_VonEmilio) && Npc_IsDead(Senyan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_HilfMir_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_00");	//Pomoz mi naj?t toho, kdo cht?l sp?chat ten pokus o atent?t!
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_01");	//Ne! Nechci s t?m nic m?t!
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_02");	//Jestli idiot jako Lennar zjist? n?co o tv?m podivn?m chov?n?, nebude to dlouho trvat a Esteban to zjist? taky.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_03");	//(p?ekvapen?) J? ... doprdele! ?eknu pouze jm?no. Nic v?c.
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_04");	//Poslouch?m.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_05");	//Huno ... b?? za Hunem. M?l by n?co v?d?t.
	Emilio_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban,"Emilio nakonec ?ekl jedno jm?no - Huno.");
};


instance DIA_Addon_Emilio_GegenEsteban(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 8;
	condition = DIA_Addon_Emilio_GegenEsteban_Condition;
	information = DIA_Addon_Emilio_GegenEsteban_Info;
	permanent = FALSE;
	description = "Co m?? proti Estebanovi?";
};


func int DIA_Addon_Emilio_GegenEsteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10015_Emilio_Senyan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_GegenEsteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_GegenEsteban_15_00");	//Co m?? proti Estebanovi?
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_01");	//To prase mysl? jen na pen?ze.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_02");	//Ka?d? den je n?kdo se?r?n d?ln?mi ?ervy.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_03");	//Ale Esteban nechce poslat do dolu bojovn?ky.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_04");	//A pro?? Proto?e chlapi jsou sou??st? "Ravenovy str??e" a on se boj? jim n?co p?ik?zat.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_05");	//Nam?sto toho n?s rad?ji nech? zat?epat ba?korama!
};


instance DIA_Addon_BDT_10015_Emilio_Mine(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 9;
	condition = DIA_Addon_Emilio_Mine_Condition;
	information = DIA_Addon_Emilio_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Emilio_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Mine_10_00");	//Tak, nyn? jsi tu ??f ty. Dobr?, pak to ud?l?m posv?m.
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Emilio_Hacker(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 9;
	condition = DIA_Addon_Emilio_Hacker_Condition;
	information = DIA_Addon_Emilio_Hacker_Info;
	permanent = TRUE;
	description = "Co je nov?ho?";
};


func int DIA_Addon_Emilio_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Emilio_Hacker_15_00");	//Co je nov?ho?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Emilio_Hacker_10_01");	//Pracuju tvrd?. Dob?e, nejd?le?it?j?? v?c je, ?e se nestanu ?r?dlem pro ?ervy.
};

