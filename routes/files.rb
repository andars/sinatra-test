class App < Sinatra::Application
  	get '/upload', :auth => false do 
  		@page_title = 'Upload File'
  		erb :upload
  	end
  	post '/upload' do
  		file_info = params['file'][:filename].split '.'
  		@file = AppFile.new(filename: params['file'][:filename], extension: file_info.last)
  		File.open('uploads/' + params['file'][:filename], 'w') do |fil|
  			fil.write(params['file'][:tempfile].read)
  		end
  		User[session[:id].to_i].add_file(@file)
  		redirect to("/files"), 301, "File Uploaded Successfully"
	end

	get '/files' do
		@files = AppFile.all
		erb :files
	end

	get '/view/:id' do
		@file = AppFile[params[:id].to_i]
		erb :layout do
			erb :file do
				if ['jpeg','jpg','gif','png'].member? @file.extension
					image_url = to "/file/#{@file.filename}"
			 		"<img src='#{image_url}'>"
				else
					redirect to "/file/#{@file.filename}"
				end
			end
		end
	end

	get '/file/:name' do
		send_file File.join('./uploads', params[:name])
	end
end
