
instance DIA_PAL_12_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_12_EXIT_Condition;
	information = DIA_PAL_12_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_12_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_12_JOIN_Condition;
	information = DIA_PAL_12_JOIN_Info;
	permanent = TRUE;
	description = "Chci se st?t paladinem!";
};


func int DIA_PAL_12_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_JOIN_Info()
{
	AI_Output(other,self,"DIA_PAL_12_JOIN_15_00");	//Chci se st?t paladinem!
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_01");	//Ty? Nenech se vysm?t! Je?t? nejsi ani ?lenem m?stsk?ch str???.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_02");	//Kdybych nevid?l, jakej se? tupej buran, musel bych si myslet, ?e ses m? pokusil urazit.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_03");	//Pouze ti nejlep?? z nejlep??ch v?rn?ch n?sledovn?k? kr?le a na?eho P?na Innose se mohou st?t paladiny.
};


instance DIA_PAL_12_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_12_PEOPLE_Condition;
	information = DIA_PAL_12_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tomu tady vel??";
};


func int DIA_PAL_12_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_PAL_12_PEOPLE_15_00");	//Kdo tomu tady vel??
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_01");	//Ctihodn? lord Hagen. Ale v?e, co se t?k? prost?ho lidu, m? na starosti lord Andre.
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_02");	//Najde? ho v kas?rn?ch. Mo?n? bude? m?t ?t?st? a v?nuje ti p?r minut sv?ho drahocenn?ho ?asu.
};


instance DIA_PAL_12_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_12_LOCATION_Condition;
	information = DIA_PAL_12_LOCATION_Info;
	permanent = TRUE;
	description = "Co d?l?te vy, paladinov?, tady v Khorinisu?";
};


func int DIA_PAL_12_LOCATION_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_LOCATION_Info()
{
	AI_Output(other,self,"DIA_PAL_12_LOCATION_15_00");	//Co d?l?te vy, paladinov?, tady v Khorinisu?
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_01");	//Lidi, co maj? takov?hle ot?zky, v?t?inou skon?? na ?ibenici d??v, ne? si toho sta?? v?imnout.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_02");	//Pokud si lord Andre nem??e n?co dovolit, tak v?dom? toho, ?e na?e mise byla vyzrazena.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_03");	//No, m?l by sis d?vat v?t?? pozor, na co se pt??.
};


instance DIA_PAL_12_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_12_STANDARD_Condition;
	information = DIA_PAL_12_STANDARD_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_12_STANDARD_15_00");	//Jak se vede?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Kapitel <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_01");	//Te? kdy? v?me, ?e m?me co do ?in?n? s draky, za?ne n?? velitel ur?it? brzy n?co d?lat.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_02");	//Je?t? st?le nem?me ??dn? zpr?vy od na?ich mu?? z Hornick?ho ?dol?. To je velmi znepokojiv?.
			};
		};
		if(Kapitel >= 5)
		{
			AI_Output(self,other,"DIA_PAL_12_STANDARD_12_03");	//D?ky Innosovi! Dra?? hrozba byla za?ehn?na. Te? u? se mus?me jen vypo??dat s t?mi sk?ety a cesta k rud? je voln?.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_12_STANDARD_12_04");	//Ty ve skute?nosti nechce?, abych ti na tu ot?zku odpov?d?l, hochu!
	};
};

func void B_AssignAmbientInfos_PAL_12(var C_Npc slf)
{
	dia_pal_12_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_standard.npc = Hlp_GetInstanceID(slf);
};

