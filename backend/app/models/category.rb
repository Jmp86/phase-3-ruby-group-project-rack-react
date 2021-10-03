class Category < ActiveRecord::Base
    belongs_to :budget
    has_many :expenses
    has_many :users, through: :expenses
end