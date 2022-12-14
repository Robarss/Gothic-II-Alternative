
instance DIA_Niclas_EXIT(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 999;
	condition = DIA_Niclas_EXIT_Condition;
	information = DIA_Niclas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Niclas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Niclas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Niclas_Hello(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = DIA_Niclas_Hello_Condition;
	information = DIA_Niclas_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Niclas_Hello_Condition()
{
	return TRUE;
};

func void DIA_Niclas_Hello_Info()
{
	AI_Output(self,other,"DIA_Niclas_Hello_03_00");	//Taky jsi na ?t?ku?
	AI_Output(other,self,"DIA_Niclas_Hello_15_01");	//Pro? si to mysl???
	AI_Output(self,other,"DIA_Niclas_Hello_03_02");	//Pro? bys sem jinak chodil tak s?m? Tady nen? v?bec NIC.
};


instance DIA_Niclas_HaveALook(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = DIA_Niclas_HaveALook_Condition;
	information = DIA_Niclas_HaveALook_Info;
	permanent = FALSE;
	description = "Jen jsem se tu cht?l trochu porozhl?dnout po okol?.";
};


func int DIA_Niclas_HaveALook_Condition()
{
	return TRUE;
};

func void DIA_Niclas_HaveALook_Info()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_15_00");	//Jen jsem se tu cht?l trochu porozhl?dnout po okol?.
	AI_Output(self,other,"DIA_Niclas_HaveALook_03_01");	//Dobr?, pova?uj se za m?ho hosta. Dal by sis kousek masa?
	CreateInvItems(self,ItFoMutton,1);
	Info_ClearChoices(DIA_Niclas_HaveALook);
	Info_AddChoice(DIA_Niclas_HaveALook,"Ne, d?ky.",DIA_Niclas_HaveALook_No);
	Info_AddChoice(DIA_Niclas_HaveALook,"S pot??en?m.",DIA_Niclas_HaveALook_Yes);
};

func void DIA_Niclas_HaveALook_No()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_No_15_00");	//Ne, d?ky.
	AI_Output(self,other,"DIA_Niclas_HaveALook_No_03_01");	//Jak je libo. Douf?m, ?e ti nebude vadit, kdy? si s?m n?co zakousnu.
	B_UseItem(self,ItFoMutton);
	Info_ClearChoices(DIA_Niclas_HaveALook);
};

func void DIA_Niclas_HaveALook_Yes()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_Yes_15_00");	//S pot??en?m.
	AI_Output(self,other,"DIA_Niclas_HaveALook_Yes_03_01");	//Tady, ta nejlep?? krysokrt? kejti?ka. Podle m?ho vlastn?ho receptu.
	B_GiveInvItems(self,other,ItFoMutton,1);
	Info_ClearChoices(DIA_Niclas_HaveALook);
};


instance DIA_Niclas_WhyHere(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_WhyHere_Condition;
	information = DIA_Niclas_WhyHere_Info;
	permanent = FALSE;
	description = "Tak pro? jsi tady?";
};


func int DIA_Niclas_WhyHere_Condition()
{
	return TRUE;
};

func void DIA_Niclas_WhyHere_Info()
{
	AI_Output(other,self,"DIA_Niclas_WhyHere_15_00");	//Tak pro? jsi tady?
	AI_Output(self,other,"DIA_Niclas_WhyHere_03_01");	//Nalezl jsem tu klid. Ve m?st? jsem se v?dycky c?til tak st?sn?n?.
};


instance DIA_Niclas_ShouldntWork(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_ShouldntWork_Condition;
	information = DIA_Niclas_ShouldntWork_Info;
	permanent = FALSE;
	description = "Nem?l bys pracovat?";
};


func int DIA_Niclas_ShouldntWork_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_WhyHere))
	{
		return TRUE;
	};
};

func void DIA_Niclas_ShouldntWork_Info()
{
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_00");	//Nem?l bys pracovat?
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_01");	//V?echno, co pot?ebuju, si m??u ud?lat s?m. Vyr?b?m si ??py a p??roda mi poskytuje maso.
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_02");	//Tak?e jsi lovec.
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_03");	//Ano, pokud tomu tak chce? ??kat. Ale lov?m jen pro vlastn? pot?ebu. Nelov?m pro pen?ze.
};


instance DIA_Niclas_CanTeachMe(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_CanTeachMe_Condition;
	information = DIA_Niclas_CanTeachMe_Info;
	permanent = FALSE;
	description = "V tom p??pad? bys m? mohl n?co nau?it.";
};


func int DIA_Niclas_CanTeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_ShouldntWork))
	{
		return TRUE;
	};
};

func void DIA_Niclas_CanTeachMe_Info()
{
	AI_Output(other,self,"DIA_Niclas_CanTeachMe_15_00");	//V tom p??pad? bys m? mohl n?co nau?it.
	AI_Output(self,other,"DIA_Niclas_CanTeachMe_03_01");	//Pro? ne. M??u ti uk?zat, jak se zach?z? s lukem a v?robu st?eln? munice.
	Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher,"Niclas mi m??e p?edv?st, jak se zdokonalit v lukost?elb?.");
	B_LogEntry(TOPIC_Teacher,"Niclas m? m??e nau?it vyrobit ??pi a st?eli.");
};


instance DIA_Niclas_Teach(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_Teach_Condition;
	information = DIA_Niclas_Teach_Info;
	permanent = TRUE;
	description = "Uka? mi, jak se zach?z? s lukem.";
};


func int DIA_Niclas_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_CanTeachMe))
	{
		return TRUE;
	};
};

func void DIA_Niclas_Teach_Info()
{
	AI_Output(other,self,"DIA_Niclas_Teach_15_00");	//Uka? mi, jak se zach?z? s lukem.
	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_01");	//U? jsem t? nau?il v?emu, co zn?m. M?l by sis naj?t jin?ho u?itele.
	}
	else
	{
		Info_ClearChoices(DIA_Niclas_Teach);
		Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
		Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
		Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
	};
};

func void DIA_Niclas_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_00");	//U? t? nem??u nau?it ni?emu dal??mu.
	};
	Info_ClearChoices(DIA_Niclas_Teach);
};

func void DIA_Niclas_Teach_BOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(DIA_Niclas_Teach);
	Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
	Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
};

func void DIA_Niclas_Teach_BOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(DIA_Niclas_Teach);
	Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
	Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice(DIA_Niclas_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
};


instance DIA_NICLAS_LEARNII(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 3;
	condition = dia_niclas_learnii_condition;
	information = dia_niclas_learnii_info;
	permanent = TRUE;
	description = "V?roba ??pu a st?el (cena: 3 VB)";
};


func int dia_niclas_learnii_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Niclas_CanTeachMe) && (KNOWS_ARROWBOLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_niclas_learnii_info()
{
	AI_Output(other,self,"DIA_Niclas_Learn1_15_00");	//Nau? m? vyrobit ??pi a st?eli.
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		B_TeachThiefTalent(self,other,NPC_TALENT_ARROW_BOLT);
		AI_Output(self,other,"DIA_Niclas_Learn1_12_01");	//Bude? pot?ebovat d?evo na v?robu a ocel.
		AI_Output(self,other,"DIA_Niclas_Learn1_12_02");	//Nejl?pe se st?m pracuje na truhl??sk? d?ln?.
		AI_Output(self,other,"DIA_Niclas_Learn1_12_04");	//A je to, u? nebude? muset platit takov? prachy za st?elivo.
		Log_CreateTopic(TOPIC_ARROW,LOG_NOTE);
		B_LogEntry(TOPIC_ARROW,"Umim vyrobit: ??pi a st?eli.");
		B_LogEntry(TOPIC_ARROW,"Material na v?robu: D?evo na v?robu a surov? ocel.");
		KNOWS_ARROWBOLT = TRUE;
		PrintScreen("Um?m vyrobit: st?elnou munici",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek v?domostn?ch bod?!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Niclas_PICKPOCKET(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 900;
	condition = DIA_Niclas_PICKPOCKET_Condition;
	information = DIA_Niclas_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Niclas_PICKPOCKET_Condition()
{
	return C_Beklauen(27,20);
};

func void DIA_Niclas_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
	Info_AddChoice(DIA_Niclas_PICKPOCKET,Dialog_Back,DIA_Niclas_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Niclas_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Niclas_PICKPOCKET_DoIt);
};

func void DIA_Niclas_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
};

func void DIA_Niclas_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
};

