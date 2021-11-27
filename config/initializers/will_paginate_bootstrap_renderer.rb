class BootstrapPaginateRenderer < WillPaginate::ActionView::LinkRenderer
  def container_attributes
    { class: 'pagination pagination-sm justify-content-center' }
  end

  def html_container(html)
    child = tag(:ul, html, container_attributes)
    tag(:nav, child)
  end

  def page_number(page)
    if page == current_page
      '<li class="page-item active">' + link(page, page, rel: rel_value(page),class: 'page-link') + '</li>'
    else
      '<li class="page-item">' + link(page, page, rel: rel_value(page),class: 'page-link') + '</li>'
    end
  end

  def previous_page
    num = @collection.current_page > 1 && @collection.current_page - 1
    previous_or_next_page(num, '<span aria-hidden="true">&laquo;</span>')
  end

  def next_page
    num = @collection.current_page < total_pages && @collection.current_page + 1
    previous_or_next_page(num, '<span aria-hidden="true">&raquo;</span>')
  end

  def previous_or_next_page(page, text)
    if page
      '<li class="page-item">' + link(text, page, class: 'page-link') + '</li>'
    else
      '<li class="page-item disabled">' + link(text, page, class: 'page-link') + '</li>'
    end
  end
end