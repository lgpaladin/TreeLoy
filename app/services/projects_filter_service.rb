class ProjectsFilterService
  def initializer query, coordinates
    @q = query
    @coord = coordinates
  end

  def call
    by_query
    by_position
  end

  def by_query
    if @query
      @result = Project.select("distinct(id)").where("title LIKE (%#{@query}%) OR description LIKE (% #{query}%)")
    else
      @result = Project.all
    end
  end

  def by_position
    @result.by_distance(origin: @coord)
  end
end