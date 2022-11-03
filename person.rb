require_relative 'nameable'
require_relative 'base_decorator'

class Person < Nameable
  # Constructor with name, age, and parent_permission as parameter.
  def initialize(age, name = 'unknown', parent_permission: true)
    # Instance vars: @id, @name, and @age.
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book)
    @rentals.push(book)
    book.person = self
  end

  def correct_name
    @name
  end

  # @id, @name and @age getter methods
  attr_reader :id, :rentals

  attr_accessor :name, :age

  # Private method is_of_age?
  def of_age?
    @age >= 18
  end

  # public method can_use_services?
  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  # Make method is_of_age? private
  private :of_age?
end
