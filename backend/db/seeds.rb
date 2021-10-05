User.destroy_all
Category.destroy_all
Expense.destroy_all


User.create(username: "Justin", password: "pass", email: "jmp86@yahoo.com", monthly_income: 7000)
User.create(username: "Rachel", password: "jasper", email: "rachel@yahoo.com", monthly_income: 3200)
User.create(username: "Cassidy", password: "chase", email: "cass@gmail.com", monthly_income: 2400)
User.create(username: "Mekenna", password: "tyler", email: "mekenna@gmail.com", monthly_income: 2800)

rent = Category.create(name: "Rent", user_id: User.all.sample.id, category_budget: 1500)
util =Category.create(name: "Utilities", user_id: User.all.sample.id, category_budget: 500)
shop = Category.create(name: "Shopping", user_id: User.all.sample.id, category_budget: 300)
food = Category.create(name: "Food", user_id: User.all.sample.id, category_budget: 400)
car = Category.create(name: "Car", user_id: User.all.sample.id, category_budget: 250)

Expense.create(description: "Lunch", cost: 24.50, user_id: User.all.sample.id, category_id: food.id)
Expense.create(description: "Gas", cost: 53.39, user_id: User.all.sample.id, category_id: car.id)
Expense.create(description: "Dinner", cost: 44.87, user_id: User.all.sample.id, category_id: food.id)
Expense.create(description: "Clothes", cost: 241.11, user_id: User.all.sample.id, category_id: shop.id)
Expense.create(description: "Rent", cost: 1500.00, user_id: User.all.sample.id, category_id: rent.id)
Expense.create(description: "Phone Bill", cost: 180.63, user_id: User.all.sample.id, category_id: util.id)

puts "Seeded"