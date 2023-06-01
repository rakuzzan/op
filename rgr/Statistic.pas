UNIT Statistic;
INTERFACE
PROCEDURE MakeStat();

IMPLEMENTATION
USES
  WordUnit, TreeUnit;

PROCEDURE MakeStat();
VAR 
  Slovo: STRING;
  I: INTEGER;
  Root: Tree;
BEGIN
  Root := NIL;
  WHILE NOT EOF 
  DO
    BEGIN
      Slovo := ReadWord();
      IF NOT(Slovo = '')
      THEN
        BEGIN
          FOR I := 1 TO LENGTH(Slovo)
          DO
            ToLowCase(Slovo[I]);
          Insert(Root, Slovo)
        END
    END;
  DisposeTree(Root)
END;
      
BEGIN
END.
