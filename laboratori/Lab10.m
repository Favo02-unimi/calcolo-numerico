% Lab 10 - Esercizi di riepilogo

%% 1 - Zero di funzione, Bisezione, Newton, Derivata simbolica
f = @(x)(x - (1 ./ (sin(x) + 2)));
syms x; % variabile simbolica x
df = diff(f(x)); % derivata
dff = matlabFunction(df); % derivata simbolica a funzione anonima

aex = fzero(f, [0, 5]);
[abis, nitbis] = bisezione(f, 0, 5, 1e-8);
[anewt, nitnewt] = newton(f, dff, 2, 1e-8, 200);
ebis = abs(aex - abis);
enewt = abs(aex - anewt);

%% 2 - Zero di funzione, Bisezione, Newton, Derivata simbolica
f = @(x)((2 .* x.^2) - (1./(cos(x.^2) + 3)));
syms x;
df = diff(f(x));
dff = matlabFunction(df);

aex = fzero(f, [0, 5]);
[abis, nitbis] = bisezione(f, 0, 5, 1e-2);
[anewt, nitnewt] = newton(f, dff, abis, 1e-6, 200);
enewt = abs(aex - anewt);

%% 3 - Problema di Caucjy, Errore relativo, Integrale con trapezi compositi
f = @(t, y)((cos(2 .* pi .* t) - 4.*t.^2).*y);
yt = @(t)(4 .* exp((1./(2.*pi)) .* sin(2 .* pi .* t) - (4/3) .* t.^3));

[T, Y] = ode45(f, [0, 5], 4); % oppure equispaziati: al posto di [0,5] linspace
Ymax = max(Y);
err = norm(yt(T) - Y, inf) / norm(yt(T), inf); % Errore relativo in norma inf

It = trapz(T, Y);
Ie = integral(yt, 0, 5);
errI = norm(It - Ie, inf) / norm(Ie, inf);