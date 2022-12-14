
func void B_FollowMe_Wisp()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_FollowMe_Wisp_15_00");	//Poj? za mnou.
};


instance DIA_Addon_WispDetector_EXIT(C_Info)
{
	npc = Wisp_Detector;
	nr = 999;
	condition = DIA_Addon_WispDetector_EXIT_Condition;
	information = DIA_Addon_WispDetector_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_WispDetector_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_EXIT_Info()
{
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_WispDetector_DetectItems(C_Info)
{
	npc = Wisp_Detector;
	nr = 5;
	condition = DIA_Addon_WispDetector_DetectItems_Condition;
	information = DIA_Addon_WispDetector_DetectItems_Info;
	permanent = TRUE;
	description = "Pot?ebuji...";
};


func int DIA_Addon_WispDetector_DetectItems_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_DetectItems_Info()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_15_00");	//Pot?ebuji...
	Info_ClearChoices(DIA_Addon_WispDetector_DetectItems);
	Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Poj? za mnou.",DIA_Addon_WispDetector_DetectItems_Follow);
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... runy a svitky.",DIA_Addon_WispDetector_DetectItems_RUNE);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... zlato, kl??e a hlavn? zbo??.",DIA_Addon_WispDetector_DetectItems_NONE);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... st?eln? zbran? a munici.",DIA_Addon_WispDetector_DetectItems_FF);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... zbran? pro boj na bl?zko.",DIA_Addon_WispDetector_DetectItems_NF);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... j?dlo a byliny.",DIA_Addon_WispDetector_DetectItems_FOOD);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... prsteny a amulety.",DIA_Addon_WispDetector_DetectItems_MAGIC);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... jak?koliv lektvary.",DIA_Addon_WispDetector_DetectItems_POTIONS);
	};
	Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... aby si mi uk?zal v?e, co najde?.",DIA_Addon_WispDetector_DetectItems_ALL);
};

func void DIA_Addon_WispDetector_DetectItems_Follow()
{
	B_FollowMe_Wisp();
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
	WispSearching = WispSearch_Follow;
};

func void DIA_Addon_WispDetector_DetectItems_ALL()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_ALL_15_00");	//aby si mi uk?zal v?e, co najde?.
	WispSearching = WispSearch_ALL;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_POTIONS()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_POTIONS_15_00");	//jak?koliv lektvary.
	WispSearching = WispSearch_POTIONS;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_MAGIC()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_MAGIC_15_00");	//prsteny a amulety.
	WispSearching = WispSearch_MAGIC;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_FOOD()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_FOOD_15_00");	//j?dlo a byliny.
	WispSearching = WispSearch_FOOD;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_NF()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_NF_15_00");	//zbran? pro boj na bl?zko.
	WispSearching = WispSearch_NF;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_FF()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_FF_15_00");	//st?eln? zbran? a munici.
	WispSearching = WispSearch_FF;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_NONE()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_NONE_15_00");	//zlato, kl??e a hlavn? zbo??.
	WispSearching = WispSearch_NONE;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_RUNE()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_RUNE_15_00");	//runy a svitky.
	WispSearching = WispSearch_RUNE;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_WispDetector_Follow(C_Info)
{
	npc = Wisp_Detector;
	nr = 5;
	condition = DIA_Addon_WispDetector_Follow_Condition;
	information = DIA_Addon_WispDetector_Follow_Info;
	permanent = TRUE;
	description = "Poj? za mnou.";
};


func int DIA_Addon_WispDetector_Follow_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_Follow_Info()
{
	B_FollowMe_Wisp();
	WispSearching = WispSearch_Follow;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

