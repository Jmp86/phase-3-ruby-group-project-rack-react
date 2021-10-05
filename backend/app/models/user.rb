class User < ActiveRecord::Base
    has_many :expenses
    has_many :budgets
    has_many :categories, through: :expenses

    def update_income(income)
        self.update(monthly_income: income)
    end


    def create_budget(budget)
        Budget.create(budget: budget, user_id: self.id)
    end

    def create_expense(descriptiom, cost)
        Expense.create(description: descriptiom, cost: cost, user_id: self.id)
    end



    
end