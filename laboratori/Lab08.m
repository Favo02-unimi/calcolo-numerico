% Lab 8 - Esercizi di ripilogo

%% 1 - Retta di regressione
q = [1,3,5,9,12,15];
z = [10.7, 30.9, 41.8, 80.9, 100.5, 129.5];
lin = polyfit(q, z, 1);

%% 2 - Retta di regressione, Scarto quadratico
T = [0, 10, 20, 30, 40, 50, 60, 70];
C = [96.4, 46.3, 21.2, 17.89, 10.1, 6.9, 3.5, 1.9];

r = polyfit(T, C, 1);
s1 = griddedInterpolant(T, C);
p = polyfit(T, C, 7);
z = [0:0.2:70];
plot(z, polyval(r, z), z, s1(z), z, polyval(p, z), T, C, "x");

res = [polyval(r, 62), s1(62), polyval(p, 62)];

sr = sum(abs((C - polyval(r, T)).^2));

%% 3 - Retta di regressione, Sistema Lineare
f = @(t)(2/3 .* log(2/3 .* t));
int = [3*exp(1) / 2, 3*exp(1) / 2 + 1];
x = linspace(int(1), int(2), 10);

r = polyfit(x, f(x), 1);

rx = polyval(r, 1/10 * sum(x));

M = [x', ones(10, 1)];
A = M' * M;
b = M' * f(x)';
z = A \ b;

%% 4 - Parabola, Funzione potenza y = Cx^A
x = [1:0.15:2.5];
y = [0.1, 0.15, 0.2, 0.3, 0.5, 0.65, 0.78, 1, 1.2, 1.35, 1.45];

% parabola
r2 = polyfit(x, y, 2);
yr2 = polyval(r2, 1.75);

% y = Cx^A
% log(y) = log(Cx^A)
% log(y) = log(x) + log(x^A)
% log(y) = log(x) + A log(x)
logp = polyfit(log(x), log(y), 1); % in ordine di grado, quindi prima A (x grado 1), poi C (grado 0)
A = logp(1);
C = exp(logp(2));
rp = @(x)(C .* x.^A);
yrp = rp(1.75);

%% 5 - Funzione y = 1/(Ax + B)
x = [1,2,3,4,5];
y = [0.35, 0.25, 0.2, 0.15, 0.12];

% y = 1 / (Ax + B)
% 1/y = (Ax + B)
yrec = polyfit(x, 1./y, 1); % in ordine di grado, quindi prima A (x grado 1), poi B (grado 0)
A = yrec(1);
B = yrec(2);
rrec = @(x)(1 ./ (A .* x + B));
yval = rrec(1.5);

plot(linspace(1, 5, 100), rrec(linspace(1, 5, 100)), x, y, "x");

%% 6 - Funzione y = x / (A + Bx)
x = [1,2,3,4,5];
y = [0.25, 0.31, 0.35, 0.4, 0.41];

% y = x / (A + Bx)
% (A + Bx) y = x
% (A + Bx) = x / y
yrec = polyfit(x, x./y, 1);
B = yrec(1);
A = yrec(2);
rrec = @(x)(x ./ (A + B .* x));
yval = rrec(4.5);