require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  has_many :employees
end


class Employee < ActiveRecord::Base
  belongs_to :store
end


@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "John", last_name: "Duh", hourly_rate: 50)
@store1.employees.create(first_name: "Jane", last_name: "Ehh", hourly_rate: 55)

@store2.employees.create(first_name: "Jade", last_name: "Woosh", hourly_rate: 65)
@store2.employees.create(first_name: "Julia", last_name: "Weee", hourly_rate: 70)