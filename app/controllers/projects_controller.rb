class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    # {query: "Parking on central str.", lat: 35.876541. lng: -121.35464}
    @projects = ProjectsSearchQuery.new(search_params).call
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @projects.to_json}
    end
  end

  # GET /projects/1 or /projects/1.json
  def show
    @lists    = @project.lists.sort_by {|list| list.position}
    @sections = Section.all
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, noice: "Project was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :desctiption, :link_to_site, :link_to_manual, :state)
    end

    def search_params
      params.permit(:query, :lat, :lng, :page, :per_page)
    end
end
