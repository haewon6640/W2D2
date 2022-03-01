require 'employee'

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    salaries.has_key?(title)
  end

  def >(other)
    funding > other.funding
  end

  def hire(employee_name, title)
    if valid_title?(title)
      @employees << Employee.new(employee_name, title)
    else
      raise 'Not a valid title'
    end
  end

  def size
    @employees.length
  end

  def pay_employee(emp)
    pay = @salaries[emp.title]
    if pay < @funding
      emp.pay(pay)
      @funding -= pay
    else
      raise 'No money'
    end
  end

  def payday
    @employees.each { |emp| pay_employee(emp) }
  end

  def average_salary
    sum = @employees.inject(0) do |total, emp|
      total + @salaries[emp.title]
    end
    sum * 1.0 / @employees.length
  end
  
  def close
    @employees = Array.new(0)
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding
    startup.salaries.each {|title,sal| @salaries[title] = sal if !@salaries.has_key?(title)}
    @employees += startup.employees
    startup.close
  end
end
