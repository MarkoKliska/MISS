using Plots

t = 0:0.01:2*pi
tp = rem.(t,1)

y = sin.(t) .* (tp .< 0.5) .+ 0 .* ((tp .>= 0.5) .& (tp .< 1))
plot(t,y)

#Ovo ispod je samo scatter, deo koda iznad je zadatak

t1 = 0:0.1:2*pi
tp1 = rem.(t1,1)
y1 = sin.(t1) .* ((tp1 .>= 0.5) .& (tp1 .< 1))
y1_nule = findall(y1 .== 0)
y1[y1_nule] .= NaN
scatter!(t1,y1, markershape=:star5)

#=
NAPOMENA
    Moramo da koristimo sin.(t) a ne sin.(tp) jer vrednosti sinusa u toku periode nisu iste.
    Da smo koristili sin.(tp) dobili bi smo nesto poput saw/square wave-a.
=#
#moze i ovako:
#y1 = sin.(t) .* (tp .< 0.5)

