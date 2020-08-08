.set noat # allow manual use of $at
.set noreorder # don't insert nops after branches

.include "include/macro.inc"

glabel func_8004DFD4
/* 0293D4 8004DFD4 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 0293D8 8004DFD8 AFB3001C */  sw    $s3, 0x1c($sp)
/* 0293DC 8004DFDC 0080982D */  daddu $s3, $a0, $zero
/* 0293E0 8004DFE0 24060A9C */  addiu $a2, $zero, 0xa9c
/* 0293E4 8004DFE4 AFBF0024 */  sw    $ra, 0x24($sp)
/* 0293E8 8004DFE8 AFB40020 */  sw    $s4, 0x20($sp)
/* 0293EC 8004DFEC AFB20018 */  sw    $s2, 0x18($sp)
/* 0293F0 8004DFF0 AFB10014 */  sw    $s1, 0x14($sp)
/* 0293F4 8004DFF4 AFB00010 */  sw    $s0, 0x10($sp)
/* 0293F8 8004DFF8 8E710074 */  lw    $s1, 0x74($s3)
/* 0293FC 8004DFFC 8E640078 */  lw    $a0, 0x78($s3)
/* 029400 8004E000 0C0153DD */  jal   al_CopyWords
/* 029404 8004E004 0220282D */   daddu $a1, $s1, $zero
/* 029408 8004E008 8E63007C */  lw    $v1, 0x7c($s3)
/* 02940C 8004E00C 8E22001C */  lw    $v0, 0x1c($s1)
/* 029410 8004E010 54620030 */  bnel  $v1, $v0, .L8004E0D4
/* 029414 8004E014 AE600080 */   sw    $zero, 0x80($s3)
/* 029418 8004E018 0000302D */  daddu $a2, $zero, $zero
/* 02941C 8004E01C 2405025C */  addiu $a1, $zero, 0x25c
.L8004E020:
/* 029420 8004E020 02259021 */  addu  $s2, $s1, $a1
/* 029424 8004E024 8E420000 */  lw    $v0, ($s2)
/* 029428 8004E028 50400011 */  beql  $v0, $zero, .L8004E070
/* 02942C 8004E02C 24C60001 */   addiu $a2, $a2, 1
/* 029430 8004E030 92430052 */  lbu   $v1, 0x52($s2)
/* 029434 8004E034 92420053 */  lbu   $v0, 0x53($s2)
/* 029438 8004E038 0062102B */  sltu  $v0, $v1, $v0
/* 02943C 8004E03C 1040000B */  beqz  $v0, .L8004E06C
/* 029440 8004E040 00031040 */   sll   $v0, $v1, 1
/* 029444 8004E044 00431021 */  addu  $v0, $v0, $v1
/* 029448 8004E048 000210C0 */  sll   $v0, $v0, 3
/* 02944C 8004E04C 2444085C */  addiu $a0, $v0, 0x85c
.L8004E050:
/* 029450 8004E050 02241021 */  addu  $v0, $s1, $a0
/* 029454 8004E054 AC40000C */  sw    $zero, 0xc($v0)
/* 029458 8004E058 92420053 */  lbu   $v0, 0x53($s2)
/* 02945C 8004E05C 24630001 */  addiu $v1, $v1, 1
/* 029460 8004E060 0062102B */  sltu  $v0, $v1, $v0
/* 029464 8004E064 1440FFFA */  bnez  $v0, .L8004E050
/* 029468 8004E068 24840018 */   addiu $a0, $a0, 0x18
.L8004E06C:
/* 02946C 8004E06C 24C60001 */  addiu $a2, $a2, 1
.L8004E070:
/* 029470 8004E070 2CC20010 */  sltiu $v0, $a2, 0x10
/* 029474 8004E074 1440FFEA */  bnez  $v0, .L8004E020
/* 029478 8004E078 24A50060 */   addiu $a1, $a1, 0x60
/* 02947C 8004E07C 0000802D */  daddu $s0, $zero, $zero
/* 029480 8004E080 241400FF */  addiu $s4, $zero, 0xff
/* 029484 8004E084 02301821 */  addu  $v1, $s1, $s0
.L8004E088:
/* 029488 8004E088 9062004C */  lbu   $v0, 0x4c($v1)
/* 02948C 8004E08C 50540008 */  beql  $v0, $s4, .L8004E0B0
/* 029490 8004E090 26100001 */   addiu $s0, $s0, 1
/* 029494 8004E094 0220202D */  daddu $a0, $s1, $zero
/* 029498 8004E098 A22200D4 */  sb    $v0, 0xd4($s1)
/* 02949C 8004E09C 90620224 */  lbu   $v0, 0x224($v1)
/* 0294A0 8004E0A0 0240282D */  daddu $a1, $s2, $zero
/* 0294A4 8004E0A4 0C013F4E */  jal   func_8004FD38
/* 0294A8 8004E0A8 A22200D5 */   sb    $v0, 0xd5($s1)
/* 0294AC 8004E0AC 26100001 */  addiu $s0, $s0, 1
.L8004E0B0:
/* 0294B0 8004E0B0 2A020004 */  slti  $v0, $s0, 4
/* 0294B4 8004E0B4 1440FFF4 */  bnez  $v0, .L8004E088
/* 0294B8 8004E0B8 02301821 */   addu  $v1, $s1, $s0
/* 0294BC 8004E0BC 8E650084 */  lw    $a1, 0x84($s3)
/* 0294C0 8004E0C0 8E660088 */  lw    $a2, 0x88($s3)
/* 0294C4 8004E0C4 8E67008C */  lw    $a3, 0x8c($s3)
/* 0294C8 8004E0C8 0C014E5D */  jal   func_80053974
/* 0294CC 8004E0CC 2624002C */   addiu $a0, $s1, 0x2c
/* 0294D0 8004E0D0 AE600080 */  sw    $zero, 0x80($s3)
.L8004E0D4:
/* 0294D4 8004E0D4 8FBF0024 */  lw    $ra, 0x24($sp)
/* 0294D8 8004E0D8 8FB40020 */  lw    $s4, 0x20($sp)
/* 0294DC 8004E0DC 8FB3001C */  lw    $s3, 0x1c($sp)
/* 0294E0 8004E0E0 8FB20018 */  lw    $s2, 0x18($sp)
/* 0294E4 8004E0E4 8FB10014 */  lw    $s1, 0x14($sp)
/* 0294E8 8004E0E8 8FB00010 */  lw    $s0, 0x10($sp)
/* 0294EC 8004E0EC 03E00008 */  jr    $ra
/* 0294F0 8004E0F0 27BD0028 */   addiu $sp, $sp, 0x28
