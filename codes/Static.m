delete(m);
clear;
m = mobiledev;
m. SampleRate =100;
m.Logging = 1;
pause(10.5);
m.Logging = 0;
[x, t] = accellog(m);
subplot(2,3,1:3)
  plot(t,(x(:,1)+x(:,2)+x(:,3))/3);
%    axis([0,10]);
subplot(2,3,4)
  plot(t,x(:,1));
%    axis([0,10]);
subplot(2,3,5)
  plot(t,x(:,2));
%    axis([0,10]);
subplot(2,3,6)
  plot(t,x(:,3));
%    axis([0,10]);
set(gcf,'position',[80,100,1200,400])
saveas(gca,'jj.jpg');