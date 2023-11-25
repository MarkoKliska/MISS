#matrica koja ce se koristiti
A = [1 4 -2 9 6; -1 0 0 3 7; 99 3 -3 4 7; 5 -6 0 -8 3; 1 2 3 4 5]

#primer 1
p = A[3]

#primer 2
pp = A[3,1]

#primer 3
M = [0 0 0 0 0;
     0 0 0 0 0;
     1 0 0 0 0;
     0 0 0 0 0;
     0 0 0 0 0]

M_logical = convert.(Bool, M)       #ne zaboravi konverziju!
p = A[M_logical]

#primer 4
vrsta = A[1,:]

#primer 5
kolona = A[:, end]

#primer 6
nep_vrste = A[1:2:end, :]

#primer 7
pozitivni = A[A .> 0]

#primer 8
el_opseg = A[(A .>= -5) .& (A .< 5)]

#primer 9
max_el = maximum(A)

#primer 10
using LinearAlgebra

A_rev = reverse(A, dims = 2)
sd = diag(A_rev)    #diag se koristi za pravljenje dijagonalne matrice, ili za izvlacenje elemenata sa dijagonale         

#primer 11
parni = A[rem.(A,2) .== 0]

#primer 12
suma_svake_vrste = sum(A, dims = 2)
max_el = maximum(suma_svake_vrste)
vrste = findall(suma_svake_vrste .== max_el)

#SLOZENIJI PRIMERI

#primer 1
using Statistics, LinearAlgebra

function primer1(B)
    s = mean(B[end,:])
    gd = diag(B)
    v = gd[gd .> 0]
    return s,v
end

B = round.(20 * randn(10,10))
sk, vek = primer1(B)

#primer 5
function primer5(A)
    M = ones(size(A))
    M = triu(M, 1)
    M_rev = reverse(M, dims = 2)
    M_logicko = convert.(Bool, M_rev)
    el_iznad_sporedne = A[M_logicko]

    sred_vred = mean(el_iznad_sporedne)
end

K = [1 4 -2 9 6; -1 0 0 3 7; 99 3 -3 4 7; 5 -6 0 -8 3; 1 2 3 4 5]
s_v = primer5(K)