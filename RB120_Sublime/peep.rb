class Cat
  def initialize(name, age)
    @name = name
    @age = age
  end

  def say_name
    puts "My name is #{@name}."
  end
end

fluffy = Cat.new('Fluffy', 3)
puffy = Cat.new('Puffy', 2)

fluffy.say_name
puffy.say_name