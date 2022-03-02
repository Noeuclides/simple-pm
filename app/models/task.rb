# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  position    :integer          default(0), not null
#  status      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#  index_tasks_on_user_id     (user_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#  user_id     (user_id => users.id)
#
class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  #==== Enums
  enum status: {
    not_started: 0,
    in_progress: 1,
    complete: 2
  }

  after_create_commit :notify_recipient

  validates :position, presence: true

  def notify_recipient
    byebug
    ProjectNotification.with(project: self).deliver(user)
  end
end
