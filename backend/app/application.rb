class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
    
    elsif req.path.match(/users/) 
      if req.env["REQUEST_METHOD"] === 'GET'
        if(req.path.split("/users/").length <= 1)
          return [200, { 'Content-Type' => 'application/json' }, [ User.all.to_json({:include => [:budgets, :expenses, :categories]}) ]]
        else 
          user_id = req.path.split("/users/").last
          user = User.find_by(id: user_id)
          return [200, { 'Content-Type' => 'application/json' }, [ user.to_json({:include => [:budgets, :expenses, :categories]}) ]]
        end
      elsif req.env["REQUEST_METHOD"] === 'POST'
        input = JSON.parse(req.body.read)
        user = User.create(username: input["newUser"]["username"], password: input["newUser"]["password"])
        # if input["dog"]
        #   owner.dogs.create(input["dog"])
        # end 
        return [200, { 'Content-Type' => 'application/json' }, [ user.to_json ]]
      end 
    elsif req.path.match(/expenses/) 
      return [200, { 'Content-Type' => 'application/json' }, [ Expense.all.to_json]]
    elsif req.path.match(/categories/) 
      return [200, { 'Content-Type' => 'application/json' }, [ Category.all.to_json]]
    elsif req.path.match(/budgets/) 
      return [200, { 'Content-Type' => 'application/json' }, [ Budget.all.to_json]]
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
