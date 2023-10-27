global treba = 0
try
    import Plots
    println("Plots je instaliran.")
catch
    println("Instaliranje je u toku.")
    global treba = 1;
end
x = convert(Bool,treba)
if (x)
    using Pkg
    Pkg.add("Plots")
end
if(x)
    try
        import Plots
        println("Plots je uspesno instaliran.")
    catch
        println("Plots nije uspesno instaliran.")
    end
end
using Plots
println("Testiranje: ")
t = 0:1:10
y = rand(11)
plot(t,y, title = "Test",color=:purple ,lw = 3, label = "random", ylabel = "y-osa", xlabel = "x-osa")
yticks!(0:0.2:1)

