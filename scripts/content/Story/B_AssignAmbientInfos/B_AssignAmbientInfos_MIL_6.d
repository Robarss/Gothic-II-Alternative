
instance DIA_MIL_6_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_MIL_6_EXIT_Condition;
	information = DIA_MIL_6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MIL_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MIL_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_6_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_MIL_6_JOIN_Condition;
	information = DIA_MIL_6_JOIN_Info;
	permanent = TRUE;
	description = "Co mus?m ud?lat, aby m? vzali do domobrany?";
};


func int DIA_MIL_6_JOIN_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_MIL_6_JOIN_Info()
{
	AI_Output(other,self,"DIA_MIL_6_JOIN_15_00");	//Co mus?m ud?lat, aby m? vzali do domobrany?
	AI_Output(self,other,"DIA_MIL_6_JOIN_06_01");	//Zajdi za lordem Andrem a promluv si s n?m. Od chv?le, kdy do m?sta dorazili paladinov?, vel? cel? domobran? on.
	if(C_NpcIsInQuarter(self) != Q_KASERNE)
	{
		AI_Output(self,other,"DIA_MIL_6_JOIN_06_02");	//Najde? ho v kas?rn?ch. Je tam vlastn? po??d.
	};
};


instance DIA_Addon_MIL_6_MissingPeople(C_Info)
{
	nr = 2;
	condition = DIA_Addon_MIL_6_MissingPeople_Condition;
	information = DIA_Addon_MIL_6_MissingPeople_Info;
	permanent = TRUE;
	description = "Sly?el jsem, ?e n?kte?? obyvatel? zmizeli.";
};


func int DIA_Addon_MIL_6_MissingPeople_Condition()
{
	if((Kapitel == 1) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_MIL_6_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_MIL_6_MissingPeople_15_00");	//Sly?el jsem, ?e n?kte?? obyvatel? zmizeli.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_01");	//Vskutku - v posledn?ch dnech jsme zaznamenali mizen? lid? celkem ?asto.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_02");	//Nem??u ti to vysv?tlit tak, jak bych cht?l.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_03");	//Nicm?n? nem??eme ud?lat v?c ne? m?t o?i otev?en? a st?t na str??i.
};


instance DIA_MIL_6_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_MIL_6_PEOPLE_Condition;
	information = DIA_MIL_6_PEOPLE_Info;
	permanent = TRUE;
	description = "?ekni mi n?co o t?ch paladinech.";
};


func int DIA_MIL_6_PEOPLE_Condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_MIL_6_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_MIL_6_PEOPLE_15_00");	//?ekni mi n?co o t?ch paladinech.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_01");	//Jakmile p?ijeli do Khorinisu, obsadili horn? ??st m?sta.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_02");	//Nikoho dal??ho u? tam necht?j? pou?t?t. Samoz?ejm? krom? ob?an? m?sta a domobrany.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_03");	//Tak? tu je n?kolik paladin?, kte?? hl?daj? jejich lo? dole v p??stavu. Ale ti maj? do ukecanosti hodn? daleko.
};


instance DIA_MIL_6_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_MIL_6_LOCATION_Condition;
	information = DIA_MIL_6_LOCATION_Info;
	permanent = TRUE;
	description = "Co bych m?l v?d?t o tomhle m?st??";
};


func int DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_MIL_6_LOCATION_Info()
{
	AI_Output(other,self,"DIA_MIL_6_LOCATION_15_00");	//Co bych m?l v?d?t o tomhle m?st??
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_01");	//Paladinov? p?evzali kontrolu nad cel?m m?stem. Zodpov?daj? se jim i v?ichni ?lenov? domobrany.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_02");	//Lord Andre je velitel domobrany - a z?rove? zast?v? i funkci soudce.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_03");	//Pokud by ses snad n?kdy dostal do konfliktu se z?konem, bude? se muset ospravedlnit p??mo p?ed n?m.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_04");	//Ale ke ?len?m vojska je docela shov?vav?. Obvykle to vy?e?? n?jak? pokuta.
};


instance DIA_MIL_6_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_MIL_6_STANDARD_Condition;
	information = DIA_MIL_6_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nov?ho?";
};


func int DIA_MIL_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_MIL_6_STANDARD_Info()
{
	AI_Output(other,self,"DIA_MIL_6_STANDARD_15_00");	//Co je nov?ho?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_01");	//Do m?sta se posledn? dobou stahuje v?c a v?c l?zy.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_02");	//Loupe?e se pomalu st?vaj? b??nou z?le?itost? a lord Andre to p?i??t? na vrub n?jak? v?t?? skupiny.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_03");	//Nen? to tak dlouho, co jsme vy?istili celou p??stavn? ?tvr?, ale nena?li jsme ani jedinou ukradenou v?c.
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_04");	//Vypad? to, ?e te? m?me probl?m s lupi?i v?ce m?n? pod kontrolou. P?epady se dot?kaly ?pln? v?ech, ale ned?vno to ustalo.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_05");	//Od t? doby, co se l?za stahuje do m?sta, to jde od des?ti k p?ti. Minulou noc jsem v horn? ??sti m?sta sledoval mu?e v ?ern? r?b?.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_06");	//Jsem si jist, ?e nem?l za lubem nic dobr?ho. Ale kdy? jsem za n?m ?el kolem domu m?stodr??c?ho, prost? zmizel. Pochybn? existence, kter?...
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_07");	//??k? se, ?e lord Hagen najal ?oldn??e na boj proti drak?m. Mn? to docela vyhovuje, necht?l bych s t?ma potvorama bojovat s?m osobn?.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_08");	//Pov?d? se, ?e se ty draky poda?ilo porazit! Lord Hagen shroma??uje svoje mu?e, aby Hornick? ?dol? zbavili i v?ech ostatn?ch nestv?r.
	};
};

func void B_AssignAmbientInfos_MIL_6(var C_Npc slf)
{
	dia_mil_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_standard.npc = Hlp_GetInstanceID(slf);
};

