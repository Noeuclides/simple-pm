# frozen_string_literal: true

class StatusChangerComponent < ViewComponent::Base
  attr_reader :task_id, :status

  def initialize(task_id:, status:)
    @task_id = task_id
    @status = status
  end

  def status_options
    Task::STATUS_OPTIONS.map do |option|
      Struct.new(:readable, :slugged).new(*option)
    end
  end
end
