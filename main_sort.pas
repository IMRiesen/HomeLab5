var choose,n,i : integer;
M : array of integer;
//C : array of integer;
f : text;
wf : text;

procedure array_from_file(ff : text);
var x : integer;
begin
  reset(ff);
  while not Eof(ff) do begin
    n := n + 1;
    readln(ff,x);
    Setlength(M, n);
    M[n-1] := x;
  end;
  //n := length(M);
  CloseFile(ff);
end;

procedure podchet(A : array of integer);
var C : array of integer;
g,nn,j,r : integer;
ff : boolean;
begin
  //nn := A[0];
  //for r := 0 to n-1 do if nn < A[r] then nn := A[r];
  nn := A.Max;
  //print(nn);
  setlength(C,nn+1);
  for r := 0 to n-1 do if A[r] >= 0 then C[A[r]] := C[A[r]] + 1 else begin ff := True; break; end;
  //writeln(C);
  if ff = False then
  for j := 0 to nn do begin
        for r := 0 to C[j] - 1 do begin
            A[g] := j;
            g := g + 1;
        end;
  end else writeln('Данный алгоритм не способен работать с отрицательными числами');
  //write(A);
end;

procedure q_sort(l, r : integer; S : array of integer);
var ll,rr,t,sr : integer;
begin
  ll := l;
  rr := r;
  sr := S[(l+r) div 2];
  repeat
    while S[ll] < sr do ll := ll + 1;
    while S[rr] > sr do rr := rr - 1;
    if ll <= rr then begin
      t := S[rr];
      S[rr] := S[ll];
      S[ll] := t;
      ll := ll + 1;
      rr := rr - 1;
    end;
  until ll > rr;
  if l < rr then q_sort(l,rr,S);
  if ll < r then q_sort(ll,r,S);
end;

//function bistriy(S : array of integer) : array of integer;
//var left,sr,right : integer;
//begin
//  left := 0;
//  right := length(S)-1;
//  q_sort(left,right,S);
//  Result := S;
//end;

begin
  //writeln('Введите длину массива');
  //readln(n);
  //setlength(M,n);
  
  Writeln('Какой массив использовать?');
  Writeln('1 – Первый массив');
  Writeln('2 – Второй массив');
  Writeln('3 – Третий массив');
  Writeln('0 – Задать массив самостоятельно');
  Assign(wf, 'write_array.txt');
  readln(choose);
  case choose of
    1 : begin Assign(f, 'array1.txt'); array_from_file(f); end;
    2 : begin Assign(f, 'array2.txt'); array_from_file(f); end;
    3 : begin Assign(f, 'array3.txt'); array_from_file(f); end;
    0 : begin write('Задайте длину массива: '); readln(n); setlength(M,n); writeln('Впишите элементы массива: '); for i := 0 to n-1 do readln(M[i]); end;
  end;
  
  writeln(M);
  writeln('Какой способ сортировки использовать?');
  writeln('1 – Алгоритм подсчётом');
  writeln('2 – Быстрый алгоритм');
  
  readln(choose);
  case choose of 
    1 : podchet(M);
    2 : q_sort(0,n-1,M);
    //0 : exit
  end;
  writeln(M);
  Rewrite(wf, 'write_array.txt');
  for i := 0 to length(M) - 1 do begin
    writeln(wf, M[i]);
  end;
  CloseFile(wf);
  writeln('Массив сохранён в файл write_array.txt');
end.