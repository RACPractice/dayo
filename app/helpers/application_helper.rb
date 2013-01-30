module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == params[:sort]) ? "current #{params[:direction]}" : nil
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def flash_class(level)
    case level
      when :notice then "info"
      when :error then "error"
      when :alert then "warning"
    end
  end
end
