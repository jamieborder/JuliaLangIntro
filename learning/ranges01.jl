# the range from 1 to 10 is
one_to_ten = 1:10
println(one_to_ten)

# the array with numbers from 1 to 10 is
the_array = collect(one_to_ten)
println(the_array)

# to specify an increment size, add an additional
# argument
# the range from 1 to 10 with a step size of 0.1 is
one_to_ten_many = 1:0.1:10
println(collect(one_to_ten_many))
