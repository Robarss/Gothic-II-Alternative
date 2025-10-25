
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
	description = "Jak to vypadá?";
};


func int DIA_Addon_TAL_BDT_1_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Hi_15_00");	//Jak to vypadá?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_01");	//Počkám dokud nepožádají o dalšího.
	if(!Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_02");	//Ze všech lidí venku se jedině Franco dostává dovnitř.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_03");	//Teď když je Franco mrtvý, budu doufám mít větší šanci.
	};
};


instance DIA_Addon_TAL_BDT_1_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_TAL_BDT_1_Lager_Condition;
	information = DIA_Addon_TAL_BDT_1_Lager_Info;
	permanent = TRUE;
	description = "Co mi můžeš říct o táboře?";
};


func int DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Lager_15_00");	//Co mi můžeš říct o táboře?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_01");	//Dávej bacha koho obtěžuješ. Pokud si začneš s dobře postavenou osobou, půjdou po tobě všichni.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_02");	//Většina z nich nechce ztratit svoje zlato - proto se někteří navzájem brání.
};


instance DIA_Addon_TAL_BDT_1_Raven(C_Info)
{
	nr = 4;
	condition = DIA_Addon_TAL_BDT_1_Raven_Condition;
	information = DIA_Addon_TAL_BDT_1_Raven_Info;
	permanent = TRUE;
	description = "Co víš o Ravenovi?";
};


func int DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Raven_15_00");	//Co víš o Ravenovi?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_01");	//Je to chlapik, který sem jako prvni přišel s jeho bandou.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_02");	//Je to vůdce tábora. Doufám, že si s ním nic nehodláš začít.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_03");	//Jednou požádali o pět nových lidí protože si vylil svůj vztek na svých vlastních lidech.
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Hi.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Raven.npc = Hlp_GetInstanceID(slf);
};

