% Lab 7 - Esercizi di riepilogo

%% 1.1 - Funzione anonima, Polinomio interpolatore, Valutare polinomio
f = @(x)((2 .* sin(x) .* cos(x))./(1 + x.^2));
xi = linspace(0, 2, 10);
p = polyfit(xi, f(xi), 9); % Grado polinomio: N punti - 1
zk = linspace(0, 2, 100);
E = max(abs(f(zk) - polyval(p, zk))); % polyval: valutare polinomio

%% 1.2 - Derivata polinomio, Zeri polinomio
dp = polyder(p);
x = linspace(0, 2, 100);
figure();
% funzione, polinomio interpolatore, derivata, punti interpolati
plot(x, f(x), x, polyval(p, x), "--", x, polyval(dp, x), xi, f(xi), "o");
legend("f", "p", "p'", "punti");
grid on;

zeri = roots(dp); % Zeri di polinomio
% Per trovare zeri di funzione: fzero
zeri = zeri(imag(roots(dp)) == 0); % Togliere immaginari
zeri = zeri(zeri >= 0 & zeri <= 2); % Filtrare in intervallo
max(zeri);

%% 1.3 - Spline lineare
s1 = griddedInterpolant(xi, f(xi));
zk = linspace(0, 2, 100);
E = max(abs(f(zk) - s1(zk)));

%% 2.1 - Polinomio interpolatore
g = @(x)(x.^2 ./ (1 + x.^2));
xi = linspace(-4, 4, 11); % Quindi 11 punti
p = polyfit(xi, g(xi), 10); % Polinomio grado 10
x = linspace(-4, 4, 100);
figure();
plot(x, g(x), x, polyval(p, x), "--", xi, g(xi), "o");
legend("g", "p", "punti");
z = linspace(-4, 4, 100);
E = max(abs(g(z) - polyval(p, z)));

%% 2.2 - Punti di Chebyshev
n = 11;
ck = @(k)(4 .* cos((pi .* (2 .* k - 1)) ./ (2 .* (n+1))));
xi = ck([1:n+1]);
p = polyfit(xi, g(xi), 10);
x = linspace(-4, 4, 100);
figure();
plot(x, g(x), x, polyval(p, x), "--", xi, g(xi), "o");
legend("g", "p", "punti");
z = linspace(-4, 4, 100);
E = max(abs(g(z) - polyval(p, z)));

%% 3.1 - Numero di Nepero (e)
f = @(x)(sin(x + exp(1).^x) - 7/12); % Numero e: exp(1)
x = linspace(0, 1, 100);
figure();
plot(x, f(x));
xmax = 4/15;

%% 3.2 - Punti equispaziati (spazio noto, numero di punti ignoto)
res = [];
for h = [0.1, 0.01]
    z = [0:h:1]; % Distanza tra punti h
    sx = griddedInterpolant(z, f(z));
    splxmax = sx(xmax);
    E = abs(f(xmax) - sx(xmax));
    res = [res; h, splxmax, E];
end
