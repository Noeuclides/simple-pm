# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#

class Project < ApplicationRecord
  has_many :tasks
  belongs_to :user

  after_create_commit :notify_recipient

  private

  def notify_recipient
    byebug
    ProjectNotification.with(project: self).deliver(user)
  end

  def status
    return 'not-started' if tasks.none?
    if tasks.all? { |task| task.complete? }
      'complete'
    elsif tasks.any? { |task| task.in_progress? || task.complete? }
      'in-progress'
    else
      'not-started'
    end
  end

  def percent_complete
    return 0 if tasks.none?
    (total_complete.to_f / total_tasks * 100).round
  end

  def total_complete
    tasks.select { |task| task.complete? }.count
  end

  def total_tasks
    tasks.count
  end
end
