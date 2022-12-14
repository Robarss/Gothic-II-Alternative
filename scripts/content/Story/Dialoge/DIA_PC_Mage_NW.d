
instance DIA_MiltenNW_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_EXIT_Condition;
	information = DIA_MiltenNW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP3_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP3_EXIT_Condition;
	information = DIA_MiltenNW_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP3_Hello(C_Info)
{
	npc = PC_Mage_NW;
	nr = 31;
	condition = DIA_MiltenNW_KAP3_Hello_Condition;
	information = DIA_MiltenNW_KAP3_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_MiltenNW_KAP3_Hello_Condition()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Hello_Info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_00");	//(nev???cn?) Nejde mi to na rozum. Opravdu jsi paladin?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_01");	//Evidentn?.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_02");	//(euforicky) Pokud je mezi paladiny n?kdo jako ty, m?li by se m?t Beliarovi poh?nci rad?i na pozoru.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_03");	//Jestli jsi porazil Sp??e, nem?lo by ti p?r sk?et? d?lat sebemen?? pot??e.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_04");	//Ve h?e nejsou jenom sk?eti.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_05");	//To v?m, ale i tak je dobr? t? m?t na sv? stran?.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//No dobr?.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_07");	//Co d?l?? tady v kl??te?e? Nech m? h?dat. Chce? se u?it um?n? magie.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_08");	//Mo?n?.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_09");	//V?d?l jsem to - b?? si promluvit s Mardukem, on je zodpov?dn? za v?s paladiny. Najde? ho p?ed kapl?.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_10");	//Vid?m, ?e ty ?e?i m?ly pravdu.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_11");	//Jak? ?e?i?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_12");	//?e ses spol?il s t?mi drakobijci.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_13");	//No, nikdy jsi nebyl dobr? materi?l pro c?rkev. A? je to ale jak chce, bojuje? za na?i v?c a to je to, co se po??t?.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//Je to v?e?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_15");	//M?m samoz?ejm? radost, a vypad?? tak, ?e se t? mus? ka?d? sk?et hned leknout.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_16");	//Ve h?e nejsou jenom sk?eti.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_17");	//To v?m, ale i tak s nimi jsou probl?my. Jsi velmi d?le?it?.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_18");	//Porazil jsi Sp??e. Mo?n? jednoho dne budeme v?ichni pot?ebovat pomoc.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_19");	//No dobr?.
	};
};


instance DIA_MiltenNW_Monastery(C_Info)
{
	npc = PC_Mage_NW;
	nr = 35;
	condition = DIA_MiltenNW_Monastery_Condition;
	information = DIA_MiltenNW_Monastery_Info;
	permanent = FALSE;
	description = "Jak ses dostal do kl??tera tak rychle?";
};


func int DIA_MiltenNW_Monastery_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Monastery_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Monastery_15_00");	//Jak ses dostal do kl??tera tak rychle?
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_01");	//Co je to za ot?zku? Propl??il jsem se pr?smykem a nam??il si to rovnou do kl??tera.
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_02");	//P?izn?v?m, ?e nebylo v?dycky snadn? proklouznout mezi t?mi v?emi p???erami, kter? se zabydluj? na t?hle stran? ?dol?, ale p?ece jenom jsem m?l m?? probl?m?, ne? jsem ?ekal.
};


instance DIA_MiltenNW_FourFriends(C_Info)
{
	npc = PC_Mage_NW;
	nr = 35;
	condition = DIA_MiltenNW_FourFriends_Condition;
	information = DIA_MiltenNW_FourFriends_Info;
	permanent = FALSE;
	description = "V??, kde jsou ostatn??";
};


func int DIA_MiltenNW_FourFriends_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_FourFriends_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_00");	//V??, kde jsou ostatn??
	if(Npc_IsDead(PC_Fighter_NW_vor_DJG) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//Zd? se, ?e Gorn se vypo??dal s pobytem v Garondov? v?zen? docela dob?e.
		if(MIS_RescueGorn != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_02");	//Jak se dostal ven?
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_03");	//Musel jsem Garondovi trochu zalhat, abych ho p?esv?d?il, ?e m? obvin?n? st?hnout.
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_04");	//Ale bude to jen mezi n?mi, rozum?no?
		};
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_05");	//Ka?dop?dn? cht?l j?t za Leem a pod?vat se, co se d?je na farm?.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_06");	//Po tom blivajzu, co dost?val ve v?zen?, se ur?it? cpe ze v?ech sil. To bude pro z?soby ?oldn??? t??k? zkou?ka.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_07");	//Gorn to nep?e?il.
	};
	if(Npc_IsDead(PC_Thief_NW) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_08");	//Diego mumlal n?co o z??tov?n?. Netu??m, co m?l na mysli.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_09");	//Ale ?ekl bych, ?e je ve m?st?. Zn?? ho - v?dycky se n?co najde.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_10");	//Diego to koupil - zd? se, ?e ho bari?ra p?ece jenom dostala.
	};
};


instance DIA_MiltenNW_KAP3_Entry(C_Info)
{
	npc = PC_Mage_NW;
	nr = 32;
	condition = DIA_MiltenNW_KAP3_Entry_Condition;
	information = DIA_MiltenNW_KAP3_Entry_Info;
	permanent = TRUE;
	description = "Pot?ebuji se dostat do kl??tera. Je to d?le?it?!";
};


func int DIA_MiltenNW_KAP3_Entry_Condition()
{
	if((Kapitel == 3) && (hero.guild != GIL_KDF) && (MiltenNW_GivesMonasteryKey == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Entry_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_15_00");	//Pot?ebuji se dostat do kl??tera. Je to d?le?it?!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_01");	//Ano, jist?. Tady je kl??.
		CreateInvItems(self,ItKe_Innos_MIS,1);
		B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
		MiltenNW_GivesMonasteryKey = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_02");	//Nem??u t? do kl??tera vpustit. M?l bych probl?my p?ed Nejvy??? radou.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_03");	//Bez povolen? m?ch nad??zen?ch nesm?m do kl??tera nikoho vpou?t?t.
		Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry,Dialog_Back,DIA_MiltenNW_KAP3_Entry_BACK);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry,"Je to d?le?it?!",DIA_MiltenNW_KAP3_Entry_Important);
		if(Npc_HasItems(other,ItWr_PermissionToWearInnosEye_MIS) >= 1)
		{
			Info_AddChoice(DIA_MiltenNW_KAP3_Entry,"P?in???m dopis od lorda Hagena.",DIA_MiltenNW_KAP3_Entry_Permit);
		};
	};
};

func void DIA_MiltenNW_KAP3_Entry_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Important()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Important_15_00");	//Je to d?le?it?!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01");	//To nep?jde. Pyrokar by mi utrhl hlavu.
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Permit()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Permit_15_00");	//P?in???m dopis od lorda Hagena.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01");	//Uka? mi ho.
	B_GiveInvItems(other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02");	//(v?hav?) Dobr?. Tady je kl?? od kl??tera. Pyrokar je v kostele.
	CreateInvItems(self,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	MiltenNW_GivesMonasteryKey = TRUE;
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};


instance DIA_MiltenNW_KAP3_NovizenChase(C_Info)
{
	npc = PC_Mage_NW;
	nr = 31;
	condition = DIA_MiltenNW_KAP3_NovizenChase_Condition;
	information = DIA_MiltenNW_KAP3_NovizenChase_Info;
	permanent = FALSE;
	description = "Nev??, kde je Pedro?";
};


func int DIA_MiltenNW_KAP3_NovizenChase_Condition()
{
	if((Kapitel == 3) && (MIS_NovizenChase == LOG_Running) && (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_NovizenChase_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_NovizenChase_15_00");	//Nev??, kde je Pedro?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01");	//Mysl??, ?e bych tady jen tak st?l, kdybych v?d?l, kde se ten odpadl?k schov?v??
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02");	//Mus? zaplatit za sv? ?iny. Douf?m, ?e se n?m poda?? dostat Oko zp?tky.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03");	//Mus?? n?m pomoci. Najdi ho a p?ines zp?t Innosovo oko.
};


instance DIA_MiltenNW_KAP3_Perm(C_Info)
{
	npc = PC_Mage_NW;
	nr = 39;
	condition = DIA_MiltenNW_KAP3_Perm_Condition;
	information = DIA_MiltenNW_KAP3_Perm_Info;
	permanent = FALSE;
	description = "Nev?? n?co o t?ch postav?ch v k?p?ch?";
};


func int DIA_MiltenNW_KAP3_Perm_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Perm_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Perm_15_00");	//Nev?? n?co o t?ch postav?ch v k?p?ch?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_01");	//Ne, ale nem?m z t?ch chlap?k? dobr? pocit.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_02");	//Pokud na n? naraz??, bu? opatrn?.
};


instance DIA_MiltenNW_KAP4_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP4_EXIT_Condition;
	information = DIA_MiltenNW_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP4_PERM(C_Info)
{
	npc = PC_Mage_NW;
	nr = 49;
	condition = DIA_MiltenNW_KAP4_PERM_Condition;
	information = DIA_MiltenNW_KAP4_PERM_Info;
	permanent = TRUE;
	description = "Co je nov?ho?";
};


func int DIA_MiltenNW_KAP4_PERM_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP4_PERM_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_00");	//Co je nov?ho?
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_01");	//Na to bych se m?l zeptat j?. M?me tady dost starost?.
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_02");	//Nejvy??? rada se sna?? zjistit, co nep??tel ud?l? p???t?.
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_03");	//N?co dal??ho?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_04");	//V posledn? dob? jsou ?toky sk?et? ?ast?j??, dokonce i mimo Hornick? ?dol?.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_05");	//V?bec se mi to nechce l?bit - mysl?m, ?e u? nem?me moc ?asu.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_06");	//Jeden farm?? ??kal, ?e pobl?? jeho farmy se objevila n?jak? ?upinat? stvo?en?.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_07");	//Nev?m, jak? to d?v? dohromady smysl, ale m?m pocit, ?e nep??tel n?co chyst?.
	}
	else if(MIS_FindTheObesessed == LOG_Running)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_08");	//Dost?v?me ??m d?l t?m v?c zpr?v o posedl?ch lidech. Nep??tel je siln?, siln?j??, ne? jsme ?ekali.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_09");	//Ne, situace je st?le v??n?. Jedin? co m??eme d?lat, je v??it v Innose.
	};
};


instance DIA_MiltenNW_KAP5_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP5_EXIT_Condition;
	information = DIA_MiltenNW_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_AllDragonsDead(C_Info)
{
	npc = PC_Mage_NW;
	nr = 900;
	condition = DIA_MiltenNW_AllDragonsDead_Condition;
	information = DIA_MiltenNW_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Pobil jsem v?echny draky.";
};


func int DIA_MiltenNW_AllDragonsDead_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_00");	//Pobil jsem v?echny draky.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_01");	//V??n?? Tak?e nad?je p?ece jenom je?t? ?ije. Te? u? zb?v? jen useknout Zlu hlavu.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_02");	//Pokud jsi to v??n? dok?zal, mohli bychom v?lku vyhr?t.
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_03");	//Kdo, j??
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_04");	//Samoz?ejm?, ?e ty. Kdo jin??
	if(MiltenNW_IsOnBoard == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_05");	//M?li bychom brzy vyrazit, d??v ne? bude pozd?.
	};
};


instance DIA_MiltenNW_SCWasInLib(C_Info)
{
	npc = PC_Mage_NW;
	nr = 3;
	condition = DIA_MiltenNW_SCWasInLib_Condition;
	information = DIA_MiltenNW_SCWasInLib_Info;
	important = TRUE;
};


func int DIA_MiltenNW_SCWasInLib_Condition()
{
	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_SCWasInLib_Info()
{
	AI_Output(self,other,"DIA_MiltenNW_SCWasInLib_03_00");	//Hej, sly?el jsem, ?e jsi str?vil dlouh? ?as v kl??tern?ch sklepech. Co jsi zjistil?
};


instance DIA_MiltenNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_KnowWhereEnemy_Condition;
	information = DIA_MiltenNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "V?m, kde se nep??tel ukr?v?. Je to mal? ostr?vek nedaleko odsud.";
};


func int DIA_MiltenNW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (MiltenNW_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};


var int SCToldMiltenHeKnowWhereEnemy;

func void DIA_MiltenNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_00");	//V?m, kde se nep??tel ukr?v?. Je to mal? ostr?vek nedaleko odsud.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_01");	//To je na?e velk? ?ance. Mus?me okam?it? vyrazit a zni?it zlo jednou prov?dy.
	SCToldMiltenHeKnowWhereEnemy = TRUE;
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	if(Npc_IsDead(DiegoNW) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_02");	//Mluvil jsi o tom s Diegem? Mysl?m, ?e by cht?l jet s tebou.
		B_LogEntry(Topic_Crew,"Diego mi m??e velmi pomoci - nikdy dlouho nepobyl na jednom m?st?.");
	};
	if(Npc_IsDead(GornNW_nach_DJG) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_03");	//A co Gorn? Promluv si s n?m. Sly?el jsem, ?e se vr?til z Hornick?ho ?dol?.
		B_LogEntry(Topic_Crew,"Gorn by mi jist? byl tak? zdatn?m pomocn?kem. Nikdy neu?kod?, m??-li po boku zdatn?ho bojovn?ka. Snad by m? mohl trochu vycvi?it.");
	};
	if(Npc_IsDead(Lester) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_04");	//A nezapome? na Lestera. Pokud ho nevyt?hne? z toho jeho ?dol?, tak tam shnije.
		B_LogEntry(Topic_Crew,"Jestli Lestera nevezmu s sebou, nejsp?? se z tohoto ?dol? nikdy nedostane.");
	};
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_05");	//Zn?m tak? svou vlastn? roli, kterou bych m?l hr?t. A? budeme ?elit nep??teli, m??u ti pos?lit magickou energii a pom?hat ti p?i vytv??en? run. Kdy za?neme?
	B_LogEntry(Topic_Crew,"P?jde-li Milten se mnou, m??e m? nau?it, jak vyr?b?t runy a zv??it si z?soby many.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_06");	//Ne tak rychle, u? m?m dost lid?.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_07");	//V??, ?e bych s tebou ?el. Pokud si to rozmysl??, budu tady na tebe ?ekat.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_08");	//Hodn? ?t?st?, a a? nad tebou Innos dr?? ochrannou ruku.
	}
	else
	{
		Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy,"V tuhle chv?li pro tebe nem?m vyu?it?.",DIA_MiltenNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy,"V?tej na palub?!",DIA_MiltenNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_MiltenNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00");	//V?tej na palub?!
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01");	//Setk?me se v p??stavu. Po?kej tam na m?.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02");	//Dobr?. Budu tam, a? bude? p?ipraven.
	self.flags = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard = LOG_SUCCESS;
	B_GivePlayerXP(XP_Crewmember_Success);
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
};

func void DIA_MiltenNW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_No_15_00");	//V tuhle chv?li pro tebe nem?m vyu?it?.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01");	//V??, ?e bych to s tebou t?hl a? do konce. Pokud si to rozmysl??, budu tady na tebe ?ekat.
	MiltenNW_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
};


instance DIA_MiltenNW_WhereCaptain(C_Info)
{
	npc = PC_Mage_NW;
	nr = 3;
	condition = DIA_MiltenNW_WhereCaptain_Condition;
	information = DIA_MiltenNW_WhereCaptain_Info;
	description = "Kde bych m?l hledat kapit?na?";
};


func int DIA_MiltenNW_WhereCaptain_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (SCToldMiltenHeKnowWhereEnemy == TRUE) && (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_WhereCaptain_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_WhereCaptain_15_00");	//Kde bych m?l hledat kapit?na?
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_01");	//Zeptej se Jorgena. Je to konec konc? n?mo?n?k. M?l by b?t je?t? po??d v kl??te?e.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_02");	//Ale jestli ti nebude schopen pomoci, bude? muset hledat n?koho, kdo by ti ??dil lo?, na farm?ch nebo ve m?st?.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_03");	//Nejlep?? asi bude promluvit si s Leem nebo j?t do p??stavu v Khorinisu. Nic lep??ho m? te? nenapad?.
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain,"Snad by se mi mohlo poda?it najmout kapit?na - Jorgena. M?l by se je?t? zdr?ovat v kl??te?e. Krom? n?ho bych m?l na statc?ch ?i ve m?st? natrefit i na jin? kandid?ty na tuto funkci. Snad bych si mohl promluvit s Leem nebo se poptat po p??stavu.");
};


instance DIA_MiltenNW_LeaveMyShip(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_LeaveMyShip_Condition;
	information = DIA_MiltenNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Nakonec t? p?ece jenom nem??u vz?t s sebou.";
};


func int DIA_MiltenNW_LeaveMyShip_Condition()
{
	if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_LeaveMyShip_15_00");	//Nakonec t? p?ece jenom nem??u vz?t s sebou.
	AI_Output(self,other,"DIA_MiltenNW_LeaveMyShip_03_01");	//S?m mus?? nejl?p v?d?t, koho bude? pot?ebovat. Pokud si to rozmysl??, budu na tebe ?ekat v kl??te?e.
	MiltenNW_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MiltenNW_StillNeedYou(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_StillNeedYou_Condition;
	information = DIA_MiltenNW_StillNeedYou_Info;
	permanent = TRUE;
	description = "Pot?ebuji t?.";
};


func int DIA_MiltenNW_StillNeedYou_Condition()
{
	if(((MiltenNW_IsOnBoard == LOG_OBSOLETE) || (MiltenNW_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_StillNeedYou_15_00");	//Pot?ebuji t?.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_01");	//Bude mi ct?. Poj?me, nem?me ?asu nazbyt.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_02");	//Jdu do p??stavu. Potk?me se tam.
	self.flags = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_Teach(C_Info)
{
	npc = PC_Mage_NW;
	nr = 90;
	condition = DIA_MiltenNW_Teach_Condition;
	information = DIA_MiltenNW_Teach_Info;
	permanent = TRUE;
	description = "Chci se nau?it n?jak? nov? kouzla.";
};


func int DIA_MiltenNW_Teach_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Teach_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Teach_15_00");	//Chci se nau?it n?jak? nov? kouzla.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(DIA_MiltenNW_Teach);
		Info_AddChoice(DIA_MiltenNW_Teach,Dialog_Back,DIA_MiltenNW_Teach_BACK);
		if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),DIA_MiltenNW_Teach_Windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_MiltenNW_Teach_Feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),DIA_MiltenNW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_Teach_03_01");	//Je?t? jsi nepostoupil do druh?ho Magick?ho kruhu. Nen? nic, co bych t? mohl nau?it.
	};
};

func void DIA_MiltenNW_Teach_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_Teach);
};

func void DIA_MiltenNW_Teach_Windfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void DIA_MiltenNW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_MiltenNW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};


instance DIA_MiltenNW_Mana(C_Info)
{
	npc = PC_Mage_NW;
	nr = 100;
	condition = DIA_MiltenNW_Mana_Condition;
	information = DIA_MiltenNW_Mana_Info;
	permanent = TRUE;
	description = "Cht?l bych pos?lit svoji magickou moc.";
};


func int DIA_MiltenNW_Mana_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Mana_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Mana_15_00");	//Cht?l bych pos?lit svoji magickou moc.
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};

func void DIA_MiltenNW_Mana_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenNW_Mana_03_00");	//Tvoje magick? s?ly jsou velk?. Moc velk? na to, abych ti je pomohl je?t? zv??it.
	};
	Info_ClearChoices(DIA_MiltenNW_Mana);
};

func void DIA_MiltenNW_Mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};

func void DIA_MiltenNW_Mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};


instance DIA_Mage_NW_PICKPOCKET(C_Info)
{
	npc = PC_Mage_NW;
	nr = 900;
	condition = DIA_Mage_NW_PICKPOCKET_Condition;
	information = DIA_Mage_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Mage_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(56,75);
};

func void DIA_Mage_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
	Info_AddChoice(DIA_Mage_NW_PICKPOCKET,Dialog_Back,DIA_Mage_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mage_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mage_NW_PICKPOCKET_DoIt);
};

func void DIA_Mage_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
};

func void DIA_Mage_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
};

