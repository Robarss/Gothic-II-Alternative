
func void Use_Bookstand_Rune_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Strana 1");
		Doc_PrintLine(nDocID,0,"Runové kameny");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Strana 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Rune_02_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Strana 1");
		Doc_PrintLine(nDocID,0,"Runy a jejich ingredience");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Strana 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Innos_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Strana 1");
		Doc_PrintLine(nDocID,0,"Innosovo učení");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Strana 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Innos_02_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Strana 1");
		Doc_PrintLine(nDocID,0,"Innosova přikázání");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Strana 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"PRVNÍ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy prvního kruhu a přísady, které jsou zapotřebí k jeho vytvoření. ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Světlo");
		Doc_PrintLine(nDocID,0,"Zlatá mince");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ohnivý šíp");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Malý blesk");
		Doc_PrintLine(nDocID,0,"Kamenný krystal");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Vyvolání gobliního kostlivce");
		Doc_PrintLine(nDocID,0,"Gobliní kost");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Léčba lehkých zranění");
		Doc_PrintLine(nDocID,0,"Léčivá rostlina");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"K vytvoření runy vždy potřebuješ JEDNU z uvedených přísad.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Uživatel musí znát patřičné zaklínadlo a musí mít u sebe čistý runový kámen spolu se svitkem zvoleného kouzla.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Teprve po dokončení těchto příprav může přistoupit k práci s runovou tabulkou.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_02_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"DRUHÝ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy 2. kruhu a přísady potřebné k jejich vytvoření.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ohnivá koule");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ledový šíp");
		Doc_PrintLine(nDocID,0,"Ledový křemen");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Vyvolání vlka");
		Doc_PrintLine(nDocID,0,"Vlčí kůže");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Větrná pěst");
		Doc_PrintLine(nDocID,0,"Uhlí");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Spánek");
		Doc_PrintLine(nDocID,0,"Tráva z bažin");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"K vytvoření runy vždy potřebuješ JEDNU z uvedených přísad.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Uživatel musí znát patřičné zaklínadlo a musí mít u sebe čistý runový kámen spolu se svitkem zvoleného kouzla.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Teprve po dokončení těchto příprav může přistoupit k práci s runovou tabulkou.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_03_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"TŘETÍ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy 3. kruhu a přísady potřebné k jejich vytvoření. ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Léčba středně těžkých zranění");
		Doc_PrintLine(nDocID,0,"Léčivá bylina");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Malá ohnivá bouře");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Vytvoření kostlivce");
		Doc_PrintLine(nDocID,0,"Kost z kostlivce");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Strach");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ledový blok");
		Doc_PrintLine(nDocID,0,"Ledový křemen");
		Doc_PrintLine(nDocID,0,"Akvamarín");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Kulový blesk");
		Doc_PrintLine(nDocID,0,"Kamenný krystal");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,0,"Malá ohnivá bouře");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,1,"K vytvoření runy vždy potřebuješ JEDNU z uvedených přísad.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Uživatel musí znát patřičné zaklínadlo a musí mít u sebe čistý runový kámen spolu se svitkem zvoleného kouzla.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Teprve po dokončení těchto příprav může přistoupit k práci s runovou tabulkou.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_04_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ČTVRTÝ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy 4. kruhu a přísady potřebné k jejich vytvoření.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Velká ohnivá koule");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Blesk");
		Doc_PrintLine(nDocID,0,"Kamenný krystal");
		Doc_PrintLine(nDocID,0,"Ledový křemen");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Probuzení golema");
		Doc_PrintLine(nDocID,0,"Srdce kamenného golema");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Zničení nemrtvého");
		Doc_PrintLine(nDocID,0,"Svěcená voda");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"K vytvoření runy vždy potřebuješ JEDNU z uvedených přísad.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Uživatel musí znát patřičné zaklínadlo a musí mít u sebe čistý runový kámen spolu se svitkem zvoleného kouzla.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Teprve po dokončení těchto příprav může přistoupit k práci s runovou tabulkou.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_05_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"PÁTÝ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy 5. kruhu a přísady potřebné k jejich vytvoření.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ledová vlna");
		Doc_PrintLine(nDocID,0,"Ledový křemen");
		Doc_PrintLine(nDocID,0,"Akvamarín");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Velká ohnivá bouře");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"Jazyk ohnivého ještěra");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Vyvolání démona");
		Doc_PrintLine(nDocID,0,"Srdce démona");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Léčba těžkých zranění");
		Doc_PrintLine(nDocID,0,"Léčivý kořen");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"K vytvoření runy vždy potřebuješ JEDNU z uvedených přísad.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Uživatel musí znát patřičné zaklínadlo a musí mít u sebe čistý runový kámen spolu se svitkem zvoleného kouzla.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Teprve po dokončení těchto příprav může přistoupit k práci s runovou tabulkou.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_06_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ŠESTÝ KRUH");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runy 6. kruhu a přísady potřebné k jejich vytvoření.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ohnivý déšť");
		Doc_PrintLine(nDocID,0,"Pryskyřice");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"Jazyk ohnivého ještěra");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Dech smrti");
		Doc_PrintLine(nDocID,0,"Uhlí");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Vlna smrti");
		Doc_PrintLine(nDocID,0,"Kost z kostlivce");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Armáda temnot");
		Doc_PrintLine(nDocID,0,"Kost z kostlivce");
		Doc_PrintLine(nDocID,0,"Černá perla");
		Doc_PrintLine(nDocID,0,"Srdce kamenného golema");
		Doc_PrintLine(nDocID,0,"Srdce démona");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Zmenšení nestvůry");
		Doc_PrintLine(nDocID,1,"Kost z goblina");
		Doc_PrintLine(nDocID,1,"Trolí tesák");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"K vytvoření runy vždy potřebuješ JEDNU z uvedených přísad.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Uživatel musí znát patřičné zaklínadlo a musí mít u sebe čistý runový kámen spolu se svitkem zvoleného kouzla.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Teprve po dokončení těchto příprav může přistoupit k práci s runovou tabulkou.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Rules_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Strana 1");
		Doc_PrintLine(nDocID,0,"Regeln");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Strana 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

