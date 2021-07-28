module ApplicationHelper
  def badge_color(status)
    puts status
    case status
    when 'not-started'
      'red'
    when 'in-progress'
      'yellow'
    when 'complete'
      'green'
    end
  end
end
