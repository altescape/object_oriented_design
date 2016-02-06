# https://www.youtube.com/watch?v=9lv2lBq6x4A
#
# Sandi Metz Nothing is something
class Animal
  def initialize(name)
    @name = name
  end

  def self.find(id)
    if id == '' || id.nil?
      nil
    else
      new(id)
    end
  end

  def name
    "A #{@name}"
  end
end

class MissingAnimal
  attr_accessor :name
  def name
    "No animal specified"
  end
end

ids = ['pig', '', 'sheep', 'dog', nil, 'cat']

puts "here are the animals: #{ids}"

animals = ids.map {|id| Animal.find(id) || MissingAnimal.new}
puts animals
animals.each {|animal| puts animal.name}
