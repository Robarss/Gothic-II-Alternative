
instance DIA_VLK_8_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_8_EXIT_Condition;
	information = DIA_VLK_8_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_8_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_8_JOIN_Condition;
	information = DIA_VLK_8_JOIN_Info;
	permanent = TRUE;
	description = "Chci se st?t ob?anem tohoto m?sta!";
};


func int DIA_VLK_8_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_8_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_8_JOIN_15_00");	//Chci se st?t ob?anem tohoto m?sta!
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_01");	//A pro? to ??k?? mn?? Zajdi za jedn?m z ?emeslnick?ch mistr? v doln? ??sti m?sta. Mo?n?, kdy? bude? m?t ?t?st?, bude n?kter? z nich hledat u?edn?ka.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_02");	//Jindy bys mohl zaj?t za m?stodr??c?m a nechat se zapsat do registru m욝an?.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_03");	//Ale te? na to m??e? rovnou zapomenout. Od t? doby, co sem p?i?li paladinov?, nem? m?stodr??c? ??dn? pravomoci.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_04");	//A jejich velitel, lord Hagen, zaru?en? nem? na podobn? v?ci ?as.
};


instance DIA_VLK_8_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_8_PEOPLE_Condition;
	information = DIA_VLK_8_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo v tomhle m?st? po??v? nejv?t?? v??nosti?";
};


func int DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_8_PEOPLE_15_00");	//Kdo v tomhle m?st? po??v? nejv?t?? v??nosti?
	AI_Output(self,other,"DIA_VLK_8_PEOPLE_08_01");	//Krom? paladin?... ?emeslni?t? mist?i v doln? ??sti m?sta. Ti jsou tak? velmi v??en?.
};


instance DIA_VLK_8_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_8_LOCATION_Condition;
	information = DIA_VLK_8_LOCATION_Info;
	permanent = TRUE;
	description = "Co je tu zaj?mav?ho k vid?n??";
};


func int DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_8_LOCATION_15_00");	//Co je tu zaj?mav?ho k vid?n??
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_01");	//V p??stavu je obrovsk? lo?, kterou paladinov? p?ipluli. Je to neuv??iteln? velk? plavidlo. M?l by ses na n?j pod?vat.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_02");	//Ale nedok??u si p?edstavit, ?e by t? pustili na palubu. Paladinov? st?e?? svoji lo? jako korunova?n? klenoty.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_03");	//Nen? divu. Taky to je jedin? n?mo?n? lo? ?iroko daleko.
};


instance DIA_VLK_8_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_8_STANDARD_Condition;
	information = DIA_VLK_8_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nov?ho?";
};


func int DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_8_STANDARD_15_00");	//Co je nov?ho?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_00");	//Ka?d? se v posledn? dob? cit? nesv?j, lid? jsou nervozn?.
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_01");	//Jako kdyby toho nebylo dost - vtrhli sem paladinov? - te? kdy? se lid? ztr?cej?!
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_02");	//Je ?as, aby s t?m domobrana n?co ud?lala.
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
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_01");	//V?ichni ?ekaj? na to, a? paladinov? ozn?m?, pro? tu doopravdy jsou. P?edpokl?d?m, ?e kv?li sk?et?m. Ur?it? co nevid?t za?to??!
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_02");	//Paladinov? mo?n? maj? Innosovo po?ehn?n?, ale a? se objev? sk?eti, bude to na n?s.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_03");	//??k? se, ?e tu paladinov? jsou jen kv?li tomu, aby dostali v?echnu rudu z ostrova. Pr? kv?li v?lce na pevnin?.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_04");	//V??, co to znamen?? Kr?lovi je ?pln? voln?, jestli tady chc?pnem, a? sk?eti za?to??.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_05");	//Budu se sna?it b?t na palub?, a? budou paladinov? zvedat kotvy.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_06");	//??k? se, ?e sk?eti p?ilet? do na?eho m?sta na drac?ch, co jsou velc? jako polovina m?sta! Nem?me ??dnou ?anci!
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_07");	//Mezi lidmi se pov?d?, ?e draci byli pora?en?. M??e to b?t pravda?
	};
};

func void B_AssignAmbientInfos_VLK_8(var C_Npc slf)
{
	dia_vlk_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_standard.npc = Hlp_GetInstanceID(slf);
};

