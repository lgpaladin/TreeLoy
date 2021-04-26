class PaginateService
  def initialize objects, page, per_page
    @objects = objects
    pagination_init page, per_page
  end

  def pagination_init page, per_page
    @per_page = per_page || 10
    @page = page || 1
    @offset = (@page - 1) * per_page
  end

  def call
    objects.offset(@offset).limit(@per_page)
  end
end
