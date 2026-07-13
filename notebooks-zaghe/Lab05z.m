%[text] # Es 1

A_1 = [3 0 4;
       7 4 2;
       1 1 2];
b_1 = A_1 * ones(3, 1);

[x, nit] = jacobi(A_1, b_1, zeros(3, 1), 0.1, 1000) %[output:01542e14] %[output:5262517c] %[output:5deb2cc2]
[x, nit] = gs(A_1, b_1, zeros(3, 1), 0.001, 1000) %[output:9e8ec5d3] %[output:6eea91bb]

A_2 = [-3 3 -6;
       -4 7 -8;
       5 7 9];
b_2 = A_2 * ones(3, 1);

[x, nit] = jacobi(A_2, b_2, zeros(3, 1), 0.01, 1000) %[output:00b8434b] %[output:20d66957] %[output:83bcca8e]
[x, nit] = gs(A_2, b_2, zeros(3, 1), 0.001, 100) %[output:89007a71] %[output:2dc14295] %[output:924dce6c]

%%
%[text] ## Es 2
A_1 = [-22 8 13;
        5 7 -1;
        -4.5 2 -9];

max(abs(eig(A_1))) %[output:3e83da88]

norm(A_1) %[output:7cb6e100]


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:01542e14]
%   data: {"dataType":"text","outputData":{"text":"Jacobi non converge nel numero di iterazioni assegnato\n","truncated":false}}
%---
%[output:5262517c]
%   data: {"dataType":"matrix","outputData":{"columns":1,"exponent":"126","name":"x","rows":3,"type":"double","value":[["-1.7768"],["-2.9911"],["-1.7824"]]}}
%---
%[output:5deb2cc2]
%   data: {"dataType":"textualVariable","outputData":{"name":"nit","value":"1000"}}
%---
%[output:9e8ec5d3]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"x","rows":3,"type":"double","value":[["0.9999"],["1.0001"],["1.0000"]]}}
%---
%[output:6eea91bb]
%   data: {"dataType":"textualVariable","outputData":{"name":"nit","value":"8"}}
%---
%[output:00b8434b]
%   data: {"dataType":"text","outputData":{"text":"Jacobi non converge nel numero di iterazioni assegnato\n","truncated":false}}
%---
%[output:20d66957]
%   data: {"dataType":"matrix","outputData":{"columns":1,"exponent":"9","name":"x","rows":3,"type":"double","value":[["-1.6091"],["0.0429"],["0.8429"]]}}
%---
%[output:83bcca8e]
%   data: {"dataType":"textualVariable","outputData":{"name":"nit","value":"1000"}}
%---
%[output:89007a71]
%   data: {"dataType":"text","outputData":{"text":"GS non converge nel numero di iterazioni assegnato\n","truncated":false}}
%---
%[output:2dc14295]
%   data: {"dataType":"matrix","outputData":{"columns":1,"exponent":"4","name":"x","rows":3,"type":"double","value":[["-5.7801"],["0.0001"],["3.2113"]]}}
%---
%[output:924dce6c]
%   data: {"dataType":"textualVariable","outputData":{"name":"nit","value":"100"}}
%---
%[output:3e83da88]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"16.5000"}}
%---
%[output:7cb6e100]
%   data: {"dataType":"textualVariable","outputData":{"name":"ans","value":"26.9058"}}
%---
