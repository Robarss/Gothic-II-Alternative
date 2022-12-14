
instance DIA_1052_Wegelagerer_EXIT(C_Info)
{
	npc = BDT_1052_Wegelagerer;
	nr = 999;
	condition = DIA_1052_Wegelagerer_EXIT_Condition;
	information = DIA_1052_Wegelagerer_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_1052_Wegelagerer_EXIT_Condition()
{
	return TRUE;
};

func void DIA_1052_Wegelagerer_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1052_Wegelagerer_Hello(C_Info)
{
	npc = BDT_1052_Wegelagerer;
	nr = 1;
	condition = DIA_1052_Wegelagerer_Hello_Condition;
	information = DIA_1052_Wegelagerer_Hello_Info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int DIA_1052_Wegelagerer_Hello_Condition()
{
	var C_Npc Pal;
	Pal = Hlp_GetNpc(BDT_1051_Wegelagerer);
	if(C_NpcIsDown(Pal) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_1052_Wegelagerer_Hello_Info()
{
	AI_Output(other,self,"DIA_1052_Wegelagerer_Hello_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_1052_Wegelagerer_Hello_06_01");	//Co to je? N?jak? v?slech?
	AI_Output(self,other,"DIA_1052_Wegelagerer_Hello_06_02");	//Nem?m, co bych ti ?ekl, ale mo?n? by sis cht?l promluvit tady s m?m k?mo?em.
	AI_Output(self,other,"DIA_1052_Wegelagerer_Hello_06_03");	//Ale bacha, cizince nem? zrovna v l?sce.
};


instance DIA_Wegelagerer_ANGRIFF2(C_Info)
{
	npc = BDT_1052_Wegelagerer;
	nr = 2;
	condition = DIA_Wegelagerer_ANGRIFF2_Condition;
	information = DIA_Wegelagerer_ANGRIFF2_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Wegelagerer_ANGRIFF2_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && C_NpcIsDown(BDT_1051_Wegelagerer))
	{
		return TRUE;
	};
};

func void DIA_Wegelagerer_ANGRIFF2_Info()
{
	AI_Output(self,other,"DIA_Wegelagerer_ANGRIFF2_06_00");	//Jak chce?, k?mo. Tohle si vypije?.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,40);
	self.aivar[AIV_EnemyOverride] = FALSE;
	BDT_1051_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE;
};

