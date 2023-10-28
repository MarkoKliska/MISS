using Plots

t = 0:0.01:15
tp = rem.(t,3)

#y1 = 3*t
#y2 = 3
#y3 = -3*x+9

y = (3 .*tp) .* (tp .< 1) .+ 3 .* ((tp .>= 1) .& (tp .< 2)) .+ (-3 .*tp .+ 9) .* ((tp .>= 2) .& (tp .< 3))

plot(t,y, legend=:topright)
xticks!(0:1:15)