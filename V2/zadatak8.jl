using Plots

t = 0:0.01:4

tp = rem.(t,2)

y1 = sqrt.(1 .-(tp.-1).^2)
y2 = (2 .*tp) .* (tp .< 1) .+ (-2. *tp .+ 4) .* ((tp .>= 1) .& (tp .< 2))

y = min.(y1,y2)

plot(t,y)
yticks!(0:0.5:2)

#scatter

#trougao
tt = 0:0.05:4
tps = rem.(tt,2)
yt = (2 .*tps) .* (tps .< 1) .+ (-2. *tps .+ 4) .* ((tps .>= 1) .& (tps .< 2))

#polukrug
yk = sqrt.(1 .-(tps.-1).^2)

#Kako je zadatak bio prikazati minimume od ove dve funkcije, ako hocemo da uzmemo 
#deo koji nije prikazan, koristimo maximum
ym = max.(yk,yt)

scatter!(tt,ym, markershape=:star6)