
func void B_AssignDementorTalk_Ritual()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	if(MIS_SCKnowsInnosEyeIsBroken == FALSE)
	{
		AI_Output(self,other,"DIA_RitualDementor_19_00");	//Přišel jsi příliš pozdě.
		AI_Output(self,other,"DIA_RitualDementor_19_01");	//Zničili jsme Innosovo oko, takže už nemůže nikdy znovu nabýt svou moc.
		AI_Output(self,other,"DIA_RitualDementor_19_02");	//Teď ti ukážeme pošetilost tvých snah postavit se Pánu.
		MIS_SCKnowsInnosEyeIsBroken = TRUE;
		B_LogEntry(TOPIC_INNOSEYE,"Ti hrozní chlapi mi pěkně hrají na nervy - zničili Innosovo oko a já teď netuším, jak je spravit.");
		B_LogEntry(TOPIC_TraitorPedro,"Našel jsem Innosovo oko, ale po Pedrovi nebylo nikde ani vidu, ani slechu. Dal se do spolku s těmi černými mágy.");
		B_GivePlayerXP(XP_SCKnowsInnosEyeIsBroken);
	}
	else
	{
		randy = Hlp_Random(4);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_03");	//Teď pocítíš naši moc.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_04");	//Za Pána.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_05");	//Nemůžeš se skrýt.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_06");	//Zabijeme tě.
		};
	};
	Npc_SetRefuseTalk(self,30);
};

func void B_AssignDementorTalk_Ritual_Exit()
{
	Wld_StopEffect("DEMENTOR_FX");
	B_SCIsObsessed(self);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	Snd_Play("MFX_FEAR_CAST");
	self.aivar[AIV_EnemyOverride] = FALSE;
};

