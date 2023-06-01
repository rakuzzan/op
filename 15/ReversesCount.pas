PROGRAM ReversesCount(INPUT, OUTPUT);
USES
	Count3;
VAR
  PrevCh, Ch, NextCh, V1, V10, V100: CHAR;
	
BEGIN
  Start;
  PrevCh := ' ';
  WRITE('Вход: ');
  IF NOT EOLN(INPUT)
  THEN
    READ(Ch);
	IF NOT EOLN(INPUT)
	THEN
    READ(NextCh);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      PrevCh := Ch;
      Ch := NextCh;
      READ(NextCh);
      IF ((Ch > PrevCh) AND (Ch > NextCh)) OR ((Ch < PrevCh) AND (Ch < NextCh))
      THEN
        Bump
    END;   
	Value(V100, V10, V1);
  WRITELN;
  WRITELN('Количество реверсов: ');
  WRITELN(V100, V10, V1)
END.				  				     
