require 'sinatra/base'

class App < Sinatra::Application
	enable :sessions
	set :session_secret, '' #enter secret here
    set :show_exceptions, false
    set :environment, :production
	before do
		@user = User.find(id: session[:id].to_i)
	end

    set(:auth) do 
        condition do
            unless is_user? 
                redirect "/login", 303
            end
        end
    end
    
    error Sinatra::NotFound do
      content_type 'text/plain'
      [404, 'Not Found']
    end
	get '/' do
		erb :index
	end
	
	get '/users' do
		@users = User.all
		erb :users
	end

=begin
	get '/new' do
		@page_title = 'New User'
		@user = User.new
		erb :new_user
	end
	post '/create' do
		@user = User.new
		@user.set_fields(params[:user], [:username])

		if @user.save
			redirect '/'
		else 
			redirect '/new'
		end
	end

	get '/edit/:id' do
		@page_title = 'Edit User'
		@user = User[params[:id].to_i]
		erb :edit_user
	end
	post '/update/:id' do
		@user = User[params[:id].to_i]
		@user.update_fields(params[:user], [:username])
		if @user.save
			redirect '/'
		else 
			redirect "/edit/#{@user.id}"
		end
	end
=end

end

require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'routes/init'
