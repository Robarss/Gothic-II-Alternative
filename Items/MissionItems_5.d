
instance ItWr_XardasLetterToOpenBook_MIS(C_Item)
{
	name = "Dopis od Xardase";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasLetterToOpenBook;
	scemeName = "MAP";
	description = name;
};


func void Use_XardasLetterToOpenBook()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Domníval jsem se, že zdrojem všeho zla jsou draci v Hornickém údolí.");
	Doc_PrintLines(nDocID,0,"Mílil jsem se.");
	Doc_PrintLines(nDocID,0,"Jestli se všechno stane tak, jak čekám, ");
	Doc_PrintLines(nDocID,0,"měl bys teď vyhledat Irdoratské síně. ");
	Doc_PrintLines(nDocID,0,"Potřebné informace najdeš v knize, kterou jsi donesl Pyrokarovi.");
	Doc_PrintLines(nDocID,0,"Měl jsem vědět, proč se po ní Pátrači tolik");
	Doc_PrintLines(nDocID,0,"pídili.");
	Doc_PrintLines(nDocID,0,"Musíš ji získat zpět!");
	Doc_PrintLines(nDocID,0,"Otevřeš ji slovy 'XARAK BENDARDO'. Nikomu je neprozraď!");
	Doc_PrintLines(nDocID,0,"Teď půjdu zařídit ještě další důležité věci.");
	Doc_PrintLines(nDocID,0,"V tomto závěrečném úkolu už ti má pomoc nebude nic platná. Pouze ty můžeš zničit zdroj všeho zla.");
	Doc_PrintLines(nDocID,0,"Ještě se ale uvidíme! ");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                             Xardas.");
	Doc_Show(nDocID);
	if(MIS_Xardas_SCCanOpenIrdorathBook == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"V tomto dopise mi Xardas sdělil, jaká slova otevřou knihu Irdoratské síně.");
	};
	MIS_Xardas_SCCanOpenIrdorathBook = TRUE;
};


instance ItKe_MonastarySecretLibrary_Mis(C_Item)
{
	name = "Klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "z knihy 'Irdoratské síně'.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_HallsofIrdorath_Mis(C_Item)
{
	name = "Irdoratské síně";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_HallsofIrdorath;
};


func void Use_HallsofIrdorath()
{
	if(MIS_Xardas_SCCanOpenIrdorathBook == TRUE)
	{
		B_Say(self,self,"$SCOPENSIRDORATHBOOK");
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		CreateInvItems(hero,ItWr_HallsofIrdorath_Open_Mis,1);
		CreateInvItems(hero,ItKe_MonastarySecretLibrary_Mis,1);
		CreateInvItems(hero,ItWr_UseLampIdiot_Mis,1);
		Print(PRINT_IrdorathBookHiddenKey);
		B_GivePlayerXP(XP_HallsofIrdorathIsOpen);
		ItWr_HallsofIrdorathIsOpen = TRUE;
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Podařilo se mi otevřít Xardasovu knihu. Obsahovala tajnou zprávu a podivný klíč. Kdo ví, na co dalšího ještě v klášterním sklepení narazím.");
	}
	else
	{
		CreateInvItems(hero,ItWr_HallsofIrdorath_Mis,1);
		Print(PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};


instance ItWr_HallsofIrdorath_Open_Mis(C_Item)
{
	name = "Irdoratské síně";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_HallsofIrdorath_Open;
};


func void Use_HallsofIrdorath_Open()
{
	var int nDocID;
	if(ItWr_SCReadsHallsofIrdorath == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Přečetl jsem Xardasovu knihu. Zmiňovala se o tajné knihovně, která se musí nacházet někde v klášterním sklepení.");
	};
	ItWr_SCReadsHallsofIrdorath = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_MAGE_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_MAGE_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...a tak se do knihovny nyní dá vejít pouze tajnými dveřmi. Ochráním tím své záznamy o Beliarových chrámech. ");
	Doc_PrintLines(nDocID,0,"Kdyby se o nich dozvěděli moji bratři, určitě by je všechny zničili, zaslepenci!");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Ne, vědí pouze to, že tyto chrámy kdysi existovaly.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jen tak pro jistotu jsem pověřil několik služebníků, aby střežili knihovnu.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Tento klíč otvírá poslední dveře.");
	Doc_Show(nDocID);
};


instance ItWr_XardasSeamapBook_Mis(C_Item)
{
	name = "Zaprášená kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_XardasSeamapBook_Mis;
};


func void Use_XardasSeamapBook_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_BROWN_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_BROWN_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...nyní vím jistě, že tou stavbou jsou Irdoratské síně. Leží na ostrově nedaleko khorinisského přístavu. Už je tedy jasné, proč měl Beliar o rudné doly takový zájem...");
	Doc_PrintLines(nDocID,0,"");
	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(nDocID,0,"...čím jsou silnější, tím lépe mu budou sloužit jako nemrtví otroci. Takto proměnění paladinové pak dokáží každému válečníkovi pořádně zatopit. Jeden z nich mi padl do rukou a já jen doufám, že si ostatní nevšimnou, že se dostal až sem dolů...");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"...ten paladin snad nereaguje vůbec na nic. Jeho zbroj i ostatní věci jsem uložil v zadní komoře, jejíž dveře lze otevřít pouze zevnitř. Vytvořil jsem teleportační runu, která mě tam v případě potřeby přenese. Instrukce pro Vyvoleného jsem ukryl v almanachu...");
	};
	if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(nDocID,0,"...znamení hovoří jasně! Až přijde Vyvolený, bude potřebovat veškerou pomoc, kterou mu budeme moci poskytnout. Beliar už je příliš silný. Snad se Vyvolený dostane k cenným artefaktům, které ukryji právě tady. Domnívám se totiž, že bude pocházet přímo z našich řad, ");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"a právě proto jsem příslušné pokyny zapsal do almanachu.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"...teď už to vím jistě - nesmíme se jen tak vzdát. Až Beliar získá potřebnou moc, povstane a bude se snažit ovládnout svět. Musím vyhledat Vyvoleného, jinak je náš osud zpečetěn.");
	};
	if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(nDocID,0,"...přijde válka, válka pro všechny věřící na světě. Ale zdá se mi, že znamení dokážu rozpoznat jenom já - všichni ostatní si jich vůbec nevšímají. Já však vím, že se objeví Vyvolený a jeho příchod bude věstit válku. Válku tak starou jako sám čas - konec je však už na obzoru.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"Nebudu tu jen tak stát s rukama v klíně a pozorovat, jak ostatní berou osud světa do svých rukou!");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"...prostudoval jsem staré spisy a zjistil, jak vytvořit legendární zbraně dávných dračích pánů. Zatím ale nemám ponětí, jak získat potřebné ingredience - pro jistotu jsem ale návod také zaznamenal do almanachu. Kdo ví, jaké hrůzy nám budoucnost přinese - možná se budeme muset postavit i lítým drakům.");
	};
	Doc_Show(nDocID);
};


instance ItWr_UseLampIdiot_Mis(C_Item)
{
	name = "Zmačkaný dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItWr_UseLampIdiot_Mis;
	scemeName = "MAP";
	description = name;
	text[0] = "z knihy 'Irdoratské síně'";
};


func void UseItWr_UseLampIdiot_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"     Lampa vnáší světlo ");
	Doc_PrintLine(nDocID,0,"     do podzemí");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Seamap_Irdorath(C_Item)
{
	name = "Námořní mapa k Irdoratskému ostrovu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Seamap_Irdorath;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Seamap_Irdorath()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(nDocID);
	if((MIS_ShipIsFree == FALSE) && (Kapitel < 6))
	{
		B_Say(self,self,"$IRDORATHTHEREYOUARE");
	};
	if(MIS_SCKnowsWayToIrdorath == FALSE)
	{
		Log_CreateTopic(Topic_Ship,LOG_MISSION);
		Log_SetTopicStatus(Topic_Ship,LOG_Running);
		B_LogEntry(Topic_Ship,"Nejspíš se budu muset dostat na podivný ostrov našich nepřátel. K tomu budu ale potřebovat loď, posádku a kapitána.");
		B_GivePlayerXP(XP_SCKnowsWayToIrdorath);
	};
	MIS_SCKnowsWayToIrdorath = TRUE;
};


instance ITWr_ForgedShipLetter_MIS(C_Item)
{
	name = "Lodní lístek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseITWr_ForgedShipLetter_MIS;
	scemeName = "MAP";
	description = name;
	text[3] = "Plná moc";
	text[4] = "pro paladinskou loď.";
};


func void UseITWr_ForgedShipLetter_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0," Plná moc");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0," Držitel tohoto dokumentu");
	Doc_PrintLine(nDocID,0," se může po neomezenou dobu");
	Doc_PrintLine(nDocID,0," na královské válečné galéře volně plavit,");
	Doc_PrintLine(nDocID,0," kamkoliv uzná za vhodné.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Královská pečeť");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITKE_OC_MAINGATE_MIS(C_Item)
{
	name = "Klíč od věže hlavní brány";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Ship_Levelchange_MIS(C_Item)
{
	name = "Klíč od kapitánské kajuty";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItPo_PotionOfDeath_01_Mis(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "innosbottle.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Innosovy slzy";
	text[1] = "???";
	count[1] = Mana_Essenz;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_PotionOfDeath()
{
	if(hero.guild == GIL_KDF)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		Npc_ChangeAttribute(self,ATR_STRENGTH,5);
		self.aivar[REAL_STRENGTH] = self.aivar[REAL_STRENGTH] + 5;
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
		self.aivar[REAL_DEXTERITY] = self.aivar[REAL_DEXTERITY] + 5;
		PrintScreen(PRINT_LearnSTR5,-1,45,FONT_Screen,2);
		PrintScreen(PRINT_LearnDEX5,-1,55,FONT_Screen,2);
		PrintScreen(PRINT_FullyHealed,-1,65,FONT_Screen,2);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",Time_Speed);
	}
	else
	{
		AI_Wait(hero,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};


instance ItPo_PotionOfDeath_02_Mis(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "innosbottle.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Innosovy slzy";
	text[1] = "Tento lektvar propůjčí mágům ohně zvláštní moc.";
	text[2] = "Tomu, kdo k nim nepatří, přinese leda smrt.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAm_AmulettOfDeath_Mis(C_Item)
{
	name = "Božská Innosova aura.";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ITAM_IMARAH_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_AmulettOfDeath_Mis;
	on_unequip = UnEquip_ItAm_AmulettOfDeath_Mis;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Božská Innosova aura.";
	text[2] = "Tento amulet chrání svého nositele ";
	text[3] = "před veškerou újmou.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] += 30;
	self.protection[PROT_BLUNT] += 30;
	self.protection[PROT_POINT] += 30;
	self.protection[PROT_FIRE] += 30;
	self.protection[PROT_MAGIC] += 30;
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void UnEquip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] -= 30;
	self.protection[PROT_BLUNT] -= 30;
	self.protection[PROT_POINT] -= 30;
	self.protection[PROT_FIRE] -= 30;
	self.protection[PROT_MAGIC] -= 30;
};


instance ItPo_HealRandolph_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealRandolph;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "";
	description = "Lék proti závislosti";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
};


func void Use_HealRandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};


instance ITWR_ARMORBLESS(C_Item)
{
	name = "Zvláštní stará stránka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_seamap_armorbless;
	description = name;
	text[0] = "Zajímavé, ale neumím to přečíst, možná bude vědět Pyrokar.";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_seamap_armorbless()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Blessarmor.tga",0);
	Doc_Show(nDocID);
};


instance ITWR_ARMORBLESS2(C_Item)
{
	name = "Modlitba zbroje";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_armorbless2;
	scemeName = "MAP";
	description = name;
	text[3] = "Přeložená modlitba od Pyrokara";
	text[4] = "S tímto mohu posvětit zbroj paladina.";
};


func void useitwr_armorbless2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0," Ve jménu Innose");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0," modlitba");
	Doc_PrintLine(nDocID,0," modlitba");
	Doc_PrintLine(nDocID,0," modlitba,");
	Doc_PrintLine(nDocID,0," modlitba.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0," Nezapomenout jakoukoli svěcenou vodu od Innose!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

