TITLE "TO ENCRYPT THE STRING"
DATASEG SEGMENT PARA 'DATA'
   STR1 DB 'SWEEKRITI','$'
   STR3 DB 0AH,0DH,'THE ENCRYPTED STRING IS',0AH,0DH,'$'
   STR4 DB 0AH,0DH,'THE ORIGINAL STRING IS',0AH,0DH,'$'
DATASEG ENDS

CODESEG SEGMENT PARA'CODE'
  ASSUME CS:CODESEG,DS:DATASEG

BEGIN:
  MOV AX,DATASEG
  MOV DS,AX
  MOV ES,AX
  MOV AH,09H
  LEA DX,STR4
  INT 21H

  MOV AH,09H
  LEA DX,STR1
  INT 21H
  CLD

  MOV AX,2323H
  MOV CX,9
  LEA DI,STR1
  REP STOSB

  MOV AH,09H
  LEA DX,STR3
  INT 21H

  MOV AH,09H
  LEA DX,STR1
  INT 21H

  MOV AH,4CH
  INT 21H

CODESEG ENDS
END BEGIN
END
   