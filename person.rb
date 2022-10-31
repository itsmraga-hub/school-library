class Person
  # Constructor with name, age, and parent_permission as parameter.
  def initialize(age, name="unknown", parent_permission=true)
    # Instance vars: @id, @name, and @age.
    @id
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  # @id, @name and @age getter methods
  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  # Setter methods for @name, and @parent_permission
  def name!(name)
    @name = name
  end

  def age!(age)
    @age = age
  end

  # Private method is_of_age?
  def is_of_age?
    if @age >= 18
      return true
    else
      return false
    end
  end

  # public method can_use_services?
  def can_use_services?
    if is_of_age? || @parent_permission
      return true
    end
    return false
  end

  # Make method is_of_age? private
  private :is_of_age?
end
