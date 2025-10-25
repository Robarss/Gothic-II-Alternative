
instance DIA_Igaranz_Kap1_EXIT(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 999;
	condition = DIA_Igaraz_Kap1_EXIT_Condition;
	information = DIA_Igaraz_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Igaraz_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Igaranz_Hello(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Hello_Condition;
	information = DIA_Igaraz_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Igaraz_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Hello_Info()
{
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_00");	//Co pro tebe mohu udělat, bratře?
	}
	else
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_01");	//Co pro tebe můžu udělat?
	};
};


instance DIA_Igaraz_Wurst(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Wurst_Condition;
	information = DIA_Igaraz_Wurst_Info;
	permanent = FALSE;
	description = "Nemám čas, musím rozdělovat klobásy.";
};


func int DIA_Igaraz_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Igaraz_Wurst_15_00");	//Nemám čas, musím rozdělovat klobásy.
	AI_Output(self,other,"DIA_Igaraz_Wurst_13_01");	//Takže pracuješ pro Goraxe, co? Tak fajn, dej mi tu klobásu.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
};


instance DIA_Igaranz_NotWork(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 3;
	condition = DIA_Igaraz_NotWork_Condition;
	information = DIA_Igaraz_NotWork_Info;
	permanent = FALSE;
	description = "Proč nepracuješ?";
};


func int DIA_Igaraz_NotWork_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_NotWork_Info()
{
	AI_Output(other,self,"DIA_Igaranz_NotWork_15_00");	//Proč nepracuješ?
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_01");	//Mám dovoleno studovat Innosovy lekce. Hledám moudrost v jeho slovech.
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_02");	//Jednoho dne si mě vyvolí - a pak projdu zkouškou magie a vstoupím do Kruhu ohně.
};


instance DIA_Igaranz_Choosen(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Choosen_Condition;
	information = DIA_Igaraz_Choosen_Info;
	permanent = TRUE;
	description = "Kdo jsou Vyvolení?";
};


func int DIA_Igaraz_Choosen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_NotWork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Choosen_Info()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_15_00");	//Kdo jsou Vyvolení?
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_01");	//Novicové, kterým Innos přikázal projít zkouškou magie.
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_02");	//Ten, kdo jí projde, bude přijat mezi ohnivé mágy.
	Info_ClearChoices(DIA_Igaranz_Choosen);
	Info_AddChoice(DIA_Igaranz_Choosen,Dialog_Back,DIA_Igaranz_Choosen_back);
	Info_AddChoice(DIA_Igaranz_Choosen,"Co je ta Zkouška magie?",DIA_Igaranz_Choosen_TestOfMagic);
	Info_AddChoice(DIA_Igaranz_Choosen,"Jak se můžu stát vyvoleným?",DIA_Igaranz_Choosen_HowChoosen);
};

func void DIA_Igaranz_Choosen_back()
{
	Info_ClearChoices(DIA_Igaranz_Choosen);
};

func void DIA_Igaranz_Choosen_TestOfMagic()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_TestOfMagic_15_00");	//Co je ta Zkouška magie?
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01");	//Zkouška, kterou oznámí nejvyšší rada všem vybraným novicům.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02");	//Je to úkol, během kterého se projeví jejich víra a moudrost.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03");	//Účastní se všichni vybraní novicové - úspěšně však může zkoušku složit jen jeden z nich.
};

func void DIA_Igaranz_Choosen_HowChoosen()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_HowChoosen_15_00");	//Jak se můžu stát vyvoleným?
	AI_Output(self,other,"DIA_Igaranz_Choosen_HowChoosen_13_01");	//Na to nemůžeš mít žádný vliv. Své novice si vybírá sám Innos a jeho vůli oznamuje Nejvyšší rada.
};


instance DIA_Igaranz_StudyInnos(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_StudyInnos_Condition;
	information = DIA_Igaraz_StudyInnos_Info;
	permanent = FALSE;
	description = "Jak můžu studovat svaté spisy?";
};


func int DIA_Igaraz_StudyInnos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_NotWork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (Parlan_Erlaubnis == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_StudyInnos_Info()
{
	AI_Output(other,self,"DIA_Igaranz_StudyInnos_15_00");	//Jak můžu studovat svaté spisy?
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_01");	//Musíš získat přístup do knihovny.
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_02");	//Mistr Parlan ti ale dá klíč až ve chvíli, kdy poprvé splníš všechny své povinnosti.
};


instance DIA_Igaraz_IMTHEMAN(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_IMTHEMAN_Condition;
	information = DIA_Igaraz_IMTHEMAN_Info;
	important = TRUE;
};


func int DIA_Igaraz_IMTHEMAN_Condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_IMTHEMAN_Info()
{
	AI_Output(self,other,"DIA_Igaraz_IMTHEMAN_13_00");	//(hrdě) Již se tak stalo. Innos mě vybral a budu se účastnit zkoušky magie.
};


instance DIA_Igaraz_METOO(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 19;
	condition = DIA_Igaraz_METOO_Condition;
	information = DIA_Igaraz_METOO_Info;
	permanent = FALSE;
	description = "Já mám taky trochu potíže...";
};


var int DIA_Igaraz_METOO_NOPERM;

func int DIA_Igaraz_METOO_Condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_METOO_Info()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_15_00");	//To mě taky - požadoval jsem Zkoušku ohně.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_01");	//Co jsi UDĚLAL? Buď jsi Innosův oblíbenec, nebo naprosto šílený.
	AI_Output(other,self,"DIA_Igaraz_METOO_15_02");	//Už jsem udělal dost šílených věcí, takže bych řekl, že zvládnu i tohle.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_03");	//Innos nade mnou drží ochrannou ruku - jeho zkouškou tedy projdu.
	Info_ClearChoices(DIA_Igaraz_METOO);
	Info_AddChoice(DIA_Igaraz_METOO,Dialog_Back,DIA_Igaraz_METOO_BACK);
	Info_AddChoice(DIA_Igaraz_METOO,"Možná bychom mohli pracovat společně.",DIA_Igaraz_METOO_HELP);
	Info_AddChoice(DIA_Igaraz_METOO,"Tak co, už jsi něco vyzvěděl?",DIA_Igaraz_METOO_TELL);
	Info_AddChoice(DIA_Igaraz_METOO,"Viděl jsi Agona nebu Ulfa?",DIA_Igaraz_METOO_AGON);
};

func void DIA_Igaraz_METOO_BACK()
{
	Info_ClearChoices(DIA_Igaraz_METOO);
};

func void DIA_Igaraz_METOO_TELL()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_TELL_15_00");	//A už jsi něco objevil?
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_01");	//Protože stejně nemáš žádnou šanci, klidně ti můžu říct tohle:
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_02");	//Don't bother looking near the farms - there is nothing there that will get you anywhere.
};

func void DIA_Igaraz_METOO_HELP()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_HELP_15_00");	//Možná bychom mohli pracovat společně...
	AI_Output(self,other,"DIA_Igaraz_METOO_HELP_13_01");	//Zapomeň na to. Splním tenhle úkol sám. Akorát bys mě brzdil.
};

func void DIA_Igaraz_METOO_AGON()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_AGON_15_00");	//Viděl jsi Agona nebu Ulfa?
	AI_Output(self,other,"DIA_Igaraz_METOO_AGON_13_01");	//Rozdělili jsme se u hostince. Šel jsem na farmy a ti dva vyrazili spolu - ale kam, to vážně nevím.
};


instance DIA_Igaraz_ADD(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 23;
	condition = DIA_Igaraz_ADD_Condition;
	information = DIA_Igaraz_ADD_Info;
	permanent = FALSE;
	description = "Nevíš něco o 'oživlém kameni'?";
};


func int DIA_Igaraz_ADD_Condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (MIS_GOLEM == LOG_Running) && (Npc_IsDead(Magic_Golem) == FALSE) && (Npc_KnowsInfo(other,DIA_Igaraz_Stein) == FALSE) && Npc_KnowsInfo(other,DIA_Igaraz_METOO))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_ADD_Info()
{
	AI_Output(other,self,"DIA_Igaraz_Add_15_00");	//Nevíš něco o "oživlém kameni"?
	AI_Output(self,other,"DIA_Igaraz_Add_13_01");	//(zachichotá se) Ne! Byl to Serpentes, kdo ti dal tuhle zkoušku?
	AI_Output(other,self,"DIA_Igaraz_Add_15_02");	//Ano, proč?
	AI_Output(self,other,"DIA_Igaraz_Add_13_03");	//Dovedu si představit, co má za lubem.
	AI_Output(self,other,"DIA_Igaraz_Add_13_04");	//Nebyl bys první, kdo by v téhle zkoušce neobstál.
	AI_Output(other,self,"DIA_Igaraz_Add_15_05");	//Kde přesně najdu tu živoucí skálu?
	AI_Output(self,other,"DIA_Igaraz_Add_13_06");	//Jdi dál po téhle cestě. Po docela dlouhé době dojdeš k řece.
	AI_Output(self,other,"DIA_Igaraz_Add_13_07");	//Jdi dál a cesta tě zavede do hor. Někde tam by to mělo být.
	AI_Output(self,other,"DIA_Igaraz_Add_13_08");	//Když dojdeš k mostu, tak už jsi moc daleko.
	AI_Output(self,other,"DIA_Igaraz_Add_13_09");	//(zasměje se) Tedy, POKUD se dostaneš tak daleko...
	AI_Output(self,other,"DIA_Igaraz_Add_13_10");	//To je všechno, co ti k tomu řeknu. (sarkasticky) Je to konec konců tvoje ZKOUŠKA!
};


instance DIA_Igaraz_Pruefung(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 22;
	condition = DIA_Igaraz_Pruefung_Condition;
	information = DIA_Igaraz_Pruefung_Info;
	description = "Už jsi objevil něco nového?";
};


func int DIA_Igaraz_Pruefung_Condition()
{
	if((other.guild == GIL_NOV) && (Npc_HasItems(other,ItMi_RuneBlank) < 1) && Npc_KnowsInfo(other,DIA_Igaraz_METOO))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Pruefung_Info()
{
	AI_Output(other,self,"DIA_Igaraz_Pruefung_15_00");	//Už jsi objevil něco nového?
	AI_Output(self,other,"DIA_Igaraz_Pruefung_13_01");	//Ještě ne, ale stále hledám.
	AI_StopProcessInfos(self);
	if(Igaraz_Wait == FALSE)
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"CONTESTWAIT");
		Igaraz_Wait = TRUE;
	};
};


instance DIA_Igaraz_Stein(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 1;
	condition = DIA_Igaraz_Stein_Condition;
	information = DIA_Igaraz_Stein_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Igaraz_Stein_Condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_66") <= 3500) && (other.guild == GIL_NOV) && (Npc_HasItems(other,ItMi_RuneBlank) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Stein_Info()
{
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_00");	//Hej, počkej. Měli bychom si promluvit.
	AI_Output(other,self,"DIA_Igaraz_Seufz_15_01");	//No, já si to nemyslím.
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_02");	//Na tuhle zkoušku jsme čekali celé léta. Innos je se mnou a já ji MUSÍM splnit.
	if(Npc_KnowsInfo(other,DIA_Ulf_Abrechnung))
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_03");	//To mi zní povědomě.
	}
	else
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_04");	//Nejsi sám, kdo tohle říká.
	};
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_05");	//Dost tlachání. Potřebuji, co jsi našel. Nadešel tedy čas, abys zemřel!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Igaranz_Kap2_EXIT(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 999;
	condition = DIA_Igaraz_Kap2_EXIT_Condition;
	information = DIA_Igaraz_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Igaraz_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Igaranz_Kap3_EXIT(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 999;
	condition = DIA_Igaraz_Kap3_EXIT_Condition;
	information = DIA_Igaraz_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Igaraz_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Igaranz_TalkAboutBabo(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_TalkAboutBabo_Condition;
	information = DIA_Igaraz_TalkAboutBabo_Info;
	permanent = FALSE;
	description = "Měli bychom si promluvit o Babovi.";
};


func int DIA_Igaraz_TalkAboutBabo_Condition()
{
	if(MIS_BabosDocs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_TalkAboutBabo_Info()
{
	AI_Output(other,self,"DIA_Igaranz_TalkAboutBabo_15_00");	//Měli bychom si promluvit o Babovi.
	AI_Output(self,other,"DIA_Igaranz_TalkAboutBabo_13_01");	//(opatrně) Ano, co se děje?
};


instance DIA_Igaranz_BabosBelongings(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BabosBelongings_Condition;
	information = DIA_Igaraz_BabosBelongings_Info;
	permanent = FALSE;
	description = "Máš něco, co patří Babovi.";
};


func int DIA_Igaraz_BabosBelongings_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_TalkAboutBabo))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BabosBelongings_Info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_00");	//Máš něco, co patří Babovi.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_01");	//Co by to tak asi mohlo být?
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_02");	//Pár papírů. Babo by je rád dostal zpátky.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_03");	//(výsměšně) No, tak tomu docela věřím. Dovedu si to představit. Ale já si je naneštěstí raději ponechám, což nás staví před poněkud nepříjemné dilema.
};


instance DIA_Igaranz_WhereDocs(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_WhereDocs_Condition;
	information = DIA_Igaraz_WhereDocs_Info;
	permanent = FALSE;
	description = "Máš ty papíry?";
};


func int DIA_Igaraz_WhereDocs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_WhereDocs_Info()
{
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_00");	//Máš ty papíry?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_01");	//(arogantně) No, nemám je samozřejmě u sebe. Obávám se, že ti nemohu pomoci.
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_02");	//Kde jsou?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_03");	//Zamknul jsem je na bezpečném místě. A klíč ode mě nikdy nedostaneš.
};


instance DIA_Igaranz_BabosJob(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BabosJob_Condition;
	information = DIA_Igaraz_BabosJob_Info;
	permanent = FALSE;
	description = "Co pro tebe měl Babo udělat?";
};


func int DIA_Igaraz_BabosJob_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BabosJob_Info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_00");	//Co pro tebe měl Babo udělat?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_01");	//Kdybych věděl, že se ten mazánek nedokáže postarat o trochu trávy z bažin, zařídil bych, aby klášterní zahradu dostal na starost někdo jiný.
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_02");	//On má za úkol pěstovat trávu z bažin?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_03");	//Samozřejmě. Od doby, co už zpoza bariéry žádná nepřichází, se její cena ve městě ztrojnásobila.
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_04");	//To může být docela dobrý kšeft pro každého, kdo se do toho dá. Ale Babo se nechtěl zapojit.
};


instance DIA_Igaranz_Price(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_Price_Condition;
	information = DIA_Igaraz_Price_Info;
	permanent = FALSE;
	description = "Kolik chceš za ty papíry?";
};


func int DIA_Igaraz_Price_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Price_Info()
{
	AI_Output(other,self,"DIA_Igaranz_Price_15_00");	//Kolik chceš za ty papíry?
	AI_Output(self,other,"DIA_Igaranz_Price_13_01");	//(zasměje se) Ha, ve skutečnosti jsou naprosto nedocenitelné. Něco takového se tady moc často nevidí.
	AI_Output(self,other,"DIA_Igaranz_Price_13_02");	//Nerad bych ale sázel celou svou budoucnost jen proti pár zlaťákům.
	AI_Output(self,other,"DIA_Igaranz_Price_13_03");	//300 zlatých a můžeš si dělat s těmi papíry co chceš.
};


instance DIA_Igaranz_BuyIt(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BuyIt_Condition;
	information = DIA_Igaraz_BuyIt_Info;
	permanent = FALSE;
	description = "Chtěl bych ty papíry koupit.";
};


func int DIA_Igaraz_BuyIt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_Price) && (Npc_HasItems(other,ItMi_Gold) >= 300))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BuyIt_Info()
{
	AI_Output(other,self,"DIA_Igaranz_BuyIt_15_00");	//Chtěl bych ty papíry koupit.
	AI_Output(self,other,"DIA_Igaranz_BuyIt_13_01");	//Podívej, nemůžu odsud jen tak odejít. Dám ti klíč od mé truhly, stejně v ní nic jiného není.
	B_GiveInvItems(other,self,ItMi_Gold,300);
	B_GiveInvItems(self,other,ItKe_IgarazChest_Mis,1);
};


instance DIA_Igaraz_PICKPOCKET(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 900;
	condition = DIA_Igaraz_PICKPOCKET_Condition;
	information = DIA_Igaraz_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Tenhle klíč lze snadno ukrást)";
};


func int DIA_Igaraz_PICKPOCKET_Condition()
{
	if((MIS_BabosDocs == LOG_Running) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_IgarazChest_Mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Igaraz_PICKPOCKET);
	Info_AddChoice(DIA_Igaraz_PICKPOCKET,Dialog_Back,DIA_Igaraz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Igaraz_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Igaraz_PICKPOCKET_DoIt);
};

func void DIA_Igaraz_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems(self,other,ItKe_IgarazChest_Mis,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Igaraz_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Igaraz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Igaraz_PICKPOCKET);
};


instance DIA_Igaranz_Kap4_EXIT(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 999;
	condition = DIA_Igaraz_Kap4_EXIT_Condition;
	information = DIA_Igaraz_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Igaraz_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Igaranz_Kap5_EXIT(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 999;
	condition = DIA_Igaraz_Kap5_EXIT_Condition;
	information = DIA_Igaraz_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Igaraz_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Igaranz_Perm(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Perm_Condition;
	information = DIA_Igaraz_Perm_Info;
	permanent = FALSE;
	description = "Máš pro mě něco zajímavého?";
};


func int DIA_Igaraz_Perm_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF) && (MIS_BabosDocs != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Perm_Info()
{
	AI_Output(other,self,"DIA_Igaranz_Perm_15_00");	//Máš pro mě něco zajímavého?
	AI_Output(self,other,"DIA_Igaranz_Perm_13_01");	//Ehm... ne.
	AI_StopProcessInfos(self);
};

