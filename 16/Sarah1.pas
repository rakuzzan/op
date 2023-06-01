PROGRAM Sarah(INPUT, OUTPUT);
VAR 
  W1, W2, W3, W4: CHAR;
  Looking, Sea, Land: BOOLEAN;

PROCEDURE Init(VAR W1, W2, W3, W4: CHAR; Looking, Sea, Land: BOOLEAN);
BEGIN
  Looking := TRUE;
  Sea := FALSE;
  Land := FALSE;
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
END;
  
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

BEGIN{Sarah}
  Init(W1, W2, W3, W4, Looking, Sea, Land);
  WHILE Looking AND NOT (Land OR Sea)
  DO
    BEGIN
      WindowMovement(W1, W2, W3, W4, Looking); 
      WRITELN(W1, W2, W3, W4)            
    END;
  WRITELN    
END.{Sarah}

