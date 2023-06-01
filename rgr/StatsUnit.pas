UNIT StatsUnit;
INTERFACE
PROCEDURE MakeStat(VAR InF: TEXT; VAR OutF: TEXT);

IMPLEMENTATION
USES
  WordUnit, TreeUnit;

PROCEDURE MakeStat(VAR InF: TEXT; VAR OutF: TEXT);
VAR 
  Slovo: STRING;
  J: INTEGER;
  Root: Tree;

BEGIN
  Root := NIL;
  RESET(InF);
  REWRITE(OutF);
  WHILE NOT EOF(InF) 
  DO
    IF NOT EOLN(InF)
    THEN
      BEGIN
        ReadWord(InF, Slovo);
        IF Slovo <> ''
        THEN
          Insert(Root, Slovo)
        ELSE
          READLN(InF)
      END;
  PrintTree(Root, OutF);
  DisposeTree(Root);
END;
      
BEGIN
END.
