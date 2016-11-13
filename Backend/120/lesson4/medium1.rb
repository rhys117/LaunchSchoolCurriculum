=begin

Question 1

Ben asked Alyssa to code review the following code:

=end

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

=begin

Alyssa glanced over the code quickly and said - "It looks fine, except that you
forgot to put the @ before balance when you refer to the balance instance
variable in the body of the positive_balance? method."

"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an
@!"

Who is right, Ben or Alyssa, and why?
--
Ben is right because he has used attr_reader.

ls
Ben is right because of the fact that he added an attr_reader for the balance
instance variable. This means that Ruby will automatically create a method
called balance that returns the value of the @balance instance variable.
The body of the positive_balance? method will evaluate to calling the balance
method of the class, which will return the value of the @balance instance
variable. If Ben had omitted the attr_reader (or had used an attr_writer rather
than a reader or accessor) then Alyssa would be right.

=end

=begin

Question 2

Alyssa created the following code to keep track of items for a shopping cart
application she's writing:

=end

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

=begin
Alan looked at the code and spotted a mistake. "This will fail when
update_quantity is called", he says.

Can you spot the mistake and how to address it?
--
It needs to be @quantity on line 64 or chande :quantity to attr_accessor
and add a self (self.quantity)

=end

=begins

Question 3

In the last question Alyssa showed Alan this code which keeps track of items for
a shopping cart application:

=end

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

=begin

Alan noticed that this will fail when update_quantity is called. Since quantity
is an instance variable, it must be accessed with the @quantity notation when
setting it. One way to fix this is to change attr_reader to attr_accessor and
change quantity to self.quantity.

Is there anything wrong with fixing it this way?
--
It may be an issue as it could be changed at any time by without using the
update_quantity method.

ls
Nothing incorrect syntactically. However, you are altering the public
interfaces of the class. In other words, you are now allowing clients of the
class to change the quantity directly (calling the accessor with the
instance.quantity = <new value> notation) rather than by going through the
update_quantity method. It means that the protections built into the
update_quantity method can be circumvented and potentially pose problems down
the line.

=end

=begin

Question 4

Let's practice creating an object hierarchy.

Create a class called Greeting with a single method called greet that takes a
string argument and prints that argument to the terminal.

Now create two other classes that are derived from Greeting: one called Hello
and one called Goodbye. The Hello class should have a hi method that takes no
arguments and prints "Hello". The Goodbye class should have a bye method to
say "Goodbye". Make use of the Greeting class greet method when implementing
the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye
classes.

=end

class Greeting
  def greet(msg)
    puts msg
  end
end

class Hello < Greeting
  def hi
    greet('Hello')
  end
end

class Goodbye < Greeting
  def bye
    greet('Goodbye')
  end
end

=begin

Question 5

You are given the following class that has been implemented:

=end

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  #
  def to_s
    filling = @filling_type ? @filling_type : "Plain"
    glazing = @glazing ? " with #{@glazing}" : ''
    filling + glazing
  end
end

# And the following specification of expected behavior:

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
#  => "Plain"

puts donut2
#  => "Vanilla"

puts donut3
#  => "Plain with sugar"

puts donut4
#  => "Plain with chocolate sprinkles"

puts donut5
#  => "Custard with icing"

=begin

Write additional code for KrispyKreme such that the puts statements will work
as specified above.

=end

=begin

Question 6

If we have these two methods:

=end

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end
and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

=begin

What is the difference in the way the code works?
--
one is using the attr_accessor methods and one is not. There is no difference
in the result of the code however. The general rule of thumb is to avoid self
where possible therefore the first example would be widely considered better.

=end

=begin

Question 7

How could you change the method name below so that the method name is more
clear and less repetitive.
--
def self.information

=end

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information
    "I want to turn on the light with a brightness level of super high and a "\
    "colour of green"
  end

end






