class AddBudgetToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :category_budget, :float
    add_column :categories, :total_budget, :integer
  end
end
