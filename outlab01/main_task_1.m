DATA = load("-ascii", "input_outlab_task_A1.txt");
global y1 = DATA(1,2);
global x1 = DATA(1,1);
global d = DATA(1,3);
global w = DATA(1,4);
global n = DATA(1,5);

function retval = main_task_1(p)
	global y1;
	global x1;
	global d;
	global w;
	global n;

	angle1 = tan(p);
	angle2 = tan(asin(sin(p)/n));
	retval = x1-w*angle2-(y1-w)*angle1;
endfunction

[x,fval,info] = fsolve(@main_task_1,0.8);
x = x * 180/pi;
fid = fopen("output_outlab_task_A1.txt","w");
fdisp(fid,x);