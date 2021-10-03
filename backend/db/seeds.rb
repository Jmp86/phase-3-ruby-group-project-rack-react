User.destroy_all
Category.destroy_all
Expense.destroy_all
Budget.destroy_all

User.create(username: "Justin", password: "pass", email: "jmp86@yahoo.com", monthly_income: 7000)
User.create(username: "Rachel", password: "jasper", email: "rachel@yahoo.com", monthly_income: 3200)
User.create(username: "Cassidy", password: "chase", email: "cass@gmail.com", monthly_income: 2400)
User.create(username: "Mekenna", password: "tyler", email: "mekenna@gmail.com", monthly_income: 2800)

Budget.create(budget: 500, user_id: User.all.sample.id)
Budget.create(budget: 700, user_id: User.all.sample.id)
Budget.create(budget: 300, user_id: User.all.sample.id)
Budget.create(budget: 200, user_id: User.all.sample.id)
Budget.create(budget: 400, user_id: User.all.sample.id)

rent = Category.create(name: "Rent", budget_id: Budget.all.sample.id)
util =Category.create(name: "Utilities", budget_id: Budget.all.sample.id)
shop = Category.create(name: "Shopping", budget_id: Budget.all.sample.id)
food = Category.create(name: "Food", budget_id: Budget.all.sample.id)
car = Category.create(name: "Car", budget_id: Budget.all.sample.id)

Expense.create(description: "Lunch", cost: 24.50, user_id: User.all.sample.id , category_id: food.id)
Expense.create(description: "Gas", cost: 53.39, user_id: User.all.sample.id , category_id: car.id)
Expense.create(description: "Dinner", cost: 44.87, user_id: User.all.sample.id , category_id: food.id)
Expense.create(description: "Clothes", cost: 241.11, user_id: User.all.sample.id , category_id: shop.id)
Expense.create(description: "Rent", cost: 1500.00, user_id: User.all.sample.id , category_id: rent.id)
Expense.create(description: "Phone Bill", cost: 180.63, user_id: User.all.sample.id , category_id: util.id)

puts "Seeded"