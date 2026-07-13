%[text] # Es di riepilogo
%%
%[text] ## Es 01
n = 7 %[output:81e2e7e6]
a_f = n+2 %[output:6b985365]
f = @(x) (a_f.*(x.^5) - 1)./(x.^5 + 1);

a = 0;
b = 1;
f_x = linspace(a, b, 10);

% 1
I = integral(f, a, b) %[output:787e617e]

% 2
I_T = trapz(f_x, f(f_x)) %[output:083599ba]

p_x = linspace(a, b, 3);
p_y = f(p_x);
s = griddedInterpolant(p_x, p_y);

x = linspace(a, b, 100);

plot(x, f(x), x, s(x)) %[output:17e24dab]

hold on; %[output:17e24dab]
plot(p_x, p_y, "*") %[output:17e24dab]

hold off; %[output:17e24dab]

%%
%[text] ## Es 2
f = @(x) 1./cos(x);

a = 0;
b = pi/4;

I = log(sqrt(2) + 1) %[output:17ac3887]

res = [];

for i = 1:4 %[output:group:7f2162f2]
    m = 10^i %[output:60ac890e] %[output:6043d368] %[output:4dfa0361] %[output:06268f7a]
    p_x = linspace(a, b, m);
    p_y = f(p_x);
    
    I_T = trapz(p_x, p_y) %[output:7a8f88a4] %[output:810fa223] %[output:0ada2afa] %[output:1be4ded4]
    E_T = abs(I-I_T);

    I_M = pmedc(a, b, m, f) %[output:88ac4780] %[output:2e4da158] %[output:71c5a19c] %[output:53aa8f5a]
    E_M = abs(I-I_M);
    
    I_CS = simpsc(a, b, m, f) %[output:63594683] %[output:04572ed2] %[output:91043615] %[output:5de2d1c9]
    E_CS = abs(I-I_CS);

    res = [res; m E_T E_M E_CS];

    disp("-----------"); %[output:05c98fa9] %[output:32b0c57d] %[output:4c539eb0] %[output:94888960]
end %[output:group:7f2162f2]

format short e
res %[output:451247d9]




















%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:81e2e7e6]
%   data: {"dataType":"textualVariable","outputData":{"name":"n","value":"7"}}
%---
%[output:6b985365]
%   data: {"dataType":"textualVariable","outputData":{"name":"a_f","value":"9"}}
%---
%[output:787e617e]
%   data: {"dataType":"textualVariable","outputData":{"name":"I","value":"0.1169"}}
%---
%[output:083599ba]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_T","value":"0.1298"}}
%---
%[output:17e24dab]
%   data: {"dataType":"image","outputData":{"dataUri":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAjAAAAGkCAYAAAAv7h+nAAAgAElEQVR4Xu3dC3RV9Zn\/\/wfShARCMECrqRWZ1YLVoSioM824Uqi\/VeaHBhwcEKx0cRvk7ggMoKPA8KcCohBAcQTUEau9cKtouI0LaM1wKT9CF2ktyCitEcJFhYYYjAmR\/3q2PTS3k+yTnMvez36\/1mJFA0nO+X5P8v3keb7fvVt17NjxsgAAAPhIKwIMAADwGwIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwHQIMAADwncAHmDvuuEP2798v1dXVvps8AACCKtABZtCgQTJz5kz5\/ve\/LxUVFUF9DQAA4DuBDTBdunSRVatWyVVXXUWAAQCYNnPSjbJ45RFTzzGQAeYrX\/mKrF69WrZt2ybTpk0jwAAAzOlybVu57tp2sufAR\/LJH+6VTjdtqvU+vwtkgJkwYYJkZGTI2rVr5Ze\/\/CUBBgBgzh1\/91V54+UcGTiywHnb6wfbZfPL35PJjxU6ocbvAhdgevXqJY888oiMHDlSOnToQIABAJgVCjGq+ORFM+FFBSrApKamymuvvSYLFy6U3\/\/+93LNNdfIz372M7nrrrvk008\/laqqqgZfxPv27TP74gYA2NOpzV7plLon7BN7cuUR3++JCVSAufbaa2XDhg0NTuiKFSucMNMQDTDZ2dn2XuEJxrjGDmMbO4xt7DC20af7YPJ\/OVSuTS91Prm2kyy0j1SgAkxdWoFxsweGb6rYYFxjh7GNHcY2dhjb6NLwcmjj9+UXbyTLsOGtr+yFsRJiCDAuNvHyTRUbjGvsMLaxw9jGDmMbXcPuvFr+7c5ukr36Mzm9\/XrnFJLuiVEWqjCBDjBu8U0VG4xr7DC2scPYxg5jGz3faJ8kywd+W55v+0N5a81jcuzQEunee3r0voAHEGBc4JsqNhjX2GFsY4exjR3GNnqm9m4n37rjHnl487tSVVxocmwJMC7wTQUA8IvsrBRZds+3pV\/ZRCl9bbzzsC2uYwQYFyxOPADAHm0dLe2TIWM7LJSLBWuc6gsBJsAIMAAAP9DwcrrjLbKq7Q+vVF8IMAFGgAEAeJ22jjTA\/N+kH9eqvhBgAowAAwDwslDr6NmPvy2HvzmiVvWFABNgBBgAgJdp5eXDsmp56cYl9aovBJgAI8AAALwq1Dr63t7rpW3O2HrVFwJMgBFgAABetS43U\/IKy+UPd65osPpCgAkwAgwAwItCrSPd+xKu+kKACTACDADAa4Z0T5NpvdtJ9s8\/lg4PPB+2+kKACTACDADAS0KnjrR1dDD5O41WXwgwAUaAAQB4Sah1lHeovMnqCwEmwAgwAACvqNk6Uto+Ct3zKByL6xj3QnLB4sQDAPynZuto36lKV9UXZXEdI8C4YHHiAQD+o0em95VUOq2jpA5ZkjF8lZxfObDJJ2JxHSPAuGBx4gEA\/qKtoyHdU+W+\/PPOA2\/q5FFNFtcxAowLFiceAOAf2jpaf3emDNlyXk6UVUdUfVEW1zECjAsWJx4A4B81W0cqkuoLASbACDAAgESp2zqKZO9LiMV1jAqMCxYnHgDgfXVbRyrS6ouyuI4RYFywOPEAAO+r2zpSmZPecHXyqCaL6xgBxgWLEw8A8La6rSPVnOqLsriOmQgwKSkpMmXKFOnbt6\/z34cOHZKnn35aPvnkk3qvzk6dOkl+fn6t9xcXF8vQoUPDvpItTjwAwLsaah01Z+9LiMV1zESAGTNmjNx5550yd+5cuXz5skyfPl3Kyspk1qxZ9V6dvXr1ktmzZzv\/JqSqqkpOnDhBgAEAeIK2jtYfq5D1xz678niaW31RBBiPWrNmjWzYsEF27NjhPMI+ffrII488Iv3796\/3iAcMGOBUamoGmKZYnHgAgDc11DpqSfWFAONhnTt3lgsXLkhlZaXzKEeNGiW33367TJw4sd6jnjBhgmRnZzutJm0nFRUVyZIlS6SkpCTsMyTAAADioaHWkWqfO1eqiguloqj2Fgi3LK5jJlpIIffee68MGTJEMjIynLbS6dOn683tggULJCsry3lbXl4ukyZNkq5du8qIESPk0qVLDb4WLE48AMB7GmodtbT6oiyuY6YCzDXXXCM9e\/Z02kQVFRUyY8aMeq\/O1q1bO\/tk9I9KT0+XLVu2yPjx4+XIkSMEGABAwiztkyHTfn2h1tdvafWFAONRGkg6duwo586dky+++MJ5lGlpafLWW2\/Jfffd12hrKGTTpk2Sl5cnBQUFBBgAQNyFax1Fo\/pCgPGopKQk2bVrl4wbN06OHj3qPMo2bdrIzp075Uc\/+pH88Y9\/vPLIW7VqJStWrJC1a9fKwYMHr4Sdbdu2yejRo+X48eNhA0xNuocGAIBo0PCilZe6p45Uc6ov2i5qiLW1y0QLaf78+c6+l0WLFjkbeceOHSs9evRw9rVowOnXr58cOHBAzp49K3PmzJFu3brJ4sWL5cyZM85GX90EPHny5LCvQ4u9QwCAN+ipo+ys5Hqto2hVX5TFdcxEgNETRbrfRU8eafXl8OHDsmzZMmcTb2ZmpmzdutU5Nr13715JTk52wkpOTo6kpqbK\/v37Zfny5VJaWkqAAQDEVbjWUXOrL+EQYALK4sQDABIr1DrKKyyXfae+vAxISDSrL8riOmaiAhNrFiceAJBYU3u3k+vaJ9VrHanm7H1pjMV1jADjgsWJBwAkTqh1lP3zj+s9iGhXX5TFdYwA44LFiQcAJEZjrSMV7eoLASbACDAAgGhprHUUi+oLASbACDAAgGhorHWkYlF9IcAEGAEGANBSTbWOVOakN+T8yoEt\/VL1WFzH2APjgsWJBwDEV2OtI5XaM1eSu9wqZfnzov7ALK5jBBgXLE48ACC+9g3r3OCpIxWrvS8hFtcxAowLFiceABAfblpHsay+KIvrGAHGBYsTDwCIj6ZaR7GuvhBgAowAAwBojqZOHalYV18IMAFGgAEARMpN60irL+m5c+XT\/HlSXXoq0i\/hmsV1jBaSCxYnHgAQW021jlQ8qi\/K4jpGgHHB4sQDAGKrsVNHKl7VFwJMgBFgAABuuWkdqXhVXwgwAUaAAQC45aZ1FKq+lL423u2nbRGL6xgtJBcsTjwAIPqys1JkaZ+MsBesC4ln9UVZXMcIMC5YnHgAQHS5bR1p9aVtzoNSUZQvVcWF0X0QYVhcxwgwLliceABAdGnl5cOyask7VN7oJ4539UVZXMcIMC5YnHgAQPS4bR0lovpCgAkwAgwAoDHrcjMlr7Bc9p2qbPTf6d2m2+aMjdvm3RCL6xgVGBcsTjwAIDrcto5Uhweel4sFa+K294UAE3AEGABAQ9y2jlSiqi\/K4joWuApMSkqKTJkyRfr27ev896FDh+Tpp5+WTz75JOx3p8WJBwC0jNtTRyGJqr4QYIwYM2aM3HnnnTJ37ly5fPmyTJ8+XcrKymTWrFkEGACAa5G0jhJZfSHAGLFmzRrZsGGD7Nixw3lGffr0kUceeUT69+9PgAEAuDKke5pM692uyQvWhSSy+kKAMaJz585y4cIFqaz8cqf4qFGj5Pbbb5eJEycSYAAArrg9daQSXX0hwBhz7733ypAhQyQjI8NpK50+fZoAAwBoUiStI5Xo6gsBxphrrrlGevbsKQMGDJCKigqZMWMGAQYA0KhIW0deqL4QYAxo3bq1dOzYUc6dOydffPGF84zS0tLkrbfekvvuu09KSkoafJacQgIARHrqSHmh+kKAMSApKUl27dol48aNk6NHjzrPqE2bNrJz50750Y9+JH\/84x\/DBpiasrOzDYwGACASuu9lX0llk\/c6CtHbBmQMXyXnVw6M5Mu0mP7S3RBra1fgrgMzf\/58Z9\/LokWLnI28Y8eOlR49esiIESOkuro6bICxNvEAAPe0dTSke6rcl3\/e9Qd5pfqiLHYSAhdg9OJ1ut9FTx5p9eXw4cOybNkyNvECABqkraP1d2fKkC3n5URZw7\/oNiRz0htxr76EQ4AJKIsTDwBwR1tHkVRelJeqL8riOha4CkxzWJx4AEDTmtM6StTel8ZYXMcIMC5YnHgAQOOa2zpqnzvXudt0RVG+Z4bY4jpGgHHB4sQDABqnraP1xypk\/bHPXA+VF6svyuI6RoBxweLEAwDCa07rSHmx+kKACTACDAAER3NbR16tvhBgAowAAwDB0ZzWkZerLwSYACPAAEAwNLd15OXqCwEmwAgwAGBfc1tHXq++EGACjAADALaFbtQY6akj5fXqCwEmwAgwAGCbto6ys5Jl2q8vRPxE2+Y86HzMxYLVEX9svFhcxzhG7YLFiQcAfKklrSM\/VF+UxXWMAOOCxYkHAHypuaeOVGrPXEnucquU5c\/z9HBaXMcIMC5YnHgAwJeW9sloVuvIL9UXZXEdI8C4YHHiASDoWtI6Un6pvhBgAowAAwC2hE4d5RWWy75TlRE\/OT9VXwgwAUaAAQBbpvZuJ9e1T2pW68hv1RcCTIARYADAjlDrKPvnHzf7SXV44Hn5NH+eVJeeavbniCeL6xh7YFywOPEAEEQtbR35sfpCBSbACDAAYENLW0e69yU9d66vqi8EmAAjwACA\/0WjdeSnk0c1WVzHaCG5YHHiASBIotE60uqL3jagoihfqooLfTV8FtcxAowLFiceAIKkpa0j5dfqi7K4jhFgXLA48QAQFNFoHfm5+kKACTACDAD4UzRaR36vvhBgPG7YsGEyYMAAufrqq+Xdd9+V5cuXy7Fjx+o96k6dOkl+fn6t9xcXF8vQoUPDPkMCDAD4UzRaR36vvhBgPOyee+6RCRMmyOzZs+X999+XkSNHSp8+fZxQUlFRUeuR9+rVy\/l306dPv\/L+qqoqOXHiBAEGAIzZN6xziy5Yp\/Ru021zxkrpa+N9OzoWfxE3sQdmxYoVUlhYKGvXrnVeXElJSbJjxw6ZMWOG\/Pa3v631gtMqTd++fWsFmKZYnHgAsCxarSOlV931c3hRFtcxEwGmf\/\/+cuTIEfnTn\/7kTFTbtm1l27ZtMmXKFCkqKqr1PaqVmuzsbElJSXHaSfr3S5YskZKSkrDfyxYnHgAsi0brSFmovhBgfCI5OVkee+wx6dq1q4wZM0aqq6trPfIFCxZIVlaW87a8vFwmTZrk\/NsRI0bIpUuXGnyWBBgA8I\/srBRZ2iejxa0jpdWXiwVrfHfdl7osrmMmKjAhPXr0kJkzZzrBZNasWXLhwoV6k9i6dWu5fPmy80elp6fLli1bZPz48U4VpyEWJx4ALIpm68hK9UVZXMfMBBitoAwfPlxeeOEF2bhxY9hqSkM2bdokeXl5UlBQEDbA1KQtKACA90SrdaT8Wn3RsNIQa2uXiQBz9913y7hx42TatGny3nvvhf2OatWqlbPhVzf7Hjx40Pl3aWlpzn6Z0aNHy\/Hjx8MGGGsTDwDWRLN1ZKn6oqjAeNQrr7wie\/fulTfffLPWI\/zoo4+c\/+\/Xr58cOHBAzp49K3PmzJFu3brJ4sWL5cyZMzJx4kTp3LmzTJ48OeyzszjxAGBJNFtHyq\/Vl3AsrmO+r8Donpbdu3c7p4rq0lCiVZWtW7c6x6Y15OgmX31\/Tk6OpKamyv79+52L3pWWlgZq4gHAEt20+2FZteQdKm\/x07JWfVEEmICyOPEAYEU0W0cWqy8EmAAjwACAN0W7dWSx+kKACTACDAB4UzRbR1arLwSYACPAAID3RLt1ZLX6QoAJMAIMAHjPutxMySssl32nKqPy4KydPKrJ4jrm+1NI8WBx4gHAz6LdOrJcfaECE2AEGADwjiHd02Ra73ZRuddRiOXqCwEmwAgwAOAN0T51pKxXXwgwAUaAAQBviHbrSFmvvhBgAowAAwCJF4vWkcqc9IacXzkw8U8whiyuY2zidcHixAOA3+ipo2m\/viAnyqqj9tCDUH2hAhNgBBgASCwNL\/tKKqNyr6OQpA5ZkjF8lfnqCwEmwAgwAJA42joa0j1V7ss\/H9UHEZTqCwEmwAgwAJAYeupo\/d2ZMmTL+ai2joJUfSHABBgBBgASIxatIxWk6gsBJsAIMAAQf7FqHQWt+kKACTACDADEV6xaR0GsvhBgAowAAwDxpa2j9ccqZP2xz6L6hYNYfSHABBgBBgDiJ1ato6BWXwgwAUaAAYD4iGXrKKjVFwJMgBFgACA+YtU6CnL1hQATYAQYAIi9WLaOglx9IcAEGAEGAGIrlq2joFdfCDABRoABgNiKZeso6NUXAowhw4YNkwEDBsjVV18t7777rixfvlyOHTsW9hkSYAAgdrR1lJ2V7NxpOhaCdtXdhlhcx1p17NjxcixeMF51zz33yIQJE2T27Nny\/vvvy8iRI6VPnz4ydOhQqaioCMzEA4AXxLp1lNzlVmmbM1ZKXxvvhaebMAQYA1asWCGFhYWydu1a59kkJSXJjh07ZMaMGfLb3\/6WAAMAcaLhZWmfjJhcsC6E6suXCDAG9O\/fX44cOSJ\/+tOfnGfTtm1b2bZtm0yZMkWKiooIMAAQJ7FuHSkNMEGvvhBgDEpOTpbHHntMunbtKmPGjJHq6moCDADEQaxbR6HwcrFgjVQVF8bhGXkbFRhDevToITNnzpTy8nKZNWuWXLgQfvOYxYkHgETSU0d5heWy71RlTB4Ge19qs7iOBW4TrxoxYoQMHz5cXnjhBdm4caNcunSp0W8gixMPAImke19idepIsfeFAGPO3XffLePGjZNp06bJe++95+r5aYCpKTs729XHAQBqC7WOsn\/+ccyGJujVl7prVoi1tStwFZhXXnlF9u7dK2+++Watb56PPvpIKisbLmVSgQGAlgudOopl60hRfanP4joWqADTunVr2b17t6SkpNSb3cmTJzvHqxticeIBIN6m9m4n17VPimnrKOjVl3AsrmOBCjDNZXHiASCe4tE6ovoSnsV1jADjgsWJB4B4iVfrKBRguO5LfRbXMQKMCxYnHgDiJR6tI6ovjbO4jhFgXLA48QAQD\/FqHbH3hQCDBhBgACBy8WodJXXIkrY5D0pFUT5X3Q3D4jpGBcYFixMPALEWr9ZRas9cpwJTlj8v1k\/JtyyuYwQYFyxOPADEUrxaR1Rf3LG4jhFgXLA48QAQK\/FqHSmqL+5YXMcIMC5YnHgAiJV4tY60+pKeO1c+zZ8n1aWnYvV0TLC4jhFgXLA48QAQK\/uGdY7pvY5CqL64Z3EdI8C4YHHiASDa4tk6UnrPI6ov7lhcxwgwLliceACItni1jhTVl8hYXMcIMC5YnHgAiKbsrBRZ2icjLq0j3fuSMXyVnF85MJpPwTSL6xgBxgWLEw8A0RLv1hHVl8hZXMcIMC5YnHgAiBatvHxYVi15h8qj9SnDovrSPBbXMQKMCxYnHgCiIZ6tI9U+d65zuwC9bQDcs7iOEWBcsDjxANBSodbRffnnW\/qpXKH60nwW1zECjAsWJx4AWiqerSNF9aX5LK5jBBgXLE48ALREvFtHKnPSG5w8aiaL6xgBxgWLEw8AzRXvU0dUX1rO4jpGgHHB4sQDQHPFu3XE3peWs7iOEWBcsDjxANAcQ7qnybTe7eJywboQvWXAxYI1zukjNI\/FdYwA44LFiQeA5liXmyl5heWy71Rlcz48YsldbpW2OWOl9LXxEX8s\/sriOkaAccHixANApOLdOlJUX6LD4jpmLsCMHTtWNm7cKOfOnWtw1jt16iT5+bUvgFRcXCxDhw4N+yqxOPEAEIlEtI6ovkSPxXXMVIC5+eab5ZlnnpH7779fTp482eDM9+rVS2bPni3Tp0+\/8vdVVVVy4sQJAgwANEBPHa2\/O1OGbDkvJ8qq4zJGunG3bc6DzhV32fvScgQYj9KqysqVK+X66693HuHgwYPDBpgBAwZI3759awWYpliceABwS\/e97CupjMu9jkK4YWN0WVzHTFRgkpKSJDMzU9LS0mTdunWNBpgJEyZIdna2pKSkOMGnqKhIlixZIiUlJWFfLRYnHgDc0NbRkO6pcbtdgNLqS3ruXDbuRpHFdcxEgLmS2FNTZffu3Y0GmAULFkhWVpbztry8XCZNmiRdu3aVESNGyKVLlxp8uViceABwY9+wznFtHSmqL9FncR0LXIBp3bq1XL582fmj0tPTZcuWLTJ+\/Hg5cuQIAQYA\/iIRrSMuWhcbBBiPc1OBacimTZskLy9PCgoKCDAAIJKQ1pHSjbvqYsFq5iGKCDAe11SAadWqlaxYsULWrl0rBw8edJ6N7pvZtm2bjB49Wo4fPx42wNSke2gAwKpEnDpSVF+iQ8NKQ6ytXeZbSLpZt1+\/fnLgwAE5e\/aszJkzR7p16yaLFy+WM2fOyMSJE6Vz584yefLksK8ci8kVAMLR1tH6YxWy\/thncR2k9rlznSPTenQa0WVxHTMfYPR00tatW51j03v37pXk5GQnrOTk5DgVm\/3798vy5cultLSUAAMg8BJx6ojqS+wRYALK4sQDQF2Jah0pbhkQWxbXMVMVmFixOPEAUFeiWkehAMMNG2PH4jpGgHHB4sQDQE2JbB3pResuFqzhlgExZHEdI8C4YHHiASAkka0jvWhdm+\/kUn2JMYvrGAHGBYsTDwBKw8vSPhkJOXUUumUA1ZfYs7iOEWBcsDjxAKC0dZSdlSzTfn0h7gOiF63TEFOWPy\/uXztoLK5jBBgXLE48ACSydRS6aN2FV8dJdekpJiPGLK5jBBgXLE48ACTy1JFetE5RfYkPi+sYAcYFixMPINgS2TpSmZPekPMrBwZ7EuLI4jpGgHHB4sQDCK5Eto6UXrTu89\/lc8uAOLK4jhFgXLA48QCCKXTqKK+wXPadqoz7ICR3uVXSB8yl+hJnFtcxAowLFiceQDBN7d1OrmuflJBTRxybThyL6xgBxgWLEw8geEKto+yff5yQJ89F6xLH4jpGgHHB4sQDCJZEt45Cx6Y\/fXMetwxIAIvrGAHGBYsTDyBYEtk6UhybTiyL6xgBxgWLEw8gOBLdOgpVXzg2nTgW1zECjAsWJx5AMCS6daQ4Np14FtcxAowLFiceQDAkunXEsWlvsLiOEWBcsDjxAOzzQusoPXcud5v2AIvrGAHGBYsTD8A2L7SOODbtHRbXMQKMCxYnHoBtiW4dcWzaWyyuYwQYFyxOPAC7Et06Uhyb9haL6xgBxgWLEw\/AJi+0jjg27T0W1zECjAsWJx6ATYluHSmOTXuPxXWMAOOCxYkHYE92Voos7ZORsHsdhWROeoOL1nmMxXUs0AFm7NixsnHjRjl37lyjLzWLEw\/AFq+0jjg27U0W17HABpibb75ZnnnmGbn\/\/vvl5MmTBBgAvuaF1pEem9YL15Xlz\/P1WFpEgDGgU6dOsnLlSrn++uudZzN48GACDADf2zesc0JbR6GNuxdeHSfVpad8P57WEGAMSEpKkszMTElLS5N169YRYAD4mhdaR0o37lYVH5KLBat9PZ5WEWAMSU1Nld27dxNgAPiabtr9sKxa8g6VJ+x5cL8j7yPAGEKAAeB3Xjh1pK0jNu56HwHGkEgDTE3Z2dmGRgKAH3mldcTGXe\/RsNIQa2tXYE8hRRpgrE08AH\/zQuuIK+76BxUYQwgwAPzKC60jpfc70hNHbNz1PgKMIQQYAH4Uah3dl38+oQ+fjbv+QoAJKIsTD8CfvNI6YuOuv1hcxwK7ByYSFicegP8M6Z4m03q3S+gF6xQbd\/3H4jpGgHHB4sQD8BevnDriirv+ZHEdI8C4YHHiAfiLF1pHiivu+pPFdYwA44LFiQfgH15pHanMSW\/I+ZUD\/TN4cFhcxwgwLliceAD+oTdqHLLlvJwoq07Yg+aKu\/5mcR0jwLhgceIB+MO63EzZV1KZ0HsdqbY5Dzohpix\/nj8GDrVYXMcIMC5YnHgA3qetoyHdUxN+zReuuOt\/FtcxAowLFicegLfpqaP1d2fSOkJUWFzHCDAuWJx4AN7mldYR13yxweI6RoBxweLEA\/Aur7SOlJ46uvDqOOeeR\/Avi+sYAcYFixMPwJu80jpSXPPFDovrGAHGBYsTD8CbtHW0\/liFrD\/2WUIfoLaO0nIe5JovRlhcxwgwLliceADe45XWEdd8scfiOkaAccHixAPwFi+1jtrnznX2vFwsWO2tQUKzWVzHCDAuWJx4AN7ildZRcpdbJX3AXFpHxlhcxwgwLliceADeQesIsWZxHSPAuGBx4gF4g5daR9wuwC6L6xgBxgWLEw\/AG2gdIR4srmMEGBcsTjyAxNPWUXZWskz79YWEPhhOHdlncR0jwLhgceIBJBatI8STxXWMAOOCxYkHkDgaXpb2yfDEBes4dRQMFtcxAowLFiceQOLQOkK8WVzHCDAuWJx4AIkRah1l\/\/zjxDyAGjh1FBwW1zEzAaZfv34yatQoycjIkN27d8vy5culqqqq3quzU6dOkp+fX+v9xcXFMnTo0LCvZIsTDyAx9NRRXmG57DtVmZgHUIPeafr8yoEJfxyIPYvrmIkAc8MNN8iqVavk8ccflw8++EDmzZsnBw8elOeee67eq6JXr14ye\/ZsmT59+pW\/06Bz4sQJAgyAmJrau51c1z6JU0eIOwKMRz366KNy+fJlWbRokfMIb7vtNpk\/f74MGDBALl26VOtR6\/v69u1bK8A0xeLEA4gvr7WOFPc6Cg6L65iJCsyLL74oGzZskG3btjmvxuTkZHn77bdl0KBBcvr06Vqv0AkTJkh2drakpKQ47aSioiJZsmSJlJSUhH0lW5x4APETOnXkhdYRp46CyeI6ZiLAvP766\/LUU0\/Jnj17rrwyd+7cKQ899JC88847tV6tCxYskKysLOdteXm5TJo0Sbp27SojRoyoV60JsTjxAOKH1hESzeI6ZiLAbN68WZ588knZu3fvldfIrl27ZOrUqXL48OFar5vWrVs77Sb9o+i\/Qw8AABfcSURBVNLT02XLli0yfvx4OXLkSIOvMYsTDyA+vNQ6ap87V6pLT9E6CiCL65iJAPPSSy\/JunXrZPv27c7LMtRCGjx4sJw8ebLJl+qmTZskLy9PCgoKwgaYmrQFBQBN8VLrKLVnrrT5Tq6Uvja+qYcNn9Ow0hBra5eJAKObeCsrK529LOqWW26RhQsX1tvE26pVK1mxYoWsXbvWOaWk0tLSnL0zo0ePluPHj4cNMNYmHkDseal1lDF8lVx4dZxTgUHwUIHxqJtuukmWLVsmDz\/8sFNxeeKJJ+To0aPy7LPPOpt19RoxBw4ckLNnz8qcOXOkW7dusnjxYjlz5oxMnDhROnfuLJMnTw777CxOPIDY8krrKHSjxs9\/ly8VRbWvgYXgsLiOmajAqHAXssvMzJStW7c6x6Z1j4y2lzSs5OTkSGpqquzfv9+56F1paSkBBkBUeKl1xNV2oQgwAWVx4gHEjtdaR1xtFxbXMTMVmFiyOPEAYiM7K8W503Si73UUah1dLFgjVcWFsXmy8A2L6xgBxgWLEw8g+rzUOuLINGqyuI4RYFywOPEAos8rrSOOTKMui+sYAcYFixMPIPr2DevsidYRR6ZBgIGDAAOgMV5pHbHvBeFYXMeowLhgceIBRI9XWkd6ZFpxl2nUZXEdI8C4YHHiAUSHV04d6b6XtJwHOTKNBllcxwgwLliceAAt55XWkcqc9Aa3CkBYFtcxAowLFiceQMvp9V4+LKuWvEPlLf9kzcS+F7hhcR0jwLhgceIBtJwXTh2x7wVuWFzHCDAuWJx4AM3nldYR13uBWxbXMQKMCxYnHkDzeaV1xPVe4JbFdYwA44LFiQfQPEO6p8m03u0SesE69r0gUhbXMQKMCxYnHkDkvNI64j5HiJTFdYwA44LFiQcQOS+0jnTTrlZgyvLnRf4EEFgW1zECjAsWJx5AZLzQOuJidWgui+sYAcYFixMPwL1Q6+i+\/PPuPyjKtOrCpl00l8V1jADjgsWJB+BeoltHofDyWcFqqSjKd\/\/Agb+wuI4RYFywOPEA3PFC66jDA89LVfEhbtKIZrO4jhFgXLA48QCapq2j9XdnypAt5+VEWXXTHxADbNpFNFhcxwgwLliceABNW5ebKftKKhN2ryM27SJaLK5jBBgXLE48gMZp62hI99SEbdxN7nKrpA+Yyx2mERUW1zECjAsWJx5A4\/RGjYlqHYU27X765jypKi5kqtBiFtexQAaYfv36yahRoyQjI0N2794ty5cvl6qqqrAvEIsTDyC8RLaOOHGEWLC4jgUuwNxwww2yatUqefzxx+WDDz6QefPmycGDB+W5554jwABIaOsodI8jThwh2ggwBjz66KNy+fJlWbRokfNsbrvtNpk\/f74MGDBALl261OAztDjxAOpL9KkjThwhViyuY4GrwLz44ouyYcMG2bZtm\/M6SU5OlrffflsGDRokp0+fJsAAAaato\/XHKmT9sc\/iPgqEF8QSAcaA119\/XZ566inZs2fPlWezc+dOeeihh+Sdd94hwAABlchTRxpe2vTMlfMrBwZ09BFrBBgDNm\/eLE8++aTs3bv3yrPZtWuXTJ06VQ4fPkyAAQIoka2j0LVeLrw6TqpLTwVw9BEPBBgDXnrpJVm3bp1s377deTahFtLgwYPl5MmTBBgggBLZOsqc9AbhBTFHgDFAN\/FWVlbKkiVLnGdzyy23yMKFC5vcxFtTdna2gZEAoBLVOgqdOLpYsIZrvSCqNKw0xNraFbhNvDfddJMsW7ZMHn74Yafi8sQTT8jRo0fl2WefDfsCsphcAUjCWkeEF8SbxXUscAFGcSE7ALrvZWmfjLifOuJaL0gEAkxAWZx4IOi0dZSdlSzTfn0hrkPR4YHnuVAd4s7iOhbICkykLE48EGSJOHVE5QWJZHEdI8C4YHHigSCL96kjwgsSzeI6RoBxweLEA0E1tXc7ua59UtxaRxpe2vQc4Az3xYLVQR12JJjFdYwA44LFiQeCKNQ6yv75x3F5+oQXeIXFdYwA44LFiQeCJnTqKK+wXPadqoz50ye8wEssrmMEGBcsTjwQNPFsHYXCCy0jeIXFdYwA44LFiQeCJJ6to1B40bdl+fOCNMzwMIvrGAHGBYsTDwSJnjqKR+sodNroi9JThBd4isV1jADjgsWJB4IiXq0jjkrDyyyuYwQYFyxOPBAE8WodEV7gdRbXMQKMCxYnHrAuXqeONLxkDF8lnxfls2kXnmVxHSPAuGBx4gHr4tE6IrzALyyuYwQYFyxOPGBZPFpHtI3gJxbXMQKMCxYnHrAqHq0jwgv8xuI6RoBxweLEA1bFunWU2jNX0nIelE\/fnCdVxYVWhxHGWFzHCDAuWJx4wKLsrBRZ2icjZvc6apvzoLTpmSsXXh0n1aWnLA4hjLK4jhFgXLA48YA1sW4dEV7gZxbXMQKMCxYnHrAmVq2j0K0Bkrv0ltLXxlsbNgSExXWMAOOCxYkHLIlV64hj0rDC4jpGgHHB4sQDVsSqdcRJI1hicR0jwLhgceIBK2LROgrtd7lYsNq5wi7gdxbXMQKMCxYnHrBi37DOUTt1FNrvoieNzq8caGWIAJPrGAHGBQIM4D3Rbh2x3wWWWVzHCDAuWJx4wO\/0ei8fllVL3qHyFj8V9rvAOovrmJkA069fPxk1apRkZGTI7t27Zfny5VJVVVXvNdmpUyfJz6\/d0y4uLpahQ4eGff1anHjAz6J16qhmy4j9LrDM4jpmIsDccMMNsmrVKnn88cflgw8+kHnz5snBgwflueeeq\/d67NWrl8yePVumT59+5e806Jw4cYIAA\/hAtFpHGl50s+5Xrr+VK+vCPAKMRz366KNy+fJlWbRokfMIb7vtNpk\/f74MGDBALl26VOtR6\/v69u1bK8A0xeLEA34VjdYRLSMEjcV1zEQF5sUXX5QNGzbItm3bnNdkcnKyvP322zJo0CA5ffp0rdfphAkTJDs7W1JSUpx2UlFRkSxZskRKSkqowAAeN6R7mkzr3a7Zp45oGSGoCDAe9frrr8tTTz0le\/bsufIId+7cKQ899JC88847tR71ggULJCsry3lbXl4ukyZNkq5du8qIESPqVWtCLE484DctbR2FThl98ecSbgmAwLG4jpmowGzevFmefPJJ2bt375UX5a5du2Tq1Kly+PDhWi\/U1q1bO+0m\/aPS09Nly5YtMn78eDly5EiDL2qLEw\/4TUtaR6EL0+lF6XSzLhA0Ftcx3wWYu+66S2bOnOm89o4ePeoEj5deeknWrVsn27dvd94faiENHjxYTp482eTrdNOmTZKXlycFBQVhA0xN2oICED\/NbR3VbBldeHWcVJeeit+DBhJEw0pDrK1dvgswDdFNvJWVlc5eFnXLLbfIwoUL623ibdWqlaxYsULWrl3rnFJSaWlpzt6Z0aNHy\/Hjx8MGGGsTD\/hFc1tHVF2Av6IC41E33XSTLFu2TB5++GGn4vLEE0841Zlnn33W2ayr14g5cOCAnD17VubMmSPdunWTxYsXy5kzZ2TixInSuXNnmTx5cthnZ3HiAb9oTuuowwPPO0\/v0\/x5VF0A4VYCnhbuQnaZmZmydetW59i07pHR9pKGlZycHElNTZX9+\/c7F70rLS0lwAAeo62jId1T5b78800+sprtIva6ALVZ\/EXcRAsp1ixOPOAHeqPGIVvOy4my6kYfbuiE0aUPCp1Nuux1AQgwMFp6A7xuXW6m7CupbPReRzWrLp++OU+qigu9\/rSAhLD4izgVGBcsTjzgZU21jmgXAZGxuI4RYFywOPGAV+mpo\/V3Z4ZtHaX2zJW0nAdpFwERsLiOEWBcsDjxgFeFax3VvPki7SIgMhbXMQKMCxYnHvCihlpHNdtFnxWsloqifC8+dMDTLK5jBBgXLE484CUzJ90oP33lWK3WEftcgOixuI4RYFywOPFAonW5tq1cd2072XPgI\/nkD\/fKsf\/vbRlacFG63vQtOVjxXWnTM5fruQBRYnEdI8C4YHHigUS74+++Km+8nCM\/eeL\/yY8eu10GDHpLnv\/JYJm5vbe8\/dbvuOkiEEUW1zECjAsWJx7wgt\/M+KZ8a9TNzkMpPnlRpq66LL\/asMMLDw0wxeI6RoBxweLEA7GmG3K\/kZ4k17Vv7RyNVtelJzn\/nfzd6yQ5u0vYh\/DkyiOyeOWRWD9EIDAsrmMEGBcsTjwQCQ0dofChsrOSnbehYJKdlXLlcv8fflr91\/8u+0JO\/OX\/952qdDbmJl9\/q7T5Tq60vurr0vn4q7Ju2gVnP4waOLLA2RMDILosrmMEGBcsTjwQouFDg0ioWhIKJqHAEroPUc1gMu3XFyIawJonivR+RXoUOqv6iGx++Xsy+bFCZy+MhpfQW0IMEF0W1zECjAsWJx7BoG2chqolSoOJhpIr\/\/2Xasn6Y59FZXDqVlvOrxxY6\/PqJl4VOoXU6aZNtd4HIHosrmMEGBcsTjz8p2YbJ5Jqyb5TVVdCirZxYq2haktTN1nU68Cw5wWIHYvrGAHGBYsTD2\/RSokKt+m1bhsn2tWSlgqFluQuvZ29LZ8X5XMMGvAQi+sYAcYFixOP+FraJ+PLgFJjM2xDe0vqbnr1srotIg0tVR8UNlltARB\/FtcxAowLFicezRPa8OqEkTBHhBsKJjXbODU3w\/pN3dAS2pDbVIsIQGJZXMcIMC5YnHg0rO6m18ZO4nitjRNLbXMevNIe0tBSlj8vll8OQJRZXMcIMC5YnHjr6l63pLnVknhsevWaUJUlucutzv2IqktP0R4CfM7iOkaAccHixPtdaNNrJBdUyzv0qd+fdkxoYGnd4evOBeZCm3C1yqJtIb1eCwD\/s7iOEWBcsDjxXja1d7pz+XnV1KbX0N6SaF27JAgaCixf\/LlEqooPsQkXMMriOkaAccHixMdLzU2vdaslNfeXNHRBNaUbYoPYxommmi2h1lptuerrBBYgYCyuYwQYFyxOfDTUvFmf22oJlZLYqhtWtC2ke1hoCQHBZnEdC3SAGTt2rGzcuFHOnTvX6Cvb4sTX1dxNr6GTOIpwEl+6yTbpqiznbaiyokJhpfrPpzjeDMBhcR0LbIC5+eab5ZlnnpH7779fTp48aTrAhGvjRPNmfYg+raYoraI4b\/8SVEJVFd238kXplyGFsAKgMQQYAzp16iQrV66U66+\/3nk2gwcPbjLAHDu0RLr3nu7JZ1+zjaNVFNVYMNFNr1RKvCe1Z64TUJRWU0IhRWlFRXHtFQDNRYAxICkpSTIzMyUtLU3WrVsXNsB0ubatXHdtu1p3yq35vlio28aJ5IjwiU+rr1wB1i+bXi1+Q4WjF4L78vTPX6squjdF1aykqGhUU4I0tvHG2MYOYxs7Fsc2sC2k1NRU2b17d9gAc8fffVXeeDlHBo4scN72+sF22fzy92TyY4VOqIlU3Zv1KTdHhC1XS\/z4DaWVEqXXTQm1eEKhRE\/36PvqBhMnlJSeki9KS5xwomJ96X0\/jq1fMLaxw9jGjsWxJcA00kIKhRhVfPJio+Gl5s36lO47aexmfcpyOHEj3t9QWgVRoeDxZRD5siLi\/PdVX6\/196EgokJVkpBQIFFevNhbvMc2SBjb2GFsY8fi2JoOMHfddZfMnDnTeUUcPXpUxo8ff+XV0VgFZuakG2XWpBvDvpI+OPC5VO3\/UEpaf01Kkr7m\/LvC5J7O20vpX\/7\/51k9YvdKTJCzF6Pzhc981qrRT9TY1\/la24Y\/9Oq0y7X+ou6\/u7rtX\/\/+a2lf\/tP\/c90X0XlCAOAD2dnZPniU7pkOMI1pqoWkdM+Lto30rdJ2UnPaRwAAILoIMGFaSKHwonteau6FIcQAAJB4BJgwAUb3vyituHzyh3ul002bar0PAAAkTmADTCR0T8zilUci+RAAABBDBBgAAOA7BJgw9IJ3Dz74oPTv318+\/\/xz56J369ev990EJ1r37t3l3\/7t36Rr167y+9\/\/XhYtWiRnz55t8GHdfvvtzpj\/zd\/8jZw5c0Zeeukl2blzZ6KfgmdFMrY1fec733GuPt3UPcCCLJKxzcjIcE473nrrrfLnP\/9Zli1bJr\/5zW+CPHxhRTKuffr0ce5Xl5WVJcePH5cVK1bI7373O8a1GZKTk+Whhx6SJUuWNOOjvYsAE4beI+mf\/umf5NFHH5UOHTo4C+9\/\/Md\/OGfp4Y5+02zevFl+8YtfyI4dO2TUqFHyrW99S8aMGVPvE2ho+a\/\/+i959tlnndDy3e9+Vx555BHnB9ixY8fcfcEAiWRsa+rWrZusWbNG\/v3f\/1327t0boBFzL9KxffHFF+V\/\/\/d\/5ZVXXpEf\/OAHMnz4cOcCmaWlpe6\/aABEMq56q5ef\/OQnkpeX54TBe+65RwYOHCj33nuvfPbZZwEYrehp1aqVPPDAA85rUtc0SwgwYWi1RX\/Q\/\/d\/\/7fzL7QyoItv6LoyaNo\/\/uM\/yujRo2Xo0KHOP9aj69u3b3eux6PX5alpxIgR0rt3b\/nXf\/3XK+\/W3xbeeecdpxKD2iIZ25CUlBRnLL\/xjW8QYBoRydj26NFDFi9e7Cyuly5dchaLGTNmOMH93Xff5WVbQyTjqv9Wf04MGjTI+Qx665e33npL\/uVf\/qXezw6Ed8cddzi\/CHbu3NmpahNgAqBNmzbyq1\/9yvnmOX36tPOM\/\/7v\/94JL\/\/8z\/8cgBGIjokTJzr3nXriiSeufEINhb\/85S9l69attb6Ihhf9Da1m6f2FF16QgoICWbt2bXQekCGRjG3I9OnTpbKy0inNL126lApMGJGMrVYTtVowZ84cJ7xcvlz7gor4q0jGVUO2ft8vXLhQDhw44Cy8Q4YMcaoI2tKHO7qWtW\/f3mnPjxs3jgATBNdee61s2LBB7rzzzivlyhtuuEFWrVolffv2DcIQRIX+UNd9FtoWCnnqqaekqKjIKQ83RoOiVr207VRSUtLovw2iSMdWr8A5YcIEZ8H92c9+RoBpRCRjq7\/UtG3b1lkkdA\/Mxx9\/7FS56gZ0SETjqjSwTJs27crQTZkyRQ4ePMhQNsM\/\/MM\/OK9VKjABEAow3\/\/+96WiosJ5xt\/+9rdl9erVzm+v\/Jblji4En3zyiaxcufLKBzz99NPOZt6XX365wU\/y1a9+1fmh9bd\/+7fO2\/fee8\/dFwuYSMb2qquucvYX6Wbq999\/3wnnVGDCi2Rsf\/zjH0tOTs6V\/XFaSdSWkoZFNpzWFsm4asVA\/73+0XaztkL054FWET788MOAfbe3HAEmQLTfumvXrnotJN34qJvJ4M7kyZOdExoLFiy48gEaAt98803nT136TaY\/sHTsn3\/+eblw4YK7LxRAkYytbkDXjdA\/\/elPnZHSt88884z8z\/\/8j1RVVQVw9BoXydhqKOzYsaPzsyHkueeec8LLf\/7nfzK2NUQyrvpzQE8r6s+BEH0dHzlyhJZyMxBgAkaPTes3jy6mSlsZN954I5t4I9CvXz8ZOXKk\/PCHP3Q+Sve46KZo\/e207iZePWate16efPJJZ7MeGhfJ2L7++uty9dVX1\/uEur+ITen1RTK22ubQ\/XEaZEK0AvOHP\/whbJUxqCIZ1\/nz58upU6ecMBiiPxt0YzSb+iNHgAkYPXamO+Effvhh5xi1XoNAfwPYs2dPwEai+XQDmW7Y1aqLHqPWE0m6T0DfKr0eiY6tVgJ0nL\/5zW86Y1xTWVkZlZgGRDK2ddFCalwkY5uenu6Mp+7z0kCoe400FGpwLy4ubuIrBUsk4\/q9731PHn\/8cZk9e7ZTddEW0qxZs5yfHXpNGESGABMweqJAKwUaYvTkhm583LRpU8BGoeX0uiP6A71Lly7OkWg9kaT7YpT+1qpVLd1YqgFR+9516W9benIJ9bkdWwJM5CIZW90fpye89FpGGlq0asBm04ZFMq65ubnOL5Jf+9rX5IMPPnAOUXCBwOYhwAAAAHgEF7IDAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+Q4ABAAC+8\/8DqvvMiNrBcMUAAAAQZGVCR0ZGREM1NjAyOEY3OTdENTBKUHhdAAAAAElFTkSuQmCC","height":420,"width":560}}
%---
%[output:17ac3887]
%   data: {"dataType":"textualVariable","outputData":{"name":"I","value":"   8.8137e-01\n"}}
%---
%[output:60ac890e]
%   data: {"dataType":"textualVariable","outputData":{"name":"m","value":"    10\n"}}
%---
%[output:7a8f88a4]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_T","value":"   8.8227e-01\n"}}
%---
%[output:88ac4780]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_M","value":"   8.8101e-01\n"}}
%---
%[output:63594683]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_CS","value":"   8.8137e-01\n"}}
%---
%[output:05c98fa9]
%   data: {"dataType":"text","outputData":{"text":"-----------\n","truncated":false}}
%---
%[output:6043d368]
%   data: {"dataType":"textualVariable","outputData":{"name":"m","value":"   100\n"}}
%---
%[output:810fa223]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_T","value":"   8.8138e-01\n"}}
%---
%[output:2e4da158]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_M","value":"   8.8137e-01\n"}}
%---
%[output:04572ed2]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_CS","value":"   8.8137e-01\n"}}
%---
%[output:32b0c57d]
%   data: {"dataType":"text","outputData":{"text":"-----------\n","truncated":false}}
%---
%[output:4dfa0361]
%   data: {"dataType":"textualVariable","outputData":{"name":"m","value":"        1000\n"}}
%---
%[output:0ada2afa]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_T","value":"   8.8137e-01\n"}}
%---
%[output:71c5a19c]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_M","value":"   8.8137e-01\n"}}
%---
%[output:91043615]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_CS","value":"   8.8137e-01\n"}}
%---
%[output:4c539eb0]
%   data: {"dataType":"text","outputData":{"text":"-----------\n","truncated":false}}
%---
%[output:06268f7a]
%   data: {"dataType":"textualVariable","outputData":{"name":"m","value":"       10000\n"}}
%---
%[output:1be4ded4]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_T","value":"   8.8137e-01\n"}}
%---
%[output:53aa8f5a]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_M","value":"   8.8137e-01\n"}}
%---
%[output:5de2d1c9]
%   data: {"dataType":"textualVariable","outputData":{"name":"I_CS","value":"   8.8137e-01\n"}}
%---
%[output:94888960]
%   data: {"dataType":"text","outputData":{"text":"-----------\n","truncated":false}}
%---
%[output:451247d9]
%   data: {"dataType":"matrix","outputData":{"columns":4,"name":"res","rows":4,"type":"double","value":[["1.0000e+01","8.9624e-04","3.6277e-04","2.0430e-07"],["1.0000e+02","7.4172e-06","3.6348e-06","2.0552e-11"],["1.0000e+03","7.2842e-08","3.6348e-08","2.3315e-15"],["1.0000e+04","7.2711e-10","3.6348e-10","5.5511e-16"]]}}
%---
