
instance DIA_Addon_Raven_EXIT(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 999;
	condition = DIA_Addon_Raven_EXIT_Condition;
	information = DIA_Addon_Raven_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Raven_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Raven_Hi(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 1;
	condition = DIA_Addon_Raven_Hi_Condition;
	information = DIA_Addon_Raven_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Raven_Hi_Condition()
{
	if(RVN_START == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Raven_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_00");	//?, pod?vejme se, kdo to sem p?i?el.
	if(C_BodyStateContains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_01");	//M?j p?n m? varoval, ?e Innos na m? po?le sv?ho obl?bence.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_02");	//Neo?ek?val jsem t? ale tak brzy.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_03");	//Dob?e, nyn? kdy? jsi tu tak rychle, m??u t? ujistit, ?e zem?e? stejn?.
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Ty jsi ten, kdo zem?e.",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Tys zaprodal svou du?i Beliarovi!",DIA_Addon_Raven_Hi_Soul);
};

func void DIA_Addon_Raven_Hi_DU()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_00");	//Ty jsi ten, kdo zem?e.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_04");	//(posm??n?) Ty pro m? nejsi hrozba. J? ovl?d?m Beliar?v dr?p.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_05");	//J? povedu draky na pevninu. Spole?n? pak p?inesem temnotu na sv?t lid?.
};

func void DIA_Addon_Raven_Hi_Soul()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_01");	//Tys zaprodal svou du?i Beliarovi!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_06");	//Byl to ale dobr? obchod. Budu hlavn?m v?dcem jeho arm?d.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_07");	//A ty? Jak? je cena za TVOU du?i?
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Okay, sly?el jsem dost. Poj?me na to ...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi,"D?l?m pouze to, co mus? b?t ud?l?no.",DIA_Addon_Raven_Hi_only);
};

func void DIA_Addon_Raven_Hi_only()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_02");	//D?l?m pouze to, co mus? b?t ud?l?no.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_08");	//(usm?vav?) Poslouchej ho. Opravdov? slu?ebn?ku Innos?v! (hlasit? sm?ch)
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Okay, sly?el jsem dost. Poj?me na to ...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Jsi si jist?, ?e jsem Innos?v slu?ebn?k?",DIA_Addon_Raven_Hi_Sure);
};

func void DIA_Addon_Raven_Hi_Sure()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_03");	//Jsi si jist?, ?e jsem Innos?v slu?ebn?k?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_09");	//Co? O ?em to mluv???
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_04");	//A co kdy? jsem slu?ebn?k Adanose?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_10");	//(posm??n?) Nesmysl!
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_05");	//Mo?n? 'J?' tak? slou??m Beliarovi - nebo pouze s?m sob?.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_11");	//(posm?v? se) Dob?e, kdy? je to tak, pak pro m? nejsi v?bec nep??tel.
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Okay, sly?el jsem dost. Poj?me na to ...",DIA_Addon_Raven_Hi_Attack);
};

func void DIA_Addon_Raven_Hi_Attack()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_06");	//Dobr?, sly?el jsem dost. Poj?me na to ...
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_12");	//(posm?v? se) Ty fakt chce? tak rychle zem??t? Dobr?, kdy? to tak chce? ...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

