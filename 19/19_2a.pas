PROGRAM SortDate(INPUT, OUTPUT);
USES
  DateType;
TYPE
  FileOfDate = FILE OF Date;
VAR
  VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;
BEGIN {SortDate}
  ASSIGN(DateFile, 'DF.DAT');
  ASSIGN(TFile, 'TF.DAT');
  ASSIGN(FInput, 'FI.TXT');
  REWRITE(DateFile);
  RESET(FInput);
  ReadDate(FInput, VarDate);
  READLN(FInput);
  WRITE(DateFile, VarDate);
  RESET(DateFile);
  WriteDate(OUTPUT, VarDate);
END. {SortDate}
