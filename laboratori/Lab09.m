% Lab 9 - Esercizio di riepilogo

%% 1 - Integrale, Integrale con trapezi
n = 7;
a = n+2;
f = @(x)((a .* x.^5 - 1)./(x.^5 + 1));
x = linspace(0, 1, 10);
y = f(x);

I = integral(f, 0, 1);
It = trapz(x, y);
s1 = griddedInterpolant(x, y);
s1z = s1((1/a)^(1/5));

%% 2a - Integrali compositi (trapezi, punto medio, cavalieri-simpson)
f = @(x)(1 ./ (cos(x)));
a = 0;
b = pi/4;
I = integral(f, a, b);
restrapz = [];
resmedio = [];
rescavsim = [];
for m = [10, 100, 1000, 10000]
    H = (b-a)/m;
    It = trapz(linspace(a, b, m+1), f(linspace(a, b, m+1))); % m sottointervalli = m+1 punti
    Im = pmedc(a, b, m, f);
    Ics = simpsc(a, b, m, f);
    restrapz = [restrapz; m, H, abs(I - It)];
    resmedio = [resmedio; m, H, abs(I - Im)];
    rescavsim = [rescavsim; m, H, abs(I - Ics)];
end
% verifica tabellare errore
disp(restrapz); % l'errore descresce del fattore di crescita^2, (10^2 = 100 ogni iter)
disp(resmedio); % l'errore descresce del fattore di crescita^2, (10^2 = 100 ogni iter)
disp(rescavsim); % l'errore descresce del fattore di crescita^4, (10^4 = 10000 ogni iter)

% verifica grafica errore, cavsim più pendente
loglog(restrapz(:, 1), restrapz(:, 3), resmedio(:, 1), resmedio(:, 3), rescavsim(:, 1), rescavsim(:, 3));
legend("trapz", "medio", "cavsim");
