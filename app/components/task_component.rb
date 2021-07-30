# frozen_string_literal: true

class TaskComponent < ViewComponent::Base
  attr_reader :task

  def initialize(task:)
    @task = task
  end

  def id
    task.id
  end

  def name
    task.name
  end

  def description
    task.description
  end

  def status
    task.status
  end

  def project
    task.project
  end
end
