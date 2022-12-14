
instance DIA_Grimes_EXIT(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 999;
	condition = DIA_Grimes_EXIT_Condition;
	information = DIA_Grimes_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


var int Grimes_First;

func int DIA_Grimes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimes_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grimes_Hallo(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Hallo_Condition;
	information = DIA_Grimes_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Grimes_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Hallo_Info()
{
	AI_Output(self,other,"DIA_Grimes_Hallo_05_00");	//Ty? Kdo by to byl ?ekl, ?e se znovu setk?me.
	AI_Output(self,other,"DIA_Grimes_Hallo_05_01");	//Tak to vypad?, ?e oba v?me, jak z?stat na ?ivu a jak vid?? propadl jsem prospektorstv?.
	if(Grimes_First == FALSE)
	{
		Wld_InsertNpc(Snapper,"OW_PATH_148_A");
		Wld_InsertNpc(Snapper,"OW_PATH_146");
		Wld_InsertNpc(Snapper,"OW_PATH_147");
		Wld_InsertNpc(Snapper,"OW_PATH_148");
		Wld_InsertNpc(Snapper,"OW_PATH_264");
		Grimes_First = TRUE;
	};
};


instance DIA_Grimes_Erz(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Erz_Condition;
	information = DIA_Grimes_Erz_Info;
	permanent = FALSE;
	description = "Kolik rudy u? jsi vyt??il?";
};


func int DIA_Grimes_Erz_Condition()
{
	if((Kapitel == 2) && (MIS_ScoutMine == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Erz_Info()
{
	AI_Output(other,self,"DIA_Grimes_Erz_15_00");	//Kolik rudy u? jsi vyt??il?
	AI_Output(self,other,"DIA_Grimes_Erz_05_01");	//N?kolik beden. Ale nic z toho tady nez?stalo.
	AI_Output(self,other,"DIA_Grimes_Erz_05_02");	//Paladin Marcos se rozhodl vz?t rudu do hradu, proto?e n?s po??d ohro?ovali sk?eti.
};


instance DIA_Grimes_Weg(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 3;
	condition = DIA_Grimes_Weg_Condition;
	information = DIA_Grimes_Weg_Info;
	permanent = FALSE;
	description = "V??, kudy se Marcos vydal?";
};


func int DIA_Grimes_Weg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grimes_Erz) && (Npc_KnowsInfo(other,DIA_Marcos_Garond) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Weg_Info()
{
	AI_Output(other,self,"DIA_Grimes_Weg_15_00");	//V??, kudy se Marcos vydal?
	AI_Output(self,other,"DIA_Grimes_Weg_05_01");	//Ne?el p??mou cestou - m?sto toho cht?l p?ej?t ?eku tam, kde byla zamrzl?.
	AI_Output(self,other,"DIA_Grimes_Weg_05_02");	//Cht?l si to zkr?tit a dostat se k hradu ze z?padu.
};


instance DIA_Grimes_Grimes(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Grimes_Condition;
	information = DIA_Grimes_Grimes_Info;
	permanent = FALSE;
	description = "Nechce? opustit ?dol??";
};


func int DIA_Grimes_Grimes_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Grimes_Grimes_Info()
{
	AI_Output(other,self,"DIA_Grimes_Grimes_15_00");	//Nechce? opustit ?dol??
	AI_Output(self,other,"DIA_Grimes_Grimes_05_01");	//Ne, z?stanu a budu t??it rudu.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_02");	//Nenech?m se zastavit n?kolika sk?ety - u? jsem p?e?kal hor?? ?asy.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_03");	//Pamatuje?, jak jsme t??ili ve star?m dole, a najednou se dovnit? provalila voda...
	AI_Output(self,other,"DIA_Grimes_Grimes_05_04");	//Ale to jsou star? p??b?hy.
};


instance DIA_Grimes_PERM(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_PERM_Condition;
	information = DIA_Grimes_PERM_Info;
	permanent = TRUE;
	description = "Jak to jinak jde?";
};


func int DIA_Grimes_PERM_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Grimes_PERM_Info()
{
	AI_Output(other,self,"DIA_Grimes_PERM_15_00");	//Jak to jinak jde?
	AI_Output(self,other,"DIA_Grimes_PERM_05_01");	//Tahle sk?la je zatracen? nepoddajn? - ?pln? jako by se sna?ila n?m zabr?nit v z?sk?v?n? rudy.
};


instance DIA_Grimes_PICKPOCKET(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 900;
	condition = DIA_Grimes_PICKPOCKET_Condition;
	information = DIA_Grimes_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Grimes_PICKPOCKET_Condition()
{
	return C_Beklauen(43,21);
};

func void DIA_Grimes_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
	Info_AddChoice(DIA_Grimes_PICKPOCKET,Dialog_Back,DIA_Grimes_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimes_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grimes_PICKPOCKET_DoIt);
};

func void DIA_Grimes_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};

func void DIA_Grimes_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};

