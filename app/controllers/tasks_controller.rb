class TasksController < ApplicationController
  before_action :set_depends
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new

  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    @task.owner = current_user
    respond_to do |format|
      if @task.save
        format.html { redirect_to project_path(@project), notice: "Task was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      puts task_params
      puts @task.list_id
      puts "-----------------------------------"
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
        format.json { render json: {msg: "Task was successfully updated."}}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: {msg: "Error: bad parameters"}, status: 400}
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def task_params
      if params[:to_list]
        params.permit(:list_id)
      else
        params.require(:task).permit(:title, :description, :data_end, :hours, :position, :state, :project_id, :list_id)
      end  
    end

    def set_depends
      @project = Project.find(params[:project_id])
      @list = @project.lists.find(params[:list_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = @list.tasks.find(params[:id]) unless params[:to_list]
      @task = Task.find(params[:id]) if params[:to_list]
    end
end
