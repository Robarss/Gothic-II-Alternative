
instance DIA_Talbin_NW_EXIT(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 999;
	condition = DIA_Talbin_EXIT_Condition;
	information = DIA_Talbin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Talbin_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_NW(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = DIA_Talbin_NW_Condition;
	information = DIA_Talbin_NW_Info;
	description = "V tom pr˘smyku to nebylo tak hroznÈ, co?";
};


func int DIA_Talbin_NW_Condition()
{
	return TRUE;
};

func void DIA_Talbin_NW_Info()
{
	AI_Output(other,self,"DIA_Talbin_NW_15_00");	//V tom pr˘smyku to nebylo tak hroznÈ, co?
	AI_Output(self,other,"DIA_Talbin_NW_07_01");	//DÌky za z·chranu.
	AI_Output(self,other,"DIA_Talbin_NW_07_02");	//Na, tenhle öutr·k sem naöel v pr˘smyku. MyslÌm, ûe se ti bude hodit.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_03");	//PoËÌt·m, ûe je to runovej k·men.
		CreateInvItems(self,ItMi_RuneBlank,1);
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_04");	//NejspÌö to bude kousek rudy.
		CreateInvItems(self,ItMi_Nugget,1);
		B_GiveInvItems(self,other,ItMi_Nugget,1);
	};
	AI_Output(self,other,"DIA_Talbin_NW_07_05");	//Nechù tÏ Innos ochraÚuje.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Farm");
	TOPIC_END_Talbin_Runs = TRUE;
	B_GivePlayerXP(XP_SavedTalbin);
};


instance DIA_Talbin_NW_PERM(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = DIA_Talbin_NW_PERM_Condition;
	information = DIA_Talbin_NW_PERM_Info;
	permanent = TRUE;
	description = "Je vöechno v po¯·dku?";
};


func int DIA_Talbin_NW_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_NW))
	{
		return TRUE;
	};
};

func void DIA_Talbin_NW_PERM_Info()
{
	AI_Output(other,self,"DIA_Talbin_NW_PERM_15_00");	//Je vöechno v po¯·dku?
	AI_Output(self,other,"DIA_Talbin_NW_PERM_07_01");	//Jo, dÌky tobÏ. A teÔ uû bÏû, budu v pohodÏ.
	AI_StopProcessInfos(self);
};

