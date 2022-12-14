
instance DIA_Larius_EXIT(C_Info)
{
	npc = VLK_400_Larius;
	nr = 999;
	condition = DIA_Larius_EXIT_Condition;
	information = DIA_Larius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Larius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Larius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Larius_Hello(C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = DIA_Larius_Hello_Condition;
	information = DIA_Larius_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Larius_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Larius_Hello_Info()
{
	AI_Output(self,other,"DIA_Larius_Hello_01_00");	//Co tady d?l??? Jestli n?co chce?, mus?? si nejd??v sjednat sch?zku.
};


instance DIA_Larius_WhoAreYou(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_WhoAreYou_Condition;
	information = DIA_Larius_WhoAreYou_Info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int DIA_Larius_WhoAreYou_Condition()
{
	return TRUE;
};

func void DIA_Larius_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_01");	//Jsem Lariu, zdej?? m?stodr??c?.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_02");	//I kdy? to tak te? asi nevypad?, jsem nejmocn?j??m mu?em ve m?st?.
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_03");	//Tak?e ty tady vl?dne??
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_04");	//J?... no... te? zrovna m?m sv?zan? ruce.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_05");	//Vel? tady tomu ten lord Hagen, alespo? po tu dobu, co je ve m?st?.
};


instance DIA_Larius_Disturb(C_Info)
{
	npc = VLK_400_Larius;
	nr = 3;
	condition = DIA_Larius_Disturb_Condition;
	information = DIA_Larius_Disturb_Info;
	permanent = TRUE;
	description = "Necht?l jsem ru?it.";
};


func int DIA_Larius_Disturb_Condition()
{
	return TRUE;
};

func void DIA_Larius_Disturb_Info()
{
	AI_Output(other,self,"DIA_Larius_Disturb_15_00");	//Necht?l jsem ru?it.
	AI_Output(self,other,"DIA_Larius_Disturb_01_01");	//Jen?e se ti to v?bec nepovedlo. Tak?e vypadni!
};


instance DIA_Larius_DieLage(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_DieLage_Condition;
	information = DIA_Larius_DieLage_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Larius_DieLage_Condition()
{
	return TRUE;
};

func void DIA_Larius_DieLage_Info()
{
	AI_Output(other,self,"DIA_Larius_DieLage_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Larius_DieLage_01_01");	//Co tady chce?? Dokud jsou paladinov? ve m?st?, maj? ve?ker? v?ci kolem Khorinisu na starosti oni.
};


instance DIA_Larius_Richterueberfall(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_Richterueberfall_Condition;
	information = DIA_Larius_Richterueberfall_Info;
	description = "Soudce si najal n?jak? bandity, aby t? napadli. M??u to prok?zat.";
};


func int DIA_Larius_Richterueberfall_Condition()
{
	if(SCKnowsRichterKomproBrief == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Larius_Richterueberfall_Info()
{
	AI_Output(other,self,"DIA_Larius_Richterueberfall_15_00");	//Soudce si najal n?jak? bandity, aby t? napadli. M??u to prok?zat.
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_01");	//P?esta? pl?cat takov? nesmysly, nebo snad chce?, abych t? nechal vsadit do ?elez?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_02");	//I kdybys byl bojovn?kem Innose...
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_03");	//I kdybys by ustanoven m?gem...
	};
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_04");	//M? slovo m? v tomhle m?st? st?le je?t? svou v?hu. U? se nikdy v?c neopova?uj ?pinit jm?no soudce!
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Larius_PICKPOCKET(C_Info)
{
	npc = VLK_400_Larius;
	nr = 900;
	condition = DIA_Larius_PICKPOCKET_Condition;
	information = DIA_Larius_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Larius_PICKPOCKET_Condition()
{
	return C_Beklauen(35,120);
};

func void DIA_Larius_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
	Info_AddChoice(DIA_Larius_PICKPOCKET,Dialog_Back,DIA_Larius_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Larius_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Larius_PICKPOCKET_DoIt);
};

func void DIA_Larius_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};

func void DIA_Larius_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};

