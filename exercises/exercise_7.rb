require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"
=begin
Exercise 7: Validations for both models
Add validations to two models to enforce the following business rules:
Employees must always have a first name present
Employees must always have a last name present
Employees have a hourly_rate that is a number (integer) between 40 and 200
Employees must always have a store that they belong to (can't have an employee that is not assigned a store)
Stores must always have a name that is a minimum of 3 characters
Stores have an annual_revenue that is a number (integer) that must be 0 or more
BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation method - don't use a Validator class)
Ask the user for a store name (store it in a variable)
Attempt to create a store with the inputted name but leave out the other fields (annual_revenue, mens_apparel, and womens_apparel)
Display the error messages provided back from ActiveRecord to the user (one on each line) after you attempt to save/create the record
=end


# Your code goes here ...
class Employee < ActiveRecord::Base
  belongs_to :store

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store, presence: true
end

class Store < ActiveRecord::Base
  has_many :employees

  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validate :must_carry_apparel

  def must_carry_apparel
    unless mens_apparel || womens_apparel
      errors.add(:base, "The store must carry at least one of men's or women's apparel")
    end
  end
end

# Ask the user for a store name
print "Enter the store name: "
store_name = gets.chomp

# Attempt to create a store with the inputted name but leave out other fields
store = Store.new(name: store_name)

# Save the record and display error messages if any
if store.save
  puts "Store created successfully!"
else
  puts "Error creating store:"
  store.errors.full_messages.each do |message|
    puts "- #{message}"
  end
end