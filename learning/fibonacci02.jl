a = 0              # this is a variable declaration (3 things happen here)
b = 1              # this is another variable declaration
for i = 1:9        # this begins a “loop” from 1 to 9
    t = a          # another variable declaration
    a = b          # idem
    b = t + b      # assigning t plus b to b (NOTE: this is not math)
    println(b)     # print the contents of b with a new line (line-new: ln)
end                # end of loop
