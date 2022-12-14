
instance ITWr_Addon_Hinweis_02(C_Item)
{
	name = "D?le?it? zpr?va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_02;
	scemeName = "MAP";
	description = name;
	text[0] = "z hospody v t?bo?e bandit?";
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
	Doc_PrintLines(nDocID,0,"Lou zmizel kdesi v mo??lu, pravd?podobn? ho se?rali ?raloci.");
	Doc_PrintLines(nDocID,0,"A co je hor?? - kl?? od jeho dve?? zmizel s n?m.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ten kdo ho najde, m??e si nechat jeho v?ci.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Snaf");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Health_04(C_Item)
{
	name = "L??iv? lektvar - recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Heilrezept_04;
	scemeName = "MAP";
	description = "?ist? lektvar ?ivota";
	text[2] = "Na nam?ch?n? tohoto mocn?ho lektvaru ";
	text[3] = "jsou pot?eba v?domosti nam?ch?n? elix?ru hojiv? s?ly. ";
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
			B_LogEntry(TOPIC_TalentAlchemy,"na v?robu l??iv?ho lektvaru je pot?eba 3 esence ?ivota a jedna lu?n? pohanka.");
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
	Doc_PrintLines(nDocID,0,"V?roba l??iv?ho lektvaru:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jednu lu?n? pohanku a t?i esence ?ivota");
	Doc_PrintLines(nDocID,0,"sm?ch?me podle receptu na v?robu l??iv?ho lektvaru. ");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tento lektvar m??e ud?lat pouze alchymista, kter? um? p?ipravit elix?r hojiv? s?ly. ");
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
	description = "?ist? lektvar many";
	text[2] = "K nam?ch?n? tohoto mocn?ho lektvaru";
	text[3] = "mus? m?t alchymista znalosti p??pravy elix?ru many.";
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
			B_LogEntry(TOPIC_TalentAlchemy,"Na v?robu je pot?eba jedna lu?n? pohanka a t?i esence many.");
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
	Doc_PrintLines(nDocID,0,"Nam?ch?n? lektvaru many:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jsou pot?ebn? tyto p??sady: 1 lu?n? pohanka a 3 esence many.");
	Doc_PrintLines(nDocID,0,"Sm?ch?me podle receptu na v?robu lektvaru many.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"tento lektvar m??e ud?lat pouze alchymista, kter? um? p?ipravit elix?r many.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_WINER(C_Item)
{
	name = "V?no pozn?n?";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_winerrezept;
	scemeName = "MAP";
	description = "V?no pozn?n?";
	text[2] = "K nam?ch?n? tohoto specialn?ho v?na";
	text[3] = "mus? m?t alchymista znalosti p??pravy elix?ru many.";
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
			PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy,"Na v?robu V?na pozn?n? je pot?eba 5x Hrozen a 1 Ohniv? ko?en.");
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
	Doc_PrintLines(nDocID,0,"K vytvo?en? V?na pozn?n?:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jsou pot?ebn? tyto p??sady: 5x Hrozen a 1 Ohniv? ko?en.");
	Doc_PrintLines(nDocID,0,"Sm?ch?me podle receptu na v?robu lektvaru many.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tento lektvar m??e ud?lat pouze alchymista, kter? um? p?ipravit elix?r many.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Hinweis_01(C_Item)
{
	name = "D?le?it? zpr?va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_01;
	scemeName = "MAP";
	description = name;
	text[0] = "z chatr?e v ba?in?ch ";
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
	Doc_PrintLines(nDocID,0,"zbo?? v truhle je ur?eno jen pro p??pad,");
	Doc_PrintLines(nDocID,0,"?e n?kdo pot?ebuje nal?hav? pomoc.");
	Doc_PrintLines(nDocID,0,"Ka?d? z n?s ho m??e v nouzi pou??t.");
	Doc_PrintLines(nDocID,0,"Ale neber si zbyte?n? v?c, ne? pot?ebuje?.");
	Doc_PrintLines(nDocID,0,"Kdy? to budeme dodr?ovat, bude to fungovat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Fletcher");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_William_01(C_Item)
{
	name = "Zpr?va";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_William_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Tato zpr?va byla sebr?bna ryb??i Williamovi.";
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
	Doc_PrintLines(nDocID,0,"a? nebude sv?tit m?s?c, str??e nebudou vid?t.");
	Doc_PrintLines(nDocID,0,"Propli? se kolem - ale bu? opatrn?!");
	Doc_PrintLines(nDocID,0,"B?? pod?l d?ev?n? hr?ze a dostane? se do t?bora. ");
	Doc_PrintLines(nDocID,0,"T?bor pir?t? je na opa?n? stran? - daleko na z?pad?. ");
	Doc_PrintLines(nDocID,0,"Odtud by m?lo b?t lehk? odplout lod?. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"N?kdo, kdo to s Tebou mysl? dob?e");
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
	text[1] = "Tento lektvar vrac? pam??";
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
	Doc_PrintLines(nDocID,0,"Na tento lektvar pot?ebuje? jed z dvou ?ihadel krvav?ch much");
	Doc_PrintLines(nDocID,0,"P?idej jeden extrakt many a jednu esenci ?ivota,");
	Doc_PrintLines(nDocID,0,"nakonec p?idej p?liv? ?erven? pep?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pouze zru?n? alchymista kter? v?, jak z?skat jed ze ?ihadla, m??e ud?lat tento lektvar. Proto bu? opatrn?. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Pirates_01(C_Item)
{
	name = "Ne?estn? uklouznut?";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Pirates_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Toto bylo podstr?en? v Angusov? kapse";
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
	Doc_PrintLine(nDocID,0,"Pir?ti,");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dodejte kone?n? objednanou z?silku.");
	Doc_PrintLine(nDocID,0,"Doneste j? do jeskyn?. Tam se setk?me.");
	Doc_PrintLines(nDocID,0,"Zaplat?m v?m ve zlat?. Dvojn?sobek ceny.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tak to ud?lejte.");
	Doc_PrintLine(nDocID,0,"Tom");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Joint_01(C_Item)
{
	name = "Zelen? novic";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Joint_Rezept_01;
	scemeName = "MAP";
	description = name;
	text[0] = "Byl ve Fortunov? truhle";
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
	Doc_PrintLine(nDocID,0,"Zelen? novic");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"(...) Toto m??e b?t ud?l?no velice jednodu?e, ale ne bez st?bel pot?ebn?ho kalibru, kter? se zde v t?bo?e bandit? nedaj? z?skat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Kdy? zkonbinuji dv? st?bla tr?vy z ba?in s lu?n? pohankou, ud?l?m zelen?ho novice.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zelen? novic tlum? bolest a ?ist? hlavu.");
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
	text[0] = "Recept na vytvo?en? Louova kladiva";
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
	Doc_PrintLine(nDocID,0,"Ingredience na um?ch?n? 'Kladiva' :");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Prvn? si vezme? l?hev vody a 2x tu??n a tr?vu z ba?in.");
	Doc_PrintLines(nDocID,0,"Posl?ze p?id?? zub mo??lov?ho ?raloka.");
	Doc_PrintLines(nDocID,0,"V?e sm?ch?? a nakonec p?id?? l?hev rumu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Na zdrav?.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"A nevdechuj v?p?ry! Jinak oslepne? jako jeden star? mu?! ");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Lou_Rezept2(C_Item)
{
	name = "Recept na Louovo dvojit? kladivo";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 140;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept2;
	scemeName = "MAP";
	description = name;
	text[0] = "Recept na nam?ch?n? Louova dvojit?ho kladiva";
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
	Doc_PrintLine(nDocID,0,"Louovo dvojit? kladivo");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmi star? dobr? Louovo kladivo a p?edestiluj to je?t? jednou.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tato sm?s se m??e pov?st pouze tomu, kdo je zku?en?, a  to za m?s??n?ho svitu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nezku?en? nebudou pouze oslepeni. Budou ur?it? mrtvi.");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Piratentod(C_Item)
{
	name = "Rychl? sled?";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseRezeptPiratentod;
	scemeName = "MAP";
	description = name;
	text[0] = "Recept na 'Rychl? sled?'";
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
	Doc_PrintLine(nDocID,0,"Rychl? sle? (podle mne)");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mal? ?ivotabudi? pro po??dn? chlapy");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jako obvykle budeme pot?ebovat l?hev vody. Pak jeden rum a ?erstvou rybu.");
	Doc_PrintLines(nDocID,0,"Jakmile n?m sm?s za?ne ?loutnout, dejme rybu pry? a p?idejme");
	Doc_PrintLines(nDocID,0,"?erstvou tr?vu z ba?in.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ale bacha. Opravdu to s tebou zam?v?.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance Fakescroll_Addon(C_Item)
{
	name = "Kus pap?ru";
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
	name = "Instrukce na sekeru bandit?";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseAxtAnleitung;
	scemeName = "MAP";
	description = name;
	text[0] = "N?vod na vytvo?en? lehk? a ostr? sekery";
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
	Doc_PrintLine(nDocID,0,"Sekera bandit?");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Jednoru?n? sekera");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ten, kdo zn? alespo? z?klady kov?n? zbran?, m??e vytvo?it speci?ln? sekeru");
	Doc_PrintLines(nDocID,0,"Budeme pot?ebovat 2 kusy ocele.");
	Doc_PrintLines(nDocID,0,"Pak jeden kus rudy a t?i sady zub? z vlka, ch?apavce nebo ne?eho podobn?ho.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ruda a zuby se skuj? do jednoho kusu na kovadlin?.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tato sekera se lehce ovl?d? a d?l? solidn? zran?n?.");
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_Addon_SUMMONANCIENTGHOST(C_Item)
{
	name = "Quarhodronovo vyvol?n?";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseSummonAncientGhost;
	scemeName = "MAP";
	description = name;
	text[0] = "S touto formul? m??e? vyvolat Quarhodrona";
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
	name = "Zapomenut? ?dol? Stavitel?";
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
	name = "N?kres M?s?c";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ITWR_SCROLL_BOW1.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_bow1;
	scemeName = "MAP";
	description = "M?s?c";
	text[2] = "N?kres na v?robu luku";
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
			B_LogEntry(TOPIC_BOWHUNT,"M?s?c - 1x D?evo na v?robu, 1x T?tiva, 2x prisky?ice");
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
	Doc_PrintLines(nDocID,0,"V?roba luku M?s?c:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 1x D?evo na v?robu, 1x T?tiva, 2x prisky?ice");
	Doc_PrintLines(nDocID,0,"Na v?robn? st?eln?ch zbran? pou?ijeme material a postupujem podle n?kresu. ");
	Doc_PrintLines(nDocID,0,"T?tiva a d?evo na v?robu jde vyrobyt na truhla?sk? d?ln?");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutn? se nau?it Z?KLADN? v?robu loveck?ch zbran?. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_BOW2(C_Item)
{
	name = "N?kres V?tr";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ITWR_SCROLL_BOW1.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_bow2;
	scemeName = "MAP";
	description = "V?tr";
	text[2] = "N?kres na v?robu luku";
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
			B_LogEntry(TOPIC_BOWHUNT,"V?tr - 1x D?evo na v?robu, 1x T?tiva, 2x zuby.");
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
	Doc_PrintLines(nDocID,0,"V?roba luku V?tr:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 1x D?evo na v?robu, 1x T?tiva, 2x zuby");
	Doc_PrintLines(nDocID,0,"Na v?robn? st?eln?ch zbran? pou?ijeme material a postupujem podle n?kresu. ");
	Doc_PrintLines(nDocID,0,"T?tiva a d?evo na v?robu jde vyrobyt na truhla?sk? d?ln?");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutn? se nau?it Z?KLADN? v?robu loveck?ch zbran?. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_BOW3(C_Item)
{
	name = "N?kres Ultim?tum";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ITWR_SCROLL_BOW2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_bow3;
	scemeName = "MAP";
	description = "Ultim?tum";
	text[2] = "N?kres na v?robu luku";
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
			B_LogEntry(TOPIC_BOWHUNT,"Ultimatum - 2x D?evo na v?robu, 2x T?tiva, 3x Perla.");
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
	Doc_PrintLines(nDocID,0,"V?roba luku Ultim?tum:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 2x D?evo na v?robu, 2x T?tiva, 3x Perla");
	Doc_PrintLines(nDocID,0,"Na v?robn? st?eln?ch zbran? pou?ijeme material a postupujem podle n?kresu. ");
	Doc_PrintLines(nDocID,0,"T?tiva a d?evo na v?robu jde vyrobyt na truhla?sk? d?ln?");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutn? se nau?it POKRO?ILOU v?robu loveck?ch zbran?. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_BOW4(C_Item)
{
	name = "N?kres ?svit";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ITWR_SCROLL_BOW2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_bow4;
	scemeName = "MAP";
	description = "?svit";
	text[2] = "N?kres na v?robu luku";
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
			B_LogEntry(TOPIC_BOWHUNT,"?svit - 2x D?evo na v?robu, 2x T?tiva, 1x ?ern? perla.");
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
	Doc_PrintLines(nDocID,0,"V?roba luku ?svit:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 2x D?evo na v?robu, 2x T?tiva, 1x ?ern? perla");
	Doc_PrintLines(nDocID,0,"Na v?robn? st?eln?ch zbran? pou?ijeme material a postupujem podle n?kresu. ");
	Doc_PrintLines(nDocID,0,"T?tiva a d?evo na v?robu jde vyrobyt na truhla?sk? d?ln?");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutn? se nau?it POKRO?ILOU v?robu loveck?ch zbran?. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_BOW5(C_Item)
{
	name = "N?kres Tich? smrt";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 600;
	visual = "ITWR_SCROLL_BOW3.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_bow5;
	scemeName = "MAP";
	description = "Tich? smrt";
	text[2] = "N?kres na v?robu luku";
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
			B_LogEntry(TOPIC_BOWHUNT,"Tich? smrt - 3x D?evo na v?robu, 3x T?tiva, 1x Smaragd.");
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
	Doc_PrintLines(nDocID,0,"V?roba luku Tich? smrt:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 3x D?evo na v?robu, 3x T?tiva, 1x Smaragd");
	Doc_PrintLines(nDocID,0,"Na v?robn? st?eln?ch zbran? pou?ijeme material a postupujem podle n?kresu. ");
	Doc_PrintLines(nDocID,0,"T?tiva a d?evo na v?robu jde vyrobyt na truhla?sk? d?ln?");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutn? se nau?it MISTROVSKOU v?robu loveck?ch zbran?. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_BOW6(C_Item)
{
	name = "N?kres Soumrak";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 600;
	visual = "ITWR_SCROLL_BOW3.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_bow6;
	scemeName = "MAP";
	description = "Soumrak";
	text[2] = "N?kres na v?robu luku";
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
			B_LogEntry(TOPIC_BOWHUNT,"Soumrak - 3x D?evo na v?robu, 3x T?tiva, 1x Rub?n.");
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
	Doc_PrintLines(nDocID,0,"V?roba luku Soumrak:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 3x D?evo na v?robu, 3x T?tiva, 1x Rub?n");
	Doc_PrintLines(nDocID,0,"Na v?robn? st?eln?ch zbran? pou?ijeme material a postupujem podle n?kresu. ");
	Doc_PrintLines(nDocID,0,"T?tiva a d?evo na v?robu jde vyrobyt na truhla?sk? d?ln?");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutn? se nau?it MISTROVSKOU v?robu loveck?ch zbran?. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_CROSSBOW1(C_Item)
{
	name = "N?kres Ochrana";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ITWR_SCROLL_CROS1.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_crossbow1;
	scemeName = "MAP";
	description = "Ochrana";
	text[2] = "N?kres na v?robu Ku?e";
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
			B_LogEntry(TOPIC_BOWHUNT,"Ochrana - 1x D?evo na v?robu, 1x T?tiva, 2x Dr?py.");
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
	Doc_PrintLines(nDocID,0,"V?roba ku?e Ochrana:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 1x D?evo na v?robu, 1x T?tiva, 2x Dr?py");
	Doc_PrintLines(nDocID,0,"Na v?robn? st?eln?ch zbran? pou?ijeme material a postupujem podle n?kresu. ");
	Doc_PrintLines(nDocID,0,"T?tiva a d?evo na v?robu jde vyrobyt na truhla?sk? d?ln?");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutn? se nau?it Z?KLADN? v?robu loveck?ch zbran?. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_CROSSBOW2(C_Item)
{
	name = "N?kres Z?blesk";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ITWR_SCROLL_CROS2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_crossbow2;
	scemeName = "MAP";
	description = "Z?blesk";
	text[2] = "N?kres na v?robu Ku?e";
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
			B_LogEntry(TOPIC_BOWHUNT,"Z?blesk - 2x D?evo na v?robu, 2x T?tiva, 2x ?ern? perla.");
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
	Doc_PrintLines(nDocID,0,"V?roba ku?e Z?blesk:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 2x D?evo na v?robu, 2x T?tiva, 2x ?ern? perla");
	Doc_PrintLines(nDocID,0,"Na v?robn? st?eln?ch zbran? pou?ijeme material a postupujem podle n?kresu. ");
	Doc_PrintLines(nDocID,0,"T?tiva a d?evo na v?robu jde vyrobyt na truhla?sk? d?ln?");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutn? se nau?it POKRO?ILOU v?robu loveck?ch zbran?. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_CROSSBOW3(C_Item)
{
	name = "N?kres Ni?itel";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 600;
	visual = "ITWR_SCROLL_CROS3.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_crossbow3;
	scemeName = "MAP";
	description = "Ni?itel";
	text[2] = "N?kres na v?robu Ku?e";
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
			B_LogEntry(TOPIC_BOWHUNT,"Ni?itel - 3x D?evo na v?robu, 3x T?tiva, 2x Diamant.");
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
	Doc_PrintLines(nDocID,0,"V?roba ku?e Ni?itel:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Material: 3x D?evo na v?robu, 3x T?tiva, 2x Diamant");
	Doc_PrintLines(nDocID,0,"Na v?robn? st?eln?ch zbran? pou?ijeme material a postupujem podle n?kresu. ");
	Doc_PrintLines(nDocID,0,"T?tiva a d?evo na v?robu jde vyrobyt na truhla?sk? d?ln?");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutn? se nau?it MISTROVSKOU v?robu loveck?ch zbran?. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

