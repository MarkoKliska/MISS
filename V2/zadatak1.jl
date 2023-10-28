using Plots

t = 0:0.01:10
tp = rem.(t,5)

#y1 = 2*t
#y2 = 2
#3 = -2*t+10
y = (2 .* tp) .* (tp.<2) .+ 2 .* ((tp .>= 2) .& (tp .< 4)) .+ (-2 .*tp .+ 10) .* ((tp .>= 4) .& (tp .<5 ))
plot(t,y)
yticks!(0:0.5:4)
xticks!(0:1:10)
