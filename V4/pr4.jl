using DifferentialEquations
using Plots

function zadatak4!(dx, x, param, t)
    m1, m2, c, k1, k2, k3, g = param
    dx[1] = x[2]
    dx[2] = (1/m1) * (m1 * g + k2 * x[3] - (k1 + k2) * x[1])
    dx[3] = x[4]
    dx[4] = (1/m2) * (k2 * x[1] - m2 * g - c * x[4] - (k2 + k3) * x[3])
end

t = (0.0, 20.0)
param = [5.0, 8.0, 10.0, 20.0, 20.0, 20.0, 9.81]
pocetni_uslovi = [2.0 ,0.0 ,0.0 ,0.0]   
#=
NAPOMENA:
u tekstu imamo da inicijalna pozicija tela mase m1 je za 2 na dole
ako pogledamo sliku videcemo da se m1 krece na dole i zato pisemo 2 a ne -2
=#

prob = ODEProblem(zadatak4!, pocetni_uslovi, t, param)

sol = solve(prob)

#d)

v1 = [x[2] for x in sol.u]
v2 = [x[4] for x in sol.u]

~,index1 = findmax(abs.(v1))
~,index2 = findmax(abs.(v2))

plot(sol.t, [v1, v2], lw = 2)
plot!([sol.t[index1]], [v1[index1]], markershape=:star5)
plot!([sol.t[index2]], [v2[index2]], markershape=:star5)

#e)

a1 = diff(v1) ./ diff(sol.t)
a2 = diff(v2) ./ diff(sol.t)

plot(sol.t[1:end-1], [a1, a2], lw = 2, legend=:outerbottom)

#=
u liniji 42 imamo sol.t[1:end-1] a ne sol.t[1:end] jer diff() vraca niz koji je za 1 kraci zbog toga kako radi
objasnjenje za diff() se nalazi u pr3.jl na liniji 63
=#