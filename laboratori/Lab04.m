% Lab 4 - Esercizi di riepilogo

%% 1 - Sistema lineare con LU
A = [7,0,1,4;
    0,5,10,1;
    1,-3,1,0;
    4,1,1,-9];
b1 = [3;1;1;0];
b2 = [0;4;7;50];
B = [b1,b2];

[L, U, P] = lu(A);
X = U \ (L \ (P*B));

%% 2 - Sistema lineare con LU
A = [-5, 8, -7, 1;
    12, -5, -3, 1;
    1, 10, 14, 1;
    1, 0, 1, 2];
b1 = [-43; 21; -1; 3];
b2 = [-1; 76; -26; 3];
B = [b1,b2];

[L, U, P] = lu(A);
X = U \ (L \ (P*B));

%% 3 - Inversa tramite LU
% risolvere tanti sistemi lineari dove b = colonna
% dell'identità in modo da trovare una colonna di inv(A)
A = [-5, 8, -7, 1;
    12, -5, -3, 1;
    1, 10, 14, 1;
    1, 0, 1, 2];
I = eye(4);
[L, U, P] = lu(A);
Ainv = U \ (L \ (P*I));

%% 4 - Costruire matrice, LU, norme
n = 10;
A = hilb(10) + diag(ones(n,1)*3) + diag(ones(n-1,1)*-1, -1) + diag(ones(n-1,1)*-1, +1);
[L, U, P] = lu(A);
Lnorm = norm(L, inf);
Unorm = norm(U, inf);
b = ones(10, 1);
y = L \ (P * b);
x = U \ y;
ynorm = norm(y, inf);
xnorm = norm(x, inf);

%% 5 - Sistema lineare con Cholesky
A = diag(ones(8, 1) * 5) + diag(ones(7, 1) * -2, -1) + diag(ones(7,1) * -2, 1);
b = [1;2;3;4;5;6;7;26];
R = chol(A);
Rnorm = norm(R, inf);
y = R' \ b;
x = R \ y;
ynorm = norm(y, 2);
xnorm = norm(x, 2);
