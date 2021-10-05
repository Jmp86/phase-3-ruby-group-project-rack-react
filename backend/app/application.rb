class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
    
    elsif req.path.match(/users/) 
      if req.env["REQUEST_METHOD"] === 'GET'
        if(req.path.split("/users/").length <= 1)
          return [200, { 'Content-Type' => 'application/json' }, [ User.all.to_json({:include => [:expenses, :categories]}) ]]
        else 
          user_id = req.path.split("/users/").last
          user = User.find_by(id: user_id)
          return [200, { 'Content-Type' => 'application/json' }, [ user.to_json({:include => [:expenses, :categories]}) ]]
        end
      elsif req.env["REQUEST_METHOD"] === 'POST'
        input = JSON.parse(req.body.read)
        user = User.create(username: input["newUser"]["username"], password: input["newUser"]["password"])
        return [200, { 'Content-Type' => 'application/json' }, [ user.to_json ]]
      elsif req.env["REQUEST_METHOD"] === 'PATCH'
        input = JSON.parse(req.body.read)
        user = User.find(input["id"])
        income = user.update(monthly_income: input["monthly_income"])
        return [200, { 'Content-Type' => 'application/json' }, [ income.to_json ]]        
      end 
    elsif req.path.match(/expenses/) 
      if req.env["REQUEST_METHOD"] === 'GET'
        return [200, { 'Content-Type' => 'application/json' }, [ Expense.all.to_json]]
      elsif req.env["REQUEST_METHOD"] === 'POST'
        input = JSON.parse(req.body.read)
        expense = Expense.create(description: input["newExpense"]["description"], cost: input["newExpense"]["cost"], user_id: input["newExpense"]["user_id"], category_id: input["newExpense"]["category_id"])
        return [200, { 'Content-Type' => 'application/json' }, [ expense.to_json ]]
      elsif req.env["REQUEST_METHOD"] === 'DELETE'
        input = JSON.parse(req.body.read)
        expense = Expense.destroy(input["id"])
        # binding.pry
        return [200, { 'Content-Type' => 'application/json' }, [ expense.to_json ]]
      end
    elsif req.path.match(/categories/) 
      if req.env["REQUEST_METHOD"] === 'GET'
        return [200, { 'Content-Type' => 'application/json' }, [ Category.all.to_json({:include => :expenses})]]
      elsif req.env["REQUEST_METHOD"] === 'POST'
        input = JSON.parse(req.body.read)
        category = Category.create(name: input["newBudget"]["name"], category_budget: input["newBudget"]["category_budget"], user_id: input["newBudget"]["user_id"])
        return [200, { 'Content-Type' => 'application/json' }, [ category.to_json ]]
      elsif req.env["REQUEST_METHOD"] === 'DELETE'
        input = JSON.parse(req.body.read)
        category = Category.destroy(input["id"])
        return [200, { 'Content-Type' => 'application/json' }, [ category.to_json ]]
      end
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
