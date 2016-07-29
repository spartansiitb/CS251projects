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

function retval = main_task_A3(a)
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

	r = sqrt((xc-xt)*(xc-xt) + (yc-yt)*(yc-yt));
	h = vt*t1/r;
	xt = xc - r*cos(h);
	yt = -r*sin(h);
	xw = xw - xt;
	yw = yw - yt;

	vl = fsolve(@val, 1.0);
	vlsina = vl*sin(a);
	vlcosa = vl*cos(a);
	vl = sqrt(vlsina*vlsina + vlcosa*vlcosa);
	vlcosb = vl*cos(asin(sin(a)/n));

	tanb = tan(asin(sin(a)/n));

	t = (xw - w*tanb)/(vlsina) + (n*n*w*tanb)/(vlsina);
	
    retval = w*n/(vlcosb) + (yw - yt + vw*(t+t1))/(vlcosa) - t;
endfunction

function retval = vlf(v)
	retval = v*v + vt*vt + 2*v*vt*cos(h+a) - vl*vl;
endfunction

[x, fval, info] = fslove(@main_task_A3, 0.68);
% tanb = tan(asin(sin(x)/n));
% t = (xw - w*tanb)/(vl*sin(x)) + (n*n*w*tanb)/(vl*sin(x));
x = x*180/pi;

% xf = xw;
% yf = yw + vw*(t1+t);

% fid = fopen("output_outlab_task_A3.txt","w");

disp(sprintf('%.1f %.1f', x, fval));