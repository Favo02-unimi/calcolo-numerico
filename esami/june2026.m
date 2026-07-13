% ex 1
clear all
close all
format short e

% Definizione funzione
f = @(x) sin(pi*x.^2)./(x.^2 .* (3 - exp(-x)));

% Vettore di 6 punti equispaziati
x = linspace(2,4,6);

% Valori della funzione
y = f(x);

plot(linspace(2, 4, 100), f(linspace(2, 4, 100)));

roots(f)
fzero(f, [0, 5])

%% 1. Spline lineare e calcolo s1(3.1)
x_val = 3.1;

% interp1 con metodo lineare
s1 = griddedInterpolant(x,y,'linear');
s1_val = s1(x_val)

%% 2. Polinomio interpolante e radici reali in [2,4]

% Polinomio interpolante grado 5
coef = polyfit(x,y,5);

% Radici del polinomio
r = roots(coef)

%% 3. Metodo fzero
z = linspace(2,4,1000);
plot(z,f(z),[2 4],[0 0],'r')

alpha = fzero(f,[3.1 3.2])


% ex 2
clear all
close all

f = @(t,y) -2*y+sin(2*t);
t0 = 0;
tmax = 5;
y0 = 3;

y_ex = @(t) (sin(2*t)-cos(2*t))/4 + (13/4)*exp(-2*t);

df = @(t,y) -2;
toll = 1e-6;
nitmax = 200;

h = 10.^[-1 -2 -3 -4];

for i = 1:length(h)
    [T,U] = eulimp(f,[t0:h(i):tmax],y0,df,toll,nitmax);
    err(i) = norm(U-y_ex(T),inf)/norm(y_ex(T),inf);
    Int(i) = trapz(T,U);
end
[h' err' Int']
