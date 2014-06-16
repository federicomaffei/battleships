require 'sinatra'
require_relative 'player'	

enable :sessions
set :session_secret, 'super secret'
set :views, settings.root + '/../views'

player = Player.new


get '/' do
	session[:user_count] ||= 0
	erb :index
end

get '/entered_player' do
	erb :new_user
end

get '/entered_ship' do
	
	erb :grid
end


get '/clear' do
	session[:user_count] = 0
	redirect '/'
end

get '/back' do
	redirect '/'
end

get '/play' do
	erb :place
end

post '/enter' do
	if session[:user_count] < 2
		session[:user_count] += 1
		session[:player_name] = params[:name].capitalize
		redirect '/entered_player'
	else 
		@session_full = "Sorry, there are already #{session[:user_count]} users playing."
		erb :session_full
	end
end

post '/enter_name' do
	ship_type = params[:ship_name]
	coordinate = params[:coordinate]
	player.place_on_grid(ship_type, coordinate)
	session[:home_grid] = player.home_grid.positions
	redirect '/entered_ship'
end
