using DifferentialEquations
using Plots

#03r Numericko resavanje ODJ - DifferentialEquations
#zadatak se nalazi na kraju strane 1

#2. korak zapis problema pomocu funkcije
function zadatak2(u, param, t)
    return sin(t)
end

#3. korak poznate informacije
tspan = (0.0, 10.0)
pocetni_uslovi = 0;

#4. korak pozivanje ODEProblem
prob = ODEProblem(zadatak2,pocetni_uslovi, tspan)

#5. korak pozivanje solve
sol = solve(prob)

#6. korak plot
plot(sol)


