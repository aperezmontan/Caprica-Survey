get '/' do
  # if current_user
  erb :"index"
end

get '/authenticate' do
  layout = !request.xhr?
  erb :'/users/authenticate', layout: layout
end

post '/signin' do
  current_user = User.where(["name = ? or email = ?", params[:name], params[:name]]).first
  if current_user && current_user.authenticate( params[:password] )
    user_id = current_user.id
    session[:user_id] = user_id
    return "true" if request.xhr?
    redirect "/user/#{user_id}"
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