using Plots

t = -3:0.01:3

y = (t.^2 .- 1)
y1 = (.-t.^2 .+1)

plot(t,y)
xticks!(-3:1:3)
plot!(t,y1)

#Jednacine su vec bile date u zadatku