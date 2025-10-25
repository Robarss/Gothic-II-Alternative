
func int C_NpcIsGateGuard (var C_NPC slf)
{
    if (Npc_IsInState(slf, ZS_Guard_Passage) || Npc_IsInState(slf, zs_stand_halberd))
    {
        return TRUE;
    };

    return FALSE;
};