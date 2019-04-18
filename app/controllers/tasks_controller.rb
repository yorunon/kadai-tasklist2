class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "Taskが正常に保存されました"
      redirect_to @task
    else
      flash[:danger] = "保存に失敗しました"
      
      render :new
    end
  end

  def edit
    set_task
  end

  def update
    set_task
    
    if @task.update(task_params)
      flash[:success] = "タスクの編集に成功しました"
      redirect_to @task
    else
      flash[:danger] = "タスクの編集に失敗しました"
      render :edit
    end
  end

  def destroy
    set_task
    
    @task.destroy
    flash[:success] = "削除されました"
    redirect_to tasks_url
  end
  
  #StrongParameter
  def task_params
    params.require(:task).permit(:content, :title)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end

end
