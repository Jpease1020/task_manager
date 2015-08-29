class TaskManagerApp < Sinatra::Base

  get '/' do # root (home page)
    erb :dashboard
  end

  get '/tasks' do # the index page - list of all tasks
    @tasks = TaskManager.all
    erb :index
  end

  get '/tasks/new' do # this is the form to make a new task
    erb :new
  end

  post '/tasks' do # where the new task form sends the user and redirects to all tasks
    TaskManager.create(params[:task])
    redirect '/tasks'
  end

  get '/tasks/:id' do |id| # this form come us when we click on a specific task
    @task = TaskManager.find(id.to_i)
    erb :show
  end

  get '/tasks/:id/edit' do |id| # this is the form to edit a task
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  put '/tasks/:id' do |id| # this is run when update is called
    TaskManager.update(id.to_i, Task.new(params[:task]))
    redirect "tasks/#{id}"
  end

  delete '/tasks/:id' do |id| # this is what happends when we delete a task, which renders us to '/tasks' after modifying the data deleting the task desired
    TaskManager.delete(id.to_i)
    redirect '/tasks'
  end

end
