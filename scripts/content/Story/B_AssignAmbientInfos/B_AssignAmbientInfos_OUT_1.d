
instance DIA_OUT_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OUT_1_EXIT_Condition;
	information = DIA_OUT_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OUT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OUT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OUT_1_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_OUT_1_STANDARD_Condition;
	information = DIA_OUT_1_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_OUT_1_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OUT_1_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_01_00");	//Od t? doby, co bari?ra kolem trestaneck? kolonie vzala za sv?, m?me neust?le probl?my s bandity.
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_01_01");	//Na domobranu nen? ??dn? spoleh. Mus?me se um?t br?nit sami.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_01_02");	//Nenech?m se nik?m vyu??vat. Ani kr?lem, ani Onarem. Jsem jen s?m za sebe.
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_OUT_1(var C_Npc slf)
{
	dia_out_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_out_1_standard.npc = Hlp_GetInstanceID(slf);
};

