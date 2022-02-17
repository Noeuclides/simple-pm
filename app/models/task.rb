# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  position    :integer
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer          not null
#  user_id     :integer
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#  index_tasks_on_user_id     (user_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#
class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :status, inclusion: { in: %w[not-started in-progress complete] }

  STATUS_OPTIONS = [
    ['Not started', 'not-started'],
    ['In progress', 'in-progress'],
    %w[Complete complete]
  ]

  after_create_commit :notify_recipient

  private

  def notify_recipient
    byebug
    ProjectNotification.with(project: self).deliver(user)
  end

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
