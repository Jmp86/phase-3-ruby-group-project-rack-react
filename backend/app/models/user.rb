class User < ActiveRecord::Base
    has_many :expenses
    has_many :budgets
    has_many :categories, through: :expenses
end