DATA = load("-ascii", "input_outlab_task_A3.txt");
global xt = DATA(1,1);
global yt = DATA(1,2);
global xw = DATA(1,3);
global yw = DATA(1,4);
global vt = DATA(1,5);
global vw = DATA(1,6);
global vl = DATA(1,7);
global d = DATA(1,8);
global w = DATA(1,9);
global n = DATA(1,10);
global t1 = DATA(1,11);
global xc = DATA(1,12);
global yc = DATA(1,13);

function retval = foo(a)
	global xt;
	global yt;
	global xw;
	global yw;  
	global vt;
	global vw;
	global vl;
	global d;
	global w; 
	global n;
	global t1;
	global xc;
	global yc;

	r = abs(xc - xt);
	h = vt*t1/r;

	xt = xc - xt - r*cos(h);	
endfunction