module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = sort_direction || "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def subscribe_btn(tag)
    options = case @current_user.subscribed_to?(tag)
    when nil then {text: 'Подписаться', klass: 'subscribe'}
    else {text: 'Подписан', klass: 'subscribed'}
    end

     link_to options[:text], subscribe_tag_path(tag), method: :get, class: "btn sbscrn pull-right #{options[:klass]}"
  end
end
