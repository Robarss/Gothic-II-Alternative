
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
		Doc_PrintLine(nDocID,0,"D?l");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Crimson: 79 zlat?ch nuget? p?ed?no a p?etaveno.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Scatty: zbo?? zaplaceno, 250 zlat?ch p?ed?no");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Garaz: 6 zlat?ch nuget? p?ed?no");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"V?echny str??e: 9 zlat?ch nuget? p?ed?no");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"T?bor:  ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ravenovy str??e: 25 zlat?ch nuget?");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Finn: 60 zlat?ch nuget?");
		Doc_PrintLines(nDocID,1,"Lennar: 40 zlat?ch nuget?");
		Doc_PrintLines(nDocID,1,"Emilio: 50 zlat?ch nuget?");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Ostatn?: 20 zlat?ch nuget?");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Huno, Fisk, Snaf: z?le?? na zbo??");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Lovci: V?dce by to m?l vy??dit! Franco 7 zlat?ch p?ed?no");
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
		Doc_PrintLines(StPl_nDocID,0,"...pouze STR??CI SMRTI mohou povolat p?edky. ");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Jejich absence jim velice chyb?la. Beze p?edk? nemohli v?st lidi.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"L??ITEL? byli posl?ni, aby zape?etili port?l a zni?ili kl??. Jen Adanos v?, co se s nimi stalo a jestli se jim ?kol poda?il.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"V?LE?NICK? KASTA byla zni?ena hn?vem Adanose. Srdce star?ho v?le?n?ka bylo zlomeno. ");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Pouze zbyl? KN?ZI d?vali lidem nad?ji na znovuzrozen? jejich m?sta. ");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Ale my, U?ENCI, jsme ji? znali ho?kou pravdu. JHARKENDAR padl a byl poh?ben ?asem.");
		Doc_PrintLines(StPl_nDocID,1,"");
	}
	else if(BookstandMayaArt == 2)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"RHADEMES byl poh?ben v Adanosov? chr?mu, ale moc me?e zlomena nebyla.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Jeho moc byla p??li? velk?. Zab?jen? a ni?en? na ulic?ch by nikdy neskon?ilo.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"A tak a? samotn? Adonos v?e ukon?il sv?m hn?vem. Jedinou vlnou zatopil cel? m?sto.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Jen n?kolik vy???ch budov z?stalo, v?e ostatn? bylo zni?eno.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"N?kolik lid? katastrofu p?e?ilo, jen?e nem?li u? dostatek sil, aby dok?zali obnovit sl?vu a velikost m?sta. ");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"A tak byl osud JHARKENDARU zpe?et?n.");
		if(SC_Knows_WeaponInAdanosTempel == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			SC_Knows_WeaponInAdanosTempel = TRUE;
		};
	}
	else if(BookstandMayaArt == 3)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"St??? QUARHODRONA ho d?lalo ji? neschopn?ho v?st arm?du. A tak kn??? vyu?ili toho, ?e spad? pod jejich moc. ");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"A p?ik?zali mu, aby se vzdal sv?ho titulu v?dce a odevzdal me?.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Rada p?ti cht?la jednat o jeho n?sledn?kovi, ale V?le?nick? kasta s t?m nesouhlasila. ");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"RHADEMES, syn QUARHODRON byl navrhnut a zvolen V?le?nickou kastou, jako?to nov? v?dce.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"QUARHODRON d?v??oval sv?mu rodu, a tak souhlasil a odstoupil.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Odevzdal sv?j me? sv?mu synovi v nad?ji, ?e mu bude vl?dnout stejn? pevn?, jako on.");
	}
	else if(BookstandMayaArt == 4)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"RHADEMES byl ale slab?. V?le me?e ho p?emohla a on se stal jen jeho loutkou.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"RHADEMES v moci me?e p?inesl vlastn?m lidem zk?zu a utrpen?. Ani l??itel? nebyli schopni utrpen? zastavit ?i zm?rnit.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Me? brzy pochopil, ?e jsou lid? p??li? slab? na to, aby se mu dok?zali postavit.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Jen od na?ich p?edk?, hrozilo nebezpe??.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Proto RHADEMES nechal v?echny Str??ce smrti popravit, co? znamenalo konec v?ech nad?j?.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Mnoho Str??c? smrti zem?elo, kdy? se pokou?eli povolat na?e p?edky na pomoc JHARKENDARU.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"V?lka zu?ila v ulic?ch, a tak se l??itel? rozhodli zape?etit vstup do ?dol?.");
	}
	else if(BookstandMayaArt == 5)
	{
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"QUARHODRON, nejvy??? kn?z KHARDIMON a j? jsme se v t?chto s?n?ch sna?ili p??j?t na to, jak porazit RHADEMESE a 'me?'.");
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"QUARHODRON a KHARDIMON se domn?vali, ?e nejlep?? bude zni?it RHADEMESE v bitv?, spole?n?mi silami. Ale J? znal s?lu me?e p??li? dob?e, abych s t?mto n?vrhem souhlasil.");
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Pou?il jsem sv?ho pr?va k zam?tnut? ostatn?ch dvou a nam?sto toho jsem se rozhodl oklamat RHADAMESE lst?.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"QUARHODRON uposlechl moji radu a  nechal se uzav??t v Adanosov? chr?mu. Pak poslal pro sv?ho syna a po??dal ho o pomoc.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Hn?v jeho syna nabral takov? velikosti, ?e rozbo?il chr?m, aby osvobodil sv?ho otce.  ");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Uv?domil si p??li? pozd?, jak? jsou na?e skute?n? pl?ny");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"QUARHODRON zape?etil chr?m p?ede v?emi a RHADEMES byl v pasti. Uv?zn?n na v??nost i s me?em.");
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

