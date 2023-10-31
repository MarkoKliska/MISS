global treba = 0
try
    import DifferentialEquations
    println("DifferentialEquations je instaliran.")
catch
    println("Instaliranje DifferentialEquations paketa je u toku.")
    global treba = 1;
end
x = convert(Bool,treba)
if (x)
    using Pkg
    Pkg.add("DifferentialEquations")
end
if(x)
    try
        import DifferentialEquations
        println("DifferentialEquations je uspesno instaliran.")
    catch
        println("DifferentialEquations nije uspesno instaliran.")
    end
end


