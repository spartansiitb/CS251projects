function B = backward_solve_3(initial)
	A = [
			[1 1 0 1 0 0 0 0 0];
			[1 1 1 0 1 0 0 0 0];
			[0 1 1 0 0 1 0 0 0];
			[1 0 0 1 1 0 1 0 0];
			[0 1 0 1 1 1 0 1 0];
			[0 0 1 0 1 1 0 0 1];
			[0 0 0 1 0 0 1 1 0];
			[0 0 0 0 1 0 1 1 1];
			[0 0 0 0 0 1 0 1 1]
		];
	b = [
			[initial(1,1)];
			[initial(1,2)];
			[initial(1,3)];
			[initial(2,1)];
			[initial(2,2)];
			[initial(2,3)];
			[initial(3,1)];
			[initial(3,2)];
			[initial(3,3)]
		];
	m=1;
	while (m<10)
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
		while (n<10)
			if(A(n,m)==1 && n!=m)
				A(n,:) = mod(A(n,:) + A(m,:),2);
				b(n,1) = mod(b(n,1) + b(m,1),2);
			endif
			n=n+1;
		endwhile
		m=m+1;
	endwhile
	B =	[
			[b(1,1) b(2,1) b(3,1)];
			[b(4,1) b(5,1) b(6,1)];
			[b(7,1) b(8,1) b(9,1)];
	];
endfunction