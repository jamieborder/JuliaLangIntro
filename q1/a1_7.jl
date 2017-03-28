# CIVL2530 Assignment 1 Question 7
# Author: Dorival Pedroso
# Date: 16/03/2017

srand(2530)

N = 1000

Ninside = 0
for i=1:N
    x = -1.0 + 2.0 * rand()
    y = -1.0 + 2.0 * rand()
    z = -1.0 + 2.0 * rand()
    d = x*x + y*y + z*z
    if d <= 1
        Ninside += 1
    end
end

Vmc = 8.0 * Ninside / N
Vana = 4.0 * pi / 3.0
error = abs(Vmc - Vana)
println("Vmc   = ", Vmc)
println("Vana  = ", Vana)
println("error = ", error)
