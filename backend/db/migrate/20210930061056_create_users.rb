class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.integer :monthly_income
      t.integer :monthly_savings
      t.integer :ms_goal
      t.timestamp
    end
  end
end
