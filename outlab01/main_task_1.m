function retval = main_task_1(p)
	DATA = load("-ascii", "input_outlab_task_A1.txt");
	y1 = DATA(1,2);
	x1 = DATA(1,1);
	d = DATA(1,3);
	w = DATA(1,4);
	n = DATA(1,5);

	
	angle1 = tan(p);
	angle2 = tan(asin(sin(p)/n));
	retval = x1-w*angle2-(y1-w)*angle1;
endfunction
[x,fval,info] = fsolve(@func,0.8);
x = x * 180/pi;
fid = fopen("output_outlab_task_A1.txt","w");
fdisp(fid,x)