using Plots, DifferentialEquations

function f(t)
    return sin(t)
end

function primer1!(dx, x, param, t)
    m1, m2, c, k1, k2, R, g = param
    J = 1/2 * m1 * R^2

    dx[1] = x[2]
    dx[2] = 1/J * (k2 * (x[3] - R * x[1]) * R - k1 * x[1] - c * x[2])
    dx[3] = x[4]
    dx[4] = 1/m2 * (f(t) + m2 * g - k2 * (x[3] - R * x[1]))
end

t = (0.0, 20.0)
param = [10, 5, 10, 15, 10, 1, 9.81]
pocetni_uslovi = [0.0, 0.0, 2.0, 0.0]

prob = ODEProblem(primer1!, pocetni_uslovi, t, param)
sol = solve(prob)

θ = [x[1] for x in sol.u]   
ω = [x[2] for x in sol.u]
α = diff(ω) ./ diff(sol.t)

plot(sol.t, [θ, ω], lw = 2, label = ["θ(t)" "ω(t)"])
plot!(sol.t[1:end-1], α, lw = 2, label = "α(t)", legend=:outertopright)

#=
    θ[rad]     -> ugaoni pomeraj    
    ω[rad]     -> ugaona brzina     ->  θ[1]
    α[rad/s^2] -> ugaono ubrzanje   ->  ω[1] == θ[2]

    u rotacionim mehanickim sistemima tipicno se susrecemo sa koturom mase m i poluprecnika
    osnove R. moment inercije ovakvog kotura izracunava se pomocu izraza: 
    J[m^2/kg] = 1/2 * m * R^2  -> ovo se koristi samo ako imas disk
    

    poluga : θ = x1/L1 = x2/L2
        ne zaboravi da nam je i ovde θ ugaoni pomeraj a ne ugao!

=#