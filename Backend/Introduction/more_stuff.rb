#Exercise 1
def lab_in(text)
  if /lab/ =~ text
    puts text
  else
    puts "Not found"
  end
end

lab_in("laboratory")
lab_in("experiment")
lab_in("Pans Labyrinth")
lab_in("elaborate")
lab_in("polar bear")

#Exercise 2
#nothing

#Exercise 3
#Error management so the entire program does not stop.

#Exercise 4
def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

#Exercise 5
#missing the & in the &block in the mehtod variable.