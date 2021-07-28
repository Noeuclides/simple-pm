class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: %w[not-started in-progress complete] }

  STATUS_OPTIONS = [
    ['Not started', 'not-started'],
    ['In progress', 'in-progress'],
    %w[Complete complete]
  ]

  def complete?
    status == 'complete'
  end

  def in_progress?
    status == 'in-progress'
  end

  def not_started?
    status == 'not-started'
  end
end
