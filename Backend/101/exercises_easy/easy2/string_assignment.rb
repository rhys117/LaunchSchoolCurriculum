name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# the output is BOB on both occasions as the variables are pointing
# towards the same container in memory. Ruby assigns by variables by
# reference.