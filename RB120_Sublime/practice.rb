class Shelter
  def initialize
    @records = []
  end

  def adopt(adopter, adoptee)
    adopter.pets << adoptee
    @records << adopter unless @records.include?(adopter)
  end

  def print_adoptions
    @records.each do |adopter|
      puts "#{adopter.name} has adopted the following pets:"
      adopter.pets.each { |pet| puts pet }
    end
  end
end

class Pet
  attr_reader :breed, :name

  def initialize(breed, name)
    @breed = breed
    @name = name
  end

  def to_s
    "a #{breed} named #{name}"
  end
end

class Owner
  attr_reader :name
  attr_accessor :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    @pets.size
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_adoptions

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."