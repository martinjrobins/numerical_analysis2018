% A demonstration of forward Euler code
%
% Solve:  u' = a*u,  u(0) = 1;

a = 2;
f = @(t,u)  a*u;
u0 = 1;

Tf = 1;
k = 0.1;  % desired time step
numsteps = ceil(Tf / k)  % now adjust to have integer steps
k = Tf / numsteps        % modified time step

v = u0;

figure(1); clf;
ms = 'markersize';
plot(0, u0, 'ko', ms, 12);
hold on;
tt = linspace(0, Tf, 1000);
plot(tt, exp(a*tt), 'k-');  % exact solution
grid on
xlabel('t'); ylabel('u');

vold = v;
fnow = f(0,v);
fold = fnow;
for n = 1:numsteps
  t = k*(n-1);
  fnow = f(t,v);
  vnew = v + (k/2)*(3*fnow - fold);

  plot(t+k, vnew, 'r.', ms, 20)
  pause

  fold = fnow;
  v = vnew;
end

