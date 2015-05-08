get '/' do
  # if current_user
  erb :"index"
end

get '/authenticate' do

  erb :'/users/authenticate'
end

post '/signin' do

  erb :'/surveys'
end

post '/signup' do

  erb :'/surveys'
end

get '/signout' do

end

post '/signout' do

  redirect '/'
end
