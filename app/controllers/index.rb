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
  puts "INSIDE POST"
  p params
  puts "user:"
  p @user = User.new(name: params[:fullname], email: params[:email], password: params[:pass] )
  p @user.errors.full_messages

  if @user.save
    puts "TRUE"
    session[:id] = @user.id
    redirect to "/users_home/#{@user.id}"
  else
    puts "ERROR"
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

get '/users/:id/update' do 
  @user = User.find(params[:id])
  erb :update

end

post '/users/:id/update' do

  @user = User.find(session[:id])
  new_name = params[:fullname]
  new_email = params[:email]
  new_pass = params[:pass]
  
  if new_pass.empty?
    @user.update(name: new_name, email: new_email)
  else
    @user.update(name: new_name, email: new_email, password: new_pass)
  end

  redirect to "/users_home/#{@user.id}"

end


get "/delete/:id" do 
  @user = User.find(session[:id])
  @user.destroy
  redirect to '/users'
end

get '/log_out' do 
  session.clear
  redirect to '/users'  
end