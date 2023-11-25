using Plots

t = 0:0.01:9
tp = rem.(t,6)

y1 = 2*sin.(pi/3*t)
y2 = max.(y1,-1)
y = min.(y2,1)

plot(t,y, ylim=(-2.5,2.5))
xticks!(0:1:9)
yticks!(-3:1:3)

#=
Zasto pi/3: 
    w - omega
    y = sin(wx) = sin((2*pi/T)*x)
    Nama je period u zadatku T = 6, pa kad 
    ga uvrstimo u formulu dobijemo pi/3*x, odnosno pi/3*t i 
    jos stavimo 2* ispred sinusa jer je amplituda 2
=#

#scatter

t1 = 0:0.3:9
tp1 = rem.(t1,6)
y3 = 2*sin.(pi/3*t1)

yz = y3
yz[findall((yz .< 1) .& (yz .> -1))] .= NaN

scatter!(t1,yz, markershape=:star6)