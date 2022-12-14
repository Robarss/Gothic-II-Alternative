
instance DIA_Addon_Malcom_EXIT(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 999;
	condition = DIA_Addon_Malcom_EXIT_Condition;
	information = DIA_Addon_Malcom_EXIT_Info;
	permanent = TRUE;
	description = "Mus?m j?t.";
};


func int DIA_Addon_Malcom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Malcom_EXIT_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_perm_15_00");	//Mus?m j?t.
	if(MalcomBotschaft == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_perm_04_01");	//Nenech se n???m se?rat. Je velmi nebezpe?n?, se kolem jen tak potulovat.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_03");	//Hej, jestli p?jde? do t?bora, vy?i? Henrymu ode m? n?co.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_04");	//Stromy tady kolem jsou velmi nezdoln?.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_05");	//Nem?l by o?ek?vat d?evo v bl?zk? dob?. ?ekni mu to.
		MalcomBotschaft = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Malcom_PICKPOCKET(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 900;
	condition = DIA_Addon_Malcom_PICKPOCKET_Condition;
	information = DIA_Addon_Malcom_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Malcom_PICKPOCKET_Condition()
{
	return C_Beklauen(20,30);
};

func void DIA_Addon_Malcom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Malcom_PICKPOCKET,Dialog_Back,DIA_Addon_Malcom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Malcom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Malcom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Malcom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
};

func void DIA_Addon_Malcom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
};


instance DIA_Addon_Malcom_Hello(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 1;
	condition = DIA_Addon_Malcom_Hello_Condition;
	information = DIA_Addon_Malcom_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Malcom_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_01");	//Ty nejsi odtud, ?e ne?
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_02");	//Zd? se, ?e jsi cestoval pom?rn? dlouho, aby ses sem dostal.
};


instance DIA_Addon_Malcom_WasMachen(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 2;
	condition = DIA_Addon_Malcom_WasMachen_Condition;
	information = DIA_Addon_Malcom_WasMachen_Info;
	description = "Zanepr?zdn?n?";
};


func int DIA_Addon_Malcom_WasMachen_Condition()
{
	return TRUE;
};

func void DIA_Addon_Malcom_WasMachen_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_00");	//Zanepr?zdn?n?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_01");	//Neru? m?. Henry chce, abych zde pok?cel co nejv?c strom?.
	if(Henry.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_02");	//Henry?
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_00");	//Vede na?i skupinu.
	};
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_04");	//Stoj? p?ed vstupem do t?bora a m?rn? kontroluje p??choz?.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_05");	//Star? se o bezpe?nost n??eho t?bora.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_06");	//Pochopiteln? ale nem??e ovlivnit ka?d?ho.
};


instance DIA_Addon_Malcom_Entertrupp(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 5;
	condition = DIA_Addon_Malcom_Entertrupp_Condition;
	information = DIA_Addon_Malcom_Entertrupp_Info;
	description = "Henry je tv?j v?dce?";
};


func int DIA_Addon_Malcom_Entertrupp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Entertrupp_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Entertrupp_15_00");	//Henry je tv?j v?dce?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_03");	//Ano, v?dce na?? skupiny.
	AI_Output(self,other,"DIA_Addon_Malcom_Add_04_01");	//N?? KAPIT?N je ale Greg.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_02");	//Ale nyn? je zrovna pry?.
	};
};


instance DIA_Addon_Malcom_Lager(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 3;
	condition = DIA_Addon_Malcom_Lager_Condition;
	information = DIA_Addon_Malcom_Lager_Info;
	description = "Kde je tv?j t?bor?";
};


func int DIA_Addon_Malcom_Lager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Lager_15_00");	//Kde je tv?j t?bor?
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_01");	//Jen b?? touto cestou na z?pad.
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_02");	//Tam uvid?? Henryho, jak post?v? kolem.
};

