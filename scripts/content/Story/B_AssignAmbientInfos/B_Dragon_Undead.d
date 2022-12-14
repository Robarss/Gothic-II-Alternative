
func void B_Dragon_Undead_Bla()
{
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_00");	//Ano k?mo? Taky m?? origin?ln? verzi?
};


instance DIA_Dragon_Undead_Exit(C_Info)
{
	npc = Dragon_Undead;
	nr = 999;
	condition = DIA_Dragon_Undead_Exit_Condition;
	information = DIA_Dragon_Undead_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Undead_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Undead_Exit_Info()
{
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};


instance DIA_Dragon_Undead_Hello(C_Info)
{
	npc = Dragon_Undead;
	nr = 5;
	condition = DIA_Dragon_Undead_Hello_Condition;
	information = DIA_Dragon_Undead_Hello_Info;
	important = TRUE;
};


func int DIA_Dragon_Undead_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Undead_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_00");	//Tak jsi m? kone?n? na?el. Na tv?j p??jezd jsem ?ekal tak dlouho.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_15_01");	//Tak pokra?uj. P?esta? p?edst?rat, ?e sis to takhle p?edstavoval.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_02");	//(hlu?n? sm?ch) Co ty m??e? v?d?t o m?ch z?m?rech?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_03");	//Neposlal jsem snad P?tra?e, aby t? vl?kali mn? do cesty?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_04");	//Nenech?val jsem ti snad stopy o m? existenci tak na o??ch, ?es je nemohl minout?
	if((hero.guild == GIL_DJG) && (DragonEggCounter >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_05");	//A nep?isp?la snad dra?? vejce k vylep?en? tv? zbroje, tak?e ses sem mohl snadn?ji dostat?
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_06");	//Nebyli snad znovuzrozen? paladinov? dostate?n?m d?vodem, abys za?al p?trat po skryt? moci v pozad??
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_07");	//Nebylo snad proklet? tv?ho rodu dostate?n?m d?vodem, abys za?al p?trat po skryt? s?le v pozad??
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_08");	//A? se bude? vykrucovat, jak chce?, tohle v?echno pop??t nem??e?.
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_01");	//Je pouze JEDNA v?c, jen? nebyla p?edem d?na!
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_02");	//Zabil jsi jednoho z m?ch slu?ebn?k?. Byl vyvolen nosit dr?p.
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_03");	//A jak vid?m, nyn? ho nese? ty. Zato zem?e?!
	Info_AddChoice(DIA_Dragon_Undead_Hello,"Dost ?e??.",DIA_Dragon_Undead_Hello_attack);
	Info_AddChoice(DIA_Dragon_Undead_Hello,"Jm?nem koho vede? sv? ta?en? proti lidstvu?",DIA_Dragon_Undead_Hello_Auftraggeber);
	Info_AddChoice(DIA_Dragon_Undead_Hello,"Pro? jsi tady?",DIA_Dragon_Undead_Hello_warum);
	Info_AddChoice(DIA_Dragon_Undead_Hello,"Kdo jsi?",DIA_Dragon_Undead_Hello_wer);
	B_LogEntry(TOPIC_HallenVonIrdorath,"Hlavn?m nep??telem je nemrtv? drak. Mus?m ho zab?t, je?t? ne? z tohoto zatracen?ho ostrova odlet?.");
};

func void DIA_Dragon_Undead_Hello_wer()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_01");	//(sm?ch) Je?t? po??d se na to mus?? pt?t? Zeptej se s?m sebe, ty hlup?ku. V??, kdo jsem.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_02");	//Nenesu ??dn? jm?no. Stejn? jako ty.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_03");	//M?j stvo?itel mi dal bo?skou moc. Stejn? jako ty v sob? nos?? moc sv?ho boha.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_04");	//M?m osudem je zni?en? sv?ta.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_05");	//Stejn? jako je tv?j osud p?edur?en bez?honnost? a poctivost? paladin?.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_06");	//Stejn? jako tv? ruka p?in??? jistou smrt, drakobij?e.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_07");	//Stejn? jako je tv?m ?d?lem k?zat Innosovo u?en?, m?gu ohn?.
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_08");	//Nec?t?? to pouto, co n?s spolu poj?? Ano, ty v??, kdo jsem.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_09");	//(rozzloben?) Ne. To nem??e b?t pravda. Xardas v?dycky ??kal...
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_10");	//Xardas je slab? a ty pro m? nep?edstavuje? ??dnou hrozbu. Pro tebe je ct?, ?e ses se mnou mohl v?bec setkat.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_11");	//Tak stoj? ps?no. Nade?el ?as p?ijmout sv?j osud.
};

func void DIA_Dragon_Undead_Hello_warum()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_warum_15_00");	//Pro? jsi tady?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_01");	//Bo?stv?, je? mi bylo prop?j?eno, m? podn?tilo k tomu, abych tento sv?t utopil v ?ece n?sil?.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_02");	//Jedin? tehdy, a? posledn? pevnost poctiv?ch padne, si budu moci odpo?inout.
};

func void DIA_Dragon_Undead_Hello_Auftraggeber()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_Auftraggeber_15_00");	//Jm?nem koho vede? sv? ta?en? proti lidstvu?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_01");	//M?m p?nem je samotn? Tma. Zn?? ji. Sly??? jej? vol?n?.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_03");	//M? vojska povstanou v jej?m jm?nu a zahal? sv?t do temnoty.
};

func void DIA_Dragon_Undead_Hello_attack()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_attack_15_00");	//Dost ?e??. Za?enu t? zp?t pod kamen?, z pod n?ho? ses vyhrabal, ty zr?do.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_01");	//(sm?ch) Je?t? nejsi schopen m? porazit. Od m?ho c?le m? u? d?l? jen nepatrn? chvilka.
	if(C_ScHasEquippedBeliarsWeapon() || C_ScHasReadiedBeliarsWeapon() || C_SCHasBeliarsRune())
	{
		AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_04");	//Opravdu si mysl??, ?e m? m??e? zranit t?mto dr?pem? (sm?ch)
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_02");	//Tv? kosti mi poslou?? k tomu, abych mohl nechat v?t zhoubn? v?tr smrti nad povrchem cel?ho sv?ta.
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};

