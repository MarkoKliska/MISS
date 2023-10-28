using Plots

t = 0:0.01:10
tp = rem.(t,2)

#y1 = t*2/5

y3 = (t .* 2/5) .* (tp .< 1) 
y4 = 4 .* (tp .< 1) .+ 0 .* ((tp .>= 1) .& (tp .< 2))
y = min.(y3,y4)
plot(t,y)
yticks!(0:1:4)
xticks!(0:1:10)

#=
Ponovo moramo da koristimo t u prvoj jednacini umesto tp 
zato sto imamo funkciju koja raste
=#
#Moze i samo y4 = 4 .* (tp .< 1)


