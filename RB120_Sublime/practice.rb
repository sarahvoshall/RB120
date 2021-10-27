# module Towable
#   def can_tow?(pounds)
#     pounds < 2000 ? true : false
#   end
# end

# class Vehicle
#   @@total_vehicles = 0 

#   attr_accessor :color, :current_speed
#   attr_reader :year, :model

#   def initialize(year, color, model)
#     @year = year
#     @color = color 
#     @model = model
#     @current_speed = 0 
#     @@total_vehicles += 1
#   end 

#   def spray_paint(new_color)
#     self.color = new_color
#   end 

#   def self.calculate_gas_mileage(gallons, miles)
#     "This car's mpg is #{miles/gallons}."
#   end

#   def self.display_total_vehicles
#     "You have #{@@total_vehicles} total_vehicles."
#   end

#   def age
#     "This vehicle is #{calculate_age} years old."
#   end

#   private 

#   def calculate_age
#     Time.now.year - self.year
#   end
# end

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4

#    def to_s
#     "My car is a #{self.year} #{self.color} #{self.model}."
#   end
# end

# class MyTruck < Vehicle
#   include Towable

#   NUMBER_OF_DOORS = 2

#   def to_s
#     "My truck is a #{self.year} #{self.color} #{self.model}."
#   end
# end

# civic = MyCar.new(2005, 'black', 'civic')
# silverado = MyTruck.new(2011, 'silver', 'silverado')
# puts civic.age
# puts silverado.age

class Student
  def initialize(name, grade)
    @name = name 
    @grade = grade 
  end

  def better_grade_than?(other)
    self.grade > other.grade ? true : false
  end

  protected 

  attr_reader :grade
end

joe = Student.new('Joe', 97)
bob = Student.new('Bob', 84)

puts "Well done!" if joe.better_grade_than?(bob)

