get '/show_poll/:poll_id' do 
  @poll = Poll.find(params[:poll_id])
  @questions = Question.find_by(poll_id: params[:poll_id])

  erb :"poll/show_poll"
end

post '/poll/create' do
  @user = User.find(session[:id])
  @poll = Poll.new(poll_name: params[:poll_title])

  if @poll.save
     @user.polls << @poll
     redirect to "/poll/#{@poll.id}/add_questions"
  else
    redirect to "/users_home/#{@user.id}"
  end

end

get "/poll/:poll_id/add_questions" do 
  poll_id = params[:poll_id]
  @poll = Poll.find(poll_id)
  erb :"poll/questions"

end