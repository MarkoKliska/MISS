using DifferentialEquations
using Plots

function f(t)
    return cos(t)   #dato u zadatku
end

function zadatak2!(dx, x, param, t)
    m, c, k, g = param
    dx[1] = x[2]
    dx[2] = (1/m) * (f(t) + m * g - k * x[1] - c * x[2])
end 

t = (0.0, 20.0)
pocetni_uslovi = [0.0, 0.0]
param = [5, 10, 20, 9.81]

prob = ODEProblem(zadatak2!, pocetni_uslovi, t, param)

sol = solve(prob)

plot(sol, legend=:outerbottom)