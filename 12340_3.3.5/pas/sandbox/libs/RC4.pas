unit RC4;

interface

type
TRc4 = record
  index1, index2: byte;
  perm: array [0..255] of byte;
end;

procedure RC4_Init(var Rc4: TRc4; Rc4Key: array of byte);
procedure RC4_transform(var Rc4: TRc4; var input: array of byte; var output: array of byte; len:cardinal);

implementation

procedure RC4_Init;
var
  i: integer;
  j,k: byte;
  keylen: integer;

begin
  keylen:= high(Rc4Key) + 1;

  // Инициализация пермутационного буффера
  for i:= 0 to 255 do Rc4.perm[i]:= i;

  // Установка индексов
  Rc4.index1:= 0;
  Rc4.index2:= 0;
  j:= 0;

  // Генерация пермутационного буффера
  with Rc4 do
    for i:= 0 to 255 do
      begin
        j:= j + perm[i] + Rc4Key[i mod keylen];
        k:= perm[i];
        perm[i]:= perm[j];
        perm[j]:= k;
      end;
end;
procedure RC4_transform;
var
  i: integer;
  j,k: byte;

begin
  with rc4 do
    for i:= 0 to len-1 do
      begin
        index1:= index1 + 1;
        index2:= index2 + perm[index1];

        k:= perm[index1];
        perm[index1]:= perm[index2];
        perm[index2]:= k;

        j:= perm[index1] + perm[index2];

        output[i]:= input[i] xor perm[j];
     end;
end;

end.