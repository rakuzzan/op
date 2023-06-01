PROGRAM SarahRevere(INPUT, OUTPUT);
VAR 
  W1, W2, W3, W4: CHAR;
  Looking, Sea, Land: BOOLEAN;
BEGIN{SarahRevere}
  Looking := TRUE;
  Sea := FALSE;
  Land := FALSE;
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  WHILE Looking AND NOT(Land OR Sea)
  DO
    BEGIN
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      Looking := W4 <> '#';
      IF (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd')
      THEN
        Land := TRUE;
      IF (W2 = 's') AND (W3 = 'e') AND (W4 = 'a')
      THEN
        Sea := TRUE
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
END.{SarahRevere}
