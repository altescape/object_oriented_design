# https://www.youtube.com/watch?v=9lv2lBq6x4A
#
# Sandi Metz Nothing is something
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.find(id)
    if id == ''
      nil
    else
      new(id)
    end
  end
end

class MissingAnimal
  attr_accessor :name
  def name
    "No animal"
  end
end

ids = ['pig', '', 'sheep']

animals = ids.map {|id| Animal.find(id) || MissingAnimal.new}
puts animals
animals.each {|animal| puts animal.name}
