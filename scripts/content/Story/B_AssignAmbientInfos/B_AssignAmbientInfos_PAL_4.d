
instance DIA_PAL_4_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_4_EXIT_Condition;
	information = DIA_PAL_4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_4_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_4_JOIN_Condition;
	information = DIA_PAL_4_JOIN_Info;
	permanent = TRUE;
	description = "Jak bych se mohl st?t paladinem?";
};


func int DIA_PAL_4_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_JOIN_Info()
{
	AI_Output(other,self,"DIA_PAL_4_JOIN_15_00");	//Jak bych se mohl st?t paladinem?
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_01");	//Pokud to mysl?? v??n?, m?l bys nejprve vstoupit do jejich slu?eb.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_02");	//Zajdi do kas?ren a promluv si s lordem Andrem. Nech se p?ijmout k domobran?.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_03");	//Pak mo?n? dostane? ?anci uk?zat, co v tob? v?z?.
};


instance DIA_PAL_4_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_4_PEOPLE_Condition;
	information = DIA_PAL_4_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tomu tady vel??";
};


func int DIA_PAL_4_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_PAL_4_PEOPLE_15_00");	//Kdo tomu tady vel??
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_01");	//Velitelem v?ech jednotek na ostrov? je lord Hagen. Tak? po celou dobu na?? p??tomnosti ve m?st? zast?v? ??ad m?stodr??c?ho.
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_02");	//Ale je velmi zanepr?zdn?n?. Pokud pot?ebuje? n?co za??dit, zajdi do kas?ren za lordem Andrem.
};


instance DIA_PAL_4_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_4_LOCATION_Condition;
	information = DIA_PAL_4_LOCATION_Info;
	permanent = TRUE;
	description = "Co d?l?te vy, paladinov?, tady v Khorinisu?";
};


func int DIA_PAL_4_LOCATION_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_LOCATION_Info()
{
	AI_Output(other,self,"DIA_PAL_4_LOCATION_15_00");	//Co d?l?te vy, paladinov?, tady v Khorinisu?
	AI_Output(self,other,"DIA_PAL_4_LOCATION_04_01");	//To ti nem??u ??ct.
};


instance DIA_PAL_4_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_4_STANDARD_Condition;
	information = DIA_PAL_4_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nov?ho?";
};


func int DIA_PAL_4_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_4_STANDARD_15_00");	//Co je nov?ho?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Kapitel <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_01");	//Te? kdy? v?me, ?e m?me co do ?in?n? s draky, za?ne n?? velitel ur?it? brzy n?co d?lat.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_02");	//Je?t? st?le nem?me ??dn? zpr?vy od na?ich mu?? z Hornick?ho ?dol?. To je velmi znepokojiv?.
			};
		};
		if(Kapitel >= 5)
		{
			AI_Output(self,other,"DIA_PAL_4_STANDARD_04_03");	//D?ky Innosovi! Dra?? hrozba byla za?ehn?na. Te? u? se mus?me jen vypo??dat s t?mi sk?ety a cesta k rud? je voln?.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_4_STANDARD_04_04");	//Nem?m ?as zab?vat se ka?d?m drbem, co se po m?st? ????.
	};
};

func void B_AssignAmbientInfos_PAL_4(var C_Npc slf)
{
	dia_pal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_standard.npc = Hlp_GetInstanceID(slf);
};

