function B = backward_solve(initial)
	col = columns(initial);
	col1 = col*col;
	A = zeros(col1,col1);
	for a = 1:col1
		A(a,a) = 1;
		if(a+col<=col1)
			A(a,a+col) = 1;
		endif
		if(a-col>=1)
			A(a,a-col) = 1;
		endif
		if(a+1<=col1)
			A(a,a+1) = 1;
		endif
		if(a-1>=1)
			A(a,a-1) = 1;
		endif
	endfor
	b=zeros(col1,1);
	for a = 1:col
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
	B=zeros(col,col);
	for a = 1:col
		for aa = 1:col
			B(a,aa) = b((a-1)*col+aa,1);
		endfor
	endfor
endfunction