% Lab 5 - Esercizi di riepilogo

%% 1 - Sistemi lineari con Jacobi e Gauss-Seidel, errore relativo
toll = 1e-6;
nitmax = 1e5;

res = [];

for n = [5, 10, 100]
    A = diag(ones(n, 1)*2) + diag(ones(n-1, 1)*-1,-1) + diag(ones(n-1, 1)*-1,+1);
    b = ones(n, 1);
    x0 = zeros(n,1);

    xdir = A \ b;

    [xj, nitj] = jacobi(A, b, x0, toll, nitmax);
    errj = norm(xdir - xj, inf) / norm(xdir, inf); % Errore relativo

    [xgs, nitgs] = gs(A, b, x0, toll, nitmax);
    errgs = norm(xdir - xgs, inf) / norm(xdir, inf); % Errore relativo

    res = [res; n, nitj, nitgs, errj, errgs];
end

"n | nit j | nit GS | err J | err GS";
res;

%% 2 - Costruire matrice, Raggio spettrale, Matrice di iterazione di Jacobi
x = linspace(0, pi/2, 9);
A = diag(ones(10, 1)*11) + diag(ones(9, 1)*-1, -1) + diag(x, +1);
b = ones(10, 1);

D = diag(diag(A));
E = -tril(A, -1);
F = -triu(A, +1);
Bj = inv(D) * (E + F); % matrice di iterazione di Jacobi
rad = max(abs(eig(Bj))); % raggio spettrale

x0 = zeros(10, 1);
toll = 1e-5;
nitmax = 200;
[xj, nitj] = jacobi(A, b, x0, toll, nitmax);

xe = A \ b;
err = norm(xe - xj, 2); % Errore assoluto norma Euclidea (2)

%% 3 - Costruire matrice, Raggio spettrale, Matrice di iterazione di Gauss-Seidel
n = 16;
A = diag([20:20+n-1]) + diag(ones(n-1,1)*-5, -1) + diag(ones(n-2, 1)*5, 2);
b = ones(n, 1);
detA = det(A);

D = diag(diag(A));
E = -tril(A, -1);
F = -triu(A, +1);
Bgs = inv(D - E) * F; % Matrice di iterazione di Gauss-Seidel
rad = max(abs(eig(Bgs))); % Raggio spettrale

x0 = zeros(n, 1);
toll = 1e-6;
nitmax = 200;
[xgs, nitgs] = gs(A, b, x0, toll, nitmax);
xe = A \ b;
err = norm(xe - xgs, 2) / norm(xe, 2); % Errore relativo norma Euclidea (2)
