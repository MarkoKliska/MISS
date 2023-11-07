using DifferentialEquations
using Plots

function f(t)
    #u ovom primeru nam je dato da je f(t) = sin(t)
    #moze da bude dat crtez pa da napisemo formulu, inace se dobija crtez pa mi pisemo funkciju
    return sin(t)   
end

function zadatak1!(dx, x, param, t)
    m, c1, c2, k = param
    dx[1] = x[2]
    dx[2] = (1/m)*(f(t) - k * x[1] - (c1 + c2) * x[2])
end    

tspan = (0.0, 10.0)
param = [10, 20, 20, 40]
pocetni_uslovi = [0, 0] #imamo dva pocetna uslova jer imamo dve smene

prob = ODEProblem(zadatak1!, pocetni_uslovi, tspan, param)

sol = solve(prob)

plot(sol, legend=:outerbottom)