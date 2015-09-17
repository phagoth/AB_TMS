class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]
  before_filter :authenticate_user!

  # GET /tasks
  # GET /tasks.json
  def index
    @incompleted_tasks = 
      case params[:incompleted_sort]
      when "title"
        current_user.tasks.incompleted.order('title')
      when "priority"
        current_user.tasks.incompleted.order('priority')
      else
        current_user.tasks.incompleted.order('id')
      end
      
    @completed_tasks = 
      case params[:completed_sort]
      when "title"
        current_user.tasks.completed.order('title')
      when "priority"
        current_user.tasks.completed.order('priority')
      else
        current_user.tasks.completed.order('id')
      end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    # task_params[due_date: Date.parse(task_params[:due_date])]
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    respond_to do |format|
      if @task.destroy
        format.html { redirect_to tasks_url }
        format.js   { }
        format.json { head :no_content }
      end
    end
  end

  def complete
    respond_to do |format|
      if @task.update_attribute(:is_completed, !@task.is_completed)
        format.html { redirect_to root_path }
        format.js   { }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      begin
        @task = current_user.tasks.find(params[:id])
      rescue Exception => e
        flash[:notice] = "ERROR"
        redirect_to root_path
        return
      end
      # @task = Task.by_user(current_user).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :priority, :due_date, :is_completed)
    end
end
