.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_80218A50_4313F0
/* 4313F0 80218A50 27BDFFA8 */  addiu     $sp, $sp, -0x58
/* 4313F4 80218A54 AFB40020 */  sw        $s4, 0x20($sp)
/* 4313F8 80218A58 0080A02D */  daddu     $s4, $a0, $zero
/* 4313FC 80218A5C AFBF0024 */  sw        $ra, 0x24($sp)
/* 431400 80218A60 AFB3001C */  sw        $s3, 0x1c($sp)
/* 431404 80218A64 AFB20018 */  sw        $s2, 0x18($sp)
/* 431408 80218A68 AFB10014 */  sw        $s1, 0x14($sp)
/* 43140C 80218A6C AFB00010 */  sw        $s0, 0x10($sp)
/* 431410 80218A70 F7BE0050 */  sdc1      $f30, 0x50($sp)
/* 431414 80218A74 F7BC0048 */  sdc1      $f28, 0x48($sp)
/* 431418 80218A78 F7BA0040 */  sdc1      $f26, 0x40($sp)
/* 43141C 80218A7C F7B80038 */  sdc1      $f24, 0x38($sp)
/* 431420 80218A80 F7B60030 */  sdc1      $f22, 0x30($sp)
/* 431424 80218A84 F7B40028 */  sdc1      $f20, 0x28($sp)
/* 431428 80218A88 8E90000C */  lw        $s0, 0xc($s4)
/* 43142C 80218A8C 8E050000 */  lw        $a1, ($s0)
/* 431430 80218A90 0C0B1EAF */  jal       get_variable
/* 431434 80218A94 26100004 */   addiu    $s0, $s0, 4
/* 431438 80218A98 44820000 */  mtc1      $v0, $f0
/* 43143C 80218A9C 00000000 */  nop
/* 431440 80218AA0 46800021 */  cvt.d.w   $f0, $f0
/* 431444 80218AA4 8E110000 */  lw        $s1, ($s0)
/* 431448 80218AA8 26100004 */  addiu     $s0, $s0, 4
/* 43144C 80218AAC 3C014024 */  lui       $at, 0x4024
/* 431450 80218AB0 44811800 */  mtc1      $at, $f3
/* 431454 80218AB4 44801000 */  mtc1      $zero, $f2
/* 431458 80218AB8 3C0140C9 */  lui       $at, 0x40c9
/* 43145C 80218ABC 34210FD0 */  ori       $at, $at, 0xfd0
/* 431460 80218AC0 4481A000 */  mtc1      $at, $f20
/* 431464 80218AC4 8E130000 */  lw        $s3, ($s0)
/* 431468 80218AC8 46220003 */  div.d     $f0, $f0, $f2
/* 43146C 80218ACC 462007A0 */  cvt.s.d   $f30, $f0
/* 431470 80218AD0 4614F502 */  mul.s     $f20, $f30, $f20
/* 431474 80218AD4 00000000 */  nop
/* 431478 80218AD8 26100004 */  addiu     $s0, $s0, 4
/* 43147C 80218ADC 8E120000 */  lw        $s2, ($s0)
/* 431480 80218AE0 3C0143B4 */  lui       $at, 0x43b4
/* 431484 80218AE4 44810000 */  mtc1      $at, $f0
/* 431488 80218AE8 8E100004 */  lw        $s0, 4($s0)
/* 43148C 80218AEC 4600A503 */  div.s     $f20, $f20, $f0
/* 431490 80218AF0 0C00A85B */  jal       sin_rad
/* 431494 80218AF4 4600A306 */   mov.s    $f12, $f20
/* 431498 80218AF8 3C014100 */  lui       $at, 0x4100
/* 43149C 80218AFC 44816000 */  mtc1      $at, $f12
/* 4314A0 80218B00 00000000 */  nop
/* 4314A4 80218B04 460CA302 */  mul.s     $f12, $f20, $f12
/* 4314A8 80218B08 00000000 */  nop
/* 4314AC 80218B0C 3C014316 */  lui       $at, 0x4316
/* 4314B0 80218B10 4481E000 */  mtc1      $at, $f28
/* 4314B4 80218B14 00000000 */  nop
/* 4314B8 80218B18 461C0582 */  mul.s     $f22, $f0, $f28
/* 4314BC 80218B1C 00000000 */  nop
/* 4314C0 80218B20 4480D000 */  mtc1      $zero, $f26
/* 4314C4 80218B24 0C00A85B */  jal       sin_rad
/* 4314C8 80218B28 461AB580 */   add.s    $f22, $f22, $f26
/* 4314CC 80218B2C 3C014120 */  lui       $at, 0x4120
/* 4314D0 80218B30 44811000 */  mtc1      $at, $f2
/* 4314D4 80218B34 00000000 */  nop
/* 4314D8 80218B38 46020602 */  mul.s     $f24, $f0, $f2
/* 4314DC 80218B3C 00000000 */  nop
/* 4314E0 80218B40 4600A306 */  mov.s     $f12, $f20
/* 4314E4 80218B44 0C00A874 */  jal       cos_rad
/* 4314E8 80218B48 461AC600 */   add.s    $f24, $f24, $f26
/* 4314EC 80218B4C 0280202D */  daddu     $a0, $s4, $zero
/* 4314F0 80218B50 461C0502 */  mul.s     $f20, $f0, $f28
/* 4314F4 80218B54 00000000 */  nop
/* 4314F8 80218B58 0220282D */  daddu     $a1, $s1, $zero
/* 4314FC 80218B5C 4406B000 */  mfc1      $a2, $f22
/* 431500 80218B60 3C0141A0 */  lui       $at, 0x41a0
/* 431504 80218B64 44810000 */  mtc1      $at, $f0
/* 431508 80218B68 3C01C248 */  lui       $at, 0xc248
/* 43150C 80218B6C 44811000 */  mtc1      $at, $f2
/* 431510 80218B70 4600A503 */  div.s     $f20, $f20, $f0
/* 431514 80218B74 0C0B2190 */  jal       set_float_variable
/* 431518 80218B78 4602A500 */   add.s    $f20, $f20, $f2
/* 43151C 80218B7C 0280202D */  daddu     $a0, $s4, $zero
/* 431520 80218B80 4406C000 */  mfc1      $a2, $f24
/* 431524 80218B84 0C0B2190 */  jal       set_float_variable
/* 431528 80218B88 0260282D */   daddu    $a1, $s3, $zero
/* 43152C 80218B8C 0280202D */  daddu     $a0, $s4, $zero
/* 431530 80218B90 4406A000 */  mfc1      $a2, $f20
/* 431534 80218B94 0C0B2190 */  jal       set_float_variable
/* 431538 80218B98 0240282D */   daddu    $a1, $s2, $zero
/* 43153C 80218B9C 3C0142B4 */  lui       $at, 0x42b4
/* 431540 80218BA0 44810000 */  mtc1      $at, $f0
/* 431544 80218BA4 00000000 */  nop
/* 431548 80218BA8 461E003C */  c.lt.s    $f0, $f30
/* 43154C 80218BAC 00000000 */  nop
/* 431550 80218BB0 4500000B */  bc1f      .L80218BE0
/* 431554 80218BB4 0000302D */   daddu    $a2, $zero, $zero
/* 431558 80218BB8 3C014387 */  lui       $at, 0x4387
/* 43155C 80218BBC 44810000 */  mtc1      $at, $f0
/* 431560 80218BC0 00000000 */  nop
/* 431564 80218BC4 4600F03C */  c.lt.s    $f30, $f0
/* 431568 80218BC8 00000000 */  nop
/* 43156C 80218BCC 45030001 */  bc1tl     .L80218BD4
/* 431570 80218BD0 240600B4 */   addiu    $a2, $zero, 0xb4
.L80218BD4:
/* 431574 80218BD4 3C0142B4 */  lui       $at, 0x42b4
/* 431578 80218BD8 44810000 */  mtc1      $at, $f0
/* 43157C 80218BDC 00000000 */  nop
.L80218BE0:
/* 431580 80218BE0 461E0001 */  sub.s     $f0, $f0, $f30
/* 431584 80218BE4 46000005 */  abs.s     $f0, $f0
/* 431588 80218BE8 4600010D */  trunc.w.s $f4, $f0
/* 43158C 80218BEC 44022000 */  mfc1      $v0, $f4
/* 431590 80218BF0 00000000 */  nop
/* 431594 80218BF4 2842002D */  slti      $v0, $v0, 0x2d
/* 431598 80218BF8 10400008 */  beqz      $v0, .L80218C1C
/* 43159C 80218BFC 00000000 */   nop
/* 4315A0 80218C00 3C014234 */  lui       $at, 0x4234
/* 4315A4 80218C04 44810000 */  mtc1      $at, $f0
/* 4315A8 80218C08 00000000 */  nop
/* 4315AC 80218C0C 4600F001 */  sub.s     $f0, $f30, $f0
/* 4315B0 80218C10 46000000 */  add.s     $f0, $f0, $f0
/* 4315B4 80218C14 4600010D */  trunc.w.s $f4, $f0
/* 4315B8 80218C18 44062000 */  mfc1      $a2, $f4
.L80218C1C:
/* 4315BC 80218C1C 3C014387 */  lui       $at, 0x4387
/* 4315C0 80218C20 44810000 */  mtc1      $at, $f0
/* 4315C4 80218C24 00000000 */  nop
/* 4315C8 80218C28 461E0001 */  sub.s     $f0, $f0, $f30
/* 4315CC 80218C2C 46000005 */  abs.s     $f0, $f0
/* 4315D0 80218C30 4600010D */  trunc.w.s $f4, $f0
/* 4315D4 80218C34 44022000 */  mfc1      $v0, $f4
/* 4315D8 80218C38 00000000 */  nop
/* 4315DC 80218C3C 2842002D */  slti      $v0, $v0, 0x2d
/* 4315E0 80218C40 1040000C */  beqz      $v0, .L80218C74
/* 4315E4 80218C44 0280202D */   daddu    $a0, $s4, $zero
/* 4315E8 80218C48 3C014361 */  lui       $at, 0x4361
/* 4315EC 80218C4C 44810000 */  mtc1      $at, $f0
/* 4315F0 80218C50 00000000 */  nop
/* 4315F4 80218C54 4600F001 */  sub.s     $f0, $f30, $f0
/* 4315F8 80218C58 46000000 */  add.s     $f0, $f0, $f0
/* 4315FC 80218C5C 3C014334 */  lui       $at, 0x4334
/* 431600 80218C60 44811000 */  mtc1      $at, $f2
/* 431604 80218C64 00000000 */  nop
/* 431608 80218C68 46020000 */  add.s     $f0, $f0, $f2
/* 43160C 80218C6C 4600010D */  trunc.w.s $f4, $f0
/* 431610 80218C70 44062000 */  mfc1      $a2, $f4
.L80218C74:
/* 431614 80218C74 0C0B2026 */  jal       set_variable
/* 431618 80218C78 0200282D */   daddu    $a1, $s0, $zero
/* 43161C 80218C7C 8FBF0024 */  lw        $ra, 0x24($sp)
/* 431620 80218C80 8FB40020 */  lw        $s4, 0x20($sp)
/* 431624 80218C84 8FB3001C */  lw        $s3, 0x1c($sp)
/* 431628 80218C88 8FB20018 */  lw        $s2, 0x18($sp)
/* 43162C 80218C8C 8FB10014 */  lw        $s1, 0x14($sp)
/* 431630 80218C90 8FB00010 */  lw        $s0, 0x10($sp)
/* 431634 80218C94 D7BE0050 */  ldc1      $f30, 0x50($sp)
/* 431638 80218C98 D7BC0048 */  ldc1      $f28, 0x48($sp)
/* 43163C 80218C9C D7BA0040 */  ldc1      $f26, 0x40($sp)
/* 431640 80218CA0 D7B80038 */  ldc1      $f24, 0x38($sp)
/* 431644 80218CA4 D7B60030 */  ldc1      $f22, 0x30($sp)
/* 431648 80218CA8 D7B40028 */  ldc1      $f20, 0x28($sp)
/* 43164C 80218CAC 24020002 */  addiu     $v0, $zero, 2
/* 431650 80218CB0 03E00008 */  jr        $ra
/* 431654 80218CB4 27BD0058 */   addiu    $sp, $sp, 0x58
/* 431658 80218CB8 00000000 */  nop
/* 43165C 80218CBC 00000000 */  nop