UNIT WordUnit;

INTERFACE
CONST
  StrLimit = 100;
PROCEDURE ReadWord(VAR InF: TEXT; VAR Word: STRING);
PROCEDURE ToLowCase(VAR Ch: CHAR);

IMPLEMENTATION

PROCEDURE ToLowCase(VAR Ch: CHAR);
CONST
  UpCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅ¨¸ÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞ‗';
  LowCase = 'abcdefghijklmnopqrstuvwxyzאבגדהוווזחטיךכלםמןנסעףפץצקרשתûü‎‏ÿ';
  Length = 59;
VAR
  I: INTEGER;
BEGIN{ToLowCase}
  FOR I := 1 TO Length
  DO
    IF Ch = UpCase[I]
    THEN
      Ch := LowCase[I]
END;{ToLowCase}

FUNCTION isLetter(VAR Ch: CHAR): BOOLEAN;
BEGIN{isLetter}
  isLetter := Ch IN ['A'..'Z', 'À'..'‗', 'a'..'z', 'א'..'ÿ', '¨', '¸'];
END;{isLetter}
  
PROCEDURE ReadWord(VAR InF: TEXT; VAR Word: STRING);
VAR
  Ch: CHAR;
  Count: INTEGER;
  WordLooking: BOOLEAN; 
BEGIN{ReadWord}
  WordLooking := TRUE;
  Word := '';
  Count := 0;  
  REPEAT
    READ(InF, Ch);
  UNTIL (isLetter(Ch)) OR (EOLN(InF));               
  IF (NOT EOLN(InF)) AND (isLetter(Ch)) AND (Count < StrLimit)
  THEN
    BEGIN       
      WHILE (NOT EOLN(InF)) AND (isLetter(Ch)) AND (Count < StrLimit)
      DO
        BEGIN
          ToLowCase(Ch);            
          Word := Word + Ch;
          Count := Count + 1;
          READ(InF, Ch);           
        END;        
      IF (Ch = '-') AND (NOT EOLN(InF))
      THEN
        BEGIN
          READ(InF, Ch);            
          IF isLetter(Ch)
          THEN
            BEGIN            
              Word := Word + '-';
              Count := Count + 1
            END
        END   
    END;    
  IF (isLetter(Ch)) AND (Count + 1 < StrLimit)
  THEN
    BEGIN
      ToLowCase(Ch);            
      Word := Word + Ch
    END 
END;{ReadWord}

BEGIN {TextFiles}
END.  {TextFiles}
