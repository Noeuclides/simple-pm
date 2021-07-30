# frozen_string_literal: true

class TaskComponent < ViewComponent::Base
  extend Forwardable
  delegate [:id, :name, :description, :status, :project] => :@task
  attr_reader :task

  def initialize(task:)
    @task = task
  end
end
