
instance ItSe_XardasNotfallBeutel_MIS(C_Item)
{
	name = "Velmi zvláštní měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_XardasNotfallBeutel;
	description = name;
	text[0] = "";
	text[1] = "Tato brašna obsahuje";
	text[2] = "něco tvrdého ";
	text[3] = "a jakýsi dokument.";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_XardasNotfallBeutel()
{
	var string concatText;
	CreateInvItems(hero,ItWr_XardasErmahnungFuerIdioten_MIS,1);
	CreateInvItems(hero,ItMi_InnosEye_Discharged_Mis,1);
	concatText = ConcatStrings("2",PRINT_ItemsErhalten);
	Print(concatText);
};


instance ItWr_XardasErmahnungFuerIdioten_MIS(C_Item)
{
	name = "Varovný dopis od Xardase";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasErmahnungFuerIdioten;
	scemeName = "MAP";
	description = name;
};


func void Use_XardasErmahnungFuerIdioten()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Můj mladý chráněnče, hluboce jsi mě zklamal. Jak to, že jsi vystoupil z lodi a přitom si nevzal Innosovo oko?");
	Doc_PrintLines(nDocID,0,"Mohu jen doufat, že tahle nedbalost byla jen přechodná. Jinak svět nikdy nezbavíš zla a já tě budu muset za tvou hloupost náležitě potrestat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                      Xardas");
	Doc_Show(nDocID);
};


instance ItWr_Krypta_Garon(C_Item)
{
	name = "Starý dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Krypta_Garon;
	scemeName = "MAP";
	description = name;
	text[3] = "psaný roztřesenou rukou.";
};


func void Use_Krypta_Garon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Selhal jsem. Nadarmo jsem se snažil vést Inubida cestou dobra. ");
	Doc_PrintLines(nDocID,0,"Nejdřív jsem myslel, že jsem mrtev, ale pak jsem se přesvědčil, že v Ivanových starých kostech přece jen nějaká síla zůstala. ");
	Doc_PrintLines(nDocID,0,"Inubis vstal z mrtvých. Nyní se chce pomstít prastarému řádu paladinů, kteří ho kdysi přemohli.");
	Doc_PrintLines(nDocID,0,"Provází ho spousta přisluhovačů. Nechápu, jak se mohl chrabrý vojevůdce jako on obrátit k takovému zlu. ");
	Doc_PrintLines(nDocID,0,"V téhle kryptě jsem objevil jeho hrobku, ale nevím jistě, zda budu moci svůj nález někdy ohlásit. Proto píši tyto řádky v naději, že je třeba někdy někdo najde.");
	Doc_PrintLines(nDocID,0,"Dej si pozor. Z duší spravedlivých povstal mocný nepřítel a Inubis není poslední.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Nechť Innos spasí naše duše.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                                 Ivan");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItKe_OrkKnastDI_MIS(C_Item)
{
	name = "Klíč skřetího plukovníka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_EVT_UNDEAD_01(C_Item)
{
	name = "Archolův klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = name;
};

instance ItKe_EVT_UNDEAD_02(C_Item)
{
	name = "Klíč hlavního klíčníka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name = "Klíč od komnaty černého mága";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name = "Svitek černého mága";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_LastDoorToUndeadDrgDI_MIS;
	scemeName = "MAP";
	description = name;
};


func void Use_ItWr_LastDoorToUndeadDrgDI_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"KHADOSH ");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"EMEM KADAR");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Oko moci ti osvítí cestu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	B_LogEntry(TOPIC_HallenVonIrdorath,"Na svitku černého mága jsou uvedena slova KHADOSH EMEM KADAR. Zní to jako nějaké zaklínadlo, ale já nemám ani ponětí, k čemu mohlo sloužit. A co je vůbec to oko moci?");
};


instance ItKe_ChestMasterDementor_MIS(C_Item)
{
	name = "Klíč od truhlice černého mága";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Rezept_MegaDrink_MIS(C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RezeptFuerMegaTrank;
	scemeName = "MAP";
	description = name;
};


func void Use_RezeptFuerMegaTrank()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Znovu jsem oživil pradávné umění. Obávám se ale, že Feodaron tím nebude nijak nadšen.");
	Doc_PrintLines(nDocID,0,"Prostě to znamená, že bych v laboratoři musel z veškerého jeho potomstva namíchat lektvar. Kdyby pořád neseděl na vejcích jako nějaká slepice, možná bych to i vyzkoušel. Jenomže takhle ho musím přece jenom respektovat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Embarla Firgasto:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"10 dračích vajec, jedna mletá černá perla a špetka síry.");
	Doc_PrintLines(nDocID,0,"Tekutinu pak přiveď do varu a za stálého míchání prožeň destilačním aparátem.");
	Doc_PrintLines(nDocID,0,"Elixír užívej opatrně, neb má silné vedlejší účinky a může narušit veškerou manu.");
	Doc_Show(nDocID);
	PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
};


instance ItWr_Diary_BlackNovice_MIS(C_Item)
{
	name = "Deník";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Diary_BlackNovice;
};


func void Use_Diary_BlackNovice()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Už tu čekám na předvolání víc jak 36 dní. Začínám pochybovat, že se to vůbec kdy stane, ale prostě jen plním rozkazy. Tady se ke mně ale chovají jako k nějaké staré služce.");
	Doc_PrintLines(nDocID,0,"Klíčník mi nařídil, abych zavřel všechny závory, ale ještě jsem se k tomu vůbec nedostal. Když to takhle půjde dál, bude moci branou procházet každý otrapa.");
	Doc_PrintLines(nDocID,0,"Je to ostuda, že si nepamatuji správné kombinace. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Před lety jsem se vplížil do velké síně, ale jen těžko jsem mohl čekat, že uvidím Pána. Zajímalo by mě, jestli by mě k němu pustili, kdybych se stal jedním z nich.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Včera jsem zkusil štěstí, ale opustilo mě v komnatách se dvěma pákami, ještě než jsem mohl ve správném pořadí stisknout tři spínače v západním křídle. Ten pes ty komnaty zamkl! Zítra se pokusím nějak zmocnit jeho klíče.");
	Doc_Show(nDocID);
	B_LogEntry(TOPIC_HallenVonIrdorath,"Deník novice černého mága se zmiňuje o komnatách s pákami, klíčníkovi, kombinaci spínačů a dalších věcech. Měl bych si to zapamatovat - jednou by se mi to mohlo hodit.");
};


instance ItWr_ZugBruecke_MIS(C_Item)
{
	name = "Starý dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ZugBruecke;
	scemeName = "MAP";
	description = name;
};


func void Use_ZugBruecke()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"   Poslední varování!");
	Doc_SetMargins(nDocID,-1,50,50,70,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je mi fuk, jestli ten most přejdete z druhé strany, nebo ne. Pro mě za mě můžete všichni shnít v pekle!");
	Doc_PrintLines(nDocID,0,"Dokud jsem tu pánem já, ten most zůstane tak, jak je. A jestli ještě někoho přistihnu, jak se snaží šípem strefit do některého spínače a dostat se na druhou stranu, vlastnoručně ho pověsím na nejbližším stromě!");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                      Archol");
	Doc_Show(nDocID);
};


instance ItMi_PowerEye(C_Item)
{
	name = "Oko moci";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_FIRESWORDBLACK";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

