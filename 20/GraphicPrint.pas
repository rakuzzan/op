PROGRAM GraphicPrint(INPUT, OUTPUT);
USES
  GraphModule;
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Print(ReadLetter(Ch));
      WRITELN
    END
END.
