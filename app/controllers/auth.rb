get '/' do
  # if current_user
  erb :"index"
end

get '/authenticate' do

  erb :'/users/authenticate'
end

post '/signin' do
  current_user = User.find_by(name: params[:name])
  if current_user && current_user.authenticate( params[:password] )
    session[:user_id] = current_user.id
    redirect '/surveys'
  else
    redirect '/authenticate?error=ua&signup=false'
  end
end

post '/signup' do
  new_user = User.new(params[:user])
  if new_user.save
    session[:user_id] = new_user.id
    redirect '/surveys'
  else
    redirect '/authenticate?error=ua&signup=true'
  end
end

get '/signout' do
  session[:user_id] = nil
  redirect '/'
end