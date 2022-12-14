
instance DIA_NONE_101_MARIO_DI_EXIT(C_Info)
{
	npc = None_101_Mario_DI;
	nr = 999;
	condition = DIA_NONE_101_MARIO_DI_EXIT_Condition;
	information = DIA_NONE_101_MARIO_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NONE_101_MARIO_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_101_MARIO_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_101_MARIO_DI_Job(C_Info)
{
	npc = None_101_Mario_DI;
	nr = 4;
	condition = DIA_NONE_101_MARIO_DI_Job_Condition;
	information = DIA_NONE_101_MARIO_DI_Job_Info;
	permanent = TRUE;
	description = "M?? jedine?nou p??le?itost dok?zat sv? schopnosti v boji.";
};


func int DIA_NONE_101_MARIO_DI_Job_Condition()
{
	if((Npc_IsDead(UndeadDragon) == FALSE) && (ORkSturmDI == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_101_MARIO_DI_Job_Info()
{
	AI_Output(other,self,"DIA_NONE_101_MARIO_DI_Job_15_00");	//M?? jedine?nou p??le?itost dok?zat sv? schopnosti v boji.
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_Job_07_01");	//Pomalu. V?echno m? sv?j ?as.
	AI_Output(other,self,"DIA_NONE_101_MARIO_DI_Job_15_02");	//Hmm. P?esn? to jsem od tebe ?ekal.
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_Job_07_03");	//Jen po?kej.
};


instance DIA_NONE_101_MARIO_DI_ambush(C_Info)
{
	npc = None_101_Mario_DI;
	nr = 4;
	condition = DIA_NONE_101_MARIO_DI_ambush_Condition;
	information = DIA_NONE_101_MARIO_DI_ambush_Info;
	important = TRUE;
};


func int DIA_NONE_101_MARIO_DI_ambush_Condition()
{
	if(ORkSturmDI == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_101_MARIO_DI_ambush_Info()
{
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_ambush_07_00");	//Poj? bl??. Tak, p??teli. Te? mi uka?, co m??.
	AI_Output(other,self,"DIA_NONE_101_MARIO_DI_ambush_15_01");	//Co t?m mysl???
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_ambush_07_02");	//Je to prost?. P?n t? u? m? dost.
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_ambush_07_03");	//M?l jsem t? zab?t u? d??v. Ale j? a m? p??tel? tu chybu hned naprav?me.
	Info_ClearChoices(DIA_NONE_101_MARIO_DI_ambush);
	Info_AddChoice(DIA_NONE_101_MARIO_DI_ambush,Dialog_Ende,DIA_NONE_101_MARIO_DI_ambush_ambush);
	B_GivePlayerXP(XP_Mario_Ambush);
	MIS_Mario_Ambush = LOG_SUCCESS;
};

func void DIA_NONE_101_MARIO_DI_ambush_ambush()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	Skeleton_Mario1.aivar[AIV_EnemyOverride] = FALSE;
	Skeleton_Mario2.aivar[AIV_EnemyOverride] = FALSE;
	Skeleton_Mario3.aivar[AIV_EnemyOverride] = FALSE;
	Skeleton_Mario4.aivar[AIV_EnemyOverride] = FALSE;
};


instance DIA_MARIO_DI_PICKPOCKET(C_Info)
{
	npc = None_101_Mario_DI;
	nr = 900;
	condition = DIA_MARIO_DI_PICKPOCKET_Condition;
	information = DIA_MARIO_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_MARIO_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(71,110);
};

func void DIA_MARIO_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_mario_di_pickpocket);
	Info_AddChoice(dia_mario_di_pickpocket,Dialog_Back,dia_mario_di_pickpocket_back);
	Info_AddChoice(dia_mario_di_pickpocket,DIALOG_PICKPOCKET,DIA_MARIO_DI_PICKPOCKET_DoIt);
};

func void DIA_MARIO_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_mario_di_pickpocket);
};

func void dia_mario_di_pickpocket_back()
{
	Info_ClearChoices(dia_mario_di_pickpocket);
};

