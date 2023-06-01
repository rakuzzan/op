PROGRAM TextStats(INPUT, OUTPUT);
USES TreeUnit, WordUnit;

VAR
  Root: Tree;
  
PROCEDURE CollectStats(VAR InF: TEXT; VAR Root: Tree);
VAR
  Word: STRING;
BEGIN{CollectStats}
  RESET(InF);
  Root := NIL;
  WHILE NOT EOF(InF)
  DO
    IF NOT EOLN(InF)
    THEN
      BEGIN
        ReadWord(InF, Word);
        IF Word <> ''
        THEN
          Insert(Root, Word)
      END
    ELSE
      READLN(InF)
END;{CollectStats} 

BEGIN{TextStat}  
  CollectStats(INPUT, Root);
  PrintTree(OUTPUT, Root);
  DisposeTree(Root);
END.{TextStat}
