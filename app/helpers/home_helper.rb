module HomeHelper
  def status_badge(status)
    status ||= 'unknown'
    badge_class = case status
    when 'active' then 'text-bg-success'
    when 'maintenance' then 'text-bg-info'
    when 'warning' then 'text-bg-warning'
    when 'error' then 'text-bg-danger'
    else
      'text-bg-secondary'
    end

    content_tag(:span, status.capitalize, class: "badge #{badge_class}")
  end
end
