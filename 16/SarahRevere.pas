PROGRAM Sarah(INPUT, OUTPUT);
VAR 
  W1, W2, W3, W4: CHAR;
  Looking, Sea, Land: BOOLEAN;
  
PROCEDURE WindowMovement(VAR Ch1, Ch2, Ch3, Ch4: CHAR; VAR Look: BOOLEAN);
BEGIN
  Ch1 := Ch2;
  Ch2 := Ch3;
  Ch3 := Ch4;
  READ(Ch4);
  IF W4 = '#'
  THEN
    Look := FALSE
END;

PROCEDURE LookLend(VAR Ch1, Ch2, Ch3, Ch4: CHAR; VAR LookLand: BOOLEAN);
BEGIN
  IF (Ch1 = 'l') AND (Ch2 = 'a') AND (Ch3 = 'n') AND (Ch4 = 'd')
  THEN
    LookLand := TRUE
END;

PROCEDURE LookSea(VAR Ch1, Ch2, Ch3, Ch4: CHAR; VAR LookSea: BOOLEAN);
BEGIN
  IF (Ch2 = 's') AND (Ch3 = 'e') AND (Ch4 = 'a')
  THEN 
    LookSea := TRUE
END;

BEGIN{Sarah}
  Looking := TRUE;
  Sea := FALSE;
  Land := FALSE;
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  WHILE Looking AND NOT (Land OR Sea)
  DO    
    BEGIN
      WindowMovement(W1, W2, W3, W4, Looking);
      LookLend(W1, W2, W3, W4, Land); 
      LookSea(W1, W2, W3, W4, Sea);                
    END;
  IF Sea
  THEN
    WRITE('The British are coming by sea')
  ELSE
    IF Land
    THEN
      WRITE('The British are coming by land')
    ELSE
      WRITE('Sarah didn''t say');
  WRITELN
END.{Sarah}
