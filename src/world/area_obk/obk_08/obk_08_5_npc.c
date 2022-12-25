#include "obk_08.h"

enum {
    RING_STATE_0        = 0,
    RING_STATE_1        = 1,
    RING_STATE_10       = 10,
    RING_STATE_11       = 11,
    RING_STATE_12       = 12,
    RING_STATE_13       = 13,
    RING_STATE_14       = 14,
    RING_STATE_15       = 15,
    RING_STATE_100      = 100,
};

#include "world/common/npc/Boo.inc.c"

API_CALLABLE(N(func_802408A0_BD4110)) {
    Npc* npc = get_npc_unsafe(script->owner2.npcID);
    s32* ptr = heap_malloc(sizeof(s32)); // todo what is this

    npc->blur.any = ptr;
    *ptr = NULL;
    npc->planarFlyDist = 125.0f;
    npc->yaw = 0.0f;
    npc->pos.x = 0.0f;
    npc->pos.y = -875.0f;
    npc->pos.z = 0.0f;
    npc->duration = 60;
    script->functionTemp[1] = RING_STATE_0;
    return ApiStatus_DONE2;
}

void N(func_80240920_BD4190)(Npc* npc) {
    if (npc->yaw > 340.0f || npc->yaw < 20.0f) {
        npc->renderMode = RENDER_MODE_ALPHATEST;
        npc->unk_A2 = 0;
        func_8003D624(npc, FOLD_TYPE_NONE, 0, 0, 0, 0, npc->unk_A2);
    } else {
        npc->renderMode = RENDER_MODE_SURFACE_XLU_LAYER2;
        func_8003D624(npc, FOLD_TYPE_7, gPlayerStatusPtr->alpha1, 0, 0, 0, npc->unk_A2);
        npc->unk_9A = 255;
    }
}

void func_802409E8_BD4258(void) {
    N(func_80240920_BD4190)(get_npc_unsafe(NPC_KeepAwayBoo1));
    N(func_80240920_BD4190)(get_npc_unsafe(NPC_KeepAwayBoo2));
    N(func_80240920_BD4190)(get_npc_unsafe(NPC_KeepAwayBoo3));
    N(func_80240920_BD4190)(get_npc_unsafe(NPC_KeepAwayBoo4));
    N(func_80240920_BD4190)(get_npc_unsafe(NPC_KeepAwayBoo5));
    N(func_80240920_BD4190)(get_npc_unsafe(NPC_KeepAwayBoo6));
    N(func_80240920_BD4190)(get_npc_unsafe(NPC_KeepAwayBoo7));
    N(func_80240920_BD4190)(get_npc_unsafe(NPC_KeepAwayBoo8));
}

void func_80240A7C_BD42EC(void) {
    get_npc_unsafe(NPC_KeepAwayBoo1)->unk_A2 = 0;
    get_npc_unsafe(NPC_KeepAwayBoo2)->unk_A2 = 0;
    get_npc_unsafe(NPC_KeepAwayBoo3)->unk_A2 = 0;
    get_npc_unsafe(NPC_KeepAwayBoo4)->unk_A2 = 0;
    get_npc_unsafe(NPC_KeepAwayBoo5)->unk_A2 = 0;
    get_npc_unsafe(NPC_KeepAwayBoo6)->unk_A2 = 0;
    get_npc_unsafe(NPC_KeepAwayBoo7)->unk_A2 = 0;
    get_npc_unsafe(NPC_KeepAwayBoo8)->unk_A2 = 0;
}

API_CALLABLE(N(func_80240AF0_BD4360)) {
    Npc* npc = get_npc_unsafe(script->owner2.npcID);
    s32* temp_s2 = npc->blur.any;
    s32 temp_v0;

    switch (script->functionTemp[1]) {
        case 0:
            temp_v0 = evt_get_variable(script, AF_OBK_08);
            if (temp_v0 == 1) {
                *temp_s2 = temp_v0;
                script->functionTemp[1] = 10;
            }
            break;
        case 10:
            npc->yaw = clamp_angle(npc->yaw + 2.0f);
            npc->duration--;
            if (npc->duration == 0) {
                script->functionTemp[1] = 11;
            }
            break;
        case 11:
            if (npc->pos.y <= -920.0f) {
                func_802409E8_BD4258();
            }
            npc->yaw = clamp_angle(npc->yaw + 2.0f);
            npc->pos.y -= 0.5f;
            if (npc->pos.y <= -988.0f) {
                evt_set_variable(script, MV_Unk_01, 1);
                func_80240A7C_BD42EC();
                script->functionTemp[1] = 12;
            }
            break;
        case 12:
            if (evt_get_variable(script, MV_Unk_02) == 1) {
                script->functionTemp[1] = 13;
            }
            npc->yaw = clamp_angle(npc->yaw + 2.0f);
            break;
        case 13:
            if (evt_get_variable(script, MV_Unk_02) == 0) {
                script->functionTemp[1] = 12;
            }
            break;
    }
    return ApiStatus_DONE2;
}

API_CALLABLE(N(func_80240CA0_BD4510)) {
    Npc* npc = get_npc_unsafe(script->owner2.npcID);

    npc->blur.any = get_npc_unsafe(NPC_Boo_01); // TODO what is this?
    script->functionTemp[2] = script->owner2.npcID * 45;
    npc->flags |= NPC_FLAG_40000;
    script->functionTemp[1] = RING_STATE_0;
    return ApiStatus_DONE2;
}

API_CALLABLE(func_80240D10_BD4580);
INCLUDE_ASM(s32, "world/area_obk/obk_08/BD4110", func_80240D10_BD4580);

EvtScript N(EVS_NpcIdle_Boo_01) = {
    EVT_WAIT(4)
    EVT_CALL(N(func_802408A0_BD4110))
    EVT_LABEL(10)
        EVT_CALL(N(func_80240AF0_BD4360))
        EVT_WAIT(1)
        EVT_GOTO(10)
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcIdle_KeepAwayBoo) = {
    EVT_WAIT(5)
    EVT_CALL(N(func_80240CA0_BD4510))
    EVT_LABEL(10)
        EVT_CALL(func_80240D10_BD4580)
        EVT_WAIT(1)
        EVT_GOTO(10)
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_OnHit_KeepAwayBoo) = {
    EVT_IF_EQ(MV_ThrowTargetNpc, LVar0)
        EVT_SET(MV_KeepAwayResult, KEEP_AWAY_RIGHT)
    EVT_ELSE
        EVT_SET(MV_KeepAwayResult, KEEP_AWAY_WRONG)
    EVT_END_IF
    EVT_THREAD
        EVT_CALL(SetNpcAnimation, NPC_SELF, ANIM_Boo_Cower)
        EVT_WAIT(30)
        EVT_CALL(SetNpcAnimation, NPC_SELF, ANIM_Boo_Idle)
    EVT_END_THREAD
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcHit_KeepAwayBoo1) = {
    EVT_CALL(GetOwnerEncounterTrigger, LVar0)
    EVT_SWITCH(LVar0)
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_HAMMER)
            EVT_SET(LVar0, NPC_KeepAwayBoo1)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_JUMP)
            EVT_SET(LVar0, NPC_KeepAwayBoo1)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_END_CASE_GROUP
    EVT_END_SWITCH
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcHit_KeepAwayBoo2) = {
    EVT_CALL(GetOwnerEncounterTrigger, LVar0)
    EVT_SWITCH(LVar0)
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_HAMMER)
            EVT_SET(LVar0, NPC_KeepAwayBoo2)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_JUMP)
            EVT_SET(LVar0, NPC_KeepAwayBoo2)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_END_CASE_GROUP
    EVT_END_SWITCH
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcHit_KeepAwayBoo3) = {
    EVT_CALL(GetOwnerEncounterTrigger, LVar0)
    EVT_SWITCH(LVar0)
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_HAMMER)
            EVT_SET(LVar0, NPC_KeepAwayBoo3)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_JUMP)
            EVT_SET(LVar0, NPC_KeepAwayBoo3)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_END_CASE_GROUP
    EVT_END_SWITCH
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcHit_KeepAwayBoo4) = {
    EVT_CALL(GetOwnerEncounterTrigger, LVar0)
    EVT_SWITCH(LVar0)
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_HAMMER)
            EVT_SET(LVar0, NPC_KeepAwayBoo4)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_JUMP)
            EVT_SET(LVar0, NPC_KeepAwayBoo4)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_END_CASE_GROUP
    EVT_END_SWITCH
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcHit_KeepAwayBoo5) = {
    EVT_CALL(GetOwnerEncounterTrigger, LVar0)
    EVT_SWITCH(LVar0)
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_HAMMER)
            EVT_SET(LVar0, NPC_KeepAwayBoo5)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_JUMP)
            EVT_SET(LVar0, NPC_KeepAwayBoo5)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_END_CASE_GROUP
    EVT_END_SWITCH
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcHit_KeepAwayBoo6) = {
    EVT_CALL(GetOwnerEncounterTrigger, LVar0)
    EVT_SWITCH(LVar0)
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_HAMMER)
            EVT_SET(LVar0, NPC_KeepAwayBoo6)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_JUMP)
            EVT_SET(LVar0, NPC_KeepAwayBoo6)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_END_CASE_GROUP
    EVT_END_SWITCH
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcHit_KeepAwayBoo7) = {
    EVT_CALL(GetOwnerEncounterTrigger, LVar0)
    EVT_SWITCH(LVar0)
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_HAMMER)
            EVT_SET(LVar0, NPC_KeepAwayBoo7)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_JUMP)
            EVT_SET(LVar0, NPC_KeepAwayBoo7)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_END_CASE_GROUP
    EVT_END_SWITCH
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcHit_KeepAwayBoo8) = {
    EVT_CALL(GetOwnerEncounterTrigger, LVar0)
    EVT_SWITCH(LVar0)
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_HAMMER)
            EVT_SET(LVar0, NPC_KeepAwayBoo8)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_CASE_EQ(ENCOUNTER_TRIGGER_JUMP)
            EVT_SET(LVar0, NPC_KeepAwayBoo8)
            EVT_EXEC_WAIT(N(EVS_OnHit_KeepAwayBoo))
        EVT_END_CASE_GROUP
    EVT_END_SWITCH
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcInit_Boo_01) = {
    EVT_CALL(BindNpcIdle, NPC_SELF, EVT_PTR(N(EVS_NpcIdle_Boo_01)))
    EVT_IF_GE(GB_StoryProgress, STORY_CH3_GOT_RECORD)
        EVT_CALL(RemoveNpc, NPC_SELF)
    EVT_END_IF
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcInit_KeepAwayBoo1) = {
    EVT_CALL(BindNpcIdle, NPC_SELF, EVT_PTR(N(EVS_NpcIdle_KeepAwayBoo)))
    EVT_CALL(BindNpcHit, NPC_SELF, EVT_PTR(N(EVS_NpcHit_KeepAwayBoo1)))
    EVT_IF_GE(GB_StoryProgress, STORY_CH3_GOT_RECORD)
        EVT_CALL(RemoveNpc, NPC_SELF)
    EVT_END_IF
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcInit_KeepAwayBoo2) = {
    EVT_CALL(BindNpcIdle, NPC_SELF, EVT_PTR(N(EVS_NpcIdle_KeepAwayBoo)))
    EVT_CALL(BindNpcHit, NPC_SELF, EVT_PTR(N(EVS_NpcHit_KeepAwayBoo2)))
    EVT_IF_GE(GB_StoryProgress, STORY_CH3_GOT_RECORD)
        EVT_CALL(RemoveNpc, NPC_SELF)
    EVT_END_IF
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcInit_KeepAwayBoo3) = {
    EVT_CALL(BindNpcIdle, NPC_SELF, EVT_PTR(N(EVS_NpcIdle_KeepAwayBoo)))
    EVT_CALL(BindNpcHit, NPC_SELF, EVT_PTR(N(EVS_NpcHit_KeepAwayBoo3)))
    EVT_IF_GE(GB_StoryProgress, STORY_CH3_GOT_RECORD)
        EVT_CALL(RemoveNpc, NPC_SELF)
    EVT_END_IF
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcInit_KeepAwayBoo4) = {
    EVT_CALL(BindNpcIdle, NPC_SELF, EVT_PTR(N(EVS_NpcIdle_KeepAwayBoo)))
    EVT_CALL(BindNpcHit, NPC_SELF, EVT_PTR(N(EVS_NpcHit_KeepAwayBoo4)))
    EVT_IF_GE(GB_StoryProgress, STORY_CH3_GOT_RECORD)
        EVT_CALL(RemoveNpc, NPC_SELF)
    EVT_END_IF
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcInit_KeepAwayBoo5) = {
    EVT_CALL(BindNpcIdle, NPC_SELF, EVT_PTR(N(EVS_NpcIdle_KeepAwayBoo)))
    EVT_CALL(BindNpcHit, NPC_SELF, EVT_PTR(N(EVS_NpcHit_KeepAwayBoo5)))
    EVT_IF_GE(GB_StoryProgress, STORY_CH3_GOT_RECORD)
        EVT_CALL(RemoveNpc, NPC_SELF)
    EVT_END_IF
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcInit_KeepAwayBoo6) = {
    EVT_CALL(BindNpcIdle, NPC_SELF, EVT_PTR(N(EVS_NpcIdle_KeepAwayBoo)))
    EVT_CALL(BindNpcHit, NPC_SELF, EVT_PTR(N(EVS_NpcHit_KeepAwayBoo6)))
    EVT_IF_GE(GB_StoryProgress, STORY_CH3_GOT_RECORD)
        EVT_CALL(RemoveNpc, NPC_SELF)
    EVT_END_IF
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcInit_KeepAwayBoo7) = {
    EVT_CALL(BindNpcIdle, NPC_SELF, EVT_PTR(N(EVS_NpcIdle_KeepAwayBoo)))
    EVT_CALL(BindNpcHit, NPC_SELF, EVT_PTR(N(EVS_NpcHit_KeepAwayBoo7)))
    EVT_IF_GE(GB_StoryProgress, STORY_CH3_GOT_RECORD)
        EVT_CALL(RemoveNpc, NPC_SELF)
    EVT_END_IF
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcInit_KeepAwayBoo8) = {
    EVT_CALL(BindNpcIdle, NPC_SELF, EVT_PTR(N(EVS_NpcIdle_KeepAwayBoo)))
    EVT_CALL(BindNpcHit, NPC_SELF, EVT_PTR(N(EVS_NpcHit_KeepAwayBoo8)))
    EVT_IF_GE(GB_StoryProgress, STORY_CH3_GOT_RECORD)
        EVT_CALL(RemoveNpc, NPC_SELF)
    EVT_END_IF
    EVT_RETURN
    EVT_END
};

StaticNpc N(NpcData_Boo_01) = {
    .id = NPC_Boo_01,
    .settings = &N(NpcSettings_Boo),
    .pos = { NPC_DISPOSE_LOCATION },
    .yaw = 0,
    .flags = ENEMY_FLAGS_100 | ENEMY_FLAGS_200 | ENEMY_FLAGS_400 | ENEMY_FLAGS_800 | ENEMY_FLAGS_100000 | ENEMY_FLAGS_200000 | ENEMY_FLAGS_IGNORE_TOUCH | ENEMY_FLAGS_10000000,
    .init = &N(EVS_NpcInit_Boo_01),
    .drops = BOO_DROPS,
    .animations = NORMAL_BOO_ANIMS,
};

StaticNpc N(NpcData_KeepAwayBoo1) = {
    .id = NPC_KeepAwayBoo1,
    .settings = &N(NpcSettings_Boo),
    .pos = { -268.0f, 52.0f, 0.0f },
    .yaw = 0,
    .flags = ENEMY_FLAGS_100 | ENEMY_FLAGS_200 | ENEMY_FLAGS_400 | ENEMY_FLAGS_800 | ENEMY_FLAGS_100000 | ENEMY_FLAGS_200000 | ENEMY_FLAGS_IGNORE_TOUCH | ENEMY_FLAGS_10000000,
    .init = &N(EVS_NpcInit_KeepAwayBoo1),
    .drops = BOO_DROPS,
    .animations = NORMAL_BOO_ANIMS,
};

StaticNpc N(NpcData_KeepAwayBoo2) = {
    .id = NPC_KeepAwayBoo2,
    .settings = &N(NpcSettings_Boo),
    .pos = { -268.0f, 52.0f, 0.0f },
    .yaw = 0,
    .flags = ENEMY_FLAGS_100 | ENEMY_FLAGS_200 | ENEMY_FLAGS_400 | ENEMY_FLAGS_800 | ENEMY_FLAGS_100000 | ENEMY_FLAGS_200000 | ENEMY_FLAGS_IGNORE_TOUCH | ENEMY_FLAGS_10000000,
    .init = &N(EVS_NpcInit_KeepAwayBoo2),
    .drops = BOO_DROPS,
    .animations = NORMAL_BOO_ANIMS,
};

StaticNpc N(NpcData_KeepAwayBoo3) = {
    .id = NPC_KeepAwayBoo3,
    .settings = &N(NpcSettings_Boo),
    .pos = { -268.0f, 52.0f, 0.0f },
    .yaw = 0,
    .flags = ENEMY_FLAGS_100 | ENEMY_FLAGS_200 | ENEMY_FLAGS_400 | ENEMY_FLAGS_800 | ENEMY_FLAGS_100000 | ENEMY_FLAGS_200000 | ENEMY_FLAGS_IGNORE_TOUCH | ENEMY_FLAGS_10000000,
    .init = &N(EVS_NpcInit_KeepAwayBoo3),
    .drops = BOO_DROPS,
    .animations = NORMAL_BOO_ANIMS,
};

StaticNpc N(NpcData_KeepAwayBoo4) = {
    .id = NPC_KeepAwayBoo4,
    .settings = &N(NpcSettings_Boo),
    .pos = { -268.0f, 52.0f, 0.0f },
    .yaw = 0,
    .flags = ENEMY_FLAGS_100 | ENEMY_FLAGS_200 | ENEMY_FLAGS_400 | ENEMY_FLAGS_800 | ENEMY_FLAGS_100000 | ENEMY_FLAGS_200000 | ENEMY_FLAGS_IGNORE_TOUCH | ENEMY_FLAGS_10000000,
    .init = &N(EVS_NpcInit_KeepAwayBoo4),
    .drops = BOO_DROPS,
    .animations = NORMAL_BOO_ANIMS,
};

StaticNpc N(NpcData_KeepAwayBoo5) = {
    .id = NPC_KeepAwayBoo5,
    .settings = &N(NpcSettings_Boo),
    .pos = { -268.0f, 52.0f, 0.0f },
    .yaw = 0,
    .flags = ENEMY_FLAGS_100 | ENEMY_FLAGS_200 | ENEMY_FLAGS_400 | ENEMY_FLAGS_800 | ENEMY_FLAGS_100000 | ENEMY_FLAGS_200000 | ENEMY_FLAGS_IGNORE_TOUCH | ENEMY_FLAGS_10000000,
    .init = &N(EVS_NpcInit_KeepAwayBoo5),
    .drops = BOO_DROPS,
    .animations = NORMAL_BOO_ANIMS,
};

StaticNpc N(NpcData_KeepAwayBoo6) = {
    .id = NPC_KeepAwayBoo6,
    .settings = &N(NpcSettings_Boo),
    .pos = { -268.0f, 52.0f, 0.0f },
    .yaw = 0,
    .flags = ENEMY_FLAGS_100 | ENEMY_FLAGS_200 | ENEMY_FLAGS_400 | ENEMY_FLAGS_800 | ENEMY_FLAGS_100000 | ENEMY_FLAGS_200000 | ENEMY_FLAGS_IGNORE_TOUCH | ENEMY_FLAGS_10000000,
    .init = &N(EVS_NpcInit_KeepAwayBoo6),
    .drops = BOO_DROPS,
    .animations = NORMAL_BOO_ANIMS,
};

StaticNpc N(NpcData_KeepAwayBoo7) = {
    .id = NPC_KeepAwayBoo7,
    .settings = &N(NpcSettings_Boo),
    .pos = { -268.0f, 52.0f, 0.0f },
    .yaw = 0,
    .flags = ENEMY_FLAGS_100 | ENEMY_FLAGS_200 | ENEMY_FLAGS_400 | ENEMY_FLAGS_800 | ENEMY_FLAGS_100000 | ENEMY_FLAGS_200000 | ENEMY_FLAGS_IGNORE_TOUCH | ENEMY_FLAGS_10000000,
    .init = &N(EVS_NpcInit_KeepAwayBoo7),
    .drops = BOO_DROPS,
    .animations = NORMAL_BOO_ANIMS,
};

StaticNpc N(NpcData_KeepAwayBoo8) = {
    .id = NPC_KeepAwayBoo8,
    .settings = &N(NpcSettings_Boo),
    .pos = { -268.0f, 52.0f, 0.0f },
    .yaw = 0,
    .flags = ENEMY_FLAGS_100 | ENEMY_FLAGS_200 | ENEMY_FLAGS_400 | ENEMY_FLAGS_800 | ENEMY_FLAGS_100000 | ENEMY_FLAGS_200000 | ENEMY_FLAGS_IGNORE_TOUCH | ENEMY_FLAGS_10000000,
    .init = &N(EVS_NpcInit_KeepAwayBoo8),
    .drops = BOO_DROPS,
    .animations = NORMAL_BOO_ANIMS,
};

#define TRAFFIC_BOO_START_Y 40.0f
#define TRAFFIC_BOO_START_Z -430.0f
#include "../TrafficBoos.inc.c"

EvtScript N(EVS_NpcInit_TrafficBoo1) = {
    EVT_CALL(BindNpcIdle, NPC_SELF, EVT_PTR(N(EVS_NpcIdle_TrafficBoo)))
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcInit_TrafficBoo2) = {
    EVT_CALL(BindNpcIdle, NPC_SELF, EVT_PTR(N(EVS_NpcIdle_TrafficBoo)))
    EVT_RETURN
    EVT_END
};

StaticNpc N(NpcData_TrafficBoos)[] = {
    {
        .id = NPC_TrafficBoo1,
        .settings = &N(NpcSettings_Boo),
        .pos = { 523.0f, -139.0f, 193.0f },
        .yaw = 0,
        .flags = ENEMY_FLAGS_1 | ENEMY_FLAGS_100 | ENEMY_FLAGS_200 | ENEMY_FLAGS_400 | ENEMY_FLAGS_800,
        .init = &N(EVS_NpcInit_TrafficBoo1),
        .drops = BOO_DROPS,
        .animations = NORMAL_BOO_ANIMS,
    },
    {
        .id = NPC_TrafficBoo2,
        .settings = &N(NpcSettings_Boo),
        .pos = { 473.0f, -122.0f, 247.0f },
        .yaw = 0,
        .flags = ENEMY_FLAGS_1 | ENEMY_FLAGS_100 | ENEMY_FLAGS_200 | ENEMY_FLAGS_400 | ENEMY_FLAGS_800,
        .init = &N(EVS_NpcInit_TrafficBoo2),
        .drops = BOO_DROPS,
        .animations = NORMAL_BOO_ANIMS,
    },
};

EvtScript N(EVS_NpcInit_Boo_12) = {
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_NpcInit_Boo_13) = {
    EVT_CALL(SetNpcFlagBits, NPC_SELF, NPC_FLAG_HAS_SHADOW, TRUE)
    EVT_RETURN
    EVT_END
};

StaticNpc N(NpcData_KeepAwayExtras)[] = {
    {
        .id = NPC_LeaderBoo,
        .settings = &N(NpcSettings_Boo),
        .pos = { NPC_DISPOSE_LOCATION },
        .yaw = 0,
        .flags = ENEMY_FLAGS_1 | ENEMY_FLAGS_100 | ENEMY_FLAGS_200 | ENEMY_FLAGS_400 | ENEMY_FLAGS_800,
        .init = &N(EVS_NpcInit_Boo_12),
        .drops = BOO_DROPS,
        .animations = NORMAL_BOO_ANIMS,
    },
    {
        .id = NPC_DummyBoo,
        .settings = &N(NpcSettings_Boo),
        .pos = { NPC_DISPOSE_LOCATION },
        .yaw = 0,
        .flags = ENEMY_FLAGS_1 | ENEMY_FLAGS_100 | ENEMY_FLAGS_200 | ENEMY_FLAGS_400 | ENEMY_FLAGS_800 | ENEMY_FLAGS_4000,
        .init = &N(EVS_NpcInit_Boo_13),
        .drops = BOO_DROPS,
        .animations = NORMAL_BOO_ANIMS,
    },
};

NpcGroupList N(DefaultNPCs) = {
    NPC_GROUP(N(NpcData_Boo_01)),
    NPC_GROUP(N(NpcData_KeepAwayBoo1)),
    NPC_GROUP(N(NpcData_KeepAwayBoo2)),
    NPC_GROUP(N(NpcData_KeepAwayBoo3)),
    NPC_GROUP(N(NpcData_KeepAwayBoo4)),
    NPC_GROUP(N(NpcData_KeepAwayBoo5)),
    NPC_GROUP(N(NpcData_KeepAwayBoo6)),
    NPC_GROUP(N(NpcData_KeepAwayBoo7)),
    NPC_GROUP(N(NpcData_KeepAwayBoo8)),
    NPC_GROUP(N(NpcData_TrafficBoos)),
    NPC_GROUP(N(NpcData_KeepAwayExtras)),
    {}
};