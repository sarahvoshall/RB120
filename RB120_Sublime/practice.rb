class GoodDog
  def initialize(name)
    @name = name
  end

  def speak 
    "#{@name} says Arf!"
  end

  def get_name
    @name 
  end

  def set_name=(name)
    @name = name 
  end
end

fido = GoodDog.new('Fido')
puts fido.get_name
puts fido.speak
fido.set_name = 'Spartacus'
puts fido.get_name