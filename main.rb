require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

get '/' do 
  @operator = params[:operator]
  if @operator
    @first = params[:first].to_f
    @second = params[:second].to_f
    @result = case @operator
    when '+' then @first + @second
    when '-' then @first - @second
    when '*' then @first * @second
    when '/' then @first / @second
    end    
  end
  erb :home
end
get '/power' do 
  @number = params[:number].to_f
  @power = params[:power].to_f
  @result = @number ** @power
  erb :power
end
get '/sqrt' do
  @sqrt = params[:sqrt].to_f
  @result = Math.sqrt(@sqrt).round(2)
  erb :sqrt
end
get '/bmi' do 
  @units = params[:units].to_i
  @weight = params[:weight].to_f
  multiplier = 1
  if @weight > 0.0
    @height = params[:height].to_f
    # -------------------
    if @units == 2
      w_suff = "lbs : " 
      h_suff = "inches : "
      multipier = 703
    else
      w_suff = "kgs : "
      h_suff = "metres : "
      multipier = 1
    end
    @result = (@weight/(@height*@height))*multiplier
    # -------------------
  end
  erb :bmi
end
get '/mortgage' do 
  erb :mortgage
end
get '/trip_calc' do 
  erb :trip_calc
end

