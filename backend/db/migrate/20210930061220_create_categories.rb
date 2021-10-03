class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.float :category_expense
      t.integer :budget_id
    end
  end
end
