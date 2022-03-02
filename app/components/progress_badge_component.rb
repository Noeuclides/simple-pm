# frozen_string_literal: true

class ProgressBadgeComponent < ViewComponent::Base
  attr_reader :status
  def initialize(status:)
    @status = status
  end

  def badge_color
    case status
    when :not_started
      'red'
    when :in_progress
      'yellow'
    when :complete
      'green'
    end
  end

end
