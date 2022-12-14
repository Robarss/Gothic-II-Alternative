
instance ItSe_XardasNotfallBeutel_MIS(C_Item)
{
	name = "Velmi zvl??tn? m??ec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_XardasNotfallBeutel;
	description = name;
	text[0] = "";
	text[1] = "Tato bra?na obsahuje";
	text[2] = "n?co tvrd?ho ";
	text[3] = "a jak?si dokument.";
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
	name = "Varovn? dopis od Xardase";
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
	Doc_PrintLines(nDocID,0,"M?j mlad? chr?n?n?e, hluboce jsi m? zklamal. Jak to, ?e jsi vystoupil z lodi a p?itom si nevzal Innosovo oko?");
	Doc_PrintLines(nDocID,0,"Mohu jen doufat, ?e tahle nedbalost byla jen p?echodn?. Jinak sv?t nikdy nezbav?? zla a j? t? budu muset za tvou hloupost n?le?it? potrestat.");
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
	name = "Star? dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Krypta_Garon;
	scemeName = "MAP";
	description = name;
	text[3] = "psan? rozt?esenou rukou.";
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
	Doc_PrintLines(nDocID,0,"Selhal jsem. Nadarmo jsem se sna?il v?st Inubida cestou dobra. ");
	Doc_PrintLines(nDocID,0,"Nejd??v jsem myslel, ?e jsem mrtev, ale pak jsem se p?esv?d?il, ?e v Ivanov?ch star?ch kostech p?ece jen n?jak? s?la z?stala. ");
	Doc_PrintLines(nDocID,0,"Inubis vstal z mrtv?ch. Nyn? se chce pomst?t prastar?mu ??du paladin?, kte?? ho kdysi p?emohli.");
	Doc_PrintLines(nDocID,0,"Prov?z? ho spousta p?isluhova??. Nech?pu, jak se mohl chrabr? vojev?dce jako on obr?tit k takov?mu zlu. ");
	Doc_PrintLines(nDocID,0,"V t?hle krypt? jsem objevil jeho hrobku, ale nev?m jist?, zda budu moci sv?j n?lez n?kdy ohl?sit. Proto p??i tyto ??dky v nad?ji, ?e je t?eba n?kdy n?kdo najde.");
	Doc_PrintLines(nDocID,0,"Dej si pozor. Z du?? spravedliv?ch povstal mocn? nep??tel a Inubis nen? posledn?.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Nech? Innos spas? na?e du?e.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                                 Ivan");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItKe_OrkKnastDI_MIS(C_Item)
{
	name = "Kl?? sk?et?ho plukovn?ka";
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
	name = "Archol?v kl??";
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
	name = "Kl?? hlavn?ho kl??n?ka";
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
	name = "Kl?? od komnaty ?ern?ho m?ga";
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
	name = "Svitek ?ern?ho m?ga";
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
	Doc_PrintLine(nDocID,0,"Oko moci ti osv?t? cestu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	B_LogEntry(TOPIC_HallenVonIrdorath,"Na svitku ?ern?ho m?ga jsou uvedena slova KHADOSH EMEM KADAR. Zn? to jako n?jak? zakl?nadlo, ale j? nem?m ani pon?t?, k ?emu mohlo slou?it. A co je v?bec to oko moci?");
};


instance ItKe_ChestMasterDementor_MIS(C_Item)
{
	name = "Kl?? od truhlice ?ern?ho m?ga";
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
	Doc_PrintLines(nDocID,0,"Znovu jsem o?ivil prad?vn? um?n?. Ob?v?m se ale, ?e Feodaron t?m nebude nijak nad?en.");
	Doc_PrintLines(nDocID,0,"Prost? to znamen?, ?e bych v laborato?i musel z ve?ker?ho jeho potomstva nam?chat lektvar. Kdyby po??d nesed?l na vejc?ch jako n?jak? slepice, mo?n? bych to i vyzkou?el. Jenom?e takhle ho mus?m p?ece jenom respektovat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Embarla Firgasto:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"10 dra??ch vajec, jedna mlet? ?ern? perla a ?petka s?ry.");
	Doc_PrintLines(nDocID,0,"Tekutinu pak p?ive? do varu a za st?l?ho m?ch?n? pro?e? destila?n?m apar?tem.");
	Doc_PrintLines(nDocID,0,"Elix?r u??vej opatrn?, neb m? siln? vedlej?? ??inky a m??e naru?it ve?kerou manu.");
	Doc_Show(nDocID);
	PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
};


instance ItWr_Diary_BlackNovice_MIS(C_Item)
{
	name = "Den?k";
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
	Doc_PrintLines(nDocID,0,"U? tu ?ek?m na p?edvol?n? v?c jak 36 dn?. Za??n?m pochybovat, ?e se to v?bec kdy stane, ale prost? jen pln?m rozkazy. Tady se ke mn? ale chovaj? jako k n?jak? star? slu?ce.");
	Doc_PrintLines(nDocID,0,"Kl??n?k mi na??dil, abych zav?el v?echny z?vory, ale je?t? jsem se k tomu v?bec nedostal. Kdy? to takhle p?jde d?l, bude moci branou proch?zet ka?d? otrapa.");
	Doc_PrintLines(nDocID,0,"Je to ostuda, ?e si nepamatuji spr?vn? kombinace. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"P?ed lety jsem se vpl??il do velk? s?n?, ale jen t??ko jsem mohl ?ekat, ?e uvid?m P?na. Zaj?malo by m?, jestli by m? k n?mu pustili, kdybych se stal jedn?m z nich.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"V?era jsem zkusil ?t?st?, ale opustilo m? v komnat?ch se dv?ma p?kami, je?t? ne? jsem mohl ve spr?vn?m po?ad? stisknout t?i sp?na?e v z?padn?m k??dle. Ten pes ty komnaty zamkl! Z?tra se pokus?m n?jak zmocnit jeho kl??e.");
	Doc_Show(nDocID);
	B_LogEntry(TOPIC_HallenVonIrdorath,"Den?k novice ?ern?ho m?ga se zmi?uje o komnat?ch s p?kami, kl??n?kovi, kombinaci sp?na?? a dal??ch v?cech. M?l bych si to zapamatovat - jednou by se mi to mohlo hodit.");
};


instance ItWr_ZugBruecke_MIS(C_Item)
{
	name = "Star? dopis";
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
	Doc_PrintLine(nDocID,0,"   Posledn? varov?n?!");
	Doc_SetMargins(nDocID,-1,50,50,70,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je mi fuk, jestli ten most p?ejdete z druh? strany, nebo ne. Pro m? za m? m??ete v?ichni shn?t v pekle!");
	Doc_PrintLines(nDocID,0,"Dokud jsem tu p?nem j?, ten most z?stane tak, jak je. A jestli je?t? n?koho p?istihnu, jak se sna?? ??pem strefit do n?kter?ho sp?na?e a dostat se na druhou stranu, vlastnoru?n? ho pov?s?m na nejbli???m strom?!");
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

