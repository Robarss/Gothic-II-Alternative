
instance DIA_Agon_EXIT(C_Info)
{
	npc = NOV_603_Agon;
	nr = 999;
	condition = DIA_Agon_EXIT_Condition;
	information = DIA_Agon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Agon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Agon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Agon_Hello(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Hello_Condition;
	information = DIA_Agon_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_Hello_Info()
{
	AI_Output(self,other,"DIA_Agon_Hello_07_00");	//(opovr?liv?) Co chce??
};


instance DIA_Agon_Wurst(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Wurst_Condition;
	information = DIA_Agon_Wurst_Info;
	permanent = FALSE;
	description = "Tum??, m?m tu pro tebe skopovou klob?su.";
};


func int DIA_Agon_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Agon_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//Tum??, m?m tu pro tebe skopovou klob?su.
	AI_Output(self,other,"DIA_Agon_Wurst_07_01");	//Ov?? klob?sa, ov?? s?r... ov?? ml?ko... u? mi to v?echno leze krkem.
	AI_Output(other,self,"DIA_Agon_Wurst_15_02");	//Tak chce? tu klob?su, nebo ne?
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//Ale no tak ho sem dej!
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
};


instance DIA_Agon_New(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_New_Condition;
	information = DIA_Agon_New_Info;
	permanent = FALSE;
	description = "Jsem tady nov?.";
};


func int DIA_Agon_New_Condition()
{
	if((MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_New_Info()
{
	AI_Output(other,self,"DIA_Agon_New_15_00");	//Jsem tady nov?.
	AI_Output(self,other,"DIA_Agon_New_07_01");	//To vid?m.
	AI_Output(self,other,"DIA_Agon_New_07_02");	//Jestli zat?m nem?? co na pr?ci, promluv si s Parlanem. On u? ti n?jakou d?.
};


instance DIA_Agon_YouAndBabo(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_YouAndBabo_Condition;
	information = DIA_Agon_YouAndBabo_Info;
	permanent = FALSE;
	description = "Co se stalo mezi tebou a Babem?";
};


func int DIA_Agon_YouAndBabo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_YouAndBabo_Info()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_15_00");	//Co se stalo mezi tebou a Babem?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_01");	//Nem?l bys v??it v?emu, co usly???.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_02");	//(ne?stupn?) ?ekn?me si jedno: p?jdu svou vlastn? cestou. Tou, kterou mi p?edur?il Innos.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_03");	//Nedovol?m nikomu st?t mi v cest?, a ur?it? ne tomu jelim?nkovi Babovi.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
	Info_AddChoice(DIA_Agon_YouAndBabo,"Nem?li bychom my novicov? dr?et pohromad??",DIA_Agon_YouAndBabo_AllTogether);
	Info_AddChoice(DIA_Agon_YouAndBabo,"Innos s?m v?, jakou cestou bychom se m?li vydat.",DIA_Agon_YouAndBabo_InnosWay);
	Info_AddChoice(DIA_Agon_YouAndBabo,"Vych?z?me spolu docela dob?e.",DIA_Agon_YouAndBabo_Understand);
};

func void DIA_Agon_YouAndBabo_AllTogether()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_AllTogether_15_00");	//Nem?li bychom my novicov? dr?et pohromad??
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_01");	//Vy ostatn? si dr?te pohromad?, jak chcete.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_02");	//Ale pros?m, nepl?tvej m?m ?asem. (chladn?) A nestav se mi do cesty.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_InnosWay()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_InnosWay_15_00");	//Innos s?m v?, jakou cestou bychom se m?li vydat.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_InnosWay_07_01");	//Moje rodina v?dycky st?la vysoko v Innosov? p??zni a na tom se nic nezm?n?.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_Understand()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_Understand_15_00");	//Vych?z?me spolu docela dob?e.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_Understand_07_01");	//To douf?m. A? budu m?gem, m??u za tebe ztratit sl?vko.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};


instance DIA_Agon_GetHerb(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GetHerb_Condition;
	information = DIA_Agon_GetHerb_Info;
	permanent = TRUE;
	description = "Co tady p?stujete?";
};


func int DIA_Agon_GetHerb_Condition()
{
	if(MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Agon_GetHerb_Info()
{
	AI_Output(other,self,"DIA_Agon_GetHerb_15_00");	//Co tady p?stujete?
	AI_Output(self,other,"DIA_Agon_GetHerb_07_01");	//Sna??me se vyp?stovat l??iv? byliny, aby mohl mistr Neoras va?it lektvary.
};


instance DIA_Agon_GolemDead(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GolemDead_Condition;
	information = DIA_Agon_GolemDead_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_GolemDead_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && Npc_IsDead(Magic_Golem))
	{
		return TRUE;
	};
};

func void DIA_Agon_GolemDead_Info()
{
	AI_Output(self,other,"DIA_Agon_GolemDead_07_00");	//(v?t?zn?) Jde? pozd?!
	AI_Output(self,other,"DIA_Agon_GolemDead_07_01");	//Byl jsem tady prvn?! Vyhr?l jsem!
	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead,"(v?hr??n?) Jenom pokud se odsud dostane? ?iv?.",DIA_Agon_GolemDead_NoWay);
	Info_AddChoice(DIA_Agon_GolemDead,"Dr? hubu!",DIA_Agon_GolemDead_ShutUp);
	Info_AddChoice(DIA_Agon_GolemDead,"Gratuluji, v??n? sis to zaslou?il.",DIA_Agon_GolemDead_Congrat);
};

func void DIA_Agon_GolemDead_NoWay()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_NoWay_15_00");	//(v?hr??n?) Jenom pokud se odsud dostane? ?iv?.
	AI_Output(self,other,"DIA_Agon_GolemDead_NoWay_07_01");	//Chce? m? zab?t? To se ti nikdy nepovede.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Agon_GolemDead_ShutUp()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_15_00");	//Dr? hubu!
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_01");	//(v?sm??n?) Nem?? n?rok, prohr?l jsi! P?iznej si to.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_02");	//Jenom mn? bylo osudem ur?eno st?t se m?gem.
	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead,"Osud ti ur?il leda pol?bit mi zadek. Truhla je moje.",DIA_Agon_GolemDead_ShutUp_MyChest);
	Info_AddChoice(DIA_Agon_GolemDead,"Vyhr?l jsi.",DIA_Agon_GolemDead_ShutUp_YouWin);
};

func void DIA_Agon_GolemDead_ShutUp_MyChest()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00");	//Osud ti ur?il leda pol?bit mi zadek. Truhla je moje.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01");	//(rozzloben?) Ne, to teda ne, to t? sp?? zabiju.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Agon_GolemDead_ShutUp_YouWin()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00");	//Vyhr?l jsi.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01");	//(zb?sile) Ne, m? neo??l??. Sna??? se m? zbavit.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02");	//To nedopust?m!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Agon_GolemDead_Congrat()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_00");	//Gratuluji, v??n? sis to zaslou?il.
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_01");	//(ned?v??iv?) Co to m? znamenat? Co m?? za lubem?
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_02");	//O ?em to mluv???
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_03");	//(nerv?zn?) Chce? m? zab?t a nechat si v?echnu sl?vu pro sebe!
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_04");	//To se ti nikdy nepoda??!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Agon_GolemLives(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GolemLives_Condition;
	information = DIA_Agon_GolemLives_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_GolemLives_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (Npc_IsDead(Magic_Golem) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Agon_GolemLives_Info()
{
	AI_Output(self,other,"DIA_Agon_GolemLives_07_00");	//(p?ekvapen?) Na?el jsi ten ?kryt p?ede mnou. To nejde...
	AI_Output(self,other,"DIA_Agon_GolemLives_07_01");	//(odhodlan?) Tak to nem??e z?stat! To nedovol?m.
	AI_Output(self,other,"DIA_Agon_GolemLives_07_02");	//Dokonce nikdy nenajdou tvou mrtvolu.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instance DIA_Agon_Perm(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Perm_Condition;
	information = DIA_Agon_Perm_Info;
	permanent = TRUE;
	description = "Tak jak to jde?";
};


func int DIA_Agon_Perm_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Agon_Perm_Info()
{
	AI_Output(other,self,"DIA_Agon_Perm_15_00");	//Tak jak to jde?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_01");	//Ach - d?ky za tv?j z?jem, sire paladine. Pr?ce se mi l?b? a jsem si jist, ?e brzy budu vybr?n mezi m?gy.
	}
	else
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_02");	//(arogantn?) Tady v Innosov? kl??te?e jsi jenom hostem. M?l by ses tedy podle toho chovat a neru?it m? v m? pr?ci. P?eji hezk? den.
	};
};


instance DIA_Agon_PICKPOCKET(C_Info)
{
	npc = NOV_603_Agon;
	nr = 900;
	condition = DIA_Agon_PICKPOCKET_Condition;
	information = DIA_Agon_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Agon_PICKPOCKET_Condition()
{
	return C_Beklauen(23,12);
};

func void DIA_Agon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
	Info_AddChoice(DIA_Agon_PICKPOCKET,Dialog_Back,DIA_Agon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Agon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Agon_PICKPOCKET_DoIt);
};

func void DIA_Agon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
};

func void DIA_Agon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
};

