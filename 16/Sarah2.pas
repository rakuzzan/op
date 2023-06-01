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
    BEGIN
      Look := FALSE;
    END  
END;

PROCEDURE LookingLand(VAR Ch1, Ch2, Ch3, Ch4: CHAR; VAR LookLand: BOOLEAN);
BEGIN
  IF (Ch1 = 'l') AND (Ch2 = 'a') AND (Ch3 = 'n') AND (Ch4 = 'd')
  THEN
    LookLand := TRUE
END;

PROCEDURE LookingSea(Ch2, Ch3, Ch4: CHAR; VAR LookSea: BOOLEAN);
BEGIN
  IF (Ch2 = 's') AND (Ch3 = 'e') AND (Ch4 = 'a')
  THEN
    LookSea := TRUE
END;

BEGIN{Sarah}
  Init(W1, W2, W3, W4, Looking, Sea, Land);
  WHILE Looking AND NOT (Land OR Sea)
  DO    
    BEGIN
      WindowMovement(W1, W2, W3, W4, Looking);
      LookingLand(W1, W2, W3, W4, Land);
      LookingSea(W2, W3, W4, Sea);
    END;
  WRITELN;
  IF (Sea)
  THEN
    WRITELN('Sea');
  IF (Land)
  THEN
    WRITELN('Land');
END.{Sarah}

