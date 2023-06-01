UNIT TreeUnit;
INTERFACE
TYPE
  Tree = ^NodeType;
  NodeType = RECORD
               Word: STRING;
               LLink, RLink: Tree;
               Amount: INTEGER 
             END;

PROCEDURE Insert(VAR Ptr: Tree; VAR Data: STRING);
PROCEDURE PrintTree(VAR OutFile: TEXT; VAR Ptr: Tree);
PROCEDURE DisposeTree(VAR Ptr: Tree);
IMPLEMENTATION

PROCEDURE Insert(VAR Ptr: Tree; VAR Data: STRING);
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN {Создаем лист со значением Data}
      NEW(Ptr);
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL;
      Ptr^.Word := Data;
      Ptr^.Amount := 1;
    END
  ELSE
    IF Ptr^.Word = Data
    THEN
      Ptr^.Amount := Ptr^.Amount + 1
    ELSE
      IF Ptr^.Word > Data
      THEN
        Insert(Ptr^.LLink, Data)
      ELSE
        Insert(Ptr^.RLink, Data)
END; {Insert}

PROCEDURE PrintTree(VAR OutFile: TEXT; VAR Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN {Печатает поддерево слева, вершину, поддерево справа}
    BEGIN
      PrintTree(OutFile, Ptr^.LLink);
      WRITELN(OutFile, Ptr^.Word, ' ', Ptr^.Amount);
      PrintTree(OutFile, Ptr^.RLink)
    END
END; {PrintTree}

PROCEDURE DisposeTree(VAR Ptr: Tree);
BEGIN
  IF Ptr <> NIL
  THEN
    BEGIN
      DisposeTree(Ptr^.LLink);
      DisposeTree(Ptr^.RLink);
      DISPOSE(Ptr);
      Ptr := NIL
    END
END;

BEGIN
END.
