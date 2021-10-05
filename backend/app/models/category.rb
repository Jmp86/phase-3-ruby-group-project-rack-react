class Category < ActiveRecord::Base
    belongs_to :budget
    has_many :expenses
    has_many :users, through: :expenses


    def update_category_expense
        total_cost = self.expenses.all.map do |total|
               total.cost
           end
           t_exp = total_cost.sum
           self.update(category_expense: t_exp)
       end

end