UNIT GraphModule;
INTERFACE
CONST 
  Len = 25;
TYPE
  Matrix = SET OF 1 .. Len;       
FUNCTION ReadLetter(Ch: CHAR): Matrix;
PROCEDURE Print(Letter: Matrix);   
IMPLEMENTATION 
FUNCTION ReadLetter(Ch: CHAR): Matrix;
BEGIN
  CASE Ch OF
    'M': ReadLetter := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    'D': ReadLetter := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
    'T': ReadLetter := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    'C': ReadLetter := [1, 2, 3, 4, 5, 6, 11, 16, 21, 22, 23, 24, 25]
    ELSE
      ReadLetter := [1 .. Len]
  END    
END;

PROCEDURE Print(Letter: Matrix);
VAR
  I: INTEGER;
BEGIN 
  FOR I := 1 TO Len
  DO
    BEGIN
      IF I IN Letter
      THEN
        WRITE('X')
      ELSE
        WRITE(' ');
      IF I MOD 5 = 0
      THEN
        WRITELN    
    END
END; 
     
BEGIN 
END.
