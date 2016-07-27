DATA = load("-ascii", "input_outlab_task_A2.txt");
global xt = DATA(1,1);
global yt = DATA(1,2);
global xw = DATA(1,3) - xt;
global yw = DATA(1,4) - yt;
global v2 = DATA(1,5);
global vl = DATA(1,6);
global d = DATA(1,7);
global w = DATA(1,8);
global n = DATA(1,9);
global t1 = DATA(1,10);

function retval = foo(p)
	global xt;
	global yt;
	global xw;
	global yw; 
	global v2;
	global vl;
	global d;
	global w; 
	global n;
	global t1;

	tana = tan(asin(sin(p)/n));
	t = (xw - w*tana)/vl*csc(p) + (n*w*tana)/vl*csc(p);
	vlcos = vl*cos(p);

    retval = w*n/(vlcos) + (yw-d-w)/(vlcos) + (d+v2*(t+t1))/(v2-vlcos) - t;

endfunction

[an, fval, info] = fsolve(@foo, 0.8);

disp(an*180/pi);
disp(fval);
