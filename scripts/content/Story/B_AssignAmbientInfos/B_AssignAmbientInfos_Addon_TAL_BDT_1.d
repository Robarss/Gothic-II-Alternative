
instance DIA_Addon_TAL_BDT_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_TAL_BDT_1_EXIT_Condition;
	information = DIA_Addon_TAL_BDT_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_TAL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_TAL_BDT_1_Hi(C_Info)
{
	nr = 2;
	condition = DIA_Addon_TAL_BDT_1_Hi_Condition;
	information = DIA_Addon_TAL_BDT_1_Hi_Info;
	permanent = TRUE;
	description = "Jak to vypad??";
};


func int DIA_Addon_TAL_BDT_1_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Hi_15_00");	//Jak to vypad??
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_01");	//Po?k?m dokud nepo??daj? o dal??ho.
	if(!Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_02");	//Ze v?ech lid? venku se jedin? Franco dost?v? dovnit?.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_03");	//Te? kdy? je Franco mrtv?, budu douf?m m?t v?t?? ?anci.
	};
};


instance DIA_Addon_TAL_BDT_1_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_TAL_BDT_1_Lager_Condition;
	information = DIA_Addon_TAL_BDT_1_Lager_Info;
	permanent = TRUE;
	description = "Co mi m??e? ??ct o t?bo?e?";
};


func int DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Lager_15_00");	//Co mi m??e? ??ct o t?bo?e?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_01");	//D?vej bacha koho obt??uje?. Pokud si za?ne? s dob?e postavenou osobou, p?jdou po tob? v?ichni.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_02");	//V?t?ina z nich nechce ztratit svoje zlato - proto se n?kte?? navz?jem br?n?.
};


instance DIA_Addon_TAL_BDT_1_Raven(C_Info)
{
	nr = 4;
	condition = DIA_Addon_TAL_BDT_1_Raven_Condition;
	information = DIA_Addon_TAL_BDT_1_Raven_Info;
	permanent = TRUE;
	description = "Co v?? o Ravenovi?";
};


func int DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Raven_15_00");	//Co v?? o Ravenovi?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_01");	//Je to chlapik, kter? sem jako prvni p?i?el s jeho bandou.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_02");	//Je to v?dce t?bora. Douf?m, ?e si s n?m nic nehodl?? za??t.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_03");	//Jednou po??dali o p?t nov?ch lid? proto?e si vylil sv?j vztek na sv?ch vlastn?ch lidech.
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Hi.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Raven.npc = Hlp_GetInstanceID(slf);
};

