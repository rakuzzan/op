PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
 и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  MaxLen = 1 .. Len;
  Str = ARRAY [MaxLen] OF ' ' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
VAR
  MsgLength: MaxLen;
  Msg: Str;
  Code: Chiper;
  FCode: TEXT;
PROCEDURE Initialize(VAR Code: Chiper; VAR FCode: TEXT);
VAR
  Ch: 'A' .. 'Z';
  CodeCh: CHAR;
{Присвоить Code шифр замены}
BEGIN{Initialize}
  WHILE NOT EOF(FCode)
  DO
    BEGIN
      IF NOT EOLN(FCode)
      THEN
        READ(FCode, Ch);
      IF NOT EOLN(FCode)
      THEN
        READ(FCode, CodeCh);
      Code[Ch] := CodeCh;
      READLN(FCode)                               
    END
END;{Initialize}

PROCEDURE Encode(VAR S: Str; MsgLength: MaxLen);
{Выводит символы из Code, соответствующие символам из S}
VAR
  I: 1 .. MsgLength;
BEGIN{Encode}
  FOR I := 1 TO (MsgLength - 1)
  DO
    IF S[I] IN ['A' .. 'Z']
    THEN
      WRITE(Code[S[I]])
    ELSE
      IF S[I] = ' '
      THEN
        WRITE('%')
      ELSE
        WRITE(S[I]);      
  WRITELN
END;{Encode}

BEGIN{Encryption}
  {Инициализировать Code}
  ASSIGN(FCode, 'Code.txt');
  RESET(FCode);
  Initialize(Code, FCode);
  WHILE NOT EOF
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      MsgLength := 1;
      WHILE NOT EOLN AND (MsgLength <= Len)
      DO
        BEGIN
          READ(Msg[MsgLength]);
          WRITE(Msg[MsgLength]);
          MsgLength := MsgLength + 1
        END;
      READLN;
      WRITELN;
      {распечатать кодированное сообщение}
      Encode(Msg, MsgLength)
    END
END.{Encryption}

