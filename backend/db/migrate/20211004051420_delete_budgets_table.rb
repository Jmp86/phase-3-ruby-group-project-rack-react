class DeleteBudgetsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :budgets
  end
end
