const fi = 'xedien.inp';
	  fo = 'xedien.out';
	  maxn = 1000;
	  vc = maxint;
var a:array[1..maxn,1..maxn] of longint;
	n,m,s,k:longint;

procedure input;
var f:text;
	i,j,d1,d2:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,m,s,k);
	for i:=1 to n do
	for j:=1 to n do
		if i <> j then a[i,j]:=vc else a[i,j]:=0;
	for i:=1 to m do
	begin
		readln(f,d1,d2,a[d1,d2]);
		a[d2,d1]:=a[d1,d2];
	end;
	close(f);
end;

procedure main;
var i,j,z:longint;
begin
	for z:=1 to n do
	for i:=1 to n do
	for j:=1 to n do
		if a[i,z] + a[z,j] < a[i,j] then a[i,j]:= a[i,z] + a[z,j];
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	for i:=1 to n do
		if (a[s,i]*2 <= k) and (i <> s) then write(f,i,' ');
	close(f);
end;

begin
	input;
	main;
	output;
end.

