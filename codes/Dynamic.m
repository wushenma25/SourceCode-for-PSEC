% connector on ;
delete(m);
clear;
m = mobiledev;
m. SampleRate =100;
grid on
m.Logging = 1;
pause(0.2);
while 1
    pause(0.1);
    [x, t] = accellog(m);
    subplot(2,3,1:3)
      prin(t,(x(:,1)+x(:,2)+x(:,3))/3);
    subplot(2,3,4)
      prin(t,x(:,1));
    subplot(2,3,5)
      prin(t,x(:,2));
    subplot(2,3,6)
      prin(t,x(:,3));
end

function prin(a,b)
plot(a,b)
grid on
s=a(end);
if s<2
    axis([0,2,-30,30])
else
    axis([s-2,s,-30,30])
end
end