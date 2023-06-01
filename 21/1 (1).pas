PROGRAM Encryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
 � �������� ����� ������� � OUTPUT}
CONST
  Len = 20;
TYPE
  MaxLen = 1 .. 20;
  Str = ARRAY [MaxLen] OF ' ' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
VAR
  MsgLength: MaxLen;
  Msg: Str;
  Code: Chiper;
PROCEDURE Initialize(VAR Code: Chiper);
{��������� Code ���� ������}
BEGIN{Initialize}
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A'
END;{Initialize}

PROCEDURE Encode(VAR S: Str; MsgLength: MaxLen);
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: 1 .. MsgLength;
BEGIN{Encode}
  FOR Index := 1 TO (MsgLength - 1)
  DO
    IF S[Index] IN ['A' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      IF S[Index] = ' '
      THEN
        WRITE('&')
      ELSE
        WRITE(S[Index]);
  WRITELN
END;{Encode}

BEGIN{Encryption}
  {���������������� Code}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      {������ ������ � Msg � ����������� ��}
      MsgLength := 1;
      WHILE NOT EOLN AND (MsgLength <= Len)
      DO
        BEGIN
          READ(Msg[MsgLength]);
          WRITE(Msg[MsgLength]);
          MsgLength := MsgLength + 1;
        END;
      READLN;
      WRITELN;
      {����������� ������������ ���������}
      Encode(Msg, MsgLength)
    END
END.{Encryption}

