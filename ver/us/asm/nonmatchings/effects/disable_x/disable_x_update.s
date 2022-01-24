.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel disable_x_update
/* 3857F8 E00821B8 27BDFFB0 */  addiu     $sp, $sp, -0x50
/* 3857FC E00821BC AFB40028 */  sw        $s4, 0x28($sp)
/* 385800 E00821C0 0080A02D */  daddu     $s4, $a0, $zero
/* 385804 E00821C4 AFBF0038 */  sw        $ra, 0x38($sp)
/* 385808 E00821C8 AFB70034 */  sw        $s7, 0x34($sp)
/* 38580C E00821CC AFB60030 */  sw        $s6, 0x30($sp)
/* 385810 E00821D0 AFB5002C */  sw        $s5, 0x2c($sp)
/* 385814 E00821D4 AFB30024 */  sw        $s3, 0x24($sp)
/* 385818 E00821D8 AFB20020 */  sw        $s2, 0x20($sp)
/* 38581C E00821DC AFB1001C */  sw        $s1, 0x1c($sp)
/* 385820 E00821E0 AFB00018 */  sw        $s0, 0x18($sp)
/* 385824 E00821E4 F7B60048 */  sdc1      $f22, 0x48($sp)
/* 385828 E00821E8 F7B40040 */  sdc1      $f20, 0x40($sp)
/* 38582C E00821EC 8E830000 */  lw        $v1, ($s4)
/* 385830 E00821F0 8E90000C */  lw        $s0, 0xc($s4)
/* 385834 E00821F4 30620010 */  andi      $v0, $v1, 0x10
/* 385838 E00821F8 10400005 */  beqz      $v0, .LE0082210
/* 38583C E00821FC 2402FFEF */   addiu    $v0, $zero, -0x11
/* 385840 E0082200 00621024 */  and       $v0, $v1, $v0
/* 385844 E0082204 AE820000 */  sw        $v0, ($s4)
/* 385848 E0082208 24020015 */  addiu     $v0, $zero, 0x15
/* 38584C E008220C AE020028 */  sw        $v0, 0x28($s0)
.LE0082210:
/* 385850 E0082210 8E030028 */  lw        $v1, 0x28($s0)
/* 385854 E0082214 28620064 */  slti      $v0, $v1, 0x64
/* 385858 E0082218 10400002 */  beqz      $v0, .LE0082224
/* 38585C E008221C 2462FFFF */   addiu    $v0, $v1, -1
/* 385860 E0082220 AE020028 */  sw        $v0, 0x28($s0)
.LE0082224:
/* 385864 E0082224 8E020028 */  lw        $v0, 0x28($s0)
/* 385868 E0082228 04410005 */  bgez      $v0, .LE0082240
/* 38586C E008222C 3C030004 */   lui      $v1, 4
/* 385870 E0082230 0C080128 */  jal       shim_remove_effect
/* 385874 E0082234 0280202D */   daddu    $a0, $s4, $zero
/* 385878 E0082238 0802093B */  j         .LE00824EC
/* 38587C E008223C 00000000 */   nop
.LE0082240:
/* 385880 E0082240 8E02002C */  lw        $v0, 0x2c($s0)
/* 385884 E0082244 3463F1A0 */  ori       $v1, $v1, 0xf1a0
/* 385888 E0082248 24420001 */  addiu     $v0, $v0, 1
/* 38588C E008224C 0062182A */  slt       $v1, $v1, $v0
/* 385890 E0082250 10600003 */  beqz      $v1, .LE0082260
/* 385894 E0082254 AE02002C */   sw       $v0, 0x2c($s0)
/* 385898 E0082258 24020100 */  addiu     $v0, $zero, 0x100
/* 38589C E008225C AE02002C */  sw        $v0, 0x2c($s0)
.LE0082260:
/* 3858A0 E0082260 8E03003C */  lw        $v1, 0x3c($s0)
/* 3858A4 E0082264 8E130000 */  lw        $s3, ($s0)
/* 3858A8 E0082268 8E120028 */  lw        $s2, 0x28($s0)
/* 3858AC E008226C 8E15002C */  lw        $s5, 0x2c($s0)
/* 3858B0 E0082270 8E040038 */  lw        $a0, 0x38($s0)
/* 3858B4 E0082274 16600034 */  bnez      $s3, .LE0082348
/* 3858B8 E0082278 C6160034 */   lwc1     $f22, 0x34($s0)
/* 3858BC E008227C 8E020044 */  lw        $v0, 0x44($s0)
/* 3858C0 E0082280 1C400030 */  bgtz      $v0, .LE0082344
/* 3858C4 E0082284 2442FFFF */   addiu    $v0, $v0, -1
/* 3858C8 E0082288 1064002F */  beq       $v1, $a0, .LE0082348
/* 3858CC E008228C 00000000 */   nop
/* 3858D0 E0082290 04620001 */  bltzl     $v1, .LE0082298
/* 3858D4 E0082294 0000182D */   daddu    $v1, $zero, $zero
.LE0082298:
/* 3858D8 E0082298 0083102A */  slt       $v0, $a0, $v1
/* 3858DC E008229C 10400017 */  beqz      $v0, .LE00822FC
/* 3858E0 E00822A0 24020064 */   addiu    $v0, $zero, 0x64
/* 3858E4 E00822A4 AE020028 */  sw        $v0, 0x28($s0)
/* 3858E8 E00822A8 24020001 */  addiu     $v0, $zero, 1
/* 3858EC E00822AC AE02002C */  sw        $v0, 0x2c($s0)
/* 3858F0 E00822B0 8E020038 */  lw        $v0, 0x38($s0)
/* 3858F4 E00822B4 C602000C */  lwc1      $f2, 0xc($s0)
/* 3858F8 E00822B8 3C01C3FA */  lui       $at, 0xc3fa
/* 3858FC E00822BC 44810000 */  mtc1      $at, $f0
/* 385900 E00822C0 AE000070 */  sw        $zero, 0x70($s0)
/* 385904 E00822C4 24420001 */  addiu     $v0, $v0, 1
/* 385908 E00822C8 4602003C */  c.lt.s    $f0, $f2
/* 38590C E00822CC 00000000 */  nop
/* 385910 E00822D0 4500001B */  bc1f      .LE0082340
/* 385914 E00822D4 AE020038 */   sw       $v0, 0x38($s0)
/* 385918 E00822D8 C6000010 */  lwc1      $f0, 0x10($s0)
/* 38591C E00822DC 24042107 */  addiu     $a0, $zero, 0x2107
/* 385920 E00822E0 E7A00010 */  swc1      $f0, 0x10($sp)
/* 385924 E00822E4 8E060008 */  lw        $a2, 8($s0)
/* 385928 E00822E8 8E07000C */  lw        $a3, 0xc($s0)
/* 38592C E00822EC 0C0801A0 */  jal       shim_sfx_play_sound_at_position
/* 385930 E00822F0 0000282D */   daddu    $a1, $zero, $zero
/* 385934 E00822F4 080208D1 */  j         .LE0082344
/* 385938 E00822F8 24020008 */   addiu    $v0, $zero, 8
.LE00822FC:
/* 38593C E00822FC 0064102A */  slt       $v0, $v1, $a0
/* 385940 E0082300 10400010 */  beqz      $v0, .LE0082344
/* 385944 E0082304 24020008 */   addiu    $v0, $zero, 8
/* 385948 E0082308 0C080150 */  jal       shim_load_effect
/* 38594C E008230C 24040041 */   addiu    $a0, $zero, 0x41
/* 385950 E0082310 C602000C */  lwc1      $f2, 0xc($s0)
/* 385954 E0082314 C6000068 */  lwc1      $f0, 0x68($s0)
/* 385958 E0082318 AFA00010 */  sw        $zero, 0x10($sp)
/* 38595C E008231C 46001080 */  add.s     $f2, $f2, $f0
/* 385960 E0082320 8E050008 */  lw        $a1, 8($s0)
/* 385964 E0082324 8E070010 */  lw        $a3, 0x10($s0)
/* 385968 E0082328 44061000 */  mfc1      $a2, $f2
/* 38596C E008232C 0C020800 */  jal       disable_x_main
/* 385970 E0082330 2404000A */   addiu    $a0, $zero, 0xa
/* 385974 E0082334 8E020038 */  lw        $v0, 0x38($s0)
/* 385978 E0082338 2442FFFF */  addiu     $v0, $v0, -1
/* 38597C E008233C AE020038 */  sw        $v0, 0x38($s0)
.LE0082340:
/* 385980 E0082340 24020008 */  addiu     $v0, $zero, 8
.LE0082344:
/* 385984 E0082344 AE020044 */  sw        $v0, 0x44($s0)
.LE0082348:
/* 385988 E0082348 8E820008 */  lw        $v0, 8($s4)
/* 38598C E008234C 24110001 */  addiu     $s1, $zero, 1
/* 385990 E0082350 0222102A */  slt       $v0, $s1, $v0
/* 385994 E0082354 10400065 */  beqz      $v0, .LE00824EC
/* 385998 E0082358 26100048 */   addiu    $s0, $s0, 0x48
/* 38599C E008235C 3C17E008 */  lui       $s7, %hi(D_E0082D30)
/* 3859A0 E0082360 26F72D30 */  addiu     $s7, $s7, %lo(D_E0082D30)
/* 3859A4 E0082364 02351004 */  sllv      $v0, $s5, $s1
/* 3859A8 E0082368 00551021 */  addu      $v0, $v0, $s5
/* 3859AC E008236C 0002B080 */  sll       $s6, $v0, 2
/* 3859B0 E0082370 3C014080 */  lui       $at, 0x4080
/* 3859B4 E0082374 4481A000 */  mtc1      $at, $f20
/* 3859B8 E0082378 02321004 */  sllv      $v0, $s2, $s1
/* 3859BC E008237C 00521021 */  addu      $v0, $v0, $s2
/* 3859C0 E0082380 000210C0 */  sll       $v0, $v0, 3
/* 3859C4 E0082384 0052A821 */  addu      $s5, $v0, $s2
/* 3859C8 E0082388 26100028 */  addiu     $s0, $s0, 0x28
.LE008238C:
/* 3859CC E008238C 8E030000 */  lw        $v1, ($s0)
/* 3859D0 E0082390 28620009 */  slti      $v0, $v1, 9
/* 3859D4 E0082394 10400007 */  beqz      $v0, .LE00823B4
/* 3859D8 E0082398 2402000A */   addiu    $v0, $zero, 0xa
/* 3859DC E008239C 12620005 */  beq       $s3, $v0, .LE00823B4
/* 3859E0 E00823A0 00031080 */   sll      $v0, $v1, 2
/* 3859E4 E00823A4 00571021 */  addu      $v0, $v0, $s7
/* 3859E8 E00823A8 C4400000 */  lwc1      $f0, ($v0)
/* 3859EC E00823AC 080208F1 */  j         .LE00823C4
/* 3859F0 E00823B0 E6000008 */   swc1     $f0, 8($s0)
.LE00823B4:
/* 3859F4 E00823B4 3C013F80 */  lui       $at, 0x3f80
/* 3859F8 E00823B8 44810000 */  mtc1      $at, $f0
/* 3859FC E00823BC 00000000 */  nop
/* 385A00 E00823C0 E6000008 */  swc1      $f0, 8($s0)
.LE00823C4:
/* 385A04 E00823C4 C6000008 */  lwc1      $f0, 8($s0)
/* 385A08 E00823C8 46160002 */  mul.s     $f0, $f0, $f22
/* 385A0C E00823CC 00000000 */  nop
/* 385A10 E00823D0 2E620002 */  sltiu     $v0, $s3, 2
/* 385A14 E00823D4 10400009 */  beqz      $v0, .LE00823FC
/* 385A18 E00823D8 E6000008 */   swc1     $f0, 8($s0)
/* 385A1C E00823DC 44966000 */  mtc1      $s6, $f12
/* 385A20 E00823E0 00000000 */  nop
/* 385A24 E00823E4 0C080144 */  jal       shim_cos_deg
/* 385A28 E00823E8 46806320 */   cvt.s.w  $f12, $f12
/* 385A2C E00823EC 46140002 */  mul.s     $f0, $f0, $f20
/* 385A30 E00823F0 00000000 */  nop
/* 385A34 E00823F4 08020900 */  j         .LE0082400
/* 385A38 E00823F8 E600FFF8 */   swc1     $f0, -8($s0)
.LE00823FC:
/* 385A3C E00823FC AE00FFF8 */  sw        $zero, -8($s0)
.LE0082400:
/* 385A40 E0082400 C606FFE0 */  lwc1      $f6, -0x20($s0)
/* 385A44 E0082404 C600FFEC */  lwc1      $f0, -0x14($s0)
/* 385A48 E0082408 C604FFE4 */  lwc1      $f4, -0x1c($s0)
/* 385A4C E008240C 46003180 */  add.s     $f6, $f6, $f0
/* 385A50 E0082410 C600FFF0 */  lwc1      $f0, -0x10($s0)
/* 385A54 E0082414 C602FFE8 */  lwc1      $f2, -0x18($s0)
/* 385A58 E0082418 46002100 */  add.s     $f4, $f4, $f0
/* 385A5C E008241C C600FFF4 */  lwc1      $f0, -0xc($s0)
/* 385A60 E0082420 24020014 */  addiu     $v0, $zero, 0x14
/* 385A64 E0082424 46001080 */  add.s     $f2, $f2, $f0
/* 385A68 E0082428 E606FFE0 */  swc1      $f6, -0x20($s0)
/* 385A6C E008242C E604FFE4 */  swc1      $f4, -0x1c($s0)
/* 385A70 E0082430 16420005 */  bne       $s2, $v0, .LE0082448
/* 385A74 E0082434 E602FFE8 */   swc1     $f2, -0x18($s0)
/* 385A78 E0082438 3C01C000 */  lui       $at, 0xc000
/* 385A7C E008243C 44810000 */  mtc1      $at, $f0
/* 385A80 E0082440 E614FFF0 */  swc1      $f20, -0x10($s0)
/* 385A84 E0082444 E600FFEC */  swc1      $f0, -0x14($s0)
.LE0082448:
/* 385A88 E0082448 2A420014 */  slti      $v0, $s2, 0x14
/* 385A8C E008244C 1040001D */  beqz      $v0, .LE00824C4
/* 385A90 E0082450 2A42000A */   slti     $v0, $s2, 0xa
/* 385A94 E0082454 44920000 */  mtc1      $s2, $f0
/* 385A98 E0082458 00000000 */  nop
/* 385A9C E008245C 46800020 */  cvt.s.w   $f0, $f0
/* 385AA0 E0082460 3C01E008 */  lui       $at, %hi(D_E0082D60)
/* 385AA4 E0082464 D4222D60 */  ldc1      $f2, %lo(D_E0082D60)($at)
/* 385AA8 E0082468 46000021 */  cvt.d.s   $f0, $f0
/* 385AAC E008246C 46220002 */  mul.d     $f0, $f0, $f2
/* 385AB0 E0082470 00000000 */  nop
/* 385AB4 E0082474 C602FFF8 */  lwc1      $f2, -8($s0)
/* 385AB8 E0082478 460010A1 */  cvt.d.s   $f2, $f2
/* 385ABC E008247C 46201082 */  mul.d     $f2, $f2, $f0
/* 385AC0 E0082480 00000000 */  nop
/* 385AC4 E0082484 3C01BFE0 */  lui       $at, 0xbfe0
/* 385AC8 E0082488 44812800 */  mtc1      $at, $f5
/* 385ACC E008248C 44802000 */  mtc1      $zero, $f4
/* 385AD0 E0082490 C600FFF0 */  lwc1      $f0, -0x10($s0)
/* 385AD4 E0082494 C6060018 */  lwc1      $f6, 0x18($s0)
/* 385AD8 E0082498 46000021 */  cvt.d.s   $f0, $f0
/* 385ADC E008249C 46240000 */  add.d     $f0, $f0, $f4
/* 385AE0 E00824A0 3C014120 */  lui       $at, 0x4120
/* 385AE4 E00824A4 44812000 */  mtc1      $at, $f4
/* 385AE8 E00824A8 00000000 */  nop
/* 385AEC E00824AC 46043180 */  add.s     $f6, $f6, $f4
/* 385AF0 E00824B0 46200020 */  cvt.s.d   $f0, $f0
/* 385AF4 E00824B4 E600FFF0 */  swc1      $f0, -0x10($s0)
/* 385AF8 E00824B8 E6060018 */  swc1      $f6, 0x18($s0)
/* 385AFC E00824BC 462010A0 */  cvt.s.d   $f2, $f2
/* 385B00 E00824C0 E602FFF8 */  swc1      $f2, -8($s0)
.LE00824C4:
/* 385B04 E00824C4 54400001 */  bnel      $v0, $zero, .LE00824CC
/* 385B08 E00824C8 AE15FFFC */   sw       $s5, -4($s0)
.LE00824CC:
/* 385B0C E00824CC 8E020000 */  lw        $v0, ($s0)
/* 385B10 E00824D0 26310001 */  addiu     $s1, $s1, 1
/* 385B14 E00824D4 24420001 */  addiu     $v0, $v0, 1
/* 385B18 E00824D8 AE020000 */  sw        $v0, ($s0)
/* 385B1C E00824DC 8E820008 */  lw        $v0, 8($s4)
/* 385B20 E00824E0 0222102A */  slt       $v0, $s1, $v0
/* 385B24 E00824E4 1440FFA9 */  bnez      $v0, .LE008238C
/* 385B28 E00824E8 26100048 */   addiu    $s0, $s0, 0x48
.LE00824EC:
/* 385B2C E00824EC 8FBF0038 */  lw        $ra, 0x38($sp)
/* 385B30 E00824F0 8FB70034 */  lw        $s7, 0x34($sp)
/* 385B34 E00824F4 8FB60030 */  lw        $s6, 0x30($sp)
/* 385B38 E00824F8 8FB5002C */  lw        $s5, 0x2c($sp)
/* 385B3C E00824FC 8FB40028 */  lw        $s4, 0x28($sp)
/* 385B40 E0082500 8FB30024 */  lw        $s3, 0x24($sp)
/* 385B44 E0082504 8FB20020 */  lw        $s2, 0x20($sp)
/* 385B48 E0082508 8FB1001C */  lw        $s1, 0x1c($sp)
/* 385B4C E008250C 8FB00018 */  lw        $s0, 0x18($sp)
/* 385B50 E0082510 D7B60048 */  ldc1      $f22, 0x48($sp)
/* 385B54 E0082514 D7B40040 */  ldc1      $f20, 0x40($sp)
/* 385B58 E0082518 03E00008 */  jr        $ra
/* 385B5C E008251C 27BD0050 */   addiu    $sp, $sp, 0x50