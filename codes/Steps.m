%Start
if exist('m','var')
    delete(m);
    clear;
end
m=mobiledev;
m.loggin=1;

%Main
pause(61);
m.loggin=0;
[x, t] = accellog(m);
first=(x(:,1)+x(:,2)+x(:,3))/3;
last1=0;
new=0;
step=0;
dt=0;
max=0;
min=50;
for a=uint16(2:2:600)
	last1=new;
	new=first(a);
	if rem(a,50)==0%Dynamic thresholds
	    b=uint16(a-50);
		c=first(b+1);
		while b<a
		    if c>max
			    max=c;
		    end
			if c<min
			    min=c;
			end
			b=uint16(b+1);
        end
		dt=(min+max)/2;
	end
	if last1>dt && new<dt
	    step=step+1;
	end
end
step
    

%Just write a simple version first due to time constraints.