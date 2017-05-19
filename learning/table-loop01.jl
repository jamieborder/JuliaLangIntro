M = [1.1 1.2 1.3 1.4;
     2.1 2.2 2.3 2.4;
     3.1 3.2 3.3 3.4]

sz = size(M)
for i=1:sz[1]
    if i > 1
        println()
    end
    for j=1:sz[2]
        if j > 1
            print(" ")
        end
        print(M[i,j])
    end
end
