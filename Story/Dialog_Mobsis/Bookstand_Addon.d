
func void Use_Bookstand_Addon_BL_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Důl");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Crimson: 79 zlatých nugetů předáno a přetaveno.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Scatty: zboží zaplaceno, 250 zlatých předáno");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Garaz: 6 zlatých nugetů předáno");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Všechny stráže: 9 zlatých nugetů předáno");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Tábor:  ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ravenovy stráže: 25 zlatých nugetů");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Finn: 60 zlatých nugetů");
		Doc_PrintLines(nDocID,1,"Lennar: 40 zlatých nugetů");
		Doc_PrintLines(nDocID,1,"Emilio: 50 zlatých nugetů");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ostatní: 20 zlatých nugetů");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Huno, Fisk, Snaf: záleží na zboží");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Lovci: Vůdce by to měl vyřídit! Franco 7 zlatých předáno");
		Doc_Show(nDocID);
	};
};


var int BookstandMayaHierchary_1_permanent;
var int BookstandMayaHierchary_2_permanent;
var int BookstandMayaHierchary_3_permanent;
var int BookstandMayaHierchary_4_permanent;
var int BookstandMayaHierchary_5_permanent;
var int BookstandMayaArt;

func int C_CanReadBookStand()
{
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void Use_BookstandMaya()
{
	if(BookstandMayaArt == 1)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"...pouze STRÁŽCI SMRTI mohou povolat předky. ");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Jejich absence jim velice chyběla. Beze předků nemohli vést lidi.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"LÉČITELÉ byli posláni, aby zapečetili portál a zničili klíč. Jen Adanos ví, co se s nimi stalo a jestli se jim úkol podařil.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"VÁLEČNICKÁ KASTA byla zničena hněvem Adanose. Srdce starého válečníka bylo zlomeno. ");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Pouze zbylí KNĚZI dávali lidem naději na znovuzrození jejich města. ");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Ale my, UČENCI, jsme již znali hořkou pravdu. JHARKENDAR padl a byl pohřben časem.");
		Doc_PrintLines(StPl_nDocID,1,"");
	}
	else if(BookstandMayaArt == 2)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"RHADEMES byl pohřben v Adanosově chrámu, ale moc meče zlomena nebyla.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Jeho moc byla příliš velká. Zabíjení a ničení na ulicích by nikdy neskončilo.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"A tak až samotný Adonos vše ukončil svým hněvem. Jedinou vlnou zatopil celé město.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Jen několik vyšších budov zůstalo, vše ostatní bylo zničeno.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Několik lidí katastrofu přežilo, jenže neměli už dostatek sil, aby dokázali obnovit slávu a velikost města. ");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"A tak byl osud JHARKENDARU zpečetěn.");
		if(SC_Knows_WeaponInAdanosTempel == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			SC_Knows_WeaponInAdanosTempel = TRUE;
		};
	}
	else if(BookstandMayaArt == 3)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Stáří QUARHODRONA ho dělalo již neschopného vést armádu. A tak kněží využili toho, že spadá pod jejich moc. ");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"A přikázali mu, aby se vzdal svého titulu vůdce a odevzdal meč.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Rada pěti chtěla jednat o jeho následníkovi, ale Válečnická kasta s tím nesouhlasila. ");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"RHADEMES, syn QUARHODRON byl navrhnut a zvolen Válečnickou kastou, jakožto nový vůdce.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"QUARHODRON důvěřoval svému rodu, a tak souhlasil a odstoupil.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Odevzdal svůj meč svému synovi v naději, že mu bude vládnout stejně pevně, jako on.");
	}
	else if(BookstandMayaArt == 4)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"RHADEMES byl ale slabý. Vůle meče ho přemohla a on se stal jen jeho loutkou.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"RHADEMES v moci meče přinesl vlastním lidem zkázu a utrpení. Ani léčitelé nebyli schopni utrpení zastavit či zmírnit.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Meč brzy pochopil, že jsou lidé příliš slabí na to, aby se mu dokázali postavit.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Jen od našich předků, hrozilo nebezpečí.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Proto RHADEMES nechal všechny Strážce smrti popravit, což znamenalo konec všech nadějí.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Mnoho Strážců smrti zemřelo, když se pokoušeli povolat naše předky na pomoc JHARKENDARU.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Válka zuřila v ulicích, a tak se léčitelé rozhodli zapečetit vstup do údolí.");
	}
	else if(BookstandMayaArt == 5)
	{
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"QUARHODRON, nejvyšší kněz KHARDIMON a já jsme se v těchto síních snažili příjít na to, jak porazit RHADEMESE a 'meč'.");
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"QUARHODRON a KHARDIMON se domnívali, že nejlepší bude zničit RHADEMESE v bitvě, společnými silami. Ale JÁ znal sílu meče příliš dobře, abych s tímto návrhem souhlasil.");
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Použil jsem svého práva k zamítnutí ostatních dvou a namísto toho jsem se rozhodl oklamat RHADAMESE lstí.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"QUARHODRON uposlechl moji radu a  nechal se uzavřít v Adanosově chrámu. Pak poslal pro svého syna a požádal ho o pomoc.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Hněv jeho syna nabral takové velikosti, že rozbořil chrám, aby osvobodil svého otce.  ");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Uvědomil si příliš pozdě, jaké jsou naše skutečné plány");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"QUARHODRON zapečetil chrám přede všemi a RHADEMES byl v pasti. Uvězněn na věčnost i s mečem.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"");
	};
};

func void InitUse_BookstandMaya()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			StPl_nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,FONT_Book);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Doc_Show(StPl_nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else if(C_CanReadBookStand())
		{
			StPl_nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,FONT_Book);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Use_BookstandMaya();
			Doc_Show(StPl_nDocID);
		};
	};
	BookstandMayaArt = 0;
};

func void Use_BookstandMayaHierchary_01_S1()
{
	BookstandMayaArt = 1;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_1_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_1_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_02_S1()
{
	BookstandMayaArt = 2;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_2_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_2_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_03_S1()
{
	BookstandMayaArt = 3;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_3_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_3_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_04_S1()
{
	BookstandMayaArt = 4;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_4_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_4_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_05_S1()
{
	BookstandMayaArt = 5;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_5_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_5_permanent = TRUE;
	};
};

