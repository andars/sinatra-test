class App < Sinatra::Application
	get '/login' do
		erb :login
	end

	post '/login' do
		username = params[:user][:username]
		password = params[:user][:password]
		@user = User.find(username: username)
		if !@user.nil? and @user.password == password
			puts "successful login by #{@user.username}"
			session[:id] = @user.id
			redirect to '/files'
		else
			puts "unsuccessful login by #{@user.username}"
			redirect to '/login'
		end
	end
	get '/session' do
		@user = User.find(id: session[:id].to_i)
		@user.username
	end

	get '/register' do
		erb :register
	end

	post '/register' do
		username = params[:user][:username]
		email = params[:user][:email]
		@user = User.new(username: username.to_s, email: email.to_s)
		@user.password = params[:user][:password].to_s
		p @user
		@user.save
		redirect to '/login'
	end
	
	get '/sweg' do
		'ok ok ok'
	end
end
