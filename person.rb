require_relative 'nameable'
require_relative 'base_decorator'

class Person < Nameable
  # Constructor with name, age, and parent_permission as parameter.
  # rubocop:disable Lint/MissingSuper
  def initialize(age, name = 'unknown', parent_permission: true)
    # Instance vars: @id, @name, and @age.
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end
  # rubocop:enable Lint/MissingSuper

  def correct_name
    @name
  end

  # @id, @name and @age getter methods
  attr_reader :id

  attr_reader :name, :age

  # Setter methods for @name, and @parent_permission
  def name!(name)
    @name = name
  end

  def age!(age)
    @age = age
  end

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

# person = Person.new(22, 'maximilianus')
# puts person.correct_name

# capitalizedPerson = CapitalizeDecorator.new(person)
# puts capitalizedPerson.correct_name

# capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
# puts capitalizedTrimmedPerson.correct_name
