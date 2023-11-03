#za slucaj da je neko zaboravio

#6. funkcije

function zbir(x,y)
    x+y
end

#ekvivalentna funkcija prethodnoj je:

zbir1(x,y) = x + y

#=
funkcije definisane na sazeti nacin iznad ne mogu da imaju
vise naredbi

definicija funckije ne mora da sadrzi naredbe return
u tom slucaju, povratna vrednost funkcije je poslednja naredba u telu funkcije
=#

#=mozemo imati i vise povratnih vrednosti
rezultat funkcije f je torka(tuple)
razlika izmedju vektora i torke je to
sto su torke immutable - ne mogu se menjati
=#
function f(a, b)
    return a * b, a + b
end

function f1(a, b)
    return [a * b, a + b]   #ovde je povratna vrednost vektor
end

#opcioni parametri funkcije

function f2(x, y, z = 0)
    println(x)
    println(y)
    println(z)
end

#z nam je predefinisan parametar koji je postavljen na 0
#u ovom primeru cemo dobiti ispis f2(generic function with 2 methjods)
#ovo nam govori na koliko nacina mozemo da pozovemo funkciju
#= 
BITNO
OPCIONI PARAMETRI SE NAVODE NA KRAJU LISTE ULAZNIH PARAMETARA
=#
#imenovani parametri funkcije

function f3(x, y; a = 0, b = 0, c = 0, d = 0)
    println(x)
    println(y)
    println(a)
    println(b)
    println(c)
    println(d)
end

#kombinovanje opcionih i imenovanih parametara

#anonimne funkcije

#nacin 1.
function (x, y)
    x + y
end

#nacin 2.
(x,y) -> x + y  #nemoj

#mehanizam koriscenja 
function f4(g,x,y)
    g(x,y)
end

#8. rad sa vektorima i matricama

using LinearAlgebra
m1 = I(5)
#operator I generise jedinicnu matricu i nalazi se u LinearAlgebra
m2 = I + zeros(5,5)
m2 = Matrix{Bool}(I,5,5)

M = [1 5 9 13; 2 6 10 14; 3 7 11 15; 4 8 12 16]
triu(M)
#triu() se koristi za selekciju dela matrice koji se nalazi iznad glavne dijagonale
#parametri su mu matrica i broj k predstavlja koju dijagonalu hocemo (1 nas pomera gore za 1, a -2 nas pomera dole za 2)

tril(M)
tril(M,-2)
#triu() se koristi za selekciju dela matrice koji se nalazi ispod glavne dijagonale
#parametri su mu matrica i broj k predstavlja koju dijagonalu hocemo (1 nas pomera gore za 1, a -2 nas pomera dole za 2)

reverse(M)              #obrtanje matrice
reverse(M, dims = 1)    #obrcemo matricu po vrstama
reverse(M, dims = 2)    #obrcemo matricu po kolonama

using Statistics
mean(M) 
mean(M, dims = 1)
mean(M, dims = 2)
#mean()  vraca srednju vrednost i nalazi se u Statistics

#maximum()
maximum(M)
maximum(M, dims = 1)    
maximum(M, dims = 2)

#minimum()
minimum(M)
minimum(M, dims = 1)    
minimum(M, dims = 2)

#sum()
sum(M)
sum(M, dims = 1)
sum(M, dims = 2)

#prod()
prod(M)             #mnozi sve zivo
prod(M, dims = 1)   #mnozi po vrstama
prod(M, dims = 2)   #mnozi po kolonama

m = round.(rand(5,5)*30)   
#rand generise brojeve izmedju 0 i 1
