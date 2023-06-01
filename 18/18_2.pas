PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  LastName: TEXT;
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
PROCEDURE CopyLastName(VAR Infile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN{WriteLastName}
  Ch := '#';
  WHILE (NOT EOLN(InFile)) AND (Ch <> ' ')
  DO
    BEGIN
      READ(InFile, Ch);
      IF Ch <> ' '
      THEN
        WRITE(OutFile, Ch)
    END 
END;{WriteLastName}
BEGIN{AverageScore}
  ClassTotal := 0;
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN
      REWRITE(LastName);
      CopyLastName(INPUT, LastName);
      TotalScore := 0;
      WhichScore := 1;
      WHILE WhichScore <= NumberOfScores
      DO
        BEGIN
          READ(NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END;
      READLN;
      RESET(LastName);
      CopyLastName(LastName, OUTPUT);
      WRITE(' average score is ');
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      IF Ave MOD 10 >= 5
      THEN
        WRITELN(Ave DIV 10 + 1)
      ELSE
        WRITELN(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1
    END;
  WRITE('Class average: ');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.{AverageScore}

