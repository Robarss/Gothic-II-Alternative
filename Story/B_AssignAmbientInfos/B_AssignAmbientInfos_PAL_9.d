
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
	description = "Jak se mohu stát paladinem?";
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
	AI_Output(other,self,"DIA_PAL_9_JOIN_15_00");	//Jak se mohu stát paladinem?
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_01");	//Jen ten, kdo v Innosových či králových službách prokáže, že je toho hoden, se může stát vyvoleným!
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_02");	//Jinak řečeno: Vybráni mohou být jen ti nejlepší. Ale TY do toho máš hodně daleko, hochu!
};


instance DIA_PAL_9_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_9_PEOPLE_Condition;
	information = DIA_PAL_9_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tomu tady velí?";
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
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_01");	//Lord Hagen.
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_02");	//A?
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_03");	//A nikdo další. Lord Hagen je nejvyšším velitelem celého ostrova.
};


instance DIA_PAL_9_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_9_LOCATION_Condition;
	information = DIA_PAL_9_LOCATION_Info;
	permanent = TRUE;
	description = "Proč jste vy, paladinové, přišli do Khorinisu?";
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
	AI_Output(other,self,"DIA_PAL_9_LOCATION_15_00");	//Proč jste vy, paladinové, přišli do Khorinisu?
	AI_Output(self,other,"DIA_PAL_9_LOCATION_09_01");	//Do toho ti nic není, příteli! Musí ti stačit, že jsme tu v Innosových a králových službách!
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
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_01");	//Teď když víme, že máme co do činění s draky, začne náš velitel určitě brzy něco dělat.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_02");	//Ještě stále nemáme žádné zprávy od našich mužů z Hornického údolí. To je velmi znepokojivé.
			};
		};
		if(Kapitel >= 5)
		{
			AI_Output(self,other,"DIA_PAL_9_STANDARD_09_03");	//Díky Innosovi! Dračí hrozba byla zažehnána. Teď už se musíme jen vypořádat s těmi skřety a cesta k rudě je volná.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_9_STANDARD_09_04");	//Jestli je to všechno, co mi můžeš říct, tak už se ztrať, příteli!
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

