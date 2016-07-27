function B = backward_solve(initial)
	col = columns(initial);
	row = rows(initial);
	col1 = col*row;
	A = zeros(col1,col1);
	for a = 1:row
		for aa = 1:col
			A((a-1)*col+aa,(a-1)*col+aa) = 1;
			if(a>1)
				A((a-1)*col+aa,(a-1)*col+aa-col) = 1;
			endif
			if(a<row)
				A((a-1)*col+aa,(a-1)*col+aa+col) = 1;
			endif
			if(aa>1)
				A(((a-1)*col+aa),((a-1)*col+aa-1)) = 1;
			endif
			if(aa<col)
				A((a-1)*col+aa,(a-1)*col+aa+1) = 1;
			endif
		endfor
	endfor
	b=zeros(col1,1);
	for a = 1:row
		for aa = 1:col
			b((a-1)*col+aa,1) = initial(a,aa);
		endfor
	endfor
	m=1;
	while (m<=col1)
		% on mth column
		temp1=m;
		while (A(temp1,m)==0)
			temp1=temp1+1;
		endwhile
		if(temp1!=m)
			A([temp1 m],:) = A([m temp1],:);
			b([temp1 m],:) = b([m temp1],:);
		endif
		n=1;
		while (n<=col1)
			if(A(n,m)==1 && n!=m)
				A(n,:) = mod(A(n,:) + A(m,:),2);
				b(n,1) = mod(b(n,1) + b(m,1),2);
			endif
			n=n+1;
		endwhile
		m=m+1;
	endwhile
	B=zeros(row,col);
	for a = 1:row
		for aa = 1:col
			B(a,aa) = b((a-1)*col+aa,1);
		endfor
	endfor
endfunction