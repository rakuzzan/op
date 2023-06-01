PROGRAM ReadNum(INPUT, OUTPUT);
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN{ReadDigit}
  D := -1;
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      IF Ch = '0' THEN D := 0 ELSE
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9
    END
END;{ReadDigit}
PROCEDURE ReadNumber(VAR F: TEXT);
VAR
  Number, Digit: INTEGER;
  IsDigit: BOOLEAN;
BEGIN{ReadNumber}
  Number := 0;
  Digit := 0;
  IsDigit := FALSE;
  WHILE (Digit <> -1) AND (Number <> -2)
  DO
    BEGIN
      ReadDigit(INPUT, Digit);
      IF Digit <> -1
      THEN
        BEGIN
          IsDigit := TRUE;
          IF Number <= (MAXINT - Digit) DIV 10
          THEN
            Number := Number*10 + Digit
          ELSE
            Number := -2
        END;
    END;
  IF NOT IsDigit
  THEN
    Number := -1;
  WRITELN(Number)
END;{ReadNumber}
BEGIN{ReadNum}
  ReadNumber(INPUT);
  WRITELN;
  WRITE(MAXINT);
END.{ReadNum}
