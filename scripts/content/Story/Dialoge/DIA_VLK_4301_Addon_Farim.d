
instance DIA_Addon_Farim_EXIT(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 999;
	condition = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Farim_PICKPOCKET(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 900;
	condition = DIA_Addon_Farim_PICKPOCKET_Condition;
	information = DIA_Addon_Farim_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Farim_PICKPOCKET_Condition()
{
	return C_Beklauen(20,11);
};

func void DIA_Addon_Farim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET,Dialog_Back,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};

func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};


instance DIA_Addon_Farim_Hallo(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Hallo_Condition;
	information = DIA_Addon_Farim_Hallo_Info;
	description = "Ty jsi ryb???";
};


func int DIA_Addon_Farim_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Hallo_15_00");	//Ty jsi ryb???
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_01");	//(cynicky) Jak si to uhodl?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_02");	//Nem??e? m? prost? nechat na pokoji?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_02");	//Nevykl?dej si to ?patn?, ale j? nem?m domobranu moc v l?sce.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_03");	//Nevykl?dej si to ?patn?, ale v posledn? dob? m?m ?patnou n?ladu. Probl?my s domobranou ...
	};
};


instance DIA_Addon_Farim_MilizProbs(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MilizProbs_Condition;
	information = DIA_Addon_Farim_MilizProbs_Info;
	description = "Probl?my s domobranou?";
};


func int DIA_Addon_Farim_MilizProbs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_MilizProbs_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_15_00");	//Probl?my s domobranou?
	if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_01");	//Ti ?mejdi sem prost? norm?ln? p?i?li a vzali si, co cht?li.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_02");	//Minul? t?den mi vzali cel? ?lovek. 'Je to pro dobrou v?c', ??kali.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_03");	//V?m, ?e se te? v?ichni mus?me starat sami o sebe, je?t? kdy? farm??i p?estali obchodovat.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_04");	//N?kdy mus?m chodit sp?vat s pr?zdn?m ?aludkem. Nezaj?m? je to. Seberou mi v?echny ryby a j? nem??u nic d?lat.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_05");	//A pokud to tak p?jde d?l, nebudu m?t, co j?st.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Dej mi v?echny tv? ryby.",DIA_Addon_Farim_MilizProbs_klauen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Mo?n? bych ti mohl pomoci.",DIA_Addon_Farim_MilizProbs_helfen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Mluvil jsi o tom s paladiny?",DIA_Addon_Farim_MilizProbs_paladine);
};

func void DIA_Addon_Farim_MilizProbs_paladine()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_paladine_15_00");	//Mluvil jsi o tom s paladiny?
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_paladine_11_01");	//(sm?je se) To si d?l?? srandu? Mysl??, ?e je zaj?m?, ?e n?jak? chud?k jako j? m? probl?m s domobranou?
};


var int Farim_PissedOff;

func void DIA_Addon_Farim_MilizProbs_klauen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_klauen_15_00");	//Dej mi v?echny tv? ryby.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_01");	//(na?tvan?) V?d?l jsem to. Dal?? z t?ch parchant?.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_02");	//Ale mysl?m, ?e jde? pozd?. Tvoji k?mo?i mi v?echno vzali u? v?era.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_04");	//?ekl bych, ?e bys m?l rad?i odej?t.
	Farim_PissedOff = TRUE;
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
};

func void DIA_Addon_Farim_MilizProbs_helfen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_00");	//Mo?n? bych ti mohl pomoci.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_02");	//Nev?m. Musel bys zn?t n?koho z domobrany, kdo se zn? s paladiny ...
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_03");	//Paladinov? moje ryby jen st??? vykoup?.
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_04");	//Uvid?m, co se d? d?lat.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Log_CreateTopic(TOPIC_Addon_FarimsFish,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish,LOG_Running);
	B_LogEntry(TOPIC_Addon_FarimsFish,"Ryb?? Farim m? probl?my s domobranou. Berou mu p??li? mnoho ryb. Mus?m naj?t n?koho z domobrany, kdo m? kontakt na paladiny a kdo mu pom??e.");
	MIS_Addon_Farim_PaladinFisch = LOG_Running;
};


instance DIA_Addon_Farim_MartinHelps(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MartinHelps_Condition;
	information = DIA_Addon_Farim_MartinHelps_Info;
	description = "M?m ?e?en? tv?ho probl?mu.";
};


func int DIA_Addon_Farim_MartinHelps_Condition()
{
	if((MIS_Addon_Farim_PaladinFisch == LOG_Running) && (Martin_KnowsFarim == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_MartinHelps_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_00");	//M?m ?e?en? tv?ho probl?mu.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_01");	//Fakt? A jak??
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_02");	//Tro?ku jsem to tady omrknul.
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_03");	//A zn?m n?koho, kdo by mohl pomoci.
	};
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_04");	//Martin, d?stojn?k paladin?, si vyslechne tv?j probl?m s domobranou.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_05");	//A mysl??, ?e m??e zajistit, aby m? domobrana u? neotravovala?
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_06");	//P?esn? tak.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_07");	//Par?da. D?ky. Nem??u ti toho moc d?t. Ale po?kej ...
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_08");	//Na?el jsem tenhle zvl??tn? modr? k?men na ostrov? bl?zko khorinisu.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_09");	//Nemysl?m, ?e je to n?jak cenn?, ale n?kdo jako ty, by to mohl vyu??t.
	B_GiveInvItems(self,other,ItMi_Aquamarine,1);
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Farim_PaladinFisch);
};


instance DIA_Addon_Farim_Landstreicher(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Landstreicher_Condition;
	information = DIA_Addon_Farim_Landstreicher_Info;
	description = "M??e? mi ??ct n?co o chyb?j?c?ch lidech?";
};


func int DIA_Addon_Farim_Landstreicher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Landstreicher_15_01");	//M??e? mi ??ct n?co o chyb?j?c?ch lidech?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_02");	//M?j kamar?d Wiliam se zapletl s podez?el?mi lidmi. A co se mu stalo?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_03");	//Jednoho dne p?estal pracovat a od t? doby jsem o n?m nesly?el.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


instance DIA_Addon_Farim_William(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_William_Condition;
	information = DIA_Addon_Farim_William_Info;
	description = "Tv?j kamar?d William zmizel?";
};


func int DIA_Addon_Farim_William_Condition()
{
	if((SCKnowsFarimAsWilliamsFriend == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_15_00");	//Tv?j kamar?d William zmizel?
	AI_Output(self,other,"DIA_Addon_Farim_William_11_01");	//Asi jo. Mohl z n?ho b?t ryb??, ale to by na sob? musel pracovat, ale to on ne - je trochu n?ladov?.
	AI_Output(self,other,"DIA_Addon_Farim_William_11_02");	//Nikdy se nem?l zapl?st s t?mi chl?pky.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	Log_AddEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
	Info_ClearChoices(DIA_Addon_Farim_William);
	Info_AddChoice(DIA_Addon_Farim_William,"O kom p?esn? mluv???",DIA_Addon_Farim_William_typen);
	Info_AddChoice(DIA_Addon_Farim_William,"Jsem si jist?, ?e se znovu objev?.",DIA_Addon_Farim_William_auftauchen);
	Info_AddChoice(DIA_Addon_Farim_William,"Co s n?m bylo pak?",DIA_Addon_Farim_William_WasGemacht);
	Info_AddChoice(DIA_Addon_Farim_William,"Kdy jsi je vid?l naposled?",DIA_Addon_Farim_William_WannWeg);
};

func void DIA_Addon_Farim_William_WasGemacht()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WasGemacht_15_00");	//Co s n?m bylo pak?
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_01");	//William a ti hrdlo?ezov? se zapletli do n?jak? ?pinav? pr?ce.
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_02");	//Mysl?m, ?e ho to m?lo p?iv?st na jejich stranu.
};

func void DIA_Addon_Farim_William_typen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_typen_15_00");	//O kom p?esn? mluv???
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_01");	//Nev?m kdo jsou ani co d?laj? v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_02");	//V?m jen, kde se setkali s Wiliamem.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_03");	//Jen co jsem Wiliama poprv? vid?l, ?ekl jsem si, ?e je to rozen? ryb??.
	Info_AddChoice(DIA_Addon_Farim_William,"Kde se p?esn? setkali?",DIA_Addon_Farim_William_Wo);
};

func void DIA_Addon_Farim_William_Wo()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Wo_15_00");	//Kde se p?esn? setkali?
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_01");	//Na druh? stran? p??stavu na severu, je tam z?toka.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_02");	//D? se tam dostat jen lod? nabo plav?n?m.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_03");	//Je tam pl?? a mal? ryb??sk? t?bor. Tam jsem je vid?l.
	self.flags = 0;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Ryb?? Farim postr?d? sv?ho kamar?da Williama. Farim ??k?, ?e William se setk?val s n?jak?mi hrdlo?ezy v z?toce na severu p??stavu.");
	Info_AddChoice(DIA_Addon_Farim_William,"Mysl?m, ?e jsem sly?el dost.",DIA_Addon_Farim_William_Tschau);
};

func void DIA_Addon_Farim_William_WannWeg()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WannWeg_15_00");	//Kdy jsi je vid?l naposled?
	AI_Output(self,other,"DIA_Addon_Farim_William_WannWeg_11_01");	//P?ed n?kolika dny.
	Info_AddChoice(DIA_Addon_Farim_William,"Ne?el jenom n?kam d?l ryba?it?",DIA_Addon_Farim_William_Fischen);
};

func void DIA_Addon_Farim_William_Fischen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Fischen_15_00");	//Ne?el jenom n?kam d?l ryba?it?
	AI_Output(self,other,"DIA_Addon_Farim_William_Fischen_11_01");	//To ne. Jeho lo? z?stala v p??stavu.
};

func void DIA_Addon_Farim_William_auftauchen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_auftauchen_15_00");	//Jsem si jist?, ?e se znovu objev?.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_01");	//To si nemysl?m. U? je pry? p??li? dlouho.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_02");	//Boj?m se, ?e jednoho dne z mo?e vylov?m jeho mrtvolu.
};

func void DIA_Addon_Farim_William_Tschau()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Tschau_15_00");	//Mysl?m, ?e jsem sly?el dost.
	AI_Output(self,other,"DIA_Addon_Farim_William_Tschau_11_01");	//Ned?lej si s t?m starosti. Nemysl?m si, ?e bys ho na?el.
	Info_ClearChoices(DIA_Addon_Farim_William);
};


instance DIA_Addon_Farim_Perm(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 99;
	condition = DIA_Addon_Farim_Perm_Condition;
	information = DIA_Addon_Farim_Perm_Info;
	permanent = TRUE;
	description = "Tak?e, jak jdou obchody?";
};


func int DIA_Addon_Farim_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//Tak?e, jak jdou obchody?
	if(Farim_PissedOff == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_01");	//Ah. Ned?lej, ?e t? to zaj?m?.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_02");	//U? jsem za?il lep?? ?asy. P??li? m?lo pro ?ivot a p??li? mnoho pro smrt.
	};
};


instance DIA_Addon_Farim_WilliamReport(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 1;
	condition = DIA_Addon_Farim_WilliamReport_Condition;
	information = DIA_Addon_Farim_WilliamReport_Info;
	important = TRUE;
};


func int DIA_Addon_Farim_WilliamReport_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_William))
	{
		if((Npc_HasItems(other,ITWr_Addon_William_01) > 0) || (Saturas_AboutWilliam == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info()
{
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_01");	//Jsi zp?t!
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_02");	//Sly?el jsi n?co o Wiliamovi?
	AI_Output(other,self,"DIA_Addon_Farim_Add_15_02");	//Je mrtv?.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_03");	//(vzdychne) Ano, to jsem ?ekal.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_04");	//D?ky, ?e jsi mi to p?i?l ??ct.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_05");	//P?jdu do hospody a za jeho pod?l na posledn?m ?lovku se napiju - on by to tak cht?l ...
};

