class ProjectsSearchQuery
  def initialize
    @page = params[:page]
    @query = params[:query]
    @per_page = params[:per_page]
    @coordinates = [params[:lat], params[:lng]]
  end

  def call
    search
    paginate    
  end

  def search
    @projects = ProjectsFilterService.new(@query, @coordinates).call 
  end

  def paginate
    PaginateService.new(@projects, @page, per_page)
  end
end
