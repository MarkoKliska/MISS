using Plots, DifferentialEquations

function f(t)
    return sin(t)
end

function primer3!(dx, x, param, t)
    m, c1, c2, k1, k2, g = param
    
    dx[1] = x[2]
    dx[2] = (1/m) * (m * g - k1 * x[1] - k2 * (x[1] - x[3]) - c1 * x[2])
    dx[3] = (k2 * (x[1] - x[3]) - 3 * f(t)) / (9 * c2)
end

t = (0.0, 100.0)
param = [10.0, 10.0, 10.0, 15.0, 10.0, 9.81]
pocetni_usolvi = [-1.0, 0.0, 0.0]

prob = ODEProblem(primer3!, pocetni_usolvi, t, param)
sol = solve(prob)

v = [x[2] for x in sol.u]
plot(sol.t[sol.t .<= 20], v[sol.t .<= 20], label = "v(t)", lw = 2)

x1 = [x[1] for x in sol.u]
x2 = [x[3] for x in sol.u]
plot(sol.t, [x1,x2], label = ["x1(t)" "x2(t)"], legend=:outertopright, lw = 2, yticks = -1:6)