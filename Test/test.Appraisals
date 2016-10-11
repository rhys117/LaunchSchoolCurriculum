Local Variables
#1 
The program outputs 2 with a line break when the puts method is invoked. The variable str is initialized on line 1 pointing at a new object of the integer of 1. On line three a loop is opened and the block reassigns the str variable to the integer 2 on line 4. On line 5 the program breaks from loops block. Line 8 invokes the  puts method which prints the objects value assigned to str with a line break. In this case..
```ruby
2
```

#2
The variable in the loop has not been initialized outside of the loop. This means
that the variable is only availble inside the loop block. When trying to run the puts
method on the variable str on line 6 it raises the error of an undefined local variable
or method because str does not point to an object outside of the loop.

#3 
We cannot say whether this code will run or not. If the variable is initialzed outside
of the loop the code will run and the variable str will be reassigned inside the loops block on line 4. However if the variable str has not been assigned outside of the loop it will raise the error of an undefined local variable or method as it will not point to an object or method.

#4
The code raises an undefined local variable or method error. This is due to the code
on line 4. When it tries to access to variable str it has not been passed into the 
the method. The scope of the method cannot see the variable str assigned on line 1. Meaning when trying to invoke the puts method on the variable in a_method str has not been assigned to an object and will produce an error when trying to run.

You would have to pass in the str variable to the method for this code
to print 'hello' as most likely intended.
e.g
```ruby
def a_method(string)
  puts str
end

a_method(str)
```


#5
The program here will output 'hello' because the puts method is invoked on str on line 8. The str variable is assigned to an object on line 1. It will not print out world because the variable inside a_method is a different variable pointing at a different object. That is the variable str in the method is not the same variable as str
outside of the a_method. They are two different objects, and two different variables. This code does not raise an error like the previous code because there is no undefined variable or method when running the code inside the a_method block. The scope of a_method cannot see the variable assigned on line 1.

#6
Before line 2 both variables a and b pointed towards the same object. the variable b still points at the object 'hello' because variable a was reassigned on line 3 which means it now points at a different object than the variable b. The mutation to the object assigned to the variable a happened afterwards. The object that b is assigned to remains unchanged. The two puts methods invoked print the objects value assigned to the respected variable with a line break. The output of this code being...
hi world
hello

#7
There are four variables and two objects. This is because the variables a, b and c
point towards the string object 'hello' and variable d points towards the string object 'world'. d is assigned to the object 'world' on line 5. This is before the variable b is reassigned to the same object as variable a on line 6. Variable c points to the same object as variable a and b points to the same object as variable a after line 6.


Mutating Method Arguements
#1
This is because the method change returns a new object and does not mutate the caller object. It is not a destructive method. The method in this case would return the string 'hello world'. When the puts method is invoked on line 8 it prints the value assigned to the object of the variable greeting with a line break which is still the string hello. 

#2
This code is different because the method change does mutate the caller. This code is
considered distructive because it changes the variable outside of the method. The method change returns 'hello world' and mutates the object assigned to greeting. On line 8 the puts method is invoked and prints the value assigned to the greeting object, in this case the output 'hello world'.

#3
The method reassigns the variable param to a new object on line 2. This means
it no longer points to the same object that param was assigned to on line 1 and no longer the same object as the variable greeting. The mutation inside the method change occurs to the new object meaning that the first object is not changed and the output of the program is still hello when the puts method is invoked on the string object assigned to the greeting variable.

#4
The method change once again reassigns the variable param to a new object on line 2. This means that it is pointing to a new object and not the same object as the variable greeting. The method then mutates the new object before param is reassigned to a new object on line 4. The object assigned to param is then mutated on line 5. The return value of the change method is a string 'hi world' but the value of greeting is still the string hello. The output of the program is hello because of the puts method invoked which prints the string object assigned to the variable greeting with a line break.


Working with collections
#1 
The method map returns a new array with values returned from the block given to it.
The method runs the block on each element in the array before assigning the return value to the new array. 

#2
The select method returns a new array with the values which the block given to the select method return as true. The select method runs the block on each element of the array.

#3 
They both return the same array of elements. This is because .map takes each element of
the array given to it and runs the block on each element. In the first example the 
return of the variable n + 1 is mapped to each element of the new array. In the second 
example the return of n += 1 is mapped to each element. The diffence is while they both return the same values the += operator is like writting 
```ruby
n = n + 1 
```
this also returns the new value of n. This unlike the first example which only returns the value of n + 1 and would not reassign the variable n to a new object. 

#4
The variable arr is all booleans because booleans are the return value of the block
given to the map method. map assigns the return of the block to each element of the new array. In this cause if the element passed into the map method is greater than 2 the element in the new array will be assigned to true. If element is not > 2 than the element in the new array will be assigned to false. For example in this case arr will be assigned to...
```ruby
arr = [false, false, true]
```
The output will be [false, false, true] when the p method is invoked on line 5 and prints arr.inspect

#5
In this case arr will be an array of nil values. e.g..
```ruby
arr = [nil, nil, nil]
```
This is because the return value of the block is nil. The puts method on line 3 will always returns nil. While running the code the puts method with print 1, 2 and 3 on the screen with a line break while mapping nil the new array. The method p on line 6 will print arr.inspect which is [nil, nil, nil]. 

#6
The select method will return a new array if the value from the block returns true for
the matching element in the array.

Because all expressions in ruby evaluate to true unless they are false or nil 
```ruby
n + 2
```
evaluates to true. This means the variable arr will point to the new object of 
[1, 2, 3]. The p method on line 5 prints arr.inspect meaning the output will be 
```ruby
[1, 2, 3]
```

#7
The variable arr now points to an empty array object. This is because select in this case has returned an object of an empty array. The block of the select method in this example will always point to nil due to the fact the puts method on line 3 always returns nil and is the last line of the block. Because the select method block always returns nil while iterating over the array [1, 2, 3] the new array object it returns and assigns to the variable arr will be empty. The p method will print arr.inspect the output in this case being 
```ruby
[]
```

