# CIVL2530 Assignment 1 Question 10
# Author: Dorival Pedroso
# Date: 16/03/2017

E = [5039 5127 5238 5259 5248 5310;
     5150 5392 5410 5401 5320 5820;
     5290 5560 5490 5421 5530 5831;
     5110 5429 5430 5411 5459 5630;
     4920 5129 4921 5821 4722 4921;
     5023 5129 4822 4872 4794 4862]

M, N = size(E)
F = zeros(M, N)

# ignoring edges and corners
for i=2:M-1
    for j=2:N-1
        if E[i,j] > E[i-1,j] &&
           E[i,j] > E[i+1,j] &&
           E[i,j] > E[i,j-1] &&
           E[i,j] > E[i,j+1]
            F[i,j] = 1
        end
    end
end

println("F = ", F)

using PyPlot
imshow(F)
savefig("a1_10.png")
