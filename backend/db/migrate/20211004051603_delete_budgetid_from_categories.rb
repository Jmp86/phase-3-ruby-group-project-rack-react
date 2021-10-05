class DeleteBudgetidFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :budget_id
  end
end
