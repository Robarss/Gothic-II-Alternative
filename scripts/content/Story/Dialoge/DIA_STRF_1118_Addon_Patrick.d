
instance DIA_Addon_Patrick_EXIT(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 999;
	condition = DIA_Addon_Patrick_EXIT_Condition;
	information = DIA_Addon_Patrick_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Patrick_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Patrick_Hi(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Hi_Condition;
	information = DIA_Addon_Patrick_Hi_Info;
	permanent = FALSE;
	description = "Jsem zde na rozkaz m?g? Vody a v?echny v?s osvobod?m.";
};


func int DIA_Addon_Patrick_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_00");	//Jsem zde na rozkaz m?g? Vody a v?echny v?s osvobod?m.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_01");	//(podez??vav?) Opravdu? Pro? bych ti m?l v??it?
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_02");	//Tak chcete odsud vypadnout nebo ne?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_03");	//Samoz?ejm?, ?e chci - ale ...
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_04");	//Vatras m? poslal. Jestli se v?m to nezd? dobr?, pak m??ete hn?t v t?to d??e, o co? se postar?m.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_05");	//(rychle) V po??dku, v???m ti.
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_06");	//(zara?en?) Opravdu? Bylo to jednodu???, ne? jsem o?ek?val. OK, v?e, co nyn? pot?ebujeme, je pl?n.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_07");	//Pokusit se o ?t?k je p??li? riskantn?. William to zkou?el a koupil si farmu.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_08");	//V?zni jsou farm??i a d?ln?ci - v??? mi, ale nebudou riskovat nebezpe??.
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
	Info_AddChoice(DIA_Addon_Patrick_Hi,"O?ek?v?te mne, abych dostal pro v?s od Ravena milost?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice(DIA_Addon_Patrick_Hi,"To mus?m zab?t v?echny bandity, abyste si pohli?",DIA_Addon_Patrick_Hi_Kill);
};

func void B_Say_Patrick_Plan()
{
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_00");	//Ale to nen? pl?n.
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_01");	//Jen n?s ujisti, ?e str??e na n?s neza?to??, a my p?jdeme odsud pry?.
	AI_Output(other,self,"DIA_Addon_Patrick_Plan_15_02");	//Dobr?, postar?m se o to. ?ekni ostatn?m, aby se p?ipravili.
	B_LogEntry(TOPIC_Addon_Sklaven,"Otroci se nepokus? o ?t?k. Mus?m naj?t zp?sob, aby ode?li bez n?mitek.");
};

func void DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Raven_15_00");	//O?ek?v?te ode mne, ?e pro v?s dostanu od Ravena milost?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Raven_07_01");	//(usm?vav?) To by nebylo tak ?patn?.
	B_Say_Patrick_Plan();
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
};

func void DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Kill_15_00");	//To mus?m zab?t v?echny bandity, aby jste se pohli?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Kill_07_01");	//(p?ekvapen?) To by bylo ??lenstv?!
	B_Say_Patrick_Plan();
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
};


instance DIA_Addon_Patrick_ready(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_ready_Condition;
	information = DIA_Addon_Patrick_ready_Info;
	permanent = FALSE;
	description = "V?e v pohod?, m??ete j?t.";
};


func int DIA_Addon_Patrick_ready_Condition()
{
	if(((Ready_Togo == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi)) || (Npc_IsDead(PrisonGuard) && Npc_IsDead(Bloodwyn) && Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer)) || (Npc_IsDead(Thorus) && Npc_IsDead(Bloodwyn) && Npc_IsDead(PrisonGuard)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Patrick_ready_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_00");	//V?e v pohod?, m??ete j?t.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_01");	//Dob?e, zn?m jeskyni v ba?in?ch. Shrom??d?me se tam, ale co budeme d?lat pak?
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_02");	//Dejte se mo??lem p??mo k jihoz?padu. M?gov? Vody si tam v ruin?ch zalo?ili t?bor.
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_03");	//Uk??ou v?m cestu z tohohle ?dol?.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_04");	//D?kuji ti, d?kuji ti moc. (form?ln?) Jsme ti hluboce zav?z?ni ...
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_05");	//Nechte to tak!
	Sklaven_Flucht = TRUE;
	B_GivePlayerXP(XP_Addon_Flucht);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLUCHT");
	B_StartOtherRoutine(Telbor,"FLUCHT");
	B_StartOtherRoutine(Tonak,"FLUCHT");
	B_StartOtherRoutine(Pardos,"FLUCHT");
	B_StartOtherRoutine(Monty,"FLUCHT");
	B_StartOtherRoutine(Buddler_1,"WORK");
	B_StartOtherRoutine(Buddler_2,"WORK");
	B_StartOtherRoutine(Buddler_3,"WORK");
	B_RemoveNpc(STRF_1128_Addon_Sklave);
	B_RemoveNpc(STRF_1129_Addon_Sklave);
	B_RemoveNpc(STRF_1130_Addon_Sklave);
	B_RemoveNpc(STRF_1136_Addon_Sklave);
	B_RemoveNpc(STRF_1137_Addon_Sklave);
	B_RemoveNpc(STRF_1138_Addon_Sklave);
	B_RemoveNpc(STRF_1139_Addon_Sklave);
	B_RemoveNpc(STRF_1140_Addon_Sklave);
};


instance DIA_Addon_Patrick_Killer(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Killer_Condition;
	information = DIA_Addon_Patrick_Killer_Info;
	permanent = FALSE;
	description = "Str??e jsou vy??zeny, m??ete j?t.";
};


func int DIA_Addon_Patrick_Killer_Condition()
{
	if(Npc_IsDead(PrisonGuard) && (Ready_Togo == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Patrick_Killer_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Killer_15_00");	//Str??e jsou vy??zeny, m??ete j?t.
	AI_Output(self,other,"DIA_Addon_Patrick_Killer_07_01");	//A co se stane, kdy? opust?me d?l? Ostatn? str??e n?s zabij?, kdekoliv si stoupneme. Nikdy. P??li? riskantn?.
};


instance DIA_Addon_Patrick_Hoehle(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Hoehle_Condition;
	information = DIA_Addon_Patrick_Hoehle_Info;
	permanent = TRUE;
	description = "Nechcete odej?t???";
};


func int DIA_Addon_Patrick_Hoehle_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_BL_HOEHLE_04") <= 1000)
	{
		return TRUE;
	};
};

func void DIA_Addon_Patrick_Hoehle_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hoehle_15_00");	//Nechcete odej?t???
	AI_Output(self,other,"DIA_Addon_Patrick_Hoehle_07_01");	//Samoz?ejm?, ?e chceme. Pouze ?ek?me na vhodou p??le?itost.
};

