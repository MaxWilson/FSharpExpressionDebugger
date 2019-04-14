
//  Microsoft (R) .NET Framework IL Disassembler.  Version 4.6.1055.0
//  Copyright (c) Microsoft Corporation.  All rights reserved.



// Metadata version: v4.0.30319
.assembly extern mscorlib
{
  .ver 0:0:0:0
}
.assembly extern IrisRuntime
{
  .ver 0:0:0:0
}
.assembly TicTacToe
{

  // --- The following custom attribute is added automatically, do not uncomment -------
  //  .custom instance void [mscorlib]System.Diagnostics.DebuggableAttribute::.ctor(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) = ( 01 00 01 01 00 00 00 00 ) 

  .ver 0:0:0:0
}
.module TicTacToe.exe
// MVID: {0DD678D5-DAFB-4E27-B932-38B2BE51BC1C}
.imagebase 0x00400000
.file alignment 0x00000200
.stackreserve 0x00100000
.subsystem 0x0003       // WINDOWS_CUI
.corflags 0x00020003    //  ILONLY 32BITPREFERRED
// Image base: 0x01630000


// =============== CLASS MEMBERS DECLARATION ===================

.class public auto ansi TicTacToe
       extends [mscorlib]System.Object
{
  .field public static int32[] board
  .field public static int32 movesMade
  .field public static int32 player
  .method public hidebysig static string 
          GetCellString(int32 i) cil managed
  {
    // Code size       95 (0x5f)
    .maxstack  8
    .locals init ([0] string GetCellString)
    IL_0000:  nop
    IL_0001:  ldsfld     string [mscorlib]System.String::Empty
    IL_0006:  stloc.s    GetCellString
    IL_0008:  ldsfld     int32[] TicTacToe::board
    IL_000d:  ldarg.0
    IL_000e:  ldelem.i4
    IL_000f:  ldc.i4.0
    IL_0010:  bne.un     IL_0021

    IL_0015:  ldstr      " "
    IL_001a:  stloc.s    GetCellString
    IL_001c:  br         IL_005c

    IL_0021:  ldsfld     int32[] TicTacToe::board
    IL_0026:  ldarg.0
    IL_0027:  ldelem.i4
    IL_0028:  ldc.i4.1
    IL_0029:  bne.un     IL_003a

    IL_002e:  ldstr      "X"
    IL_0033:  stloc.s    GetCellString
    IL_0035:  br         IL_005c

    IL_003a:  ldsfld     int32[] TicTacToe::board
    IL_003f:  ldarg.0
    IL_0040:  ldelem.i4
    IL_0041:  ldc.i4.1
    IL_0042:  neg
    IL_0043:  bne.un     IL_0054

    IL_0048:  ldstr      "O"
    IL_004d:  stloc.s    GetCellString
    IL_004f:  br         IL_005c

    IL_0054:  nop
    IL_0055:  ldstr      "\?"
    IL_005a:  stloc.s    GetCellString
    IL_005c:  nop
    IL_005d:  ldloc.0
    IL_005e:  ret
  } // end of method TicTacToe::GetCellString

  .method public hidebysig static void  PrintBoard() cil managed
  {
    // Code size       177 (0xb1)
    .maxstack  8
    .locals init ([0] string row,
             [1] string rowEnd,
             [2] int32 i)
    IL_0000:  nop
    IL_0001:  ldsfld     string [mscorlib]System.String::Empty
    IL_0006:  stloc.s    row
    IL_0008:  ldsfld     string [mscorlib]System.String::Empty
    IL_000d:  stloc.s    rowEnd
    IL_000f:  ldstr      "+ - + - + - +"
    IL_0014:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0019:  ldstr      "| "
    IL_001e:  stloc.s    row
    IL_0020:  ldc.i4.1
    IL_0021:  stloc.s    i
    IL_0023:  ldloc.2
    IL_0024:  ldc.i4.s   9
    IL_0026:  bgt        IL_00af

    IL_002b:  nop
    IL_002c:  ldloc.0
    IL_002d:  ldloc.2
    IL_002e:  ldc.i4.1
    IL_002f:  sub
    IL_0030:  call       string TicTacToe::GetCellString(int32)
    IL_0035:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_003a:  stloc.s    row
    IL_003c:  ldloc.0
    IL_003d:  ldstr      " | "
    IL_0042:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0047:  stloc.s    row
    IL_0049:  ldloc.1
    IL_004a:  ldloca.s   i
    IL_004c:  call       instance string [mscorlib]System.Int32::ToString()
    IL_0051:  ldstr      "   "
    IL_0056:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_005b:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0060:  stloc.s    rowEnd
    IL_0062:  ldloc.2
    IL_0063:  ldc.i4.3
    IL_0064:  rem
    IL_0065:  ldc.i4.0
    IL_0066:  bne.un     IL_00a4

    IL_006b:  nop
    IL_006c:  ldloc.0
    IL_006d:  ldstr      "      "
    IL_0072:  ldloc.1
    IL_0073:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0078:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_007d:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0082:  ldstr      "+ - + - + - +"
    IL_0087:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_008c:  ldloc.2
    IL_008d:  ldc.i4.8
    IL_008e:  beq        IL_00a3

    IL_0093:  nop
    IL_0094:  ldstr      "| "
    IL_0099:  stloc.s    row
    IL_009b:  ldstr      ""
    IL_00a0:  stloc.s    rowEnd
    IL_00a2:  nop
    IL_00a3:  nop
    IL_00a4:  nop
    IL_00a5:  ldloc.2
    IL_00a6:  ldc.i4.1
    IL_00a7:  add
    IL_00a8:  stloc.s    i
    IL_00aa:  br         IL_0023

    IL_00af:  nop
    IL_00b0:  ret
  } // end of method TicTacToe::PrintBoard

  .method public hidebysig static void  MakeMove(int32 location) cil managed
  {
    // Code size       38 (0x26)
    .maxstack  8
    IL_0000:  nop
    IL_0001:  ldsfld     int32[] TicTacToe::board
    IL_0006:  ldarg.0
    IL_0007:  ldsfld     int32 TicTacToe::player
    IL_000c:  stelem.i4
    IL_000d:  ldsfld     int32 TicTacToe::player
    IL_0012:  neg
    IL_0013:  stsfld     int32 TicTacToe::player
    IL_0018:  ldsfld     int32 TicTacToe::movesMade
    IL_001d:  ldc.i4.1
    IL_001e:  add
    IL_001f:  stsfld     int32 TicTacToe::movesMade
    IL_0024:  nop
    IL_0025:  ret
  } // end of method TicTacToe::MakeMove

  .method public hidebysig static void  UndoMove(int32 location) cil managed
  {
    // Code size       34 (0x22)
    .maxstack  8
    IL_0000:  nop
    IL_0001:  ldsfld     int32 TicTacToe::movesMade
    IL_0006:  ldc.i4.1
    IL_0007:  sub
    IL_0008:  stsfld     int32 TicTacToe::movesMade
    IL_000d:  ldsfld     int32[] TicTacToe::board
    IL_0012:  ldarg.0
    IL_0013:  ldc.i4.0
    IL_0014:  stelem.i4
    IL_0015:  ldsfld     int32 TicTacToe::player
    IL_001a:  neg
    IL_001b:  stsfld     int32 TicTacToe::player
    IL_0020:  nop
    IL_0021:  ret
  } // end of method TicTacToe::UndoMove

  .method public hidebysig static int32  Winner() cil managed
  {
    // Code size       345 (0x159)
    .maxstack  8
    .locals init ([0] int32 Winner,
             [1] int32 sum)
    IL_0000:  nop
    IL_0001:  ldsfld     int32 TicTacToe::player
    IL_0006:  neg
    IL_0007:  ldc.i4.3
    IL_0008:  mul
    IL_0009:  stloc.s    sum
    IL_000b:  ldsfld     int32[] TicTacToe::board
    IL_0010:  ldc.i4.0
    IL_0011:  ldelem.i4
    IL_0012:  ldsfld     int32[] TicTacToe::board
    IL_0017:  ldc.i4.1
    IL_0018:  ldelem.i4
    IL_0019:  ldsfld     int32[] TicTacToe::board
    IL_001e:  ldc.i4.2
    IL_001f:  ldelem.i4
    IL_0020:  add
    IL_0021:  add
    IL_0022:  ldloc.1
    IL_0023:  bne.un     IL_0035

    IL_0028:  ldsfld     int32 TicTacToe::player
    IL_002d:  neg
    IL_002e:  stloc.s    Winner
    IL_0030:  br         IL_0156

    IL_0035:  ldsfld     int32[] TicTacToe::board
    IL_003a:  ldc.i4.3
    IL_003b:  ldelem.i4
    IL_003c:  ldsfld     int32[] TicTacToe::board
    IL_0041:  ldc.i4.4
    IL_0042:  ldelem.i4
    IL_0043:  ldsfld     int32[] TicTacToe::board
    IL_0048:  ldc.i4.5
    IL_0049:  ldelem.i4
    IL_004a:  add
    IL_004b:  add
    IL_004c:  ldloc.1
    IL_004d:  bne.un     IL_005f

    IL_0052:  ldsfld     int32 TicTacToe::player
    IL_0057:  neg
    IL_0058:  stloc.s    Winner
    IL_005a:  br         IL_0156

    IL_005f:  ldsfld     int32[] TicTacToe::board
    IL_0064:  ldc.i4.6
    IL_0065:  ldelem.i4
    IL_0066:  ldsfld     int32[] TicTacToe::board
    IL_006b:  ldc.i4.7
    IL_006c:  ldelem.i4
    IL_006d:  ldsfld     int32[] TicTacToe::board
    IL_0072:  ldc.i4.8
    IL_0073:  ldelem.i4
    IL_0074:  add
    IL_0075:  add
    IL_0076:  ldloc.1
    IL_0077:  bne.un     IL_0089

    IL_007c:  ldsfld     int32 TicTacToe::player
    IL_0081:  neg
    IL_0082:  stloc.s    Winner
    IL_0084:  br         IL_0156

    IL_0089:  ldsfld     int32[] TicTacToe::board
    IL_008e:  ldc.i4.0
    IL_008f:  ldelem.i4
    IL_0090:  ldsfld     int32[] TicTacToe::board
    IL_0095:  ldc.i4.3
    IL_0096:  ldelem.i4
    IL_0097:  ldsfld     int32[] TicTacToe::board
    IL_009c:  ldc.i4.6
    IL_009d:  ldelem.i4
    IL_009e:  add
    IL_009f:  add
    IL_00a0:  ldloc.1
    IL_00a1:  bne.un     IL_00b3

    IL_00a6:  ldsfld     int32 TicTacToe::player
    IL_00ab:  neg
    IL_00ac:  stloc.s    Winner
    IL_00ae:  br         IL_0156

    IL_00b3:  ldsfld     int32[] TicTacToe::board
    IL_00b8:  ldc.i4.1
    IL_00b9:  ldelem.i4
    IL_00ba:  ldsfld     int32[] TicTacToe::board
    IL_00bf:  ldc.i4.4
    IL_00c0:  ldelem.i4
    IL_00c1:  ldsfld     int32[] TicTacToe::board
    IL_00c6:  ldc.i4.7
    IL_00c7:  ldelem.i4
    IL_00c8:  add
    IL_00c9:  add
    IL_00ca:  ldloc.1
    IL_00cb:  bne.un     IL_00dd

    IL_00d0:  ldsfld     int32 TicTacToe::player
    IL_00d5:  neg
    IL_00d6:  stloc.s    Winner
    IL_00d8:  br         IL_0156

    IL_00dd:  ldsfld     int32[] TicTacToe::board
    IL_00e2:  ldc.i4.2
    IL_00e3:  ldelem.i4
    IL_00e4:  ldsfld     int32[] TicTacToe::board
    IL_00e9:  ldc.i4.5
    IL_00ea:  ldelem.i4
    IL_00eb:  ldsfld     int32[] TicTacToe::board
    IL_00f0:  ldc.i4.8
    IL_00f1:  ldelem.i4
    IL_00f2:  add
    IL_00f3:  add
    IL_00f4:  ldloc.1
    IL_00f5:  bne.un     IL_0107

    IL_00fa:  ldsfld     int32 TicTacToe::player
    IL_00ff:  neg
    IL_0100:  stloc.s    Winner
    IL_0102:  br         IL_0156

    IL_0107:  ldsfld     int32[] TicTacToe::board
    IL_010c:  ldc.i4.0
    IL_010d:  ldelem.i4
    IL_010e:  ldsfld     int32[] TicTacToe::board
    IL_0113:  ldc.i4.4
    IL_0114:  ldelem.i4
    IL_0115:  ldsfld     int32[] TicTacToe::board
    IL_011a:  ldc.i4.8
    IL_011b:  ldelem.i4
    IL_011c:  add
    IL_011d:  add
    IL_011e:  ldloc.1
    IL_011f:  bne.un     IL_0131

    IL_0124:  ldsfld     int32 TicTacToe::player
    IL_0129:  neg
    IL_012a:  stloc.s    Winner
    IL_012c:  br         IL_0156

    IL_0131:  ldsfld     int32[] TicTacToe::board
    IL_0136:  ldc.i4.2
    IL_0137:  ldelem.i4
    IL_0138:  ldsfld     int32[] TicTacToe::board
    IL_013d:  ldc.i4.4
    IL_013e:  ldelem.i4
    IL_013f:  ldsfld     int32[] TicTacToe::board
    IL_0144:  ldc.i4.6
    IL_0145:  ldelem.i4
    IL_0146:  add
    IL_0147:  add
    IL_0148:  ldloc.1
    IL_0149:  bne.un     IL_0156

    IL_014e:  ldsfld     int32 TicTacToe::player
    IL_0153:  neg
    IL_0154:  stloc.s    Winner
    IL_0156:  nop
    IL_0157:  ldloc.0
    IL_0158:  ret
  } // end of method TicTacToe::Winner

  .method public hidebysig static bool  IsGameOver() cil managed
  {
    // Code size       91 (0x5b)
    .maxstack  8
    .locals init ([0] bool IsGameOver,
             [1] int32 winner)
    IL_0000:  nop
    IL_0001:  call       int32 TicTacToe::Winner()
    IL_0006:  stloc.s    winner
    IL_0008:  ldloc.1
    IL_0009:  ldc.i4.0
    IL_000a:  beq        IL_003a

    IL_000f:  nop
    IL_0010:  ldloc.1
    IL_0011:  ldc.i4.1
    IL_0012:  bne.un     IL_0026

    IL_0017:  ldstr      "X wins!"
    IL_001c:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0021:  br         IL_0031

    IL_0026:  nop
    IL_0027:  ldstr      "O wins!"
    IL_002c:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0031:  ldc.i4.1
    IL_0032:  stloc.s    IsGameOver
    IL_0034:  nop
    IL_0035:  br         IL_0058

    IL_003a:  nop
    IL_003b:  nop
    IL_003c:  ldsfld     int32 TicTacToe::movesMade
    IL_0041:  ldc.i4.s   9
    IL_0043:  bne.un     IL_0057

    IL_0048:  nop
    IL_0049:  ldstr      "Game is a draw"
    IL_004e:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0053:  ldc.i4.1
    IL_0054:  stloc.s    IsGameOver
    IL_0056:  nop
    IL_0057:  nop
    IL_0058:  nop
    IL_0059:  ldloc.0
    IL_005a:  ret
  } // end of method TicTacToe::IsGameOver

  .method public hidebysig static int32  Square(string text) cil managed
  {
    // Code size       225 (0xe1)
    .maxstack  8
    .locals init ([0] int32 Square)
    IL_0000:  nop
    IL_0001:  ldarg.0
    IL_0002:  ldstr      "1"
    IL_0007:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_000c:  ldc.i4.0
    IL_000d:  bne.un     IL_001a

    IL_0012:  ldc.i4.1
    IL_0013:  stloc.s    Square
    IL_0015:  br         IL_00de

    IL_001a:  ldarg.0
    IL_001b:  ldstr      "2"
    IL_0020:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_0025:  ldc.i4.0
    IL_0026:  bne.un     IL_0033

    IL_002b:  ldc.i4.2
    IL_002c:  stloc.s    Square
    IL_002e:  br         IL_00de

    IL_0033:  ldarg.0
    IL_0034:  ldstr      "3"
    IL_0039:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_003e:  ldc.i4.0
    IL_003f:  bne.un     IL_004c

    IL_0044:  ldc.i4.3
    IL_0045:  stloc.s    Square
    IL_0047:  br         IL_00de

    IL_004c:  ldarg.0
    IL_004d:  ldstr      "4"
    IL_0052:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_0057:  ldc.i4.0
    IL_0058:  bne.un     IL_0065

    IL_005d:  ldc.i4.4
    IL_005e:  stloc.s    Square
    IL_0060:  br         IL_00de

    IL_0065:  ldarg.0
    IL_0066:  ldstr      "5"
    IL_006b:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_0070:  ldc.i4.0
    IL_0071:  bne.un     IL_007e

    IL_0076:  ldc.i4.5
    IL_0077:  stloc.s    Square
    IL_0079:  br         IL_00de

    IL_007e:  ldarg.0
    IL_007f:  ldstr      "6"
    IL_0084:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_0089:  ldc.i4.0
    IL_008a:  bne.un     IL_0097

    IL_008f:  ldc.i4.6
    IL_0090:  stloc.s    Square
    IL_0092:  br         IL_00de

    IL_0097:  ldarg.0
    IL_0098:  ldstr      "7"
    IL_009d:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_00a2:  ldc.i4.0
    IL_00a3:  bne.un     IL_00b0

    IL_00a8:  ldc.i4.7
    IL_00a9:  stloc.s    Square
    IL_00ab:  br         IL_00de

    IL_00b0:  ldarg.0
    IL_00b1:  ldstr      "8"
    IL_00b6:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_00bb:  ldc.i4.0
    IL_00bc:  bne.un     IL_00c9

    IL_00c1:  ldc.i4.8
    IL_00c2:  stloc.s    Square
    IL_00c4:  br         IL_00de

    IL_00c9:  ldarg.0
    IL_00ca:  ldstr      "9"
    IL_00cf:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_00d4:  ldc.i4.0
    IL_00d5:  bne.un     IL_00de

    IL_00da:  ldc.i4.s   9
    IL_00dc:  stloc.s    Square
    IL_00de:  nop
    IL_00df:  ldloc.0
    IL_00e0:  ret
  } // end of method TicTacToe::Square

  .method public hidebysig static int32  Search(bool root,
                                                int32& computerMove) cil managed
  {
    // Code size       134 (0x86)
    .maxstack  8
    .locals init ([0] int32 Search,
             [1] int32 winner,
             [2] int32 move,
             [3] int32 score,
             [4] int32 nextMove)
    IL_0000:  nop
    IL_0001:  call       int32 TicTacToe::Winner()
    IL_0006:  stloc.s    winner
    IL_0008:  ldloc.1
    IL_0009:  ldc.i4.0
    IL_000a:  beq        IL_001d

    IL_000f:  ldloc.1
    IL_0010:  ldsfld     int32 TicTacToe::player
    IL_0015:  mul
    IL_0016:  stloc.s    Search
    IL_0018:  br         IL_0083

    IL_001d:  nop
    IL_001e:  nop
    IL_001f:  ldsfld     int32 TicTacToe::movesMade
    IL_0024:  ldc.i4.s   9
    IL_0026:  beq        IL_0082

    IL_002b:  nop
    IL_002c:  ldc.i4.2
    IL_002d:  neg
    IL_002e:  stloc.s    Search
    IL_0030:  ldc.i4.0
    IL_0031:  stloc.s    move
    IL_0033:  ldloc.2
    IL_0034:  ldc.i4.8
    IL_0035:  bgt        IL_0081

    IL_003a:  nop
    IL_003b:  ldsfld     int32[] TicTacToe::board
    IL_0040:  ldloc.2
    IL_0041:  ldelem.i4
    IL_0042:  ldc.i4.0
    IL_0043:  bne.un     IL_0076

    IL_0048:  nop
    IL_0049:  ldloc.2
    IL_004a:  call       void TicTacToe::MakeMove(int32)
    IL_004f:  ldc.i4.0
    IL_0050:  ldloca.s   nextMove
    IL_0052:  call       int32 TicTacToe::Search(bool,
                                                 int32&)
    IL_0057:  neg
    IL_0058:  stloc.s    score
    IL_005a:  ldloc.3
    IL_005b:  ldloc.0
    IL_005c:  ble        IL_006f

    IL_0061:  nop
    IL_0062:  ldloc.3
    IL_0063:  stloc.s    Search
    IL_0065:  ldarg.0
    IL_0066:  brfalse    IL_006e

    IL_006b:  ldarg.1
    IL_006c:  ldloc.2
    IL_006d:  stind.i4
    IL_006e:  nop
    IL_006f:  ldloc.2
    IL_0070:  call       void TicTacToe::UndoMove(int32)
    IL_0075:  nop
    IL_0076:  nop
    IL_0077:  ldloc.2
    IL_0078:  ldc.i4.1
    IL_0079:  add
    IL_007a:  stloc.s    move
    IL_007c:  br         IL_0033

    IL_0081:  nop
    IL_0082:  nop
    IL_0083:  nop
    IL_0084:  ldloc.0
    IL_0085:  ret
  } // end of method TicTacToe::Search

  .method public hidebysig static void  MakeComputerMove() cil managed
  {
    // Code size       50 (0x32)
    .maxstack  8
    .locals init ([0] int32 computerMove)
    IL_0000:  nop
    IL_0001:  ldsfld     int32 TicTacToe::movesMade
    IL_0006:  ldc.i4.0
    IL_0007:  bne.un     IL_001e

    IL_000c:  call       int32 [IrisRuntime]IrisRuntime.CompilerServices::Rand()
    IL_0011:  ldc.i4.s   9
    IL_0013:  rem
    IL_0014:  call       void TicTacToe::MakeMove(int32)
    IL_0019:  br         IL_0030

    IL_001e:  nop
    IL_001f:  nop
    IL_0020:  ldc.i4.1
    IL_0021:  ldloca.s   computerMove
    IL_0023:  call       int32 TicTacToe::Search(bool,
                                                 int32&)
    IL_0028:  pop
    IL_0029:  ldloc.0
    IL_002a:  call       void TicTacToe::MakeMove(int32)
    IL_002f:  nop
    IL_0030:  nop
    IL_0031:  ret
  } // end of method TicTacToe::MakeComputerMove

  .method public hidebysig static void  PlayGame(int32 userPlayer) cil managed
  {
    // Code size       231 (0xe7)
    .maxstack  8
    .locals init ([0] int32 i,
             [1] bool gameOver,
             [2] int32 playSquare,
             [3] string input,
             [4] bool accepted)
    IL_0000:  nop
    IL_0001:  ldsfld     string [mscorlib]System.String::Empty
    IL_0006:  stloc.s    input
    IL_0008:  ldc.i4.0
    IL_0009:  stloc.s    i
    IL_000b:  ldloc.0
    IL_000c:  ldc.i4.8
    IL_000d:  bgt        IL_0024

    IL_0012:  ldsfld     int32[] TicTacToe::board
    IL_0017:  ldloc.0
    IL_0018:  ldc.i4.0
    IL_0019:  stelem.i4
    IL_001a:  ldloc.0
    IL_001b:  ldc.i4.1
    IL_001c:  add
    IL_001d:  stloc.s    i
    IL_001f:  br         IL_000b

    IL_0024:  ldc.i4.1
    IL_0025:  stsfld     int32 TicTacToe::player
    IL_002a:  ldc.i4.0
    IL_002b:  stsfld     int32 TicTacToe::movesMade
    IL_0030:  nop
    IL_0031:  ldloc.1
    IL_0032:  brtrue     IL_0061

    IL_0037:  nop
    IL_0038:  call       bool TicTacToe::IsGameOver()
    IL_003d:  stloc.s    gameOver
    IL_003f:  ldloc.1
    IL_0040:  ldc.i4.1
    IL_0041:  xor
    IL_0042:  ldsfld     int32 TicTacToe::player
    IL_0047:  ldarg.0
    IL_0048:  ceq
    IL_004a:  ldc.i4.1
    IL_004b:  xor
    IL_004c:  and
    IL_004d:  brfalse    IL_0060

    IL_0052:  nop
    IL_0053:  call       void TicTacToe::MakeComputerMove()
    IL_0058:  call       bool TicTacToe::IsGameOver()
    IL_005d:  stloc.s    gameOver
    IL_005f:  nop
    IL_0060:  nop
    IL_0061:  ldstr      ""
    IL_0066:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_006b:  call       void TicTacToe::PrintBoard()
    IL_0070:  ldstr      ""
    IL_0075:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_007a:  ldloc.1
    IL_007b:  brtrue     IL_00de

    IL_0080:  nop
    IL_0081:  ldc.i4.0
    IL_0082:  stloc.s    playSquare
    IL_0084:  ldc.i4.0
    IL_0085:  stloc.s    accepted
    IL_0087:  nop
    IL_0088:  ldstr      "Enter square number to play (1-9):"
    IL_008d:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0092:  call       string [mscorlib]System.Console::ReadLine()
    IL_0097:  stloc.s    input
    IL_0099:  ldloc.3
    IL_009a:  call       int32 TicTacToe::Square(string)
    IL_009f:  stloc.s    playSquare
    IL_00a1:  ldloc.2
    IL_00a2:  ldc.i4.0
    IL_00a3:  beq        IL_00cf

    IL_00a8:  nop
    IL_00a9:  ldloc.2
    IL_00aa:  ldc.i4.1
    IL_00ab:  sub
    IL_00ac:  stloc.s    playSquare
    IL_00ae:  ldsfld     int32[] TicTacToe::board
    IL_00b3:  ldloc.2
    IL_00b4:  ldelem.i4
    IL_00b5:  ldc.i4.0
    IL_00b6:  beq        IL_00ca

    IL_00bb:  ldstr      "That square is already occupied"
    IL_00c0:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_00c5:  br         IL_00ce

    IL_00ca:  nop
    IL_00cb:  ldc.i4.1
    IL_00cc:  stloc.s    accepted
    IL_00ce:  nop
    IL_00cf:  nop
    IL_00d0:  ldloc.s    accepted
    IL_00d2:  brfalse    IL_0087

    IL_00d7:  ldloc.2
    IL_00d8:  call       void TicTacToe::MakeMove(int32)
    IL_00dd:  nop
    IL_00de:  nop
    IL_00df:  ldloc.1
    IL_00e0:  brfalse    IL_0030

    IL_00e5:  nop
    IL_00e6:  ret
  } // end of method TicTacToe::PlayGame

  .method public hidebysig static void  Run() cil managed
  {
    // Code size       195 (0xc3)
    .maxstack  8
    .locals init ([0] bool done,
             [1] int32 userPlayer,
             [2] bool accepted,
             [3] string input)
    IL_0000:  nop
    IL_0001:  ldsfld     string [mscorlib]System.String::Empty
    IL_0006:  stloc.s    input
    IL_0008:  nop
    IL_0009:  ldstr      "Welcome to Tic-Tac-Toe.  Do you want to play X or "
    + "O\? (Q to quit)\?"
    IL_000e:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0013:  ldc.i4.0
    IL_0014:  stloc.s    userPlayer
    IL_0016:  ldc.i4.0
    IL_0017:  stloc.s    accepted
    IL_0019:  nop
    IL_001a:  ldc.i4.1
    IL_001b:  stloc.s    accepted
    IL_001d:  call       string [mscorlib]System.Console::ReadLine()
    IL_0022:  stloc.s    input
    IL_0024:  ldloc.3
    IL_0025:  ldstr      "q"
    IL_002a:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_002f:  ldc.i4.0
    IL_0030:  ceq
    IL_0032:  ldloc.3
    IL_0033:  ldstr      "Q"
    IL_0038:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_003d:  ldc.i4.0
    IL_003e:  ceq
    IL_0040:  or
    IL_0041:  brfalse    IL_004e

    IL_0046:  ldc.i4.1
    IL_0047:  stloc.s    done
    IL_0049:  br         IL_00a7

    IL_004e:  ldloc.3
    IL_004f:  ldstr      "x"
    IL_0054:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_0059:  ldc.i4.0
    IL_005a:  ceq
    IL_005c:  ldloc.3
    IL_005d:  ldstr      "X"
    IL_0062:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_0067:  ldc.i4.0
    IL_0068:  ceq
    IL_006a:  or
    IL_006b:  brfalse    IL_0078

    IL_0070:  ldc.i4.1
    IL_0071:  stloc.s    userPlayer
    IL_0073:  br         IL_00a7

    IL_0078:  ldloc.3
    IL_0079:  ldstr      "o"
    IL_007e:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_0083:  ldc.i4.0
    IL_0084:  ceq
    IL_0086:  ldloc.3
    IL_0087:  ldstr      "O"
    IL_008c:  call       int32 [mscorlib]System.String::Compare(string,
                                                                string)
    IL_0091:  ldc.i4.0
    IL_0092:  ceq
    IL_0094:  or
    IL_0095:  brfalse    IL_00a3

    IL_009a:  ldc.i4.1
    IL_009b:  neg
    IL_009c:  stloc.s    userPlayer
    IL_009e:  br         IL_00a7

    IL_00a3:  nop
    IL_00a4:  ldc.i4.0
    IL_00a5:  stloc.s    accepted
    IL_00a7:  nop
    IL_00a8:  ldloc.2
    IL_00a9:  brfalse    IL_0019

    IL_00ae:  ldloc.0
    IL_00af:  brtrue     IL_00ba

    IL_00b4:  ldloc.1
    IL_00b5:  call       void TicTacToe::PlayGame(int32)
    IL_00ba:  nop
    IL_00bb:  ldloc.0
    IL_00bc:  brfalse    IL_0008

    IL_00c1:  nop
    IL_00c2:  ret
  } // end of method TicTacToe::Run

  .method public hidebysig static void  $.main() cil managed
  {
    .entrypoint
    // Code size       20 (0x14)
    .maxstack  8
    IL_0000:  nop
    IL_0001:  ldc.i4.s   9
    IL_0003:  newarr     int32
    IL_0008:  stsfld     int32[] TicTacToe::board
    IL_000d:  call       void TicTacToe::Run()
    IL_0012:  nop
    IL_0013:  ret
  } // end of method TicTacToe::$.main

} // end of class TicTacToe


// =============================================================

// *********** DISASSEMBLY COMPLETE ***********************
