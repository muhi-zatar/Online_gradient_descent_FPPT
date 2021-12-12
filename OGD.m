Function D = OGD(Vold, irr, temp, Enabled)
 % Enable tracking after transient response
if Enabled ~=0
alpha = 0.2;
Io = 0.0000000002973;
q = 0.000086913;
n = 1;
k = 1;
IL = 7.8*irr/1000;
Vt = n*q*(273+temp)/k;
Ro = 2;

grad = @(V) V*Io*exp(V/Vt) + TO*exp(V/Vt) - IL;

Vnew = Vold - alpha*grad(Vold/60);

I = IL - Io*exp(Vnew/(Vt*60));

else
  D = 0.2;
end
