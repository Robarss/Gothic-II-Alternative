
instance DIA_Richter_EXIT(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 999;
	condition = DIA_Richter_EXIT_Condition;
	information = DIA_Richter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Richter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Richter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Richter_Hello(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 4;
	condition = DIA_Richter_Hello_Condition;
	information = DIA_Richter_Hello_Info;
	permanent = FALSE;
	description = "Co tady d?l???";
};


func int DIA_Richter_Hello_Condition()
{
	if(MIS_Lee_JudgeRichter == 0)
	{
		return TRUE;
	};
};

func void DIA_Richter_Hello_Info()
{
	AI_Output(other,self,"DIA_Richter_Hello_15_00");	//Co tady d?l???
	AI_Output(self,other,"DIA_Richter_Hello_10_01");	//Pro? m? obt??uje?? Kdo vlastn? jsi?
	AI_Output(other,self,"DIA_Richter_Hello_15_02");	//J?, ehm...
	AI_Output(self,other,"DIA_Richter_Hello_10_03");	//?ekni, nezn?me se odn?kud?
	Info_ClearChoices(DIA_Richter_Hello);
	Info_AddChoice(DIA_Richter_Hello,"Co si pamatuju, tak ne.",DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice(DIA_Richter_Hello,"Mo?n? ano.",DIA_Richter_Hello_MayBe);
};

func void DIA_Richter_Hello_DontThinkSo()
{
	AI_Output(other,self,"DIA_Richter_Hello_DontThinkSo_15_00");	//Co si pamatuju, tak ne.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_01");	//To je zvl??tn?. P??sahal bych, ?e u? jsme se n?kde vid?li.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_02");	//Nevad?, v?ak jsi jen uboh? ?up?k. V?ichni vypad?te stejn?.
};

func void DIA_Richter_Hello_MayBe()
{
	AI_Output(other,self,"DIA_Richter_Hello_MayBe_15_00");	//Mo?n? ano.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_01");	//Cht?lo by to trochu uctiv?j?? t?n! S k?m si v?bec mysl??, ?e mluv???
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_02");	//To nejmen??, co m??e? ud?lat, je mluvit se mnou odpov?daj?c?m t?nem.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_03");	//A te? mi ztra? z o??!
	AI_StopProcessInfos(self);
};


instance DIA_Richter_Perm(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 800;
	condition = DIA_Richter_Perm_Condition;
	information = DIA_Richter_Perm_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Richter_Perm_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Richter_Hello) || (MIS_Lee_JudgeRichter == LOG_Running)) && (SCIstRichtersLakai == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Richter_Perm_Info()
{
	AI_Output(other,self,"DIA_Richter_Perm_15_00");	//Jak se vede?
	if((MIS_Lee_JudgeRichter == LOG_Running) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_01");	//Rad?ji bys m?l vypadnout, ty mizernej ?old?ku, ne? zavol?m str??e.
		AI_Output(other,self,"DIA_Richter_Perm_15_02");	//Kl?dek. Nep?i?el jsem t? okr?st. Hled?m pr?ci.
		AI_Output(self,other,"DIA_Richter_Perm_10_03");	//?. Tak ty pro m? chce? pracovat. Tak to je samoz?ejm? jin?.
		AI_Output(self,other,"DIA_Richter_Perm_10_04");	//Ale m? to jeden h??ek. Nev?m, jestli ti mohu v??it. Bude? mi muset nejprve prok?zat svou loajalitu.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_05");	//Ne?ekl jsem snad jasn?, ?e s tebou nechci nic m?t?
		AI_Output(other,self,"DIA_Richter_Perm_15_06");	//Ne, ne tolika slovy.
		AI_Output(self,other,"DIA_Richter_Perm_10_07");	//Tak to samoz?ejm? douf?m, ?e ti to do?lo te?.
	};
};


instance DIA_Richter_RichtersLakai(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_RichtersLakai_Condition;
	information = DIA_Richter_RichtersLakai_Info;
	description = "Otestuj si m?.";
};


func int DIA_Richter_RichtersLakai_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Richter_Hello) || (MIS_Lee_JudgeRichter != 0)) && (SCIstRichtersLakai == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Richter_RichtersLakai_Info()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_15_00");	//Otestuj si m?.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_01");	//Mmh. Dobr?. Poslouchej. P?ines mi od ohniv?ch m?g? posv?tn? kladivo. Ukr?vaj? ho n?kde v podzem? sv?ho kl??tera.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_02");	//Jestli to dok??e? splnit, mo?n? budu uva?ovat o tom, ?e bych si t? najal jako sv?ho osobn?ho str??ce.
	Info_ClearChoices(DIA_Richter_RichtersLakai);
	Info_AddChoice(DIA_Richter_RichtersLakai,"To m?m jako okr?st m?gy? Nejsi trochu mimo?",DIA_Richter_RichtersLakai_nein);
	Info_AddChoice(DIA_Richter_RichtersLakai,"Dobr?.",DIA_Richter_RichtersLakai_ja);
	B_LogEntry(TOPIC_RichterLakai,"Soudce mi nev???. Mus?m mu prok?zat svou loajalitu - ukr?st ze sklepen? kl??tera ohniv?ch m?g? posv?tn? kladivo a p?in?st mu je.");
	MIS_Richter_BringHolyHammer = LOG_Running;
};

func void DIA_Richter_RichtersLakai_nein()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_nein_15_00");	//To m?m jako okr?st m?gy? Nejsi trochu mimo?
	AI_Output(self,other,"DIA_Richter_RichtersLakai_nein_10_01");	//V tom p??pad? t?hni do pekel a p?esta? pl?tvat m?m ?asem.
	AI_StopProcessInfos(self);
};

func void DIA_Richter_RichtersLakai_ja()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_ja_15_00");	//Dobr?.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_ja_10_01");	//Fajn. Ale pamatuj - jestli t? chyt?, nikdy jsem o tob? nesly?el.
	AI_StopProcessInfos(self);
};


instance DIA_Richter_KillMorgahard(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KillMorgahard_Condition;
	information = DIA_Richter_KillMorgahard_Info;
	description = "Tady je posv?tn? kladivo m?g?.";
};


func int DIA_Richter_KillMorgahard_Condition()
{
	if(Npc_HasItems(other,Holy_Hammer_MIS) && (MIS_Richter_BringHolyHammer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Richter_KillMorgahard_Info()
{
	AI_Output(other,self,"DIA_Richter_KillMorgahard_15_00");	//Tady je posv?tn? kladivo m?g?.
	B_GiveInvItems(other,self,Holy_Hammer_MIS,1);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_01");	//Jsem opravdu p?ekvapen. Ty to mysl?? v??n?, co? Tady je tv? odm?na.
	CreateInvItems(self,ItMi_Gold,300);
	B_GiveInvItems(self,other,ItMi_Gold,300);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_02");	//Fajn. Kdy? se to m? takhle, tak to m?m pro tebe je?t? dal?? ?kol.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_03");	//P?ed n?kolika dny uteklo ze zdej??ho v?zen? p?r trestanc?.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_04");	//Ti zkurvysyni se schovali v hor?ch. N?kde sm?rem ke Xardasov? nov? v??i.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_05");	//Jejich v?dce se jmenuje Morgahard. Chci, abys ho zabil.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_06");	//Posp?? si, ne? n?m proklouzne.
	Wld_InsertNpc(BDT_1030_Morgahard,"REICH");
	Wld_InsertNpc(BDT_1031_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1032_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1033_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1034_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1035_Fluechtling,"REICH");
	B_InitNpcGlobals();
	B_GivePlayerXP(XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry(TOPIC_RichterLakai,"N?kte?? v?zni unikli spravedlnosti. J? je m?m dostihnout a zab?t jejich velitele Morgaharda. Nejsp?? se ukr?vaj? v hor?ch, kdesi sm?rem ke Xardasov? nov? v??i.");
	MIS_Richter_KillMorgahard = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Richter_KilledMorgahard(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KilledMorgahard_Condition;
	information = DIA_Richter_KilledMorgahard_Info;
	description = "Morgahard je mrtv?.";
};


func int DIA_Richter_KilledMorgahard_Condition()
{
	if(Npc_IsDead(Morgahard) && (MIS_Richter_KillMorgahard == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahard_Info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahard_15_00");	//Morgahard je mrtv?.
	AI_Output(self,other,"DIA_Richter_KilledMorgahard_10_01");	//?. Jsi dobrej chlap. Tady je tv? odm?na.
	CreateInvItems(self,ItMi_Gold,400);
	B_GiveInvItems(self,other,ItMi_Gold,400);
	B_GivePlayerXP(XP_KillMorgahard);
	B_LogEntry(TOPIC_RichterLakai,"Soudce byl zpr?vou o Morgahardov? smrti o?ividn? nad?en. No, nechme ho b?t. Nesm?m odbo?ovat od posl?n?, kter?m m? pov??il Lee.");
	MIS_Richter_KillMorgahard = LOG_SUCCESS;
};


instance DIA_Richter_KilledMorgahardPERM(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_KilledMorgahardPERM_Condition;
	information = DIA_Richter_KilledMorgahardPERM_Info;
	permanent = TRUE;
	description = "M??u pro tebe je?t? n?co ud?lat?";
};


func int DIA_Richter_KilledMorgahardPERM_Condition()
{
	if((MIS_Richter_KillMorgahard == LOG_SUCCESS) && (MIS_RichtersPermissionForShip == 0))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahardPERM_Info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahardPERM_15_00");	//M??u pro tebe je?t? n?co ud?lat?
	AI_Output(self,other,"DIA_Richter_KilledMorgahardPERM_10_01");	//Te? zrovna ne. Mo?n? pozd?ji.
};


instance DIA_Richter_PermissionForShip(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_PermissionForShip_Condition;
	information = DIA_Richter_PermissionForShip_Info;
	description = "Dej mi p?semn? pov??en? pro paladinskou lo?.";
};


func int DIA_Richter_PermissionForShip_Condition()
{
	if(MIS_RichtersPermissionForShip == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Richter_PermissionForShip_Info()
{
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_00");	//Dej mi p?semn? pov??en? pro paladinskou lo?.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_01");	//(sm?ch) Ty ses musel zbl?znit. Co to po mn? chce??
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_02");	//Sly?el jsi dob?e. Dej mi to p?semn? opr?vn?n?, nebo t? pr?sknu domobran?.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_03");	//(vr??) Nenech?m se vyd?rat! Ne od tebe! Nech?m t? se?rat vlk?m, ty mizernej ?mejde.
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_04");	//Morgahard napadl m?stodr??c?ho tv?m jm?nem. M?m dokument, kter? to dokazuje.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_05");	//(vr??) Arrh.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_06");	//Toho bude? litovat. Nikdo m? nebude vyd?rat, ani? by z toho vyv?z se zdravou k???.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_07");	//Tady je to tv? opr?vn?n?. A te? vypadni. Vy??d?m si to s tebou pozd?ji.
	CreateInvItems(self,ITWr_ForgedShipLetter_MIS,1);
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
	B_LogEntry(Topic_Ship,"S plnou moc? v kapse mohu z?skat lo?, ne? bys ?ekl ?vec. Jsem zv?dav?, co tomu ?ekne Lee.");
	MIS_RichtersPermissionForShip = LOG_SUCCESS;
	B_GivePlayerXP(XP_RichtersPermissionForShip);
};


instance DIA_Richter_perm2(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 2;
	condition = DIA_Richter_perm2_Condition;
	information = DIA_Richter_perm2_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Richter_perm2_Condition()
{
	if((MIS_RichtersPermissionForShip == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Richter_perm2_Info()
{
	AI_Output(self,other,"DIA_Richter_perm2_10_00");	//Ztra? se mi z o??.
	AI_StopProcessInfos(self);
};


instance DIA_Richter_PICKPOCKET(C_Info)
{
	npc = Vlk_402_Richter;
	nr = 900;
	condition = DIA_Richter_PICKPOCKET_Condition;
	information = DIA_Richter_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Tenhle kl?? lze snadno ukr?st)";
};


func int DIA_Richter_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Richter) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Richter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
	Info_AddChoice(DIA_Richter_PICKPOCKET,Dialog_Back,DIA_Richter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Richter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Richter_PICKPOCKET_DoIt);
};

func void DIA_Richter_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self,other,ItKe_Richter,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Richter_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Richter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
};

