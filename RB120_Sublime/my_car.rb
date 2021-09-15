class Vehicle 
	@@total_vehicles = 0 

	attr_accessor :color 
	attr_reader :year, :model

	def initialize(y, c, m)
		@year = y
		@color = c
		@model = m
		@current_speed = 0
		@@total_vehicles += 1 
	end

	def self.view_total_vehicles
		"This program has created #{@@total_vehicles} total_vehicles."
	end

	def self.mileage(gallons, miles)
		"Mileage is #{miles / gallons}."
	end

	# speedometer
	def speed_up(num)
		@current_speed += num 
		"You accelerated #{num} mph."
	end 

	def brake(num)
		@current_speed -= num 
		"You decelerated #{num} mph."
	end 

	def current_speed
		"You are going #{@current_speed} mph."
	end 

	def shut_down
		@current_speed = 0
		"The car is off."
	end 

	# new paint job 
	def spray_paint(new_color)
		self.color = new_color 
	end

	def to_s
		"My vehicle is a #{self.color} #{self.year} #{self.model}."
	end

	def age 
		"Your vehicle is #{years_old} years old!"
	end 

	private 

	def years_old 
		Time.now.year - self.year
	end 
end 

module Towable 
	def can_tow?(pounds)
		pounds < 2000 ? true : false 
	end
end

class MyCar < Vehicle
	NUMBER_OF_DOORS = 4
end 

class MyTruck < Vehicle
	include Towable 

	NUMBER_OF_DOORS = 2
end 

honda = MyCar.new(2006, 'gray', 'Accord')
chevy = MyTruck.new(2015, 'red', 'Ranger')

puts honda
puts chevy
puts honda.age
