% Lab 11 - Esercizi di riepilogo

%% 1 - Problema di Cauchy con Eulero implicito, esplicito, Heun, Crank-Nicolson
f = @(t, y)(t.^2 .* (1 - 3.*y));
yt = @(t)((1/3).*(1 + 5 .* exp(-t.^3)));
syms t y;
df = diff(f(t, y), y);
dff = matlabFunction(df, "Vars", [t y]);
y0 = 2;

res = [];

for h = [0.1, 0.01, 0.001]
    points = [0:h:2];
    [Teulesp, Yeulesp] = eulero(f, points, y0);
    e_eulesp = max(abs(yt(Teulesp) - Yeulesp));
    [Teulimp, Yeulimp] = eulimp(f, points, y0, dff, 1e-12, 1000);
    e_eulimp = max(abs(yt(Teulimp) - Yeulimp));
    [Theun, Yheun] = heun(f, points, y0);
    e_heun = max(abs(yt(Theun) - Yheun));
    [Tcn, Ycn] = cranknic(f, points, y0, dff, 1e-12, 1000);
    e_cn = max(abs(yt(Tcn) - Ycn));
    res = [res; e_eulesp, e_eulimp, e_heun, e_cn];
end
disp(res);

%% 2 - Problema di Cauchy con Eulero implicito, esplicito, Heun, Crank-Nicolson
f = @(t)(-t.^2);
yt = @(t)(5 ./ (1 + 5 .* t));
syms t y;
df = diff(f(t), y);
dff = matlabFunction(df, "Vars", [t y]);
y0 = 5;

res = [];

for h = [0.1, 0.01, 0.001]
    points = [0:h:10];
    [Teulesp, Yeulesp] = eulero(f, points, y0);
    e_eulesp = max(abs(yt(Teulesp) - Yeulesp));
    [Teulimp, Yeulimp] = eulimp(f, points, y0, dff, 1e-12, 1000);
    e_eulimp = max(abs(yt(Teulimp) - Yeulimp));
    [Theun, Yheun] = heun(f, points, y0);
    e_heun = max(abs(yt(Theun) - Yheun));
    [Tcn, Ycn] = cranknic(f, points, y0, dff, 1e-12, 1000);
    e_cn = max(abs(yt(Tcn) - Ycn));
    res = [res; e_eulesp, e_eulimp, e_heun, e_cn];
end
disp(res);

%% Extra - Sistema di problemi di Cauchy
f = @(t,y) [-2*y(2)+2*t; y(1)+y(2)+1-t]; % vettore di funzioni anonime
[T, Y] = ode45(f, [0,3], [2; 1]); % funzione, intervallo (comune), vettore valori iniziali
