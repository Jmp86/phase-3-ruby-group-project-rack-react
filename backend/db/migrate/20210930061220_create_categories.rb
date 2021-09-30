class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :budget_amount
      t.integer :actual_amount
      t.timestamp
    end
  end
end
