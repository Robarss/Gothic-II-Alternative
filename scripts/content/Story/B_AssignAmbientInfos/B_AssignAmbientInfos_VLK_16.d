
instance DIA_VLK_16_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_16_EXIT_Condition;
	information = DIA_VLK_16_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_16_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_16_JOIN_Condition;
	information = DIA_VLK_16_JOIN_Info;
	permanent = TRUE;
	description = "Chci se st?t ob?anem tohoto m?sta!";
};


func int DIA_VLK_16_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_16_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_16_JOIN_15_00");	//Chci se st?t ob?anem tohoto m?sta!
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_01");	//Pom??e? n?m br?nit m?sto proti sk?et?m?
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_02");	//Pokud jsi ob?anem Khorinisu, m??e? se p?idat k domobran? - promluv si n?k?m od m?stsk?ch str???.
};


instance DIA_VLK_16_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_16_PEOPLE_Condition;
	information = DIA_VLK_16_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo v tomhle m?st? po??v? nejv?t?? v??nosti?";
};


func int DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_16_PEOPLE_15_00");	//Kdo v tomhle m?st? po??v? nejv?t?? v??nosti?
	AI_Output(self,other,"DIA_VLK_16_PEOPLE_16_01");	//Paladinov? obsadili horn? ??st m?sta.
};


instance DIA_VLK_16_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_16_LOCATION_Condition;
	information = DIA_VLK_16_LOCATION_Info;
	permanent = TRUE;
	description = "Co je tu zaj?mav?ho k vid?n??";
};


func int DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_16_LOCATION_15_00");	//Co je tu zaj?mav?ho k vid?n??
	AI_Output(self,other,"DIA_VLK_16_LOCATION_16_01");	//Na tr?i?ti nalezne? vystaven? ve?ker? druhy zbo??.
};


instance DIA_VLK_16_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_16_STANDARD_Condition;
	information = DIA_VLK_16_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nov?ho?";
};


func int DIA_VLK_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_16_STANDARD_15_00");	//Co je nov?ho?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_00");	//Douf?m, ?e domobrana kone?n? zjist? pro? se populace Khorinisu zmen?uje.
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_01");	//?lov?k se mus? b?t o sv?j ?ivot, kdy? sly?? kolik lid? zmizelo.
		if(SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
			B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
		};
		SC_HearedAboutMissingPeople = TRUE;
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_01");	//U? jsi to sly?el? Za hradbami byli vid?ni sk?eti. Doufejme, ?e paladinov? maj? dostatek mu??.
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_02");	//R?da bych v?d?l, jestli to n?hodu nen? ten d?vod, pro? farm??i p?estali chodit na trh.
	};
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_03");	//?oldn??, o kter?m se ??kalo, ?e zavra?dil Lothara, je nevinn?. Objevily se d?kazy o tom, ?e na n?j n?kdo u?il boudu. Zaslechla jsem to na tr?i?ti.
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_04");	//To je nesl?chan?. Ten statk??sk? ?old?k zabil ctihodn?ho Lothara p??mo uprost?ed ulice.
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_05");	//Ale Innos ho za jeho h??chy potrest?. Nikdo nesm? vzt?hnout ruku na ryt??e na?eho P?na.
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_06");	//Sly?ela jsem, ?e ti ?ibeni?n?ci opustili Onarovu farmu. ??k? se, ?e se ze strachu p?ed lordem Hagenem st?hli zp?t do Hornick?ho ?dol?.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_07");	//Sly?ela jsem, ?e se odd?l paladin? vydal do Hornick?ho ?dol? pob?t ty stra?n? draky.
	};
};

func void B_AssignAmbientInfos_VLK_16(var C_Npc slf)
{
	dia_vlk_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_standard.npc = Hlp_GetInstanceID(slf);
};

