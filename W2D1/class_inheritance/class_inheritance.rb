class Employee
  
  attr_reader :name, :title, :salary, :boss
  
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def bonus(multiplier)
    bonus = @salary * multiplier
  end
  
end

class Manager < Employee
  
  attr_reader :employees
  
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end
  
  def bonus(multiplier)
    bonus = employees.map {|employee| employee.salary }.inject(:+) * multiplier
  end
  
end