
var int EnterDI_Kapitel6;

func void enter_di_firsttime_trigger()
{
	if(Npc_HasItems(hero,ItKe_Ship_Levelchange_MIS))
	{
		Npc_RemoveInvItems(hero,ItKe_Ship_Levelchange_MIS,1);
	};
	if(hero.attribute[ATR_DEXTERITY] < 15)
	{
		Wld_InsertItem(ItPo_Perm_DEX,"FP_ITEM_DI_ENTER_05");
	};
	if(EnterDI_Kapitel6 == FALSE)
	{
		if(hero.guild == GIL_PAL)
		{
			CreateInvItems(Archol,ItRu_PalDestroyEvil,1);
		};
		Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_12");
		if(Npc_HasItems(hero,ItMi_InnosEye_MIS) == FALSE)
		{
			if(Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) == FALSE)
			{
				Wld_InsertItem(ItSe_XardasNotfallBeutel_MIS,"FP_ITEM_SHIP_12");
				SC_InnosEyeVergessen_DI = TRUE;
				B_LogEntry(TOPIC_HallenVonIrdorath,"Dnes v noci jsem měl zvláštní sen. Hovořil se mnou Xardas a žádal mě, abych na lodi přistoupil k alchymistické koloně a něco odtamtud sebral. Bylo to velmi zvláštní, protože jsem večer před tím kupodivu vůbec nic nepil. Možná to bylo delirium ze střízlivosti.");
			};
			Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_06");
			if(((Npc_HasItems(hero,ItAt_IcedragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_RockdragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_FiredragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_SwampdragonHeart) >= 1)) == FALSE)
			{
				CreateInvItems(OrkElite_AntiPaladinOrkOberst_DI,ItAt_RockdragonHeart,1);
			};
		};
		Log_CreateTopic(TOPIC_MyCrew,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MyCrew,LOG_Running);
		if(JorgenIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Kapitán Jorgen zůstane na lodi, dokud se nevrátím.");
		};
		if(TorlofIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Kapitán Torlof zůstane na lodi a bude ji hlídat po celou dobu, co budu na ostrově. Přitom za ním mohu zajít, pokud si budu chtít zvýšit obratnost či sílu.");
		};
		if(JackIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Kapitán Jack zůstane tady na lodi, dokud se nevrátím. Je sice trochu vyděšený, ale doufám, že se časem uklidní. Potřebuji ho.");
		};
		if(Lee_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Lee se po dobu mé nepřítomnosti dohlédne na loď. Také se u něj mohu zastavit, budu-li si chtít vylepšit schopnosti boje jednoručními a obouručními zbraněmi.");
		};
		if(MiltenNW_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"S Miltenovou pomocí si mohu zvýšit své zásoby many.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"Milten mi krom toho může vysvětlit, jak vyrobit runy.");
			};
		};
		if(Lester_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Mám pocit, že na tom podivném ostrově se Lesterův stav ještě zhoršil.");
		};
		if(Mario_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Mario je nějaký divný. Po celou dobu plavby jen sedí na zádi a nepromluví ani slovo. ");
		};
		if(Wolf_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Wolf mě naučí střílet z luku a kuše.");
		};
		if(Vatras_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Vatras se uchýlil do kajuty pro mágy. Může mě uzdravit a prozradit mi spoustu věcí ohledně míchání lektvarů. ");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"Vatras mi také může pomoci s postupem do dalšího magického kruhu. ");
			};
		};
		if(Bennet_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Bennet mě naučí kovařině, když ho o to požádám.");
		};
		if(Diego_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Když nebudu vědět, kudy kam, mohu se obrátit na Diega, který mě navíc zásobí střelivem. Také mě naučí páčit zámky a střílet z luku a kuše.");
		};
		if(Gorn_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Gorn během našeho výletu nezahálel a teď na loď dohlédne. Myslím, že když mu ji svěřím, bude v dobrých rukou.");
			Log_AddEntry(TOPIC_MyCrew,"S Gornovou pomocí se mohu zlepšit v ovládání obouručních zbraní.");
		};
		if(Lares_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Lares mi slíbil, že mě naučí plížení a jednoručnímu boji. Krom toho si u něj mohu vylepšit obratnost.");
		};
		if(Biff_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Biff je tak hamižný, až to bolí. Nebude snadné na něj dohlížet.");
		};
		if(Angar_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Angar nemá nikde stání. Mám pocit, že se zanedlouho pustí do boje sám se sebou.");
		};
		if(Girion_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Girion se drží pořádně stranou - jeho trpělivost je obdivuhodná. A přitom je to bojový cvičitel. To se mi na konci může hodit.");
		};
		IntroduceChapter(KapWechsel_6,KapWechsel_6_Text,"chapter6.tga","chapter_01.wav",6000);
		EnterDI_Kapitel6 = TRUE;
	};
};

