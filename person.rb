class Person
  attr_reader :id, :name, :age
  attr_accessor :name, :age

  def initialize(name = 'Unknown', age, parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return true if of_age? || @parent_permission
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
