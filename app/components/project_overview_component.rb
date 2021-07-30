# frozen_string_literal: true

class ProjectOverviewComponent < ViewComponent::Base
  attr_reader :project
  with_collection_parameter :project

  def initialize(project:)
    @project = project
  end

  def completion_stats
    "#{display_percent_complete} #{display_breakdown}"
  end

  private
  def display_percent_complete
    "#{project.percent_complete} % complete"
  end

  def display_breakdown
    "(#{project.total_complete} / #{project.total_tasks} tasks)"
  end

end
