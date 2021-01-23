.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_80219188_465618
/* 465618 80219188 27BDFFB8 */  addiu     $sp, $sp, -0x48
/* 46561C 8021918C AFBF002C */  sw        $ra, 0x2c($sp)
/* 465620 80219190 AFB20028 */  sw        $s2, 0x28($sp)
/* 465624 80219194 AFB10024 */  sw        $s1, 0x24($sp)
/* 465628 80219198 AFB00020 */  sw        $s0, 0x20($sp)
/* 46562C 8021919C F7B80040 */  sdc1      $f24, 0x40($sp)
/* 465630 802191A0 F7B60038 */  sdc1      $f22, 0x38($sp)
/* 465634 802191A4 F7B40030 */  sdc1      $f20, 0x30($sp)
/* 465638 802191A8 8C840148 */  lw        $a0, 0x148($a0)
/* 46563C 802191AC 0C09A75B */  jal       get_actor
/* 465640 802191B0 00A0802D */   daddu    $s0, $a1, $zero
/* 465644 802191B4 0040882D */  daddu     $s1, $v0, $zero
/* 465648 802191B8 1200003D */  beqz      $s0, .L802192B0
/* 46564C 802191BC 2632000C */   addiu    $s2, $s1, 0xc
/* 465650 802191C0 0C00AB39 */  jal       heap_malloc
/* 465654 802191C4 24040020 */   addiu    $a0, $zero, 0x20
/* 465658 802191C8 0040802D */  daddu     $s0, $v0, $zero
/* 46565C 802191CC 24020001 */  addiu     $v0, $zero, 1
/* 465660 802191D0 26250144 */  addiu     $a1, $s1, 0x144
/* 465664 802191D4 26260148 */  addiu     $a2, $s1, 0x148
/* 465668 802191D8 AE300094 */  sw        $s0, 0x94($s1)
/* 46566C 802191DC AE020004 */  sw        $v0, 4($s0)
/* 465670 802191E0 AE000008 */  sw        $zero, 8($s0)
/* 465674 802191E4 AE02000C */  sw        $v0, 0xc($s0)
/* 465678 802191E8 AE000010 */  sw        $zero, 0x10($s0)
/* 46567C 802191EC 82230210 */  lb        $v1, 0x210($s1)
/* 465680 802191F0 2402000A */  addiu     $v0, $zero, 0xa
/* 465684 802191F4 10620005 */  beq       $v1, $v0, .L8021920C
/* 465688 802191F8 2627014C */   addiu    $a3, $s1, 0x14c
/* 46568C 802191FC 3C013F80 */  lui       $at, 0x3f80
/* 465690 80219200 44810000 */  mtc1      $at, $f0
/* 465694 80219204 08086488 */  j         .L80219220
/* 465698 80219208 E7A00010 */   swc1     $f0, 0x10($sp)
.L8021920C:
/* 46569C 8021920C 3C013ECC */  lui       $at, 0x3ecc
/* 4656A0 80219210 3421CCCD */  ori       $at, $at, 0xcccd
/* 4656A4 80219214 44810000 */  mtc1      $at, $f0
/* 4656A8 80219218 00000000 */  nop
/* 4656AC 8021921C E7A00010 */  swc1      $f0, 0x10($sp)
.L80219220:
/* 4656B0 80219220 24020005 */  addiu     $v0, $zero, 5
/* 4656B4 80219224 AFA20014 */  sw        $v0, 0x14($sp)
/* 4656B8 80219228 AFA00018 */  sw        $zero, 0x18($sp)
/* 4656BC 8021922C 8CA50000 */  lw        $a1, ($a1)
/* 4656C0 80219230 8CC60000 */  lw        $a2, ($a2)
/* 4656C4 80219234 8CE70000 */  lw        $a3, ($a3)
/* 4656C8 80219238 0C01C8EC */  jal       func_800723B0
/* 4656CC 8021923C 0000202D */   daddu    $a0, $zero, $zero
/* 4656D0 80219240 26250144 */  addiu     $a1, $s1, 0x144
/* 4656D4 80219244 AE020014 */  sw        $v0, 0x14($s0)
/* 4656D8 80219248 82220210 */  lb        $v0, 0x210($s1)
/* 4656DC 8021924C 2403000A */  addiu     $v1, $zero, 0xa
/* 4656E0 80219250 10430005 */  beq       $v0, $v1, .L80219268
/* 4656E4 80219254 2627014C */   addiu    $a3, $s1, 0x14c
/* 4656E8 80219258 3C013F80 */  lui       $at, 0x3f80
/* 4656EC 8021925C 44810000 */  mtc1      $at, $f0
/* 4656F0 80219260 0808649F */  j         .L8021927C
/* 4656F4 80219264 E7A00010 */   swc1     $f0, 0x10($sp)
.L80219268:
/* 4656F8 80219268 3C013ECC */  lui       $at, 0x3ecc
/* 4656FC 8021926C 3421CCCD */  ori       $at, $at, 0xcccd
/* 465700 80219270 44810000 */  mtc1      $at, $f0
/* 465704 80219274 00000000 */  nop
/* 465708 80219278 E7A00010 */  swc1      $f0, 0x10($sp)
.L8021927C:
/* 46570C 8021927C 24020005 */  addiu     $v0, $zero, 5
/* 465710 80219280 AFA20014 */  sw        $v0, 0x14($sp)
/* 465714 80219284 AFA00018 */  sw        $zero, 0x18($sp)
/* 465718 80219288 8CA50000 */  lw        $a1, ($a1)
/* 46571C 8021928C 3C06C47A */  lui       $a2, 0xc47a
/* 465720 80219290 8CE70000 */  lw        $a3, ($a3)
/* 465724 80219294 0C01C8EC */  jal       func_800723B0
/* 465728 80219298 24040001 */   addiu    $a0, $zero, 1
/* 46572C 8021929C AE020018 */  sw        $v0, 0x18($s0)
/* 465730 802192A0 24020001 */  addiu     $v0, $zero, 1
/* 465734 802192A4 AE020000 */  sw        $v0, ($s0)
/* 465738 802192A8 82220210 */  lb        $v0, 0x210($s1)
/* 46573C 802192AC AE02001C */  sw        $v0, 0x1c($s0)
.L802192B0:
/* 465740 802192B0 8E500088 */  lw        $s0, 0x88($s2)
/* 465744 802192B4 8E020000 */  lw        $v0, ($s0)
/* 465748 802192B8 104000C9 */  beqz      $v0, .L802195E0
/* 46574C 802192BC 24020002 */   addiu    $v0, $zero, 2
/* 465750 802192C0 8E020004 */  lw        $v0, 4($s0)
/* 465754 802192C4 1040000D */  beqz      $v0, .L802192FC
/* 465758 802192C8 24020008 */   addiu    $v0, $zero, 8
/* 46575C 802192CC 82230210 */  lb        $v1, 0x210($s1)
/* 465760 802192D0 1062000A */  beq       $v1, $v0, .L802192FC
/* 465764 802192D4 00000000 */   nop
/* 465768 802192D8 8E020008 */  lw        $v0, 8($s0)
/* 46576C 802192DC 2442000F */  addiu     $v0, $v0, 0xf
/* 465770 802192E0 44826000 */  mtc1      $v0, $f12
/* 465774 802192E4 00000000 */  nop
/* 465778 802192E8 46806320 */  cvt.s.w   $f12, $f12
/* 46577C 802192EC 0C00A6C9 */  jal       clamp_angle
/* 465780 802192F0 AE020008 */   sw       $v0, 8($s0)
/* 465784 802192F4 4600018D */  trunc.w.s $f6, $f0
/* 465788 802192F8 E6060008 */  swc1      $f6, 8($s0)
.L802192FC:
/* 46578C 802192FC 3C0140C9 */  lui       $at, 0x40c9
/* 465790 80219300 34210FD0 */  ori       $at, $at, 0xfd0
/* 465794 80219304 44810000 */  mtc1      $at, $f0
/* 465798 80219308 C60C0008 */  lwc1      $f12, 8($s0)
/* 46579C 8021930C 46806320 */  cvt.s.w   $f12, $f12
/* 4657A0 80219310 46006302 */  mul.s     $f12, $f12, $f0
/* 4657A4 80219314 00000000 */  nop
/* 4657A8 80219318 3C0143B4 */  lui       $at, 0x43b4
/* 4657AC 8021931C 44810000 */  mtc1      $at, $f0
/* 4657B0 80219320 0C00A85B */  jal       sin_rad
/* 4657B4 80219324 46006303 */   div.s    $f12, $f12, $f0
/* 4657B8 80219328 3C014040 */  lui       $at, 0x4040
/* 4657BC 8021932C 44811000 */  mtc1      $at, $f2
/* 4657C0 80219330 00000000 */  nop
/* 4657C4 80219334 46020002 */  mul.s     $f0, $f0, $f2
/* 4657C8 80219338 00000000 */  nop
/* 4657CC 8021933C 86220152 */  lh        $v0, 0x152($s1)
/* 4657D0 80219340 44821000 */  mtc1      $v0, $f2
/* 4657D4 80219344 00000000 */  nop
/* 4657D8 80219348 468010A0 */  cvt.s.w   $f2, $f2
/* 4657DC 8021934C 4600018D */  trunc.w.s $f6, $f0
/* 4657E0 80219350 44033000 */  mfc1      $v1, $f6
/* 4657E4 80219354 00000000 */  nop
/* 4657E8 80219358 00031600 */  sll       $v0, $v1, 0x18
/* 4657EC 8021935C C6200148 */  lwc1      $f0, 0x148($s1)
/* 4657F0 80219360 00021603 */  sra       $v0, $v0, 0x18
/* 4657F4 80219364 A223019A */  sb        $v1, 0x19a($s1)
/* 4657F8 80219368 46020000 */  add.s     $f0, $f0, $f2
/* 4657FC 8021936C 44821000 */  mtc1      $v0, $f2
/* 465800 80219370 00000000 */  nop
/* 465804 80219374 468010A0 */  cvt.s.w   $f2, $f2
/* 465808 80219378 86220150 */  lh        $v0, 0x150($s1)
/* 46580C 8021937C 46020000 */  add.s     $f0, $f0, $f2
/* 465810 80219380 2403000A */  addiu     $v1, $zero, 0xa
/* 465814 80219384 44821000 */  mtc1      $v0, $f2
/* 465818 80219388 00000000 */  nop
/* 46581C 8021938C 468010A0 */  cvt.s.w   $f2, $f2
/* 465820 80219390 46000121 */  cvt.d.s   $f4, $f0
/* 465824 80219394 C6200144 */  lwc1      $f0, 0x144($s1)
/* 465828 80219398 82220210 */  lb        $v0, 0x210($s1)
/* 46582C 8021939C 46020580 */  add.s     $f22, $f0, $f2
/* 465830 802193A0 3C018023 */  lui       $at, %hi(D_80232B38)
/* 465834 802193A4 D4202B38 */  ldc1      $f0, %lo(D_80232B38)($at)
/* 465838 802193A8 50430006 */  beql      $v0, $v1, .L802193C4
/* 46583C 802193AC 46202000 */   add.d    $f0, $f4, $f0
/* 465840 802193B0 3C014028 */  lui       $at, 0x4028
/* 465844 802193B4 44810800 */  mtc1      $at, $f1
/* 465848 802193B8 44800000 */  mtc1      $zero, $f0
/* 46584C 802193BC 00000000 */  nop
/* 465850 802193C0 46202000 */  add.d     $f0, $f4, $f0
.L802193C4:
/* 465854 802193C4 46200520 */  cvt.s.d   $f20, $f0
/* 465858 802193C8 86220154 */  lh        $v0, 0x154($s1)
/* 46585C 802193CC C620014C */  lwc1      $f0, 0x14c($s1)
/* 465860 802193D0 44821000 */  mtc1      $v0, $f2
/* 465864 802193D4 00000000 */  nop
/* 465868 802193D8 468010A0 */  cvt.s.w   $f2, $f2
/* 46586C 802193DC 8E02000C */  lw        $v0, 0xc($s0)
/* 465870 802193E0 10400059 */  beqz      $v0, .L80219548
/* 465874 802193E4 46020600 */   add.s    $f24, $f0, $f2
/* 465878 802193E8 8E030010 */  lw        $v1, 0x10($s0)
/* 46587C 802193EC 10600005 */  beqz      $v1, .L80219404
/* 465880 802193F0 24020001 */   addiu    $v0, $zero, 1
/* 465884 802193F4 1062002A */  beq       $v1, $v0, .L802194A0
/* 465888 802193F8 00000000 */   nop
/* 46588C 802193FC 08086560 */  j         .L80219580
/* 465890 80219400 00000000 */   nop
.L80219404:
/* 465894 80219404 8E020014 */  lw        $v0, 0x14($s0)
/* 465898 80219408 14400016 */  bnez      $v0, .L80219464
/* 46589C 8021940C 2402000A */   addiu    $v0, $zero, 0xa
/* 4658A0 80219410 82230210 */  lb        $v1, 0x210($s1)
/* 4658A4 80219414 10620005 */  beq       $v1, $v0, .L8021942C
/* 4658A8 80219418 00000000 */   nop
/* 4658AC 8021941C 3C013F80 */  lui       $at, 0x3f80
/* 4658B0 80219420 44810000 */  mtc1      $at, $f0
/* 4658B4 80219424 08086510 */  j         .L80219440
/* 4658B8 80219428 E7A00010 */   swc1     $f0, 0x10($sp)
.L8021942C:
/* 4658BC 8021942C 3C013ECC */  lui       $at, 0x3ecc
/* 4658C0 80219430 3421CCCD */  ori       $at, $at, 0xcccd
/* 4658C4 80219434 44810000 */  mtc1      $at, $f0
/* 4658C8 80219438 00000000 */  nop
/* 4658CC 8021943C E7A00010 */  swc1      $f0, 0x10($sp)
.L80219440:
/* 4658D0 80219440 0000202D */  daddu     $a0, $zero, $zero
/* 4658D4 80219444 4405B000 */  mfc1      $a1, $f22
/* 4658D8 80219448 4406A000 */  mfc1      $a2, $f20
/* 4658DC 8021944C 4407C000 */  mfc1      $a3, $f24
/* 4658E0 80219450 24020005 */  addiu     $v0, $zero, 5
/* 4658E4 80219454 AFA20014 */  sw        $v0, 0x14($sp)
/* 4658E8 80219458 0C01C8EC */  jal       func_800723B0
/* 4658EC 8021945C AFA00018 */   sw       $zero, 0x18($sp)
/* 4658F0 80219460 AE020014 */  sw        $v0, 0x14($s0)
.L80219464:
/* 4658F4 80219464 8E030018 */  lw        $v1, 0x18($s0)
/* 4658F8 80219468 10600005 */  beqz      $v1, .L80219480
/* 4658FC 8021946C 00000000 */   nop
/* 465900 80219470 8C620000 */  lw        $v0, ($v1)
/* 465904 80219474 34420010 */  ori       $v0, $v0, 0x10
/* 465908 80219478 AC620000 */  sw        $v0, ($v1)
/* 46590C 8021947C AE000018 */  sw        $zero, 0x18($s0)
.L80219480:
/* 465910 80219480 8E020014 */  lw        $v0, 0x14($s0)
/* 465914 80219484 8C42000C */  lw        $v0, 0xc($v0)
/* 465918 80219488 E4560004 */  swc1      $f22, 4($v0)
/* 46591C 8021948C 8E020014 */  lw        $v0, 0x14($s0)
/* 465920 80219490 8C42000C */  lw        $v0, 0xc($v0)
/* 465924 80219494 E4540008 */  swc1      $f20, 8($v0)
/* 465928 80219498 0808654F */  j         .L8021953C
/* 46592C 8021949C 8E020014 */   lw       $v0, 0x14($s0)
.L802194A0:
/* 465930 802194A0 8E030014 */  lw        $v1, 0x14($s0)
/* 465934 802194A4 10600005 */  beqz      $v1, .L802194BC
/* 465938 802194A8 00000000 */   nop
/* 46593C 802194AC 8C620000 */  lw        $v0, ($v1)
/* 465940 802194B0 34420010 */  ori       $v0, $v0, 0x10
/* 465944 802194B4 AC620000 */  sw        $v0, ($v1)
/* 465948 802194B8 AE000014 */  sw        $zero, 0x14($s0)
.L802194BC:
/* 46594C 802194BC 8E020018 */  lw        $v0, 0x18($s0)
/* 465950 802194C0 14400018 */  bnez      $v0, .L80219524
/* 465954 802194C4 00000000 */   nop
/* 465958 802194C8 82230210 */  lb        $v1, 0x210($s1)
/* 46595C 802194CC 2402000A */  addiu     $v0, $zero, 0xa
/* 465960 802194D0 10620005 */  beq       $v1, $v0, .L802194E8
/* 465964 802194D4 00000000 */   nop
/* 465968 802194D8 3C013F80 */  lui       $at, 0x3f80
/* 46596C 802194DC 44810000 */  mtc1      $at, $f0
/* 465970 802194E0 0808653F */  j         .L802194FC
/* 465974 802194E4 E7A00010 */   swc1     $f0, 0x10($sp)
.L802194E8:
/* 465978 802194E8 3C013ECC */  lui       $at, 0x3ecc
/* 46597C 802194EC 3421CCCD */  ori       $at, $at, 0xcccd
/* 465980 802194F0 44810000 */  mtc1      $at, $f0
/* 465984 802194F4 00000000 */  nop
/* 465988 802194F8 E7A00010 */  swc1      $f0, 0x10($sp)
.L802194FC:
/* 46598C 802194FC 24040001 */  addiu     $a0, $zero, 1
/* 465990 80219500 4405B000 */  mfc1      $a1, $f22
/* 465994 80219504 4406A000 */  mfc1      $a2, $f20
/* 465998 80219508 4407C000 */  mfc1      $a3, $f24
/* 46599C 8021950C 24020005 */  addiu     $v0, $zero, 5
/* 4659A0 80219510 AFA20014 */  sw        $v0, 0x14($sp)
/* 4659A4 80219514 0C01C8EC */  jal       func_800723B0
/* 4659A8 80219518 AFA00018 */   sw       $zero, 0x18($sp)
/* 4659AC 8021951C AE020018 */  sw        $v0, 0x18($s0)
/* 4659B0 80219520 8E020018 */  lw        $v0, 0x18($s0)
.L80219524:
/* 4659B4 80219524 8C42000C */  lw        $v0, 0xc($v0)
/* 4659B8 80219528 E4560004 */  swc1      $f22, 4($v0)
/* 4659BC 8021952C 8E020018 */  lw        $v0, 0x18($s0)
/* 4659C0 80219530 8C42000C */  lw        $v0, 0xc($v0)
/* 4659C4 80219534 E4540008 */  swc1      $f20, 8($v0)
/* 4659C8 80219538 8E020018 */  lw        $v0, 0x18($s0)
.L8021953C:
/* 4659CC 8021953C 8C42000C */  lw        $v0, 0xc($v0)
/* 4659D0 80219540 08086560 */  j         .L80219580
/* 4659D4 80219544 E458000C */   swc1     $f24, 0xc($v0)
.L80219548:
/* 4659D8 80219548 8E030014 */  lw        $v1, 0x14($s0)
/* 4659DC 8021954C 10600005 */  beqz      $v1, .L80219564
/* 4659E0 80219550 00000000 */   nop
/* 4659E4 80219554 8C620000 */  lw        $v0, ($v1)
/* 4659E8 80219558 34420010 */  ori       $v0, $v0, 0x10
/* 4659EC 8021955C AC620000 */  sw        $v0, ($v1)
/* 4659F0 80219560 AE000014 */  sw        $zero, 0x14($s0)
.L80219564:
/* 4659F4 80219564 8E030018 */  lw        $v1, 0x18($s0)
/* 4659F8 80219568 10600005 */  beqz      $v1, .L80219580
/* 4659FC 8021956C 00000000 */   nop
/* 465A00 80219570 8C620000 */  lw        $v0, ($v1)
/* 465A04 80219574 34420010 */  ori       $v0, $v0, 0x10
/* 465A08 80219578 AC620000 */  sw        $v0, ($v1)
/* 465A0C 8021957C AE000018 */  sw        $zero, 0x18($s0)
.L80219580:
/* 465A10 80219580 82230210 */  lb        $v1, 0x210($s1)
/* 465A14 80219584 8E02001C */  lw        $v0, 0x1c($s0)
/* 465A18 80219588 10430014 */  beq       $v0, $v1, .L802195DC
/* 465A1C 8021958C 0000102D */   daddu    $v0, $zero, $zero
/* 465A20 80219590 8E02000C */  lw        $v0, 0xc($s0)
/* 465A24 80219594 10400011 */  beqz      $v0, .L802195DC
/* 465A28 80219598 0000102D */   daddu    $v0, $zero, $zero
/* 465A2C 8021959C 8E030014 */  lw        $v1, 0x14($s0)
/* 465A30 802195A0 10600005 */  beqz      $v1, .L802195B8
/* 465A34 802195A4 00000000 */   nop
/* 465A38 802195A8 8C620000 */  lw        $v0, ($v1)
/* 465A3C 802195AC 34420010 */  ori       $v0, $v0, 0x10
/* 465A40 802195B0 AC620000 */  sw        $v0, ($v1)
/* 465A44 802195B4 AE000014 */  sw        $zero, 0x14($s0)
.L802195B8:
/* 465A48 802195B8 8E030018 */  lw        $v1, 0x18($s0)
/* 465A4C 802195BC 10600005 */  beqz      $v1, .L802195D4
/* 465A50 802195C0 00000000 */   nop
/* 465A54 802195C4 8C620000 */  lw        $v0, ($v1)
/* 465A58 802195C8 34420010 */  ori       $v0, $v0, 0x10
/* 465A5C 802195CC AC620000 */  sw        $v0, ($v1)
/* 465A60 802195D0 AE000018 */  sw        $zero, 0x18($s0)
.L802195D4:
/* 465A64 802195D4 82230210 */  lb        $v1, 0x210($s1)
/* 465A68 802195D8 0000102D */  daddu     $v0, $zero, $zero
.L802195DC:
/* 465A6C 802195DC AE03001C */  sw        $v1, 0x1c($s0)
.L802195E0:
/* 465A70 802195E0 8FBF002C */  lw        $ra, 0x2c($sp)
/* 465A74 802195E4 8FB20028 */  lw        $s2, 0x28($sp)
/* 465A78 802195E8 8FB10024 */  lw        $s1, 0x24($sp)
/* 465A7C 802195EC 8FB00020 */  lw        $s0, 0x20($sp)
/* 465A80 802195F0 D7B80040 */  ldc1      $f24, 0x40($sp)
/* 465A84 802195F4 D7B60038 */  ldc1      $f22, 0x38($sp)
/* 465A88 802195F8 D7B40030 */  ldc1      $f20, 0x30($sp)
/* 465A8C 802195FC 03E00008 */  jr        $ra
/* 465A90 80219600 27BD0048 */   addiu    $sp, $sp, 0x48