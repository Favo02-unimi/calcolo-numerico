%[text] # Es 1
f = @(x) exp(x) - x.^2 - sin(x) - 1;
a = -2;
b = 2;

p_x = linspace(a, b, 100);
p_y = f(p_x);

eps = 1e-8;

f(a)
f(b)

z1 = bisezione(f, a, b, eps)
z2 = bisezione(f, 0.1, b, eps)

plot(p_x, p_y, z1, f(z1), "*", z2, f(z2), "*")

%%
%[text] ## Es 4b
f = @(x) ((x-1).^2).*(x + 2/5);
a = -1;
b = 2;
toll = 1e-6;
maxiter = 100;

p_x = linspace(a, b, 100);
p_y = f(p_x);


% === CALCOLO DELLA DERIVATA ===
syms x                      % 1. Crea una variabile simbolica temporanea
df_2 = diff(f(x), 2);  % 2. Calcola la derivata di f(x)
df_2 = matlabFunction(df_2); % 3. Trasforma la derivata in una funzione anonima @(x)
% ==============================

df = diff(f(x));
df = matlabFunction(df);


x_p = linspace(a, b, 10000);
x_p = x_p(2:end-1);
estremo_di_fourier = @(x) df_2(x).*f(x);
estremi = x_p(estremo_di_fourier(x_p) > 0);

z1 = newton(f, df, estremi(1), toll, maxiter)
z2 = newton(f, df, estremi(end), toll, maxiter)

z = [z1 z2];

plot(p_x, p_y, z, f(z), "*");

%%
%[text] ## Es di riepilogo
%%
%[text] ## Es 1
% 1
f = @(x) x - (1./(sin(x) + 2));
a = 0;
b = 5;      

xp = linspace(a, b, 1000);
yp = f(xp);

z = fzero(f, a)
plot(xp, yp, z, f(z), "*")

%%
%[text] ## Es 4
% Parte 1

% Definizione del sistema ODE
fun = @(t, y) (cos(2*pi*t) - 4*t^2) .* y;
a = 0;
b = 5;

% Soluzione esatta dipendente solo dal tempo
real_f = @(t) 4.*exp((1/(2*pi)).*sin(2.*pi.*t) - (4/3).*(t.^3));

tspan = [a, b];
y0 = 4;

% Risoluzione con ode45
[T, Y] = ode45(fun, tspan, y0);

% Valore massimo della soluzione approssimata
Y_max = max(Y) %[output:09cd9f46]

% Calcolo dell'errore relativo in norma infinito
Y_esatta = real_f(T);
err = norm(Y_esatta - Y, inf) / norm(Y_esatta, inf) %[output:330d3739]

xp = linspace(a, b, 1000);
plot(T, Y, xp, real_f(xp), "--") %[output:1a203a28]

% Parte 2
format short e
I_t = trapz(T, Y) %[output:2a1d8053]
I_e = integral(real_f, a, b) %[output:67dcb8ce]
err_I = abs(I_t-I_e)/abs(I_e) %[output:111d9495]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:09cd9f46]
%   data: {"dataType":"textualVariable","outputData":{"name":"Y_max","value":"   4.6049e+00\n"}}
%---
%[output:330d3739]
%   data: {"dataType":"textualVariable","outputData":{"name":"err","value":"   2.6077e-03\n"}}
%---
%[output:1a203a28]
%   data: {"dataType":"image","outputData":{"dataUri":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAdAAAAFcCAYAAAB4L++jAAAdfklEQVR4Xu3dC3BU9dnH8YfEhUQhMRALqQq0Vmx9LaLI6AoIaL1Ak1oQEMQWkYmAgANBAVFMKRUpgtzE4VanOIBMBBWMb2rlIiLEC+AQa0VbqXKnVSLhYkwIeed\/+gZDrrsnu3vOc873M+N4I8nueU6e3z7n8j+NmjdvXi4AACAsjQhQAADCR4ACAGADAQoAgA0EKAAANhCgAADYQIACAGADAQoAgA0EKAAANhCgAADYQIACAGADAQoAgA0EKAAANhCgAADYQIACAGADAQoAgA0EKAAANhCgAADYoD5AW7RoIbm5uee89b1798rdd99tY3MAABAa9QF6zTXXyOTJk2XcuHFn33Fpaans378\/tC0AAIAN6gM0IyNDunfvfk6AAgAQbeoDdMSIERIMBqVx48bW4dyCggKZNWuWHDx4MNrbDgDgY+oDdNq0aZKWlmb9\/eTJkzJy5Ehp27atDB48WE6fPu3j0gIAokl9gMbFxUl5ebn1l9G0aVN5\/fXXZfjw4fLJJ59Ec9sBAHxMfYDW5OWXX5bZs2fLli1bqv3v\/Px8H5cbANzJnIrTRnWANmrUSObNmyfLli2T7du3W9s+MTFR8vLy5P7775c9e\/bUGKAaCxUr5gMG26d2bJ+6sX3Yd+zSuO+oDlDjiSeekMsvv1xmzJghR44ckQcffFBSU1Nl1KhRNdZRY5Fiie1DQDQE+w8BapfGfUd9gAYCASssu3btKgkJCfLuu+\/K3Llz5dixYwSoDRp34lhi+\/ABwy72He\/tO+oDNFzsxN7biWOJ\/Yf9xy72He\/tOwQoAMBxGj9gEKAAAMcRoApoLBIAeJ3G3swECgBwHAGqgMYiAYDXaezNTKAAAMcRoApoLBIAeJ3G3swECgBwHAGqgMYiAYDXaezNTKAAAMcRoApoLBIAeJ3G3swECgBwHAGqgMYiAYDXaezNTKAAAMcRoArYLdLYay+QrI5NrXe4\/3iZBFd9peDdAoAOdnuzk5hAQ3B+1wekSft0OfPNQTlz7JAcz50iOekp0j+3MISvBgDUhwBVINwiVYRn4YJfWe8uedBC6+\/HVgy3QnT2jpOSf6hEwTsHAPcKtze7ARNoHaqGZ4Vm6dkSl5xmhei+zJbW4VxzWBcAYA8BqkA4RUoZue7s5FlVQvt0Sez6gNz+\/hjp07KQw7kA0ADh9Ga3YAKtQXxymmwbeJGMWbu7zsOzgdYdpWlGtjxfPk9mvPI2h3IBwCYCVIFQimSuuA206WiFYn1MiCbfu1C+mtapvj8KAKhFKL3ZbZhAq6iYPrv8b0BK9+4IqV7ma8zhXkIUAOwhQBWor0jPdEuS7YGfy8r1W8N6NyZAi5YPk7Jjh8L6OgCA1Nub3YgJtBIzSb7Ts1Ru2tYm5OmzgrmoyBzONfeIAgDCU99w40YEaCUP33y59W8zN\/7DVq1SJ33AYVwAsIEAVaC2IlVMnw1Zos8cxl305WBuaQGAMBGgCtRWpH7tEiWYFpCszUW234U5jLv5xr1y\/cIC298DAPyIAFWgtiKZZfkGFfw47HOfVd2fNV2u2jGtQUEMAH5DgCpQU5HM4duc9OZy14qPG\/wOzGHcgpJMuXTJkQZ\/LwDwCwJUgZqKZNa2Nfd8FhfkNvgdmMO4L3YpZmUiAAgDAapA1SKZ6TPp3kW1rnlrh7kad9LWWziMCwAhIkAVqFqkaNy\/yWFcAAgPAapA1SKZ53ue2rKkwRcPVcbVuAAQHgJUgZoC1DzXM9IWjL5H3nrjFXnps28j\/a0BwHMIUAUqF8mse5t\/qDQqIWcm2+z94zkPCgAhIEAVqChSJFYeqks0zq0CgFcRoC7QuXNneffdd6WsrKzGV1NRJBNw01LejuqEyNq4ABAaAtRhvXv3lvHjx0uPHj2kuLi4zgA1Kw\/N3nFS8g+VRO1VR+MCJQDwIgLUQa1bt5ZFixbJhRdeWG+Adrmjj\/XYsoYsHB8KDuMCQGgIUIecd955snjxYsnLy5OsrKx6AzRn5K3WK52980TUXzGHcQGgfgSoQ0aMGCFJSUmybNkyeeWVV+oN0H1P9orIwvGh4DAuANSPAHXANddcIxMnTpT77rtPkpOT6w3QxbnvyoULe8bsmZ2ReEwaAHgdARpjCQkJsmLFCnnqqafkb3\/7m7Rq1UpefPFF6dWrl5w4cUJKS0urvaJPZwyUx5e+GpV7P2uzL7MlT2cBgDoQoDF28cUXy+rVq2v8qfPmzbPCtCpTpMqCwWDUX3X+gFTp93qh7D9e8601AOBHTvTjSGrUvHnz8kh+QyeZCTSUc6CxCM3KorniEQB4AROow9waoLFYtAEANCNAFXCqSJwHBYDaOdWbG8JTh3BD4VSROA8KAASoak4FKOdBAYAAVc2pAOU8KAAQoKo5FaCB1h1lz+37uR8UAGrgVG9uCM6BxhDr4gJAzQhQBZwsUrP0bCndu0OKC3IVbCkAiB0ne7NdTKAxxOPNAIAJVC0nP+UQoABAgKrlZIAanAcFgOqc7s12cAg3xub\/toeMWbtbyo4divFPBgD3IkAVcLpI9\/yis1xX+pFkbS5SsLUAIDac7s12MIHGGAsqAEB1BKgCbigSC8sDwLnc0JvDxQTqALOwfJe8AOdBAeD\/EaAKuKFILCwPAEyg6rghQPu1S5RgWoALiQCACVQPNwSowXlQAPieW3pzODgH6hAesA0ABKgqbvmUw3lQACBAVXFLgLIuLgAQoKq4JUAN1sUFgP9yU28OFedAHZQycp0ULR\/G\/aAAfI8AVcBNReIB2wDABKqGmwKU86AAQICqQYACgPu4qTeHinOgDmNBBQDgIiIV3PYpxyyo0OPvN0hxQa6K7QcA0eC23hwKJlCHmQUV3j+VKqs+2OPwKwEA5xCgCritSCwsDwAcwlXBbQFqvDe8vVy\/sEDF9gOAaHBjb64Ph3BdgAdsA\/A7AlQBNxbJnAedVHgTFxIB8C039ub6MIG6wNhrm0r8hWkyc+M\/XPBqACD2CFAF3FqkBaPvkZHzVyrYggAQeW7tzXVhAnUJs6BC25w4FpYH4EsEqAJuLRILywPwM7f2ZibQStxaJBaWB+Bnbu3Nng7Qxo0by+jRo6V79+7WP+\/cuVNmzpwpX3\/9dY3v261FIkAB+Jlbe7OnA3To0KFy8803S3Z2tpSXl8u4cePk+PHjMmHCBFUBaqRO+kC+mtbJz79DAHyKAHXAkiVLZPXq1fLGG29YP71bt24yceJE6dmzp7oATR60UE5tWSKle3c4sCUBwDkEqANSU1OlqKhISkpKrJ8+ZMgQ6dSpkzz44IPqAtQsqJB\/qFRe+uxbB7YkADiHAHVQnz59pF+\/fpKUlGQd1j18+LC6AGVheQB+RYA6qFWrVtK+fXvJyMiQ4uJieeSRR9QFqMGCCgD8iACNsbi4OGnevLkcPXpUzpw5Y\/30xMREefPNN6V\/\/\/5y8ODBaq\/IFKmyYDAY41ddNxZUAOAXbu\/H9VG9ElF8fLxs3LhRhg0bJrt377bea5MmTWTDhg3ym9\/8Rv71r3\/VGKBuC83KctJT5Ld7O7OwPABfYQJ1wNSpU63zntOnT7cuJMrMzJSrrrpKBg8eLGVlZeoC1FxItD3wc1m5fqsDWxMAnEGAOsAsnmDOd5orb830uWvXLpkzZ47Ki4gqcB4UgN8QoApoKBLnQQH4jYbeXJXqc6B2aChS\/oBU6fH3GzgPCsA3NPRmAjQ\/39UXERmcBwXgNxp6MwGqIEBZUAGA32jozQSoggA1WFgegJ9o6c2VcQ7UpVJGrpOi5cOk7Nghl75CAIgcAlQBLUVqlp5tPZWluCBXwVYFgIbR0puZQF22fF9NeMA2AD8hQBXQVCTOgwLwC029uQLnQF3M3A\/a7\/VC2X+8+pKEAOAlBKgCmorEA7YB+IWm3swEqoQJ0azNRUpeLQDYQ4AqoK1IZl3cS5ccUbBlAcA+bb3Z4Byoy5nzoF3yAtwPCsDTCFAFtBWJ86AA\/EBbb2YCVcDcDzot5W3OgwLwNAJUAY1F4jwoAK\/T2Js5B6qAOQ9607Y21tJ+AOBFBKgCGotkzoO+fypVVn2wR8EWBoDwaezNTKAKsC4uAK8jQBXQWCSDx5sB8DKNvZkJVAkebwbAywhQBTQWyeAwLgAv09ibmUAV4fFmALyKAFVAY5EqmPtB2+bEsawfAM\/R2JuZQBUxt7NMKrxJigtyFb1qAKgfAaqAxiJV6NcuUYJpAZb1A+A5GnszE6gyLOsHwIsIUAU0FqkyHm8GwIs09mYmUGV4vBkALyJAFdBYpMp4vBkAL9LYm5lAFeI8KACvIUAV0FikqjiMC8BrNPZmJlCFuJ0FgNcQoApoLFJNWNYPgJdo7M1MoErxdBYAXkKAKqCxSDXh6SwAvERjb\/bEBDpgwADJyMiQli1byqeffipz586Vzz77rMZ9S2ORasNhXABeobE3qw\/QO++8U0aMGCGTJ0+Wzz\/\/XO677z7p1q2b3H333VJcXFxt39JYpNokD1oop7YskdK9O7zyOwTApzT2ZvUBOm\/ePNmxY4csW7bM2u3i4+PljTfekEceeUQ+\/PBDTwcoh3EBeAUB6oCePXvKJ598Il988YX1088\/\/3zJy8uT0aNHS0FBgacD1Fgw+h4ZOX+lA1seACKHAHVYIBCQxx57TNq2bStDhw6VsrIyzweoWVx+wDsJ8uX+\/Q5vfQCwjwB10FVXXSXjx4+XkydPyoQJE6SoqKjGV6OxSHUxqxJtD\/xcVq7f6uDWB4CG0dib1Z8DNQYPHiz33nuvLF26VNasWSOnT5+utZIai1QfDuMC0E5jb1YfoL\/85S9l2LBhkpWVJf\/85z\/r3YdMkSoLBoP1fo3b8YxQABpp78fqA\/SFF16Qbdu2yWuvvXbO\/vOf\/\/xHSkpKqu1TGj\/l1Mccxn3\/VKqs+mBPfX8UAFxJY29WHaBxcXGyadMmady4cbUdYtSoUdbtLVVpLFJ9Aq07ytMdTsqYdbvr+6MA4Eoae7PqALVDY5FCwWFcAJpp7M0EqEfwjFAAmhGgCmgsUqhy0lOkf25hqH8cAFxDY29mAvUQ1sYFoBUBqoDGIoWKtXEBaKWxNzOBegyPOAOgEQGqgMYihaNZerb1eLPigtxwvgwAHKWxNzOBeky\/dokSTAtI1uaa1wIGADciQBXQWKRw7ctsKW1z4qTs2KFwvxQAHKGxNzOBehBPaAGgDQGqgMYi2fHKg7+Q3s+tt\/OlABBzGnszE6hHmUUVBhX82LqgCADcjgBVQGOR7DD3hE5LeZuLiQCooLE3M4F6GBcTAdCCAFVAY5HsYoF5AFpo7M1MoB5mnhO6ov0eFpgH4HoEqAIai9QQXEwEQAONvZkJ1ONYmQiABgSoAhqL1FApI9dJ0fJhrEwEwLU09mYmUB\/gMWcA3I4AVUBjkSKBx5wBcDONvZkJ1Cd4zBkANyNAFdBYpEiIT06TpHsXSeGCX0Xi2wFARGnszUygPsItLQDcigBVQGORIoX1cQG4lcbezATqM\/kDUqVLXoBbWgC4CgGqgMYiRRILKwBwI429mQnUh3hKCwC3IUAV0FikSBt77QXWt5y982SkvzUA2KKxNzOB+pSZQi9dcsSn7x6A2xCgCmgsUjTwrFAAbqKxNzOB+pRZWOGdnqUSXPWVT7cAADchQBXQWKRoYXk\/AG6hsTczgfpYoHVHOb9rphxbMdzHWwGAGxCgCmgsUjQlD1oop7YskdK9O6L5YwCgThp7MxOozzGFAnADAlQBjUWKNqZQAE7T2JuZQMEi8wAcR4A6LDMzU9asWSNHjx6t9ZVoLFIsmEXm+71eKPuPl8XixwHAOTT2Zs9MoFdffbXMnz9fBg4cKAcOHCBAw8SjzgA4iQB1QIsWLWTBggXSpk0b66f37duXALWJKRSAUwhQB8THx0tKSookJiZKTk4OAdoATKEAnEKAOighIUE2bdpEgDYQD9wG4AQC1EEEaGTwwG0ATiBAHRROgFYWDAYdfNXuxKPOAMSCCU3N\/dgzV+GGE6CEZt144DaAWGMCdRABGllMoQBiiQB1EAEaWed3fcD6hqe2LI7sNwaAGhCgCmgsklNSJ30gX03r5NSPB+AjGnuzZ86BhkpjkZzCA7cBxIrG3kyAok5MoQBigQBVQGORnMQUCiAWNPZmJlDUiytyAUQbAaqAxiI57ZluSZJ\/qFRe+uxbp18KAI\/S2JuZQBESplAA0USAKqCxSG7AFAogmjT2ZiZQhIwpFEC0EKAKaCySWzCFAogWjb2ZCRRhYQoFEA0EqAIai+QmZgp9\/1SqrPpgj5teFgDlNPZmJlCEJT45Tb7of0ba5sRJ2bFDYX0tANSGAFVAY5HcxqxOZBzPneK2lwZAKY29mQkUtpg1cgsX\/IopFEBEEKAKaCySG5nnhZrDuUyhACJBY29mAoVtKSPXyYnXpkjp3h22vwcAGASoAhqL5Fb92iVKMC0gWZuL3PoSASihsTczgaJB1gz6H5m58R+Sf6ikQd8HgL8RoApoLJKbBVp3lBXt90j\/3EI3v0wALqexNzOBosFy0lPkpc+KedwZANsIUAU0FsntKhZXuHTJEbe\/VAAupbE3M4EiIswSfwYXFAGwgwBVQGORtMgfkCo3bWvDbS0AwqaxNzOBIqLM+VAuKAIQLgJUAY1F0sQEaP7BEpm986Smlw3AYRp7MxMoIs48M9RModwbCiBUBKgCGoukjbk3tGlGtrXYPACEQmNvZgJFVJjF5o1TWxZH5fsD8BYCVAGNRdIqedBCObZiuNaXDyCGNPZmJlBEjVlgwTyx5djy4dzaAqBOBKgCGoukmTkfuqprsdy14mPNbwNAlGnszUygiLqE9unyQuut3B8KoFYEqAIai+QF5v7Qg3EtZcy63V54OwAiTGNvZgJFzJgQNVipCEBVBKgCGovkJYQogJpo7M1MoIg58+SWS5rFM4kCOIsAdchtt90mQ4YMkaSkJNm0aZPMnTtXSktLPfMpx4vGXttU+rdLkOCqr7z49gCEiQB1wBVXXCGLFi2Sxx9\/XL788kuZMmWKbN++XZ577jkC1OXMfaLv9CyVWw70YcUiwOcIUAc8+uijUl5eLtOnT7d++nXXXSdTp06VjIwMOX36dLVXpLFIXmeW\/WvSPl2+K8glSAGf0tib1Z8D\/dOf\/iSrV6+WvLw8a7cLBALy9ttvS+\/eveXw4cMEqBJmGjVBel6bjixCD\/gQAeqAV199VZ5++mnZunXr2Z++YcMGeeihh+Tjj6uvfqOxSH5igvShy45LVscLZP\/xMg7vAj6hsTern0DXrl0rf\/zjH2Xbtm1nd7ONGzfK2LFjZdeuXUygilWEqbnYyNh3okzyD5bK7J0nFL8rADUhQB3w\/PPPS05OjvzlL3+xfnrFIdy+ffvKgQMHCFCPMVfvXtoszroN5tKm8ZLx4zwpO3bIepdnvjlo\/T17\/\/iz73rf8TNn\/5ngBdyLAHWAuYiopKREZs2aZf30Dh06yFNPPVXnRUSVBYNBB141Ys0Eb1UmiLObja3236ccnx3yy+Pr2X5Vsf+E\/vvz3oD1ZzffmA5l6vqx+kO4V155pcyZM0fGjBljTZxPPvmk7N69W5599tkam6DGTzkA4HUae7P6ADVYSAEAdCNAFdBYJADwOo292RMTaDg0FgkAvE5jbyZAAQCOI0AV0FgkAPA6jb2ZCRQA4DgCVAGNRQIAr9PYm5lAAQCOI0AV0FgkAPA6jb2ZCRQA4DgCVAGNRQIAr9PYm5lAAQCOI0AV0FgkAPA6jb2ZCRQA4DgCVAGNRQIAr9PYm5lAAQCOI0AV0FgkAPA6jb2ZCRQA4DgCVAGNRQIAr9PYm5lAAQCOI0AV0FgkAPA6jb2ZCRQA4DgCVAGNRQIAr9PYm5lAAQCOI0AV0FgkAPA6jb2ZCRQA4DgCVAGNRQIAr9PYm5lAAQCOI0AV0FgkAPA6jb2ZCRQA4DgCVAGNRQIAr9PYm5lAAQCOI0AV0FgkAPA6jb2ZCRQA4DgCVAGNRQIAr9PYm5lAAQCOI0AV0FgkAPA6jb2ZCRQA4DgCVAGNRQIAr9PYmz01gWZmZsqaNWvk6NGjte5rGosEAF6nsTd7JkCvvvpqmT9\/vgwcOFAOHDhAgAKAIgSoA1q0aCELFiyQNm3aWD+9b9++BCgAKEOAOiA+Pl5SUlIkMTFRcnJyCNAG0rgTxxLbp25sn9qxbby373jmEG5CQoJs2rSJAG0gfsm990seS+w\/BKhdGvcdAhTn0LgTxxLbhw8YdrHveG\/fURWgvXr1kvHjx1tV2L17twwfPvxsRcKZQAEA7hMMBt33ouqgKkDrEmqAAgAQCQQoAAA2EKAAANjgmQAFACCWCFAAAGzwTYCaBRceeOAB6dmzp3z33XfWogsvvfSSjU3mXYFAQB566CGZNWuWd9+kDWa7ZGVlyQ033GBdrPbee+\/JnDlz5JtvvrHx3bynVatWMm7cOGs5zW+\/\/VY2bNggzz33nJw+fdp7b7aBmjZtKu3atZOdO3c28Dt5x2233SZTpkw55w2tXbtWpk+f7vo36ZsANWvk\/vrXv5ZHH31UkpOTreL87ne\/s+7NgkijRo1k0KBB1kIUZjvhe2Y\/ad26tUydOlVKSkrksccek6KiIpk4cSKbSUSeffZZ6wEOJjQvueQSa3stX75cVq1axfap4g9\/+IOkpaXJ0KFD2Tb\/7\/7775fLLrtMli5denabmN+vr7\/+2vXbyDcBaqbNJUuWyF\/\/+lerKGYa\/clPfnL2vlI\/69y5sxUGqampcuTIEQK0kri4ONm4caOMHj1aPvroI+v\/XHnllVZY3HrrrVJaWurnXUcaN25srQDWu3dv+fe\/\/21ti7Fjx8pFF10kkyZN8vW2qcoc\/ZowYYJ8\/vnnBGglTzzxhLVNVqxYoW5\/8UWANmnSRN566y3rl\/zw4cNWka6\/\/norPO+66y51RYs0s32aNWsmnTp1kmHDhhGglZjDt2Yqf\/XVV63Dk4Y5lGuOYNxyyy1SVlYW6XKoYk6NmLA0H7zKy8utfzenAD7++GPrAyv+y0yd5kPXunXrpEuXLgRoJWY\/MafVfvSjH1n\/1XwgMw8Iqfh9czNfBOjFF18sq1evlptvvvlsUa644gpZtGiRdO\/e3c31iakbb7zR+lDBIdzaNW\/e3Dr\/+eGHH8rs2bNjWh+3M6dHzIeLffv2WVOo36fzCuZDhQmEl19+2fpn84GMQ7jfy8vLk23btlmHcM3ptcmTJ8uuXbtkxowZbt\/l\/RWgPXr0kOLiYqsoP\/3pT2Xx4sXSrVs365MzhACth1lKctSoUbJ+\/XorRM+cOVPfl\/jK5ZdfLh06dJA+ffpIbm6uykNy0WDO8bVt29Y6VGkO4xKg5zIfKiofyTHL+T355JPWER6392ZfTKDmUWfmPFbVQ7jmHM2dd94Zjd8ZlZhAa2bO8\/3+97+3zpk\/88wz1qdl\/JfZNhdccIEUFhae3SRmCjXn+szvm9+ZK26ffvppyczMtC6MueOOO6yeM2LECOuCND6EVWcOd5tp3VxjcOLECVfvQr4IUMPctrJw4UIrSI0hQ4bIz372My4iqoQArZk5pPTDH\/7QCgXTBPE9M3GagLj99tvPhoG5viA7O9ua2P0uPT3dumq7JqYHmYdi+Jm5ut0MMuYixorbwsy1GOa2Fg37j28C1NyiYX7Jx4wZYx1nnzdvnnUhyNatW\/28\/56DAK3O7CvmcKT5Jd+zZ885f+DAgQO+33fMRVbmw+mbb74pK1eulKSkJOsDx6effiozZ870\/fapikO45zrvvPOs253MBwlzTYq5oNHsP5s3b5bnn3\/e9fuPbwLU3OdoDpuYEDWHTl588UXrMAG+R4BW1759e+sXuybmakq\/X4VrmIv0Hn74YeuIjrnGwFxFaY72mCsrcS4CtLof\/OAH1kIlZiGOU6dOWRcV\/fnPf1axEIdvAhQAgEgiQAEAsIEABQDABgIUAAAbCFAAAGwgQAEAsIEABQDABgIUAAAbCFAAAGwgQAEAsIEABQDABgIUAAAbCFAAAGwgQAEAsIEABQDABgIUAAAbCFAAAGwgQAEAsIEABQDABgIUAAAbCFAAAGwgQAEAsIEABQDAhv8DFGc6aFVRiS8AAAAQZGVCR0IxNTdERkIyQjkyMDAyNjbI6Gt1AAAAAElFTkSuQmCC","height":420,"width":560}}
%---
%[output:2a1d8053]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_t","value":"   3.3597e+00\n"}}
%---
%[output:67dcb8ce]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_e","value":"   3.3648e+00\n"}}
%---
%[output:111d9495]
%   data: {"dataType":"textualVariable","outputData":{"name":"err_I","value":"   1.4953e-03\n"}}
%---
