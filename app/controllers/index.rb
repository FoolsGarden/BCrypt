get '/users' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb

  @users = User.all  

  erb :index

end

get '/users/sign_in' do

  erb :sign_in

end

post '/users/sign_in' do

  @user = User.new(name: params[:fullname], email: params[:email], password: params[:pass] )

  if @user.save
    session[:id] = @user.id
    redirect to "/users_home/#{@user.id}"
  else
    "ERROR"
    erb :sign_in 
  end

end
 
get '/users/log_in' do
  erb :log_in
end

post '/users/log_in' do
  @email = params[:email]
  @password = params[:pass]
  
  if User.authenticate(@email, @password)
    
    @user = User.find_by(email: @email)
    session[:id] = @user.id
    redirect to "/users_home/#{@user.id}"

  else
    redirect to '/users/log_in'
  end

end


before '/users_home/:id'  do
  if session[:id] == nil
    redirect to '/users/log_in'
  end
end

get '/users_home/:id' do
  @user = User.find(session[:id])
  erb :profile
end

post '/users/:id/update' do

  @user = User.find(session[:id])
  new_name = params[:fullname]
  new_email = params[:email]
  new_pass = params[:pass]
  
  unless new_pass.blank? 
    @update_name = User.find(session[:id]).update(name: new_name)
  end

  unless new_email.blank?
    @update_email = User.find(session[:id]).update(email: new_email)
  end
  
  unless new_pass.blank?  
    @update_pass = User.find(session[:id]).update(password: new_pass)
  end
  
  erb :profile
  

end


get '/log_out' do 
  session.clear
  redirect to '/users'  
end