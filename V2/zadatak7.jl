using Plots

t = 0:0.01:2

y = sqrt.(1 .-(t.-1).^2)

plot(t,y)