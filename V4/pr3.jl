using DifferentialEquations
using Plots

function f(t)
    tp = rem.(t, 5)
    y = (4 * tp) * (tp < 1) + 4 * ((tp >= 1) & (tp < 2)) + (-2 * tp + 8) * ((tp >= 2) & (tp < 3)) + 2 * ((tp >=3) & (tp < 4)) + (-2 * tp + 10) * (tp >= 4)
    #y = (4 * tp) .* (tp .< 1) + 4 .* ((tp .>= 1) .& (tp .< 2)) + (-2 * tp .+ 8) .* ((tp .>= 2) .& (tp .< 3)) + 2 .* ((tp .>=3) .& (tp .< 4)) + (-2 * tp .+ 10) .* (tp .>= 4)
    #tacke se ne moraju koristiti jer solve zna da resi ovo i bez njih, ali ako se stave program prolazi
    return y
end

function zadatak3!(dx, x, param, t)
    m1, m2, c1, c2, c3, k1, k2 = param
    dx[1] = x[2]
    dx[2] = (1/m1) * (f(t) + c1 * (x[4] - x[2]) - k1 * x[1])
    dx[3] = x[4]
    dx[4] = (-1/m2) * (c1 * (x[4] - x[2]) + (c2 + c3) * x[4] + k2 * x[3])
end

t = (0.0, 10.0)
param = [10.0, 15.0, 20.0, 20.0, 20.0, 40.0, 40.0]
pocetni_uslovi = [0.0, 0.0, 0.0, 0.0]   #4 smene pa zato imamo 4 pocetna uslova

prob = ODEProblem(zadatak3!, pocetni_uslovi, t, param)

sol = solve(prob)

plot(sol, legend=:outerbottom)

#crtamo promenu pozicije
#=
x[1] -> pozicija m1
x[2] -> brzina m1
x[3] -> pozicija m2
x[4] -> brzina m2
=#

poz1 = [x[1] for x in sol.u]    #koristimo x[1] da dobijemo pozicije tela m1
poz2 = [x[3] for x in sol.u]    #koristimo x[3] da dobijemo pozicije tela m2

#ovo iznad je kao foreach

plot(sol.t, poz1, legend=:outerbottom)
plot!(sol.t, poz2)

#=
findmax vraca:
_,_ 
najveciBroj,index
=#

~,index1 = findmax(abs.(poz1))
~,index2 = findmax(abs.(poz2))
plot!([sol.t[index1]], [poz1[index1]], markershape=:star5)
plot!([sol.t[index2]], [poz2[index2]], markershape=:star5)

#deo koda ispod je zakomentarisan da bi se mogle prikazati slike

#put1 = sum(abs.(diff(poz1)))
#put2 = sum(abs.(diff(poz2)))

#=
kad racunamo duzine puteva moramo da koristimo abs jer dobijena vrednost za neke elemente diff() povratne vrednosti
moze da bude negativna, a to samo znaci da smo se kretali u suprotnom smeru
da ne stavimo abs oduzimali bi od ukupne duzine puta sto ce dati pogresno resenje

OBJASNJENJE ZA diff()
diff() ide kroz prosledjen niz i vraca razliku uzastopnih brojeva u nizu
primer:
A = [1, 3, 6, 10, 15]
result = diff(A)

rezult bi nam ovde bio [2,3,4,5]

ChatGPT i Bard kazu da diff() po defaultu vraca apsolutnu vrednost razlike ali sam to testirao i dobio brljotinu 
=#

println("Predjeni put prvog tela je: ")
println(put1)
println("Predjeni put drugog tela je: ")
println(put2)
