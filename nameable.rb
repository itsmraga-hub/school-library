class Nameable
  def initialize(name)
    @name = name
  end

  def correct_name
    raise NotImplementedError, ''
  end
end
