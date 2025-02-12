require_relative 'config/environment'

class App < Sinatra::Base
  
  get '/reversename/:name' do
  	@name = params[:name]
  	@name.reverse
  end


  get '/square/:number' do
  	@number = params[:number].to_i
  	"#{@number ** 2}"
  end

  get "/say/:number/:phrase" do
  	@number = params[:number].to_i
  	@phrase = params[:phrase] + "<br>"
  	@phrase * @number
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
  	@word1 = params[:word1]
  	@word2 = params[:word2]
  	@word3 = params[:word3]
  	@word4 = params[:word4]
  	@word5 = params[:word5]
  	@word1 + " " + @word2 + " " + @word3 + " " + @word4 + " " + @word5 + "."
  end

  get "/:operation/:number1/:number2" do
  	@op = params[:operation]
  	@num1 = params[:number1].to_i
  	@num2 = params[:number2].to_i

  	if @op == "add"
  		@op = :+
  	elsif @op == "subtract"
  		@op = :-
  	elsif @op == "multiply"
  		@op = :*
  	elsif @op == "divide"
  		@op = :/
  	end

  	@result = @num1.send(@op, @num2)
  	"#{@result}"
  end

end