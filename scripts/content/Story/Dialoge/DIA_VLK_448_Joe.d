
instance DIA_Joe_EXIT(C_Info)
{
	npc = VLK_448_Joe;
	nr = 999;
	condition = DIA_Joe_EXIT_Condition;
	information = DIA_Joe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Joe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Joe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Joe_PICKPOCKET(C_Info)
{
	npc = VLK_448_Joe;
	nr = 900;
	condition = DIA_Joe_PICKPOCKET_Condition;
	information = DIA_Joe_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Joe_PICKPOCKET_Condition()
{
	return C_Beklauen(25,25);
};

func void DIA_Joe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Joe_PICKPOCKET);
	Info_AddChoice(DIA_Joe_PICKPOCKET,Dialog_Back,DIA_Joe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Joe_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Joe_PICKPOCKET_DoIt);
};

func void DIA_Joe_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Joe_PICKPOCKET);
};

func void DIA_Joe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Joe_PICKPOCKET);
};


instance DIA_Joe_Hallo(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = DIA_Joe_Hallo_Condition;
	information = DIA_Joe_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Joe_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Joe_Hallo_Info()
{
	AI_Output(self,other,"DIA_Joe_Hallo_10_00");	//Hej, d?ky, chlape, v??n? d?kuju. U? jsem si myslel, ?e se odsud nikdy nedostanu.
	TOPIC_END_Joe = TRUE;
	B_GivePlayerXP(XP_Ambient * 4);
	AI_Output(other,self,"DIA_Joe_Hallo_15_01");	//Co TADY d?l???
	AI_Output(self,other,"DIA_Joe_Hallo_10_02");	//Jsem tu zam?enej. Ty dve?e byly otev?en? a j? se tu jen cht?l trochu porozhl?dnout - ale jakmile jsem vlez dovnit?, p?i?el str??ce a ty zatracen? dve?e zamknul.
	AI_Output(self,other,"DIA_Joe_Hallo_10_03");	//Je to fakt trapas - byl bych ti vd??nej, kdyby to z?stalo jen mezi n?ma.
	AI_Output(other,self,"DIA_Joe_Hallo_15_04");	//Rozum?m. V??n? to nen? nic p??jemn?ho.
	AI_Output(self,other,"DIA_Joe_Hallo_10_05");	//M?m dojem, ?e pot?ebuju pan?ka.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Joe_Perm(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = DIA_Joe_Perm_Condition;
	information = DIA_Joe_Perm_Info;
	permanent = TRUE;
	description = "Je v?echno v po??dku?";
};


func int DIA_Joe_Perm_Condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Joe_Perm_Info()
{
	AI_Output(other,self,"DIA_Joe_Perm_15_00");	//Je v?echno v po??dku?
	AI_Output(self,other,"DIA_Joe_Perm_10_01");	//D?ky, ?es m? z toho dostal.
	AI_StopProcessInfos(self);
};


instance DIA_Joe_Sign(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = DIA_Joe_Sign_Condition;
	information = DIA_Joe_Sign_Info;
	permanent = FALSE;
	description = "(P?edv?st zlod?jsk? sign?l.)";
};


func int DIA_Joe_Sign_Condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500) && (Knows_SecretSign == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Joe_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Joe_Sign_10_00");	//Hej, co ty v?? - mo?n? m?me spole?n? p??tele. V tom p??pad? mi dovol vyj?d?it svou vd??nost za svoji z?chranu.
	AI_Output(self,other,"DIA_Joe_Sign_10_01");	//Tady, vezmi si tyhle ?perh?ky - jsem si jist, ?e se ti budou hodit.
	B_GiveInvItems(self,other,ItKE_lockpick,5);
	AI_StopProcessInfos(self);
};

