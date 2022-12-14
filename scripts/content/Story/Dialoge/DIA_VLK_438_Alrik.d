
instance DIA_Alrik_EXIT(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 999;
	condition = DIA_Alrik_EXIT_Condition;
	information = DIA_Alrik_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alrik_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alrik_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alrik_PICKPOCKET(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 900;
	condition = DIA_Alrik_PICKPOCKET_Condition;
	information = DIA_Alrik_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Alrik_PICKPOCKET_Condition()
{
	return C_Beklauen(55,50);
};

func void DIA_Alrik_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
	Info_AddChoice(DIA_Alrik_PICKPOCKET,Dialog_Back,DIA_Alrik_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alrik_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alrik_PICKPOCKET_DoIt);
};

func void DIA_Alrik_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};

func void DIA_Alrik_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};


instance DIA_Alrik_Hallo(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Hallo_Condition;
	information = DIA_Alrik_Hallo_Info;
	permanent = FALSE;
	description = "Co tady d?l???";
};


func int DIA_Alrik_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Alrik_Hallo_Info()
{
	AI_Output(other,self,"DIA_Alrik_Hallo_15_00");	//Co tady d?l???
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_01");	//(sm?je se) J? tady bydl?m!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_02");	//Co bych tu asi tak m?l d?lat? Piju!
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_03");	//Vyjdu si na men?? proch?zku.
	};
	AI_Output(self,other,"DIA_Alrik_Hallo_09_04");	//Ale jestli t?m mysl??, co d?l?m cel? cen, tak po??d?m souboje.
};


instance DIA_Alrik_YouFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_YouFight_Condition;
	information = DIA_Alrik_YouFight_Info;
	permanent = FALSE;
	description = "Ty po??d?? souboje?";
};


func int DIA_Alrik_YouFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Alrik_YouFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_YouFight_15_00");	//Ty po??d?? souboje?
	AI_Output(self,other,"DIA_Alrik_YouFight_09_01");	//Ka?d? den od poledne do ve?era.
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_YouFight_09_02");	//A p??mo tady!
	};
	AI_Output(self,other,"DIA_Alrik_YouFight_09_03");	//Za skladi?t?m v p??stavn? ?tvrti - v?ude dob?e, doma nejl?p!
};


instance DIA_ALRIK_SELLWHAT(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = dia_alrik_sellwhat_condition;
	information = dia_alrik_sellwhat_info;
	permanent = FALSE;
	description = "Nev?? kde bych mohl koupit takov? oblek jako m?? ty ?.";
};


func int dia_alrik_sellwhat_condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_alrik_sellwhat_info()
{
	AI_Output(other,self,"DIA_Alrik_SellWhat_15_00");	//Nev?? kde bych mohl koupit takov? oblek jako m?? ty ?
	AI_Output(self,other,"DIA_Alrik_SellWhat_09_01");	//Ano a to p??mo u m?.
};


var int alrik_leatherbought;

instance DIA_ALRIK_LEATHER(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 650;
	condition = dia_alrik_leather_condition;
	information = dia_alrik_leather_info;
	permanent = TRUE;
	description = "Koupit Vystu?enou tuniku. (500 zla??k?)";
};


func int dia_alrik_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_sellwhat) && (ALRIK_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_alrik_leather_info()
{
	AI_Output(other,self,"DIA_Alrik_LEATHER_15_00");	//D?ky za dobr? obchod.
	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		AI_Output(self,other,"DIA_Alrik_LEATHER_09_01");	//Bude se ti moc l?bit.
		CreateInvItems(other,itar_geralt_addon,1);
		AI_PrintScreen("Zbroj od Alrika z?sk?na.",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		ALRIK_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_LEATHER_09_02");	//Od?v m? svou cenu - a opravdu za to stoj?. Tak?e se vra?, a? d?? dohromady dost zlata.
	};
};


instance DIA_Alrik_Regeln(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Regeln_Condition;
	information = DIA_Alrik_Regeln_Info;
	permanent = FALSE;
	description = "Jsou n?jak? pravidla?";
};


func int DIA_Alrik_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Regeln_Info()
{
	AI_Output(other,self,"DIA_Alrik_Regeln_15_00");	//Jsou n?jak? pravidla?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_01");	//Je to jednoduch?: jsou povolen? v?echny norm?ln? zbran?. ??dn? luky ani ku?e a ??DN? magie!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_02");	//Bojujeme, dokud jeden z n?s nepadne. Jakmile bude jeden le?et s dr?kou v hl?n?, je konec, jasn??
	AI_Output(self,other,"DIA_Alrik_Regeln_09_03");	//Ka?d?, kdo opust? m?sto z?pasu, taky prohr?l. Tak?e kdy? ute?e?, vyhr?l jsem j?!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_04");	//Z?pisn? je 50 zla??k? a kdy? vyhraje?, dostane? zp?tky stovku. Kdy? ne, tak o ty prachy p?ijde? (u?kl?bne se).
	AI_Output(self,other,"DIA_Alrik_Regeln_09_05");	//Ch?pe??
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//Jo!
};

func void B_Alrik_Again()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_03");	//Tak co? Chce? si to se mnou znova rozdat? Mysl?m, ?e jsem se mezit?m zlep?il.
};


instance DIA_Alrik_NewFights3(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights3_Condition;
	information = DIA_Alrik_NewFights3_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights3_Condition()
{
	if((Kapitel >= 3) && (Kapitel <= 4) && (Alrik_ArenaKampfVerloren <= 6))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights3_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,20);
	B_SetAttributesToChapter(self,4);
	B_Alrik_Again();
};


instance DIA_Alrik_NewFights5(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights5_Condition;
	information = DIA_Alrik_NewFights5_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights5_Condition()
{
	if((Kapitel >= 5) && (Alrik_ArenaKampfVerloren <= 9))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights5_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,20);
	B_SetAttributesToChapter(self,6);
	B_Alrik_Again();
};

func void B_Alrik_Enough()
{
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_05");	//?ekl bych, ?e u? ses navyhr?val dost.
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_06");	//Nech?pej m? ?patn?, ale od minula mi je?t? nep?estalo hu?et v hlav?.
};

func void B_Alrik_ComeBackLater()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_02");	//Tak se vra? pozd?ji - j? mezit?m budu cvi?it.
};


instance DIA_Alrik_WannaFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WannaFight_Condition;
	information = DIA_Alrik_WannaFight_Info;
	permanent = TRUE;
	description = "Chci s tebou bojovat!";
};


func int DIA_Alrik_WannaFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Regeln) && (self.aivar[AIV_ArenaFight] == AF_NONE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WannaFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_15_00");	//Chci s tebou bojovat!
	Info_ClearChoices(DIA_Alrik_WannaFight);
	if(((Alrik_ArenaKampfVerloren > 0) && (Npc_HasItems(self,ItMw_AlriksSword_Mis) == 0)) || (Npc_HasEquippedMeleeWeapon(self) == FALSE))
	{
		if(MIS_Alrik_Sword == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_01");	//Nejd??v mi vra? me? a pak uvid?me.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_02");	//Ne-e, ne? se ti znova postav?m, pot?ebuju lep?? zbra?!
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_03");	//P?ed p?r dny jsem musel prodat sv?j me?.
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_04");	//S n?m m? toti? nikdo neporaz?, hochu! Kdy? mi ho p?inese?, klidn? si s tebou zase zabojuju!
			Alrik_VomSchwertErzaehlt = TRUE;
			Log_CreateTopic(TOPIC_AlrikSchwert,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_AlrikSchwert,LOG_Running);
			B_LogEntry(TOPIC_AlrikSchwert,"Alrik prodal sv?j me? obchodn?ku Jorovi. Bude se se mnou b?t pouze tehdy, pokud mu jej p?inesu zp?tky.");
		};
	}
	else if((Kapitel <= 2) && (Alrik_ArenaKampfVerloren > 3))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_00");	//Mysl?m, ?e to by prozat?m mohlo sta?it.
		AI_Output(self,other,"DIA_Alrik_Add_09_01");	//Nech m? trochu vydechnout.
		B_Alrik_ComeBackLater();
	}
	else if((Kapitel >= 3) && (Kapitel <= 4) && (Alrik_ArenaKampfVerloren > 6))
	{
		B_Alrik_Enough();
		B_Alrik_ComeBackLater();
	}
	else if((Kapitel >= 5) && (Alrik_ArenaKampfVerloren > 9))
	{
		B_Alrik_Enough();
		AI_Output(self,other,"DIA_Alrik_Add_09_04");	//Krom toho jsem u? dal dohromady dost pen?z.
		AI_Output(self,other,"DIA_Alrik_Add_09_05");	//Kon??m a jdu si ve m?st? naj?t n?jak? m?sto, kde bych mohl z?stat.
		AI_Output(self,other,"DIA_Alrik_Add_09_06");	//Kdo v?, mo?n? si otev?u obchod se zbran?mi.
	}
	else if(Wld_IsTime(11,0,19,0))
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_07");	//M?? 50 zla??k??
		Info_ClearChoices(DIA_Alrik_WannaFight);
		Info_AddChoice(DIA_Alrik_WannaFight,"Ani n?hodou...",DIA_Alrik_WannaFight_NoGold);
		if(Npc_HasItems(other,ItMi_Gold) >= 50)
		{
			Info_AddChoice(DIA_Alrik_WannaFight,"Jak si p?eje?...",DIA_Alrik_WannaFight_Gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_08");	//Bojuju pouze od ob?da do ve?era.
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_09");	//Boj stoj? za to pouze tehdy, pokud je kolem dost div?k?, kte?? uzav?raj? s?zky!
		if(Wld_IsTime(19,0,3,30))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_10");	//Te? u? je moc pozd?, vra? se z?tra v poledne!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_11");	//Te? je je?t? brzo, vra? se pozd?ji!
		};
	};
};

func void DIA_Alrik_WannaFight_Gold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Jak si p?eje?.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_01");	//(hlasit?) M?me tu nov?ho vyzyvatele!
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_02");	//S?zky jsou uzav?eny.
	Npc_RemoveInvItems(self,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	CreateInvItems(self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_03");	//Jsi p?ipraven?
	self.aivar[AIV_ArenaFight] = AF_RUNNING;
	Alrik_Kaempfe = Alrik_Kaempfe + 1;
	Info_ClearChoices(DIA_Alrik_WannaFight);
	Info_AddChoice(DIA_Alrik_WannaFight,"Je?t? chvilku.",DIA_Alrik_WannaFight_Moment);
	Info_AddChoice(DIA_Alrik_WannaFight,"Poj? sem!",DIA_Alrik_WannaFight_NOW);
};

func void DIA_Alrik_WannaFight_NoGold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//Ani n?hodou.
	AI_Output(self,other,"DIA_Alrik_WannaFight_NoGold_09_01");	//Tak je se?e?! Bez s?zek nen? ??dn? boj!
	Info_ClearChoices(DIA_Alrik_WannaFight);
};

func void DIA_Alrik_WannaFight_NOW()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NOW_15_00");	//Poj? sem!
	AI_Output(self,other,"DIA_Alrik_WannaFight_NOW_09_01");	//Tak uvid?me, jak to zvl?dne?!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Alrik_WannaFight_Moment()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Moment_15_00");	//Je?t? chvilku.
	AI_Output(self,other,"DIA_Alrik_WannaFight_Moment_09_01");	//Klidn? si dej na ?as - j? za??n?m te?!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Alrik_AfterFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_AfterFight_Condition;
	information = DIA_Alrik_AfterFight_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Alrik_AfterFight_Condition()
{
	if((self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		if(self.aivar[AIV_ArenaFight] != AF_NONE)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
	};
};

func void DIA_Alrik_AfterFight_Info()
{
	if((self.aivar[AIV_LastPlayerAR] == AR_NONE) && (self.aivar[AIV_ArenaFight] != AF_NONE) && (self.aivar[AIV_ArenaFight] != AF_AFTER_PLUS_DAMAGE))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_00");	//P?ni, chlape, ty m?? ale s?lu!
			if(Npc_HasItems(self,ItMi_Gold) >= 100)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_01");	//Tady m?? t?ch 100 zla??k?, zaslou?il sis je!
				B_GiveInvItems(self,other,ItMi_Gold,100);
			}
			else if(Npc_HasItems(self,ItMi_Gold) == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_02");	//Vid?m, ?e sv? zlato sis u? vzal.
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_03");	//M?ls ale po?kat, a? ti je d?m - j? sv? slovo dr??m!
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_04");	//Tys m? ale pro?acoval, kdy? jsem byl v bezv?dom?!
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_05");	//To nen? dobr?, chlape! No, nevad?, ty prachy ti stejn? pat?ily - a tady je zbytek!
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
			};
			Alrik_ArenaKampfVerloren = Alrik_ArenaKampfVerloren + 1;
		}
		else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_06");	//To byl dobr? boj. S?zku jsi ale prohr?l - nic si z toho ale ned?lej, p?isp?ls na dobrou v?c! (u?kl?bne se)
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_07");	//Hej, jak jsem ?ekl, ka?d?, kdo se vzd?l? ze z?pasi?t?, prohr?l! Jestli to chce? ale zkusit znova, jsem ti k dispozici!
		};
		if(Alrik_Kaempfe == 1)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_08");	//A je?t? jedna v?c: o tom, co se d?je za skladi?t?m, se nemluv?.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_09");	//Domobrana t? m??e ?oupnout za m???e za sebemen?? proh?e?ek - a s?zen? na souboje se jim rozhodn? moc nel?b?.
			};
		};
		self.aivar[AIV_ArenaFight] = AF_NONE;
		self.aivar[AIV_LastFightComment] = TRUE;
	}
	else
	{
		if(self.aivar[AIV_ArenaFight] == AF_AFTER_PLUS_DAMAGE)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_10");	//Boj skon?il, b??dile!
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_11");	//Nel?b? se mi, kdy? n?kdo poru?uje pravidla.
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_12");	//Vypadni odsud!
		}
		else
		{
			if(Alrik_Kaempfe == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_13");	//Kdy? jsi se mnou cht?l bojovat, sta?ilo, abys m? prost? vyzval.
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_14");	//Jestli chce? dal?? boj, tak m? k n?mu prost? vyzvi!
			};
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_15");	//S takov?mi pobudy, jako jsi ty, nechci nic m?t! Odpal!
		};
		self.aivar[AIV_ArenaFight] = AF_NONE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Alrik_DuWohnst(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_DuWohnst_Condition;
	information = DIA_Alrik_DuWohnst_Info;
	permanent = FALSE;
	description = "Ty bydl?? za skladi?t?m?";
};


func int DIA_Alrik_DuWohnst_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_DuWohnst_Info()
{
	AI_Output(other,self,"DIA_Alrik_DuWohnst_15_00");	//(p?ekvapen?) Ty bydl?? za skladi?t?m?
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_01");	//Je to jenom do?asn?. (u?kl?bne se) Kdybys m?l tolik pen?z co j?, taky by sis dop??l trochu pohodl?!
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_02");	//B?val jsem v?cvikov?m instruktorem v arm?d?, ale pak jsem toho nechal a vydal se za dobrodru?stv?m.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_03");	//A te? jsem skon?il v t?hle ?pinav? d??e a posledn?ch 100 zla??k? vysolil str???m u br?ny.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_04");	//Tak?e te? kouk?m zase p?ij?t k n?jak?m pen?z?m. Dokonce jsem musel prodat i sv?j me?.
	Alrik_VomSchwertErzaehlt = TRUE;
};


instance DIA_Alrik_WerSchwert(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WerSchwert_Condition;
	information = DIA_Alrik_WerSchwert_Info;
	permanent = FALSE;
	description = "Komu jsi sv?j me? prodal?";
};


func int DIA_Alrik_WerSchwert_Condition()
{
	if((Alrik_VomSchwertErzaehlt == TRUE) && (MIS_Alrik_Sword != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WerSchwert_Info()
{
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_00");	//Komu jsi sv?j me? prodal?
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_01");	//U jednoho obchodn?ka na tr?i?ti jsem jej vym?nil za n?jak? z?soby.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_02");	//Ten chl?pek se jmenuje Jora. Ty pochodn? a trochu j?dla, co mi dal, jsem u? d?vno spot?eboval.
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_03");	//Ten me? mi ale asi jen tak zadarmo ned?.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_04");	//Ten me? je star? a nejsp?? za n?j moc cht?t nebude. Mysli p?itom na prachy, kter? si vyd?l?? na s?zk?ch p?i z?pase. (u?kl?bne se)
	MIS_Alrik_Sword = LOG_Running;
};


var int Alrik_EinmalSchwertBonus;

instance DIA_Alrik_HaveSword(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_HaveSword_Condition;
	information = DIA_Alrik_HaveSword_Info;
	permanent = TRUE;
	description = "M?m ten tv?j me?.";
};


func int DIA_Alrik_HaveSword_Condition()
{
	if(Npc_HasItems(other,ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};

func void DIA_Alrik_HaveSword_Info()
{
	AI_Output(other,self,"DIA_Alrik_HaveSword_15_00");	//M?m ten tv?j me?.
	B_GiveInvItems(other,self,ItMw_AlriksSword_Mis,1);
	if(MIS_Alrik_Sword != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_01");	//P?ni! To je mnohem lep?? ne? bojovat s n?jak?m star?m klackem!
		MIS_Alrik_Sword = LOG_SUCCESS;
		B_GivePlayerXP(XP_AlriksSword);
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_02");	//Skv?l?! Jsem zv?dav, jestli se m? te? odv???? vyzvat je?t? jednou!
	};
	if(Alrik_EinmalSchwertBonus == FALSE)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,20);
		Alrik_EinmalSchwertBonus = TRUE;
	};
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_Alrik_Krieg(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Krieg_Condition;
	information = DIA_Alrik_Krieg_Info;
	permanent = FALSE;
	description = "Co v?? o t? v?lce se sk?ety?";
};


func int DIA_Alrik_Krieg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) || (hero.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Krieg_Info()
{
	AI_Output(other,self,"DIA_Alrik_Krieg_15_00");	//Co v?? o t? v?lce se sk?ety?
	AI_Output(self,other,"DIA_Alrik_Krieg_09_01");	//K tomu nen? moc co ??ct. Ta v?lka prost? trv? u? moc dlouho.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_02");	//Cel? zem? hladov?. V?ude propukaj? rolnick? nepokoje, kter? kr?l nemilosrdn? pot?r?.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_03");	//Ale moc mu to nepom??e - t?ch vzpour je p??li? mnoho. Jestli v?lka brzo neskon??, cel? ???e se rozpadne.
};


var int Alrik_VorausErzaehlt;

instance DIA_Alrik_Ausbilden(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Ausbilden_Condition;
	information = DIA_Alrik_Ausbilden_Info;
	permanent = TRUE;
	description = "M??e? m? u?it?";
};


func int DIA_Alrik_Ausbilden_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) || (hero.guild != GIL_NONE)) && (Alrik_Teach1H == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Ausbilden_Info()
{
	AI_Output(other,self,"DIA_Alrik_Ausbilden_15_00");	//M??e? m? u?it?
	if((Alrik_Kaempfe == 0) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Alrik_Ausbilden_09_01");	//Jestli se opravdu chce? nau?it bojovat, tak si to poj? rozdat se mnou. (dom??liv?) A ani si za tu lekci nebude? muset p?iplatit.
		Alrik_VorausErzaehlt = TRUE;
	}
	else
	{
		if(Alrik_VorausErzaehlt == TRUE)
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_02");	//Dodr??m slovo a nau??m t? v?echno, co zn?m - pokud m?? tedy dostatek zku?enost?.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_03");	//Jestli m?? dostatek zku?enost?, tak jasn?!
		};
		Alrik_Teach1H = TRUE;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Alrik m? nau?? bojovat jednoru?n?mi zbran?mi. Potuluje se za skladi?t?m v p??stavn? ?tvrti.");
	};
};


var int Alrik_Merke_1h;

instance DIA_Alrik_Teach(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Teach_Condition;
	information = DIA_Alrik_Teach_Info;
	permanent = TRUE;
	description = "Vycvi? m? v boji s me?em!";
};


func int DIA_Alrik_Teach_Condition()
{
	if(Alrik_Teach1H == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Alrik_Teach_Info()
{
	AI_Output(other,self,"DIA_Alrik_Teach_15_00");	//Vycvi? m? v boji s me?em!
	Alrik_Merke_1h = other.HitChance[NPC_TALENT_1H];
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
};

func void DIA_Alrik_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_1H] >= (60 - 30))
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_00");	//U? nejsi ??dn? nov??ek!
	}
	else if(other.HitChance[NPC_TALENT_1H] > Alrik_Merke_1h)
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_01");	//U? ses po??dn? zlep?il - brzo z tebe bude po??dn? bojovn?k!
	};
	Info_ClearChoices(DIA_Alrik_Teach);
};

func void DIA_Alrik_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
};

func void DIA_Alrik_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
};

