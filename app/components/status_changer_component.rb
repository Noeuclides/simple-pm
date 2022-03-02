# frozen_string_literal: true

class StatusChangerComponent < ViewComponent::Base
  attr_reader :task_id, :status

  def initialize(task_id:, status:)
    @task_id = task_id
    @status = status
  end

end
