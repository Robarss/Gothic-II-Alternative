
instance DIA_DiegoNW_EXIT(C_Info)
{
	npc = PC_Thief_NW;
	nr = 999;
	condition = DIA_DiegoNW_EXIT_Condition;
	information = DIA_DiegoNW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoNW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoNW_Perm(C_Info)
{
	npc = PC_Thief_NW;
	nr = 998;
	condition = DIA_DiegoNW_Perm_Condition;
	information = DIA_DiegoNW_Perm_Info;
	permanent = TRUE;
	description = "Jak jdou obchody?";
};


func int DIA_DiegoNW_Perm_Condition()
{
	if(Diego_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Perm_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//Jak jdou obchody?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//Mizern?. N?kdo mi m?l ??ct, ?e to s Khorinisem ?lo k ??pku.
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//No nev?m. J? to m?sto zn?m jenom takhle.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//M?l jsi ho vid?t p?ed p?r lety. To by se ti v??n? l?bilo.
};


instance DIA_DiegoNW_NeedHelp(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = DIA_DiegoNW_NeedHelp_Condition;
	information = DIA_DiegoNW_NeedHelp_Info;
	important = TRUE;
};


func int DIA_DiegoNW_NeedHelp_Condition()
{
	if(Diego_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_NeedHelp_Info()
{
	if(Diego_IsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_01");	//Netva? se tak p?ekvapen?.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_02");	//(sm?je se) Ty jsi si opravdu myslel, ?e jsem se mrtv??
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_03");	//Byl jsem chv?li v bezv?dom?. Nicm?n? ?iji, jak sis mohl v?imnout.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_04");	//A nyn? jsme spolu. A to se po??t?.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_05");	//Pot?ebuji tvou pomoc.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//Dob?e ?e jsi tady. Bude? mi muset pomoci.
	};
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	if(DiegoOW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	};
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co je tohle za ?aty?",DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co tady d?l???",DIA_DiegoNW_NeedHelp_Plan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co jako?",DIA_DiegoNW_NeedHelp_Problem);
};

func void DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//Co tady d?l???
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//Pozoroval jsem str??e. Jsou po??d na nohou.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//?ekl bych, ?e proklouznout mezi nimi nebude nijak snadn?.
};

func void DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//Asi to bude m?mi ?aty. Str??e m? necht?j? pustit do m?sta.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//Proto jsem p?ed m?stem koupil od jednoho obchodn?ka tyhle hadry. Douf?m, ?e si na m? u? vzpom?n??. Jsem Diego.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//Tenkr?t v base jsem t? nau?il v?echno, co jsi pot?eboval v?d?t, abys p?e?il.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//P?ece jsi to v?echno nemohl zapomenout.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//Ehm... co v?echno se vlastn? stalo?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//No to m? omyj, ty si v??n? nic nepamatuje?.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//Hele, v??n? te? nem?m ?as ti v?echno vysv?tlovat. ?eknu to takhle: b?vali jsme zatracen? dob?? p??tel? a n?kolikr?t jsem ti zachr?nil ?ivot.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//A te? pot?ebuji tvou pomoc.
};

func void DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//Co je tohle za ?aty?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//Koupil jsem je p?ed m?stem od jednoho obchodn?ka. Str??e m? poprv? necht?li pustit dovnit?.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//Tak? nen? nutn?, aby cel? sv?t v?d?l, odkud jsem.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//To je fakt.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//Tak? to tak vid?m. Ale i kdy? jsem zahodil sv?j h?bit St?nu, jsem po??d t?m, k?m jsem byl v?dycky.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//A s t?mhle m?stem m?m velk? pl?ny.
};

func void DIA_DiegoNW_NeedHelp_Problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//Co jako?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//Hodn? v?c? se zm?nilo, co jsem ode?el. Mus?m se znovu postavit na nohy.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//V ?em je probl?m?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//Mus?m se dostat do horn? ??sti m?sta.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//Nejsem ale ob?anem m?sta a nem?m dost pen?z, abych podplatil str??e. Ale na?t?st? tady jsi ty!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//Tak?e po mn? chce?, abych ti p?j?il n?jak? pen?ze?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//Nesmysl. N?jak? zlato m?m - dokonce spoustu zlata! Bohu?el ho nem?m s sebou.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//Tak?e mi to moje zlato p?inese?.
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Na to nem?m ?as.",DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co z toho budu m?t?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Dobr?, pom??u ti.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

func void DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//Na to nem?m ?as.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//Hele, j? myslel, ?e jsme k?mo?i! Byl jsem to konec konc? j?, kdo ti zachr?nil kejh?k, kdy? t? hodili do kolonie.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//P?eh?n??.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//V??n?? Tak se zkus na chvilku zamyslet, jak by to s tebou dopadlo, kdybych ti tehdy nevysv?tlil, jak se chovat.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//Rudn? baroni by si t? dali k sn?dani, ?ekala by t? mizern? smrt v dolech.
	MIS_HelpDiegoNW = LOG_FAILED;
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};

func void DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//Co z toho budu m?t?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//Ptal jsem se snad n?kdy j? tebe, co dostanu na opl?tku? Jsme p??tel?, copak to je m?lo?
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//Dobr?, pom??u ti.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01");	//Dobr?, poslouchej: Kdy? je?t? st?la bari?ra, schoval jsem si mal? poklad.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02");	//Po?kej chv?li. To je to, co jsem si zapomn?l vz?t s sebou.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03");	//Ale mus?m zde z?stat.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03");	//Abych to zkr?til, prost? b?? do Hornick?ho ?dol? a p?ines mi moje zlato.
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"Diegovo zlato je ukryto v Hornick?m ?dol?. Pot?ebuje se dostat mezi smet?nku, a tak m? pro n? poslal.");
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co chce? s t?m zlatem d?lat?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Kde jsi to zlato z?skal?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Kam jsi to zlato ukryl?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//Co chce? s t?m zlatem d?lat?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//V horn? ??sti m?sta je obchodn?k, kter?mu mus?m zaplatit dluh. Pot?ebuju to d?t kone?n? do po??dku.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//A pak budu moci za??t zcela nov? ?ivot!
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//Kde jsi to zlato z?skal?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//Jsem snad jedin?, kdo si v Hornick?m ?dol? ?et?il pro str??ka P??hodu?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//?t?pnout p?r nuget? byla hra?ka. D?lal jsem to prost? pro p??pad, ?e bychom se nakonec dostali ven.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//Ka?d? se staral pouze o rudu, nikdo se nestaral o zlato ...
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//Kam jsi to zlato ukryl?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//Je p??mo na tr?nici. Nad opu?t?n?m dolem. Jsou v ko?en? kabele.
	if(Diego_angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01");	//Ale ticho. Mysl?m, ?e si toho nikdo nev?iml.
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02");	//Prost? vezmi v??ek a dones mi ho.
	};
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//Nezapome? se ale p?esv?d?it, ?e tam opravdu je, a? se nevrac?? s pr?zdnou.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//Jak to pozn?m?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//Ten vak je pln? zlata. Je to spousta zlata!
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Zkus?m to tvoje zlato naj?t.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);
	B_LogEntry(TOPIC_HelpDiegoNW,"Diegovo zlato je ukryto kdesi na star? obchodn? cest?, nad opu?t?n?m dolem - tam, kudy kdysi lanovkou dopravovali do kolonie zbo??.");
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//Zkus?m to tvoje zlato naj?t.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//(za?kleb? se) Jen do toho. Budeme si kvit.
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};


instance DIA_DiegoNW_HelpYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_HelpYou_Condition;
	information = DIA_DiegoNW_HelpYou_Info;
	permanent = FALSE;
	description = "Dobr?, p?ece jenom ti pom??u.";
};


func int DIA_DiegoNW_HelpYou_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_HelpDiegoNW == LOG_FAILED) && (Diego_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_HelpYou_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//Dobr?, p?ece jenom ti pom??u.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//V?d?l jsem to.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//Fajn, p?ejd?me rovnou k v?ci.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//Tak?e. V Hornick?m ?dol? jsem si schoval poklad, a ty mi ho p?inese?.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//J? mezit?m z?stanu tady a v?echno p?iprav?m.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"Diegovo zlato je ukryto kdesi na star? obchodn? cest?, nad opu?t?n?m dolem - tam, kudy kdysi lanovkou dopravovali do kolonie zbo??.");
};


instance DIA_DiegoNW_HaveYourGold(C_Info)
{
	npc = PC_Thief_NW;
	nr = 31;
	condition = DIA_DiegoNW_HaveYourGold_Condition;
	information = DIA_DiegoNW_HaveYourGold_Info;
	permanent = TRUE;
	description = "Na?el jsem tvoje zlato!";
};


func int DIA_DiegoNW_HaveYourGold_Condition()
{
	if(((OpenedDiegosBag == TRUE) || (Npc_HasItems(other,ItSe_DiegosTreasure_Mis) >= 1)) && (MIS_HelpDiegoNW == LOG_Running) && (Diego_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void b_diegonw_diegosrevenge()
{
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//Prefekt. Gerbrandt by se m?l rad?i m?t na pozoru.
};


var int DiegosRevenge;

func void DIA_DiegoNW_HaveYourGold_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//Na?el jsem tvoje zlato!
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//V?born?. Uka?.
	if(Npc_HasItems(other,ItSe_DiegosTreasure_Mis) >= 1)
	{
		B_GiveInvItems(other,self,ItSe_DiegosTreasure_Mis,1);
		b_diegonw_diegosrevenge();
		DiegosRevenge = TRUE;
	}
	else if(Npc_HasItems(other,ItMi_Gold) < DiegosTreasure)
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//Ale to nen? v?echno! Nev???? mi? Pot?ebuju v?echno.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//Pokud m?j pl?n vyjde, zbude dost i na tebe.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//Tak?e se sna?, aby nic nechyb?lo. Je to d?le?it?!
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,DiegosTreasure);
		b_diegonw_diegosrevenge();
		DiegosRevenge = TRUE;
	};
	if((Npc_IsDead(Gerbrandt) == FALSE) && (DiegosRevenge == TRUE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//Poslouchej, je?t? se mus?m postarat o ty str??e.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//Cht?l bych, abys donesl tenhle dopis Gerbrandtovi. Je to jeden z t?ch tlust?ch obchodn?k? v horn? ?tvrti.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//Pozdravuj ho ode mne. Pak se s tebou setk?m p?ed Gerbrandtov?m domem.
		CreateInvItems(self,ItWr_DiegosLetter_MIS,1);
		B_GiveInvItems(self,other,ItWr_DiegosLetter_MIS,1);
		B_StartOtherRoutine(Gerbrandt,"WaitForDiego");
		MIS_HelpDiegoNW = LOG_SUCCESS;
		MIS_DiegosResidence = LOG_Running;
		B_GivePlayerXP(XP_HelpDiegoNW);
		Log_CreateTopic(TOPIC_DiegosResidence,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DiegosResidence,LOG_Running);
		B_LogEntry(TOPIC_DiegosResidence,"Diego mi p?edal dopis pro obchodn?ka Gerbrandta.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_DiegoNW_DeliveredLetter(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_DeliveredLetter_Condition;
	information = DIA_DiegoNW_DeliveredLetter_Info;
	permanent = FALSE;
	description = "Doru?il jsem ten dopis.";
};


func int DIA_DiegoNW_DeliveredLetter_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_DiegosResidence == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_DeliveredLetter_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//Doru?il jsem ten dopis.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//Velmi dob?e. Jak to Gerbrandt vzal?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//Vypadal docela ?okovan? a okam?it? se ztratil.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//(spokojen?) To bych ?ekl.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//Ob?v?m se, ?e ze v?eho nejd??v budu muset dohl?dnout na vybaven? sv?ho nov?ho domu. Pokud si dob?e pamatuju, tak Gerbrandt m?l stra?n? vkus, co se n?bytku t??e.
	B_GivePlayerXP(XP_DiegoHasANewHome);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"A jak jsi to vlastn? ud?lal?",DIA_DiegoNW_DeliveredLetter_YourTrick);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"Tak?e ten d?m je tv?j?",DIA_DiegoNW_DeliveredLetter_YourHouse);
};

func void DIA_DiegoNW_DeliveredLetter_Gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//A co Gerbrandt?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//U? si u??val toho pohodln?ho ?ivota p??li? dlouho.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//On si ?il tady, uprost?ed luxusu, zat?mco j? dlabal v dolech v?var z krys.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//Netu??m, kam m?l nam??eno, ale do Khorinisu u? nikdy nevkro?? - na to dohl?dnu.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//Kdybys ho hledal, najde? ho asi v p??stavn? ?tvrti.
};

func void DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//Tak?e ten d?m je tv?j?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//Ano, od sklepa a? po p?du, v?etn? v?eho n?bytku.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//Po n?kolika letech str?ven?ch v krajn? nevyhovuj?c?ch podm?nk?ch se t???m, a? se vysp?m v posteli s nebesy.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//A k sn?dani si pak d?m dobr? v?no a ??avnatou ?un?i?ku.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//Chyt?? ?t?st? za pa?esy, co?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//Se vsa?.
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//A jak jsi to vlastn? ud?lal?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//Mysl?? snad, ?e Gerbrandt p?i?el ke v?emu tomu bohatstv? poctiv?m obchodem?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//Kdy? p?i?lo na n?jakou levotu, tak si s?m ruce pochopiteln? nikdy neza?pinil. Na to m?l pomocn?ka.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//Samoz?ejm?, ?e jsem tu a tam n?co pochytil. Gerbrandt se m? nakonec zbavil. Nejsp?? se b?l, ?e toho v?m p??li?.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//O tom jsi mi nikdy ne?ekl.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//Nikdy ses neptal.
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,Dialog_Back,DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"A co m?j pod?l?",DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"A co Gerbrandt?",DIA_DiegoNW_DeliveredLetter_Gerbrandt);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//A co m?j pod?l?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//Zd? se, ?e jsi nakonec p?ece jenom nezapomn?l na v?echno, co jsem t? nau?il.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//Ale m?? pravdu, bez tebe bych to nedok?zal. Tady je tv?j d?l.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_BACK()
{
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
};


var int Diego_Teach;

instance DIA_DiegoNW_CanYouTeach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 995;
	condition = DIA_DiegoNW_CanYouTeach_Condition;
	information = DIA_DiegoNW_CanYouTeach_Info;
	permanent = TRUE;
	description = "M??e? m? n??emu nau?it?";
};


func int DIA_DiegoNW_CanYouTeach_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Diego_Teach == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_CanYouTeach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//M??e? m? n??emu nau?it?
	if(Npc_KnowsInfo(other,DIA_DiegoNW_DeliveredLetter))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//Ale jist?. Jen mi ?ekni, a? bude? p?ipraven.
		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//Nejd??v se mus?m postarat o vlastn? z?le?itosti.
	};
};


var int DiegoNW_Merke_DEX;

instance DIA_DiegoNW_Teach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 995;
	condition = DIA_DiegoNW_Teach_Condition;
	information = DIA_DiegoNW_Teach_Info;
	permanent = TRUE;
	description = "U? m?.";
};


func int DIA_DiegoNW_Teach_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Diego_Teach == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//U? m?.
	AI_Output(self,other,"DIA_DiegoNW_Teach_11_01");	//Nau??m t?, jak b?t o n?co obratn?j??.
	DiegoNW_Merke_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_Teach_BACK()
{
	if(DiegoNW_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//U? jsi obratn?j??. Jen tak d?l!
	};
	Info_ClearChoices(DIA_DiegoNW_Teach);
};

func void DIA_DiegoNW_TeachDEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_TeachDEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};


instance DIA_DiegoNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_KnowWhereEnemy_Condition;
	information = DIA_DiegoNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Odch?z?m z Khorinisu.";
};


func int DIA_DiegoNW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Diego_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//Odch?z?m z Khorinisu.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//Moudr? rozhodnut?. P??l bych si j?t s tebou. Tohle m?sto se p??li? rychle zm?nilo - ?asy, kdy jsi mohl rychle zbohatnout, u? jsou pry?.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//Mohl bych t? u?it v lu?i?tnictv?, p??en? z?mk? a navy?ov?n? obratnosti.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//Nav?c by se ti ur?it? hodil n?jak? slu?n? zlod?j.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Diego chce j?t samoz?ejm? se mnou. Vid? to tak, ?e ??m d??v Khorinis opust?, t?m l?p. Mohl by mi uk?zat, jak se st?t obratn?j??m a vycvi?it m? v lukost?elb?. Tak? se se mnou pod?l? o um?n? p??it z?mky.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//Nech?m si to proj?t hlavou. Moment?ln? je moje pos?dka v pln?m stavu.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//Rozmysli si to. Tak jako tak m? najde? tady.
	}
	else
	{
		Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"Snad ti d?m v?d?t, a? p?ijde ten prav? ?as.",DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"Nechce? j?t taky?",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//Tak poje? se mnou setk?me se v p??stavu.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//Hmm. M?? pravdu, Khorinis je ?umpa. Jdu s tebou.
	self.flags = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_GivePlayerXP(XP_Crewmember_Success);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//Po?kej, za okam?ik budu p?ipraven.
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,ITAR_Diego,1);
		AI_EquipArmor(self,ITAR_Diego);
		AI_Wait(self,1);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//Tak, jsem p?ipraven. Uvid?me se u lodi.
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};

func void DIA_DiegoNW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//Mo?n? ti d?m v?d?t, a? nadejde ?as.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//Jak mysl??. A mo?n? s tebou dokonce i p?jdu. Kdo v??
	Diego_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};


instance DIA_DiegoNW_LeaveMyShip(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_LeaveMyShip_Condition;
	information = DIA_DiegoNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Dohl?dni rad?i na m?sto.";
};


func int DIA_DiegoNW_LeaveMyShip_Condition()
{
	if((Diego_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//Dohl?dni rad?i na m?sto.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//V??n?? U? m? nepot?ebuje?? No dobr?. Nezapome? se stavit, a? bude? zp?tky ve m?st?.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//Mysl??, ?e se je?t? setk?me?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//Nikdy nezapomenu na ten v?raz, kter? jsi m?l ve tv??i, kdy? ses v?lel po zemi po t? r?n? od Bullita a my se poprv? setkali.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//Nemaj? ?anci sehnat n?koho lep??ho, ne? jsi ty. M?LI bychom se znovu setkat. D?vej na sebe pozor.
	Diego_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_DiegoNW_StillNeedYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_StillNeedYou_Condition;
	information = DIA_DiegoNW_StillNeedYou_Info;
	permanent = TRUE;
	description = "Rozmyslel jsem si to. Chci, abys ?el se mnou.";
};


func int DIA_DiegoNW_StillNeedYou_Condition()
{
	if(((Diego_IsOnBoard == LOG_OBSOLETE) || (Diego_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//Rozmyslel jsem si to. Chci, abys ?el se mnou.
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//Kam se pod?lo tv? odhodl?n?, p??teli? Jasn?, ?e s tebou p?jdu - ale u? se sakra rozhodni.
	self.flags = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_02");	//Po?kej, za okam?ik budu p?ipraven.
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,ITAR_Diego,1);
		AI_EquipArmor(self,ITAR_Diego);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//Dobr?, m??eme j?t.
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Thief_NW_PICKPOCKET(C_Info)
{
	npc = PC_Thief_NW;
	nr = 900;
	condition = DIA_Thief_NW_PICKPOCKET_Condition;
	information = DIA_Thief_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Thief_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(120,600);
};

func void DIA_Thief_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,Dialog_Back,DIA_Thief_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thief_NW_PICKPOCKET_DoIt);
};

func void DIA_Thief_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};

func void DIA_Thief_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};

