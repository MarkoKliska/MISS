using DifferentialEquations
using Plots

#03r Numericko resavanje ODJ - DifferentialEquations
#zadatak se nalazi na sredini strane 7

function u(t)
    tp = rem.(t,5)
    y = (3 * tp) * (tp < 1) + 3 * ((tp >= 1) & (tp < 3)) + (-1.5 * tp + 7.5) * ((tp >= 3) & (tp < 5))
    return y    #ovo return y nije obavezno ovde
end

#2. korak 
function zadatak3(dx,x,param,t)
    A,B = param
    dx[1] = A * x[3] + u(t)     
    #=
        u(t) nam predstavlja ulaz u sistem i dato 
        je kao funkcija od koje pravimo u(t) iznad funkcije zadatak3
    =#
    dx[2] = x[3]
    dx[3] = x[2] - B * x[1]
end

#3. korak poznate informacije
tspan = (0.0, 15.0)
pocetni_uslovi = [-1,1,0.5]
param = [2,1]

#4. korak ODEProblem
prob = ODEProblem(zadatak3,pocetni_uslovi,tspan,param)

#5. korak pozivanje solve
sol = solve(prob)

#6. korak plot
plot(sol)