.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.11.1 */

glabel osStartThread
/* 3F680 80064280 27BDFFE0 */  addiu     $sp, $sp, -0x20
/* 3F684 80064284 AFBF0018 */  sw        $ra, 0x18($sp)
/* 3F688 80064288 AFBE0014 */  sw        $fp, 0x14($sp)
/* 3F68C 8006428C AFB00010 */  sw        $s0, 0x10($sp)
/* 3F690 80064290 03A0F021 */  addu      $fp, $sp, $zero
/* 3F694 80064294 0C019B40 */  jal       __osDisableInt
/* 3F698 80064298 AFC40020 */   sw       $a0, 0x20($fp)
/* 3F69C 8006429C 00408021 */  addu      $s0, $v0, $zero
/* 3F6A0 800642A0 8FC30020 */  lw        $v1, 0x20($fp)
/* 3F6A4 800642A4 94620010 */  lhu       $v0, 0x10($v1)
/* 3F6A8 800642A8 24030001 */  addiu     $v1, $zero, 0x1
/* 3F6AC 800642AC 1043000F */  beq       $v0, $v1, .LIQUE_800642EC
/* 3F6B0 800642B0 00000000 */   nop
/* 3F6B4 800642B4 24030008 */  addiu     $v1, $zero, 0x8
/* 3F6B8 800642B8 10430003 */  beq       $v0, $v1, .LIQUE_800642C8
/* 3F6BC 800642BC 00000000 */   nop
/* 3F6C0 800642C0 080190E0 */  j         .LIQUE_80064380
/* 3F6C4 800642C4 00000000 */   nop
.LIQUE_800642C8:
/* 3F6C8 800642C8 8FC20020 */  lw        $v0, 0x20($fp)
/* 3F6CC 800642CC 24030002 */  addiu     $v1, $zero, 0x2
/* 3F6D0 800642D0 A4430010 */  sh        $v1, 0x10($v0)
/* 3F6D4 800642D4 3C048009 */  lui       $a0, %hi(__osRunQueue)
/* 3F6D8 800642D8 24843278 */  addiu     $a0, $a0, %lo(__osRunQueue)
/* 3F6DC 800642DC 0C019AC4 */  jal       __osEnqueueThread
/* 3F6E0 800642E0 8FC50020 */   lw       $a1, 0x20($fp)
/* 3F6E4 800642E4 080190E0 */  j         .LIQUE_80064380
/* 3F6E8 800642E8 00000000 */   nop
.LIQUE_800642EC:
/* 3F6EC 800642EC 8FC20020 */  lw        $v0, 0x20($fp)
/* 3F6F0 800642F0 8C430008 */  lw        $v1, 0x8($v0)
/* 3F6F4 800642F4 10600009 */  beqz      $v1, .LIQUE_8006431C
/* 3F6F8 800642F8 00000000 */   nop
/* 3F6FC 800642FC 8FC20020 */  lw        $v0, 0x20($fp)
/* 3F700 80064300 8C430008 */  lw        $v1, 0x8($v0)
/* 3F704 80064304 3C028009 */  lui       $v0, %hi(__osRunQueue)
/* 3F708 80064308 24423278 */  addiu     $v0, $v0, %lo(__osRunQueue)
/* 3F70C 8006430C 10620003 */  beq       $v1, $v0, .LIQUE_8006431C
/* 3F710 80064310 00000000 */   nop
/* 3F714 80064314 080190D0 */  j         .LIQUE_80064340
/* 3F718 80064318 00000000 */   nop
.LIQUE_8006431C:
/* 3F71C 8006431C 8FC20020 */  lw        $v0, 0x20($fp)
/* 3F720 80064320 24030002 */  addiu     $v1, $zero, 0x2
/* 3F724 80064324 A4430010 */  sh        $v1, 0x10($v0)
/* 3F728 80064328 3C048009 */  lui       $a0, %hi(__osRunQueue)
/* 3F72C 8006432C 24843278 */  addiu     $a0, $a0, %lo(__osRunQueue)
/* 3F730 80064330 0C019AC4 */  jal       __osEnqueueThread
/* 3F734 80064334 8FC50020 */   lw       $a1, 0x20($fp)
/* 3F738 80064338 080190DE */  j         .LIQUE_80064378
/* 3F73C 8006433C 00000000 */   nop
.LIQUE_80064340:
/* 3F740 80064340 8FC20020 */  lw        $v0, 0x20($fp)
/* 3F744 80064344 24030008 */  addiu     $v1, $zero, 0x8
/* 3F748 80064348 A4430010 */  sh        $v1, 0x10($v0)
/* 3F74C 8006434C 8FC20020 */  lw        $v0, 0x20($fp)
/* 3F750 80064350 8C440008 */  lw        $a0, 0x8($v0)
/* 3F754 80064354 0C019AC4 */  jal       __osEnqueueThread
/* 3F758 80064358 8FC50020 */   lw       $a1, 0x20($fp)
/* 3F75C 8006435C 8FC20020 */  lw        $v0, 0x20($fp)
/* 3F760 80064360 0C019AD6 */  jal       __osPopThread
/* 3F764 80064364 8C440008 */   lw       $a0, 0x8($v0)
/* 3F768 80064368 3C048009 */  lui       $a0, %hi(__osRunQueue)
/* 3F76C 8006436C 24843278 */  addiu     $a0, $a0, %lo(__osRunQueue)
/* 3F770 80064370 0C019AC4 */  jal       __osEnqueueThread
/* 3F774 80064374 00402821 */   addu     $a1, $v0, $zero
.LIQUE_80064378:
/* 3F778 80064378 080190E0 */  j         .LIQUE_80064380
/* 3F77C 8006437C 00000000 */   nop
.LIQUE_80064380:
/* 3F780 80064380 3C028009 */  lui       $v0, %hi(__osRunningThread)
/* 3F784 80064384 8C423280 */  lw        $v0, %lo(__osRunningThread)($v0)
/* 3F788 80064388 14400005 */  bnez      $v0, .LIQUE_800643A0
/* 3F78C 8006438C 00000000 */   nop
/* 3F790 80064390 0C019ADC */  jal       __osDispatchThread
/* 3F794 80064394 00000000 */   nop
/* 3F798 80064398 080190F9 */  j         .LIQUE_800643E4
/* 3F79C 8006439C 00000000 */   nop
.LIQUE_800643A0:
/* 3F7A0 800643A0 3C028009 */  lui       $v0, %hi(__osRunningThread)
/* 3F7A4 800643A4 8C423280 */  lw        $v0, %lo(__osRunningThread)($v0)
/* 3F7A8 800643A8 3C038009 */  lui       $v1, %hi(__osRunQueue)
/* 3F7AC 800643AC 8C633278 */  lw        $v1, %lo(__osRunQueue)($v1)
/* 3F7B0 800643B0 8C420004 */  lw        $v0, 0x4($v0)
/* 3F7B4 800643B4 8C630004 */  lw        $v1, 0x4($v1)
/* 3F7B8 800643B8 0043102A */  slt       $v0, $v0, $v1
/* 3F7BC 800643BC 10400009 */  beqz      $v0, .LIQUE_800643E4
/* 3F7C0 800643C0 00000000 */   nop
/* 3F7C4 800643C4 3C028009 */  lui       $v0, %hi(__osRunningThread)
/* 3F7C8 800643C8 8C423280 */  lw        $v0, %lo(__osRunningThread)($v0)
/* 3F7CC 800643CC 24030002 */  addiu     $v1, $zero, 0x2
/* 3F7D0 800643D0 A4430010 */  sh        $v1, 0x10($v0)
/* 3F7D4 800643D4 3C048009 */  lui       $a0, %hi(__osRunQueue)
/* 3F7D8 800643D8 24843278 */  addiu     $a0, $a0, %lo(__osRunQueue)
/* 3F7DC 800643DC 0C019A81 */  jal       __osEnqueueAndYield
/* 3F7E0 800643E0 00000000 */   nop
.LIQUE_800643E4:
/* 3F7E4 800643E4 0C019B5C */  jal       __osRestoreInt
/* 3F7E8 800643E8 02002021 */   addu     $a0, $s0, $zero
/* 3F7EC 800643EC 03C0E821 */  addu      $sp, $fp, $zero
/* 3F7F0 800643F0 8FBF0018 */  lw        $ra, 0x18($sp)
/* 3F7F4 800643F4 8FBE0014 */  lw        $fp, 0x14($sp)
/* 3F7F8 800643F8 8FB00010 */  lw        $s0, 0x10($sp)
/* 3F7FC 800643FC 03E00008 */  jr        $ra
/* 3F800 80064400 27BD0020 */   addiu    $sp, $sp, 0x20
/* 3F804 80064404 00000000 */  nop
/* 3F808 80064408 00000000 */  nop
/* 3F80C 8006440C 00000000 */  nop