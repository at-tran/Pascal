const fi = 'mergesort.inp';
	  fo = 'mergesort.out';
	  maxn = 1000;
var a:array[1..maxn] of longint;
	n:longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n do read(f,a[i]);
	close(f);
end;

procedure merge(i,k,j:longint);
var v1,v2,count,z:longint;
	b,c:array[1..(maxn div 2 +1)] of longint;
begin
	for z:=i to k do b[z]:=a[z]; b[z+1]:=maxlongint;
	for z:=k+1 to j do c[z]:=a[z]; c[z+1]:=maxlongint;
	v1:=i;
	v2:=k+1;
	count:=i-1;
	repeat
	inc(count);
	if b[v1] <= c[v2] then
	begin
		a[count]:=b[v1];
		inc(v1);
	end
	else
	begin
		a[count]:=c[v2];
		inc(v2);
	end;
	until (b[v1] = maxlongint) and (c[v2] = maxlongint);
end;

procedure mergesort(d,c:longint);
var mid:longint;
begin
	if d < c then
	begin
	mid:=(d+c) div 2;
	mergesort(d,mid);
	mergesort(mid+1,c);
	merge(d,mid,c);
	end;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	for i:=1 to n do write(f,a[i],' ');
	close(f);
end;

begin
	input;
	mergesort(1,n);
	output;
end.
