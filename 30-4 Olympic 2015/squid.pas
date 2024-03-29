const fi = 'squid.inp';
	  fo = 'squid.out';
	  maxn = 1000000;
var a,l:array[1..maxn] of longint;
	n,k,amax,lmax:longint;

procedure input;
var f:text;
	i,d1,d2:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,k);
	amax:=0;
	fillchar(a,sizeof(a),0);
	for i:=1 to n do
	begin
		readln(f,d1,d2);
		a[d2]:=d1;
		if amax < d2 then amax:=d2;
	end;
	close(f);
end;

procedure main;
var i:longint;
begin
	l[1]:=0;
	for i:=1 to k*2+1 do l[1]:=l[1]+a[i];
    lmax:=l[1];
	for i:=2 to amax-k do
	begin
		l[i]:=l[i-1] - a[i-1] + a[i+k*2];
		if l[i] > lmax then lmax:=l[i];
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,lmax);
	close(f);
end;

begin
	input;
	main;
	output;
end.
