require_relative './nameable'
require_relative './base_decorator'
require './rental'

class Person < Nameable
  attr_reader :id, :rentals, :parent_permission
  attr_accessor :name, :age

  # rubocop:disable Lint/MissingSuper
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end
  # rubocop:enable Lint/MissingSuper

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def correct_name
    @name
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

  def to_hash
    hash = {}
    instance_variables.each { |var| hash[var.to_s.delete('@')] = instance_variable_get(var) }
    hash
  end

  # Make method is_of_age? private
  private :of_age?
end
