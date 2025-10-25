
instance ITWr_Addon_Hinweis_02(C_Item)
{
	name = "Důležitá zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_02;
	scemeName = "MAP";
	description = name;
	text[0] = "z hospody v táboře banditů";
};


func void Use_Hinweis_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Hej lidi,");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Lou zmizel kdesi v močálu, pravděpodobně ho sežrali žraloci.");
	Doc_PrintLines(nDocID,0,"A co je horší - klíč od jeho dveří zmizel s ním.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ten kdo ho najde, může si nechat jeho věci.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Snaf");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Health_04(C_Item)
{
	name = "Léčivý lektvar - recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Heilrezept_04;
	scemeName = "MAP";
	description = "Čistý lektvar života";
	text[2] = "Na namíchání tohoto mocného lektvaru ";
	text[3] = "jsou potřeba vědomosti namíchání elixíru hojivé síly. ";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Heilrezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy,"na výrobu léčivého lektvaru je potřeba 3 esence života a jedna luční pohanka.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výroba léčivého lektvaru:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jednu luční pohanku a tři esence života");
	Doc_PrintLines(nDocID,0,"Smícháme podle receptu na výrobu léčivého lektvaru. ");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tento lektvar může udělat pouze alchymista, který umí připravit elixír hojivé síly. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Mana_04(C_Item)
{
	name = "Mana - Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Manarezept_04;
	scemeName = "MAP";
	description = "Čistý lektvar many";
	text[2] = "K namíchání tohoto mocného lektvaru";
	text[3] = "musí mít alchymista znalosti přípravy elixíru many.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Manarezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy,"Na výrobu je potřeba jedna luční pohanka a tři esence many.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Namíchání lektvaru many:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jsou potřebné tyto přísady: 1 luční pohanka a 3 esence many.");
	Doc_PrintLines(nDocID,0,"Smícháme podle receptu na výrobu lektvaru many.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"tento lektvar může udělat pouze alchymista, který umí připravit elixír many.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_New_Ancient(C_Item)
{
	name = "Prastarý recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_New_Ancient_01;
	scemeName = "MAP";
	description = "Mocný prastarý lektvar";
	text[2] = "Pokud chci porozumět receptu, musím umět stáry jazyk";
	text[3] = ".";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_New_Ancient_01()
{
	var int nDocID;
	if(Npc_IsPlayer(self) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
		{
			Knows_AncientLIXIER = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy,"PRASTARÝ LEKTVAR: 3x srdce bažineho golema a 15x hlava kudlanky.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Namíchání prastarého lektvaru:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jsou potřebné tyto přísady: 3x srdce bažineho golema a 15x hlava kudlanky.");
	Doc_PrintLines(nDocID,0,"Smícháme podle receptu na výrobu léčivého lektvaru.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tento lektvar může udělat pouze alchymista, který umí připravit elixír hojivé síly.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWR_WINER(C_Item)
{
	name = "Víno poznání";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_winerrezept;
	scemeName = "MAP";
	description = "Víno poznání";
	text[2] = "K namíchání tohoto specialního vína";
	text[3] = "musí mít alchymista znalosti přípravy elixíru many.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_winerrezept()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		{
			Knows_VINELIXIER = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy,"Na výrobu Vína poznání je potřeba 5x Hrozen a 1 Ohnivý kořen.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"K vytvoření Vína poznání:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jsou potřebné tyto přísady: 5x Hrozen a 1 Ohnivý kořen.");
	Doc_PrintLines(nDocID,0,"Smícháme podle receptu na výrobu lektvaru many.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tento lektvar může udělat pouze alchymista, který umí připravit elixír many.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Hinweis_01(C_Item)
{
	name = "Důležitá zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_01;
	scemeName = "MAP";
	description = name;
	text[0] = "z chatrče v bažinách ";
};


func void Use_Hinweis_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Hej,");
	Doc_PrintLines(nDocID,0,"zboží v truhle je určeno jen pro případ,");
	Doc_PrintLines(nDocID,0,"že někdo potřebuje naléhavě pomoc.");
	Doc_PrintLines(nDocID,0,"Každý z nás ho může v nouzi použít.");
	Doc_PrintLines(nDocID,0,"Ale neber si zbytečně víc, než potřebuješ.");
	Doc_PrintLines(nDocID,0,"Když to budeme dodržovat, bude to fungovat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Fletcher");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_William_01(C_Item)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_William_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Tato zpráva byla sebrábna rybáři Williamovi.";
};


func void Use_William_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Williame,");
	Doc_PrintLines(nDocID,0,"až nebude svítit měsíc, stráže nebudou vidět.");
	Doc_PrintLines(nDocID,0,"Propliž se kolem - ale buď opatrný!");
	Doc_PrintLines(nDocID,0,"Běž podél dřevěné hráze a dostaneš se do tábora. ");
	Doc_PrintLines(nDocID,0,"Tábor pirátů je na opačné straně - daleko na západě. ");
	Doc_PrintLines(nDocID,0,"Odtud by mělo být lehké odplout lodí. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Někdo, kdo to s Tebou myslí dobře");
	Doc_Show(nDocID);
};


instance ITWr_Addon_MCELIXIER_01(C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MCELIXIER_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Recept na lektvar obnovy mysli";
	text[1] = "Tento lektvar vrací paměť";
};


func void Use_MCELIXIER_01()
{
	var int nDocID;
	Knows_MCELIXIER = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"lektvar obnovy mysli");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Na tento lektvar potřebuješ jed z dvou žihadel krvavých much");
	Doc_PrintLines(nDocID,0,"Přidej jeden extrakt many a jednu esenci života,");
	Doc_PrintLines(nDocID,0,"nakonec přidej pálivý červený pepř");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pouze zručný alchymista který ví, jak získat jed ze žihadla, může udělat tento lektvar. Proto buď opatrný. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Pirates_01(C_Item)
{
	name = "Nečestné uklouznutí";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Pirates_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Toto bylo podstrčené v Angusově kapse";
};


func void Use_Pirates_01()
{
	var int nDocID;
	Read_JuansText = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Piráti,");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dodejte konečně objednanou zásilku.");
	Doc_PrintLine(nDocID,0,"Doneste jí do jeskyně. Tam se setkáme.");
	Doc_PrintLines(nDocID,0,"Zaplatím vám ve zlatě. Dvojnásobek ceny.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tak to udělejte.");
	Doc_PrintLine(nDocID,0,"Tom");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Joint_01(C_Item)
{
	name = "Zelený novic";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Joint_Rezept_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Byl ve Fortunově truhle";
};


func void Use_Joint_Rezept_01()
{
	var int nDocID;
	Green_Extrem = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Zelený novic");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"(...) Toto může být uděláno velice jednoduše, ale ne bez stébel potřebného kalibru, které se zde v táboře banditů nedají získat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Když zkonbinuji dvě stébla trávy z bažin s luční pohankou, udělám zeleného novice.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zelený novic tlumí bolest a čistí hlavu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Lou_Rezept(C_Item)
{
	name = "Recept na Louovo kladivo";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 70;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept;
	scemeName = "MAP";
	description = name;
	text[0] = "Recept na vytvoření Louova kladiva";
};


func void UseLouRezept()
{
	var int nDocID;
	Knows_LousHammer = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Recept na Louovo kladivo");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ingredience na umíchání 'Kladiva' :");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Prvně si vezmeš láhev vody a 2x tuřín a trávu z bažin.");
	Doc_PrintLines(nDocID,0,"Posléze přidáš zub močálového žraloka.");
	Doc_PrintLines(nDocID,0,"Vše smícháš a nakonec přidáš láhev rumu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Na zdraví.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"A nevdechuj výpáry! Jinak oslepneš jako jeden starý muž! ");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Lou_Rezept2(C_Item)
{
	name = "Recept na Louovo dvojité kladivo";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 140;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept2;
	scemeName = "MAP";
	description = name;
	text[0] = "Recept na namíchání Louova dvojitého kladiva";
};


func void UseLouRezept2()
{
	var int nDocID;
	Knows_Schlafhammer = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Louovo dvojité kladivo");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmi staré dobré Louovo kladivo a předestiluj to ještě jednou.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tato směs se může povést pouze tomu, kdo je zkušený, a  to za měsíčního svitu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nezkušení nebudou pouze oslepeni. Budou určitě mrtvi.");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Piratentod(C_Item)
{
	name = "Rychlý sledě";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseRezeptPiratentod;
	scemeName = "MAP";
	description = name;
	text[0] = "Recept na 'Rychlý sledě'";
};


func void UseRezeptPiratentod()
{
	var int nDocID;
	Knows_SchnellerHering = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Rychlý sleď (podle mne)");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Malý životabudič pro pořádné chlapy");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jako obvykle budeme potřebovat láhev vody. Pak jeden rum a čerstvou rybu.");
	Doc_PrintLines(nDocID,0,"Jakmile nám směs začne žloutnout, dejme rybu pryč a přidejme");
	Doc_PrintLines(nDocID,0,"čerstvou trávu z bažin.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ale bacha. Opravdu to s tebou zamává.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance Fakescroll_Addon(C_Item)
{
	name = "Kus papíru";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 0;
	visual = "Fakescroll.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Addon_AxtAnleitung(C_Item)
{
	name = "Instrukce na sekeru banditů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseAxtAnleitung;
	scemeName = "MAP";
	description = name;
	text[0] = "Návod na vytvoření lehké a ostré sekery";
};


func void UseAxtAnleitung()
{
	var int nDocID;
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1)
	{
		Knows_Banditenaxt = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Sekera banditů");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Jednoruční sekera");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ten, kdo zná alespoň základy kování zbraní, může vytvořit speciální sekeru");
	Doc_PrintLines(nDocID,0,"Budeme potřebovat 2 kusy ocele.");
	Doc_PrintLines(nDocID,0,"Pak jeden kus rudy a tři sady zubů z vlka, chňapavce nebo nečeho podobného.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ruda a zuby se skují do jednoho kusu na kovadlině.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tato sekera se lehce ovládá a dělá solidní zranění.");
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_Addon_SUMMONANCIENTGHOST(C_Item)
{
	name = "Quarhodronovo vyvolání";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseSummonAncientGhost;
	scemeName = "MAP";
	description = name;
	text[0] = "S touto formulí můžeš vyvolat Quarhodrona";
};


func void UseSummonAncientGhost()
{
	if(SC_SummonedAncientGhost == FALSE)
	{
		B_Say(self,self,"$ADDON_SUMMONANCIENTGHOST");
		if(Npc_GetDistToWP(self,"ADW_ANCIENTGHOST") < 1000)
		{
			Wld_InsertNpc(NONE_ADDON_111_Quarhodron,"ADW_ANCIENTGHOST");
			Wld_PlayEffect("spellFX_Maya_Ghost",NONE_ADDON_111_Quarhodron,NONE_ADDON_111_Quarhodron,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",NONE_ADDON_111_Quarhodron,NONE_ADDON_111_Quarhodron,0,0,0,FALSE);
			Snd_Play("MFX_GhostVoice");
			Snd_Play("MFX_Firestorm_Cast");
			Snd_Play("MFX_Lightning_Origin");
			SC_SummonedAncientGhost = TRUE;
		}
		else
		{
			B_Say(self,self,"$ADDON_ANCIENTGHOST_NOTNEAR");
		};
	};
};


instance ItWr_Map_AddonWorld(C_Item)
{
	name = "Zapomenuté údolí Stavitelů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_AddonWorld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_AddonWorld()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_AddonWorld);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AddonWorld.tga",TRUE);
	Doc_SetLevel(Document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(Document,-47783,36300,43949,-32300);
	Doc_Show(Document);
};


instance ITWR_BOW1(C_Item)
{
	name = "Nákres Měsíc";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ITWR_SCROLL_BOW1.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_bow1;
	scemeName = "MAP";
	description = "Měsíc";
	text[2] = "Nákres na výrobu luku";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_bow1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWS_BOWSCROLLSI == TRUE)
		{
			KNOWS_BOW1 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_BOWHUNT,"Měsíc - 1x Dřevo na výrobu, 1x Tětiva, 2x priskyřice");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výroba luku Měsíc:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 1x Dřevo na výrobu, 1x Tětiva, 2x priskyřice");
	Doc_PrintLines(nDocID,0,"Na výrobně střelných zbraní použijeme material a postupujem podle nákresu. ");
	Doc_PrintLines(nDocID,0,"Tětiva a dřevo na výrobu jde vyrobyt na truhlařské dílně");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutné se naučit ZÁKLADNÍ výrobu loveckých zbraní. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_BOW2(C_Item)
{
	name = "Nákres Vítr";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ITWR_SCROLL_BOW1.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_bow2;
	scemeName = "MAP";
	description = "Vítr";
	text[2] = "Nákres na výrobu luku";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_bow2()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWS_BOWSCROLLSI == TRUE)
		{
			KNOWS_BOW2 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_BOWHUNT,"Vítr - 1x Dřevo na výrobu, 1x Tětiva, 2x zuby.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výroba luku Vítr:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 1x Dřevo na výrobu, 1x Tětiva, 2x zuby");
	Doc_PrintLines(nDocID,0,"Na výrobně střelných zbraní použijeme material a postupujem podle nákresu. ");
	Doc_PrintLines(nDocID,0,"Tětiva a dřevo na výrobu jde vyrobyt na truhlařské dílně");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutné se naučit ZÁKLADNÍ výrobu loveckých zbraní. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_BOW3(C_Item)
{
	name = "Nákres Ultimátum";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ITWR_SCROLL_BOW2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_bow3;
	scemeName = "MAP";
	description = "Ultimátum";
	text[2] = "Nákres na výrobu luku";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_bow3()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWS_BOWSCROLLSII == TRUE)
		{
			KNOWS_BOW3 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_BOWHUNT,"Ultimatum - 2x Dřevo na výrobu, 2x Tětiva, 3x Perla.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výroba luku Ultimátum:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 2x Dřevo na výrobu, 2x Tětiva, 3x Perla");
	Doc_PrintLines(nDocID,0,"Na výrobně střelných zbraní použijeme material a postupujem podle nákresu. ");
	Doc_PrintLines(nDocID,0,"Tětiva a dřevo na výrobu jde vyrobyt na truhlařské dílně");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutné se naučit POKROČILOU výrobu loveckých zbraní. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_BOW4(C_Item)
{
	name = "Nákres Úsvit";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ITWR_SCROLL_BOW2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_bow4;
	scemeName = "MAP";
	description = "Úsvit";
	text[2] = "Nákres na výrobu luku";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_bow4()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWS_BOWSCROLLSII == TRUE)
		{
			KNOWS_BOW4 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_BOWHUNT,"Úsvit - 2x Dřevo na výrobu, 2x Tětiva, 1x Černá perla.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výroba luku Úsvit:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 2x Dřevo na výrobu, 2x Tětiva, 1x Černá perla");
	Doc_PrintLines(nDocID,0,"Na výrobně střelných zbraní použijeme material a postupujem podle nákresu. ");
	Doc_PrintLines(nDocID,0,"Tětiva a dřevo na výrobu jde vyrobyt na truhlařské dílně");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutné se naučit POKROČILOU výrobu loveckých zbraní. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_BOW5(C_Item)
{
	name = "Nákres Tichá smrt";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 600;
	visual = "ITWR_SCROLL_BOW3.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_bow5;
	scemeName = "MAP";
	description = "Tichá smrt";
	text[2] = "Nákres na výrobu luku";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_bow5()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWS_BOWSCROLLSIII == TRUE)
		{
			KNOWS_BOW5 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_BOWHUNT,"Tichá smrt - 3x Dřevo na výrobu, 3x Tětiva, 1x Smaragd.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výroba luku Tichá smrt:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 3x Dřevo na výrobu, 3x Tětiva, 1x Smaragd");
	Doc_PrintLines(nDocID,0,"Na výrobně střelných zbraní použijeme material a postupujem podle nákresu. ");
	Doc_PrintLines(nDocID,0,"Tětiva a dřevo na výrobu jde vyrobyt na truhlařské dílně");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutné se naučit MISTROVSKOU výrobu loveckých zbraní. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_BOW6(C_Item)
{
	name = "Nákres Soumrak";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 600;
	visual = "ITWR_SCROLL_BOW3.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_bow6;
	scemeName = "MAP";
	description = "Soumrak";
	text[2] = "Nákres na výrobu luku";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_bow6()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWS_BOWSCROLLSIII == TRUE)
		{
			KNOWS_BOW6 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_BOWHUNT,"Soumrak - 3x Dřevo na výrobu, 3x Tětiva, 1x Rubín.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výroba luku Soumrak:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 3x Dřevo na výrobu, 3x Tětiva, 1x Rubín");
	Doc_PrintLines(nDocID,0,"Na výrobně střelných zbraní použijeme material a postupujem podle nákresu. ");
	Doc_PrintLines(nDocID,0,"Tětiva a dřevo na výrobu jde vyrobyt na truhlařské dílně");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutné se naučit MISTROVSKOU výrobu loveckých zbraní. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_CROSSBOW1(C_Item)
{
	name = "Nákres Ochrana";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ITWR_SCROLL_CROS1.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_crossbow1;
	scemeName = "MAP";
	description = "Ochrana";
	text[2] = "Nákres na výrobu Kuše";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_crossbow1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWS_BOWSCROLLSI == TRUE)
		{
			KNOWS_CROSSBOW1 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_BOWHUNT,"Ochrana - 1x Dřevo na výrobu, 1x Tětiva, 2x Drápy.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výroba kuše Ochrana:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 1x Dřevo na výrobu, 1x Tětiva, 2x Drápy");
	Doc_PrintLines(nDocID,0,"Na výrobně střelných zbraní použijeme material a postupujem podle nákresu. ");
	Doc_PrintLines(nDocID,0,"Tětiva a dřevo na výrobu jde vyrobyt na truhlařské dílně");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutné se naučit ZÁKLADNÍ výrobu loveckých zbraní. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_CROSSBOW2(C_Item)
{
	name = "Nákres Záblesk";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ITWR_SCROLL_CROS2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_crossbow2;
	scemeName = "MAP";
	description = "Záblesk";
	text[2] = "Nákres na výrobu Kuše";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_crossbow2()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWS_BOWSCROLLSII == TRUE)
		{
			KNOWS_CROSSBOW2 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_BOWHUNT,"Záblesk - 2x Dřevo na výrobu, 2x Tětiva, 2x Černá perla.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výroba kuše Záblesk:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 2x Dřevo na výrobu, 2x Tětiva, 2x Černá perla");
	Doc_PrintLines(nDocID,0,"Na výrobně střelných zbraní použijeme material a postupujem podle nákresu. ");
	Doc_PrintLines(nDocID,0,"Tětiva a dřevo na výrobu jde vyrobyt na truhlařské dílně");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutné se naučit POKROČILOU výrobu loveckých zbraní. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_CROSSBOW3(C_Item)
{
	name = "Nákres Ničitel";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 600;
	visual = "ITWR_SCROLL_CROS3.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_crossbow3;
	scemeName = "MAP";
	description = "Ničitel";
	text[2] = "Nákres na výrobu Kuše";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_crossbow3()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWS_BOWSCROLLSIII == TRUE)
		{
			KNOWS_CROSSBOW3 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_BOWHUNT,"Ničitel - 3x Dřevo na výrobu, 3x Tětiva, 2x Diamant.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výroba kuše Ničitel:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 3x Dřevo na výrobu, 3x Tětiva, 2x Diamant");
	Doc_PrintLines(nDocID,0,"Na výrobně střelných zbraní použijeme material a postupujem podle nákresu. ");
	Doc_PrintLines(nDocID,0,"Tětiva a dřevo na výrobu jde vyrobyt na truhlařské dílně");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutné se naučit MISTROVSKOU výrobu loveckých zbraní. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

