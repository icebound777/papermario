.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_802187B0_43A240
/* 43A240 802187B0 27BDFFD8 */  addiu     $sp, $sp, -0x28
/* 43A244 802187B4 F7B60020 */  sdc1      $f22, 0x20($sp)
/* 43A248 802187B8 46006586 */  mov.s     $f22, $f12
/* 43A24C 802187BC F7B40018 */  sdc1      $f20, 0x18($sp)
/* 43A250 802187C0 AFBF0010 */  sw        $ra, 0x10($sp)
/* 43A254 802187C4 0C00A3FC */  jal       length2D
/* 43A258 802187C8 46007506 */   mov.s    $f20, $f14
/* 43A25C 802187CC 4600A18D */  trunc.w.s $f6, $f20
/* 43A260 802187D0 44023000 */  mfc1      $v0, $f6
/* 43A264 802187D4 00000000 */  nop
/* 43A268 802187D8 04420001 */  bltzl     $v0, .L802187E0
/* 43A26C 802187DC 00021023 */   negu     $v0, $v0
.L802187E0:
/* 43A270 802187E0 44821000 */  mtc1      $v0, $f2
/* 43A274 802187E4 00000000 */  nop
/* 43A278 802187E8 468010A0 */  cvt.s.w   $f2, $f2
/* 43A27C 802187EC 46001103 */  div.s     $f4, $f2, $f0
/* 43A280 802187F0 0000202D */  daddu     $a0, $zero, $zero
/* 43A284 802187F4 2406005A */  addiu     $a2, $zero, 0x5a
/* 43A288 802187F8 0080282D */  daddu     $a1, $a0, $zero
/* 43A28C 802187FC 3C078022 */  lui       $a3, %hi(D_8021F984)
/* 43A290 80218800 24E7F984 */  addiu     $a3, $a3, %lo(D_8021F984)
/* 43A294 80218804 30C2FFFF */  andi      $v0, $a2, 0xffff
.L80218808:
/* 43A298 80218808 3083FFFF */  andi      $v1, $a0, 0xffff
/* 43A29C 8021880C 00431023 */  subu      $v0, $v0, $v1
/* 43A2A0 80218810 00021FC2 */  srl       $v1, $v0, 0x1f
/* 43A2A4 80218814 00431021 */  addu      $v0, $v0, $v1
/* 43A2A8 80218818 00021043 */  sra       $v0, $v0, 1
/* 43A2AC 8021881C 00821821 */  addu      $v1, $a0, $v0
/* 43A2B0 80218820 3062FFFF */  andi      $v0, $v1, 0xffff
/* 43A2B4 80218824 00021080 */  sll       $v0, $v0, 2
/* 43A2B8 80218828 00471021 */  addu      $v0, $v0, $a3
/* 43A2BC 8021882C C4400000 */  lwc1      $f0, ($v0)
/* 43A2C0 80218830 4604003C */  c.lt.s    $f0, $f4
/* 43A2C4 80218834 00000000 */  nop
/* 43A2C8 80218838 45020002 */  bc1fl     .L80218844
/* 43A2CC 8021883C 0060302D */   daddu    $a2, $v1, $zero
/* 43A2D0 80218840 0060202D */  daddu     $a0, $v1, $zero
.L80218844:
/* 43A2D4 80218844 24A50001 */  addiu     $a1, $a1, 1
/* 43A2D8 80218848 30A2FFFF */  andi      $v0, $a1, 0xffff
/* 43A2DC 8021884C 2C420007 */  sltiu     $v0, $v0, 7
/* 43A2E0 80218850 1440FFED */  bnez      $v0, .L80218808
/* 43A2E4 80218854 30C2FFFF */   andi     $v0, $a2, 0xffff
/* 43A2E8 80218858 3082FFFF */  andi      $v0, $a0, 0xffff
/* 43A2EC 8021885C 00021080 */  sll       $v0, $v0, 2
/* 43A2F0 80218860 30C3FFFF */  andi      $v1, $a2, 0xffff
/* 43A2F4 80218864 3C018022 */  lui       $at, %hi(D_8021F984)
/* 43A2F8 80218868 00220821 */  addu      $at, $at, $v0
/* 43A2FC 8021886C C422F984 */  lwc1      $f2, %lo(D_8021F984)($at)
/* 43A300 80218870 00031880 */  sll       $v1, $v1, 2
/* 43A304 80218874 46041081 */  sub.s     $f2, $f2, $f4
/* 43A308 80218878 3C018022 */  lui       $at, %hi(D_8021F984)
/* 43A30C 8021887C 00230821 */  addu      $at, $at, $v1
/* 43A310 80218880 C420F984 */  lwc1      $f0, %lo(D_8021F984)($at)
/* 43A314 80218884 46040001 */  sub.s     $f0, $f0, $f4
/* 43A318 80218888 46001085 */  abs.s     $f2, $f2
/* 43A31C 8021888C 46000005 */  abs.s     $f0, $f0
/* 43A320 80218890 4600103C */  c.lt.s    $f2, $f0
/* 43A324 80218894 00000000 */  nop
/* 43A328 80218898 45000002 */  bc1f      .L802188A4
/* 43A32C 8021889C 00C0182D */   daddu    $v1, $a2, $zero
/* 43A330 802188A0 0080182D */  daddu     $v1, $a0, $zero
.L802188A4:
/* 43A334 802188A4 44800000 */  mtc1      $zero, $f0
/* 43A338 802188A8 00000000 */  nop
/* 43A33C 802188AC 4600B03C */  c.lt.s    $f22, $f0
/* 43A340 802188B0 00000000 */  nop
/* 43A344 802188B4 4500000A */  bc1f      .L802188E0
/* 43A348 802188B8 00000000 */   nop
/* 43A34C 802188BC 4614003E */  c.le.s    $f0, $f20
/* 43A350 802188C0 00000000 */  nop
/* 43A354 802188C4 45000004 */  bc1f      .L802188D8
/* 43A358 802188C8 240200B4 */   addiu    $v0, $zero, 0xb4
/* 43A35C 802188CC 00431823 */  subu      $v1, $v0, $v1
/* 43A360 802188D0 44800000 */  mtc1      $zero, $f0
/* 43A364 802188D4 00000000 */  nop
.L802188D8:
/* 43A368 802188D8 4600B03C */  c.lt.s    $f22, $f0
/* 43A36C 802188DC 00000000 */  nop
.L802188E0:
/* 43A370 802188E0 45000005 */  bc1f      .L802188F8
/* 43A374 802188E4 00000000 */   nop
/* 43A378 802188E8 4600A03C */  c.lt.s    $f20, $f0
/* 43A37C 802188EC 00000000 */  nop
/* 43A380 802188F0 45030001 */  bc1tl     .L802188F8
/* 43A384 802188F4 246300B4 */   addiu    $v1, $v1, 0xb4
.L802188F8:
/* 43A388 802188F8 44800000 */  mtc1      $zero, $f0
/* 43A38C 802188FC 00000000 */  nop
/* 43A390 80218900 4616003E */  c.le.s    $f0, $f22
/* 43A394 80218904 00000000 */  nop
/* 43A398 80218908 45000006 */  bc1f      .L80218924
/* 43A39C 8021890C 00000000 */   nop
/* 43A3A0 80218910 4600A03C */  c.lt.s    $f20, $f0
/* 43A3A4 80218914 00000000 */  nop
/* 43A3A8 80218918 45000002 */  bc1f      .L80218924
/* 43A3AC 8021891C 24020168 */   addiu    $v0, $zero, 0x168
/* 43A3B0 80218920 00431823 */  subu      $v1, $v0, $v1
.L80218924:
/* 43A3B4 80218924 8FBF0010 */  lw        $ra, 0x10($sp)
/* 43A3B8 80218928 D7B60020 */  ldc1      $f22, 0x20($sp)
/* 43A3BC 8021892C D7B40018 */  ldc1      $f20, 0x18($sp)
/* 43A3C0 80218930 3062FFFF */  andi      $v0, $v1, 0xffff
/* 43A3C4 80218934 03E00008 */  jr        $ra
/* 43A3C8 80218938 27BD0028 */   addiu    $sp, $sp, 0x28