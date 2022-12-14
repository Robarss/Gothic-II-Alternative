
instance DIA_Dar_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_EXIT_Condition;
	information = DIA_Dar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Dar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_Hallo(C_Info)
{
	npc = Sld_810_Dar;
	nr = 1;
	condition = DIA_Dar_Hallo_Condition;
	information = DIA_Dar_Hallo_Info;
	permanent = FALSE;
	description = "Co to tu kou????";
};


func int DIA_Dar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Dar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Dar_Hallo_15_00");	//Co to tu kou????
	AI_Output(self,other,"DIA_Dar_Hallo_03_01");	//Chce? ?luka?
	Info_ClearChoices(DIA_Dar_Hallo);
	Info_AddChoice(DIA_Dar_Hallo,"Ne.",DIA_Dar_Hallo_Nein);
	Info_AddChoice(DIA_Dar_Hallo,"Jasn?.",DIA_Dar_Hallo_Ja);
};

func void DIA_Dar_Hallo_Ja()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_00");	//Jasn?.
	CreateInvItem(other,ItMi_Joint);
	B_UseItem(other,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_01");	//Nen? ?patn?, co?
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_02");	//Kde jsi tenhle matro? sehnal?
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_03");	//(k?en? se) M?m sv? zdroje.
	Info_ClearChoices(DIA_Dar_Hallo);
};

func void DIA_Dar_Hallo_Nein()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Nein_15_00");	//Ne.
	Info_ClearChoices(DIA_Dar_Hallo);
};


var int Dar_einmal;

instance DIA_Dar_PERM(C_Info)
{
	npc = Sld_810_Dar;
	nr = 2;
	condition = DIA_Dar_PERM_Condition;
	information = DIA_Dar_PERM_Info;
	permanent = TRUE;
	description = "D?l?? taky krom? hulen? n?co jin?ho?";
};


func int DIA_Dar_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Dar_PERM_Info()
{
	AI_Output(other,self,"DIA_Dar_PERM_15_00");	//D?l?? taky krom? hulen? n?co jin?ho?
	if((Dar_LostAgainstCipher == TRUE) && (Dar_einmal == FALSE))
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_01");	//(sarkasticky) N?kdy se nech?m zml?tit od n?kolika pomstychtiv?ch fe??k? kv?li t?hle tr?v?...
		Dar_einmal = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_02");	//V tuhle chv?li ne.
	};
};


instance DIA_Dar_WannaJoin(C_Info)
{
	npc = Sld_810_Dar;
	nr = 3;
	condition = DIA_Dar_WannaJoin_Condition;
	information = DIA_Dar_WannaJoin_Info;
	permanent = FALSE;
	description = "Chci se p?idat k ?old?k?m. Bude ti to vadit?";
};


func int DIA_Dar_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_Hallo) && (other.guild == GIL_NONE) && (Dar_LostAgainstCipher == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dar_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Dar_WannaJoin_15_00");	//Chci se p?idat k ?old?k?m. Bude ti to vadit?
	AI_Output(self,other,"DIA_Dar_WannaJoin_03_01");	//Je mi to jedno.
};


instance DIA_Dar_DuDieb(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_DuDieb_Condition;
	information = DIA_Dar_DuDieb_Info;
	permanent = FALSE;
	description = "Cipher mi ?ekl, ?e mu n?kdo ukradnul jeho bal??ek tr?vy.";
};


func int DIA_Dar_DuDieb_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat) && (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dar_DuDieb_Info()
{
	AI_Output(other,self,"DIA_Dar_DuDieb_15_00");	//Cipher mi ?ekl, ?e mu n?kdo ukradnul jeho bal??ek tr?vy.
	AI_Output(self,other,"DIA_Dar_DuDieb_03_01");	//(debiln? a tlumen? se sm?je)
	AI_Output(other,self,"DIA_Dar_DuDieb_15_02");	//Nev?? o tom n?co?
	AI_Output(self,other,"DIA_Dar_DuDieb_03_03");	//(velmi kr?tce) Ne.
	Dar_Verdacht = TRUE;
};


instance DIA_Dar_WoPaket(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_WoPaket_Condition;
	information = DIA_Dar_WoPaket_Info;
	permanent = TRUE;
	description = "Kde je ten bal??ek?";
};


func int DIA_Dar_WoPaket_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_DuDieb) && (Dar_Dieb == FALSE) && (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dar_WoPaket_Info()
{
	AI_Output(other,self,"DIA_Dar_WoPaket_15_00");	//(v?hr??n?) Kde je ten bal??ek?
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_01");	//Dob?e, dob?e, dob?e. Prodal jsem ho n?jak?mu pobudovi ve m?st?.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_02");	//Bylo to v p??stavu. Nem??u si vzpomenout, jak vypadal.
		AI_Output(other,self,"DIA_Dar_WoPaket_15_03");	//Vypad? to, ?e pot?ebuje? dal?? v?prask?
		AI_Output(self,other,"DIA_Dar_WoPaket_03_04");	//Up??mn?, chlape, byl jsem tot?ln? zfetovanej. Nem?m nejmen?? pon?t? jak ten chl?pek vypadal.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_05");	//Bylo to v p??stavu bl?zko stavitel? lod?. To je v?echno, na co si vzpom?n?m.
		Dar_Dieb = TRUE;
		B_LogEntry(Topic_CipherPaket,"Dar se p?iznal, ?e bal?k s tr?vou ukradl on. Prodal jej v khorinissk? p??stavn? ?tvrti, hned vedle lo?a?ovy d?lny.");
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_06");	//Co j? v?m?
	};
};


instance DIA_Dar_AufsMaul(C_Info)
{
	npc = Sld_810_Dar;
	nr = 5;
	condition = DIA_Dar_AufsMaul_Condition;
	information = DIA_Dar_AufsMaul_Info;
	permanent = FALSE;
	description = "J? to z tebe vyml?t?m!";
};


func int DIA_Dar_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_DuDieb) && (Dar_Dieb == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST))
	{
		return TRUE;
	};
};

func void DIA_Dar_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Dar_AufsMaul_15_00");	//J? to z tebe vyml?t?m!
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_01");	//Kl?dek. Jsem moc zhulenej na to, abych s tebou bojoval!
	B_GiveInvItems(self,other,ItMi_Joint,1);
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_02");	//Na, dej si nejd??v velk?ho ?luka!
};


instance DIA_Dar_Kameradenschwein(C_Info)
{
	npc = Sld_810_Dar;
	nr = 1;
	condition = DIA_Dar_Kameradenschwein_Condition;
	information = DIA_Dar_Kameradenschwein_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dar_Kameradenschwein_Condition()
{
	if(Dar_LostAgainstCipher == TRUE)
	{
		self.aivar[AIV_LastFightComment] = FALSE;
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dar_Kameradenschwein_Info()
{
	AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_00");	//Kecale! ?ekl jsi Cipherovi, ?e jsem mu vzal jeho tr?vu!
	if(Npc_KnowsInfo(other,DIA_Dar_WannaJoin) && (other.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_01");	//Nebudu pro tebe hlasovat.
	};
};


instance DIA_Dar_Pilztabak(C_Info)
{
	npc = Sld_810_Dar;
	nr = 6;
	condition = DIA_Dar_Pilztabak_Condition;
	information = DIA_Dar_Pilztabak_Info;
	permanent = FALSE;
	description = "U? jsi n?kdy balil tab?k?";
};


func int DIA_Dar_Pilztabak_Condition()
{
	if(Npc_HasItems(other,ItMi_PilzTabak) > 0)
	{
		return TRUE;
	};
};

func void DIA_Dar_Pilztabak_Info()
{
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_00");	//U? jsi n?kdy balil tab?k?
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_01");	//To zn? zaj?mav?. Dej to sem.
	B_GiveInvItems(other,self,ItMi_PilzTabak,1);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_02");	//Jasn?, jdeme na to.
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_03");	//U? jsi n?kdy kou?il takovejhle materi?lek?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_04");	//No...
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_05");	//Kou?il, nebo nekou?il?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_06");	//N?jak jsem se k tomu nedostal...
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_07");	//Kurva!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_08");	//Svat? Rhobare!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_09");	//Tenhle matro? je dost krutej! V?bec to nezkou?ej!
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Dar_KAP3_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP3_EXIT_Condition;
	information = DIA_Dar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_KAP4_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP4_EXIT_Condition;
	information = DIA_Dar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_ORCRING(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_ORCRING_Condition;
	information = DIA_Dar_ORCRING_Info;
	description = "Vypad? to, ?e tu chyb? n?jac? ?old?ci.";
};


func int DIA_Dar_ORCRING_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Dar_ORCRING_Info()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_15_00");	//Vypad? to, ?e tu chyb? n?jac? ?old?ci.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_01");	//Jist?. To je pravda. Sylvio je na m?le daleko a vzal p?lku pos?dky s sebou.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_02");	//To je jedno. M?m alespo? lep?? ?anci st?t se jedn?m z Leeov?ch chlapc?. V?echno, co pot?ebuju, je se porvat.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_03");	//Kdybych mohl dok?zat, ?e jsem skute?n? ostrej chl?pek, mo?n? bych se dokonce mohl st?t jedn?m z Leeov?ch t?lesn?ch str??c?.
	Info_ClearChoices(DIA_Dar_ORCRING);
	Info_AddChoice(DIA_Dar_ORCRING,"To m? neznepokojuje.",DIA_Dar_ORCRING_no);
	Info_AddChoice(DIA_Dar_ORCRING,"Ostrej chl?pek? Ty?",DIA_Dar_ORCRING_necken);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice(DIA_Dar_ORCRING,"Co by to m?lo b?t?",DIA_Dar_ORCRING_wie);
	};
};

func void DIA_Dar_ORCRING_necken()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_15_00");	//Ostrej chl?pek? Ty?
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_01");	//(na?tvan?) Oj, ale no tak, sklapni. Kdopak jsi ve skute?nosti?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_02");	//N?jakej nafoukanej trouba z m?sta. Vy chc?p?ci nem?te nic, co byste mohli nab?dnout.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_03");	//Jsi tu jenom p?r dn? a u? m?? takov?hle kecy.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_04");	//Koho si mysl??, ?e t?ma svejma blbejma magick?ma kecama vystra???? M? teda rozhodn? ne.
	};
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_05");	//Kdy? o tom tak p?em??l?m, rozbit? tvoj? lebky je p?esn? to, ??m bych si mohl u Leeov?m chlapc? vyslou?it ten spr?vn? respekt.
		Info_ClearChoices(DIA_Dar_ORCRING);
		Info_AddChoice(DIA_Dar_ORCRING,"INem?m ?as na tyhle kecy.",DIA_Dar_ORCRING_necken_no);
		Info_AddChoice(DIA_Dar_ORCRING,"OK. Tak to zkus.",DIA_Dar_ORCRING_necken_schlagen);
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_06");	//Tak po?kej. Najdu si zp?sob, jak ud?lat na Leeho dojem.
	};
};


var int Dar_FightAgainstPaladin;

func void DIA_Dar_ORCRING_necken_schlagen()
{
	Dar_FightAgainstPaladin = TRUE;
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_schlagen_15_00");	//Fajn. Tak to zkus.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_schlagen_03_01");	//Ooch, nem??u ?ekat.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Dar_ORCRING_necken_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_no_15_00");	//Nem?m ?as na tyhle kecy.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_no_03_01");	//Jo, jasn?. Zapomn?l jsem, ryt?? spravedlnosti bez b?zn? a hany. To je zl?. Myslel jsem, ?e m?? v?c kur??e.
	AI_StopProcessInfos(self);
};

func void DIA_Dar_ORCRING_wie()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_wie_15_00");	//Co by to m?lo b?t?
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_01");	//Nev?m p?esn?. N?jak? sk?et? trofej by nebyla k zahozen?.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_02");	//T?eba odznak od v?dce sk?et? nebo n?co takov?ho. Prapor, prsten, nebo tak n?co.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_03");	//S ni??m men??m tady prorazit nejde. To je z?ejm?.
	Log_CreateTopic(TOPIC_Dar_BringOrcEliteRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Dar_BringOrcEliteRing,LOG_Running);
	B_LogEntry(TOPIC_Dar_BringOrcEliteRing,"Dar se chce st?t pohlav?rem ?oldn???, a k tomu pot?ebuje n?jakou sk?et? trofej. Praporec, n?ramen?k, prsten nebo n?co takov?ho.");
	MIS_Dar_BringOrcEliteRing = LOG_Running;
	Info_ClearChoices(DIA_Dar_ORCRING);
};

func void DIA_Dar_ORCRING_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_no_15_00");	//To m? neznepokojuje.
	AI_Output(self,other,"DIA_Dar_ORCRING_no_03_01");	//(na?tvan?) Samoz?ejm?, ?e ne. To by m? ohromilo.
	Info_ClearChoices(DIA_Dar_ORCRING);
};


instance DIA_Dar_FIGHTAGAINSTPALOVER(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_FIGHTAGAINSTPALOVER_Condition;
	information = DIA_Dar_FIGHTAGAINSTPALOVER_Info;
	important = TRUE;
};


func int DIA_Dar_FIGHTAGAINSTPALOVER_Condition()
{
	if((Dar_FightAgainstPaladin == TRUE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Dar_FIGHTAGAINSTPALOVER_Info()
{
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_00");	//Jasn?, v?m, ?e Lee nebude ?pln? nad?enej, kdy? se v tom s tebou budu zase anga?ovat.
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_01");	//Nechci si tu nikoho znep??telit, tak na ten nesmysl prost? zapome?me, jo?
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Dar_BRINGORCELITERING(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_BRINGORCELITERING_Condition;
	information = DIA_Dar_BRINGORCELITERING_Info;
	description = "M?m tu sk?et? trofej, jak jsi cht?l.";
};


func int DIA_Dar_BRINGORCELITERING_Condition()
{
	if((MIS_Dar_BringOrcEliteRing == LOG_Running) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && Npc_HasItems(other,ItRi_OrcEliteRing))
	{
		return TRUE;
	};
};

func void DIA_Dar_BRINGORCELITERING_Info()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_00");	//M?m tu sk?et? trofej, jak jsi cht?l.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_01");	//Cos mi to p?inesl?
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_02");	//Prsten sk?et?ho vojev?dce.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_03");	//F?ha, no kdy? je to tak... Co za to chce??
	MIS_Dar_BringOrcEliteRing = LOG_SUCCESS;
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Co mi m??e? nab?dnout?",DIA_Dar_BRINGORCELITERING_was);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Dej mi n?jak? zlato.",DIA_Dar_BRINGORCELITERING_geld);
	};
};

func void DIA_Dar_BRINGORCELITERING_geld()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_00");	//Dej mi n?jak? zlato.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_01");	//T?eba 600 zla??k??
		AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_02");	//Kolik ?e?
	};
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_03");	//No dob?e, d?m ti za to 1200 zla??k?.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_04");	//Bu? ber, nebo si ten prsten nech.
	};
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"To nesta??.",DIA_Dar_BRINGORCELITERING_geld_no);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Dojedn?no - tady je.",DIA_Dar_BRINGORCELITERING_geld_ok);
};

func void DIA_Dar_BRINGORCELITERING_geld_ok()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_ok_15_00");	//Dojedn?no - tady je.
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_ok_03_01");	//D?ky, u? se nem??u do?kat, co na to ?eknou ostatn?.
	CreateInvItems(self,ItMi_Gold,1200);
	B_GiveInvItems(self,other,ItMi_Gold,1200);
	B_GivePlayerXP(XP_Dar_BringOrcEliteRing);
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_geld_no()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_no_15_00");	//To nesta??.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_no_03_01");	//A j? zase mysl?m, ?e je to n?jak moc. Bez ur??ky, tahle z?le?itost se mi zd? n?jak podez?el?.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_was()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_15_00");	//Co mi m??e? nab?dnout?
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_01");	//Bu? si vezmi pen?ze, nebo tenhle amulet, kter? jsem... no, ?ekn?me ?e jsem jej p?ed ?asem n?jak z?skal.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_02");	//Zvy?uje obratnost, s?m jsem to vyzkou?el.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Dej mi n?jak? zlato.",DIA_Dar_BRINGORCELITERING_geld);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Dej mi ten amulet.",DIA_Dar_BRINGORCELITERING_was_am);
};

func void DIA_Dar_BRINGORCELITERING_was_am()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_am_15_00");	//Dej mi ten amulet.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_01");	//Jas?a?ka, jen si ho u?ij. A te? naval ten prsten.
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	CreateInvItems(self,ItAm_Dex_01,1);
	B_GiveInvItems(self,other,ItAm_Dex_01,1);
	B_GivePlayerXP(XP_Dar_BringOrcEliteRing);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_02");	//T??ilo m?.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};


instance DIA_Dar_KAP5_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP5_EXIT_Condition;
	information = DIA_Dar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_KAP6_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP6_EXIT_Condition;
	information = DIA_Dar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_PICKPOCKET(C_Info)
{
	npc = Sld_810_Dar;
	nr = 900;
	condition = DIA_Dar_PICKPOCKET_Condition;
	information = DIA_Dar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Dar_PICKPOCKET_Condition()
{
	return C_Beklauen(67,35);
};

func void DIA_Dar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
	Info_AddChoice(DIA_Dar_PICKPOCKET,Dialog_Back,DIA_Dar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dar_PICKPOCKET_DoIt);
};

func void DIA_Dar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
};

func void DIA_Dar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
};

