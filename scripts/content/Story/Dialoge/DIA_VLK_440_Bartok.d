
instance DIA_Bartok_EXIT(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 999;
	condition = DIA_Bartok_EXIT_Condition;
	information = DIA_Bartok_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bartok_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bartok_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bartok_PICKPOCKET(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 900;
	condition = DIA_Bartok_PICKPOCKET_Condition;
	information = DIA_Bartok_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Ukr?st tento toulec se ??py je tak snadn?, jako vz?t d?t?ti bonb?n.)";
};


func int DIA_Bartok_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItRw_Arrow) >= 40) && (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Bartok_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bartok_PICKPOCKET);
	Info_AddChoice(DIA_Bartok_PICKPOCKET,Dialog_Back,DIA_Bartok_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bartok_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bartok_PICKPOCKET_DoIt);
};

func void DIA_Bartok_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self,other,ItRw_Arrow,40);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Bartok_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Bartok_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bartok_PICKPOCKET);
};


instance DIA_Bartok_Hallo(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_Hallo_Condition;
	information = DIA_Bartok_Hallo_Info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int DIA_Bartok_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bartok_Hallo_Info()
{
	AI_Output(other,self,"DIA_Bartok_Hello_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Bartok_Hello_04_01");	//Ty nejsi tady z okol?, co? Nevad? - ani j? ne.
	AI_Output(other,self,"DIA_Bartok_Hello_15_02");	//Kde ses toulal d??v?
	AI_Output(self,other,"DIA_Bartok_Hello_04_03");	//V les?ch, spole?n? s dal??mi lovci jsme chytali mrcho?routy a vlky.
	AI_Output(self,other,"DIA_Bartok_Hello_04_04");	//Ale nechal jsem toho. Te? jsou nebezpe?n? ?asy. Pohybuje se tu spousta r?zn? ch?try.
};


instance DIA_Bartok_Jaeger(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 2;
	condition = DIA_Bartok_Jaeger_Condition;
	information = DIA_Bartok_Jaeger_Info;
	permanent = FALSE;
	description = "Kde najdu ty ostatn? lovce?";
};


func int DIA_Bartok_Jaeger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Jaeger_Info()
{
	AI_Output(other,self,"DIA_Bartok_Jager_15_00");	//Kde najdu ty ostatn? lovce?
	AI_Output(self,other,"DIA_Bartok_Jager_04_01");	//M?li jsme t?bor venku, pobl?? kr?my, nap?l cesty k Onarov? farm?.
	AI_Output(self,other,"DIA_Bartok_Jager_04_02");	//Ale nev?m, jestli tam je?t? n?kdo z?stal.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_00");	//Ned?vno jsme byli je?t? oba ve m?st?.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_01");	//M?j k?mo? Trokar je velmi zru?n? lovec.
};


instance DIA_Addon_Bartok_MissingPeople(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Addon_Bartok_MissingPeople_Condition;
	information = DIA_Addon_Bartok_MissingPeople_Info;
	description = "Kde je tv?j kamar?d te??";
};


func int DIA_Addon_Bartok_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Jaeger))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bartok_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_15_00");	//Kde je tv?j kamar?d te??
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_01");	//No, to je divn? p??b?h.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_02");	//P?ed p?r dny jsme se oba potulovali kolem Coraganovi hospody a pov?dali si o lovu.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_03");	//Neptej se m?, co se stalo. Byl jsem toti? dost opil?.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_04");	//Jenom si pamtuju, ?e Trokar cht?l n?jakou tr?vu z ba?in? Ale nikdy se u? nevr?til.
	MIS_Bartok_MissingTrokar = LOG_Running;
	Info_ClearChoices(DIA_Addon_Bartok_MissingPeople);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople,"Ty jsi ho nehledal?",DIA_Addon_Bartok_MissingPeople_such);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople,"Odkud m?? to st?blo z ba?in?",DIA_Addon_Bartok_MissingPeople_wo);
};

func void DIA_Addon_Bartok_MissingPeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_wo_15_00");	//Kde sh?n?l tu tr?vu z ba?in?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_wo_04_01");	//Mysl?m, ?e n?kde z p??stavn? ?tvrti.
};

func void DIA_Addon_Bartok_MissingPeople_such()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_such_15_00");	//Ty jsi ho nehledal?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_01");	//Ne, ale ?ekl jsem o tom domobran?.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_02");	//A nikdo z nich nebyl schopn? ho naj?t.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_03");	//Douf?m, ?e ho nenapadnul n?jak? vlk nebo n?co hor??ho.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_04");	//My?lenka, ?e p?i lovu zakopnu o jeho chladn? t?lo m? d?s?.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_05");	//Nev?m, jestli bych to p?enesl p?es srdce.
};


instance DIA_Bartok_Bosper(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 3;
	condition = DIA_Bartok_Bosper_Condition;
	information = DIA_Bartok_Bosper_Info;
	permanent = FALSE;
	description = "Bosper ??kal, ?e jsi pro n?j pracoval.";
};


func int DIA_Bartok_Bosper_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_Bartok) && Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Bosper_Info()
{
	AI_Output(other,self,"DIA_Bartok_Bosper_15_00");	//Bosper ??kal, ?e jsi pro n?j pracoval.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_01");	//Ano, pracoval. Ale on se zaj?mal jen o ty sv? k??e.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_02");	//??kal jsem mu, jak je to venku nebezpe?n?. Ale v?bec m? neposlouchal.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_03");	//No, ale jinak platil dob?e - na to si nem??u st??ovat.
	AI_Output(other,self,"DIA_Bartok_Bosper_15_04");	//M??e? mi o n?m n?co ??ct?
	AI_Output(self,other,"DIA_Bartok_Bosper_04_05");	//(sm?ch) Bosperovi n?kdo ned?vno ukradl luk. Za b?l?ho dne.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_06");	//N?jakej chlap prost? nakr??el do jeho skladu, vzal ten luk a zmizel.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_07");	//Ti zlod?ji jsou ??m d?l t?m drzej??!
	if(MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		MIS_Bosper_Bogen = LOG_Running;
	};
};


instance DIA_Bartok_WannaLearn(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_WannaLearn_Condition;
	information = DIA_Bartok_WannaLearn_Info;
	permanent = FALSE;
	description = "M??e? m? nau?it n?co o lovu?";
};


func int DIA_Bartok_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Bartok_WannaLearn_15_00");	//M??e? m? nau?it n?co o lovu?
	AI_Output(self,other,"DIA_Bartok_WannaLearn_04_01");	//M??u t? nau?it, jak se po??dn? pl??it a jak zach?zet s lukem.
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(self,other,"DIA_Bartok_WannaLearn_04_02");	//Jestli se chce? nau?it stahovat zv??ata, zajdi za Bosperem. On u? bude v?d?t, co a jak.
	};
	Bartok_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Bartok m? nau?? lukost?elb? a um?n? pl??it se.");
};


instance DIA_Bartok_TeachSneak(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_TeachSneak_Condition;
	information = DIA_Bartok_TeachSneak_Info;
	permanent = TRUE;
	description = B_BuildLearnString("Nau? m?, jak se pl??it!",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1));
};


func int DIA_Bartok_TeachSneak_Condition()
{
	if((Bartok_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Bartok_TeachSneak_Info()
{
	AI_Output(other,self,"DIA_Bartok_TeachSneak_15_00");	//Nau? m?, jak se pl??it!
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_01");	//Dobr? - tak nejd??v se mus?? ujistit, ?e spr?vn? p?esouv?? sv? t??i?t?.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_02");	//Na to mus?? ohnout kolena a do?lapovat na paty.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_03");	//Mus?? m?t v?dycky v?hu sv?ho t?la na noze, na kter? stoj??, a? do t? doby, ne? tou druhou jist? do?l?pne?.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_04");	//Kolem v?t?iny zv??at se nem??e? propl??it, pokud nesp?. Ty potvory t? prost? vyc?t?.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_05");	//Tak?e v?dycky, kdy? jsi venku, d?vej dobrej pozor.
	};
};


var int Bosper_MerkeBow;

instance DIA_Bartok_Teach(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_Teach_Condition;
	information = DIA_Bartok_Teach_Info;
	permanent = TRUE;
	description = "Chci se nau?it l?p zach?zet s lukem!";
};


func int DIA_Bartok_Teach_Condition()
{
	if(Bartok_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_Teach_Info()
{
	AI_Output(other,self,"DIA_Bartok_TeachBow_15_00");	//Chci se nau?it l?p zach?zet s lukem!
	AI_Output(self,other,"DIA_Bartok_TeachBow_04_01");	//Fajn, tak se pod?v?me, jestli s t?m m??u n?co d?lat.
	Bosper_MerkeBow = other.HitChance[NPC_TALENT_BOW];
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};

func void DIA_Bartok_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00");	//M?l by ses pod?vat po n?kom, kdo o tom v? v?c ne? j?.
	}
	else if(Bosper_MerkeBow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01");	//Dobr?, u? jsi dos?hl v?t?? p?esnosti.
	};
	Info_ClearChoices(DIA_Bartok_Teach);
};

func void DIA_Bartok_Teach_BOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};

func void DIA_Bartok_Teach_BOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};


var int Bartok_Bereit;
var int Bartok_Later;

instance DIA_Bartok_Zusammen(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Bartok_Zusammen_Condition;
	information = DIA_Bartok_Zusammen_Info;
	permanent = TRUE;
	description = "Co takhle j?t lovit spole?n??";
};


func int DIA_Bartok_Zusammen_Condition()
{
	if((Bartok_Bereit == FALSE) && Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Zusammen_Info()
{
	if(Bartok_Later == FALSE)
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_00");	//Co takhle j?t lovit spole?n??
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_01");	//Hmm. Ve dvou to nebude tak nebezpe?n?, to je pravda.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_02");	//V?? aspo? n?co o lovu?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_03");	//Mysl?m, jak stahovat zv??ata?
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		if(Bartok_Later == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_HuntNOW_04_01");	//M?? 50 zla??k??
		}
		else
		{
			AI_Output(other,self,"DIA_Bartok_Zusammen_15_04");	//Ano.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_05");	//Dobr?, ale chci nejd??v vid?t 50 zlat?ch. Za to si m??e? nechat v?echny k??e a prodat je Bosperovi.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_06");	//To je f?rov? nab?dka, ne?
		};
		Info_ClearChoices(DIA_Bartok_Zusammen);
		Info_AddChoice(DIA_Bartok_Zusammen,"Pozd?ji...",DIA_Bartok_Zusammen_Later);
		Info_AddChoice(DIA_Bartok_Zusammen,"Tady jsou ...",DIA_Bartok_Zusammen_Pay);
	}
	else
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_07");	//Ne.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_08");	//V tom p??pad? to za to nestoj?.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_09");	//Vra? se, a? se n?co nau???.
	};
};

func void DIA_Bartok_Zusammen_Later()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_Later_15_00");	//Pozd?ji...
	Bartok_Later = TRUE;
	Info_ClearChoices(DIA_Bartok_Zusammen);
};

func void DIA_Bartok_Zusammen_Pay()
{
	Info_ClearChoices(DIA_Bartok_Zusammen);
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(other,self,"DIA_Bartok_HuntNOW_GO_15_00");	//Tady jsou.
		Bartok_Bereit = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_03");	//A kde? Nem?? zlato.
	};
};


var int Bartok_Los;

instance DIA_Bartok_HuntNOW(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Bartok_HuntNOW_Condition;
	information = DIA_Bartok_HuntNOW_Info;
	permanent = FALSE;
	description = "Jdeme na lov!";
};


func int DIA_Bartok_HuntNOW_Condition()
{
	if(Bartok_Bereit == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_HuntNOW_Info()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_15_00");	//Jdeme na lov!
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_01");	//Dobr?, poj? za mnou. Venku za ji?n? br?nou je les, kde se d? t? hav?ti naj?t v?c ne? dost.
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_02");	//(pro sebe) Mo?n? v?c, ne? by n?m mohlo l?bit.
	Bartok_Los = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDEMITTE");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
};


var int Bartok_OrkStillThere;

instance DIA_Bartok_ImWald(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_ImWald_Condition;
	information = DIA_Bartok_ImWald_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bartok_ImWald_Condition()
{
	if((Bartok_Los == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_03") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_ImWald_Info()
{
	AI_Output(self,other,"DIA_Bartok_ImWald_04_00");	//Tak co mysl??, p?jdeme d?l do lesa, nebo ne?
	Info_ClearChoices(DIA_Bartok_ImWald);
	Info_AddChoice(DIA_Bartok_ImWald,"Vra?me se!",DIA_Bartok_ImWald_NachHause);
	Info_AddChoice(DIA_Bartok_ImWald,"Pokra?ujem.",DIA_Bartok_ImWald_Weiter);
};

func void DIA_Bartok_ImWald_NachHause()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_NachHause_15_00");	//Vra?me se!
	AI_Output(self,other,"DIA_Bartok_ImWald_NachHause_04_01");	//Taky bych se rad?j vr?til. Nejsp?? by se n?m poda?ilo vb?hnout p??mo do n?ru?? n?jak?mu sk?etovi.
	Info_ClearChoices(DIA_Bartok_ImWald);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Bartok_ImWald_Weiter()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_Weiter_15_00");	//Pokra?ujem.
	AI_Output(self,other,"DIA_Bartok_ImWald_Weiter_04_01");	//Dobr?. (pro sebe) Doufejme, ?e se to n?jak vy?e??.
	if(!Npc_IsDead(CityOrc))
	{
		Bartok_OrkStillThere = TRUE;
	};
	Info_ClearChoices(DIA_Bartok_ImWald);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEENDE");
};


var int Bartok_Ende;

instance DIA_Bartok_Angekommen(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_Angekommen_Condition;
	information = DIA_Bartok_Angekommen_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bartok_Angekommen_Condition()
{
	if((Bartok_Los == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_07") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Angekommen_Info()
{
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_00");	//Tak! Mysl?m, ?e se vr?tim do m?sta.
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_01");	//Tady venku je to pro m? prost? p??li? nebezpe?n? - dokonce pro n?s oba.
	if(Bartok_OrkStillThere == TRUE)
	{
		B_Bartok_ShitAnOrc();
		Bartok_OrkGesagt = TRUE;
	};
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_03");	//Tak nashle!
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_04");	//M??e? ty k??e prodat Bosperovi.
	Bartok_Ende = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Bartok_PERM(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_PERM_Condition;
	information = DIA_Bartok_PERM_Info;
	permanent = TRUE;
	description = "V pohod??";
};


func int DIA_Bartok_PERM_Condition()
{
	if(Bartok_Los == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_PERM_Info()
{
	AI_Output(other,self,"DIA_Bartok_PERM_15_00");	//V pohod??
	if(Bartok_Ende == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_01");	//Ano. Ale za br?ny m?sta u? m? nikdy nikdo nedostane - alespo? ne v dohledn? dob?.
		if(Bartok_OrkGesagt == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_PERM_04_02");	//Po??d se mi klepou strachy kolena, ?e n?s dostane do sp?r? n?jakej sk?et.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_03");	//Jasn?. Jen ulov?me p?r besti?!
	};
};

