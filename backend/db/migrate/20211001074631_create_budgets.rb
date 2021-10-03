class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.integer :budget
      t.float :total_expense
      t.integer :user_id
    end
  end
end
