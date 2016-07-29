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

function retval = main_task_2(a)
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

	tanb = tan(asin(sin(a)/n));
	t = (xw - w*tanb)/(vl*sin(a)) + (n*n*w*tanb)/(vl*sin(a));
	vlcosa = vl*cos(a);
	vlcosb = vl*cos(asin(sin(a)/n));

    retval = w*n/(vlcosb) + (yw-d-w)/(vlcosa) + (d+v2*(t+t1))/(vlcosa) - t;

endfunction

[x, fval, info] = fsolve(@main_task_2, 0.8);
tanb = tan(asin(sin(x)/n));
t = (xw - w*tanb)/(vl*sin(x)) + (n*n*w*tanb)/(vl*sin(x));
x = x*180/pi;

xf = xw;
yf = yw + v2*(t1+t);

fid = fopen("output_outlab_task_A2.txt","w");

fdisp(fid,sprintf('%.1f %.1f %.1f', x, xf, yf));