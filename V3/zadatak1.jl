using DifferentialEquations
using Plots

#03r Numericko resavanje ODJ - DifferentialEquations
#zadatak se nalazi na sredini strane 3

#2. korak zapis pomocu funkcije
function zadatak1(dx,x,param,t)
    mi = param
    dx[1] = x[2]
    dx[2] = mi * (1-x[1]^2)*x[2] - x[1]
end

#3 korak poznate informacije
tspan = (0.0, 30.0)
param = 1 
pocetni_uslovi = [0.25, 0.25]

#4. korak pozivanje ODEProblem
prob = ODEProblem(zadatak1, pocetni_uslovi, tspan, param)

#5. korak pozivanje solve
sol = solve(prob)

#6. korak plot
plot(sol)