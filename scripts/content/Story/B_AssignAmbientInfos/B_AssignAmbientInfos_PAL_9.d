
instance DIA_PAL_9_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_9_EXIT_Condition;
	information = DIA_PAL_9_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_9_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_9_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_9_JOIN_Condition;
	information = DIA_PAL_9_JOIN_Info;
	permanent = TRUE;
	description = "Jak se mohu st?t paladinem?";
};


func int DIA_PAL_9_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_9_JOIN_Info()
{
	AI_Output(other,self,"DIA_PAL_9_JOIN_15_00");	//Jak se mohu st?t paladinem?
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_01");	//Jen ten, kdo v Innosov?ch ?i kr?lov?ch slu?b?ch prok??e, ?e je toho hoden, se m??e st?t vyvolen?m!
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_02");	//Jinak ?e?eno: Vybr?ni mohou b?t jen ti nejlep??. Ale TY do toho m?? hodn? daleko, hochu!
};


instance DIA_PAL_9_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_9_PEOPLE_Condition;
	information = DIA_PAL_9_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tomu tady vel??";
};


func int DIA_PAL_9_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_9_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_00");	//Kdo tomu tady vel??
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_01");	//Lord Hagen.
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_02");	//A?
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_03");	//A nikdo dal??. Lord Hagen je nejvy???m velitelem cel?ho ostrova.
};


instance DIA_PAL_9_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_9_LOCATION_Condition;
	information = DIA_PAL_9_LOCATION_Info;
	permanent = TRUE;
	description = "Pro? jste vy, paladinov?, p?i?li do Khorinisu?";
};


func int DIA_PAL_9_LOCATION_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_9_LOCATION_Info()
{
	AI_Output(other,self,"DIA_PAL_9_LOCATION_15_00");	//Pro? jste vy, paladinov?, p?i?li do Khorinisu?
	AI_Output(self,other,"DIA_PAL_9_LOCATION_09_01");	//Do toho ti nic nen?, p??teli! Mus? ti sta?it, ?e jsme tu v Innosov?ch a kr?lov?ch slu?b?ch!
};


instance DIA_PAL_9_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_9_STANDARD_Condition;
	information = DIA_PAL_9_STANDARD_Info;
	permanent = TRUE;
	description = "Co se stalo?";
};


func int DIA_PAL_9_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_9_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_9_STANDARD_15_00");	//Co se stalo?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Kapitel <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_01");	//Te? kdy? v?me, ?e m?me co do ?in?n? s draky, za?ne n?? velitel ur?it? brzy n?co d?lat.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_02");	//Je?t? st?le nem?me ??dn? zpr?vy od na?ich mu?? z Hornick?ho ?dol?. To je velmi znepokojiv?.
			};
		};
		if(Kapitel >= 5)
		{
			AI_Output(self,other,"DIA_PAL_9_STANDARD_09_03");	//D?ky Innosovi! Dra?? hrozba byla za?ehn?na. Te? u? se mus?me jen vypo??dat s t?mi sk?ety a cesta k rud? je voln?.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_9_STANDARD_09_04");	//Jestli je to v?echno, co mi m??e? ??ct, tak u? se ztra?, p??teli!
	};
};

func void B_AssignAmbientInfos_PAL_9(var C_Npc slf)
{
	dia_pal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_standard.npc = Hlp_GetInstanceID(slf);
};

