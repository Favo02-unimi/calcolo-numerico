function s=polysum(p,q)
%
% s=polysum(p1,p2)
%
% somma di due polinomi           
d=length(p)-length(q);
s=[zeros(1,d),q]+[zeros(1,-d),p];

